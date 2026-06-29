Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5E346AEE1
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751101; cv=none; b=jEF9d63DbbZl1Qd69++Uv6DhcedU2rnLlwvP6bMxCBzS7LGQwvpECYB9+wFIOoED2PiaBKOvYilIxgyltjnhzB6MriRMao0bvdziYOxFG1xU4q0tsQ9dDDpaWyqhEwLhlhrc+baZa5pZU0pz1YplicAKQh9K3AMQgabe95h6eQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751101; c=relaxed/simple;
	bh=i3zSZZar9HxwTVK6RGaoT3zVJtgKjt+B4IROgo1/csQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUvmm3G/ctmIpHhgavLmEzbpfCaKm+PnCe39JNsGCF8CMeX28PZmc7FUilwl/bZ0Z2uVXdi4CMNvYo4eMxp0p+YvMMRNa5HK8fZ4pCuzgdiG1oT046NbipqD0NnPxI/yAvxAgX0/s8jOnoDBY8j695ohek1MYa/neW5x5sx6I2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkjzAvSa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkjzAvSa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso2474675e9.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751098; x=1783355898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9lVOBVu6iG7kbbsXuXzl46b4dR6osB6ORuufF+Rdaw=;
        b=hkjzAvSashYtwQRYYW+Mxg5NC9hsqBrDTotH584ob/LbqqYlrj2T4YPJkUNSFo+TXF
         kQcwThYwCkSPWEIwwvYasUEnAGdeJ2WI25aeEw+KGyy0I7QhZK7P6KYcjaBkOm8wwI0m
         MlM05M6RUu10y0gc/qXOZTEpMD7h7H6kwHI3yKdBboVoOyfPrXihTraWMKZ+g7NljWrv
         1cik6CqstDm7g8/jlx3Clnet8JJwW1SsvvzSRgFUYznAXUDvplivYKrkDbGb4E6DebRM
         J+yJBIXqraUKPUjyWB4X8ax5t2SUcCWpfbliq/uTrIYvH28+WRYJ+ryKTVTN4t7WRva9
         B5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751098; x=1783355898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9lVOBVu6iG7kbbsXuXzl46b4dR6osB6ORuufF+Rdaw=;
        b=jhdWtX/0JlPqqAGzpOv9VLbUCnSS55UP++IobpjRb9oadvnOMTav23RP8KuHjt9n95
         k+f3YJvHTb6puB2qheEEItOEy+81LbkVhTUiPX6DYzjwFbu7iq7exVAwYEODVDzecPF9
         Di2vUL1g9TcDRIFgZf25b5XuZeQwQn26lzB8GxGhmTSO6eeaImRdIrBx88Gq7XXZQzWC
         /96tTeRpDGaazlk0r/KG7ZLpxEZ1LweaT9J0v4ONwhzPhi6djM3mQJRkHl65UO0Yka3G
         KwbGii+SkLERAmryFn9ODYnoFnQLe0uZXWtPR7swlUwrcLvdKlNxA4W+BJV+FrAeRnur
         q/mA==
X-Forwarded-Encrypted: i=1; AFNElJ8FyEBEprs+dQ1MtdtKJCQavG0fCRJb+lqXrFt0kd5ioKXqlv6k5DHdaaGz8AFNv5Xmci2AS54wAUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwMBaO2xN6pkwQZo5DaCp8Ov4bRmkkeLns0/XTW4oiAAJnryI
	/knMEnJP/9atbfrP9aur82NeCLW3M0B8Lw5yFBoKlojElP5KM26eIWpA
