Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB002D322E;
	Sun, 26 Jul 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785078690; cv=none; b=LRg0HfM45bK62hwi9szW6+44WpxA5UxMlPdk66/jIJf5My7o7I9LVi5mMivocEF8GiudkgVT0tG+BP1TiLi/MbUZBHsouabRl0xt79+wGDRDpAgAe43Te+ckhl4XkCY7+h8G+sRVi203tWfU0ti6Xpf5HqKqOdD5U0XDUfmLRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785078690; c=relaxed/simple;
	bh=EODZ5jx6iSOphHrb9NwiLRjiPh9FysBJbnZ2jxG4fA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r09AsaS93oa+4jBWJeGUQshWWRZ9FV7rwbf6E/GRRsjPup5QpIPX9U9XtY4KB0FbbHdeCKV4S7l1UcHQgt0mZAPmZc6gbftULV5Co92CAz17MWCcyMrXOcFtXsY+Kfa52wo94vHfQAWNMppJEL2gmc/bR4f1GWOUfStAzwr0EHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=HWnwpAz/; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="HWnwpAz/"
Received: from ShouCheng-Lab.localdomain (unknown [112.53.147.231])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4799c674b;
	Sun, 26 Jul 2026 23:11:16 +0800 (GMT+08:00)
From: Jiancheng Huang <jchuang@seu.edu.cn>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] USB: storage: sierra_ms: reject short SWoC responses
Date: Sun, 26 Jul 2026 23:11:03 +0800
Message-ID: <20260726151107.4148234-1-jchuang@seu.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f9efafb9b03a2kunme5505282bcd54
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHUhLVkhNTExNGklDH01PTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTkhVSk9MVUlISllXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=HWnwpAz/gQL0KxaUYqJarZOA42e1PWtYC9cdiSTOCcUA2Y4SI+3oTvY0dOFn7zWFOl9S8sdTnnb3KgkTlwtEv5BaSiQgZywvMMgl11trgQqmuet8eJdyyDNgHDnp6wl9aHpM9gtfZwzsnxN/3J61Mz1qz3FPRqGSSieFZKCJyl0=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=DaYSD1Aj1mGVkxvoazbm96EaRFQ5QkMNoulP6wjnl/A=;
	h=date:mime-version:subject:message-id:from;

sierra_get_swoc_info() converts fields in the response after
usb_control_msg() returns, but it does not require the complete swoc_info
structure to have been transferred. A short response can leave fields
in the kmalloc() buffer uninitialized before truinst_show() formats them.

Use usb_control_msg_send() and usb_control_msg_recv() for the vendor
requests. The receive helper rejects short responses with -EREMOTEIO,
and only complete responses are converted before their fields are used.

Fixes: 32fe5e393455 ("USB Storage Sierra: TRU-Install feature update")
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Assisted-by: Codex:gpt-5.6-luna
Signed-off-by: Jiancheng Huang <jchuang@seu.edu.cn>
---
Changes in v2:
- Replace the raw usb_control_msg() calls with usb_control_msg_send() and
  usb_control_msg_recv(), as suggested by Greg Kroah-Hartman.
- Add the public USB and kernel mailing lists omitted from v1.
- Clarify that testing used a synthetic short-response harness and no
  physical or emulated Sierra device.

Testing:
- Tested on v7.2-rc4 with a synthetic KUnit/KMSAN short-response harness.
- The original implementation triggered a KMSAN uninitialized-value report.
- With this patch, usb_control_msg_recv() returned -EREMOTEIO and the test
  completed without a KMSAN report.

 drivers/usb/storage/sierra_ms.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
index c5e3eeeb2..fac38687a 100644
--- a/drivers/usb/storage/sierra_ms.c
+++ b/drivers/usb/storage/sierra_ms.c
@@ -47,17 +47,16 @@ static bool containsFullLinuxPackage(struct swoc_info *swocInfo)
 
 static int sierra_set_ms_mode(struct usb_device *udev, __u16 eSWocMode)
 {
-	int result;
 	dev_dbg(&udev->dev, "SWIMS: %s", "DEVICE MODE SWITCH\n");
-	result = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+	return usb_control_msg_send(udev, 0,
 			SWIMS_USB_REQUEST_SetSwocMode,	/* __u8 request      */
 			USB_TYPE_VENDOR | USB_DIR_OUT,	/* __u8 request type */
 			eSWocMode,			/* __u16 value       */
 			0x0000,				/* __u16 index       */
 			NULL,				/* void *data        */
 			0,				/* __u16 size 	     */
-			USB_CTRL_SET_TIMEOUT);		/* int timeout       */
-	return result;
+			USB_CTRL_SET_TIMEOUT,		/* int timeout       */
+			GFP_KERNEL);
 }
 
 
@@ -68,17 +67,20 @@ static int sierra_get_swoc_info(struct usb_device *udev,
 
 	dev_dbg(&udev->dev, "SWIMS: Attempting to get TRU-Install info\n");
 
-	result = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
+	result = usb_control_msg_recv(udev, 0,
 			SWIMS_USB_REQUEST_GetSwocInfo,	/* __u8 request      */
 			USB_TYPE_VENDOR | USB_DIR_IN,	/* __u8 request type */
 			0,				/* __u16 value       */
 			0,				/* __u16 index       */
-			(void *) swocInfo,		/* void *data        */
+			swocInfo,			/* void *data        */
 			sizeof(struct swoc_info),	/* __u16 size 	     */
-			USB_CTRL_SET_TIMEOUT);		/* int timeout 	     */
+			USB_CTRL_SET_TIMEOUT,		/* int timeout       */
+			GFP_KERNEL);
 
-	swocInfo->LinuxSKU = le16_to_cpu(swocInfo->LinuxSKU);
-	swocInfo->LinuxVer = le16_to_cpu(swocInfo->LinuxVer);
+	if (!result) {
+		swocInfo->LinuxSKU = le16_to_cpu(swocInfo->LinuxSKU);
+		swocInfo->LinuxVer = le16_to_cpu(swocInfo->LinuxVer);
+	}
 	return result;
 }
 
-- 
2.43.0
