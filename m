Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184441;
	b=BqHrWYQ5OpUm3dK5w6eM37MUl9isKUJ3EEcPxVGWN5uoh8WqGmRe/wG0a1V/j8MXkavb
	 UcDNy1T3ooWT5nlLH/e9bP0ZaK/izh98f0F7jz6gZwj3Gw+aVRuBVJxOEqCjKMbx31Jkb
	 Aqvr6m+xPE0lhME6DYDtxag0xSmgbCwh00tTgDL9Lac1FTfrms3/LZA82wugVr0uXJcFP
	 ae+qmKekBsbijVvNg51PwlYZVk5zrONCoijjgjhU6cb0RLGDN271GqZQGJL31zp3XAaN8
	 BBKgRZW9QOEwUO4dNojvxRxuz1qWeyHrTh8s8ojV36S4WCQozco3j0p/ox2NxIcOmuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
	b=ZE0t0OmBKJVuyO2Cn1iJMXdvQf8+buENv1iqEOiUZCNmyRzwuSD7ZZduLSt5T/PCt14l
	 wAQhRFKRyZRcySJHLf7VoUnk/mLnbg4mA0tU3WGIBPJlESoWWhvCGvNVuplF/LNNduQpK
	 GzdkPPDEg3pvu6On/1P5yzD8tt0HWJSHBIdKpbFSSLUTsNCRLdbWQfR+ux976HB+ClxeM
	 tow4Fyyizm0huQT40OtD6etCI0NhwDxBJ+NxhmiGVsDkBmX7vXGv6ZprWDZLFRMHBgquJ
	 oZ/vlBKjGJckH7Yh7QLqev4QUMZYLrcsMz+2VmpMIISND4Qne5jG3Cz3gg8qYtR50aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULEuYnxb;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ECA606D814
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17ECA606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULEuYnxb
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so187543f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184439; x=1794789239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=ULEuYnxb9uEPYMVwaCZFAhBSr3XRRf7x47G6eugQCaMON9WlvKKlg8odFviJChKVQz
         L5ivnacejg1JFvAECb3CXO3G4CGlkXkRUf5nvRqM76uVba7f3AbCgFEyfN//93jXlobk
         RRpUD1wxP334PPruCEBCm7XnO4U67yem2Q++cYePF+tA6Ll3cXA7KHUYpVW7bHGXPv3W
         01KWH5s+I/rChWyEAC4I/nugfLSJhWg9sy7NvKigj0oOHHQWEH6RZ1gw31QBj3pWz3YO
         YoqU83BPVVunbYylhg8fGTfC+v6UuQYbRsQ69PfH+mnbpLdKnjMRZknNIjNiF3iaLp2o
         JADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184439; x=1794789239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=zLlW3uts+ukIPshKPvG280lHPTHF6pcy78Mma57E9QO8rxC/ewQzBQ/o7d7ERbBD4Q
         rizDMwn+6K21bgIVX+ElKPGbVrEnDXB55QZKqA4YKtDHMtohgm2PWb/5avKC17GEsXgY
         g2yaw9OybYNX0SxcRRcwg9BUXIa+W4ivydBK4xi8t7AzpCAtDMiV3g6m26MgNLVT4Jjh
         Q7TAeBK6u97QL+Vb/E7JXsCGirMRrlOGtBMsOdD+l7U1NUaYg5bECA7IRNsVkvhhrcvM
         wPkgJTAdlACYUAZ92+ilGDSRnK9mKiCqWyyq5YxCmLg+8FbvcMPMAdTKTpo0bxTgJyy5
         y0iQ==
X-Forwarded-Encrypted: i=1; AL+hErFrhUcr3V/xpnXHHaBMcBhFi4dEnFSv0X6EJS6mbOrTbgTX/7zQhHH3CH1yuXRUu9FsYXE53dni2YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z84uKr1A3490fXHq00YYKeSCiamrMsU+FhhfsxdQtqpQb5OP4jF
	Q8RlHkhNIVJl+HRaZpq/NDdjBXzPcg7bUrcXBGqTB5r608ff682I05Ac
X-Gm-Gg: AYBFou0thtUThUsGWQG1LKb6RZgjGJFJkmcTL0fWsXETREskcYQJQyp82Jb9DSYxPSv
	5n1uLh4QBKgMseSwIEyOeis1ZgwpXNgjF9qBebeoIFBJqV7z0jPvi47BEqzB13KyC74gIRviRL+
	NpOAoZ5ThQXpUp0MDtQ9OxEg1B/F2Pw5nbLVBlB0JuHB+uOlOeQg4p39iYgAQtOZ50+0rSqqbb4
	qco59x1HbZTpvBtrZt2BUdxmit0HG7Q0AssATUEjj2rUnGbYq4Fwa/iA8KXUD2S+ZlxYqJGopDi
	hWtjOz+UH+DdsyxbWKmCfscSGspBtzNTJX6Jxc0CGqfsKr4q+0furDmiNnST5wArSKJUs9lV06c
	EUSqakr0tLGnldFMljQpBflVsGSuJwmXNXXrI4xShu/zdguKSuKlCbqVOuBtmTsR9B/5jLLASuP
	IDidnlL7ghVkuNW4QUGNRn6MYKscZfxrTmrkcSN/zj1VFu31Mjlt992LxohcQ5VFdWFojPQkhuT
	VjvrW8caVhysWkp8ddrGxrczu/w0ctGgNcMMlYQls5WcNZ8f6GgLyYLGxDh9gfF6Q1wzJXxBagF
	mL8FTnqCv/IoTZbbuSSvA0PdR6XHV8Az2wiDGwrxJUkueMAhdas+o4/6gUiZow==
X-Received: by 2002:a05:6000:3c5:b0:493:2376:81b7 with SMTP id ffacd0b85a97d-49588ecc152mr4851434f8f.27.1794184439552;
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:19 +0000
Subject: [PATCH 07/17] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-7-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=HQwzvS1g9UbQKH8v0/XpwTYPPGyIcJ129Y8yti74NjNwgnbgo8LwZJmaOxKeuHMuvgkZ+EP/2
 IP5h1J7SLhzC0/e/TSquB9CwBZEDq02qBgUbIWpMHDatD8Y+sZaCkxU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