X-Gm-Gg: AfdE7cn4nXMRxRFkIpoM6eb89lt3H37lq6gJU12duWbM59T/TP33keKy5HOEAV6P/K0
	hx4k8oqiX9m8AtXO5D+wbcDlaswaCgjZ6/rHRh22wktGCPGGOyh/neWZDPddYxjgjXmcdydu6/5
	01bK8F6At/Rc48VMU1DT62A8IiAUEaxGrZm+SHc4obFum60v7hu+sfMCfIvhVEZjfamlVtJ+23V
	3XoZbWDtKdXR1HLxqYfipN3WdnrbuUL2mgh1FHRUDIknZ+ED7EFqrGlJIaj+H0+y5hZQ5kiW2hG
	7vqlQDMfwdBPyreeNInpVRVreeTNRHVeM8ALCrIAel8xx4GFES43To/ml9szx6YijWtyQ3Zidtu
	PACqF22/VjEX5qlwrRkSykzidirO0jA1z5bHrqL3lFxnVy50spMVcFNvmnkYz/zhdPs0btO//GL
	DrKRtMwywrJbDD9Ol+HCZ4sJc9If+EwXof3SIz/iM25UQQIN5NDIUq6318//frAQcB8WgAEVxRK
	GNCyzD3gss2yUIiCQ9JYt33
X-Received: by 2002:a05:600c:5298:b0:492:40df:d49c with SMTP id 5b1f17b1804b1-493b82ac618mr7123435e9.23.1782751098355;
        Mon, 29 Jun 2026 09:38:18 -0700 (PDT)
Received: from helmholtz-coils-PC.nanosat.lab ([147.83.201.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4730937e18dsm15765501f8f.21.2026.06.29.09.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:18 -0700 (PDT)
From: =?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
Subject: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
Date: Mon, 29 Jun 2026 18:38:03 +0200
Message-ID: <20260629163805.37879-2-fernandezfernandezpol@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
References: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Logitech HD Pro Webcam C920 variant with USB ID 046d:08e5 is not
present in the device ID table and is matched only by the generic UVC
catch-all entry, receiving no device-specific quirks.

This device intermittently sends MJPEG frames at 1920x1080/30fps
without the EOI (0xFF 0xD9) End of Image marker, correctly signaling
the incomplete frame via UVC_STREAM_ERR in the UVC payload header.
Applications using strict JPEG decoders (libjpeg) display the corrupted
portion as a gray band covering the remainder of the frame. The issue
does not occur on Windows.

Two contributing factors were identified:

1. The C920 (08e5) operates at the USB 2.0 High Speed isochronous
   ceiling (wMaxPacketSize = 3x1024 = 3072 bytes, altsetting 11).
   The camera firmware has an intermittent bug where it occasionally
   fails to finalize a JPEG frame and signals this correctly via
   UVC_STREAM_ERR. No USB-level isochronous packet failures were
   observed (iso_frame_desc.status was always 0).

2. uvcvideo forces wCompQuality to the maximum value returned by
   GET_MAX during probe negotiation (61 for this device, on a
   firmware-specific scale). The camera's default value from GET_CUR
   is 0, which this firmware uses to indicate adaptive encoding mode.
   Forcing maximum quality increases encoder pressure and raises the
   frequency of UVC_STREAM_ERR events.

Add a device table entry with:
- UVC_QUIRK_RESTORE_CTRLS_ON_INIT and UVC_QUIRK_INVALID_DEVICE_SOF,
  consistent with the existing entry for the related 046d:082d variant
  of the same camera family.
- UVC_QUIRK_NO_FORCE_QUALITY to preserve wCompQuality=0 (adaptive
  mode) during probe negotiation rather than overriding it with the
  maximum value.
- UVC_QUIRK_DROP_STREAM_ERR to ensure frames flagged with
  UVC_STREAM_ERR are silently dropped rather than delivered to
  userspace as truncated JPEG data.

Tested on Linux 7.0.0 at 1920x1080 MJPEG 30fps. With this fix, 0
truncated frames were observed in 300-frame capture sequences
(previously 1-2% of frames were affected).

Signed-off-by: Pol Fernández Fernández <fernandezfernandezpol@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2729,6 +2729,18 @@
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
+	/* Logitech HD Pro Webcam C920 (variant 08e5) */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x046d,
+	  .idProduct		= 0x08e5,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
+					       | UVC_QUIRK_INVALID_DEVICE_SOF
+					       | UVC_QUIRK_NO_FORCE_QUALITY
+					       | UVC_QUIRK_DROP_STREAM_ERR) },
 	/* Chicony CNF7129 (Asus EEE 100HE) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
--
2.43.0
