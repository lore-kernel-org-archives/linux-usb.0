Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814818;
	b=f22gxz5JlGlWroaXMGyiQu/qjgg2i546R+AiNtVGgS4y36Dd4bK0t/bUxmPbqlmIe5oj
	 JVi0pq6Dx48un2lE+0NDbrAKYkvvWGOGKaX7ZMCss6TquJ8TtJAVC7zqd5K1KnWKRAnnF
	 6E71pJQncLjCUysVtBD/024hsuSgKOyWDmji9Rvg3t6YgVRce0UxkDIPPdRMyuvdoWyVP
	 rcIbotHjVQg/nioDy/K6/t6LKKCXlEQHykUUnHGl2DSrRdpmZMe1u8S4bqb8rjgmQEyIb
	 SlW4ke4E628SiY6dTCB36GGKk+51iZjtDb7Vp1gRbDPPM/nmbQ6JFABAc18U2dVYglA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2wEQ6p+0nkuHO38MDrTEOQ8Mro1bcRt+pQMVL3kDrCs=;
	b=SzrYWtL8L5TEzeDfey1F8KUrrCk7uV/gqfY+ZNBZURbCtuShs07XxeHewAkEQV9C8PB3
	 dsqYN3IEiRTPIo/nIh0YJxcInkGRqUJO+/tQ3jJn+tKUiCETnYR+L1Z7OCY4Vn9fttAnl
	 n3eIRu8gWTVi3rb4rQOwbmgiCKPC1781JjwyqwHR8egI3KnmtmynlmGVG0K44Hst1nDbT
	 /YskCblxVWGff1aFQIlOgAHSHAasbvwhH3w3Jc5ZAbA6kpl376pymAqJTsEgjW9a0jRk1
	 EAIm5fhVhQ5icpxXWdzE6LyQ/W7+rbV+uSlxW+Fpm+SRW7Npjw6M4P5nEOwbnFE0hGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ilkK5NIL;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3188606F1B7
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3188606F1B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ilkK5NIL
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1521704f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 23:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794814816; x=1795419616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wEQ6p+0nkuHO38MDrTEOQ8Mro1bcRt+pQMVL3kDrCs=;
        b=ilkK5NILBGSMJo+Z9Q1oPEkRO3cb23AYDG9j/QXAQY+Qygzn5CItslqQ3MozPQfs2T
         5WygLoaSEBZ+snuZC2c/9qLvSv8KzR7kf7KBZrin5FTzcXnJ+0tB4LzlLM8t+Y0jgju4
         RE/sCNBXRZW/oJadpSfi5s1ynVPDUPdLeCDeEmB6ttsb0zxgeNqinh5fxKeiPOt56WmY
         n6BphyhgMmiuLGcl3YblaxVu4YS6ODQ+od8bd3L6b/lNV+irtTJ4pxls0LLtdk5zQg23
         EXEm/wuKIgpKoU/b7Dw+bAllfkgZAqk/rvoojHXo9CnRD7pbfhyqUEHjAdgR5U/T5jkv
         fQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814816; x=1795419616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wEQ6p+0nkuHO38MDrTEOQ8Mro1bcRt+pQMVL3kDrCs=;
        b=WTG0CnTKuqJOKqCCGyGjPNCUeHzQCZ8Qp+sJLPNqu1VrKGOET1O19xOVO+CmV8pGxW
         pO00c4XBhVPAufm4R/FGDwB0q9fVwdVhAKiMFL7NRSrbSuZfABbAmIATRFaXGfg7k78f
         y0uEGWyN1OkXJ78qUuChoi68bAiu9WJHj86nNjLDTGXF8WjsoLzcupf1pBsioHKvoiob
         LnSn+V9KkAKVnORiIWIzT4FS2qWKKdBENUqExahlAgRMHfhZJswgGV7FQt2aIDmltCnr
         4U8/13ozlNyt7aF89PhwpFfTTwcSCoWQ0KrHY4XWuy78zL32jV7lwoR9YFyn70+wJ1KI
         z/jw==
