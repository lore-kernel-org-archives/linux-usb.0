Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E448489B
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962605; cv=none; b=eiePMn88zJyLcBDwkn3wBwhu5uo3Qx2/0DCM16qbjEFIM70ARueK/LNP0+t1dWB9obYnX5JuqXEKoJAbhHaELfbDHKrZJRf96478WDHcJBdEYJqzm2cXS6C1PcgrVUr2eq0Hm5IaqLEa4u2plIOKejrPKMT1k3jZlLftXCo4tHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962605; c=relaxed/simple;
	bh=O6bQmveyBapZrsTbTRgn6yMmYaOs7Qm/ZnNsDdveNGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klT3TBT7lzS1BvjmC9jvw2l2ZQdSUL5s/Imesf8VL4ILPd9uNHMXNM37tQoqw+RgPeZhvOM8RpqGynblynpKWWzkt3tuf3IVHqioECJs4ghW6FeLEXvndnQ8TyGrji+isqQCShtqM6fxWN1RcUP14x8CFIE/h9nQUSslS4PhtVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbD+2fqC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbD+2fqC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso20513845e9.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962597; x=1792567397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbM6G/cfBuexLxJw6Bstl+WC8ZXf72ew5u9fh5toXB8=;
        b=QbD+2fqC0b2rzeihat7sKallGttcHj4OrGgmv4ScquGCawheYmzQmhziTPfJ5ZRzq0
         fETQLSWVlRSdzIiEFhkYPPByKgeL9XYlkVegGRwYmdpLrqqWnWP6WHL2Bgt1b6L364Uz
         +JPMcnoZtJfaGCt4L2FEWTgePjH7zf6Ak/nec4UDBC1t8LIxfNyskaz1JyKlWm0Z0Fo6
         qn+3tZWS/gkGaOfg65twZQuX3720QVrtDSIYaPuPy1YxdS24rRJlJAn/pjuT9lTMPrCH
         j7wrfc07ucKahQfw5X9FRMLjPYLdXPLW8D8XBYMqBibBldF8Dc5+UD9gLQl9bqblDMzl
         8kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962597; x=1792567397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbM6G/cfBuexLxJw6Bstl+WC8ZXf72ew5u9fh5toXB8=;
        b=NUjB90+CGzVWYEqO4pO6pYBIjZXNfWJXbeHSXcFseZvwg6ovJqxp79VluGD4+u2Xvl
         vaJ/g8p+Jr0wwBAqNSTza9JJhFMRGG4NoExlMs4RC4bcOhAGxb6ApQ4UyYxE7g74n87J
         OzdyOkVG2LQ0QZryEGkQLaXhP3n/G5Qh3UyFtO7DU6+UlZLVFX7r6KcXIgX+485Rp3LK
         Kb0zcOv2Phkn8SCR8GyE2J9W/ko3D7yYtsPltILuNJStj7mXbmk77EUl+/NT/wwA8Uyv
         5o/Bex6tIBUgB7nVTgHKnfkhUk21BEQJyPO8NHD+BnLNJlRWNN5qfcm+GOo7CBRaJwhl
         4vvA==
X-Forwarded-Encrypted: i=1; AKwUvBxpWmoWRoctx5J5vE6VzdwdI5lzS4bqpbdgM1imD3NUFUEuqeHxekxm2ShgA7DIr583SrZZFwZ3ClU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5rfL8fcF1a8ZB5gcQBqQzAabSsjbbjZs2O7dlis7lyPt8nZe0
	xi2fJNYTJzNxs0Jx2WjYmUHF0IGkNBU1Uo2qp4/TH9Bf8dv6gPH1CSTG
X-Gm-Gg: AYBFou1ywqjEHdY4HivHgh+3WD0p3Njr2OTGggfodGn7FfvGGD1ohQ0hKuX1ZSRVESW
	DVCvn691tu4Dtr3WtR5mV1qrFu9ynPnE6ZtB9GrNSi+00gMwgPymBLySNFkLdte7dSl6rA3nzu2
	B9Kc5WL5qke8NA6nVlzh7ebK/Q+9Y3Vkf9QNfa6i1+DoYY2HqSI9ImyBz0iiem7k0bdmjDOXb0P
	T6aIFrh2D/JKdiefSQo/xVbFa8aE8fvhLZA97nWcqusDyOtpjAus/whI5KDlToXf9jVRY0Sa3IL
	oUSuX53ySpf9C8vtqHb+X28QTEcNGWvycPzlmdIQH+sYZXu4bcnc+GLZmyPc7frjEYf0DTrV9ur
	i6JlKn7uQPG3HhUXUSFzoiKaEkBeZPxeRGcKreYiJ9G4sc5bCS/xK2PgGdkuLUpjYLdufapLP60
	yfbZEhjedz4LpRT8og58qIa0Ovs+mWd4MTF3MPIO7ghtj1Us3wfMsB3CRVG9tlm7o+1IdM7iI0r
	1U/GS77t7LjrclY8xveUqUBJA+l/W+qcTbQfHGGhs+ITQPuZ5Vd9+Mh0/pID+tkQ4H3Xee5kZDq
	CeRpLozPTKVyOuclhlnyMbyflowP9zdwnXVuwXGoRbat3gNDQmBtZ8V9wh0LrA==
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr296042805e9.11.1791962597174;
        Wed, 14 Oct 2026 00:23:17 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:16 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Wed, 14 Oct 2026 08:21:02 +0100
Message-ID: <20261014072109.1759502-23-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the generic DWC3 platform integration to enable clocks and release
resets. ZX279128S is an always-on networking gateway SoC without
system low-power sleep/suspend states, and the suspend clock is an APB
clock gating input handled alongside core clocks, making the generic
platform glue sufficient.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/usb/dwc3/Kconfig             | 2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a4..dd0f6d25dd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -207,7 +207,7 @@ config USB_DWC3_GENERIC_PLAT
 	default USB_DWC3
 	help
 	  Support USB3 functionality in simple SoC integrations.
-	  Currently supports SpacemiT DWC USB3. Platforms using
+	  Currently supports SpacemiT and ZTE zx279128s DWC USB3. Platforms using
 	  dwc3-of-simple can easily switch to dwc3-generic by flattening
 	  the dwc3 child node in the device tree.
 	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb0..aa838cf067 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "zte,zx279128s-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.55.0

