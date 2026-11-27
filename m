Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781892;
	b=fwjn7lCvQBsgWLvmwltHD3gYZ8wrUGxM31wJ/Ifm76AQ5JaPwJHDoYWwffI11t5zp+k1
	 9QTaHsR5hb6M6OqkcP/5BBMArqqdP4tCOUIhxAfzzWQNgDszVrRuUfmGHmTGsIiiwc7xX
	 VXRPtr2MTY3zj/k3leftS7elcN01j9JnOS+pUjBNse1dJCcNR51jIt6eUO25QnEdB4LaV
	 Gf+UNN432OovXrb5+P9ZkW3vrrMJKM/fBYPpM6P2ott01lHq5jZXphiGKFlMtlx8CehbU
	 ZEGIiIxw0z29q2P+sJwGmkT8hlZ8hZmx7XaXntxsnyp9VMXrm9Cz8ZYTyKJMWLlQlIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781892;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zTv9rT/9RmRK+l0n/8xKntvL0MlimY+3T17GQ1jB/JQ=;
	b=5NOCYtU9jVEHwx/NHGssx2w1jtc6qGwVx6ciqBDhkahYpXuuu4QsOhCfSIrUZyMUgZXW
	 4fgPFBVi51y+xhptMSJjHdtEmLvzcPDHA8smC7Gz9eie3fDMzzu5FyFeA4UvILOvL9I3g
	 TJodFOZFQ6Ut/xRY6Io1GuRsv7px01+MDs0w6mWW5m+iNydm2PdLjfzUYkYl0swNsqaUN
	 JbAWsQFI8kKEuoe9gNz6FMmwZEoYtUu/d8RwA6Q2jPzg3S6zRoFCjTggEG/YdhtueCUBY
	 2l1hweP+3gFeCILau21DGxWdUbQqJxF3Uco3+BMW9qaHwDV14fLjkCDZTNxjRxDXWeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRmG4u87;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE46606A681
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 12:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE46606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRmG4u87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795781892; x=1827317892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DUeCXVPCSGPf7VzbTuK/uFWLLKkXfOjWLH5VrNhJBvs=;
  b=NRmG4u87YAaGZvXnV2bbGYnNOVH700+ykyfRzq6a69p8iL4mSjTOzBlZ
   JUoUnm8OMoT2u5m44iy0fkS8DCpYPh7GavfJ+SaHF2h0VM9mjK/JNfVwy
   PDBlSiRPgDEkfQ8XULvO+z6dnKsuSvOGs7a2mJWLMaJfidBL1vG9NIaSG
   3Yr8AXzFF76enJrwDBiBC63Irvhki1Jd/7D9bI409Hnf75PUTzvPyszkP
   B57iwOPAv1Dlrl8OKMx8yBtvlXyI00OuE/YxUg0pxQAXouPEKZhSeEVvy
   ZDO7+5FCHvjbwFXwH7ZioJ2VIBCIHS/fyhfngW58zJm0zbpzdzy3f+SCS
   g==;
X-CSE-ConnectionGUID: OdamRUqzTkGhxD7En32EhA==
X-CSE-MsgGUID: Bvhj3wwARkCX9tZJfuiXnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4577843"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4577843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:11 -0800
X-CSE-ConnectionGUID: B+ZpmUtURcKdWWwbpbZYaQ==
X-CSE-MsgGUID: CXR4nsl7T5yQyuB5D91eIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12270667"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.45])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:10 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/10] xhci: check for halted host before accessing virt devices in xhci_check_args()
Date: Fri, 27 Nov 2026 14:17:47 +0200
Message-ID: <20261127121755.281420-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
References: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci_resume() may halt and reset xHC. It then frees all virt devices
without holding xhci->lock, before the host is reinitialized and
started again.

xhci_check_args() reads xhci->devs[udev->slot_id], and only checks
for a halted host after it has dereferenced the virt device.

If an URB is submitted while the virt devices are freed, this can lead
to a NULL pointer dereference, or a use-after-free of a virt device
whose rings and contexts were already freed.

This is possible during runtime resume. Userspace can allow a device
opened via usbfs to runtime suspend with USBDEVFS_ALLOW_SUSPEND, and
still submit URBs to it.

Check for a halted host first in xhci_check_args(). XHCI_STATE_HALTED is
set under xhci->lock by xhci_halt() before the virt devices are freed,
and cleared only when xhci_start() starts the host again.

Fixes: 203a86613fb3 ("xhci: Avoid NULL pointer deref when host dies.")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6e0729a07e5f..b3df40f22d55 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1514,6 +1514,14 @@ static int xhci_check_args(struct usb_hcd *hcd, struct usb_device *udev,
 	}
 
 	xhci = hcd_to_xhci(hcd);
+
+	/*
+	 * Check halted before touching virt devices. Resume halts the host and
+	 * frees all virt devices without xhci->lock if it needs to be reset.
+	 */
+	if (xhci->xhc_state & XHCI_STATE_HALTED)
+		return -ENODEV;
+
 	if (check_virt_dev) {
 		if (!udev->slot_id || !xhci->devs[udev->slot_id]) {
 			xhci_dbg(xhci, "xHCI %s called with unaddressed device\n",
@@ -1529,9 +1537,6 @@ static int xhci_check_args(struct usb_hcd *hcd, struct usb_device *udev,
 		}
 	}
 
-	if (xhci->xhc_state & XHCI_STATE_HALTED)
-		return -ENODEV;
-
 	return 1;
 }
 
@@ -4132,7 +4137,14 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	if (ret <= 0 && ret != -ENODEV)
 		return;
 
+	/* Halted host returns -ENODEV before virt device is checked */
+	if (!udev->slot_id || !xhci->devs[udev->slot_id])
+		return;
+
 	virt_dev = xhci->devs[udev->slot_id];
+	if (virt_dev->udev != udev)
+		return;
+
 	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->out_ctx);
 	trace_xhci_free_dev(slot_ctx);
 
-- 
2.43.0

