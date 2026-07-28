Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D52D5A01
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 19:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268338; cv=none; b=EK7ZfgZM2rJM3xdQfC7/Fq53u/5F6PfFkSWrdQD5b2j7TM+UgM2lt8wvedFYdo/SvjQNbE8lBf+vMJl5DTp+43nu1qIfY3T5yjv+l6Qva47X10FNltLt17/A95NjexwlDr25B/SSLPm+znui3FNJWsz40ZWAq+sjXUcMnoqhuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268338; c=relaxed/simple;
	bh=zr85cf5OM4ACF/oZP+D0He7J6hHB3ill7heyRNrcFAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZ6O31iXsaB4EzDNy9whZLLNVFp5ZP1UQ6DGSKdwWt46+PNtgGrE5hABY4XkzFK9GLxhAnXvhSfq2j0FZOlgiqxY/A2Vtq5aEWOUV0ZVobo6gwKc166bROExTBHY1tP09MvSsr9FqwvvbzdHdiTqpETQMb922UwqufYD0nTQPRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8aQ+5NU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8aQ+5NU"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso249866a91.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785268337; x=1785873137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K777BRooUawVspr/rUZWKDKbuSCg0hJqOA2h4aegueE=;
        b=r8aQ+5NUNsLqkdzeqQYTySi6Snbb7U2y/iHAMEhZYLdX78XlyLkDDZhw8K21HUgrCF
         EJdwj3L1LnlnsmECojQP82yhRTBlS8b12rQ/kiZCY65QAWFNz5c1AcF1iO7aAtyRI/W1
         iJjJVbvaI8WgHhuurqo5oAMz7QujIo00jcd02p769NDGDAJ7lzL8J7BQyZyTejgLa66+
         u1PNCsBqCT7YFbqTemc3zC9atIJsk/WLnwnJEJa6DaNpYuHoH4CAy59PAVUEer+57Ed7
         fQshJxtQgUgJxVNcB9ZJ43eZbN4Q5A9IYoB6N0nBIW3bPAJwqn/GWvHqN53IsTcQD1Zr
         hZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268337; x=1785873137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K777BRooUawVspr/rUZWKDKbuSCg0hJqOA2h4aegueE=;
        b=ie0T7aBfp6V7nFXlkm6sKMRsIFu4Bi5AFH6wzgdlnfR3MwyOGO+OL1b24e6aW2UTvw
         kAHdNTcgGJxwjjUuGCSKP6fQmLOwBKt0DrDuwSB80s4e/6amACWquR0c43LeW5N7ilxG
         6n9w9n/9u3spchK0FTWBW9SjFmIeeqsU7V9of18nzuw/Q0B78kA2LsZWHw2fd7VcELy4
         Wy8JkBbZeWhNpSndPQMkdBTThcOqyGhef/QSZXAMiUxSM926gJO3S2E3J/k1whDyQI0V
         tmEWRIIjm4fseTIol/2ouOvEoWNrRSQ5oiaXi5En6zaTpB5L+HSzTHITfpiMea8GPfQP
         L2TA==
X-Gm-Message-State: AOJu0YwZmE7Mm7315DYhBku2JsOrD3zWkysUjy5+EMR+49byr0DtZtYK
	gz/ABkA2yL90HF8HVsWMN2+dw2Rdt8+DKd+VvABc85oLZOsfiHJWClU6ZcoD0x/S
