Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862C3A5E7B
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620840; cv=none; b=ES+UUHahvHLi5aIIz2Ik/Sx6ePycHVZJgmLR3IRm58Mh1YHOONRllC5/Mp0IxXzvOTQ8Na568c44WBzoayZycIen6WNHamgPGOsWlCrlcZNQwLwYLRLAtTD0BUuMCdor8URGNM8AsGhl8Oc/KT/GoBjlnqUK7K6T5NYMQkDyyDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620840; c=relaxed/simple;
	bh=J+hvT9djKWEh2KaPq8J1xxPp4lqSyqlDt6JIH48cZng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qKPhFn9Lhh8kRZzVJnmerJQYC+NEI9RkJwCPhf8Opgp932xLwtX4NumAvfNUO8xSiLUxUF5hfzz8yYpvKu1J0jmHHaqzu4CJmMp632jJyX1P2xSyqezguxyvKz/8rvEFOftVyOwOcBhZ54lVqJtR4AKLurlzHerAQwkfYZ6w6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aI6AyJc2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aI6AyJc2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1712a04ddaso806036766b.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 01:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784620835; x=1785225635; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=aI6AyJc2q8ssF4ces09P30ikBAQl9tsimfO7YMkxpeHQOiEo6cpuN8nI8cABUIj+KY
         DpOYa40KQsGm5iUqwjw9/2bM6cMtqD76Csp9bYzu4yvPy/2Nh4GAWlkUijCcDTenlm+K
         mXgdkTAoFFJZR0EyMVNpzoADMEMOGUUum+9/v6jp2EFGzA+m4XFi1zKTkRYVbLkIpO//
         usOavCVMubvlKIM+jNcE1py0jJF7yyemDs2rxTLQl1OWpMf2vT1VGbxkFJatWl4X0hXu
         iIFradtynHcgR+cpYj8Kx8uzhMIsSjzIRqaHRkqwxSo7nTYViVzDvcvceDIwN3nnHdBU
         Ulag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620836; x=1785225636;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=ATuaOTD+PcRNu6W0ULstcdnJLiFkSVXrbJ2bbVb8jgHyhr+zgxlX0BRC89+IFKozYU
         qNcd09KRkvH7eRXRaDFUn2GZhkJb/XpE7ByNbCozGLC9U7Y3wyiDhSyfCnht5foB55ot
         0XL+l9OPfxhKCW90WEcK4v8B0lb2uvwSz03f4YjL8mPABBard09OtByCyzND21pHxWKS
         q07mbMixwStSFk1YR8Y76k7euDSnV7Iv8kjVBqWubyURC5KI80Wz9qrOGWZJ9RXXHPry
         pEOOxmivPo/KEVZjqUY9njp7FruP9zjxA0K4s94aWk+IkaG9zcxGMZYvpeu2fAwoXAjR
         UNUg==
X-Gm-Message-State: AOJu0YyFZkRAAkQa9zyJTGLDzQqox9YgoZLWf6aixrVFXFCQYf5O4+mK
	lF1FLQlPG+v9t673GuddmBWlpnEkvgQpgaC6hNUF+Uu/eEr21gad+gc/RTQGe9Deacc=
X-Gm-Gg: AfdE7cmT/+NnrW+LcT6rZFV9mXonVEPzV1jTZYwAYAqym874FovzTfOyHLEibk1XSDW
	FLZPg0iggLguRcW/KrVge/SQ7SoASIOMoXzEbgwT2EpS45EH60OwHwL5mjZbmm7ICvjH7x6TH49
	rvJmRrEwQsDVi0txrrew5tngP5v8v+KzBKksH6dnNmQSMxld/2sc53Ic5qPBtq8EJ+nwqEZClkS
	vhOxr3janMlbqYcHsXIaztb9kwJu2eOcKjtJi29w9Or/DgDmzMxmamCz8RXG2KWbIAOiRRsJv00
	qDWi0iioH+qMxGO5hjVhCHhGWXTguWX1FNsUAYD4xnTjUTrqCVlP8olsOW5Jd717qq4vXFTAdsS
	1FEgvvSl9bSOClMYCX8xFBvljKHCjoJyAhb/h1JxI+USlFuSx71iQZmHeKcnqdV3RXKEOKttQxY
	LeIfJmf/B5s+lysZZywWPUWbemjpUpGV4rUMuwdma8mMqStGHf5hibHMsyGDWEGcHJKRMcIw==
X-Received: by 2002:a17:907:d09:b0:c15:e04e:aed4 with SMTP id a640c23a62f3a-c16b47e6906mr747823566b.42.1784620835539;
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm541895566b.43.2026.07.21.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 21 Jul 2026 10:00:28 +0200
Subject: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywqDMBBFf0Vm3YFMSjT0V0oXSRztFEwlDymI/
 960ri4HLufskDkJZ7h1OyTeJMs7NqBLB+Hp4swoY2PQSvdq0IQhuHZhrGsuid2CS7GGdJt6RS9
 xlDijUdQbb4OlgaCp1sSTfP6Z++PkXP2LQ/m54Ti+6Uvzw4gAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
register layout and is handled by the generic mediatek,mtu3 driver. Add
the SoC-specific compatible so the controller can be described without a
legacy split node.

For now the only user of this is on the U-Boot side but we want to keep
bindings in sync.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..42da2c6dfba1 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -29,6 +29,7 @@ properties:
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
           - mediatek,mt8365-mtu3
+          - mediatek,mt8512-mtu3
       - const: mediatek,mtu3
 
   reg:

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

