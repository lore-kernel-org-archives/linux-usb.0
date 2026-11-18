Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006293;
	b=4tQATPSt3R29jp08AeXMxJ99T/P5wk73VTL5S0MMS7Lr+IRNsF50oim7FJvsniRWFP1d
	 xMyRBQSIbj8BR3raoALUWKzGv1N2o8NHCe/Sj49z4i+Yb3wTeta5ptme6EVrlMg3VYpE+
	 T1ghzsjRbpZpthka2hUB38FSMMFNBN+kILBhg5nHeJvbsqYur1wggE9UAWdR5ZjtAwuFB
	 TJuNEJkfd/+A+9IBO4PteUE2Xm7Lp5EkEWEWTtV1FqeHDGV0/lNfY82T0557u2QoVMPrV
	 EeooxBsfuG7aObSszafopd6YSm5InZq4fNCocugasqtGb6i2ue24WusGg2eiER1yaHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006293;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Chjr7Y61R6R4YQmYwOIdR/uUK81KkJqciFnColpAohU=;
	b=nf50wuLLge0mH2MWAGQXWxsmRLTGPGG6ARdgKGFP+g4QnSDS3W+7GvgnblFm1FYD0vy3
	 aM6yWuiZ5s9tiXp7BKOps6Mq2dou0D0DHAR5bFsdYBGwHukhPsACBVcl/W+ByjWiVsoCW
	 epBt1I3tsFdsxFzP5BtGWdjq/FYzEkf/hbRxnNA3OuKlhKhGTIXaFpgzENqbJ9k+cxvu6
	 ZHPcKe0XDbESB5CKqnmeHEH7eZ+lF0A/uoIJqfCXKe2lZmMDTHBRvPdvpsUUgm4BDmBqf
	 P0dk4UIzq2Fv+BUdkx5p63KuvIEvnbRXwyk3pXtd9btnUbJ0uSomgvgDuaErjVL1b0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RscHRIHk;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38782606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38782606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RscHRIHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795006294; x=1826542294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hp9ObgGBjGTcvS35DkOfe/XeJl1EJiihPBIOc963Rhk=;
  b=RscHRIHk0ZGhtSaJj4BNUcH9miqN5U5wBlmJA1HiAgUeAYcZZ7LL3hrL
   pgiiPRi1F4QWop3YI2apPc1dBPX8lE8NOgXdbmfZI5xwA8fSTmRVIxlKP
   Q+58jldZvgMWUvXKT16jNh1OG6Mzxq5sNg6s9Eff4iVxc9nKaUlrgqKhc
   7oiflvJm6QEOIWmBXZglcZrgaC6xtYVpdD3KEms78c2o9eAq9DlAoOcwP
   U627K9G+m4zz67688cyaM58cG58lWGHo+ZGS5IEhlHtS9PtPmLaJ/vxZe
   fXeZmTWoVDedq7BjyiYlfAN7QPQSSV5vj47x6b8kYrD/y+fLdJzJ6em6q
   A==;
X-CSE-ConnectionGUID: eGkETH/1Qs+RyjTtgY1WCQ==
X-CSE-MsgGUID: 66MjcldPQ0eclGKHtKOhJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3709101"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3709101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:51:26 -0800
X-CSE-ConnectionGUID: c1lAdrL6SK6O6mDkUFZqvA==
X-CSE-MsgGUID: UFcejBZaSEe4z299XMRXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10476214"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.233])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:51:24 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: quic_wcheng@quicinc.com,
	hulianqin@vivo.com,
	selvarasu.g@samsung.com
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 1/2] xhci: sideband: avoid use-after-free of stale virt device pointer
Date: Wed, 18 Nov 2026 14:51:08 +0200
Message-ID: <20261118125109.1429538-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118125109.1429538-1-mathias.nyman@linux.intel.com>
References: <20261118125109.1429538-1-mathias.nyman@linux.intel.com>
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

The sideband structure caches vdev, an xhci_virt_device pointer that
the xhci driver may free and reallocate while the sideband is still
registered, leaving the sideband with a dangling sb->vdev pointer.

This can happen during resume, either when the xhci driver detects xHC
power loss and resets the xHC, freeing all virt devices without
informing class drivers, or during reset-resume when usb core
re-enumerates the device and xhci frees and allocates a new virt device.

Store the usb_device pointer (udev) instead. It stays valid across
reset-resume and xHC reset.
Look up the current virt device and ensure it still points to this
sideband before using and dereferencing it in sideband API calls.

Make sure xhci_sideband_unregister() works properly with an invalid
vdev. Don't dereference it, or ask the xHC to stop non-existing
endpoints, but make sure the sideband is properly freed.
Fail other relevant sideband API calls that would access invalid
vdev with -ENODEV.

