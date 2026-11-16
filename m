Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864441;
	b=U2q49YDgUvOtdFxCcL+9pDuiKtQwszCMg3sS+dfg7WNklEA0+FUmEnlY5Qsz4FCNjbS/
	 8C9GzjexgGHU3t+u97X3a1ZR0sgCTjzEjaKjRQQyJt6pVhwYkxz5SoAZUDlJ47HukS/eK
	 yjidaWXT++iYFoV9PXJCqjF6Ir1NNqGa6NoVfp9cmv1T2tBu5YH1TPWAJnX2tRopqL0k3
	 2IOV/v5dlgEcFuyy2UXTi+LzqjMhbYjvp2RGcRAzgc+0mD18cCuYS0BAuRtw1xUDuuu83
	 gam1Y/hAeQRufq9ZH/wqf9p3zxoFkmG6of3fTHzGVHfgAYPzlkEF8uDoeR8z9Bo5HPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=DpdAR61essPJ8b7b7gtEM1Yd4WusI7VLxt0258w8tOO2/aDmpwFp6VbpsNuqGZkXKYUC
	 XwMVovMQbTEtrEPnGyXEA5CDTyv5ReO441mKqANqSVHJo+q02B46rvJZwuAJKmsx7AvM6
	 u0SkywaS/M0Fn7u1s3RTivIScX9scqB9d95wYExJEuYZd2l9VcMqE5sxV+1GWsiysC4ic
	 Rgy067f+574ve3nik+H+6N8JdFGPq8Ry2EbrTZGGXgIh2FJ9Hy7jFsrbHx1dcgU52Y2vp
	 3X8OaVkjavQ9mGz9Wxa3/YSzptFP3IncPoCQNxiLGmpfyKGzuWsfAYftHMP99ubNnbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG9pfL7W;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F339606A330
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F339606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG9pfL7W
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso27635725e9.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864439; x=1795469239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=AG9pfL7Wd/r6/98cIDo+nVLfIVZ9Px+zjsXE5kwL5C5mXq0vvRxtAzXqCOjP57c76/
         QDAdB73QojRTusWajXwvXLflOajjTrRtPUzzN2iBmylVD9h5CuWtCva4RFTGQ3WAXdqj
         QUPHfhV8R3R6+D57fWZz5PoRdD7Zh4aEwbeRy6IRy5hp3spzPFQuezFUatlivFZZIhX7
         UvyPXGEihmkcLMT0slqp/7SwQoAyDHmifQcdngvOwon8ytHUPr4DHYsG+dXREzWIOZZf
         o6twMtZmZHhO517aRhzfH+NpS/QusUvv1lm6Ilz7LGycETpzHg6Fbdmdyo/hrzPzp1uj
         QbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864439; x=1795469239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=0heIl3eW0F2rEzUvthkkq5hPjmiAxuDNCrxDHdd6ANeJEdMKHBrPt7P4ZRO1VrVnxM
         SdGEDs08WRLprf2f7RmWWLYYpAlRmDzQ6ZjfnDay5zgW3HWrN8RlSkmuHbl4l/l/RedS
         hqBu6Hq/eG+LB/Ztbc459bZiWtt11KrClKQb76+CfWvhTvaFZ3dp9wdcsNwrsQyqD5kl
         Ri9m8HSgUzrzX5unbERI0cJitmzHYyHDGU9QEplefUyTopssl62F3DiuF1XN1RPuQ9NR
         KfwNlk/N/byIBGX+fmqumgkQ6bgUq8o29OMBPxlFUc0CZgvQtl3AnKGacIit11HVZiif
         sMGg==
X-Forwarded-Encrypted: i=1; AL+hErFAjTWv5wthsZMfWVFdl8w9slMsqmrXlvdxJC0XEXtZh0vyzNEnJjjjg0s+CAW5J3NGDgkkPSq9UW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rRs2RmrgXuJ181R6y47kJu3/b4ghi8Y/LRBvV9sWaeG7abUF0
	MZNSHCoIvodGgJwUo+hOoLv73uWts7ZMSmK9j+1MsXpn8d8GX8ct/zvh
X-Gm-Gg: AYBFou3PaErPMXtkfBhppU+QRgetnmFDhDneHO1dJjU9qkpXZ7zr7UNvP5UsQRVicnI
	SF3rhm8HAonZs6jCKhkaLUDhpJbU490yOu3/Lfay6Jny8W5XVzFZnIZOrEeVaLPBBxmcn5IlR4S
	1ZVF/d00jjsY9dEGHE/oAyuNgI3XDzuJK4Dzh+i9G3vzo1WlxdrlaG2lzNNLr8DvGRfcRM6xIyl
	GGX8ZdcJBlpBykA/Dg/dSljkN8CYfR0SUkleldyDDLFkzXLeZkPqHNj5o6QWxFsHbkUlwF+OHpM
	Ma6clupC7kdnake3BOxYv0hTkK7o5dMPzIxPwruiyZiv7gyIKk+mtDMJN00xs7tdw8Ihu0BiBeb
	IRwb3cxVyBfmtCEMNFLJcCWP8PjaV1etXUx3DEvnUMpbFbSbMG2LaAaiv759QWzfNjTTpHmNEXv
	pd1nGc4QStrx0MX8g1d+U5VLr51T2mzgqvE2QaCh0gBOALAAFKBPaFhAVXIhLSvAHeqnk1Z7Mxy
	LgPpnakNOg6fQNlHt3uStTPRDO8+QNRKLxvrmxqtFWgmwhKljJ+CreX4LtnknwpQOm0tNRK3zPh
	U43utZwF+MjkJTQKlDRQZ6VLsfbcUTqUqm31hTwu
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr255653315e9.13.1794864439353;
        Mon, 16 Nov 2026 13:27:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:23 +0000
Subject: [PATCH v2 07/16] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
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
Message-Id: <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=JAnPagjMpge0X10XiR/LbxFcl9vIwvXlY8rdMR3b7TnG2zjS5Ef/3pOUFBSYZcopY2HJ+t+/s
 qtEtnXV/IW3BvhWLgk5yEo8YJikc5cpwNQrDqesXNsRHoPh2k6l5Th3
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

