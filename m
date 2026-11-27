Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744467;
	b=1+j7+o9W08KUDxtOCdG6zItvOLxnzpO2icnMxaryEFKs4gLfQssx+9aoq8cDqoEAehL+
	 sg8+cgJf4LEp6OPxH1rT3o79jf4OV/mF+i82jR1ma1r4Fe7nPKRJZxqVn6SphaC8QEwF+
	 MVBGAoqVZUrRBAXMOQtkGNNB24PSP6onsb93FFY9mw5kUfNe5vc7vt93DOBabHLgmv59L
	 EAKxAVBy2U17aRrrODFp1GAXrvT0FZz8dW7n4on+nxcOWZOtZk/xUkw8KCl44C2hFOj9J
	 amt8qIau+JpQap1bANHOVf9+lmh6nEz7w5jz70vFX8U0e+P6J3elkW94OnYK2dFST3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4v0GgnNrUQV0wnxNWgiFul+WyXUlJiDMdacI3aZczDg=;
	b=20CKN/A9ovtGc5k6fhEVXkQNoQfAcIZIzFehd8rgs6CTVWQdcle7y62OQad0ezbKk8qo
	 XgA0FHjDVDkCNMHCOXyYEDgKF0nxqrLojjaLUPGWlfJSoUCbTHm8qVzjHTf3W0pBGZnhI
	 PXFxHKLDnEYBFFJRNwhD5iq65Qt+vI1empD9YAqd5agSTnkF6ngeq7GAt1QF/xTg1PH9/
	 6qwXRWOmfN5/pB6cTjkZ64M3rvcWxDBlXCmWHGuKp6MpQq3lvEzwPmyrssfFgXLynayie
	 p1zKGy6KXTfxfp5YrXfxY0ClW5xGwld6J3Ym6SwLCpKHYgUPuSMRStGqigPrJ8yE5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vnhliOf1;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978FD606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 01:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vnhliOf1
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so3473655a12.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744466; x=1796349266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4v0GgnNrUQV0wnxNWgiFul+WyXUlJiDMdacI3aZczDg=;
        b=vnhliOf1Yadyid0DSCYHla5JzKi226yYgqo3v+34HrsbpVwPaM7wwtkKxMbgZdc7Ef
         u7D31TBl+DVjmmv9k7UEGvH3n+uY9aBLhDsyWFhZKAE1pJcnzvuyZ814QkKbZ6ed4VHl
         wpBHLhUjRY0HZ7Z1Cp0YA9hQkYQEym/0WIv/1AEI3E7AOkA8LNT3qC7VlUYA/DQVGzT2
         1hHhVykCHTqH42SBLTW4xXZR18Si/TP4eRvmS81l+eNUKF2jQpQWbqWcpH4LpQ2uzi9r
         p46K0ZBXXOiBQpOlWO+7YHQdlPLyLjSX0pRPhWDUmXLTRMtL2x4TTyPHfYol33d17v4W
         yjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744466; x=1796349266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4v0GgnNrUQV0wnxNWgiFul+WyXUlJiDMdacI3aZczDg=;
        b=CGXM6HrH15oJDWoixYXZSsqoFj5Fh7Di4gI+s7Ae4WFHTUrr1VqHzBPf5qZe5YUNlt
         fLQkt3/GMVb7+i/oVOAVBS4QisK15TXsmBQA3yVFNTYMysxZB5NqDy6Q5XeUFEzDZt60
         33Uywx0/tBCpZYsnDMlV73U/p2w/qqclUOM88SnIpCjf58PB34AYvm3/0PXCi5UJu1oQ
         CZKVZGcC/7G5/5+VWUpI0pFIaPUH7dNi8PQZdiuhgefm7f7NuUnSn1SewdTOXl9uI12a
         u85OZzPypPuBVYqOW3PnztfCTBTuKYCp2VxXRClj6G0UcaxadLvOaqxzduV3UXKP+bvA
         0qGQ==
X-Forwarded-Encrypted: i=1; AL+hErG+T3p36099rlVXvcFyetSU3EO5IIFPzNoODE3kw/wTK3F6k2h6lami4niAj1eR6V0FMt/1lfha5mc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JHr5LVxQK9A4Wt1HK6BmkEDebmNSV9nFNgLjfF0txdEL+6zmC
	5gnrZXjcaSgHAZSgk13YpjlOOXGuOVuTSWFW1SeknYzI5RKRM/iM7IsC
