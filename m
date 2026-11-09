Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184473;
	b=LsCoC8ELJEw9KYtw2wYBHlra8WnzTu3bMDJZWty1wK1fSpxOeW1u8LC+lZkCL4/P7JXI
	 u1vEs8tZqRinaJnHi/FR+gRuu0+qgM0yfULjm4nO1NEOeQoxLReYCsDdqnOJK5JdS0vjv
	 KrezRlfd9+VJe40De9xK5mSAI6xOPMBvX+MfEsFclIodn8O2azipyuq3PmVS/XtUS9TNY
	 XTQzjtaKf4L27na4Ymv5w9KFerysUpd3R3kl+VPsZt+MQ/Ph+zAZjiuqsj5hIU6jVGMjK
	 9S591bkWRqCMbuAdHAfYMPzNknKa3K1PkfHSGYh8QuklEClKmx0td0mBvR329OUlNAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
	b=lMVOSEeSyrHx8YKfi1WpnHEDoYOpdZrP5bGeS35YrTtlOAehyellcCgm/v2EZvCcFsVP
	 dQQmwT7GMYLOf8tCfpfkHgpO6AMoo4QRcJSMFqp+fA58Z69CU2qFaYNxj1q/zJLdVVqJT
	 gE/iZcsmRkscE1cgJlGLBUl4ObtfR8Ra6g58rQbEdnzNEBYqOHUYPyJunKMd+8ex1fFap
	 MukD+69cyCxU7FzbPz7bn/sAkCw8Z2fLizf38p9CkZa9oPBW1zcZpwUu50WdOMBdtr1BH
	 nR1YiNxFR3H1GCDxG1g5Lojo4y+JfTQ8cq2RT0U/N4D1wJ9fTAAK5jETHSwT2EqPGiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxbEJWOi;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550FC6082BC1
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550FC6082BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxbEJWOi
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so3942715e9.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184471; x=1794789271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=WxbEJWOi9QdqpPLO6Ad59r7g0ryBxuqjlkvMlrQfNlNetGvjWt7UZRvYSw+EsMrTpW
         lC9Ie+ZhXXPAOXc/xUS/3xT7VZPYdyIrqbQ4f9+1R+vIuQl6Fyl9S79VIfv31Dbc/jGd
         vGp6btvqST0z/IyGK7MXpRl8Ji5Gqj0cFHFckWgLhahaHcURIkKvM/P6NzmrGrBItv3I
         3zj4CTFNQ6tD4YqUCDb2a3wuovRyO4zKtvVaIcNQHgt8RUQbgVx8yBYj/ZUGL8NsS9F6
         o/Nomd+IFGlBsQVBOxzy5yoHKZeSfZtvQwpc+6rScaPo/xpz5CxWsa8i3RZBbutcR8Iv
         R52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184471; x=1794789271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=V53hQVbBIqPkfZyZ3gs1ZA+H+qKeK2oHUeCPAAU2e3h4OScr0vzUk/JPaDtZ4+iSwD
         GeVBIvDvAScdGyfhiEPESv0FZ9dDCT0aDMS1sV16u+y4Z+MnHSBWTMug/vX+pu8xFnmQ
         ophweNjvb7WXRDZhQSqZZ47QLG6UrMBSK886xZxcq4h8Cd2o01GZc7aoSv0aykRk1gG1
         vhPl36jltLaKqVP4WywQXfr8e6eX1pcN2tAgbMaSMuRKhkMnf2S02MEZXg6oGt2tY+MT
         zETnc405KOY4cgQxYrcYFd67xjeOUMySsNvDAExtV3i91UWypKbGmcX7cdsPeXdUiKZ7
         yzCA==
X-Forwarded-Encrypted: i=1; AL+hErGvomRQv36aiW6stu5sj83BNge8ERhA5VzLKjtchwbJsNE6n2TUUfFgLF0UafGpXXJn9QV6pByfZyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FRUWNoWcYbDr67wocNin3bWsoF5Svo5u9NfQi6g9+StC/U4yN
	wo/XdIJbu2QF6DLccR9mZSEn89yMmUVHbEid+Alk90ZJem5TVQHEkca/
X-Gm-Gg: AYBFou2NfVS5pGyVoiTw4TiC5eWYPWSK5h074h2kEosa/k5J02iF4R+imZ2qwPtUe0T
	I1r5x0+APCZCL3YOXi2PwmUWiCjYpp3jgufnpoh1xJeyMYWz56q5hSBIg0zsGSbQLbc/8sowAcJ
	243cM43aHmAnbC+fTmJfmosGKwyPCZjGdB8rJgwLkZIONngnpiJKSBT0wBDQS7j1GVIfEChdgaV
	FEwZX5arDpDCljjaG4ZG+CpdN38NCpOinUZvhlWjXO/k30YtHJeExaUSIX8CHt5OXgOE0Y7/Yy+
	wAmZ0m59dSsTm6rnP5ztoJ66c3jr8CuWZZtFfAiRMjqPOmqj3UkMKkJcM/AOiwXJlsIhxRkzXOg
	+njS9342nPWRJEYlA4rEfMkm4aGe9pSgKMlRapRVB4+7E6TqJVLstz9iMk0AiMLtdkwi1lsx9OY
	YOYT4V/O9RRNjVOwd3JmTacdWMsG90vAomnSpZ1fHCM8IhZmBSkW2n2cFme0uHhkHcm5M6g1JoY
	P9va2Lx8HITFfE0kWChNbcjXfMA4RsVbWzL6tr37iHl1KuCaAV5uNbJYlhLUApPucVrqtZ7iyBp
	qVXATaNv3QmqG/Aa0joW+WLliIu2zZUH25HSzVT0
X-Received: by 2002:a05:600c:46d2:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4b963c814b4mr45217895e9.27.1794184470772;
        Sun, 08 Nov 2026 16:34:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:24 +0000
Subject: [PATCH 12/17] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
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
Message-Id: <20261109-halliday-dts-v1-12-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1136;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=/5q7xJNdAtVYNP2eKqnOFRxkwGs69ZAxtJgwpCpPYPc=;
 b=gh19qIBvqo941uuBuTtSY86YfaNCAEdG9vJI0o/4tLOqHDCaja10/kLnOnTQrwdqkmy4TCdF6
 7e+ZDYLm+CcCb5BN2fAjGQTjhEqtQqzl3jdn43oLAWX5E1v6iUbyst4
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff172..d6040cd293f9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,eliza-cpufreq-epss
+              - qcom,halliday-cpufreq-epss
               - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
@@ -135,6 +136,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-cpufreq-epss
               - qcom,qcs615-cpufreq-hw
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss

-- 
2.55.0

