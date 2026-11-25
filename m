Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578217;
	b=tgkwEKpNiXu1boAkMhNHHWzVwWcQEKdG6LrPMaWp1OgpFuw+qGph4g7fYufohZN0u+uI
	 FJsGR4QZPGCHePALIEFdvAL9VVXNkZ0gkPthKFLocrHnXhxBEO+u2Nb2tTHJO2Uvv4HV6
	 8BnG6YRKtvu8V+uyyUeUNdAqN5H18CndpD7dXMU3enke160DVV9qECJlXbcUs1N8emjaj
	 jzRTC+ibQUfuaFKiBDQqrUu+sv8xPlZHFQjyqTsNx+yJhAlYhdQSbbQ4Xa1O4xe5BY7wn
	 uEkJdWlB2Ege+Eep0U8jNnG5RuP/cTU0i8DoLAkbnB+9HqhDqtA5PNF0IONdsAucfEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
	b=fICyj9ZoZLQUer2YNsT/u7jJmQFKnM+JtcD4ckn286gX5hlCVjKmaKbFC1NHMzEHLAke
	 TmnRh5jQetcm0XW4dFCwqBHeVXFSB3YcvOs+2zHtkQ80gEICc0hTqlVyin2qps29BTMVr
	 88TFVCIyVgfinC/HS0/RadvEmjEabFN4A75okz0zTMg8V9VWoqg+FfLbyPAtUzX5e/JFe
	 10xn43mJw8ohlyMK8g1JHU6ZAdcMQqQVbTytF90EGp2JxEbrN8W/1QmyTYAHCCmzDgjEv
	 AX/ae2RR8CoxV1Km7rW21zeVWW6rwASUiBspiZ+oqFIe5Km/4iSUQHELJ7dfQjmL65g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHm56pzM;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B4F606A327
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B4F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHm56pzM
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso51634955e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578216; x=1796183016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=UHm56pzME5QuJjhiAlkwHOpYeDJa6yB0YSYI1bvu1L2C1K/b8c8JqZfqvQO604D27u
         kbijntCdsTmXmZuyEXTOb3UWjibtttn9sm4yIUhv5BWWR4I4ZkBHypc2EQoj8gClP2kH
         iWlUwFG+ksAX8PfuGzyqwgPWimGWoKbwCaHODUEXgT6GTXr7IYQf2wZ866+zITCViM9+
         cWdmBvAUOA0q46kcT5cB45N/Ty+c6kaDy9tabJMeqja7JP84/DXzhEmYtOJHcJix8lMn
         ap6y5YurBKaiszdHFCygN5ro1OeYnibVACzFSOUr4CNcobuqzEvh4D1LFkTgVWGuKHY/
         cXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578216; x=1796183016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=1IGIDFjaMmCW4kkVGaGLuA1e4MlvgwOtS0x5/f9cZBWPnIEmWb/wUlR1GAwd3PQ0co
         YWxkfeqrE50jUBLdlsiN5XjnlQ55a1P8Rh62QEGYg7pWIcb5CFg1+HpW90L6a94zxpEH
         XU66OkpJsCBIP2oGftQIA0aMX8goMYeLCKnwdIlnCyDYjUMRxEQfgWlO/nEfp6t8cDRB
         yj2WHmDgpxJdqIr+130VOOZCSgurgRCECg8d98nTbG6ugeiu7PL94q+SceCywhP4E7y0
         8WX1Z7MgVDaOCCreygGPV/XlLvM/8Yg8S1gPEQniCzehJcq68zyN3uQVaDh787OMQUjb
         GmgQ==
X-Forwarded-Encrypted: i=1; AL+hErFbFzCrjQK9IK7khAme+/MfSpEsWecsHW9J4JBtQIvv/I0l1ZIHVhOz1jrKs+kvHkPKRz7UmNV9nRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4m2j+J5T+AETIq3O5/9IORVPYimCSGyE9244ET0hXUC+8xhRL
	0kB6TiqVYQ124iuiGX3Gj5Pj9SRDw0zwcu7qnvBKn0SsAVFZiFiRF4DQ
X-Gm-Gg: AZFdTZc2qugkeo8NYDuB5J0zsxRIzXaQpblLdcO7wD+8YY66D8tFXXrlq77tdIJzPMG
	PzEXUn6L5pppS7zYfp4KQ/u0JP1AykSyouUGZHAA/99BFH60FuCon8FOjKVLv+QzfquWwrWxDGA
	WTMX8FzYWlK13VDnofEgN2vZafY00jbdtZO69kKPtLPWeDL1nyboiZ2D4LJDtY5aVW2+crvoRdX
	sGl5wLcLzNUL2M+1wHcQpTY1bxnB08Tb5P9wzn8TNn3vucWRpjc6HyhTXpessMRHdzVJ5muOqG/
	U9UXklfXQ0W4HGeGWo431l5YBFPjPveh2489SkzPm5w7RUhRMutPr7xyglCCOaJy8PCcYztVXSZ
	lk2lsH3jxLIpN+TA4Gv1SPBEX9rP97221nbI9Jh+W3S5eNbhq1pDu+1C6fhhUatkf/5iHBRnBZC
	LAdR6U716rE6ZGyhdK7rNdeSD6FBiKhCI0QtqfdyHzKwH3xYGkW60yhXwjO1madQydl2aBzBUhG
	0gi0qRCSj4RGIQ6ukW3U9iJXANquASlid2Zhg4zh0FmM36iIP1qaGfWKQ3hlWgGl4HjVBHSVNg8
	VCFs54+vARC+tVTU717iuc9IXmg+73PSOePPYA==
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr346329005e9.34.1795578215688;
        Tue, 24 Nov 2026 19:43:35 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:57 +0000
Subject: [PATCH v3 01/14] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
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
Message-Id: <20261125-halliday-dts-v3-1-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=910;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=TIEe9N/cyAzKgpuoZBtDZhrBfZnBIMsVZBId/jMf7sU=;
 b=h6Yv22yIDPhl899/gQR/dzgzFCiAwokqygzx53AniCMssmz68nf3bAUZ4boIxRmClQQzRo206
 0Yy7j0zKrrDAxm4EozqJW8b/LA63zgVJosiVzUEWd1tTWYtwAKtrSzc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..cf20041e86c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,halliday-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,kuno-pdc

-- 
2.55.0

