Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211643;
	b=zW6oUegaGAO4WTlrUOAKTILymptv0IiYE8NWjXP55lPJYLPhw3EXHSwRDTFRpW8L7rMA
	 t3Au0qNsXU4zMQCpnqM5WO6o5zCySqCa6M6JQpdIl1bUGvDFkJKI+lIAGPY9TS8L1yWPr
	 JpxZdmsYLxINJyy3ijdlh4TNV/agacgJ6V5FMLVwSsO+8FGaKn0wk8EkettXkpAssrebT
	 YsedU7hQtmBXN0Qa6X0OflvAvD5OqLtOyO6G5M7gFv0KZQwcx0e31bGy3Jtq1l1kUKXVG
	 qFwb1p8PlhQHPLaFTgxKeKvHS7ipOiSZJwKf6hCiNHH9wKws6/1KpNGBqo8b9dNT8Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6x6fgyAlJqM49AqIyoOgU3UAexNdlGD8YfKYTMNmscM=;
	b=vI83ip/9oly0aq5BpY+acnhdkx5g+JdWo5/djKQrAKvNFYyxM85e2PSQaLiIerJ327A3
	 8SRAjMY6mTbbPABQRh8JhI22Ot2Alw6Mpd4iUHwh0JiyBSjaW62NGTPXcYpuW6Mpq9Xl9
	 +BOFbyM2gEcsWkMdZ2RnthpDOawvwGMmpAAw6A7kuXDC6R48VqE4gBGFTFEBJRydLxjiT
	 20jP8/hcMrDarEfLBQr3uBQbG8E7msfwWc9Idp4XQj89nAYsUgZ2fKp+zselEYSjZwJni
	 UMEvemzXLNfQxVN7xuGxzvnjg6yxQWqSZo31ZufB5y0Q6Fh4pz8n4MTogAmnUN2tOFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqpDIeCE;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B3D606A6A8
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 21:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B3D606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BqpDIeCE
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so774608f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 13:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795211640; x=1795816440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6x6fgyAlJqM49AqIyoOgU3UAexNdlGD8YfKYTMNmscM=;
        b=BqpDIeCERNktYKYjNDgX/EYDqBUmsg7kUIFDT7jLAD5p9xH4WAKa536UymHCyJDeJL
         MClfUucTS/5PPj7iTOYmYrfbeFm9ja9P+2BNg1tMCANvbO1GON3Mo6LlGFdHUcfkKw7n
         7Bp8ccSAjUtYjhu7xUYMFUs7vV7hM6eQEqk/FjCiKfl46KzH4sTRQnyHBS+momYVEcI2
         CyIrhWYTtrW5RzwApBrfm6Gug86lYjVXvKb2g8v3+KnAe0DXptD+0VmEZV4aKOY6l/ha
         BaW+9Dbeat5hs8i4TuwjDFf9cRnl7hufkvbUgch+aYBfPXyAEAV9urCV6X4P3lwWA0FT
         Unxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211640; x=1795816440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6x6fgyAlJqM49AqIyoOgU3UAexNdlGD8YfKYTMNmscM=;
        b=dI+wjAtEH9UrdaBb85OyM2BhG4X4UP7zq5Hmfu1mpkM3THbel0MOFSdpbun1qa0PP9
         0AnbglF06mnxjFUeKT/VggWIetZqKN6b3GnE6Zu/UFXW4cWzoeFuB+INc0qiFHNFQ5rK
         IYiGWHvIeDx2eKu2Lw4TPGgMyr2r8CsD5B6xz0NY5rZq+c4hY2mnvm98+Ptz4iYVWo0U
         QsCcq/TMQPvHAZu4kSPkBjloWHPFkyCMHlVnsspHdGCRBybEEcMpXTqNdZVIjYFLL5VS
         s6/CZkZCnGM23FxCOsu+V31WoVjJ7MYbYKmbUgzlDd3WYFkO+SKulVoXvvK9futtgwYs
         ZV0A==
X-Gm-Message-State: APuU4Z/GZbJ0maJf6CpyahFBV8tPd1T00ljEGOB/vLs26oxSuYWoQQ8D
	fGK0qSlfBrwBAfTakZz7C7XzA8lV5oTquYL+p4aAb45maNnPvHSQ9GLVE/PS
