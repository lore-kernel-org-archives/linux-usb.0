Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418624;
	b=JKDooMC/WXbVRLvvDkiNh0f++d/JukFIVTeEO0kbvjTFwsuNKDb4K/PzxUqaFfwCsGsk
	 9t3ugNtu9opN0SU2nE9h4jzQmRGo0T2dJh5F3frBb2RKty0i2IavyjHdKZP9JiOa1kN0Z
	 7+go8RPOwwYb4uqxZMGjd+Eh6vmZsUNfhYbQSutcy9J4hxYqlORHut6jhbRs58pfstdGl
	 U4+ZTgrs2I9NHyiIWjcCwgzar3x4KSRaaCP1EmNmw8+7etD1ajN4wUdXxNxp3mrHm0QYG
	 JWL4q1Y/5bD6wxqapQZt5eX2TspXihtT8nWZUGhCWI5oRiRde0ZrAfvp/dc9JSIkAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H8gLzdazFZwlIm2KfjMoHrjel+Sb1VQszOzQk+URMQE=;
	b=gVHQpWIhZ0TtwgxQF+MQJPB9y2f/Zx/8qr804KQ8N6Ywrm0Q84cKKyQNfJ6Qy7SlCeRI
	 hW+e29mmwtfEuNIT3ilQv9z2PJ8IDk02sk4pW38lEH9V5Xn3eaOAJDYSpGXwKDXhv3n1q
	 QYSTRz9xUEqgqdrrj4L5X3VQj2EBFiesbHptFkeyoB/gb7Hr0Y0B+H1BvpzwyMSZIlkDm
	 HZnwHxyLrTn4Amkax7yF9RSNFtbHrmPdGzpv0L5wnr18lGcXVic6Biv9zvrL0y5+CXaWV
	 IAiOVI6X4/kn2FFn95v6a76RRD5KMOziaIV+WwKpCgY+S562RfJFw3wEy/7eAgBuk8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ES8KqK+P;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455D606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 07:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8455D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ES8KqK+P
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1977619a12.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 23:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795418623; x=1796023423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8gLzdazFZwlIm2KfjMoHrjel+Sb1VQszOzQk+URMQE=;
        b=ES8KqK+POnE7N2UfZ1uvbgSacHLGpSqGufHpfXF0Na82i/vZGN2Z3MAHif5Jd1Rqq3
         FyCDEwlfp1jdY1KvCjAb4Tb8yHFQELf71uSzBIJxnYiXu8an7glJujhHdDlfHVojNGdt
         X6wol31g2T2M7FZjRYVENew3OTpOxBcEPLmpyK0DHZR2Jcy0LWqOBrLtlZOYkGoi4zI4
         PbrOgCFT6JEXzjH2gBXIC9OeSm8jwjjRUEDxfmf62BDXJWpNpYz2yEQ9igJeI3nBQnfJ
         PIKzYKSZuoJ9aNFiWdhTqZcoxrspTYxjgNysrl251bXzvkfzquN0NV3H9hRfTseFphOS
         JPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418623; x=1796023423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8gLzdazFZwlIm2KfjMoHrjel+Sb1VQszOzQk+URMQE=;
        b=UibZpNkqpMA1lBxMXM+eZ8IMj+FzE5UEkbBDgILn98kWPrjg/eMgMviqLGWxer1Bz/
         x3XvBONNMS2pq/QRp4pQhD3auXqxcmD9JMweOnoKdrwI1Zq5hBF9WuoIWSzxMwaGkcOh
         ROTwQuPKP8ipUohCW7GfW2/WHeDUEpA9w3DVJKCk6Ng7ZCOna8vL2P8SUCVUihsc94/O
         MMmC+MzscZ72woy6mE4Xxr+iKDWlj0hA/Z1RmqImx3V5v8UftXUA9z1mAkfYdqLuOIVu
         pwWPovz4dDYO1ZEqu9eYCHsNM7ThPpCLl6y4YNIMQyXDSQeVR+QoOjmRolu6XZF/1hmi
         ZItw==
X-Gm-Message-State: APuU4Z8wOftLlMsBAjf8KvYoHo2inZNCE/sVXAarn5QyKB0Iqr9I+43i
	6qnPUuMktFhRYRyOrC8pCoV79pUEyjYBo0frhqGkzbapiyGyrRV02cchG6Mktw==
X-Gm-Gg: AZFdTZfJIgrLeckCHVdj8HE6q3W/HWBnzHZ4RhFSKPc7a7o1Ne6qWrD1Dg2+AmmTqaj
	cZfBgTPLNtkkspZbP0i99mNT3KdfwgXVFsOAxvQfUOVQd60pnZ1RNT8HwtLjOsiklYBwSYvOBeH
	9XJqeUvPcL2Q3h4Yq+uIdg+J2zpukep7qOopGXPrJyi9agzHYZu3n7uzz26C4Z20D2AchTZ6AEi
	A9OcFR5IXZPAjGMLNAYi0honv0lPINUbCDH7wskCCBy89q68eEVe3BPjLIHX9bwZou89usuzboo
	wNOSf/eLSOsUqFds/rBWjN7g7rvRQBHwZ5Ca9Rqf5a7vxqLkpNonV3sXnQwSyvanYchctMis9WL
	GwUi0V8dEFKqrkAkp75yzodXZVnWe7lUdHIF9UNe8G1Q6eoLtqQG5A9AIe9KJ0h3y4RttXRraA2
	v1S+k63givFMPqzX0I/+fCNN3Ehnu6ZEQvf4e4K0MqMlTHP8GBYH7o1tnjHZKZAeXtUxeZjpVxI
	OxaP4nNNv00WezgDeDiO2pHQZG+eMOP92ZM+Sc/6o7vw87RRqsZLNjV2zxtFS0vpban6lxoCtci
	ubjvZElP8EwN23S9NNz9G8LPj56xKpowjlBdirWiMTzzD8YNBbeSteAHetj3g2xMQvwVj7Rm7dX
	8sB2UnerOKkwSI3p5kY5qPgg=
X-Received: by 2002:a17:90b:3d92:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b41c8e0602mr6108571a91.14.1795418622775;
        Sun, 22 Nov 2026 23:23:42 -0800 (PST)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm17751153a91.16.2026.11.22.23.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:23:42 -0800 (PST)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron hosts
Date: Mon, 23 Nov 2026 15:23:20 +0800
Message-Id: <20261123072320.5967-1-ki.chiang65@gmail.com>
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
index fffd901..c640952 100644
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

