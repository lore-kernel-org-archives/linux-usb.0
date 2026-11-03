Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669512;
	b=yqh5+grzEiCaibO1eH+f+kJFIo85r26Xj6msb1CzNfyJ37susnrvj9t9v8tyeL2NA6GQ
	 PkHWD3UkV6IJwlgFfVRY6Thdr+CHBkwcUGvDPXbukaqGMfk7iDILu2+oBcwTBD+ReHBRx
	 R0G9lkgvbSzEEmft02SQSpIxB54J53KHGtbQqOzVgGcbTYiP0X1mpbHtDbo8GurCf9lgC
	 /sMxgzlLjWRTqC61QyrfW+UJU9ebfdpVZT3vkD/cYllUQzB4MMflZ6hxz/okTlRRZartL
	 c05ZUDXXUhzKSJdmK4BRqHL5CXjQdjcNEjMLwOKFaEhbYyurzin4uTT6z5+FRVhrSIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pTjzHT3j3g4KPLqEKsNSbVg6rJdaH8AJl04Trccj3fE=;
	b=SdKZ8L3mlyghvXNOczo8shu+WBbqQ6AotpmiA4ekGO17KmSp52ABC2Bh6CeH5qlV3SyH
	 TE8fgYg8Xahq/4lBATvpCr+Ze2Ya3vOZrTr6xjqNeGzb1eb45M34K93qfDjKyrPyP46WP
	 mECUaviwWowhZquL50knKXofgFWuRHioRt6oPiuGOAibN70VuvjOncd7pLnmilGyEBHoB
	 QHz4gTvBdVgRARrFNP8bh2+YJqR/L28Z9DGAqq4M4q9sCY1/2RDLOewaFt14OMdvwNhFT
	 PLKroM6QONr+Dp/cspxnbLZChHRT//sC536psEgeQjLWxPVMXaAO773w4zT8kFXt+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaMQqmgt;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222C606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 01:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B222C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaMQqmgt
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1318068a12.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 17:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669511; x=1794274311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTjzHT3j3g4KPLqEKsNSbVg6rJdaH8AJl04Trccj3fE=;
        b=kaMQqmgtQP3OdM7RkOm7AUAcD/Xyzs1ysyZZ1ee6c3FrfZr3DLOlj+OQnK0+CmorhE
         52Ueqi1IxhuE9cadYwqkkZ2/NxKv/N7sCRKaTriEXQ9P7D0JeUKFcQ63tCTJCCjdnFqm
         RdAGR9U5v7ADYwTlMpCJJqEX+AwKl8JgJAHpbu+kfq1VL4LtEFwDn/q1BKNM2F+LpFd9
         2CMsjc3LXb6zo0TojjRTzsrLD1A6UXM7tNYpWQyxAqHZQyNf9dbAVF6ETiTp1ZOADlCO
         yyRs/P8dmCmB2BhueWL4Klp5mEdtf78p0BDsPLK7YtG7aSGYcXI5I1DWvvdCgPMb0KvI
         KmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669511; x=1794274311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTjzHT3j3g4KPLqEKsNSbVg6rJdaH8AJl04Trccj3fE=;
        b=VEyzbTGxC8tMDWZgZ0wDK4SMelOxfUe7RBKaHYs6CSONUkxXArVDbpizUHUBCiCoh1
         MbAdcKnKJ9I4wlOmMzmtddmaVwOJIRWKqyTAfrOk3U8NfUr9Bcg2uG85XaJhIzWKRAWv
         zbKVIIJ7HXvmjsXdk9NuOIcybMt6vquOO0jaKymc7tY4lCaqTTQB2E31w2+oe6DACOlz
         l2DBdHnhwcnrDeJS8x3ttT6e2O9pa025qBa4aEe2lXpsuU8HEUaAceTWT76CobsEQr//
         f5rb3E3MWR1LRyT62uGI0C6V/ZtNtJCEsUkVOVoizOm4V32jq6TaMoInZU50M4VLqrk2
         d1hw==
X-Gm-Message-State: APuU4Z9hC3uy7xO7U5TnZCGrB1YEGGPsE6tXxpPijjApBl4Y5AnevrI8
	0F88P8ncRq7L+hWc538DHqNvDO2rEurvl1W4NjuaRrZmx4Vfig+1Z72D
