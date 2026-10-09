Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C143B6EC
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539941; cv=none; b=rOcmgLkTJXkNsEp6cS+nUp1kcJK8ArjgOWEnFPnF7CxVRe0QWPrnZAX7e80JscNO7lK8klXDKnl8sJmrXS/r9h7qwGwwPj2l8maHPU+BV2AdtM7omzMs77yNU9JjnqaIUa1DzxMO9Xw5szG0xkdFMZVSpV9TrGbADkW+H1TZT/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539941; c=relaxed/simple;
	bh=F7zfuTsKbMy6W192qFbg41yd0yNHaW6e7HYXN77FfXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTL1JXfg6erxJg5OqbCQI+mtFcsBHEhGVN5LyW2cTzVaddk6jXpkgDgqin5DPGawhfQmTU80dBzYzNEc8ENicG4dHjajKnIf2ThYr7AfmBR3qDzAuvudrAREcd/EeYCAqAMFrVhUAnsfvGCqAN5ZuYL+9ZOiz+j9TbwSEx5wKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMsycl3Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMsycl3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539940; x=1823075940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F7zfuTsKbMy6W192qFbg41yd0yNHaW6e7HYXN77FfXE=;
  b=YMsycl3QSp0AJsimYsOgZkp9FPfJc+AzqSlun6m3qb/wrf4pL5yNUCCL
   ozA616KlQvAKw1oX17uk12P7PXJp3PH6bOAcNarqCyE9M0WSIDSD+9ywB
   Et3YCNwEZCfaVedpFnwfLhsR/vdj0svjZ/ysaXWyytzgDyZeax4GiA6XV
   nGefPuTQVIETrUIBjEAaCjrnmTJneNoflDrfPWoIaSSpWAP4F7jEh+79E
   x7pbmaZ3D+MFc7jLoNn0iCIjMVJT+87w8UkDt76J7BsGsOrNIskRx1bvl
   b3iOHzp8Nu3OJ9eqhhhRrYQEFvLXiFA+SKCc1j4fQOSZJ9+kJkBc6QiO9
   g==;
X-CSE-ConnectionGUID: 0Lq3/FOrRz6O8izIQUZ0Vg==
X-CSE-MsgGUID: +FoN4/4zSV+LU6u8ZV0fTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224109"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:00 -0700
X-CSE-ConnectionGUID: 8yYWa32HTDSFgkSf0VvpWw==
X-CSE-MsgGUID: 2MTRLxuOQE+tFr0EQ8jP5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613352"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:58 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Hongyu Xie <xiehongyu1@kylinos.cn>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 05/14] xhci: check device notification type before forwarding wake event
Date: Fri,  9 Oct 2026 12:58:25 +0300
Message-ID: <20261009095834.561578-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>
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

