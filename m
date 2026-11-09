Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184492;
	b=Q+JH/OtBIA6kuFVk+LiCQe33ijJo8cVJgBPBhBXHUVldSvPicymmzgP9ZTX1+j2BBhxE
	 lKTwK2yXBLRJrwpmHYzxGo9pW+O2lgAYxRCUazCpdD410HhJuC92GQRWVGzrOHY5hcSSD
	 Xw5AEbNtG0KQmXvhnTaWJjDu/JMt1yiNt92fl4YbWQrVUhJEoCKQjt+6VKiB3rGk242+v
	 lnsasTQoBHt1JMgbTtPFS65NBuzlyU4ZrLi+S+20QJQLy5IyhphKxwSX7f99jebkHFdyY
	 QOv11o/7n4REv+FqxzpvtemGNxudWU2ojocBA4JlVJpokKVg2rgdY2UudZsm4PyojZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
	b=DjHHiCG2gH7nKBB1BttMJe5Gs6ZCAO8AHeML8IOHqx0t3sV42ZnEAiJvdqVyef9BkZFu
	 y2AWxVUwPHsV4vBwEf/xOqd2tex9UQq0Eq2NE3odTdW2EIt+OrdWusM5XkA50KM0rII30
	 +wLFRZ4GSr4i2c17NdcWT6CHxJ6VbUw/PhA01mZ9ssaYYdM2gNAcZUmU7Yqjq9o/uNwtE
	 2B+NvS8Za+0BP0Tk/PQjgv4j5DZu/eLl8no3QjgxVwXSIxb2RZo0GEX7M1ArcSCYN7Jyu
	 QWx5ZlTbOtsyIjeiF1DvqG9j6a5s2WWAEvYmC3aYqo5XDtJlFD5L5q4mhZJLcDKC9lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A424B60A263D
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A424B60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2796395e9.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184490; x=1794789290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=E4mD95aN6utgtguVmche9wruQufBYUmPr7se0FjMNh58DsSqVSMujoYr0keBmRpW8v
         uWQWheuyiSWXxKez1vN9DHsvkz3dIxygT3PejUT5UR97F27EKdO7WTr8MwR/DYX5j7If
         J5n5+NU+o62GTMTKrKJF4U0oIX+yriKVSodOXqH3bAcyiqaL4rHDO9eNXyjje0tgioF3
         kJjFsybCFmRigW6JjznYVc4hYOd89F4ZaDco6gDgRFm/z6xDqoQPjP4mGVKFK2BAHaN1
         NUR9o08rR/2JzDfKTWO51s5/9EiaI8Jvltmy1OQJ6WmNNyfpZkFqT0xbMVSgVs34YbYY
         WCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184490; x=1794789290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=LEU0rxBlP4l5I7e9Ovfjv0JTx3Gq5sPwyIzl+wft37C2vM2G4IsW7/QJAK8OkE63Dc
         5mjwhWx2OR6O19bQ2CYzApDkk9m8LjHehvfe87brc/4lX8I/CqCQrvvCAKZyhKX4mfG5
         Gra60Tk3SBEGCO8wPIUdS890sr63Mr9KbEY5Ee6tPhnsUtN9SGFPHYfKETDy6/hHb563
         dq5tWNkfRNGIOzYfLvgarZ1bUbf0GStDPKL5YsMT9hZZNwIu43cRJYuaboy+gQugJvvl
         e2soPRGqAtcwO7Zel6RpxdLc419oEvt07XP9FOmVgMLuw8iJ3alsD5x5yeyEsLp3wjuW
         9h+A==
X-Forwarded-Encrypted: i=1; AL+hErFjH7qJg5SrABLQSQENw+i6HCkf2LixDsF3ouUrDnAI6msXBuAM5wjSeHQJQBgIi53+aW9Sd4wqwTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ckoLrx09Se8eRCOCRKGr0F8QXL2iCtypbnJxCS9PPSRzozd+l
	0wHr0AJ8U/otxkmndqOKcRkCYpz4vVaYhCxrES0CHDklrOkKN9vBwF+C
X-Gm-Gg: AYBFou1wL6Nln9+udYk3KgQap4aIC2sWQ68Rk51ksMvo/Je7jl/rS1vxNUWCD5WHA8C
	vxC4XzPxvOVFIS/KnUicfBu9R7LekP3M1eaysGp6nDKYQtoZlJ9RL65vdUSW3Hy6oxcO5MsN2VC
	b+8knLqDEg7zbhdlVpOvLt25YNkOocPo1vOd71opVXNQ3tQbrmBkfmf4oS1IhNYESPh4GY9Bo90
	lzLUdVBMOIExliYJxWJ8DCSouua7TWaQqX5EXU8jwkL35ITMzhX2nCAV1bUP43ptAs8f7SRvsQB
	6k5F2oAb/zdEIS/kWHwcWv0x1ZW0ALFkxV/nW6YA5Bbg4WlQReQagbaVvUn/piAsHzAydjDrESl
	cluFUsDJz9TTHeR7cdgu2BLTW8AMXcjvnIYDUABrm0yjUGMjWxt9FXkbDm3fRVqom6NBWt0GrwV
	5wKpGFwz2wddp9UQwAKvfLlEdBl5C/7kCERDKqmy+W7uG/H1GhUdCYfSqAgyV/qoqWDSGDxhRor
	zauR5z5/elNFFky5rgecoHZEVej7/poHNNfeLmtQ8wga119JlncWiunwdzQ+Ny49HyDoBf/PQ49
	ExMkOBVQw1eH+asRplmCG8n/na+tGMMpo/BlRJxw
X-Received: by 2002:a05:600c:6218:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b8205955e1mr111833455e9.7.1794184490117;
        Sun, 08 Nov 2026 16:34:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:27 +0000
Subject: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=822;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=GR/L35KkjRTQHIwoej6N0ZVQiPJDeokJdA0dH1/xcVk=;
 b=+pMC0hU92qIlScFgbvyLG0yeciXJR70jYMcQsgbMkAruvtq441EcqoAR24w8+H8PddfDvxdW7
 NeEMu0FiaHdAmbbpArcsFtCmr29OynUnIXhIC1Struq0XQSLzW/yMcu
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..b96ee339956d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,11 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0

