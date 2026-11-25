Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578222;
	b=eQHgVr8irdDJ0JV7GCk2w5ppT5dPO822lw0Rm6me78z7+nxA8ejvo+mdXqSGyQluZr3I
	 RH5lgsEiURuunyAMR8oDo3K0UNMXcyqdU51ICwR+9jY3ugFlo1qQAFHibg8a/uLh+hk4s
	 HV/qYKU4XP2n+Q2Xf78u4UCS/DZg7MJQW6loKZrkuZTXHM/kiZX+1+Mp/VKc+6VRw+0Lw
	 yWqOpECyt9LNBzbURBo/H3bE23ASRRezbKxuvPGEs1+h2F6l/o5y+Euq+THSb+xLY0G3o
	 1l+o0CMMjP/xLQOE6AD3LhZo0Ahyn///EN1+FPsWqMPMVzJ1+bgi7BKkU05OIuYs3fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
	b=tsUBu6T1SCjsB+SDmQu+pP+WA1gSnfnoeY4C/3Ma97K7KrJX+yrFmExqbTu4goRtC3Zn
	 Oy9aW+N1oPUScr48tXrBT2leFPchcGS6+0M5NpK7qFzu3RlaF8+SWLGq79EAQkMl3eSd+
	 zLGSpq+qTfdPcdeeZWBBd0e3fvzOI0WNaAB7YqWFJlW6Q9C3c2XZq5O+LH8RMj0lg6Wu8
	 Rh7CAS9xYKEOSmW0vcY+6oncCIsACvgo6t0CBtijQAcuY3TlVgEXLDMZpGOAnkOSKgcUN
	 CrRe2vYyzdfMtRvb/tnPP8aUikYGGN9P/FrsjANc8DhiMSx6djwF5Nqn3k1iCNVgT7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gL35YaP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C18606A32D
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C18606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gL35YaP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so54506035e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578221; x=1796183021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=0gL35YaP581fK3jcOJPups+fF9Bbf8JIZtZt5mMf57n60XTFjn4kYofnxX068yiYH5
         FuQ0yvkMTBi4fEdB55IabfGWqM2T63H29uww7lNh8DHLTv1kOBJPGaeo3AMOqMSSU+X6
         3LdUBD9U4cj47O/R2+eBKO3iISBcpxscvMpW/pqZcRplromX81Z3/RuRNnC5/EG5rPmk
         BQKfdN7YeHa+gsvJFgUsSAByJJs5MW9Pda01hnPON69QF8pF0jxAMkykIR7oUfizwaCg
         kbnLzik97Yu5Gv5WsFhSEW86b5D4gcno5s7wlSNmKItRT/jR3gKoc8KIJ8tUtaqOPD+Q
         iaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578221; x=1796183021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=c9v3hr2y8zn3rzgxhUQUqAgYZm0HRWRp/rW+i2rZCF2x/QO1lJ1VCXDCUFJrsMVaDc
         9012RPliBnvw+HSGVfo9olSul3suQ98THqgD9ETpK9vup1zGbp9PkGMaD2pkNuf0yAhI
         JHW7bfypt05sqezjVIiflLGA4CvCHhBmQsVXWt/tb8neIPE43ceWVrMH2QW6TNY0fP3D
         +rjHGoVgwNsOnLMRYsybgp84zz8DJueKev0kspibte3Fh3aMlVwOkxwMhhgEKyu+Z/6Z
         V3n4okW+Kj/MOlfgENGPvM6/CbhvsnC/JK0nj7Lkmz2wYvWSP+wGm5FGkOYeG2A8oJq4
         SFlg==
X-Forwarded-Encrypted: i=1; AL+hErH4qbGHtZSeAVi/jwXTmhkUPTY7yBNTWZr4a50wg57JPZAqfEzo9B3LeZXf7sRZiLIy23NiSTz2kmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xi/z6AGMmRdSCHBeOeAwhP2mu3gP6s8Cr/c+eTJG7Bl01G9MP
	sE+qWQr+73zOIQWT1mtRLIfD+w4jHp5/wCOEF13XvfYZbVdEGaY+5xu4
X-Gm-Gg: AZFdTZehOGsOpBo4f8rbsgTWxTWX1XqMwVnFOAMOW3wuOT3wOLjMYkAogrf5A5pQBVX
	uEL5A/VblMuiCyPKKn+fgNsgDAFFS+T8RPEb4rZVAjMX3aQOeoBVg+xKjqeaoVCvRhxLTOlvA/u
	cSRy7HYdt1Gmfccoshw4IcZyDHW7x1AmC+Oh000Z1WAO1fjM1OqvwtHdsoIcdXDKhskQa302Di6
	Ygu43FeAX5SN5Gi0nwIbWGNTVZVFeEThtpshg4mqI1FBKbWf0GeEXOXCMQ0wK4W2usl5jF65LVZ
	8ZKNDC0Ga56ezyiB6fICOS//+TAc4OEdnwyeRcQAYI2nY6EeHHVO6/NcQjM+cnVXV0MhBVgUeUk
	HbHuKx57aub6kW0Kv7w1HInMbh8qtxpmmp/e23/X3m0f5RReklV3Bnr5x6cH09rhfp1DvNxQL26
	+utJWgwdf4ignuBAoz5M3MGuKv6tx0bk6ON4tB5XZCGZLI5nmJeMr2Emyhoc2GS9dW95LDbFkKi
	yUIDN4kUT+mhECOoGmBFz9Y1h6fK97wqnQMP+uxGVfXlF02Rity3i1rQWvpeuuu+zdQeHNav2oN
	lEdq3nUQURXxaDikbVJHMLi5h05sxoNMHB3XaQ==
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr328092505e9.34.1795578220699;
        Tue, 24 Nov 2026 19:43:40 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:40 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:58 +0000
Subject: [PATCH v3 02/14] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
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
Message-Id: <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1076;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2tteAd38AfHrvk8Awl3RAniXNSdGBzL0LwEwE8e7LoI=;
 b=5C7/JmmmJaij3ZDCjC7taKHJ7ftfQrXNJKeux4QbuaH+Zgcx8qkDlh+sISv0oWyhLHGJ/5oZb
 fvQPpset2HKAWFH7uV37/GtdVaAFBb3EKxSiKjnd+R0Yi73lf00uJQF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0

