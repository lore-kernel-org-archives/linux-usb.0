Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814816;
	b=FKC5k8N5X9DR/ysfR17nnygYYusxYcHKqriL7unWX4SYXmBlFqrtOmB3jFNxwL6zpqFH
	 txKh+pJ256M9lwUAkhbjEiR6hGvD5iEfOT4zLkaeTaWsjPHOb8Awjn4xDwETqge/r4ruX
	 6tpVWCaawsDs6KLV7ubJgGgaxJxCdoCfKWoCSItYa1mcYxyRmSvtxtmbTGJhhWEOU4eXA
	 370aSn6KrsYVsH9nSZUvrHuOAwit8Pg2nn+YFzoPkGvpNXHS/ohT17e/YWVjjF3TBbySL
	 5X6Fjkmk3YAdUkkOIxHDIt27Q5TOSa1GXhQwu02MZqrcHViBdgRC/5Ovq+SspEEd8+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gJDbA51981icjHBqjlT3hA/4rMnBxzjkdpVdqxbzHpM=;
	b=4vTjFTk3va3DDFl3cAMfbF6a3Kehd2GCkykP27ZANaqNhRSSkHHaNzNHwpvmL4wMVtZs
	 /wyX1KQJAtdemAHldTgQUVQrHLp/pGOKMwdBADWtIApfjnKjjGme9728+Fqngv5afQv6X
	 hPikqpiIC7M5ZFJsk7ktDhDb/TJ2DhdsSDx+MRJkueMxVb+oN8XasXphS5z6I/WIA6Q4f
	 46SwSdzdTEbpOZMn/qmuGyvlMBpAgnjoNz5uJXwEIx3NPGapdaTUOHCiehRAkFoDq4nrT
	 H9DjzfaMXbkrxv6h96id2reY4QENQMcHX1i7qm+ztV7EQPBAk/GHkYebrEWjcxw/kYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U5WDcqG4;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7109606A32F
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7109606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U5WDcqG4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490f38e9688so2125467f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 23:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794814813; x=1795419613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJDbA51981icjHBqjlT3hA/4rMnBxzjkdpVdqxbzHpM=;
        b=U5WDcqG4TmsNfr3IbzcNFeq2gadvFE+xr8kas6k9lfnVOjRzHQc7swGbyXZnpUxnfE
         3GV9LnvKz8QhDM2o5XqVpxFod5uw/gvQAxJ9pGXoiscbaFwdiqNa1CSjeHAfQslteucn
         CdhG2ysUIgb3vGTjDK4KHBnMpKnrLI88UN8YB2FXKvybKpldG84dzu4N/0vK3bTMxjGN
         proA5JLJY/KKxBaBxrlPZRvH+4XS26yFZA3jF5DDUvhn9TCMqSQMjnvuy6Uiwk6hHR5Y
         +aCnVai3XKHVfG+OxwM2xC616tHFZ04fcFTVHKEpxzFjAzRpy6CTeCsEA7uCDxZT9Ujk
         gc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814813; x=1795419613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJDbA51981icjHBqjlT3hA/4rMnBxzjkdpVdqxbzHpM=;
        b=PXqRCvgn9T18qbcf/f04kQ9mnX07/Ta0QyM0lgr7iI8J04uBzB778gKj51rk0UwVAN
         G+zbQXhQAQOTjtsdQUPZ8e+9AYRup0SVTrtw3oB060iXV1vTrZ/ZcAysSr8yitc5hkUz
         ek09/jX1mnFpKwqYijgGkqtssmHxtXSVlzCA5GtOeKhfMfCvmyYocG20zjU07iT1gPnk
         bojfoWgPKbXY1iJ65DEoS4vrTGV60cptgkpWb6mi90LfXQen+/+91mLNU+C/E7xMsdnD
         sINLJk9tr4AflqUboje8VSlA6lymnt9rrtZ3fi4cX1yLDgfy6AqP/n1tnajmRpftzIZl
         qiWQ==
