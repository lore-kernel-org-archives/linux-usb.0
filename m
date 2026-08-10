Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C880637755C
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 06:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786342341; cv=none; b=CsML2MilJm4+ixjf+WTAix2f9wM72/wRKigyevqgmL/HRno8qUhk2vGTI3p6k4WVfyJeFiAEca/qXBzB5tWwFlQQFO4q4285mWS9Wf0J3w8eb+trcK7FyKnZKlHpwOu8YOdz5Zkh0Ra3aM23uYzBhWswx79a78rWTkjILpDciAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786342341; c=relaxed/simple;
	bh=CcJOyrNv/v2EaQu2FZ57TDe+Cl1Nf2GThdi/dHHT7iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bh8zkS2kOdQpm9ZNa1reIt7w3pSnNgMDbLiTHZ19JhqSS8mUgBWfl8ufFWLCDCZ4PeEoEMMZ19quXDnOANidZPnRmDdDMDoi9EQotavkeWPy9dDYj9YPVSJcxMV8o66l6H/imARA2qhXmZC0hCmgOdAiWBteKEXhWqwgMx/BnyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbVndAh7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbVndAh7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so11900225e9.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 23:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786342338; x=1786947138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5NO9iuQibAOt2y4Xoj9Oz8+6b5gn3Kh/p2fleGsaSw=;
        b=NbVndAh74JFeCydI305fCTbXcqcwcwN8EcH6NcHYLjIK1limQssHZ4ir4u1cHVahMB
         AOg/kQSQ1avDkQgtS93tG9Nz5F9WusPqegDo2RrFzLtvYZVA6kHO/p4OF/Zg/MeOoba6
         U0VPnoZVe9u419KtIXDqHAnAEMFLl2TZDUih8O4gS3dn9mtHq2yl0ejD4KDzjY9R1XgL
         klxcV7Mwqu48bEzdiuqNDuGY1O1n303SEJhKYitVQ5od7XkmvPb7xOH22OB4tYSVbb58
         wMxqx6/LfJ66Xemp+eudiWMmKxdzWvR9L74A1Q5xskAmi+56wlDpy8NNorpld1a+CqZz
         K51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786342338; x=1786947138;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F5NO9iuQibAOt2y4Xoj9Oz8+6b5gn3Kh/p2fleGsaSw=;
        b=Bwb5MJHp6ppBpQG4AhFBjdsKqnNzjWBZqKILj8WnOOX4Rz9FyVV6exJnx1o/EIMr1i
         RE4IsGbS+/HRzCPb9mWPxdn/J7KHqC3fHfTiSKeLUlmgn17gMLfWbBVwZmqm1ZvCkeg4
         Fhhn6P6rC2hCVmmtis2ANm+DpMBCOHsGVBAXL9VpoJ30GwgsJmyKv6qPLaPiY2Mhsi+c
         1GaINJfn4q0UmiGpEnSyvrKswAdUB5hA8/Pkeqn+WXRGqwJTc7xzLSfCsM0GUeDDYt5a
         Vu4f3BpRRNmeDpkjWgJgunwKtZhLiD7z5YRX6l7sSsos2RXlD9Y97jrc2bjJvKOMjm/v
         SzZg==
X-Forwarded-Encrypted: i=1; AHgh+RpVPwvttFprd1cNFozy4r9ZIM/UjkKXU9NTDvtj//7jrzLjY3BDj/Wqndg793pYVRHFPE/wy8mBV24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5rBUqJLW+w6zFHj8ZQYVFLFp+EzFtwEtabCG6q2UAJ92LOYL
	2k4WJkE2OSRyjXcUKGp7KwRq2xtlLgIJB0kDiQ+2H3NS/IzLT341kJHGiipuGg==
X-Gm-Gg: AR+sD12Qt3JB3QKrDL6doMK2lPSMhI3z4qVKDWY8akioW3tfWG7d1UPX8cFPDobS24M
	4aCsFqaK/nerV4PLjeCM44FHGo6c/N7aTP1Tv44q19Sa2ntBkRUstNMAtGyTDaTfSB9BuNPNbdx
	j/lZoIV84diLOB+agsPwVYvX0t2COzQ1p9kc7PltmX/3uM6svDLtqhACR/BwTYh1DZGvQnMpox6
	6u/SOIVB3s8AJTBVeqC2awECz4R1BdIXvqZ+VxQrtDAarI5yC8ynh5GtHEy/HM10Kcx1ja53ByK
	fdRKs7Orgc38gK0PW25Vc4jiJ/BdIj7t3+tXAzqykXoIRmzuLYE8HPiGU1TWkwmEfzI4EVJkUPy
	QRcsZLXp4H5c8DKJnu3D48P+u6USfskK6aXk0zhE1dgfuHozc+jRPdwCgF0YhnWuf9hHxqNOF0s
	hRzsAcKNYu8h7cEWZnPDR3MkbYZyt4mgwivVAoo4CuotSMhFLUvFu6BEd5/hp8eV+UfyKVyQoO
