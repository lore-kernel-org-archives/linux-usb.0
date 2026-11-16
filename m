Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864421;
	b=OB1K6SCSAo9/bvUZ8MFjF/fycvQWGyvO4X+AZkaiJ1pNjrDn5JZfpN1+9GNVc8j5C7NK
	 jdZS41xVNfan4cU4o0GSftyTTF/tWf34dH/iokIfcpskIhaAbKkA3kjR3ypnSVA1s0aYg
	 6BHqsoLusUbWmY70udryNUdNkiXvwvGISmdWncAfj8m52tWNhVjdgOPD490zz9iCR6nhw
	 31GpV27BXwoBCEWXe8PtzS441Xr12LftSOC+TGVkoy73eirJrFY8Bqt+ebKm9GhsG10ko
	 ZuoBs59oupZ201dM+x+DRBtI1Vj7t/SbwfLCOca4xBLCU7Jj7vxbK2YmArAaxNjuB2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
	b=1n6K9IPiosLIOS5KaQOVt58JsAa0UYs3VnyOOckBA8qSo9SgTyVlFOQ8BM2aZdhVtdxU
	 aXtRqOybm9WMaZ5hxXtLxYuT6wNFkguZhKvUUD++WFikAV+k818t8CocJjZM4gQeyQaNC
	 N3TT3XrAir1w0NzHDP2o7lb4elY/o0WLCc7vIsr/ijhXm8T1f0yXHrXFdJmXCrGEY6U8t
	 spf0Z2poiBgkrg6Dwqnc+cJ3RtYflnxpqLHiRUw5YKsanZ3y9iZIizbFKHS5cVdaP5i4z
	 XVLqWx8GtmAEpTY0TG5QwSf0VJvPj+TwNO1OQxEBtUXGGiJVl9RPCvFJI+eq7+jxcMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkgL2gk;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7C0606A322
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7C0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkgL2gk
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso45094795e9.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864419; x=1795469219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=lLkgL2gk0QHyzdlrISl0quTs24SlvKBMOFoH1j1nhSiSS7JrK+rmqPoGnROwp4PajW
         VeDHrF2l/KpppBUbfWOTOW5Jyih8ZdeaJORgZp7fZ1X4LC0f3uKoaabUuJ9TyYvtFXQZ
         DeC8HfyWDeKEMkb86Mvb4GrBoZFekGhg+QFoxcILtp4GPkjIrUJTxwXwmYy7wQi5P2qm
         QXYM7HxQNkhbi4kAyQPpLc1ypzpHNgh6uTB3bmXhVTpqihvt2TqYQ6MlbLWHh4OGTL0I
         SUPSh3Lvd0vX4kNZX6t31437DW1cmDuLnDDpn7okWV7cTDtFCrWfSYavOzRWSnj8Y7zD
         H3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864419; x=1795469219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=yFtQ5Lh2V6l30YUD/+x9ADMwDhSZRPxxQaj5viMOh1UgrgYbWj9j8MLKs5zMb1H28q
         25OX6I2HCYsL4UEzAfFoIQbNJdCaKo8CSXLnlOq7CXMhjQgL52OqCJyQGOCeFNbJ61mS
         dc7vZ5b0hV5RQtZyUfLUnZGuDPq36Bwf9gb3ErPoold0Wg0wRw2duuKz613Vw5OE9u08
         tWmHykvFGNs+nNNiBr5vNh5imKeKA4giSbyr+ZQmVvIzBP3HkfC8/B88PUxMpI7bNgtg
         RGlRd1w0MrnxtAh8Ap1wGBdr+y0yDo5Rx+dMNS50ODPNqL6OYOZ1ztROzmGy0I7huOx0
         fVTw==
X-Forwarded-Encrypted: i=1; AL+hErEc/2bUoJeuFIsGr3qkVPehoJYtORPkvcqtLEmV970+/dkmitilLCP//0b5wNPkzitmo3pHqrCL9DM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AtF5IYaVG6nh2t5lCYiAkcr8ON0eWFOaGiQBXxuKWdSp6Bu2R
	AGvPVoJCIBvkYwhEHteW2fjev+xDOemsen/EHsYD+1tqtLq6kmmxhBW6
X-Gm-Gg: AYBFou1cuRzszikDfHi7MXRzOczUMt+j7PWu2dW0FHIvwJInkv6endcQzFM4CFTHBDk
	q4hRPE5vkyejIISZZx/9YKOWqBiuNW9IVwM3KshDGcXlxSupjSMXxO9rqQh3aw/E6RUAzI8DliF
	f7VGR7HZFdg8ai2/Q5cclFAaugTV6gHmcbi/IHctFLTH7GeJXm55FN/11JiFNBXiXFzxAT5O8Jm
	WAksPG8qckqmFPIsZkwFx7J7ZNjSnVH2JbikxrDgcxL5tAY5dbhlGnsldVyXrE/qjgM1Bm47jD8
	kU8vj5hpQ/rLgRVOd+DnSoa4ZMfNOnJa7ba5Y+oYPAJwxBE3mKHK03BPofLbytkzoaPym3uNcgx
	SviLGLu2u9o2vckrLKg08hJa3B0r01ojIkvjfkkjtoqZyDZeH5gCwOtt5bsIIFxzpgRVNgttoif
	5rsNITAxkhJw6+Q1gBOKiEgO5/TP5FDf+qlpO5nZs4Fs9aWm7iRqSXs7zgFrpLTp6vNO+XxOUHv
	PLBI/MiRyZmZJvt97Ex0QLb4DRcFh4duHQnCI9X8ux2zROl1vqwG+fJoPFs2hKmZklsLLpwL5QY
	rKIgfH4q8CGL1LbMz/SK/zJoJZ21LKo2Gd02lXLL
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr184592375e9.22.1794864419406;
        Mon, 16 Nov 2026 13:26:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:20 +0000
Subject: [PATCH v2 04/16] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261116-halliday-dts-v2-4-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=jdhSJvOgnkWCr3N/XewHYvU/DMh7fs9E9l4PMB3CyD3bi1r+fHKz+jcOeuCkYmmgxW1wl/a9T
 LhE9PjP/kP5CRKJpxWsTiZqjVGzsx7uCz1lP4rAnXmBZayBQqDt+vzF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