X-Forwarded-Encrypted: i=1; AL+hErHwOdHpzAznriYdb/ymErX8M255A+aHSzjnzQrvlB5Y33jnf7fGn0TtykXKNH1OpfwCECGLJDf/4VM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nqvWlfV1OMfXfO0uJFnwlr/Ket3Wk4IhDVTbEsso8uiC6/cA3
	pMp+diziV8J8hdcQAKLaBH+NRh7fg4MImsnAJW99nrhS/LZgBBmLDsWbpwtpbmSTH+4T68UtQIL
	P+SXZrrDHTg==
X-Gm-Gg: AYBFou0Nya6TBOnsH6J2dtZcL5baJBanonXscONQwuVET1AxyXFSFESd+8fJjMPqypI
	nh4xzo9KkaM9g1sc+FeRUAL0wfRurhPELMj4mkzrUjj/w6WSC7khf70LlBiCFMqGzh7ByqR4fwf
	6IFYt5aOqo0ECTvZ/BxJEk2tN2ddXGdd84WEZ886Ll8N3Dhfc2lPJ6J5ulMaEjfRERuFUZ8pyzM
	UDluzmdKpWEzZMaSp9NmMTHJ0e5pm+ylP/iUJ1Hc8fXgs2A8o6fw8kI9oGCf1nEmsS5g1oJOq3Y
	eGGDtAYmDlEhqm0aN5p0y4H4HcC4BL9BEOnu+XQDW6CO+8bWZfVAzePovxaURVUQjKrAnugPEqd
	6QUbsrGWGePtFljCBqRQAecR8ujzCGJqQy1KxZTgh3bt3K+eY8Q9V418KCGQ4kXez/ti5C9e60p
	B2hYRfIYMgWcpieGl3W6pyrLuO+UcK7ywO9LNteV5DWB2/AB5naPlLiyhouV3Q1wHN/ZxAqJZKB
	LI19u1wunX++cUzytNc8dkVoagSt4227HpxU+pIRGScG5zphW/gxEWGgT2jbe6rjf833kJsDetI
	/CaO701gmJrpFSTKSXMphYX7kvSSLF0iulZb24PmcGyHxnXNjd3V
X-Received: by 2002:a05:6000:41d7:b0:491:e477:6820 with SMTP id ffacd0b85a97d-49c70824309mr21417195f8f.20.1794814812963;
        Sun, 15 Nov 2026 23:40:12 -0800 (PST)
Received: from localhost ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm20106374f8f.39.2026.11.15.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:12 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Vinod Koul <vkoul@kernel.org>,
	Vincent Shih <vincent.sunplus@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] phy: sunplus: don't read the disc_vol cell after nvmem_cell_get() fails
Date: Mon, 16 Nov 2026 09:40:05 +0200
Message-ID: <20261116074006.20357-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
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

update_disc_vol() returns early only when nvmem_cell_get() gives
-EPROBE_DEFER. On any other error, such as -ENOENT for a device tree
without a disc_vol cell, it passes the error pointer to
nvmem_cell_read() and nvmem_cell_put(), which dereference it.

Use the default disconnect-voltage level on these errors, as the function
already does when the read fails. nvmem_cell_get() never returns NULL,
so IS_ERR() is enough.

Tested on a Tibbo LTPP3G2 board.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 0ad4c7160d17..52d80a06abdc 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -84,14 +84,15 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 	u32 val, set;
 
 	cell = nvmem_cell_get(usbphy->dev, disc_name);
-	if (IS_ERR_OR_NULL(cell)) {
+	if (IS_ERR(cell)) {
 		if (PTR_ERR(cell) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
+		otp_v = ERR_CAST(cell);
+	} else {
+		otp_v = nvmem_cell_read(cell, &otp_l);
+		nvmem_cell_put(cell);
 	}
 
-	otp_v = nvmem_cell_read(cell, &otp_l);
-	nvmem_cell_put(cell);
-
 	if (!IS_ERR(otp_v)) {
 		set = *(otp_v + 1);
 		set = (set << (sizeof(char) * 8)) | *otp_v;

base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
-- 
2.53.0

