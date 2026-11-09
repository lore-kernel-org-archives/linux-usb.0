Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184461;
	b=RnLfrSaiwogdWMkaKC7ZqWj4YVUFzcVzLp+AjFZVyrKSPVBCXPwgi0v/e8nVKLHVGBW5
	 G0408mmTWBBpKAqZSh4ujZ6HGp734xKXZTPyPSQj9gaViLPhKVWtCPNi5g9k4HQD/Chu1
	 5AxWvRKnMniWQ6Tcq90x0qiMjntPR38tk4rmySCnZnRyk4GbOj8mnjNIA4Glb53JbtxwF
	 YFYaeWGbAVMGtM+M+QGic9pKD3Z3A7Mhqu7crRAQw+cSMB1mg0Q7GvroyGCtv4qVSJeV5
	 N/ruNir75EboOt8BlWZm5/O4tfygAMt7dpgNNptu8AMEPJLPrKjz2Xa9MT9ZzdZ0npw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=nJPcPG/1W2bY9SXJhvXvsLDGuaDh8XPANyuIYHJ2VuQhje0jNqYLvNEWpcnMIhpIENwp
	 V3xiu1W8I49+2LNJwUP6vN5c2k06OJk4PZh7vdxu9mtadfjlTwclRypPLLENEvNNDdcNe
	 oiPze8L6DywropvUL8DtWCbT3dHwujswPja21sMq1V9pgClU6gSWHoEoU8v/gXqqTOwlj
	 z3hKBBd+Gyz1xlrPB/JRYPh/Mp4KuBJhFPmLunoRD0bkPXQHlnPEIkGNR4H6d79I2ZbbB
	 xR8pVnk6Q9BqzFz9TIEOOKNvdGTVsIy9wwAQ8NURhSM6qAMsF2aLnRb1D1Dp5MIMIKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7tYZs96;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31EB6083602
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31EB6083602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7tYZs96
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4910b863b84so218853f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184459; x=1794789259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=N7tYZs96oQb/Ryz4NJ3+wLdB8gJYPV0iNzi0rgwTg8Dg6VnhJLQB9NE7KBBYmhqD6Q
         axv3akcYK460vYrVrYt3Y8pjMRxB16kOVcf0K48qc42a/8TGC86FwwuNSDSXLA1hshxp
         XP5NnH8JLh/r0xGiHagFvOyQe9k2AUIS1Pm+4EFPEOHWnjDLNssuwbLINZZGdJZhmIDh
         kbRkGnA3vcUMtNJahy6FnKi9GjefzyQbTZDRLiSLqJFXP5eAwsWARsf6et9MsoIBKEzN
         cBe8CuhK7MiiqlUEWwipkjXVaoHzBrSnLgAUTUGXqGTOzI71CsQIVtEWNZdH6oir6Aec
         712A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184459; x=1794789259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=coaI0M5PAdclS4+KEbV3TRp6TyN8s8G/rK+J8TzPUn6z2AI2gIclemRJnPZeBeHCvg
         cuwuaXq7eeH2dnfGDNEbeAahL5SHXzmnNOfWSuoKPaCMno+Uo9Y8KeiT76emD8GvDkaJ
         saLka+S8wpLdUADBWSUh5dKPJT4H6PDRaPWKsyUnm5QogVMzsdpk7PbsS3jwk52JQ2k0
         7UwLkas2txV8F/Le1kqjdKQIR58R5dC6axXQ7LK6UNWltVq3XNI6BTumTySd6M6cdgUP
         AlkDeaIgxybODQpu0W6rLdyr6LLSiYbOSt33NO7mztwxuchxK42sJ7l2WXjHWeOVZU20
         2tVA==
X-Forwarded-Encrypted: i=1; AL+hErF2fagSt1ktTfSuHG18uTkFoEzysJ6duuajSCYfl1LC1ptKTK7FI1LPDNjyd+SruZEkTrQRPS4D/sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WN8WUvFiTCk5uRnPuQ8yifjoKwB7yBYrbXRQHdLst3nftdQw/
	WusF2Y48iYWO4bnhXTR7HOueY4ZWEGrpyEob2MkzZXVBooo4PSaYVBJ/
X-Gm-Gg: AYBFou1DYyjVSyKRXdiGQYSI2DOl7BSFwEAmrPjvzBulDFNhuR5jgSms3TLgxyNqxv5
	vEIB5ZYbtMJRIyLToiPjIS/+ow57NtxxAabyRf79IufOR8rKH2OHxZbc4scnMIRw+oK/ECrUQNH
	MYvNPrk5HSz6IDNWsCzKrfRMQsoKeflva698cSJiJ2ZSvSK1UXuNfRh7AR9DchjiBkuR7pWNKIM
	AOqtLCLLxpzye04uTaJFqPzPFA27EvR5Wh55X752CRawZn4tISU3Bx9sLzCWXK46bl24o7FXRWS
	1q81Es9MUjRtWQlDyrK+A1GuZCcLOIHmAgoJS70XgTrEuxmlsyvPOJHtt6cHURM7uUuAC4mgt9M
	gSCjb/YarN8oJZA+zlckAS4USzq4UTarKgh1uBhYze77quJfJJ91BMbrwkMtfEIb64HWJoNfb0l
	slGDs2OuPggTJSBBVVK43eWZd7E3KNfWkaqiES14XJNc4PQ2zSieIQ2VJA0rm++WUSBRQN1UQUe
	QbkmABy/cEiiL2TXAax4Zyy10+HSVkb5CysFmE5AyWbNKz7uFAOlvND/lmGcRuAl1QHCHPumkuj
	FOrxCsNcbvm+212X6Qxf50u6KIai213HCBCFys9A
X-Received: by 2002:a05:6000:2511:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-494248ee013mr10847131f8f.21.1794184459219;
        Sun, 08 Nov 2026 16:34:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:22 +0000
Subject: [PATCH 10/17] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261109-halliday-dts-v1-10-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=whHNXCMkWBlbyRe6Xqxsfmk8vbhGS1Ie1Ck2sCxfwGhqRMBxKE4lbZ1T0XWovH16DltXzjMRT
 ok60qvi/6qNA6DJ9tcvRYuZUzSKXMRRZZv1H2XgMMF2zBm+cXxEQ/SB
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

