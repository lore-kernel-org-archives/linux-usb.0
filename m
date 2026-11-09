Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184427;
	b=4qMOEZ7lP1o6OD2D42YSNe+IDi7RpuELV2DZCv4h6QxVwW8+32Xn+phgbHUYH0NkfOIs
	 U+UMlTaAOlS/21wOSLJwZ/3gr28GxTV/Ky0LS212ZWmBUC+nbl8DYl+iQ3R+hEg0Xu/qd
	 8be1BwuZXYtviWlqMjLlGmioGWhfQRp3hCVyrel7r4uthzlxukfoPckGZ9/4wDn7Qid4g
	 vMRhumUR5/3mrwiSEm9sM37186O88QlG/W06bUqujujw9uolk5chZddkbFDAt1wON346k
	 zQXM34UflcWxEBsOD3xcEdGEPcyMGu2M3Ay8vAMwlcebV2VPMQO5gVirhYUrVCGmbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
	b=HTv8O6E94KMVzwnx/k2QRlyW6ToE0Cu/TNDUJ0S10eLbGWnzaUzwwJDYO4+Rp2bwd4tI
	 Kc7vnURSC2MM6RoCw3M3Yx1X2/NCI6xLlU6FgtKB7hLy/d3jKfLoatg0hW4wIliiPTzxy
	 tiAWwxoyA3PVWu/LPemrpBfs4F7FuTY1FQ26fSFndoUjVBHRGdBpMYQUbe3zucMubNlBI
	 U2et4lY4iKEagay5DFFlqEb5Iv/4JgMLoRfNMWU3O+52Xnt4cFclg7Q7+K42+JBsXV6Nm
	 02QGOlOY1wNXgpWZBRGYJBfUfOpWtIIZI4GKQou+hpfKtg5N+Ai1a4na8wuyBwGgh5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyDzKlyt;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AC4606D809
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AC4606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyDzKlyt
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3288645e9.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184426; x=1794789226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=FyDzKlytNlxAxLxC2gOdtwF1+dCkfYwbnWO6d6oPLIvthh1fBT5kqIqv3qhAxjwF+S
         PFR8nekUaUaUbx6CeF7ug3qsqKHwR/kTO9V1T4Gh8dASycorY7RcdrnLPeG1D5Txou55
         xgDbR4iPItBw5wvy3bOWz0Iyu/+OIfpLVhUWEPhctXpoFJ8gpgnVrNIaGCrAUOL0ZPyt
         NxOLj8n/xATQtJPIEPyzFjU842UmMjHxhCBNhBfhWuqVNq1zEGFr9t43gIXHmKQ8IbKc
         HMtuRXvOTX5bhQuwRu6FbfL0UoFdw7t7IXKyKMYwATRvVboP24aPvmrx5uB0BcbSe3Hm
         TZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184426; x=1794789226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=eM2K8jGvCNpebvxiF4fhgIhXMam8Su8IxazGoQRyAs/WwquN6VE9ALXQbDMCQ/6Ul3
         cVzx6mfpR/jJfihyOEKbdS/jI8/TyJhmpp3uvFA1ED8OfLz7lQcp9jwRHv8L32NzkcV8
         T25hI87Hjbs9CPuT9i+OSADFIfhZZeb7X22KoOa0MjLAzUNDqKqypTcBUqC5x+wzSWoc
         kSs9Gd425Mg7Ru47Qk5+8jF6/PumKD3tMZC3rYyjgLES9VDBfNJCqEdxBkIRUfWYy5QT
         EHWjM4V5eRIux8qcbgcoSojar81lnpXLQk5msGrOHajO6wiibnptnCk5w+MHzE1lAovb
         jGuQ==
X-Forwarded-Encrypted: i=1; AL+hErE9wlv74dHayv2tR2eeXnG8W/XjE+Kk3JClYgn4fTwhlLdTk57GHQp0SsS7XJotf5sGZffQ6HkTv5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AGhCHscFNet+OXFhxfnYTfTuh0mYBWKjuy948dygPojUaADd8
	e7zZFAATxuE8vm0zhoXWpFAhSsSvNCuIv7kM28Z4EU2qqj7tGVMIXfj5
X-Gm-Gg: AYBFou2f2o1wp9+cfT5BEyi/OoQks55KHcfEfsJKWTxUx7jlsl8WFJ3nwdgjSiWwJE6
	lqu2XHKM6ZY59KXPcVmF125LOitbjQr3kwfHwWScDlWP8FvuWwgVM1VoXset1hmuc/FAhtY/SQB
	zAlj1BiLSieZLUHzW0fkftyQhDBn9OAEnIk9xFlHq/ojWVrCdRViiiWJhVw4prGZSqTxSnylGUg
	cAmLQTU0zQNzyT/Y/xSNiBqoyqXRDZtrdfAYmX7vqEtmyO2yuKaZHWMdFczyUs4pGkAj4vKJSI7
	P03PcnC33ulelRQbGlMf7L5XUbQsL2HjMfFvP0lcH3Mo/fUe5QC7rcsKzctx+g5pbS/yK6WIw+x
	Yj7EVXLGowJdsnRFTyHP+61feR33ocjBBzqPRQryTSxhkXtmCYihj6844G2cjr3TDWESJSHpqSE
	DfCZyVZKZbxPpw1VyEAIzO33GmwxqOmAY/U2xPB8iDRzggY81vuNxV5N9L/q8Cs+4YPZQ/yFpAQ
	EX1ygqFtiMQ4QwqnD6l4/6biVxJgLGpA+nWB7LfDzugIC9NsDmNSDedakAXq9OLFHaMCknFDxyu
	gkeVZVY4YHP/6/yoXCXw9q1+pdEJJZReGXta4jrd
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr43372595e9.35.1794184425700;
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:16 +0000
Subject: [PATCH 04/17] dt-bindings: power: qcom,rpmpd: document the
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
Message-Id: <20261109-halliday-dts-v1-4-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1003;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=el/mD1li+25cayhCgWCSoEmU7xbrdbDdv2bm0vKCgf0=;
 b=AAbKZuaWziyLaKTlH3TAQLDLLUPJbQQuUGnW2/exeZlWjcPjeJvTUQ3Mzs5Xy0Jsi923+4Jy6
 HYpQrlT+Y7QBXM0fnEs6fk3DZfReSJNsf74HPnCiwzI9V/RMLtbXEW8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

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