X-Received: by 2002:a05:600c:1d23:b0:499:51b8:d649 with SMTP id 5b1f17b1804b1-49951b8d652mr455964575e9.3.1786342337792;
        Sun, 09 Aug 2026 23:12:17 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420c68fsm356032505e9.1.2026.08.09.23.12.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Aug 2026 23:12:17 -0700 (PDT)
Date: Mon, 10 Aug 2026 08:12:12 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: Remove unused SuperSpeed EP0 maxpacket handling
Message-ID: <20260810081212.59877d78.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

512 is the only control endpoint max packet size defined by USB 3,
encoded logarithmically as 9 in the 8-bit bMaxPacketSize0 field.

Up to v6.5 in 2023, core assumed 512 and ignored the descriptor,
but now it tries to decode and use it. One (emulated) device was
found to specify 8, see commit c78c3644b772 ("usb: Fix regression
caused by invalid ep0 maxpacket in virtual SuperSpeed device").

Thankfully, xhci_setup_addressable_virt_dev() always initializes
EP 0 packet size to 512 and xhci_check_[ep0]_maxpacket() has never
been called on SuperSpeed endpoints, which means that none of this
has any effect and 512 works for all devices ever supported. The
regression was caused by core refusing to enumerate bogus devices.

Drop pointless calculations and correct misleading logs, because
we don't actually use out of spec packet sizes. Moreover, some HCs
(NEC/Renesas, old AMD) reject them, though others don't and there
is some effect - enumeration fails with -EOVERFLOW or -EPROTO.

But those effects are only seen when patching xhci-hcd; altering
ep0.desc does nothing, even after the usb_ep0_reinit() call.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

By the way, xhci-hcd only updates max packet size at full-speed,
which means that the high-speed workaround doesn't work either.

Renesas does accept high-speed overrides, this time Etron doesn't.

Whether any of that works correctly with actual devices with unusual
packet size, and whether they really need a workaround (unlikely if
all their descriptors are shorter than bMaxPacketSize0) is unknown.

 drivers/usb/core/hub.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..d9409943f388 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5143,22 +5143,14 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 
 	/*
 	 * Check the ep0 maxpacket guess and correct it if necessary.
-	 * maxp0 is the value stored in the device descriptor;
-	 * i is the value it encodes (logarithmic for SuperSpeed or greater).
 	 */
 	i = maxp0;
-	if (udev->speed >= USB_SPEED_SUPER) {
-		if (maxp0 <= 16)
-			i = 1 << maxp0;
-		else
-			i = 0;		/* Invalid */
-	}
 	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
 		;	/* Initial ep0 maxpacket guess is right */
-	} else if (((udev->speed == USB_SPEED_FULL ||
-				udev->speed == USB_SPEED_HIGH) &&
-			(i == 8 || i == 16 || i == 32 || i == 64)) ||
-			(udev->speed >= USB_SPEED_SUPER && i > 0)) {
+	} else if (udev->speed >= USB_SPEED_SUPER && i == 9) {
+		;	/* Logarithmic encoding of 512 */
+	} else if ((udev->speed == USB_SPEED_FULL || udev->speed == USB_SPEED_HIGH)
+			&& (i == 8 || i == 16 || i == 32 || i == 64)) {
 		/* Initial guess is wrong; use the descriptor's value */
 		if (udev->speed == USB_SPEED_FULL)
 			dev_dbg(&udev->dev, "ep0 maxpacket = %d\n", i);
@@ -5169,8 +5161,11 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 	} else {
 		/* Initial guess is wrong and descriptor's value is invalid */
 		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d\n", maxp0);
-		retval = -EMSGSIZE;
-		goto fail;
+		if (udev->speed < USB_SPEED_SUPER) {
+			retval = -EMSGSIZE;
+			goto fail;
+		}
+		/* else: bogus USB 3.0 descriptors exist, we use 512 anyway */
 	}
 
 	descr = usb_get_device_descriptor(udev);
-- 
2.48.1