X-Gm-Gg: AZFdTZeWbEiOI8kxRQVSUIvAW5IQop9XUZyVbhZGB9V7rpjmAZP/g2f8AnTj/FAFVat
	Y+exVcg89qjWUwcn4f+Y+f0JQcHLDbm64+xuuCs1tQGSBbHRWWvf/PgiBSz8xSXT6ojs7hyL+uA
	qzrXf6OVWKZTe/fwQwb2rpDFYpqXR/oK39OQ47Rq8mAOoybArKMGXjuGv0uezYFU7HxMQl2WEYA
	Aaj+3t+vBxucS+TeHwO0yFUAUf3xCSvYsPxX6tUJKEk2/ZR0WGQqqgbYhKc1gpFcaWgYZM+3w/K
	TJEvAD3VDAVxISF0Z1jXnzOereX62ra6xDV4U6xwaZ/Kv049uiBLxrIf5X32bBVwyOigb/5V79q
	lmZTiftBc/a03dkIghITThVCryiIjaDph/zM2JWO/xlW5FjmYiZrGkXMbSSQ9qELanDWwgxXkds
	t5Aai0SQcIb5QzwvcVs2H4DaIewFpV09dycSckGslsLlDAuKNEbRQJoNykVk6c2eLZmTiLSrwNu
	vCdR8vViEVWEmbfn7Kv7B163YwFL3qmmRYkhuwdHC+j/YTeH5Q+52QCGr2zvuksAh8YAw5bRtUh
	WpHvC+kIW4+/DJOxSfjJHDyb0jxR6W5OafTyE5plHrU5+dCq6X7sZVGR75XI/pYhu1aQma0084L
	fjAPuDX258ZDUNFv8x6FRl6s=
X-Received: by 2002:a17:90b:268f:b0:3b3:afdc:2e5 with SMTP id 98e67ed59e1d1-3b41c9cf56bmr17312146a91.30.1795744465543;
        Thu, 26 Nov 2026 17:54:25 -0800 (PST)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm16735298a91.0.2026.11.26.17.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:54:25 -0800 (PST)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: michal.pecio@gmail.com,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH v2] xhci: Handle missing USB2 resume events on Etron hosts
Date: Fri, 27 Nov 2026 09:54:07 +0800
Message-Id: <20261127015407.3937-1-ki.chiang65@gmail.com>
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

1. Disable autosuspend for the USB2 root hub by setting its
   power/control to "on".
2. Connect two USB2 hubs to the Etron xHC.
3. Wait for both USB2 hubs to autosuspend.
4. Connect a mouse to one of the USB2 hubs.
5. Connect another mouse to the other hub. The second mouse
   does not work.

The affected USB2 ports may remain in the resume state, preventing
newly connected devices from enumerating. Reconnecting an affected
hub or mouse does not help. Reloading the xHCI driver restores
normal operation.

When handling a USB2 resume event on an Etron xHC, check whether
other USB2 ports are also in the resume state and track them so
normal resume handling can complete.

Before the patch, the root hub status bitmap reported only port 2
(evt 0004), leaving port 1 in the resume state.

[ 4928.200011] xhci_hcd 0000:02:00.0: Port change event, 5-2, id 2, portsc: 0x400fe3
[ 4928.200087] xhci_hcd 0000:02:00.0: port resume event for port 2
[ 4928.200095] xhci_hcd 0000:02:00.0: resume HS port 2
[ 4928.241196] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0004
[ 4928.369244] usb usb5-port2: resume, status 0

After the patch, the bitmap includes both ports (evt 0006), allowing
port 1 to complete the normal resume process.

[ 6277.946923] xhci_hcd 0000:02:00.0: Port change event, 5-2, id 2, portsc: 0x400fe3
[ 6277.946998] xhci_hcd 0000:02:00.0: port resume event for port 2
[ 6277.947005] xhci_hcd 0000:02:00.0: resume HS port 2
[ 6277.947013] xhci_hcd 0000:02:00.0: HS port 1 in resume without event, portsc: 0xfe3
[ 6277.987265] hub 5-0:1.0: state 7 ports 4 chg 0000 evt 0006
[ 6278.010733] usb usb5-port1: resume, status 0
[ 6278.145273] usb usb5-port2: resume, status 0

Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052) with root hub
autosuspend disabled.

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
Changes in v2:
- Update the reproduction steps and logs in the commit message.
  The issue can be reproduced with root hub autosuspend disabled,
  as reported by Michal Pecio.
- No code changes.
- Link to v1: https://lore.kernel.org/all/20261123072320.5967-1-ki.chiang65@gmail.com/

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

