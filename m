Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578248;
	b=h4L03FzRctnCka29XVVwar9Va/Hxzh8ZFCVReQ6vmq5kV6CFLBtWW69dqD9kNbYZMSqm
	 wIuEDWMEAhbU9+sPeg2+T38JhTV/A4MuNVoItuUnJsnu91bJcAScmmU89fBT35ldWrMxr
	 oBC84VhxMG4VRhZbB7d+nGIXDzxE30FwZni0z3XqJ8oe12z1RvTsyEoMApgwdcuRmUQyb
	 rN51u0R6dBu0as1PV9vIp6EP8sGUrR83KJge7ACgDsbW8uaY3rhwmIYqO+R48y5qQHm/g
	 VIRDt8bDMqu9KlL95nbqR6hLwoGkv+bUVjl3Yfh/rP6fy2Jkuf0oJ0fARfG42K3egiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
	b=ixxel0iQP9rkwwMDf9f1qkob84LE0yh8Ici/e7jZXiwLopNqYAnRD3Y5XdOIrzyod84W
	 zhbzRmCx5z1V1c1Vm87ehPcMigqqTvRKkMw/im5FO2fv4/qq9tt5ZbUp1IWHoxsaU7RMb
	 EJ606J9r6A4sxiNbFUDClI7Z1QsfV2cvkoOOxOLnJ9uh+MSDY3fIjqJrGWwqTPJnt538W
	 10HGJKxq4C/yGyexvixLlqmZkiZsPs44fWVR0RPL46p3ffMx3ohy2qjVLToKzc0r0okzK
	 oNu8o/V+8FbX04zI/5moq5BkGCagWa49EYiwaEe0lx6NTJ99VTCSak+Tke29orUu+bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJnCPDC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C8F606A323
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C8F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJnCPDC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso64939995e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578246; x=1796183046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=yYJnCPDCwX2z7GW0KEzZrs4pq2lhpcKSCvfZ7Jxb5FFkSXbRD/DKL3imKFKjuozlx0
         PjoGDpUiZBJMXXrwVVv65xOZtRHEQr7Mp03mrKt/vzdLw8MJ+WFu49aJ+T/d37cNt9+0
         iyyRKW9IcXrsAWM7+n7HO24S6uBagb+7QbJE1odzSFgeGL6gzPo32tZiTXSkOPZdF8SQ
         lZXlXY9dCMKGWuXQqoNmMXGhc5CIK0sJZ4AfyM/TJgjzKVwfBbHcTRqrhathFIflxn4I
         m8Ek+pAdgoCuX2AZC4asCQrNaa4et/XMHCzHRzgNV/fFDwwF//9V/YDf75TCkIiiiCiD
         PQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578246; x=1796183046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=iyzlxtN9xSN9Sg/kPESx2qHJ7K6c/g5gOSWaXjmQ9Sl/+xg3/hd8AOlBPSpQZJ3Tg0
         FHrByoWf54H3Sa71up0eQzUn0gXAm7h9dfOjoE9+T0oGjnwVUi+L8j+Wg/6/IU/iMkKI
         T8FvD3xBXrvzRaEnCSYzM1dHsf2rXY66/8gKxtcWLTydC3hLAuEKhk5JsusPICXZxrlM
         jVRTdvn9Y5FcPtAEe6gRVL9+E2+ApQA0nGbK2GjbIl688mGP9M1XFwjR0R/kOjOd3QR8
         XWwGdzXjKNQrtEcZbk7KundYqLPQ8yzU/iH1aZuACYsMDSLCks7Neli76L4G2RSzficP
         oUIA==
X-Forwarded-Encrypted: i=1; AL+hErHIZcI7+FHDvglHDgWru3cM/kEt09WLdpx/4CvFYc02rskMTx28L65mas4ekX+va3dmdcUnOmor4CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eg5L56Gk/m9NTpKw5DY2L6iFSrVGY1JR8INHU1zwX0dseCsIW
	oGQqQiSR9eirb66PMaqgxW63AUNDQLU8hw8ag6jr0jEl0CKVEerLPzJx
X-Gm-Gg: AZFdTZdIeeugF9T/zLBY+dWWYGPUKMiTsMHfnJRTWO7V6cJkO3PTKIlonthMkdWbSKh
	htZIYNKOPulO9M3gHDCfNLqJ/yi8MIJQe95tXv1LEbJGCnwDPe9FcRbQdcKi05ehmA6DopwiYNj
	OAyHwGftWPMkAObe1KmKGkjZi12yUbXD3DF4n/9EMTCFtDcq8SDMWj71lSUXvmLmk9WhiLPpu+b
	/k02hWfpFdWUSU1W1pvG554jGPz6TuQvjIu056NsKSSUpfw+4VhOH/ZGbcH2iBaKzcuOPV2Ll+5
	Xz1pChlnZEj2kaYvJTc3hVSxSlpq3vBD2jJquZkml817ylaFNEx6l4NbLjp8tGxXx8z5Cfso9IS
	Y418eLasPBsfElIDvVxINOZkNcBHlUBZX0/nfzEo0h0zAcRflyZGSEJ4Z3/qmKlc/rFwn5Z4rC+
	zoHAQ8Cs5KvqkbS7k2hiWtNNFGhDcJlSEcT6wFDBsOaLF9lCnn2Q6iJY+s/93HE8AYrVafkClDd
	VMureBErXfueRjip7/DDkmmTCGNpXtcAJluTAqFZ9wSgaA0e//sktD/jVNH/w/TbUNmg/GPGM59
	cK/+P0MwV1QsoHQdvDoaq+vz8P4TjYc3EruHqA==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr345180345e9.32.1795578246276;
        Tue, 24 Nov 2026 19:44:06 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:03 +0000
Subject: [PATCH v3 07/14] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261125-halliday-dts-v3-7-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1101;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QhWGZ2nDLik/AVSmlPnUVJyIcZFTcrhPWPSMCAukIeM=;
 b=6AJhs5Z6f/n9pNkfdd62Z4MaOrVcciMknCqzjBkVEi354abH/HUGDZk9PowwAyDuxfg/8VsUi
 qlXYQzCUXxLD5rZQ1VTRb8Bh7LUtJE1bI5xcjBVOagvzX82tdchlf+N
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

