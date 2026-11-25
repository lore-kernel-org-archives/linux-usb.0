Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618566;
	b=o2jrKoDEuoouDOv/0sitLKiJ1IoB71cAsmhgWzz11pR+JVntHG6lU6c50UXhtLnvCn9+
	 qibdhI6ijLpU1glPsPmcvEsF295nNg0f53sQoyfhstO80C6z/SVycICgFTPaCGIGHQVPB
	 C3JgG8cg7qUnUBMayCSlRp/VYOU0+Unurzy0LFRK0Kszw69YytQIGdvSXIoPeFAKKoNC4
	 8o4y+Sk4qumXTdp3GhXNKHotp4VodPvxskEOCZ/I0j4pwhG5oaC3qOCxFFkXujRzwP07B
	 v+kbIFCetjHe/7sWmkaGjJY/A2xZ1IOsSW9fG9hjrBn1ft1sxIwIV9h/lvFkJVimq3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
	b=xI4AodyWf2Um/7nzDwTXmliVlWCB/XeL3B/1OV5wBw+YaReJLfhtnRqpoiGEaWboFzx9
	 zzJ/E6wj8MhZKEdYuQI9vebIb+w8I+CrxAh9cQFXktwz5KvEK+7ccHLPsdyksPK3fUzd0
	 UpvNg7457wniBF/ReKMLzQ9u4d3HS/8PA3y+tkhY1FCBl/m04NhSARtvExewt8z/NhJni
	 6XKz+7qg6Dq6PFRXUuUJttqxjcZohHOqesPX7Z9Ibb4wjro7yX/JZv7VoJ/E/fXsbLfc2
	 0QIamK93+gSMv4PmFQlynMsDuJ3WTCgH9DqgIFf6eSbKq6PHUB8/BWFk1bawQQLdlcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB1606A33F
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEB1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5191032f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618565; x=1796223365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=rP3+wvtvUd5BSIItbmrOs+fMb/0tNd75RRq96JkoqhT2eRlsZpvHYs58csYL9y6jC6
         23pnbPaWHTI7RwfuLJWrG+fVkrzK1tNpTfHSaYctf3Iqve72h8d4lReRmROahuOsvu/T
         suSTKS09GzA1gOQ1e4myNrKP+7403yLnbs/XIJmiFg5fGdEjknPDIozsIJEW30Rb2LZF
         B/LOHyMnSajEVKjqKUfTUHyaIWT5ZAKRHNAMaPDCzBshEJVslfraeBKopAJEhsswOIpH
         EuxLM3ZDnQHzClCqb6tZJBtxYNu6l433fvIlgFI9OWyHQo46c09tLu3U1mNY4OBKBG0C
         2jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618565; x=1796223365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=rrcyxXumnOXI518wAdJIoz7hatBqfHKL4cruicwF3rgThZ+CqVy7M+Okuo1CfwSQ6d
         RVtG641ik0JsFfIl5vMbTAzPCBe2dcrn2lvzyw/BSGA1VFvGYaVr7xRcsURw++dJXXOv
         ZUBQ99U8k9WqSfzSbQW9oj4l4ZetHujfKYrX21Ak+qCDNlMHkdYdl8vUc5i6GbD1jT3V
         m4y+jk9zztJYPAd+C0gcm7gpnQoymC/Drdp2xDYGbUviJ2/vweAjJP5lS210rsfG8eXp
         BvC2xSS/rrrCo2cy1UJI9h523kg00JQDcyNArVCgukiabAslZJ6+xBi0XBx0SIgdzjCl
         NCBA==
X-Forwarded-Encrypted: i=1; AL+hErFNI/SPXHmMZviV92TfZmqRpupU9+jrqbhTed5oC600UULCR2OH+Jlg7rvgpaGb6ET/kV+aKUVRwYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MaiV7VwgHkNxTxZd8Nu/tKFrHGERqBUO5LXcmIivmb1+Oc1ri
	2Wj1unmMDmJlDoB6kF0SvUlOcYy19R5wi8rpa5EVvUKyd/vdoQ8sAl7J
X-Gm-Gg: AZFdTZdzLXb/nB5wcuqhUgmr6eaQGLYn7MK3+sLK2tMastWYmXMlF2W9UgVcqnTLFyc
	Adjm2hoSTbV45Edqfq16GoI7tPLJ817TRVf9XLMuedKF948Pty5it2KlvuriID+M5Ih3gveJg23
	aQEedPC7Roray+ri782FisF7GS/95SzG6yjK/YkUxtLkZv7q9aeYyDtS35lM+Fb3lAbmrxX9Kkv
	SiIjVKE335GgIJ0vEq5WSrdwHecphX+X3eYL+ZbMMt7T/9SeRCRodVZJNT+QBm6OV04s4DtSXLD
	jbwFog+AJBJoOzi3NzLMj2e5EUutKeBZxFDt/c1WWP9/J9OuBgV59rHujQGpFymxPXQF8K1BrPg
	Sclj4raxp/lzJ7D9Efzb/kzKzC4gTiI3U+EA9XWOxXmquZUlHXb73VQ8WOO0Trbe1xixtDw+uvz
	R1NbKr8ZkzTYMZVUpkhhUCRuD5XR/Aeal7bX6zp/XpYZpXj/6xNOFlZl3A7SDI/KuK+yab+xZOf
	fCdcaOI+/2+3kt68r2Rrcm7GhK6M3Ch0IHOsFF8GfXblPz6NW/+4jpTPW5m4xIsf75PPqpRG9rs
	p7Je+vIDZmiSHCDBnOiJ/6u7vAM4B3g+SiLkpr/PpTP6jO+XS8z7aUtSJQlkCE6+hBjaYfj6wzO
	iEL/CEEw7tjHqbjrA35t2MI5+lF4k4BIxQg==
X-Received: by 2002:a5d:5888:0:b0:4a9:4dfa:c151 with SMTP id ffacd0b85a97d-4abb683b6c2mr32518885f8f.26.1795618564618;
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:53 +0100
Message-ID: <20261125145458.2594179-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

Changes in v3:
 - Use an enum with the exynos990 entry to keep the exynos850-compatible
   entries together and keep code clean.

 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..25536859e5dd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -25,7 +25,9 @@ properties:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
       - items:
-          - const: samsung,exynos990-dwusb3
+          - enum:
+              - samsung,exynos7885-dwusb3
+              - samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
 
   '#address-cells':
-- 
2.56.1