X-Gm-Gg: AR+sD11H9JZtCWea7TbjA1QimuwA5qXbrro8dphbYCh0GwNx/3e7ptacd4MBUFN0Lmr
	V59skP+qPd1QxdrGJE0vLuRT3SNpmze0BkdP9/x+2PFwKkIYVlR6zIcUOO/Z9hmWHzyTvHdMDcq
	ZgnPHfCNQb2jAdbUKdfrIVOeIxqPe1keZt/vrI4XfJx4A6EG6qyiNmGGVP/Kjdvbdj0X44NVu9O
	R5slsfa+PzBmfbB0lLQhy39cKRWeK1bRzA0e0YExNmWAtSE4RrF5qNvHmAFKaJ1E/tXSiCDtNji
	RzhVXNrJAa7MRSsUzCNfeV4AbAj4AF0JfASyBTDHlnp/bs/zN02t5jX7h3IyieWPpAGmpUDXvw9
	ZIhmsv5VsCfS0qRPQRPnux0IPdoQWAvXhW/GVj0lLY8nrwDMzWijkj2PT3vNHjeD+05po9tEtO+
	bGm1E+dX7FUg4ehm5NB5FbNNOODp1EUumYZ2OeVLaQOCV/Nwk8rR+pRk3tQUh23u+ZUA==
X-Received: by 2002:a17:90b:448c:b0:38e:a205:c84b with SMTP id 98e67ed59e1d1-38f6a4e2d36mr3992072a91.28.1785268336559;
        Tue, 28 Jul 2026 12:52:16 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3250asm1448051eec.20.2026.07.28.12.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:52:16 -0700 (PDT)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-doc@vger.kernel.org,
	ishaan.dandekar@gmail.com,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v5 2/2] usb: hub: Split announce_device() to log device identity before enumeration
Date: Wed, 29 Jul 2026 01:21:58 +0530
Message-ID: <20260728195158.65162-3-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
References: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

announce_device() currently logs the device VID:PID and string
descriptors only after successful enumeration. This means that if
enumeration fails, no identifying information about the device appears
in the kernel log, making it difficult to diagnose failures.

Split announce_device() into announce_device_ids(), which logs the
VID:PID and bcdDevice immediately after the device descriptor is read,
and announce_device_strings(), which logs the product, manufacturer,
and serial number strings after successful enumeration. This ensures
that a device's identity is always visible in the log regardless of
whether enumeration succeeds or fails.

Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
---
 drivers/usb/core/hub.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..d92bf887739d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2401,7 +2401,7 @@ static void show_string(struct usb_device *udev, char *id, char *string)
 	dev_info(&udev->dev, "%s: %s\n", id, string);
 }
 
-static void announce_device(struct usb_device *udev)
+static void announce_device_ids(struct usb_device *udev)
 {
 	u16 bcdDevice = le16_to_cpu(udev->descriptor.bcdDevice);
 
@@ -2410,6 +2410,10 @@ static void announce_device(struct usb_device *udev)
 		le16_to_cpu(udev->descriptor.idVendor),
 		le16_to_cpu(udev->descriptor.idProduct),
 		bcdDevice >> 8, bcdDevice & 0xff);
+}
+
+static void announce_device_strings(struct usb_device *udev)
+{
 	dev_info(&udev->dev,
 		"New USB device strings: Mfr=%d, Product=%d, SerialNumber=%d\n",
 		udev->descriptor.iManufacturer,
@@ -2420,7 +2424,8 @@ static void announce_device(struct usb_device *udev)
 	show_string(udev, "SerialNumber", udev->serial);
 }
 #else
-static inline void announce_device(struct usb_device *udev) { }
+static inline void announce_device_ids(struct usb_device *udev) { }
+static inline void announce_device_strings(struct usb_device *udev) { }
 #endif
 
 
@@ -2651,6 +2656,9 @@ int usb_new_device(struct usb_device *udev)
 		device_init_wakeup(&udev->dev, 0);
 	}
 
+	/* Announce the device identity */
+	announce_device_ids(udev);
+
 	/* Tell the runtime-PM framework the device is active */
 	pm_runtime_set_active(&udev->dev);
 	pm_runtime_get_noresume(&udev->dev);
@@ -2672,8 +2680,8 @@ int usb_new_device(struct usb_device *udev)
 	udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
 			(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
 
-	/* Tell the world! */
-	announce_device(udev);
+	/* Announce the device's product, manufacturer and serial number */
+	announce_device_strings(udev);
 
 	if (udev->serial)
 		add_device_randomness(udev->serial, strlen(udev->serial));
-- 
2.54.0

