Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E2C45BD57
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751097; cv=none; b=gOhSrWDXF6fMTivcqQZUCAfe/wzjJRErTo8Xu3h9oTxUW12emKg6vegm4NMPMj2B+8ilNdjEG6FwmQMLE9AQ5pbn9STUF+nvVwXj4SFKfK1CKfjZ2Ymi08w0hMWt/A2br2n7kXlZ7WsCyKzGHzqFE6jwDWpyFX0AFeXhm1tI3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751097; c=relaxed/simple;
	bh=xS9HXkHQt65kbdNX3PEY/ixQR504OdS8n7/Y+5xz3o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TavYiWz5mF47yba/Um9X4Z3vf8A6Q4LyJmiawXCpiQeVqhViQAN+HBf2n4QMZYztMBWL5gDp+RsqNugoIkyn57ZEMcOc+kXoC5puI26v7jcUamO3dQ0OLvJInRiHo+PfkwiHd7PVQUWZNe5YL2Cw82KlRrL554av78j5PNc+W2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjcx7ts/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjcx7ts/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4938d60c035so19774835e9.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751094; x=1783355894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+CxHy0SCXrpnemjCBAKhWexIpJlnOyaJVCHp2VG4Pg=;
        b=Zjcx7ts/EqreYudtfUHjHxJZm3wGEJempZOrTfWAC5WIW9tNOgwWLeiwJhSMs4sT9e
         j4S+lVmQLH6p51/oWstbQb78KFaGYO87aP1o0x6GOj8OcaJMUcPJ505qd1ucDaV4A8u+
         rge841X0wBv8a3UMIEfwBI6G/oQdaXOTT8agLQ5X8ZjGBr9/9VmgpUDq6NMQkeunZMdx
         BjZrPPIyJUJYAsUKmAwprgZROcAwtL3EvDF24Vi8aN8MMasNCot1+wN5rWIPoapG+am6
         XN/6fh2N6TjjIj1LDTKhE2WZsGy8M8541H4f6ChtMtO3bRdkQk9JA/kRNgP1mIu1zl0d
         8UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751094; x=1783355894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+CxHy0SCXrpnemjCBAKhWexIpJlnOyaJVCHp2VG4Pg=;
        b=GqI2P94QYgLG0tQcFHUfakt4eFJo7JBLqxj1IgOD0+NtbRpFPp7jPeILW7UuJIJtcM
         gu9gqXZBPikKkBhGdANYY2uJ9xuWxJ1GsCAsunri65j9Ov+2JGpf3YLSngU2Nq+H/hQA
         1KRhxgoFMQAC/O6WkURkOjRHhhcz+TS9SmOg7lp7mboN1ZhcCBzU2uVu+ujb/UWukuW2
         WY+pSPxvCpywkE8rAk4D3jqhfX8yhMGy4xIEOoZsgTZTfhkXyDdXEXnE4qiKn5E3oVZE
         ayipbiX58yTSNtR0Eln+JqLWl4ZOcAKiDYF6u+kZAczkp9asKWOdhSY+1KApmjCXF20H
         qqEw==
X-Forwarded-Encrypted: i=1; AFNElJ9MOmaEs8go8acclVcnp4tmtXFFTmcRZLVA1Z1dt+7F9OdrY5E2ksie+v8whQxjmBVrgLd08NqHdWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/7Q7edzUMvn50AUbvIuw0/RqAZ7p/maLonJVT0sunIsZfi3N+
	ajCpBpzWMRVBYys9BbFRRt8ejVsI3xF1DwW7vXUngrl3zvxgcb7wBpyF
