Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480967;
	b=5uFaVN9byGyMoxYLat9FIvwSpvt+h6wPaT0U4ueo+7jIq7X1JtkR4TURlPIaHK6HEOPQ
	 w0K0xXJhnaHhTkjX4xpJ3JpDwdHyDTkXU1opDo4Q+T7XQrQsWVVgrruK4hNBeL8c8jvv6
	 7xOgNlrYpJN0MfQcSIf08Ifa4axPNIU/j7fLuhUNDf/af78De1xeZ33ZFFtYt+zhz9e2R
	 EDIAYSCkZ89Qdj+c+lMfSotENBg6zywDl6IvYranSjyYBxP32RGwbc17CzhJ68EljcKL0
	 pWbYNQpb8d834iP29rMnThk/ndw2JajY3MOUk1jzo5nv3Og0kccgJS9CdmOKOjRjUBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
	b=b0kQLiG3ASWtrcs6t/1FXs4tsXCszv1o2RhDEX1tlFRdGoCTfMRn0WzjUR3aCbJIYf5d
	 MVAJBg9ka/E/X7s2Rf+pTih8KYPySYjWy+5Lfo65z1oo3aGX2xeob+NgRYl8pl6A42CyT
	 Ogv4vgOHMKelrZPP/jhFD/nK+uuFZ2db6uAyyHc7+TqI24H+93PN6veLty/gJO5vZ28cU
	 GQfhuzWnM01DYveJxUK3TntIb3zHDZDCx39HtkdKTf4lqOp07Ro/fjjLymuaCpYivtnSR
	 uGoy8OcsT2FuV5DMNMIbOMyAeUb88u5JCTQ4D0HFV+JgRaTQtp7KpQRrgc8KRI5+DUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqYbYdvg;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8A606A31E
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 21:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F8A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqYbYdvg
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1515148f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480966; x=1794085766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
        b=uqYbYdvguytgoD7FHJG5tY6rU8OIQiX6tqmAZwTE61SMy0wE28EnrcSxS59sQ2fW2q
         0ZdszXd8P9zhRcp/q2O+3QYWesl+NJbOte+HC5NowJThc+/fBZooJUc7tBKiVXZ70LJx
         DMky81QW7YSd2TXrzRj3WaSGT7meRbPZaqv9IwKBGzelACshDnTZXIACQJjcyXhEa0i8
         7RzjcauZfQmGGELTG3wiw01jfXR+tvLsEr3UTDe4Gh3y7dl4L+B0gduv/5tevT/YiSLC
         aRJT3gPWCVB643970/gcfVh9bH/uiCSUGXyDRFF0BFK3WOk9HZEr7HnTPm28IU2DST19
         oTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480966; x=1794085766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
        b=ZyXKKete5vQ1DntVFJJyS5c/kM8N3pT2g2Ov/QImP78rtfl2FyuzQIpM6xEXL9+hcW
         09JrRH58ow8rb6nH5N6xsoEy01owxiMO2x/VCSqQwb8NqOEZm/+hS2SIDLQ2fDpzYPcr
         zjgrJJhaQ+x0HmdU/5fexth5Jms5JZloNo4+th5mbWtSIHi4ca8dMfqTNGgUC3QCvtNY
         qp3nGebRVyZcYZjQlWVddfG1cdwXWusCmZ/sS9ymLA2F8cKvKQT7wC7/6ODMeOIsshnI
         vErKQVQo87jPwKVH2LMhlpChYnwAa8wVdkvxJken1YYpPgYkV2B/gl5c5iiPjId0rqmz
         n4ug==
X-Gm-Message-State: AFq9FYKeTxSKbooiK3ekbODoZQQzknZkcDZT9YNkgNLhoSSlMkx8fHHw
	z3fMdTxiac3Px9g2B687DSCfsHhgIpl4LrzxZ71E0VDvZc+UNgh8tHgs
X-Gm-Gg: AYBFou23sGNKr2NEh1olnWhioaI86tAWfbvi0CwWxYUrydl6CO7bj579EOy8ixKMXm+
	M5tg5h2PHK9x1IHq0GC9HKengpzqrb8t/jyKPPhBWMmnoxoRcRqxXzI47zTc6H+FPtb+TcdhHbn
	63p19PvXgPkpO6m0R8YvHShvt39KjB8Vnt0/OL1+mGcOFOsG5oTG0Jo3VRP92NS/JoW+ILmT0rY
	Iron683nSc+NzsldpjO2kYrcgNhiW2dfu3NMUAgcatuJEPNffdPR/OSM51/KBI41pziHTKywbdo
	1GHLEViGqpPgacVJ0Vk0/GtSxVH3iZe0r5rn/v0e1pvgyOnWUS4HwuwIozQiGCXU0LOLjd10Zhl
	46EVkn+bJpEJ0B9dIrusFZyTwrannJZ0NlirZ4K4nPQ9/59dqkAUW42EblPvB7xhtVA2MLasozL
	++/SK2lojyYbwsErIP2AYM5OHYigQuB7Yy7QbiVsu78Ufg8LITHKoJ1IziGyNYLQrvcU15rpUDj
	uqXPZWFP0p2ic00A8o4EHDc6SDWgJhNbxJT2vSFfwRu9BbW6MeC/eEI5H0zDcwKX2cwLW+uOvv/
	2cPL0rS4I1Ntfh3/cOpQCTOunEK9kZm2GHpojzuBimQskskocPF2MoOdJAokxw6wEr+FazbFB0O
	gFcWZu2lcxbXr3U2iEVfFUTtT
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-48e6e2db4a1mr16251497f8f.18.1793480965675;
        Sat, 31 Oct 2026 14:09:25 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.98.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm10793317f8f.51.2026.10.31.14.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:09:25 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: em28xx: fix v4l2 use-after-free after failed init
Date: Sat, 31 Oct 2026 22:09:21 +0100
Message-ID: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
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
v2: added unlock in early return in em28xx_v4l2_fini
v1:https://lore.kernel.org/all/20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com/T/
 drivers/media/usb/em28xx/em28xx-video.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..924a3f7977c9 100644
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
@@ -2426,13 +2426,17 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		return 0;
 	}
 
-	if (!v4l2)
-		return 0;
-
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
 	mutex_lock(&dev->lock);
 
+	/* matches em28xx_v4l2_init error paths */
+	v4l2 = dev->v4l2;
+	if (!v4l2){
+		mutex_unlock(&dev->lock);
+		return 0;
+	}
+
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -3129,6 +3133,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/* matches check in em28xx_v4l2_fini (under the same lock) */
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.43.0

