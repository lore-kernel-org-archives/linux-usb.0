Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733D4E7817
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731622; cv=none; b=KN9eCQ8rzuYYXhW4OwcXe3N4PELxOIxVgYGwGX7rAtQdCAsccbz3iJI9KVQeAGpPjxvstG79USQLecXEgB94A9nN4/zSnxusSD45ILNJEWow98KtGRX2SWsa5aUF4d5V5H89P6qUmCOYUS79UBZ5GZrxfwo6gsGzM4kKqSJ+ZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731622; c=relaxed/simple;
	bh=VLOgYBB284e6UvetsR2kb8uGxt30t++4NGeUIM3BLp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbXdwfzMMIRmzGDfnDMHTl69sHpu2bwnpc6SIfnrJyQEqrs2RtuOc6nXx+W7ElWaGnvUl9gbkZBgTNKiTfPMvttFAFpWoOPNv9AUW88f4bFKs/u4MdkAFOUiYW8jdk+8Bc2FNcPugrTz5KihVeod+8Iwqf4MoKHzTSPylFgo6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL9OR3op; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL9OR3op"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so536168f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731615; x=1790336415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsOk67V7rRXI6BMJYe6ZaVYzC3vxvy2AFyjxpdxDJNc=;
        b=oL9OR3opRltkdNEaiQgKlwLG84MyajATZZ0WJE8TW0M5AeWKrDatabbzveClZIzRw1
         gGknTcWTw7xfeNfYc59SWKIUF3VnSlFKosVM+uzjcGDuQOkBvTpiLRLHkEPEz67aB9Wm
         aZRr5cYLV8kl/RIm4sfMHOuwH5rlnqHFnDScerPLdHQCJHfdmLFWIMf51M/TzSMM9IJK
         7CIBJQajUiO11xe2cauIStjgnj/HfLTaOXaB1LTceonGJ4fPdIIen6xjE2HVzmvPF6P2
         fjYtjHRgZN58qFucWA5UmskufYFPq3mLVV1GcKhTcosTrrQbyKfNF77d43XQAwH7mnw3
         ONnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731615; x=1790336415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsOk67V7rRXI6BMJYe6ZaVYzC3vxvy2AFyjxpdxDJNc=;
        b=qmKbnUORWZ0opsoFBMX1i/n7XLmbAH7+CBM5Imai4lNlj3bivD4H54QEsv9bq86rfo
         9efM1MIZjLnLc2V2lQsG67fMHnh6IbwbCcCGGHFwK/76J9gXXYBBJ72+pQ7i18eqGuXy
         3FocLexfLxU1H+JRLM8JEi5SFvEmoWV+P5Px8NB9wVpqcxynZGZs5YbHL76juNYxvYor
         dn7L5ZvpunfGi9NnPkHrvrKrR76y5TYX94iIaEWEgAZW0z+rNXenTRrpi0aR0m+D4TEm
         lKslj2tNtLh+ae/YNxkY+lo8+1gFyF23GqYZVkUAo/yDRaLwj1XvU50hB5ufnJPnTQUl
         Tskw==
X-Gm-Message-State: AFuF++mxnajZtULgkwqjjZaju4LR1TJFCKMKkTtJClxFlewwu/jEz7oL
	b2k5je6ZPm0ENfO4w5ENsBFLPhD9s+leVIygH3XeDqb+noonLp3WzkCP