X-Gm-Gg: AYBFou0wDj4MRahdbPYkc2bhV+n4IXl02HJsRmGi+XENXSNqgWZuJiuv0zBuvEFyKsd
	+jEOhDGlJBSu0tMEWGN2rij9jkMN9+D+kmaQ+TEH803ACOIznIbADxhg+Ozco00CEH7rCK3TUN1
	Jl66xHOm1Ofj92bbfin4TynIMO/Vb7nh5/Kye9eWvX0qW/kRHV/Cc7Asy2U7SOsHxQP2Y66Z5Fk
	KV9AztOcGEpGNBKGpN+OeD55l6Id4AOEcMJtQxmxPvmoDK9juVzo9ceSfghGqNoXRAK4aJQF54Y
	2VGTUmMee143Rc8YBZJ8uPqFfsBwx/Z7fK1ej6nRfEPh2X84IYA23hl+4aDHoc2/aSVAIuNzAfA
	YpFqBhWti7P5YxYfFq8R34xiUyyJu8V/au59uRRfp2b0uZ01Qv33LO8N5aDasXIS3c/EWSu2O2w
	oqx1E8QHLAaYv2j9dqUhzlFgMBJ/D3pDbu8mGoWYxQwyqJh/WYTT88e9G1Z9r0u1IEOsUOAeSMi
	VIhKypjENXUGt/up7+D0cy0iTMxEl8RFreif10M6VR5wd78ZI1B/DIW28ypBik5WYkcbLKvEvJq
	00AVLnW459one5wCqoCUos3ftiCCTRSHt3iR6PqRXyngidoOfikA6tk2fWjFl+ZriceWiOLBcb8
	RNTAw3GC+D5gudQfX/BfCfOM=
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr9332181a91.0.1793669510984;
        Mon, 02 Nov 2026 17:31:50 -0800 (PST)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b0ec5sm1453886a91.16.2026.11.02.17.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:31:50 -0800 (PST)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] xhci: Handle missing USB2 resume events on Etron hosts
Date: Tue,  3 Nov 2026 09:31:26 +0800
Message-Id: <20261103013126.3603-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
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

On Etron xHCs, a USB2 remote wakeup may also move other suspended
USB2 ports into the resume state without generating individual Port
Status Change Events.

The issue can be reproduced as follows:

1. Connect a USB2 hub to each downstream port of the Etron xHC.
2. Wait for all hubs, including the root hub, to autosuspend.
3. Connect a USB device, such as a mouse, to each USB2 hub in turn.
4. The last connected mouse does not work.

The affected USB2 ports may remain in the resume state, preventing
newly connected devices from enumerating. Reconnecting an affected
hub or mouse does not help. Reloading the xHCI driver restores
normal operation.

When handling a USB2 resume event on an Etron xHC, check the other
USB2 ports for the resume state and track them so the normal resume
handling can complete.

Before the patch, the root hub status bitmap reported only port 2
(evt 0004), leaving port 3 in the resume state.

[ 4621.396100] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
[ 4621.396158] xhci_hcd 0000:01:00.0: port resume event for port 2
[ 4621.396164] xhci_hcd 0000:01:00.0: resume HS port 2
[ 4621.437164] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 0004
[ 4621.569169] usb usb3-port2: resume, status 0

After the patch, the bitmap includes both ports (evt 000c), allowing
port 3 to complete resume through the normal resume handling.

[ 4824.829350] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
[ 4824.829425] xhci_hcd 0000:01:00.0: port resume event for port 2
[ 4824.829431] xhci_hcd 0000:01:00.0: resume HS port 2
[ 4824.829439] xhci_hcd 0000:01:00.0: HS port 3 in resume without event, portsc: 0xfe3
[ 4824.870180] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 000c
[ 4825.001183] usb usb3-port2: resume, status 0
[ 4825.027484] usb usb3-port3: resume, status 0

Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052).

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9..ec7ef89 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1997,6 +1997,39 @@ static void xhci_cavium_reset_phy_quirk(struct xhci_hcd *xhci)
 	} while (!(pll_lock_check & 0x1) && --retry_count);
 }
 
+/*
+ * Etron xHCs may resume other suspended USB2 ports without generating
+ * individual Port Status Change Events. Track those ports so the normal
+ * USB2 resume handling can finish.
+ */
+static void xhci_handle_etron_usb2_resume(struct xhci_hcd *xhci)
+{
+	struct xhci_hub *rhub = &xhci->usb2_rhub;
+	struct xhci_bus_state *bus_state = &rhub->bus_state;
+	struct xhci_port *port;
+	unsigned int i;
+	u32 portsc;
+
+	for (i = 0; i < rhub->num_ports; i++) {
+		if (test_bit(i, &bus_state->resuming_ports))
+			continue;
+
+		port = rhub->ports[i];
+		portsc = xhci_portsc_readl(port);
+		if ((portsc & PORT_RESET) || !(portsc & PORT_PE))
+			continue;
+
+		if ((portsc & PORT_PLS_MASK) == XDEV_RESUME) {
+			xhci_dbg(xhci, "HS port %d in resume without event, portsc: 0x%x\n",
+				 port->hw_portnum + 1, portsc);
+			port->resume_timestamp = jiffies +
+				msecs_to_jiffies(USB_RESUME_TIMEOUT);
+			set_bit(i, &bus_state->resuming_ports);
+			usb_hcd_start_port_resume(&rhub->hcd->self, i);
+		}
+	}
+}
+
 static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 {
 	struct xhci_virt_device *vdev = NULL;
@@ -2103,6 +2136,8 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 			mod_timer(&hcd->rh_timer,
 				  port->resume_timestamp);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
+			if (xhci->quirks & XHCI_ETRON_HOST)
+				xhci_handle_etron_usb2_resume(xhci);
 			bogus_port_status = true;
 		}
 	}
-- 
2.25.1

