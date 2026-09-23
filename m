Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B1756853F
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177169; cv=none; b=ZjnhqbyLw7XC93axsJ3CvI9oylmf8Puc4jUzPqkOhyS2Bmbsh6AOqywLC7PbjVYnw3wEJ5GaShBmMB/TcqdMHg+7S6LX6Dbw1PngVf2P3ydnFyw3ewBto2HnTndYvJyK3SsPC2Gu21NCg1+xmhVi91mDQahebjbo2MM7LRYhV08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177169; c=relaxed/simple;
	bh=vbE28mKmHJtdJ1G6UqmQvPjlK7htfPMsesH5LIBkX/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJu2hKClla4ZuplxssusA7Z3W68RtBB1mGJoW1wktveHmkES5MWkA4SNNTTsRn3UT//2olYxEmC+osaXl7lFGeuwNWy1RwLVP7jju0bEhQAHUC/mwFYS26NJhIsrfSkStPeI/vr7/w6yCDS2Em9VppKiQ31Z4U+ZIH8qAiNVKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k05lwKTS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k05lwKTS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso818820a91.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177157; x=1790781957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtmNEGmWjmwHVcwXZMqnTzmXNuimyMZDC016FlIST/k=;
        b=k05lwKTSZFAoSzGgkPEFpdohEuULir9pJCvLNgIcazzwSyaixgiXPHKe1qghR1hzAe
         GVGUnXhyzo5S7c/5A8A5V5lPaWox1wOkA/GqmSyOF51k1mpDNKgaM7O7HyoEkQPzbyPt
         rhBqj6cl/tPqvPQPLx8IhxY6c6PRF8fDnAj55fBmHHgIaFfdC7nvJN1iu5XD+YhQRVp4
         QLt7IHJ7ena+cap/cQw8vPPqMGodcsTL2cCNV2tbAnZNJPm7fZMIAcjBDEq+PTyvAI3a
         NEGpIetDiNAPJayQA1vA2jTcUt04j7kDswgGnSe4YlUF/U/vimx6MQTXXirtJgH3XXkD
         i0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177157; x=1790781957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtmNEGmWjmwHVcwXZMqnTzmXNuimyMZDC016FlIST/k=;
        b=cUCTPRE7bA/YPDdEF1hF/ILQs4Brv+y7ykTibIfEoLYSRIfjxhVAkCIgAiwq2yBNbV
         Q4is/KvQvpHdtlawlplgHbRiLfKhbknxKk40GzkumklxzuH8fYdOFi17FdQpoKjRAq20
         EvTGs3HucOHD2De9U7+chyz+HSd4ZajBqx8It46ikoPNOnjdujxCCIda8/ABU5hwG0jC
         b6HNU8TQjYTH1SL9HoT7O2qhZhwCVAMsy95n8uf42qBeOBeQdfFpOORdOeNJkoonSYww
         ZUillXjYTXxWfYyPW5UARRQ/CHRFAOQnKYtu6pVQ8C/IjfAk4C89eycHgXO31zw5unpT
         krmw==
X-Forwarded-Encrypted: i=1; AKwUvByO8cpR2yyZP2J923seotSCMY7xVzJALmcyN1YjbskVsvFQbXq9d3IlxOJS7H5Ups/D2qa5WEiOzZY=@vger.kernel.org
X-Gm-Message-State: AFuF++kxl9a4UXkyi9VJowteat9P7SMh7P97b2q36cUlB0avmhU7p8Bn
	aoretxMscIcFwmb/rWvQBx6tO1pFoJZG0we2KoUaJ33+S0uolSR481yY
X-Gm-Gg: AYBFou2K4HcLhHSBd+TAeRMDT2JXzH0qbiyua6YGKFWoVDJqZwLjb/CMeqi9xR9TN0p
	a6GBOO64i9Zgwd43NRltFCkcecAAkjzk7QUQ5M76Vkiq7XHGTnWOdzN4Zm12owPy3R8JlxfxXJJ
	sO1fR3Ew6WVPTeY8QWjPikL5iMoWmfVLL4MvlvsG7u40fbdW+v61r1OYqtqnXF5j6bfWHNoYgzL
	M4ciOh59tih0rKYmUyYZNVPobgdR0wpUH1wkKQS4kacTOeNdSlBAuruehDj+0zd/uqbS572L3Qs
	yc2BdMWqW8RnTdnDIDy+25eeGnt29qZtI1lBL3Rol2C0HOp+Z2eIRp9rRf2Gx6Q0lTHpIyOkmP5
	HbR0JIQd93VPFm9m2GaoapHjpEXXpK8wVLS/iAi7nDod7LvCREfME/LapTeE5ff/uiANHiHfOLl
	q/GQxi1Bum6SwAUTd66i21NwIKSfB+KTKRutHWeCAgSB+0U3t0m41j9sp7RLEn/UexwGo3T/cza
	qB5oiWUZbvH/JJx0+FAYJDO1G5paENK6DUzjHL4f1XkkLUwJasBBo/WrgHHxzo=