X-Gm-Gg: AZFdTZfab8GnJsnhMDj7KQtHo+iGDbSGm5BpvbzlcJu74WbHCs4IsefmU12Jcv952e/
	3AIbgtYWCUqyRsTDXNkh3JrHGXgc/Pi3XF9wP39Lq9Cfvk0Ng8UzA2rN7pMkWXo9oMnXF/pUWYz
	QUYIy84Zm+XO6E8julfk6wUE8mGrc5gUr0zc/uidcshD8mTpXUJWq22QFfrUsMYUYy8gCBsNL0C
	fg/dSvCTTOHHd6oO5Dt7I8JZ9iG2cJlnkcWCHghjQYlf9FB7yZ/VUsfJ/r+p/N6h3GFKMknJpzi
	+JRPOYK9i2Al5SDg39jx/syh+BQa1duul4XfOmWjk7PvMUPmQ8PhspEvLn/mFcefPdiGcR2qhqn
	ICsjZzY5i2gwJcyyrVSlVuplDslWkvIoGO4ptGwqV/CA6u+nWEKfTY1+P1VAUIOhCXwZAM9geBZ
	1AtcpKBuWh+TOHGvQd9/z696Q6amF7+8PuZ0z3txCuT3WvC0xb6rX1/1PCrgbYO+gWsQr+NlQvz
	aRxF5ZtzL9+hwkrcCtNSiWvaNxjj4GMtXcbP9vSKTZLW2nYwO1KfHIhzVYRKgY7UFwGbkBUkkfT
	jReNi2cCKDC8bjBIaCn3+D3P9FP3
X-Received: by 2002:a05:6000:29d2:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-4abb400ba02mr6847122f8f.48.1795211639999;
        Fri, 20 Nov 2026 13:53:59 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm7862301f8f.56.2026.11.20.13.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:53:59 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v5] usb: gadget: f_uac1_legacy: fix copy_buf lifetime on queue handoff and free
Date: Fri, 20 Nov 2026 21:53:50 +0000
Message-ID: <20261120215351.64406-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

f_audio_free() tears down the f_audio structure without cancelling
playback_work or releasing audio buffers.  The pending work can access
the freed structure, and queued audio buffers leak.

Additionally, f_audio_set_alt() and f_audio_out_ep_complete() transfer
copy_buf to play_queue without clearing audio->copy_buf.  When
playback_work later consumes the buffer from the queue, audio->copy_buf
becomes a stale reference.

Furthermore, f_audio_buffer_alloc() returns ERR_PTR on failure, and
f_audio_set_alt() stores that directly in audio->copy_buf, leaving an
invalid pointer in the struct field.

Clear audio->copy_buf to NULL in the alloc error path, and when its
buffer is queued to play_queue, so the pointer reliably reflects
ownership.  In f_audio_free(), cancel playback_work, drain the
play_queue, and free copy_buf when it was not queued.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes in v5:
- Fix the root cause of IS_ERR_OR_NULL: clear audio->copy_buf to NULL
  in the f_audio_set_alt() alloc error path so an ERR_PTR is never
  left in the struct field, as pointed out by Greg Kroah-Hartman
- Drop the linux/err.h include now that IS_ERR_OR_NULL is no longer used
  in f_audio_free()
- Use a plain NULL check for copy_buf in f_audio_free() since
  audio->copy_buf can now only be NULL or a valid pointer

Changes in v4:
- Fix the root cause of the stale copy_buf reference: clear
  audio->copy_buf at the two sites that transfer ownership to
  play_queue (f_audio_out_ep_complete inside the spinlock, and
  f_audio_set_alt alt 0) so playback_work consuming the buffer
  can no longer leave a stale pointer (sashiko-bot)
- Simplify f_audio_free drain: no buf == copy_buf comparison
  needed since copy_buf is now reliably NULL when its buffer
  is on the queue

Changes in v3:
- Guard copy_buf free with IS_ERR_OR_NULL because
  f_audio_buffer_alloc() returns ERR_PTR on failure (sashiko-bot)

Changes in v2:
- Added play_queue drain and copy_buf free (sashiko-bot)

 drivers/usb/gadget/function/f_uac1_legacy.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..b541002d2500a 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -338,6 +338,7 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
 	if (audio_buf_size - copy_buf->actual < req->actual) {
 		spin_lock_irq(&audio->lock);
 		list_add_tail(&copy_buf->list, &audio->play_queue);
+		audio->copy_buf = NULL;
 		spin_unlock_irq(&audio->lock);
 		schedule_work(&audio->playback_work);
 		copy_buf = f_audio_buffer_alloc(audio_buf_size);
@@ -636,8 +637,10 @@ static int f_audio_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 
 			usb_ep_enable(out_ep);
 			audio->copy_buf = f_audio_buffer_alloc(audio_buf_size);
-			if (IS_ERR(audio->copy_buf))
+			if (IS_ERR(audio->copy_buf)) {
+				audio->copy_buf = NULL;
 				return -ENOMEM;
+			}
 
 			/*
 			 * allocate a bunch of read buffers
@@ -670,6 +673,7 @@ static int f_audio_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			if (copy_buf) {
 				list_add_tail(&copy_buf->list,
 						&audio->play_queue);
+				audio->copy_buf = NULL;
 				schedule_work(&audio->playback_work);
 			}
 		}
@@ -942,6 +946,15 @@ static void f_audio_free(struct usb_function *f)
 {
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
+	struct f_audio_buf *buf, *tmp;
+
+	cancel_work_sync(&audio->playback_work);
+	list_for_each_entry_safe(buf, tmp, &audio->play_queue, list) {
+		list_del(&buf->list);
+		f_audio_buffer_free(buf);
+	}
+	if (audio->copy_buf)
+		f_audio_buffer_free(audio->copy_buf);
 
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
-- 
2.47.3

