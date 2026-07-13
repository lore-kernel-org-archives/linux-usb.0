Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D73E2746
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939745; cv=none; b=dBb9HgIk5PqqOjI0phJJI7oJNVWgHtLWBpSyir/ihuz9gr8Jn5axOmaMmb47n7xzYzc2Vd1tLFM3Wq9atNKl7tU9XU5iDeeZoRveWS/Szrim1/dzClrHiDwgkNmsCK+NMTWXlxA2zxycvbk7wK6J8GUt0fOWUmoBOwgmcrMJFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939745; c=relaxed/simple;
	bh=+gn55aT5C6MoRjGfXMHFU+xj1wW2VVVoiBM7zJKXrys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KlHhKu8sofpO7E9/KZoMxAHObCifycbGfCg9y2TGb7eVLM1vmHS5D79JLroipH0N+/v0YdxZWNegdmn79O+iC5NbycyCpeUflmx2D4e7i1YOaEr6jWNUZHnEd9f765h99YDlTrfz9OoVXJcAwSXW1NWMZ1zZzhpb3hxz2njpMpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAodFM2n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAodFM2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939745; x=1815475745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+gn55aT5C6MoRjGfXMHFU+xj1wW2VVVoiBM7zJKXrys=;
  b=cAodFM2n+Q4frN+4gwb+VDVDmmU0/q3PLoAiu5r22d/zQLrJuElwdOBa
   +UehmuAcs1wyLvhDt3p/Sgpzm6M61G+ADMOE0N5ihTXOiUOGPYQEieGjn
   Lw73ci7v7vN2ho5eMGGszjO6HP6er5EZ1obqaIqH62WdrZh5pnIY9sVhb
   odZ+9WgY6zhVZdHJuYzdm4EyPAcUBcEJhzkHLf3/bJvdNI2xcz33pTqIW
   DRDgEUrq6sA3GNgACMGuKlLf+dCh5eI+DhSn8rTEkxxEEuh/nc1KTD7Y5
   kqZE7f9XdzMqBzebzaxZaLv0mpyESUw8uJsee4J4DaY8Jb7pPendFP9u0
   w==;
X-CSE-ConnectionGUID: LRFZf41pTV+4/Whrq5vJHg==
X-CSE-MsgGUID: 7kqhQiIXTJ6hoLJ0FJ0dGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057046"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057046"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:51 -0700
X-CSE-ConnectionGUID: 4KbpQ45PTlmEyCElF1ozjw==
X-CSE-MsgGUID: nz5xL/mERwCLYOxB6kPMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928989"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id EFA7395; Mon, 13 Jul 2026 12:48:49 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 20/22] usb: xhci: remove redundant PORTSC ops in xhci_hub_control()
Date: Mon, 13 Jul 2026 12:47:34 +0200
Message-ID: <20260713104738.629612-21-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
References: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xhci_hub_control() performs multiple redundant calls to xhci_portsc_readl()
and xhci_port_state_to_neutral().

Rework xhci_hub_control() to read PORTSC once, and again only after
it has been written back. Also move calls to xhci_port_state_to_neutral()
closer to the corresponding write sites.

This reduces duplicate operations and makes it clearer when the local
'portsc' value is in a neutral (write-safe) state.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 06192ae95526..dbf1183a6813 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1238,23 +1238,21 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			retval = -ENODEV;
 			break;
 		}
-		portsc = xhci_port_state_to_neutral(portsc);
 		/* FIXME: What new port features do we need to support? */
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
-			portsc = xhci_portsc_readl(port);
 			if (FIELD_GET(PORT_PLS_MASK, portsc) != PLS_U0) {
 				/* Resume the port to U0 first */
 				xhci_set_link_state(xhci, port, PLS_U0);
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				msleep(10);
 				spin_lock_irqsave(&xhci->lock, flags);
+				portsc = xhci_portsc_readl(port);
 			}
 			/* In spec software should not attempt to suspend
 			 * a port unless the port reports that it is in the
 			 * enabled (PED = ‘1’,PLS < ‘3’) state.
 			 */
-			portsc = xhci_portsc_readl(port);
 			if ((portsc & PORT_PED) == 0 || (portsc & PORT_PR) ||
 			    FIELD_GET(PORT_PLS_MASK, portsc) >= PLS_U3) {
 				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
@@ -1282,7 +1280,6 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_LINK_STATE:
 			link_state = (wIndex & 0xff00) >> 3;
-			portsc = xhci_portsc_readl(port);
 			/* Disable port */
 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
 				xhci_dbg(xhci, "Disable port %d-%d\n",
@@ -1334,8 +1331,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 				xhci_dbg(xhci, "Enable compliance mode transition for port %d-%d\n",
 					 hcd->self.busnum, portnum + 1);
-				xhci_set_link_state(xhci, port, PLS_COMP_MODE);
 
+				xhci_set_link_state(xhci, port, PLS_COMP_MODE);
 				portsc = xhci_portsc_readl(port);
 				break;
 			}
@@ -1407,7 +1404,6 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 						break;
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
-				portsc = xhci_portsc_readl(port);
 				bus_state->suspended_ports |= 1 << portnum;
 			}
 			break;
@@ -1421,6 +1417,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			xhci_set_port_power(xhci, port, true, &flags);
 			break;
 		case USB_PORT_FEAT_RESET:
+			portsc = xhci_port_state_to_neutral(portsc);
 			portsc |= PORT_PR;
 			xhci_portsc_writel(port, portsc);
 
@@ -1436,6 +1433,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				 hcd->self.busnum, portnum + 1, portsc);
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
+			portsc = xhci_port_state_to_neutral(portsc);
 			portsc |= PORT_WPR;
 			xhci_portsc_writel(port, portsc);
 			portsc = xhci_portsc_readl(port);
@@ -1472,8 +1470,6 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		default:
 			goto error;
 		}
-		/* unblock any posted writes */
-		portsc = xhci_portsc_readl(port);
 		break;
 	case ClearPortFeature:
 		portnum = (wIndex & 0xff) - 1;
@@ -1488,10 +1484,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		}
 		/* FIXME: What new port features do we need to support? */
-		portsc = xhci_port_state_to_neutral(portsc);
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
-			portsc = xhci_portsc_readl(port);
 			xhci_dbg(xhci, "clear USB_PORT_FEAT_SUSPEND\n");
 			xhci_dbg(xhci, "PORTSC %04x\n", portsc);
 			if (portsc & PORT_PR)
@@ -1528,6 +1522,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_C_ENABLE:
 		case USB_PORT_FEAT_C_PORT_LINK_STATE:
 		case USB_PORT_FEAT_C_PORT_CONFIG_ERROR:
+			portsc = xhci_port_state_to_neutral(portsc);
 			xhci_clear_port_change_bit(xhci, wValue, port, portsc);
 			break;
 		case USB_PORT_FEAT_ENABLE:
-- 
2.50.1

