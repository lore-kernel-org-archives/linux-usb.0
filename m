Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E884E77FC
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559001; cv=none; b=PA0RQN+7KzxbJqBXLY9m81Ia/V/UzAAUzWhWYkfdrkiM4S4zkmzalpm/VU47yDJivMQxU6SUtudjub4/hbnnJ0uykGJ/JFGFfVWSWmmZ0SGbLMM45sUhDStyKxLirSGcGu0/mx/ucONSYEYb88ukUM2r9hKBiuz5UAYPhtxa8io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559001; c=relaxed/simple;
	bh=bTQYOzECEXl/6peO5eFpe6JzQyctZlzlDhGreUiMYTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhkQu82LRfgvty0cir2DhJFVNenYIpgv3RuuMP8+mCXYae1PHQb0bCY+C+q3EN0I6I7VzYYSdF41M5EvFXVBYr934FlzEJDnHgfAQpIDDCNkwtlm1H/DRCRr3nbC37KMQYfjDHnko8bDXdqeOfJz5eaxTR94VzVk4hhG8Ae/W1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dyt26aN6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dyt26aN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791559000; x=1823095000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bTQYOzECEXl/6peO5eFpe6JzQyctZlzlDhGreUiMYTA=;
  b=Dyt26aN6drP7PEPkJhhIySy64Jz0VznRDp1FtNusywTrGvM9a/RrlbFe
   6Q3UCmPyq4Vkr1ilnzQZ+w8CT62R4uBP5s25oJHBL4RWuHChsw4jeS/eZ
   rVlYx4HpazY2QVwKUk9VgdK3lNTvWWyeXYbI9RpUAjbaCWkkoVQrO70VQ
   3s1ddJc5mL71JyC3iHilEQJHDzBDSoelqxq4wRgegX+xYKPrRBFdvwiWj
   oGPaNRLmkr1+NFhb+zqE9cszAtJkF6dtPsCT762Nwy0vyLW5P9DxdS8+T
   bUSrEKpyWxUAmg2D6rOwu1+7eo2Rfwpd17QEi9FYdcwOS+epsWL2KsJ/v
   A==;
X-CSE-ConnectionGUID: BdCro1LSTC+5gnaDIi/bkQ==
X-CSE-MsgGUID: jgxlMBY+RFCaYIk6RImJ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351674"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:39 -0700
X-CSE-ConnectionGUID: 8CboBrGUQKy3Z4VYoYMs/A==
X-CSE-MsgGUID: lv6kaXiATC2TB+tKabMyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650040"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:38 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Hongyu Xie <xiehongyu1@kylinos.cn>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 04/11] xhci: check device notification type before forwarding wake event
Date: Fri,  9 Oct 2026 18:16:17 +0300
Message-ID: <20261009151624.618967-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

The xHCI driver programs the Device Notification Control register to
only enable the Function Wake device notification (N1), so any Device
Notification Event TRB received is expected to be a function wake
notification. handle_device_notification() does however not check the
Notification Type field of the event (xHCI 1.2 section 6.4.2.7, DW0
bits 7:4), and forwards every device notification event as a function
wake.

A host controller that delivers an unexpected notification type (e.g.
due to broken firmware or emulation) would trigger a spurious wake
notification on the parent hub.

Parse the notification type and drop events other than Function Wake
with a warning, mirroring the slot ID validation in the same function.

DEV_NOTE_FWAKE is the DNCTRL register bit for notification type 1
(N1), while the event TRB carries the notification type value itself,
so add a separate DEV_NOTE_TYPE_FWAKE constant for the comparison.

[mn:] reduce warning to a debug message

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 9 +++++++++
 drivers/usb/host/xhci.h      | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index cbce9f8f07fa..7f480db2983e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1954,6 +1954,7 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 		union xhci_trb *event)
 {
 	u32 slot_id;
+	u32 type;
 	struct usb_device *udev;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->generic.field[3]));
@@ -1963,6 +1964,14 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 		return;
 	}
 
+	/* xHCI 1.2 6.4.2.7: Notification Type is DW0 bits 7:4 */
+	type = TRB_TO_DEV_NOTE_TYPE(le32_to_cpu(event->generic.field[0]));
+	if (type != DEV_NOTE_TYPE_FWAKE) {
+		xhci_dbg(xhci, "Unsupported device notification type %u for slot ID %u\n",
+				type, slot_id);
+		return;
+	}
+
 	xhci_dbg(xhci, "Device Wake Notification event for slot ID %u\n",
 			slot_id);
 	udev = xhci->devs[slot_id]->udev;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..ec4bfeb4887c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -187,6 +187,8 @@ struct xhci_op_regs {
  * SW does need to pay attention to function wake notifications.
  */
 #define	DEV_NOTE_FWAKE		BIT(1)
+/* Notification Type value carried by a Device Notification Event TRB (6.4.2.7) */
+#define	DEV_NOTE_TYPE_FWAKE	1
 
 /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
 /* bit 0 - Cycle bit indicates the ownership of the command ring */
@@ -996,6 +998,9 @@ enum xhci_ep_reset_type {
 #define TRB_TO_PACKET_TYPE(p)		((p) & 0x1f)
 #define TRB_TO_ROOTHUB_PORT(p)		(((p) & (0xff << 24)) >> 24)
 
+/* Device Notification Event TRB fields, 6.4.2.7 */
+#define TRB_TO_DEV_NOTE_TYPE(p)		(((p) & (0xf << 4)) >> 4)
+
 enum xhci_setup_dev {
 	SETUP_CONTEXT_ONLY,
 	SETUP_CONTEXT_ADDRESS,
-- 
2.43.0