X-Gm-Gg: AfdE7cm7lX6c9dJw5Oc38EHP3LPgrscl1f31LSEHXNNdNGKmTmsDMPXbTKo/AMUmcih
	QzOnMlmjQPaA/L50Ybhjwafgj/UiIXDKUhWNMZGBy71J2f0DbrE2YC4LJj6Ev961iX7W/kINbmP
	skesbLBy4BLXDjFEFxUS0VpUr4rSTDPp04us+bIKsH8nyHbHWQP+2CMJGPnodZaollFeEupJLqn
	AxUGqqbD9as3KAonOsO4Py/x8Y4GZqim+Ye7JgRRFs6bFZBDS63toGep2q2jYDltuN2CvbZ4wwf
	89swKxclq/1pr7qgpr9WgdYt/hTVdCXrXXWF15knkVxsJowRJToxjJ1ve3HIbq45Qu2DgjipNXK
	fV0GUIiI2TE4zxIo1iNsGbtOrCc2fEGkbm7qZmHtUv+/y6Qt3KBePYiZ6+vSYcOalPXHdOE9ZFy
	90eQJnBlGa5+oFN6KoCWMkTHN6Z6LgQAVE/EhEDw4MuIQsrsT43XKzkY3XLFBbInLDDrSmzIwO8
	FYz9AE/6kdPJXhf17MYnbIm
X-Received: by 2002:a05:600c:800f:b0:493:b243:900f with SMTP id 5b1f17b1804b1-493b8281619mr6983255e9.1.1782751093660;
        Mon, 29 Jun 2026 09:38:13 -0700 (PDT)
Received: from helmholtz-coils-PC.nanosat.lab ([147.83.201.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4730937e18dsm15765501f8f.21.2026.06.29.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:13 -0700 (PDT)
From: =?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
Subject: [PATCH 1/2] media: uvcvideo: add quirks for per-device stream error handling
Date: Mon, 29 Jun 2026 18:38:02 +0200
Message-ID: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The UVC_STREAM_ERR bit in the payload header signals that the device
could not deliver a frame correctly. By default, uvcvideo delivers
these frames to userspace with V4L2_BUF_FLAG_ERROR when uvc_no_drop_param
is set (the default). Applications that rely on strict JPEG decoders
(e.g. libjpeg) will display gray bands for the incomplete portion of
the image, since libjpeg fills undecodable MCU rows with a neutral gray
when the EOI marker is missing.

Add UVC_QUIRK_DROP_STREAM_ERR to force-drop frames flagged with
UVC_STREAM_ERR for specific devices, regardless of the uvc_no_drop_param
module parameter. This ensures applications never receive truncated frames
from devices known to set UVC_STREAM_ERR on genuine encoding errors.
The existing uvc_queue_to_stream() helper is used to reach the device
quirks from within uvc_queue_buffer_complete().

Additionally, uvcvideo unconditionally overrides the camera's probed
wCompQuality with the maximum value returned by GET_MAX. For devices
whose firmware treats wCompQuality=0 as an adaptive encoding mode (where
the encoder adjusts quality dynamically to fit within the available USB
bandwidth), this override increases encoding pressure and can contribute
to UVC_STREAM_ERR events. Add UVC_QUIRK_NO_FORCE_QUALITY to preserve
the camera's default quality value during probe negotiation.

Signed-off-by: Pol Fernández Fernández <fernandezfernandezpol@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 3 ++-
 drivers/media/usb/uvc/uvc_video.c | 3 ++-
 drivers/media/usb/uvc/uvcvideo.h  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,8 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_DROP_STREAM_ERR	0x00080000
+#define UVC_QUIRK_NO_FORCE_QUALITY	0x00100000

 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -451,7 +451,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
 		if (ret < 0)
 			goto done;

-		probe->wCompQuality = probe_max.wCompQuality;
+		if (!(stream->dev->quirks & UVC_QUIRK_NO_FORCE_QUALITY))
+			probe->wCompQuality = probe_max.wCompQuality;
 	}

 	for (i = 0; i < 2; ++i) {
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -357,7 +357,8 @@ static void uvc_queue_buffer_complete(struct kref *ref)
 	struct vb2_buffer *vb = &buf->buf.vb2_buf;
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);

-	if (buf->error && !uvc_no_drop_param) {
+	if (buf->error && (!uvc_no_drop_param ||
+	    (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STREAM_ERR))) {
 		uvc_queue_buffer_requeue(queue, buf);
 		return;
 	}
--
2.43.0
