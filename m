Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A432470F;
	Sun,  1 Mar 2026 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772369088; cv=none; b=Hht4ceOJc9KXZX1eBjvi1OiYITV2K7xA5+cZXufqHmEtB0gL4n/lmpKfo2bMRaqWzpXznXhHdZnOWEgZSENjdlJXLnx86VVRecrjN6xuF+fVwgmsCQStxMLOS9mvUs2g9Zgns9sqB9So2Slizn5vcs4OdRXqzgGrWyi0xLb90K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772369088; c=relaxed/simple;
	bh=c0O1o6E/FKKOB1cD9nHfj9XMKn6pEYlcjVQe6vhxUz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f9ANci69/oC7hQy9Mm5jXA6SB5/cbOZ8iRsAmzEGsfRTcztnY0ouQvbPyi3KJ4UPhrhRiF3k1N+fLa4R13Dk4vZ8LTw0zMTcFHCMZjBBmBVUFEVpBOqf/UP+GHZjF/kDaGSM2VBHkTcyIStDuqqKOrYwH00XR39Mz1lCveTd1w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWrltFQo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWrltFQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B40FC116C6;
	Sun,  1 Mar 2026 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772369087;
	bh=c0O1o6E/FKKOB1cD9nHfj9XMKn6pEYlcjVQe6vhxUz4=;
	h=From:To:Cc:Subject:Date:From;
	b=dWrltFQo7z0es0hF9ILRPuDIhLxmy14/3tV+OYHQreIcHytVa6yAADKJrPZNeFYBn
	 sZ1l7yddZwv4yXX5G83xaS0PBqSMQTBLqmPHo+rO4n+boY6mJ1NsC8ezn7vh5V9Zfh
	 Nzd/zF6KP7am9wypfbiO81+5fjnOG/9F8YlUyoSj8hz3JSXi2iWfVJVs1yVu03l38U
	 aILSHb4XmF/9rutbKjHwAisRmMW3FzSS3FsaCIpdkdknxNb6gNzsBorn9BrxVktW6b
	 JcWthw3KBuFlb72T8VbnDPXntUccsbXtORgi8QL63wgbZWy7SA6koj7OPKXpiRN4eC
	 zyP16FNIaFgqA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vwgA9-0000000EwV8-1Wem;
	Sun, 01 Mar 2026 12:44:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: cdc-acm: Restore CAP_BRK functionnality to CH343
Date: Sun,  1 Mar 2026 12:44:40 +0000
Message-ID: <20260301124440.1192752-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, oneukum@suse.com, gregkh@linuxfoundation.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

The CH343 USB/serial adapter is as buggy as it is popular (very).
One of its quirks is that despite being capable of signalling a
BREAK condition, it doesn't advertise it.

This used to work nonetheless until 66aad7d8d3ec5 ("usb: cdc-acm:
return correct error code on unsupported break") applied some
reasonable restrictions, preventing breaks from being emitted on
devices that do not advertise CAP_BRK.

Add a quirk for this particular device, so that breaks can still
be produced on some of my machines attached to my console server.

Fixes: 66aad7d8d3ec5 ("usb: cdc-acm: return correct error code on unsupported break")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/class/cdc-acm.c | 5 +++++
 drivers/usb/class/cdc-acm.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index ad38c746270af..7ede29d4c7c13 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1379,6 +1379,8 @@ static int acm_probe(struct usb_interface *intf,
 		acm->ctrl_caps = h.usb_cdc_acm_descriptor->bmCapabilities;
 	if (quirks & NO_CAP_LINE)
 		acm->ctrl_caps &= ~USB_CDC_CAP_LINE;
+	if (quirks & MISSING_CAP_BRK)
+		acm->ctrl_caps |= USB_CDC_CAP_BRK;
 	acm->ctrlsize = ctrlsize;
 	acm->readsize = readsize;
 	acm->rx_buflimit = num_rx_buf;
@@ -2002,6 +2004,9 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = IGNORE_DEVICE,
 	},
 
+	/* CH343 supports CAP_BRK, but doesn't advertise it */
+	{ USB_DEVICE(0x1a86, 0x55d3), .driver_info = MISSING_CAP_BRK, },
+
 	/* control interfaces without any protocol set */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ACM,
 		USB_CDC_PROTO_NONE) },
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index 759ac15631d3e..76f73853a60b6 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -113,3 +113,4 @@ struct acm {
 #define CLEAR_HALT_CONDITIONS		BIT(5)
 #define SEND_ZERO_PACKET		BIT(6)
 #define DISABLE_ECHO			BIT(7)
+#define MISSING_CAP_BRK			BIT(8)
-- 
2.47.3

