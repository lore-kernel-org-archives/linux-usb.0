Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901095;
	b=1eEXAYu0thXjwQkA3GMK4V26Rf8WWTwMTmlWmqgURKvZutRAFkuyCRkDECDa9V34+oIo
	 Vxw4oNCw0wSWHkZEpZ0d7J8xIlq2Rj/oHWUULHXkg2oCijkyNqUeI87uNRdSxb+c2+mlO
	 dROZB/m5sdgo0xKg76M5XPl3o6mjGupt9bF0DuMKP+zw4LBqfaa0nNa9LFs3KhgSh0+to
	 SP722P6+xVQs9nK4lNERDF0P9JQP5gS1vTv6SlIYYW8XqP9MQfWoDWSTLG6ELwpzAWI8J
	 jC+YEvFOnonSUxcdU/UEU9vTRCaJ0Y+0iyGDH92UnEN2c2PWjHIGtsIiikl94rHfq7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901095;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1db/nTli5/lt7nHOAXoEe32sZN60BigsEFJdVISD2V0=;
	b=qT3XeKnh3/54nY7U69i0uNa05Q7s4PFAAsgY3I2pNhdlsqHitLZMsUqliy49hcswG9B7
	 1oDP5oULFygSoHDs6xT28EyPwdDIoRaoDtPQKqiO5+F9gP476P/xWsg9IC9LP69jwbr/Y
	 GtVf+pDor9nCnDO2Pucb0l/jRQmGT2lzzmne9g7Inzt7gk17OYP0IlsfRLVNkQ8FOZHBP
	 WIWnICmO8W0oSvv64F+n4t2IvohR/sdRoevcT+q2auONFhFnTwIH9DXHRooLCi6z85kXx
	 9dimeuBPhy0x7Y8ma7/+ctWs8/Kn8eMd7rdCsQnHyU4jiMwftZWv5lWuk1EuEnBVzVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gBBB2gpp;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEB606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECEB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gBBB2gpp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901094; x=1825437094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MWS+tQpAHSBrfZoK1MP45GjA6KJrvJU+Lfk0dK/O3TY=;
  b=gBBB2gppm0KQhBgVVSsqM2FE4ibPweaqx0Mvzm4zc0dDrf6P0S8SBmln
   qxGJ+bh9Y4JbDflguZoMxRNdM4tB2rSvSrtDF5jtyCINNyuoUh3oYMKDB
   obaHWX2buR3hQCTCKKKoKQkstPCK0pxKqV94d0Fp4QQPbSsnArHXs8Nvn
   8GnDpkZWcP+vRHZAxXpPavBlesDMETNFmo70GYrSwITOBQiXCfQGVIF+f
   Sf462mdbLcVMfkDqRRxGcsuPaHLrAWQ58wXhnKC/Zy6T+BCn42emTB5s7
   pWxxTgCPZhGq6czRAp+KAsh/r4iERtEAlRVdWBpzinJW5AdxWMkRWvuzQ
   g==;
X-CSE-ConnectionGUID: KnT9WWQQTDSokwFrVFw3Og==
X-CSE-MsgGUID: ogKOj0VQTfOjjoh90CtNxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2572576"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2572576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:34 -0800
X-CSE-ConnectionGUID: OK/cNc4XTt6VxZLpR0TpXA==
X-CSE-MsgGUID: vRsFpKaVQKuoysIAaZw3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7064885"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:33 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/5] usb: xhci: fix 'num_active_eps' accounting on allocation failure
Date: Thu,  5 Nov 2026 19:51:06 +0200
Message-ID: <20261105175106.241182-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

For controllers affected by XHCI_EP_LIMIT_QUIRK, endpoint resources for
the default control endpoint are accounted before the virtual device is
allocated.

If xhci_alloc_virt_device() fails, the slot is disabled and cleanup is
handled through the Disable Slot completion path. However, because no
virtual device is installed in 'xhci->devs', the endpoint accounting
is never released and 'num_active_eps' remains incremented.

As a result, each allocation failure leaks one endpoint from the
driver's accounting.

Fix this by undoing the endpoint reservation when virtual device
allocation fails.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a762dd010e8d..fc1b0a6b0429 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4280,6 +4280,11 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	 */
 	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
 		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
+		if (xhci->quirks & XHCI_EP_LIMIT_QUIRK) {
+			spin_lock_irqsave(&xhci->lock, flags);
+			xhci->num_active_eps -= 1;
+			spin_unlock_irqrestore(&xhci->lock, flags);
+		}
 		goto disable_slot;
 	}
 	vdev = xhci->devs[slot_id];
-- 
2.43.0