X-Forwarded-Encrypted: i=1; AL+hErFH+m4n5cUNnEet57hgRXfOycKYBMaACH33/SIAWb4cBaNP8YusovC6Qu/oSrScBYVX0q8wrLtdgnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YD8J/a1cmE1E1aD96tXpPdgALP4n9i6BIGUkkJdzjwvqjXpHH
	E7g3UBHa0Y21+HAIuRhcDRtLjklkEpIubRRqUuikJwjPJXNQq6HV4l1NY49mpZAFI4U=
X-Gm-Gg: AYBFou23iFoWMQkKwsN1EfvCy0B2IamQSBkWlbqlstfROVTzmjemAmpmIOuHLeYg7TI
	UZ7AbkXlp93Rk0MUTyjh35gQn1bDfHg1doiQ8VsAX8khOaehIWvFHh3PsYwzuxkBhyZhXbcRTVT
	07USOs6lX2mOFZVLU9d/LaufnxNRkcbO6b2C09/yV38SaYafD+mLYxJst72R06ejJAf8FNYReYE
	kVWk4Cygz46HYcTLgNpM478xp9/jv/iSilPNOEh71FvTtLlSQNbVmKTKLkQOtmAdsb8DmiSOFT2
	0PxxRDtiROM1Rfsas/yDXOJNn18PBAga9a6NkB4Z+KfHyuJt2FQOtix6cSUK7KurJCSZefypHYj
	cE2hATCv5lemiEMXVrCKFh4tBj62eo/SiQ5rgRPImR/Nzrsf3H7mIqHEbz8rKABavc/q9pORNJv
	EeY0TAQb/V3bbKak/sIzn6c4yUNBp2zEJF0Qjryp6YkRFVO/i+DJJgdyr7vO+qddh1e8LWCGWmp
	QbzWuaApco7l88MLWi33kH+tZHXqpm14JXVM60+UeuyefTJsWEeiEbeRBdMDYXKrX39wSD9SdL4
	WdNzqfFXBDXFHr98WyMdACw4uXRUd/Myt5LD4zc2QXXW1557LSsDFLrE7DJv4pmDjbVLz/Zm9g=
	=
X-Received: by 2002:a05:6000:29c9:b0:49c:192f:cf34 with SMTP id ffacd0b85a97d-49c740bcf38mr14158063f8f.41.1794814816003;
        Sun, 15 Nov 2026 23:40:16 -0800 (PST)
Received: from localhost ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm20106374f8f.39.2026.11.15.23.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:15 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Vinod Koul <vkoul@kernel.org>,
	Vincent Shih <vincent.sunplus@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: sunplus: free the disc_vol buffer in update_disc_vol()
Date: Mon, 16 Nov 2026 09:40:06 +0200
Message-ID: <20261116074006.20357-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074006.20357-1-ag@ffroot.co.za>
References: <20261116074006.20357-1-ag@ffroot.co.za>
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

nvmem_cell_read() returns a buffer that the caller must free.
update_disc_vol() never frees it, so every PHY initialisation leaks
it: at boot, and again each time the EHCI or OHCI driver is unbound
and bound.

Free the buffer after taking the disconnect-voltage level from it.

Tested on a Tibbo LTPP3G2 board.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 52d80a06abdc..043feeb6e267 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -20,6 +20,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #define HIGH_MASK_BITS				GENMASK(31, 16)
 #define LOW_MASK_BITS				GENMASK(15, 0)
@@ -97,6 +98,7 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 		set = *(otp_v + 1);
 		set = (set << (sizeof(char) * 8)) | *otp_v;
 		set = (set >> usbphy->disc_vol_addr_off) & J_DISC;
+		kfree(otp_v);
 	}
 
 	if (IS_ERR(otp_v) || set == 0)
-- 
2.53.0

