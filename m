Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901087;
	b=2twzLY9k0uLz+Xh7VzHr3zbKQVXFUpunLuBJMc/zMHnkRdHbMo1mIty/U3mjhJM3Mctv
	 h4/HNZGgdGlpHu/Xka6jHmKfrxjZcOpN4cz4Kx8UQF3gCNoz56ZwXPJZGC8j2Pjdq4zKJ
	 6jATsq4QQ/CUn87h7ys2oez7PFGtNKZrMonAeYetKTvjaA9z50gMGY3x3wQc3HiUQyZtY
	 P4sgdiAz3vcLGLRjzaKYR1MgPaqig4jEiVukfIShgYKvDZSdQ5MBxi7Cz8EtGc5BAYaR2
	 Ko2t5RHHtpFJkibaptCliJN8UvBVPuIfPl34YrVBkZhrsfRUPv5EhN+MJH+xCeb41Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eY7xBQplfrM5w25+6tmhZ6TSrRMXHGo/FBJF8L3nyZM=;
	b=jfqfgsJLR7ZlchQ+ivPJp057DdARCLEWoAioxUBUddjv1Cmc/4nlpSInaQr/38lLpCsG
	 NVZnVvrYgQJ1Sy6VHskFbYVGsdLQgMmVJtEb8WLafScFvX9T7RJbZwzwWGDMqk19OjGVP
	 WRICX0xsFLw3PJHA1nxNgldB3RrGnG3M86mqFSs++V63rqjMjfjEtkxKgQlk7IUJRWfjL
	 tzlRMe3LiWlTqFLXABUvs2lmdIOkGzzkg9VWYIy2TXkEFu/vDWwTVTLiJKV76AbN+9S7C
	 KtgKPsFjaEbxaAFkVgKIVic56Mo6NuiGlKrdJec021vntBl0qDT6t30fIc0lHL+JD/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ENkvYzN3;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED4606A32C
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36ED4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ENkvYzN3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901087; x=1825437087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s+JzeMwzTGnTNwsEDR2ytQU2NDV3WEEoasJ2oYKdQmg=;
  b=ENkvYzN361pbMcU+l0kKiZUQLlJKW4lU30C+rb9OxbJjSxNY21qqaXsV
   yRmpa2cZlnAtdCbAJdEkwzL2w4vcR9FO7XeF2R1FoIr1bNQRP+gJSrolG
   Pjbi4cQSAr6zBeZ19ycfNGdpu0bZZMRcpERfuCM3wMzcnS/XgwLAuIG9E
   3Wfely/FhD5pH6XWuEIk3Ch9AzbIQu4K74CHZ87OE5RMu6F7x7g+s7mXW
   rZ7rrDR147dHgFgDJsUnv3qauUKcfyQPI4sFDhVqvmeVLe4uwp0rO5fOn
   oQ/xsX6NruXTG4pTX5NsQxCNex1oHebBe7rallDIAIkTepdkxq3bug4qA
   Q==;
X-CSE-ConnectionGUID: VmBhIxmqQgi+LItGaLh8KA==
X-CSE-MsgGUID: 2HrRhCnNT4CQ/LL93MqD9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2572531"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2572531"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:25 -0800
X-CSE-ConnectionGUID: CElr9KuiQ8KLd4vmYEX+kA==
X-CSE-MsgGUID: XZXePtriQ9iBAk9q58cr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7064860"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:24 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	stable <stable@kernel.org>
Subject: [PATCH 1/5] xhci: keep port link_inactive and connected flags in sync when polled
Date: Thu,  5 Nov 2026 19:51:02 +0200
Message-ID: <20261105175106.241182-2-mathias.nyman@linux.intel.com>
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

Update port 'link_inactive' and 'connected' flags even if xHC isn't
generating port change events.

xHC only generates port change events on port changes after old port
change bits are cleared. Hub driver is often kept up to date
by polling the port status.

Sashiko reported a possible case where all port changes after a port
reset take place before hub driver clears the reset change bit.
This way the port can end up connected and fully running with link
in u0 without a port event clearing the 'link_inactive' or setting
the 'connected' flags.

A protocol STALL in this state would set EP_DROP_PENDING, and
prevent all future URBs for the endpoint.

Fix this by also updating the flags during get_port_status(), when
hub driver is polling the port state.

Fixes: 6895dbdc19d9 ("xhci: give back TDs and clean up ep0 after disconnect")
Link: https://lore.kernel.org/linux-usb/sashiko-outbox-190046@kernel.org/
Cc: stable <stable@kernel.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 470bafe1802b..55430b673f1e 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1166,6 +1166,12 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd, struct xhci_bus_state *bus_
 	if (portsc & PORT_RESET)
 		status |= USB_PORT_STAT_RESET;
 
+	/* track connect and link error status when hub is polling */
+	if (!(portsc & PORT_RESET)) {
+		port->link_inactive = (portsc & PORT_PLS_MASK) == XDEV_INACTIVE;
+		port->connected = !!(portsc & PORT_CONNECT);
+	}
+
 	/* USB2 and USB3 specific bits, including Port Link State */
 	if (hcd->speed >= HCD_USB3)
 		xhci_get_usb3_port_status(port, &status, portsc);
-- 
2.43.0

