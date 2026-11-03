Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736136;
	b=tohGBEaBKZxBCypy+QQpza7pJQ/m2OaiAdK3lQ1mPDjKAhFeEwT/gWyt22vBClMPR7Yq
	 JMhcCBo2Jvi8wPaMDQa1ItslFVUJrRvw9nbPbBDPn9MF6dJaTGgFI0TVYK4r1RkD3Y/A6
	 atnP+fzje2pOc4kM/PGsgJ9xD+0a0m33gCkFnzQ/up9vm+S4k67jOvsvMsTOic/vo8YHX
	 9xJWcR4VbFLSE8tPR2mw9/nnZWoPCuzu6zxtUCNys/VUHVM9+S9SidvPwWaKdaOGMrbXF
	 oj21l3iHc7Tc8lhGDAM4pyHzHWRoihk0/XXn5ya2Gmjhc49sEuBg+RdZCNF2M4FGuNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
	b=juOHZzRjNyCa5Kp2vrhxgrswaIJT/oBT+Cev+dmnemSVUD1I7tHUIxk79IBj9p5GKwSO
	 Xb56D3BXlmSW1fp884W7EDCQj4p+1DffgIR2Ve65Lfif4m/pt84I9zh2GV9H+FvNV+gTW
	 2AjKyhjsRR15hmO36zrPtT+QBReAytMBG5hHOu2vnmV1yk/NCyHZAiFIsn0zL2nIgQhRm
	 XbAmUv9z3mm68HfQ6wexow8eU+wPvb5xJgW1VE9UXguY0LLcw1oMFEGFke8TaYZm6lrwY
	 A9qsBGlR2LP6Wb1WDC2kqsEHJBzBvd+vDmWlG9ErWZ7qD3Hn9wpt+zbluLBZzWgDj1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI5xhvfq;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B94606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B94606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI5xhvfq
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67a6cc9acbeso22339d50.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736135; x=1794340935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=nI5xhvfqJJqz/LKU3zu9PbzpzfQ5Va50DydxwoMOt8UGt+zI2aGOnKnPmhWE4PvpgO
         /jTWkeTivaXjLbzL4+7hJGs+vGgdNVRC4351EbuQnq6oPZrzzQ6uS3j9V5D3NV5yYtW+
         CbkFsNgBvcccolvTvLKds+5z5XXUJCRRXYGDya4kmX4KMrbgPKbUm8TMZ9rA8+Svw1QM
         8Bn8rVQdvK8VcVczpN9jw6uimilyL6otP697wUg+DpBEnweVU2NOlW3Iz4mYQrB4Q+0U
         dtuVH8TH8z+VORkTnLGEc0w0t/QwxZLluGu93dj4Ei1eDPPa2xF90n3EI5CGWdpgAHh6
         Vd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736135; x=1794340935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=APfMF2bvhbUl0Yxkrjk3YH4XZxnj6gOMoERUPDQ7PRoB2eYzU6cCQ1sH/3JzwJGwwQ
         W3eZ5p5nCjq0Wgw/MxGnvWXpTfA2QPPRUlr+ciozYx9gN+8kK38wNkS06o1u72ebLiOJ
         YrepYK8uefwMFCPjdsZ9CCiqq4xxVDyHQ6y5JdoBa5TgJGy6aespGsReK3EdXKgX7b2f
         snyIPsdjLKGmySmJbyc/n79iAx/lvHM3/VCeqTavHeiL+VCPw1t5VEDKR/sb406NFr70
         z1Vid4i6RME3RF27dfJZPfGDp2A394oOKCJZyoNFZjQ/i7dAEguzjMeBaOeuYUqhdeOP
         UjPA==
X-Gm-Message-State: APuU4Z8gPnl0Xtqd/U2TJAm3b+u+jA0XVlxV4pAmZ9fEEZNmd7/UzjUO
	qixBgI7jeBNGimcuplSXOBTf+bp1FK42pHuYriaHNBjqj7zuwN2JT/eE
X-Gm-Gg: AYBFou2fHJlnKWyQpoOPlK2DfoQabwCEbhTQAZsNyfbhNc2/sWe9bl9TMaHXWM2zKaD
	FWSi2Afjzu3Ka8169u4EspL0lrXP1rvCAiCQNmBIoS0R901ZhWsOoSijpHze6b6M3fs3dGtS1Bj
	KTh9ExmimhO9zkMMP1TjSU/n2eGeg8vi1PXz2f8oFTWDoKBToWrhf6uevm/EFgmS+/rILaoQQNE
	ruXwWJSE/7MPw4ADRaaaxDW+09CCt/cD5xL36EmCMJrqWfdlaSLbKm6ZKDQeKZX9pLOmY/TNAsC
	fw4Nzcs27smG1YARdIM1Vw93t59axxABCJjVKlYc7dsZ7ZnSZagZdbD8UoYoWNkJ2UhI5hg5Rdl
	4Mnb3O43/uLLp9UGQrPmoOkjQqzLI13QtHNYI2NnSn1iGRzJ53RPuGHeK9R+AVorv38oJ0sjj6x
	EJURlrhZS7Fx2zs7Ygv7VqJ/qOLLoU1yb/6C7hOXk52ashxRKr0ws21jjsuB0/KQwixTWDMFpcF
	vv2MlousWgzLe1+0wsngUdSTi+Get30Gx1qVV/+zEs3N76a4l30OkQq5C4kUacMrIUf3deuyXuf
	zt0LPB2WEi+SMpcTGEiULexKQJqnnVWsNTX75+1dCxnoYN8nXBob
X-Received: by 2002:a05:690e:128b:b0:67b:d315:7770 with SMTP id 956f58d0204a3-67bd3157831mr3828276d50.27.1793736134436;
        Tue, 03 Nov 2026 12:02:14 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:13 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH v2 1/2] dt-bindings: usb: microchip,usb251xb: add battery-charging-enable property
Date: Tue,  3 Nov 2026 17:01:53 -0300
Message-ID: <20261103200154.125681-2-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103200154.125681-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Describe the battery-charging-enable property as a list of downstream ports in the USB251x device tree binding.

Add an example that enables charging on ports 1 and 2.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
index 0329a6aaaa928..0eb3035553c37 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -230,6 +230,12 @@ properties:
       Specifies the time it takes from the time the host initiates the
       power-on sequence to a port until the port has adequate power.
 
+  battery-charging-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies the downstream ports which will have battery charging enabled.
+      Battery charging is disabled on all ports by default.
+
   swap-dx-lanes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
@@ -264,6 +270,7 @@ examples:
         manufacturer = "Foo";
         product = "Foo-Bar";
         serial = "1234567890A";
+        battery-charging-enable = <1 2>;
         /* correct misplaced usb connectors on port 1,2 */
         swap-dx-lanes = <1 2>;
       };
-- 
2.43.0

