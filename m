Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578233;
	b=ddmUbRuAYIsg7CZssyDxsLJH9aXvpbIx+ekIZjDvAF5uRTfQrj76CslVOXCM1Cuf4+NE
	 Kyed3cxNHQYUQdQJnU9vTjD1pgJ20TmlhhtIXT3yYCBpT47QIpKWP6DlTYzUvEwTGU0rc
	 +28liLDOOPe5gdKl7zx4qKAiGc5SsIQb3MrVspnEI0aNd6YdN7/eNvRfpEHHyrF/LzJ44
	 v77lHkHeel/ovZTTsdUTYMYFmwsAOQnQl+zxsfd8N7Mo9gBcodt4LY/CrZ6szjHIYimD3
	 ahKGvhvu7i8g0p5AU0htxS4Sdg0Ip+8M/0dK2phaFU4bf2Ar25ZAlTlxHOGWsfyaCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
	b=tKzvi/FUDPyL6oQMSheGYN2YOLiv90wb2Y7PC9gL6/6w6V/a+saivlPlTEZULbdw29zn
	 dVUp+Yuyh/mdYdf3d7eb6EvjDmKBLDAjBuf5ZiHEVXZBlnzqvFVu+TQnPK7PcSxSbJxkM
	 tjCfDu0KHMwdXcUyG0vidBay46tC/4m3aUU55f7e4uDw5J/5nck6cFkeQHXDG5DgI1FrO
	 cw7pzN8fb4uNPlnHT7Q/QjGzBVl68gjetWKVf2WVOxh/tU0rShB3TehmfwZWHxcWrlrzW
	 qq6L6hkD8+HH6NgH7fD+jJ0vjQVJa0v15zGegL1HHYGcWplRTT8t4NPmoa4cDkdjZzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BBF606A330
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BBF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so30183335e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578231; x=1796183031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=nk8tnEm8F0P2E1eehLNgHEIiXKzmAdnv1GtH/CF8tgRUFnMdxr5LS3wLsOby7S2Q1a
         cu5bhPH6llcMl0Bd4Ml3YCNlc2qzQVZYy64BU5JCXGdyxYTYIWgn76wItDfnowDbq+tj
         mBu/u2AoC4EQMLN4E5+BKngr2RQbPOWFa/jkefPtJmpcw6O8iLS9NHjTaOlxM5gw5aE1
         TTT1BHa+N0e/SyZxRABUIDdmTTKnn6jXzsMzYF1JRXep0cV+iS6lgDbG7uwfsTTzKX8i
         P7xAltyFkuPxXGNxubmztICD+yHtWeFb0K/WzvCEm/RQin7lrSfWUIrr7aelUKKa99i4
         BZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578231; x=1796183031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=N86uhw1Q7iprlpapTyDYol6/W5Y0Go6n/6aeKPj0V5COi7ckWA7+ahayFL8HKTG8GH
         QYQu6LcfXzCxzoTonjS1rO7KmPiyzXEX3nldfzuZWTgUlZaoqaEmGgr249CLfxWkWk0x
         NNFIIiJ0cKp41A3uCGQgiDQykJ77RG6yLwWt0hS6vu+rYEX+ktnygNKKhclJvfQidGux
         QRuqdPT9/F6FUds6rKH3xz3rp+m1jcEbLf1pVorgaUoxT4sLHHBJPWyL7tnOx5ygn7C6
         +9ZksEIAScR3dghW4YXdROTdOPeDqTdah5KOkeZLkID3nyQ8cTBGG7zhJ2VswxO/QPm2
         dwpw==
X-Forwarded-Encrypted: i=1; AL+hErFbFJN++xOJjvn5rbC/iHut3NH6pOKD0seNtQ9Blb8E0hrE4CFbudE8cV3DqHSqvzokM32svNU25oM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V4pesFoz8DD9Nwz/TvCorrSmzIyEdKcY5pKP7kpfoHXcafeCS
	aM3OtIuFg+SSZpXCUE+Ruj5J1GkHnzgQrLPVz+FijyEEKngYS3PeZWTb
X-Gm-Gg: AZFdTZcys/VpJjBGAO1tQzvpQbcDP/iAQ/B+l8KjIO7S8L1XiSzlyiSqxPycATC4RVA
	Rbbw4fSIU2vsXIPBAZDd/fjs6yJU97mLEdNVgZ9Xjhte0ZmjUtu3SwGbrQdWV1i9aW6muNdxweT
	3NyUl1QYSeUL+Nb2OnAMfhnAev/n//8HmLGvZbE+l+u9SZFtQx+YbzwjLDJPcSEc9SsL4bjY6zK
	k5flyWXLjy0OK1sFl4otj0M+h+w/wWQANSDOxKFjPer2ZZJKEwri8LKX59IUf2lKACWu2TnzpOc
	2pFxZZ6sWGskYrd0L5nCE0P5aNbugfHApjnxa2/XCRioViiWGrq+2vjKNKuIuVz0oo8GtlSKFvF
	hi+8SbPCKEhUaHI7QSH2QmsH0ihEOnc4bdzBm6aR1dgwi1xlJdRw4YtczwBusi12OqVfNi5vUF6
	O/TedYKRonuWs280QW+XJs3JCHePwmHcqLui+ZsMj1SXFHB2k9wEJxF98DtrcMaXecbQlsX0Nt1
	8yUh03EoIH4y/mZ9RtJj+rpsj36WZ/eGBOtSSW+rLJdavS+3zuAtexuPG/qk9gOz97GQL4PMxXH
	9JTq7LxYH0bF/kwTHa2LT2t1axppugfvxsD3vw==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr298467665e9.3.1795578231386;
        Tue, 24 Nov 2026 19:43:51 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:50 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:00 +0000
Subject: [PATCH v3 04/14] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261125-halliday-dts-v3-4-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1362;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=rZ5xhc0Wj0SK9I/jsxkVVRd7EbEiuk5dcQZat95a7Og=;
 b=FzPufPd+aRuNJyTsxE9xMnhrwTERQ8Vq2nvn15hQVL6HtktHPs4XaCfbTVnTG1Tm3lVHQREl1
 vEmjvIE2KTICBxf0qc9edU3Nbke7+MDNmTz+aRTaj8sSAc1QRotZJxE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

