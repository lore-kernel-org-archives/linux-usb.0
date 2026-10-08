Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092FA3BFE4C
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 23:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500931; cv=none; b=sjP6vRZWoWCzVEnZVdLDXKPiA2apL1Kq5bLhbo27deGzsG9uVlts3aX0VVUm3pXElakgl3KTrfSBCy9Deo07vJMH7g/Bq/kD+NhKN7CMlDxpE9smOY2mcX+kHvqJ3jZe1uRuNm4m61a9reVupOZfWuzcyvbXBMTZQ0Po8Mk3O2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500931; c=relaxed/simple;
	bh=V0/16htqebB/8TM85S/qozxMSwXr5jIDRFTSzbN3uG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iY9QE62ccy4Vtls1x1smKs0MJpExDSbK76VWwqIPOLJMJ/tKazXyNqtHWG3WFLsjgN4BqCnF+q+XWf/RWpGjoaKZvy0xTkgYzD788ZJCTMRyB3c85+If5o4zbFQ9n3PmmgEQzn5C+eQFHBCLCeIx98BRdRwu1qq+HEFhaPN1AEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiC5cvmw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiC5cvmw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso20083975e9.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 16:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791500927; x=1792105727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0IFuL9k0j9ydZbshhVfJaOod4wFMCM2kpIm/qPno78=;
        b=LiC5cvmwXhm/lk4pVirajN401Y3bhim6/QXfpdyGFjUsQC38DtMOXAqBEmnRIGydE/
         kPB9BP1iARb9LKbfnHsbgHDc07zAUFiZZhe7Z9P2x/KuryAVG5YEwR9nS8RDjFCoJmSZ
         /RtOWG9MiizgtBggsOh4SSzu9DrKJ9HMq7DX11TuEc6YUBr4CZzmwF3dIpKGNMZIOEnj
         JCAV2/iAb2RdDXpgSFXghfJoTO0fn2bZwHuU5N68umFPiI+gBEIaOEYWt2wEmVKsENop
         SQc4l0x5HFH/zfntjcoqABNYHJMXAi7dn84XW+W2gXkE7pvlnmH1Akix/QRsBWO6ejZP
         lbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500927; x=1792105727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0IFuL9k0j9ydZbshhVfJaOod4wFMCM2kpIm/qPno78=;
        b=Jr03XYMfW10Uhc4v7G9iGYngLCdp+GRvfu1/hikIZjfp35L5vTMYeH6w+pXSs6xio2
         CJmyn685nswDZJ52kB2NXh8FQFB/h6hQKgQyP33u2JJo3IM2b7U+rWfeHj4/5Si5o7bM
         PU4VM/jYok56dw9VELMUpapHhdMO3DQFq4bPxFOMyHhnRl5z0aZJF8PyL3wDNcn8xIK6
         hktBU9rjMIi+M8AOu01sz7rGW7Q2gIjCgM7JhgMIXw4/+UeRMaKzj9WvzBCfuI7e+WIc
         hpHn8dlXkzHgf3+WV1bp2c+XYQoj+fAPOkqo7diyWNnT2bDY/cdKG+qeuABf4yYppDsx
         Xb9w==
X-Forwarded-Encrypted: i=1; AKwUvBxWrVnWF0j0byHjc5cVpS8oXxxI9P39V94ul3Q3aYyAGNNualqyjaxzG34sYVFIHNzodvSH/Zzw4wM=@vger.kernel.org
X-Gm-Message-State: AFuF++liN2wQX+n/VL8KlYYQEuivKcYu3G5g0rY6jFonS4fhabV5HSaq
	E7cMUy3oJfK+DSCuwBIj5pqEHzT86opxB0gtOSMUOGc11OmVV9tRH//sx22+5kiL
X-Gm-Gg: AYBFou0JgIXhte27KzfqBue6ZMnF9PVc4B/lIXcFDE3Ys9xeo0V4LcPtVnq+yQ2uxgN
	qjapdizugVNDkl7+sgLqOibCYt5wAiMLlQNIQUNXJUMybqtyylmHTXoy0gt37vsfNFZiezCJUoW
	ITBjp8fRusbflvy7qSuQX4Q6XcCvNaZ3qX6cZDgloXMlIhevv1yrIjnR4udpFBgLnhlQTwBTUgB
	+ovDeEcK0tvRUBW+wt94IKHLgrVoLwI8D8G/o+c5T9q/DtFj1zCt2Tmoe0KpIZeuCt42iZqkT8X
	th68RaIbSDtuvB5HujMAu5dwjHWoF38odBgj+fT069ghwXbQFVSdh3Ei4X5Yz47+22zW1CiqMqP
	icSDR8WT8e91mNnZUACipLiHUyk2npiuJd+VViPYaFfDPzmUX47Tyj4Ra2ac7UkcYHIvTglfyqV
	JoaZ0GTgBJW8zaviJlJUozXGp0vzBd3iJO56i1+XFfqxSKELVcG1t4IWMXXbW6qFvCCxL5C6SLv
	kr/LOOqlqUbbgNFDaLXXRR6+T28DckA6TPCsC/1SZKJfTXYFJ+HFVAPh+C3D/LOf5855r0V42Ov
	gXW2rhCY63AWyMoTvucCy92K0kveux0Y1pn/yF8ioODfYO+tvDlnM8HqSaUJuOQSr5PPU8DT/h0
	yxGTQvOAmqUriTn2c7g60WWA4WDZVpN4ASOl0B3BDE9dwWEv/2QI1uGOaZuzKtjQ1Y4kro7tZVs
	Q8yyUrvFBMkCiG1Gom8qRLm9jRRQ==
X-Received: by 2002:a05:600c:4ecc:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a1802e95d7mr127375585e9.11.1791500927140;
        Thu, 08 Oct 2026 16:08:47 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:415e:bf71:e574:69b7:f11e:4204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm14244115e9.13.2026.10.08.16.08.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 16:08:46 -0700 (PDT)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add mic resolution quirk for Logitech Webcam C200
Date: Fri,  9 Oct 2026 01:08:44 +0200
Message-ID: <20261008230844.11246-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C200 (046d:0802) reports a mic capture volume range of
1536..7680 with a resolution of 1 (6144 steps), triggering
"Warning! Unlikely big volume step count (=6144), linear volume or
wrong cval->res?" at probe and exposing a uselessly fine-grained
mixer control.  This is the same firmware behavior as the other
UVC-era Logitech webcams already carrying QUIRK_FLAG_MIC_RES_384
(C500, C600, C210, C270, C310, C510, C525, ...), so apply the same
quirk: CTL_MSG_DELAY_1M (which the Logitech VENDOR_FLG would provide
if the device-specific entry did not short-circuit the lookup) plus
MIC_RES_384.

Verified on real hardware: with the quirk the warning disappears and
the driver logs "set resolution quirk: cval->res = 384".

Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: stable@vger.kernel.org
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c5870901a..16cb57f2c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2249,6 +2249,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x045e, 0x070f, /* MS LifeChat LX-3000 Headset */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x046d, 0x0802, /* Logitech Webcam C200 */
+		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
 	DEVICE_FLG(0x046d, 0x0807, /* Logitech Webcam C500 */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
 	DEVICE_FLG(0x046d, 0x0808, /* Logitech Webcam C600 */
-- 
2.47.3

