Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479648;
	b=2Xqakc4vX6uoHvsFD37p0cfcY42MXBEzl6pfTpFuwM3do2hcSS0Rr2MAgxl6vTPn4m2q
	 qPcjAyMYwTcjoGUvhSjS+YPWK6Wa5doDhqX2zQAMoXzfQd0F+O94GHlOgh4Vn1bfHmLJi
	 vHKpVpfvPXwzjjJQXzP47707JfO4jrKd6m5Utxziy0D7zNCkWtzcvawgXV2uc5bkO2OIM
	 Xy5XfkwrwBnHYWmcOHEGpx8lrsauXFq5eqpIdFxr/TUYTcHJqjXSA16fQ4xhqFKq2uO09
	 PQRtJHi55OQkUR1+FSHrc9mmyr09ag7WPxpWhv8GXAdaEdVZRlsX5laVNPSuII2fhEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
	b=CxKosiR2hji+smEkHNj2nZgic/+b6Iu2MbVA+m9eGX80CC/LA8pzmCZxQKHczWKEE/5E
	 aZMPJ4monfnSYbr9uSA/VJMl2et64l7R3eJZPL9jkI0IfRkrNs5KNbbIzhQlYaeqxB6fv
	 TGHj3E5qyC+45SmhgtN+pY/uuHjnf10H4hX0WdP9EaJ1nK6UlvRyf9Yf5RrJk6OJeU23t
	 4n6aXWH1nzl8+Y+Pdv7/bhZemImalwBMD3N0BTutI42d12NSw/hRLoR+kpnaAfDs7ttFy
	 8N+yElDH7Q4Tz7M68fhQFZOonsMosrLVuXZv3z9eeCjtsdzsToK+X8EqsXptRHmcZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UC+LJti3;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3FE606A31D
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 20:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UC+LJti3
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so13482345e9.0
        for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793479646; x=1794084446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
        b=UC+LJti3Yv47rlpsQtHWSUfnCSQ7T09uTWdO9TVT1rB2t2tdyw0SWFQ3j2d+ZVrwve
         4r0z4s9Fx0oXKO6rVnZgEcoywRiNHsuirCmGjU+qyd/vGbHa5WR+WbjGLiOm2+cLJ9/l
         gZUhrUw1iE+VasqZ8qabyUDE3xLwiEyw4CNY38lU/K2KhtgI/l+ZS98pDDWarhGLSCPz
         Y1p+u+oQuA2T5Uwv3+1rXrvhvV5ZDVAO1j+VB1NgIYFSIaSa2fOTqh+Up5yNdCTb6vGr
         fu1dIeM9gZ2PQ2cZiLI/FAg2xDaJ78VNKPK/a5kTx7smUBYQgZLGeMDPCXzSktEaq9Lc
         hANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479646; x=1794084446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
        b=QsuKVpYjFJyacEufspoeUYQBuWJnJg7Svy7J17UtRIIBe6RLl+JBUI9hqnNE1hs0lm
         19LwHiH00/x4cGKxDMa++gawhl+HZS6OyyYAgzcdrXhdNb/Wl9Wf4aDp8cNo4znpM1kh
         A5luWXSvwfE6rjAHDzDQKqGlGLgs6zSTRYP6ETjdPitYj0Mknmut7L4vUHexjMxajI3R
         wenwPfbB8R7STKJlSLU48pyE/YanvoSCUd42vRSinU3aiH8RR27A+AQVG7Co/W8d95bO
         6JDUlhYjeaaQFd0Xhqt+rq8gbZrIQXqLQqTixM42SFdvwYLhW5ZlNzNOMrFqgu6F4fr2
         nOSw==
X-Gm-Message-State: AFq9FYLtNa065Omxleje1I9woxDO+PKMKCyhJ5rM8reGMXvBmMRugElb
	rlKFXJ5Iv14Dd8QYQ9v9O/ndqxn4pLByGh2qhZVV+/pOgf4M4+73kV4o
