Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733E346E57;
	Mon, 20 Apr 2026 16:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701708; cv=none; b=sJ1CStyGitucULMidArjKaGaoqx09m+dHrBHi88objySJiyQMSlmtEnMv8Ua9DWNsGectwnyL8wSZIbbWL9KvbaQ7p3DnJ9JlqVKMzTmChC4uubNxuiCMa9U+Igt2aC8KrcgGnE/NLOcWoCa72oLUiGzcjF1eIwoKpdFfTTukq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701708; c=relaxed/simple;
	bh=rfStXcjDmlJ+iCB1csg/EHrN0X3+o3/QbLv/IAnXTsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtWJtcTlgoxX/iTb8QcSgI1ViFtT0q8Y1IsszyDPxjVANUxWNqpEtA8wN9WPVseQAGA/UDMbBnhbs6kkgD7ib97TNfPRBsjxQuwPsc/DfMT/dAueNKw/g5FNBg1yUwBfNf5Ntjv/au3DyQKKqzCbD5F6ne7M2/Q5XgPEqSB8Urk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h9VSXB8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h9VSXB8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184A1C2BCB4;
	Mon, 20 Apr 2026 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776701708;
	bh=rfStXcjDmlJ+iCB1csg/EHrN0X3+o3/QbLv/IAnXTsw=;
	h=From:To:Cc:Subject:Date:From;
	b=h9VSXB8tq+46W2DahthN8op4IcMrHdNIQO+aHZRhJG63LLnOkJWn1V39yq37fkgy6
	 MSU0w6zTWEbYr0jMKN1chZbI7DPV40+l6oLetDoXzkYd44Ge9WtZdkdnyUQb2+ME/l
	 brbn6pQy4LT2CM5fUipP+6z/8F4A2eyFEI2ARmOM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pete Zaitcev <zaitcev@redhat.com>,
	stable <stable@kernel.org>
Subject: [PATCH 1/2] usb: usblp: fix heap leak in IEEE 1284 device ID via short response
Date: Mon, 20 Apr 2026 18:11:03 +0200
Message-ID: <2026042002-unicorn-greedily-3c63@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=rfStXcjDmlJ+iCB1csg/EHrN0X3+o3/QbLv/IAnXTsw=; b=kA0DAAIRMUfUDdst+ykByyZiAGnmUBagRSG0mguGDMVaaMVBt9eFYCdtY0cT39h/+/+daAD3Q IhdBAARAgAdFiEE9LYMxb94wiFKMT3LMUfUDdst+ykFAmnmUBYACgkQMUfUDdst+ynl6wCdHluS dzg79R8xFfUw2rGXSHsUCAYAniwIHIlNumqH1u0pketc3v38z3Ae
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

usblp_ctrl_msg() collapses the usb_control_msg() return value to
0/-errno, discarding the actual number of bytes transferred.  A broken
printer can complete the GET_DEVICE_ID control transfer short and the
driver has no way to know.

usblp_cache_device_id_string() reads the 2-byte big-endian length prefix
from the response and trusts it (clamped only to the buffer bounds).
The buffer is kmalloc(1024) at probe time. A device that sends exactly
two bytes (e.g. 0x03 0xFF, claiming a 1023-byte ID) leaves
device_id_string[2..1022] holding stale kmalloc heap.

That stale data is then exposed:
  - via the ieee1284_id sysfs attribute (sprintf("%s", buf+2), truncated
    at the first NUL in the stale heap), and
  - via the IOCNR_GET_DEVICE_ID ioctl, which copy_to_user()s the full
    claimed length regardless of NULs, up to 1021 bytes of uninitialized
    heap, with the leak size chosen by the device.

Fix this up by just zapping the buffer with zeros before each request
sent to the device.

Cc: Pete Zaitcev <zaitcev@redhat.com>
Assisted-by: gkh_clanker_t1000
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/class/usblp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index 669b9e6879bf..e9b848622a3a 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1377,6 +1377,7 @@ static int usblp_cache_device_id_string(struct usblp *usblp)
 {
 	int err, length;
 
+	memset(usblp->device_id_string, 0, USBLP_DEVICE_ID_SIZE);
 	err = usblp_get_id(usblp, 0, usblp->device_id_string, USBLP_DEVICE_ID_SIZE - 1);
 	if (err < 0) {
 		dev_dbg(&usblp->intf->dev,
-- 
2.53.0