X-Gm-Gg: AYBFou3bJa4hrW/cD+zR+B9c6bYQcSqI9VI+mYDVp8X8g0MAavPibyMY4wEMhzmVYP3
	7OaZRw4JT9pjq1SBJwY8NkC3I3Yy2TBEPbKgf6a5zSnxXhdLERREpKdLlSWn5JWqv1YTqm85ofA
	3Hv8zA6BQfZqYfWkcw3DVkAB6lN0S2QSpkel9g6+bZfMz3WGmM5MDFscvi/3d8Oeom8X1O/OA8W
	UIijEwn9PyWKdsfFBLPQ8etj/JLNRssuriHQLkmAVu0kasOqLJe242z3ew668ouuzRSNZF4YDnC
	hGBmCA33fr2RZW9mBR22GunaC+4cL1ZTHmHoQNE3Ik78f+fWVWu0ujtlai80Yp67L/T+ZQkUV+V
	G3C0OcSc0XcvkKmhiUiCpcau4CYRMinKXdwSARo+PCadIcYaAZQ4MmzgcOwgjvY8vsWpXlzDvIs
	9ChbUf2f/Oz1IQkdGPm558r6Lf03OFm7UNY1ZQM4Ta6/0/bYvm2KE+tkHgFpCEjGdBbL9fTD8sF
	yZ5uWwz/m+e2dqgcDnfMdzi7Nw=
X-Received: by 2002:a05:6000:4904:b0:486:fed8:8710 with SMTP id ffacd0b85a97d-4871e367d9amr3116450f8f.38.1789731614971;
        Fri, 18 Sep 2026 04:40:14 -0700 (PDT)
Received: from cachyos ([41.143.99.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm3734893f8f.5.2026.09.18.04.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:40:14 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v5 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Date: Fri, 18 Sep 2026 12:39:41 +0100
Message-ID: <20260918113944.76871-6-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113944.76871-1-i.bahloul01@gmail.com>
References: <20260918113944.76871-1-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Kills the stream and lets the PCM core suspend substreams (apps get
-ESTRPIPE and restart) on suspend; resume re-runs the cold init and
replays the cached mixer state.  Front-panel poll start/stop around
suspend is added by the front-panel patch, once that poll exists.

USB autosuspend itself is out of scope (already disabled at probe in
the first patch of this series) - this is S3 system sleep only.

Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro.c | 48 +++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index c15fca214..ccf3dbf36 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -1592,6 +1592,52 @@ static void babyface_disconnect(struct usb_interface *intf)
 	snd_card_free_when_closed(chip->card);
 }
 
+static int babyface_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+
+	struct snd_device *sdev;
+
+	if (!chip)
+		return 0;
+	list_for_each_entry(sdev, &chip->card->devices, list) {
+		if (sdev->type == SNDRV_DEV_PCM)
+			snd_pcm_suspend_all(sdev->device_data);
+	}
+	cancel_work_sync(&chip->stream_work);
+	mutex_lock(&chip->mutex);
+	if (chip->streaming)
+		babyface_stream_kill(chip);
+	mutex_unlock(&chip->mutex);
+	return 0;
+}
+
+static int babyface_resume(struct usb_interface *intf)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+	int err;
+
+	if (!chip)
+		return 0;
+
+	/* The device lost its state across the suspend; re-run the cold
+	 * init and re-apply the cached mixer state.  Suspended PCM
+	 * substreams are woken by the core - apps get -ESTRPIPE and
+	 * restart (the trigger re-arms the stream).
+	 */
+	mutex_lock(&chip->mutex);
+	err = usb_set_interface(chip->dev, BF_IFACE, chip->alt);
+	if (err < 0)
+		goto out;
+	err = bf_cold_init(chip);
+	if (err < 0)
+		goto out;
+	err = babyface_restore_state(chip);
+out:
+	mutex_unlock(&chip->mutex);
+	return err;
+}
+
 static const struct usb_device_id babyface_ids[] = {
 	{ USB_DEVICE(USB_VENDOR_RME, USB_PRODUCT_BABYFACE_PRO_FS) },
 	{ }
@@ -1602,6 +1648,8 @@ static struct usb_driver babyface_driver = {
 	.name = "snd-usb-babyface-pro",
 	.probe = babyface_probe,
 	.disconnect = babyface_disconnect,
+	.suspend = babyface_suspend,
+	.resume = babyface_resume,
 	.id_table = babyface_ids,
 };
 
-- 
2.55.0