This solution isn't airtight. It's a huge improvement over the current
situation, but there is still a window between verifying vdev and
actually dereferencing it in many sideband API calls.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-sideband.c  | 47 ++++++++++++++++++++-----------
 include/linux/usb/xhci-sideband.h |  4 +--
 2 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..ad4849903df3 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -75,6 +75,22 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	return NULL;
 }
 
+/* Return the current vdev of sb->udev, or NULL if it was freed or reallocated */
+static struct xhci_virt_device *
+sideband_to_vdev(struct xhci_sideband *sb)
+{
+	struct xhci_virt_device *vdev;
+
+	if (!sb->udev || !sb->udev->slot_id)
+		return NULL;
+
+	vdev = sb->xhci->devs[sb->udev->slot_id];
+	if (vdev && vdev->sideband == sb)
+		return vdev;
+
+	return NULL;
+}
+
 /* Caller must hold sb->mutex */
 static void
 __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
@@ -146,16 +162,18 @@ int
 xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 			   struct usb_host_endpoint *host_ep)
 {
+	struct xhci_virt_device *vdev;
 	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
 
 	guard(mutex)(&sb->mutex);
 
-	if (!sb->vdev)
+	vdev = sideband_to_vdev(sb);
+	if (!vdev)
 		return -ENODEV;
 
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
-	ep = &sb->vdev->eps[ep_index];
+	ep = &vdev->eps[ep_index];
 
 	if (ep->ep_state & EP_HAS_STREAMS)
 		return -EINVAL;
@@ -202,9 +220,10 @@ xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = sb->eps[ep_index];
 
-	if (!ep || !ep->sideband || ep->sideband != sb)
+	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb) {
+		sb->eps[ep_index] = NULL;
 		return -ENODEV;
-
+	}
 	__xhci_sideband_remove_endpoint(sb, ep);
 
 	return 0;
@@ -221,7 +240,7 @@ xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = sb->eps[ep_index];
 
-	if (!ep || !ep->sideband || ep->sideband != sb)
+	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb)
 		return -EINVAL;
 
 	return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
@@ -251,7 +270,7 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = sb->eps[ep_index];
 
-	if (!ep || !ep->ring || !ep->sideband || ep->sideband != sb)
+	if (!sideband_to_vdev(sb) || !ep || !ep->ring || ep->sideband != sb)
 		return NULL;
 
 	return xhci_ring_to_sgtable(sb, ep->ring);
@@ -329,9 +348,6 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 
 	guard(mutex)(&sb->mutex);
 
-	if (!sb->vdev)
-		return -ENODEV;
-
 	if (sb->ir)
 		return -EBUSY;
 
@@ -436,7 +452,7 @@ xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
 	}
 
 	sb->xhci = xhci;
-	sb->vdev = vdev;
+	sb->udev = udev;
 	sb->intf = intf;
 	sb->type = type;
 	sb->notify_client = notify_client;
@@ -471,22 +487,21 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
 	xhci = sb->xhci;
 
 	scoped_guard(mutex, &sb->mutex) {
-		vdev = sb->vdev;
-		if (!vdev)
-			return;
+		vdev = sideband_to_vdev(sb);
 
 		for (i = 0; i < EP_CTX_PER_DEV; i++)
-			if (sb->eps[i])
+			if (vdev && sb->eps[i])
 				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
 
 		__xhci_sideband_remove_interrupter(sb);
 
-		sb->vdev = NULL;
+		sb->udev = NULL;
 	}
 
 	spin_lock_irq(&xhci->lock);
 	sb->xhci = NULL;
-	vdev->sideband = NULL;
+	if (vdev)
+		vdev->sideband = NULL;
 	spin_unlock_irq(&xhci->lock);
 
 	kfree(sb);
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 005257085dcb..2d153cb57831 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -39,7 +39,7 @@ struct xhci_sideband_event {
 /**
  * struct xhci_sideband - representation of a sideband accessed usb device.
  * @xhci: The xhci host controller the usb device is connected to
- * @vdev: the usb device accessed via sideband
+ * @udev: the usb device accessed via sideband
  * @eps: array of endpoints controlled via sideband
  * @ir: event handling and buffer for sideband accessed device
  * @type: xHCI sideband type
@@ -51,7 +51,7 @@ struct xhci_sideband_event {
  */
 struct xhci_sideband {
 	struct xhci_hcd                 *xhci;
-	struct xhci_virt_device         *vdev;
+	struct usb_device		*udev;
 	struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
 	struct xhci_interrupter         *ir;
 	enum xhci_sideband_type		type;
-- 
2.43.0