X-Received: by 2002:a17:90b:3dc3:b0:39e:4c81:6c96 with SMTP id 98e67ed59e1d1-3a07e56914bmr2435931a91.28.1790177156552;
        Wed, 23 Sep 2026 08:25:56 -0700 (PDT)
Received: from archlinux.taila79f6a.ts.net ([2407:cdc0:8003::1027])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de50cbdsm5587201a91.15.2026.09.23.08.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:25:56 -0700 (PDT)
From: Xucheng Pan <panxucc@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	Xucheng Pan <panxucc@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Re-read descriptors for Xiaomi 2717:d005
Date: Wed, 23 Sep 2026 23:25:52 +0800
Message-ID: <20260923152552.943151-1-panxucc@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xiaomi 2717:d005 USB audio transmitter supports Sound 2 Pro and
Sound 2 Max speakers. This issue was reproduced with two Sound 2 Pro
speakers paired in stereo. After a USB replug, Linux detects the
transmitter and exposes a hardware volume control, but moving the volume
slider changes neither the audible level nor the speakers' volume LEDs.
Windows controls the same speakers with its in-box USB Audio driver.
USB captures show standard UAC2 volume SET_CUR requests on both systems.

Re-reading the device descriptor (18 bytes), configuration header
(9 bytes), and full configuration descriptor (184 bytes on the tested
unit) after 2717:d005 is configured restores hardware volume control.
The USBFS sequence recovered the device after multiple replug tests.
Reading only the device descriptor did not restore volume control.

Perform these reads when snd-usb-audio first probes 2717:d005. Use the
configuration header's wTotalLength for the final read. If a read fails,
warn and continue probing so that playback remains available.

Tested on 7.2.6-zen2-1-zen with the existing userspace workaround
disabled. After a physical USB replug, the quirk ran when 2717:d005
appeared, and both audible volume and the speakers' LEDs followed the
KDE volume slider.

Signed-off-by: Xucheng Pan <panxucc@gmail.com>
---
 sound/usb/quirks.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c587090..f9b7036 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -870,6 +870,49 @@ static int snd_usb_cm1a_boot_quirk(struct usb_device *dev)
 	return 0;
 }
 
+/*
+ * The Xiaomi audio connector ignores UAC2 volume changes after reconnecting
+ * until the device and configuration descriptors have been read again.
+ */
+#define XIAOMI_AUDIO_MAX_CONFIG_SIZE 1024
+
+static void snd_usb_xiaomi_boot_quirk(struct usb_device *dev)
+{
+	u8 *buf __free(kfree) = kmalloc(XIAOMI_AUDIO_MAX_CONFIG_SIZE, GFP_KERNEL);
+	struct usb_config_descriptor *config;
+	unsigned int length;
+	int ret;
+
+	if (!buf)
+		return;
+
+	ret = usb_get_descriptor(dev, USB_DT_DEVICE, 0, buf,
+				 USB_DT_DEVICE_SIZE);
+	if (ret != USB_DT_DEVICE_SIZE) {
+		dev_warn(&dev->dev, "device descriptor re-read failed: %d\n", ret);
+		return;
+	}
+
+	ret = usb_get_descriptor(dev, USB_DT_CONFIG, 0, buf,
+				 USB_DT_CONFIG_SIZE);
+	if (ret != USB_DT_CONFIG_SIZE) {
+		dev_warn(&dev->dev, "configuration header re-read failed: %d\n", ret);
+		return;
+	}
+
+	config = (struct usb_config_descriptor *)buf;
+	length = le16_to_cpu(config->wTotalLength);
+	if (length < USB_DT_CONFIG_SIZE ||
+	    length > XIAOMI_AUDIO_MAX_CONFIG_SIZE) {
+		dev_warn(&dev->dev, "unexpected configuration length: %u\n", length);
+		return;
+	}
+
+	ret = usb_get_descriptor(dev, USB_DT_CONFIG, 0, buf, length);
+	if (ret != (int)length)
+		dev_warn(&dev->dev, "configuration descriptor re-read failed: %d\n", ret);
+}
+
 /*
  * Some sound cards from Native Instruments are in fact compliant to the USB
  * audio standard of version 2 and other approved USB standards, even though
@@ -1704,6 +1747,9 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 		return snd_usb_motu_m_series_boot_quirk(dev);
 	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
 		return snd_usb_cm1a_boot_quirk(dev);
+	case USB_ID(0x2717, 0xd005): /* Xiaomi audio connector */
+		snd_usb_xiaomi_boot_quirk(dev);
+		return 0;
 	}
 
 	return 0;
-- 
2.55.0