X-Gm-Gg: AYBFou0L8I7w2UjegRPdqe5n1pgb0wuE8nrf/giPavI2TLfPaDXl5S2297plbWghmNT
	lYAeIStXILkte7cj0clA/4yhd2culBL5HhSkyIbq4dJmoZ5X98OCQKqBy3zyFMzfij5hkxrqgNy
	Sz07zcwPiY/8JRlUEb3HFnf4lYa7ZFbQ3h8QbGy3SMrMPHpO8/DLD9Q6fNpW0YNH09j+L1Mk5QC
	ZgLCp4MaprYRqQDergJFU0nYJvaZWhjdLOfslIcB6ewV5TjXuRPjcgXwlx2fV7EYZbvp5WJLwQI
	8lQoE6vrdJl/rBb53uzTiVn9SpEb/tjQk21ZEvFsQEasp6zPIV4kPtuMZBzvzW6X1X57i4pMfu5
	E6uxd1y38dwHnha9vUr3ZAbdv8RwpOQCR7t+zTSgChfG640iV7vTkx/qYBeZXfgCrU1Ov/NuUJG
	9b203ouSLYe4P2tKPrCbGTiD6qjsBjw48SFDXo5Awav1ImanhYDjbZYtki/xZnfmk9aN6F4qYbn
	0N5KCJeP3YPoEOiADZB3tizXPmNfVU2R4nhzDHN2UckGpcfQg2cltc5gFTrlgcgZxP0x3bJxSAp
	PE8Gk2s4a+vGwFdqvH47l5otW5jKWJhjEvzjY4o+2D0IbROGKIXANjbtZ8Wx3OrFzSVBhw44VEj
	nvmc=
X-Received: by 2002:a05:600c:628d:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4ac17d16a1bmr137026755e9.5.1793479646321;
        Sat, 31 Oct 2026 13:47:26 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.98.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e77409821sm6564471f8f.0.2026.10.31.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:47:25 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: em28xx: fix v4l2 use-after-free after failed init
Date: Sat, 31 Oct 2026 21:47:23 +0100
Message-ID: <20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
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

em28xx_v4l2_init() publishes the new object in dev->v4l2 before the
video device is registered. If a later initialization step fails -past
v4l2_device_register-,  the error path unregisters the device nodes and
drops the initial v4l2_device reference, but previously left dev->v4l2
pointing at the freed object.

syzbot reported:

BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0
		drivers/media/v4l2-core/v4l2-device.c:78

em28xx_v4l2_fini() is called later from USB disconnect. It reads
dev->v4l2 before taking dev->lock, and on the failed-init path it owns
no reference. The last close of the video node can therefore drop the
final v4l2_device reference and free the object between that read and
its use in v4l2_device_disconnect(), causing a use-after-free.

Fixing this by clearing dev->v4l2 under dev->lock in the init error path
before dropping the initial reference, and read it under dev->lock in fini.
This makes fini see NULL after a failed init, while the successful path
continues to hold the initial reference until fini is done.

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e71765881a6fc43185f
Cc: stable@vger.kernel.org
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..572e6835b851 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2414,7 +2414,7 @@ static int em28xx_v4l2_open(struct file *filp)
  */
 static int em28xx_v4l2_fini(struct em28xx *dev)
 {
-	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_v4l2 *v4l2;
 
 	if (dev->is_audio_only) {
 		/* Shouldn't initialize IR for this interface */
@@ -2426,13 +2426,15 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		return 0;
 	}
 
-	if (!v4l2)
-		return 0;
-
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
 	mutex_lock(&dev->lock);
 
+	/* matches em28xx_v4l2_init error paths */
+	v4l2 = dev->v4l2;
+	if (!v4l2)
+		return 0;
+
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -3129,6 +3131,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/* matches check in em28xx_v4l2_fini (under the same lock) */
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.43.0

