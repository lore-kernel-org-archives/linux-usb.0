Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578260;
	b=naAf0HmP0rOol5vq43OWPREczqT6R2c8XXWHxA8UKqh38Y2Nd+YZtJ8PjTElv6Ve9z9I
	 EI3LyZRpvTxFO3FizSeioYSCgWcDdTsS5ZQJn+qXmSb48jR/73AM7qGaXeS+iY1GfDGYj
	 R8nVkdZoFHH2eqZIpwP0OzRQiWpYpQSRc1iERLBPZYZShLzUrJFg22G739RMGQ7DHNl7M
	 4n5J/14kGBsRH3MGL5ms4yUVCEjTFTXWNzZaZJx9SV2on0jtGQelCSsK1ZlqZk2dbnSs3
	 QuYa7w5cwEK602M/wyPh80L+YZmWZjHUkjkkPzohUR3jzddsVZkYQqX711MWXECHBuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
	b=FpW1qHubYz+83AuyumfnwVoHN1q8DjK1JQD6bufy6O/aMCJuWFx67IdVhovmtsd+JLuo
	 XO0F1M73Xr1VY49PagfBK2po7OiDTWfnsT+qjVMSmTMNY6FO5PJ5CZlo+G9WbAAYiOV6u
	 pNnlJELayfzDIwl6FXn3eNJf5xhFVP7bMLooH9a5bOEOuaRUz/Tzh4bqT7a8YTb24Y3RZ
	 NqcGtpxd1jqOEzbK4zWcYbXOS9EvzFsvwXUXfvwgBwASzmUo4kqzgO1O1f/ViBNdDXR9Q
	 7Kq6paXWkKcAbY4HY+xwSQ8NXeKsS+8dtxllH0dp+hG5mJjkT5PbgMaqu7l0QGr10sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4FA606A331
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4FA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so54508435e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578259; x=1796183059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=laYSzHNNApvR6hkCfW91e7FyeGAkAKidR4abU+y7ghA8I/ig+rBp4IhezAN7BpYWH3
         f5Y7CPtN4xV7uJPIaE56Gva0Rp5GUYs5GwSqRjsJcJVv2f1+wmo29KWJzeu7eCxi6m3c
         9Au+o4hVYVaxhe0/Cel8skNSDR0POHCdew23VxzftD2vmyoJQvIikRA1VdEp4QXuCv/m
         hlsnWVQEES+Dp5ga9WZt8jZfea89OqfZ6LI28tB1H92eEcyOEQQHudx52eC5tBgRnRjh
         wIhDoX2puuAC+T+JmQLUJsdgugRJfZMB50IIm48HMGcA99AvePM/gHhJt3ufW5ZrcdLd
         r9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578259; x=1796183059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=tkezEhT6ct5dkosSvarVnrEH7qjEWZ/gwaKZAG2mv4E4liEF/BUmlNt8JQqSDi+Ern
         meVdmLQqO3BwmbH5TiH5DbSahRZt7XlhEES8qst/uWo3LiNbiyRtf763TIGqfeUMPkHg
         Q4nbhUhe7h+cnfC8Cldfa7k5IIFW1uvfsPzZZ4kwuIy8SraDuntVped989JHBfHblX9C
         LKtDZbgfIQEuiXV5gEzJTu03wOITV+ccQBvGvITZrMuLrNXBAxuyTcPAsC4uJuz+aIi6
         QCkTYTzxcc4Yn/r2Bt+0l3SxFfiu2bH236KtIYxib9jSM1JgkDWgO+IZC+dKtMuh7TqM
         YqMw==
X-Forwarded-Encrypted: i=1; AL+hErFXgCQQPYPjpF15XHhwFZke5N+zX3ZNnz9K+UVmxe98EtpFRb6soI8IMYfiV6L1iSo3/qEDnIPd/mA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Dx1xAsCm20Dlizzsx74fEXNxC1zLJauWK/f5Vho/gceFDiZ9
	Fl7g8fIck5ZO6Cahr2cWsm8C/qcGFfIGBWGd6nICNOPYOK+0a15XVGnA
X-Gm-Gg: AZFdTZf/kFWbGq0SKMy6guR5bWATotE0scX/Hmhne0/q/Glwrp8gB8mzJ8OOR9OLZCc
	FYawxbl2iOVV67xC5vnIF/YLBjJsYI+VtdavjDMamppyrSNeTvebjncpwuGoAYP7O0S6xM9PPwi
	RCavYbWGsmh3JcHsOXAdh0++AOGuky79YkhTz0eKjUUCZJx7Wj1FSJSwiLLRyWM5ZJ3Hie/1olE
	klA4pUTbCuNcXYsSHXvRmx8+n7j57Kjv3F2c2QaZ+YSS8MrDsKHmqLU7gd+xfjPUpoX+wIvljaO
	9Hb507mrDv2bcuyYO7tywqLFd92tKOtLEec+ddbchKSIBZwzKtv6l1jfwBtpiuB4y85IbpfMdmv
	wrMUNT/EJVr6FA3z+pq6IK3kR3jkIl8kGKXq5nd+jzL+v21tUY6Y07bQaXkl5OUDZQ59jx7vRIs
	bebeG9GSI9PPeCvROMj99rcsK3khS9mnIZ9BRrlH4WJ9H8pw3RlFT5QKsQ247Hh9MWr38D6k5JB
	5KdgLQySxrrLwqZ2pEjgx+9HkVCZo97xD7ggHEu0YaTQiK7wcfa4aEGz1qiRLsnaNBxRLmGLXAV
	jPU0Wi86v9PvIRafZcGX6VfqweNgy9ighoUjkg==
X-Received: by 2002:a05:600c:b85:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb8892ca5amr333720795e9.24.1795578258707;
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:05 +0000
Subject: [PATCH v3 09/14] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261125-halliday-dts-v3-9-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=899;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Gu7LEPVBsHDlbEA7f0+bCh3HrNIpvCrq8874bMnEMyI=;
 b=LwuvM0V2lFpMa4PY9K99qzfFeTZgXvTT9zRsWf5xnLCKTkxZox/BBQLcveRV+2SwtDIXcUnAz
 dTyT3erZvMTCCtObEN8DKkAXoSDLM9Igo6aZR3InSklVdITD6tCjFp8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

