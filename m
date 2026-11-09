Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184422;
	b=RR853zxwD1BKsbKSnIMiNN3rMNIiyxLgUHVHjIncS1nPyCXhMFYR/0/sY/2b2D6rMjrE
	 jS5XRh+r1Tbp3MtRB442PpOPio+LKOCipsK0fnS0TmruFyeP0c6x4mw+dKLI5xtZ0joiZ
	 Xu4k6+sK5TSmPFMM3bTYNgv4Da5gUiww7VNWpTiHdlOsmD81xFiS8nN6b67wQOv4inyih
	 DhwCODFICECLxFtpSb2FMqc3gQyt8TW54K/gNNplpzkbFzMAS/QYlslHjAH01EK1Sge8m
	 /GsZ60AZ5fLVYxQ1aON+0h9fjEFzxZ050U7WjGfMq84jmqMBj4Z/NAd4cGAUwnUs1vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
	b=LU1AMyKGTN5fxlebjCBXcSFv480cyzpv0ZZqmGIi/ohNkGKT3raQ0sFWbmgrkEGLh/M9
	 NcAqIPkGL/RxWmqOXW/lWeF4dDqVfd11FuVXX7/tW/fE0qkHxqwmyKFe8Yi7DMfisNXE9
	 C5DcAJ9txTgrGXZ56gSGCk7uvJq+MogtZVgddpGcpTEWaxT2H1+bP9hhtU2p+Hu9CMAGi
	 NT5O6i8hOUCRijSA/cyzxXcR8GgKtWltCVhqmqA+dhcgW91qV/UgIiqhh15QNsJv07ctJ
	 gZntqtjq2eN85BNhEPkPdjlC+7CM7IgdrUuKenSQhfTiMUVANlVvKJs7LXXeA+wTZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uD/fC9fw";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B855A606D813
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B855A606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uD/fC9fw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso3337995e9.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184420; x=1794789220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=uD/fC9fwd35e4pRCBo6Ir49OZrB2lX+E5PGdQnHcUkYxiqu2ZiGRETZ2zJmW8sZlTd
         A5/c2Xw6hipV3YiwOTPc6CN0uAO33PQjgwXUPiZreZzu4FdcrszHSfLcFtjRZOPT3itQ
         xle2xxFDmZmDqyMCWSs93UsfOpeLxSN6ue7xOrrEm/NzYT0xzZK/eCHB+h5f9jiXpkxi
         ypgX50w+AjK0hyhr8W1Y5z3Zeklf121xyaUU04Mnsch0HJVE6Dc9AjOAXq0dywq2opUJ
         SUXNk4QGfcfXnyUDSGqSEEHPKlnphwjmf7JR4/7BbHKuz3djlAWOEVbyJKz8FiaAylH2
         4tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184420; x=1794789220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=qrqmom6TLQ3J+dcmJFbYDjJqjLKMN62KdnWY0iLlTO90a3hwqTNq4CWWwTHxWmDIvU
         6o3hqa9vZuhcnZU1sfo5Uz5FjDkIiydyMXaOLOUg33+yslwmYig6NKAvREm/+mpVPFfa
         yXTbrGf5I3ZB489l847NV6zR83Ky6XYh4yRzPsEMz8ocKUQ2oHIdSmHzJnAOnHWr4r2a
         I/5ysblbA5FQh6D/mImSugp0atMoB2Aw9mOBvi1z5WY6SQUIpwNQ5JKph5AFqxPGahm8
         TJjl7EvY8ZVF7lfmcEnoLHK7XQk8ErOqIZa1ZNDHN0RNhaEOzIvthreOJOSfuErk+tGv
         1BBg==
X-Forwarded-Encrypted: i=1; AL+hErHUkljIm4npCvJawL3Xg2hL+IK2W9bQhR9ju4tgzIiJnDQn4SIubEtELKaRSoHMT8AA5nr2HrYzkZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GeLqaLiVx3lGVd0iTz9tG0breNFMQYrYnpchOskivxUdwyoaW
	naeTirUMgflZIIs/ImFUQKY1O6uSdDI4ofSVSSQ3p5e8Dc3B5bBfqgG+
X-Gm-Gg: AYBFou1liZY66bb+X4mc3XiXCYjHWD1+3Ox+9e8cpbpZnCpgNkh7OZkINjwpGGPxZ1h
	Y03FV5gBH0rGvVWIQx8HpvRD6oh9cMgv8DvVLSlT/zEp1qK+FbkIxnk6ppIRw0soPOeE3qHNNVL
	cwqumiCySWPS+A79U/3eci0tc/8NmZgZ8WgjRaDGCHGEIxfuBfSiO8UWGL0+d85Djyu9dTcrgzT
	ZoRq1VdZK+u3It2im0ENgYIM7dW6aqcAhJcxD0MdMLjSmHxmy7JMGQ4jSAKIQzA9+5ATxm54LuX
	JykGEjOLZT+IiLAqgL0MHeOe41JNStmBAEhNGvaAMdP6qcIH+5sNeCdFh/nHqM9YZTyWdrvx91C
	4JkcWrmVD/1fimbIBOVSrDYlu0PkYgmXXKGSXHlfE1zImaVZIKEpw6Ak3N8tzb/UzcY12bP0YEk
	aoqb0W8uKXiT7z85LBVIoDgRFiWQ8KZeqLIB4D4sTFNf2h/4DXiEfyWQPZjshA7eC2nUemAojx2
	2lFm7C6gTY0CRkZXfOpuTWT5V6Ebokke4ZobEtrKOGQCTvs7nnTR/2+Bx9+wsXEsf3r37vrowtl
	aICkGlEy/ZB2dSM8ejFXJabMUdJg2eMiCKTmG+78F7L/rJKRDBzFI3FDFJ672Q==
X-Received: by 2002:a05:600c:5253:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4b94d762eb6mr47593435e9.3.1794184420329;
        Sun, 08 Nov 2026 16:33:40 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:15 +0000
Subject: [PATCH 03/17] dt-bindings: interrupt-controller: qcom,pdc:
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
Message-Id: <20261109-halliday-dts-v1-3-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=840;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=4hUtXzlXhIrBYYJFfDKQPQ3vEIzggE85cdjdS9WjQ78=;
 b=/Hr74fQlfTdpftwl6fj+vsUmb0ZD+laYeVxlhFK0akfSM/Zr+bIuUmQJNpniQW71Vw0S+OnBe
 X7HjWxQRJOhA4SO/MxeQgQ2JNwAjEDgqTYH/3IGyH4DzNXVVHXtyQib
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

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

