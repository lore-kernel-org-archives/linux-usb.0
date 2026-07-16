Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2011D435F
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219172; cv=none; b=JeRwM7AxfYhIrHQmmqqesna+CqJyHBUGpBv0YToHuOZDZDCOEujCjkHxrpCGczJJPwq1xADG70Z90f8rtU9vhbMnUtjAXeA7mx1bpu4xvdyA+nH2G45nbbCwVMblqTneqIcQR+MOxiYgvkRE/eDiBZEX9d1M5pUsNz9YL1twy6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219172; c=relaxed/simple;
	bh=6UjOpLoiTqjxpbdQbd2A57wfXPBDMq4W0FIuUl8XBgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ubcgJyOwT4ZwE5rWhqghl09X13ba4Xv5qQrfhjzqdpMbnkK70nJ79QG7CcMLOZ1YzaZpch62SF7s0VsS0hgr3aIRgSgWtVCK0bwKjFfF7JAp74Mu8H8NPXFBqnQCH+5EcfQZpp3rEWRaC+mMduNpwlnxHJcNk7qiLWgEAaVPDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=G9T5ZRMj; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="G9T5ZRMj"
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 6FA4558394E
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 14:49:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D24B3ECBD;
	Thu, 16 Jul 2026 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1784213390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1e5MyV+BDvAi+IpMnHGOXZFyKYnOTR1TcI7u3G1HFks=;
	b=G9T5ZRMj9nolHu5eeh+FjgTEUzkFnqOLVwGGXlEs28zVuzCsMPsbqB9P0647ACBga58LTx
	EwlnjzkGSANYfnN6X5da5C4cIG1+TdpNdnT7b5zYs0owOcP27YWCfFZSsp8gZ5sJIuWi82
	Pvd4mBO2mH/rxU0BxkQC3N+zv6zZGVak5osLaG+hnMNgfthu4gL6JvB+Nl7I4d+CGshdrq
	EsvNf5PS5Le56djpYBVaYt08LFtmZtfBjoLQt9MZO6IVPMZquThXIZaX09NuP2sPvHVvSn
	vndoXy64ee/yHsmfWT0V3+dJIkSQojCQE7WpzKRLhzvrpzLFCRXoBqzAkeyxHw==
From: =?UTF-8?q?Arthur=20Cr=C3=A9pin=20Leblond?= <arthur@marmottus.net>
To: linux-usb@vger.kernel.org
Cc: =?utf-8?q?Arthur=20Cr=C3=A9pin=20Leblond?= <arthur@marmottus.net>,
	Ben Hoff <hoff.benjamin.k@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: f_hid: convert polling interval from ms to bInterval units
Date: Thu, 16 Jul 2026 16:49:21 +0200
Message-ID: <20260716144921.1120265-1-arthur@marmottus.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arthur@marmottus.net
X-GND-Cause: dmFkZTEsTcrkYX4hDffVcxPcuRleDdf/8Tbwur6u0Og01YG8JbMHTDqyWZlgb9sj92BAxu+qYxApENjJG7Ffo1VlEqBtyg9KCG+ePq4divIrtb5EMsVvU5lKUTYSx8+rAByUY8weLhfsK2FIe7jw5xj2qirBLB7R++1pTJG+ivuKGxs/tg0UIQNWVyC5OHlXo8CkrXiVmgHHf/r43XM0paqXTTvAAiXw/N/r+qG0nHOYu15ohLOS+v+v4MVt7XvMypRrwPjZwDKnMM0hMFreEuok2wBnzzihylbEKPFs8ERJ259SW69yufb/WzHQ9CEbFXd1LgWG6vT/3z87ydXnAl4+QEtVL0ZrFRwZAHvmVim98gTYlng0WFShF6qiMMyIPb/jp+2LF7uLavwaPkD/7T/HS3ofeYX9BfHvsqEHmsaixt4Zag1BTUADxHbIW4kydRP9ETTd0U8no77vdsLMdDJtm4WAOOqwrwf8mDUGvR6B40IrV7jS83hO3/RkDW56B1EJr1PRjUUeSH8CkFeymhY6v7gtyoWAUoyEaSKM/c/zfN4TKk4MLS8CO/4j88oQsfFbwZMpQX2fgy1yxKPhvGL0Wr4vqbqO93gDrcyE9712DihU3tWzB732NtMESxCLY4a+StXnK/PzX/R23t9yNbBaEH2DPeqa3BZpJDTqbBulYjdqAw
X-GND-State: clean
X-GND-Score: -100

The HID polling interval is different depending on the USB speed.

- Full speed: the units are milliseconds (1-255)
- High/Super speed: the units are micro-frames of 0.125ms

Exposing directly the bInterval means that the user needs to know
which speed is currently in use and has to convert it accordingly
themselves.

The solution is to expose the interval in units of milliseconds and
do the conversion in the driver.

Cc: Ben Hoff <hoff.benjamin.k@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Arthur Crépin Leblond <arthur@marmottus.net>
---
 Documentation/ABI/testing/configfs-usb-gadget-hid | 10 ++++++++++
 drivers/usb/gadget/function/f_hid.c               |  8 ++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-hid b/Documentation/ABI/testing/configfs-usb-gadget-hid
index 748705c4cb58..006d479b7428 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-hid
+++ b/Documentation/ABI/testing/configfs-usb-gadget-hid
@@ -11,3 +11,13 @@ Description:
 		report_length	HID report length
 		subclass	HID device subclass to use
 		=============	============================================
+
+What:		/config/usb-gadget/gadget/functions/hid.name/interval
+Date:		Jul 2026
+KernelVersion:	7.2
+Description:
+		The polling interval for the HID endpoint(s), expressed in
+		milliseconds in the range 1-255.
+
+		The value is speed-independent: the driver converts it to the
+		appropriate bInterval.
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..49548a96c1e8 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1211,8 +1211,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 		hidg_ss_in_ep_desc.bInterval = 4;
 	} else {
 		hidg_fs_in_ep_desc.bInterval = hidg->interval;
-		hidg_hs_in_ep_desc.bInterval = hidg->interval;
-		hidg_ss_in_ep_desc.bInterval = hidg->interval;
+		hidg_hs_in_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);
+		hidg_ss_in_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);
 	}
 
 	hidg_ss_out_comp_desc.wBytesPerInterval =
@@ -1245,8 +1245,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 			hidg_ss_out_ep_desc.bInterval = 4;
 		} else {
 			hidg_fs_out_ep_desc.bInterval = hidg->interval;
-			hidg_hs_out_ep_desc.bInterval = hidg->interval;
-			hidg_ss_out_ep_desc.bInterval = hidg->interval;
+			hidg_hs_out_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);
+			hidg_ss_out_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);
 		}
 		status = usb_assign_descriptors(f,
 			    hidg_fs_descriptors_intout,
-- 
2.55.0

