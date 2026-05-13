Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31AC4CA28B;
	Wed, 13 May 2026 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687586; cv=none; b=gdGwd38psmCmvv0ORfELvchrUCxseNqMhW8SIduc+99ochBmSeqPcyB2FG+VeXjccXhejoBqin31Hdqbi5GGl6HrDdxEYqSv/+3GNyGraTEzKewpuWEKXU20ie9i3YHC6X7n5HMNs2f03ofCFVfSfSK5ZN2s3QH6uHmLLT9Ca+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687586; c=relaxed/simple;
	bh=ALo+tJYdDc9TwNGQ7CPM6EJBIHy0E0wDQmn1gDakx04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2wpaZYdti9mgNb/WFOh7naHmDY/Xp0BrU7ivk1gBLAPUNvnl0sCFkv8gYefgt4Q9YbDttZYfpzb6x18XrSqEF9hD3iKrREZb9l7nO7ah+CNSMfY8bLJUNFD90IT6ClNLhrZ6RrQQCp94M/R8YelHxSvhAbbPHQhbO7B0wtJGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T574sBNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T574sBNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2749AC19425;
	Wed, 13 May 2026 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687586;
	bh=ALo+tJYdDc9TwNGQ7CPM6EJBIHy0E0wDQmn1gDakx04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T574sBNklH3QxiNYetPulnqkliYN7enxh635MIIp8ZHX77ECCDjigxe8KyDhPGRgs
	 ZmYW8Z+2pUfSlDuXpcetruimTLOAgJMNsjLMpO5ChDLWcmNwF7TlH6yicdonD2zJsy
	 pxiJZXaxN6we8pH/iwNciHY3dNOF4iRldI1KxhQk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH 7/8] usb: typec: ucsi: displayport: NAK DP_CMD_CONFIGURE without a payload VDO
Date: Wed, 13 May 2026 17:52:54 +0200
Message-ID: <2026051351-vividly-flattered-eb3d@gregkh>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=ALo+tJYdDc9TwNGQ7CPM6EJBIHy0E0wDQmn1gDakx04=; b=owGbwMvMwCRo6H6F97bub03G02pJDFks84JPi6QufnBlwdaP9evuT95nLnJ6qrn0ErY3b3msM +WvLzx0qiOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmMuUfw3xHsxsGT5r1Ttjl rLT38GLwi+znmM8wT39rXZTcl1Ljg2yvKyRei8rx3t9lAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

ucsi_displayport_vdm() handles a DP_CMD_CONFIGURE by copying the first
payload VDO from data[], but unlike the equivalent handler in
altmodes/displayport.c it does not check that count covers a VDO beyond
the header.  A header-only Configure VDM (count == 1) would read one u32
past the caller's array.

In the normal UCSI path the caller controls count, so this is hardening
for non-standard delivery paths.  NAK and bail when no configuration VDO
is present, matching the generic DP altmode driver's existing guard.

Assisted-by: gkh_clanker_t1000
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/ucsi/displayport.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..67a0991a7b76 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -240,6 +240,10 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 			break;
 		case DP_CMD_CONFIGURE:
+			if (count < 2) {
+				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
+				break;
+			}
 			dp->data.conf = *data;
 			if (ucsi_displayport_configure(dp)) {
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
-- 
2.54.0

