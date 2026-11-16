Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864452;
	b=K8G00d6qXNUPDVje7VPuc+9+zms0bRJbHVnBng8TQJaSsXOgFusW3KfrAaHUPmXJAjCw
	 HGFsVfP6PTAdPx9dGZE5lS3CxlWUOEe6FICaqGh8cI+vSsN2nRtkOz6f2clYZsoIHkrl6
	 Js3csxE041yjV2gj6nDqr53Fw8SlxQRHflZwVxS2cCb0aoFYCmCRmL3pRcm42wjvd10LO
	 I33p7COgYZAJAntGpv7ludqA54XQc4RAJDSkb2RnCVx9ApSYzqcT3HR3qVawJCSmhStr0
	 QSeGebV5HzxSg+Mc1qrikbR8w6pA/dN/vNjj+k8pkxivmysgGVjDpply99NPX4u23Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=kABvhJlGqXgk9gJ55R7jeyJlsu5gQOxJHTaCqvEhbMh/UJ3U51U7baNbCyK6yoA6dZ7U
	 EhOxyBDlFS8SrKOgxfEmq+ikEWeQr3zZvEksDBJPetREvVAw1B0h7CprSxKzfywZYNunf
	 qcnNNLTm3MenTm5jh6RG34D/19+bL27iFYoKTdo3x7FTUhiDUWqMppnCtXneLCy/UP1CK
	 PP1h6r0SYqWbwlFjOD5KCXF/R3mZt4rPuFKJ+t8mW8CLrgniJhAjEHL7ZAYyvR+ogPHua
	 cAQajZEYbsrkg5mO53MDwpuhCcpA5b5jHe3kUKhIM3js3guTfNnC3FyQuNCQ8z585kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD136606A337
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD136606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2963157f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864450; x=1795469250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=Pe94GAJIWEr/y+mRBwb7Iog7Ajds3LL8wRIVBH/8xPQNrjbBDNlEcQCn+p1QOcbrOV
         bH70aW245d90T1wUfTfa0Sb1xipFO0e3BL/QPMT4jfWcMzOuboVOx66DzI97tdUkpVn8
         em63v1WpvLz1xDjpzkqtc09ikGmguqMkXF/iBCSCrH/7rvMJVikSjBvdeaH+nfm2b/iW
         Hjkp5FslDnjSyufprS3LahKBu44fJFSHmzAIkvAgbVTvZCwJLs5vDW8WjGCFxFP3mws8
         5H88Pj/ByqUxoJReDfmjknbzv2qH6Xj3kHe//wfRUbrzreMGjXoGLArpiGQAfFxpX0lR
         wpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864450; x=1795469250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=ugnPGiWSyWrccGEqrF0wwiDoDR22I5uLRjqca1hxO47wY3XsuGYegVUkKUJxHqd9Uy
         9me4JcUBwus9eFuGr9sheqlyUf7vM1smwIx6PAIsHc7P9Lfq3cLBPfcm9g/37ffjZ0Ul
         KTi/Vggm6uUIBe3HitlHuoQyfBGiOYDXHEmgvCpW/6lKNHbmzoN+u1PdfDxBwm6FTR/8
         rtt7bTJ0fQ9sdkabRbmgRfGp+LR4WKg9BUO12v+BKlmF5HBdqGAKIvYgzKIwqQaiTn7g
         DUzXXgYdknGTGb+kfMgz6K6NZUIhxH/rxLTIIF87V+bLqShyiXGrHhR8CZffxuSMrwWY
         BTlQ==
X-Forwarded-Encrypted: i=1; AL+hErFtNk1zp8hthp+7zwqfmx/SJAbTENEYplHALh07EveVr78jpLyuHLiiF2KirsAFRfOJcTn7ahnQ5hk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kHexNFagVEbXHAe6L7Kxb6jOU4THjo+wo5lwJ7WWCLWB+8jR8
	BwC75/b3bfUER8hCP5RDeZ8t5mufaCUYgNZdTvL2otzzE3py6P9LcsgL
X-Gm-Gg: AZFdTZcaHK68N219WvTBCGu6Fz9gqc6mD2dLx3NLlJwg74j62CDFa7Kjf6/lBFKZEm6
	rdKZJg6ft1CVMJtfzqKfiuPUaKLdmfJMl9HvHj8bGxSHiLodngu9wfTYf7d0GrX+xthpfPeFrS8
	OIGOm0/ADRO2VXbLVMynW/MwdHmyZ8NcwfNRAeibd2HruWe68c1OdFXvg3YvxEw61NEzMY/HTmy
	5niXSTfqjM/Szl+Lyw5ajvXNAZBmgETihHTgKKwD+ryd91V7Dv+rYWpM/Uc7oan/8IYdQEGNb8K
	bJNgY5dd+A+XCC1Ujt7EIHOdor32zW7TeWNt8RrHQOQJuLIHklfCMbXIOEl9G1d+I5sQ8iFoI6V
	7+nSKT4664ybpsFtY5SCMAHDcw4Xs36X9RqrX/W4ve7cb/aapy4NTGHqj1Quzp7NBzq28TEDKZm
	5wZE0EIsRtfwQqJK2mTKQnqJ+JILpUwBkQEFZmLPsfIK7/eLxY0Dw2GEtrwqKAdteCStLQJ5HmO
	1SiffWJta53hS8cHLEzYDadqSCQ16XW73bASG0PpSqyN7Ib6Amz8g/WzSGOmncSwBCzn3oEz4dX
	9Vu+4CJ8l7vr26aj9TS7LawOl7TLNH2D3Ho8BSr9
X-Received: by 2002:a05:6000:1a8f:b0:4a3:8b21:51c1 with SMTP id ffacd0b85a97d-4a38b2152c6mr1214677f8f.53.1794864450317;
        Mon, 16 Nov 2026 13:27:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:25 +0000
Subject: [PATCH v2 09/16] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=Oo5JC5eiOukaaqszf2JD96qfK1gjo4Z88L7lhFkJnmKZtf8EiRQqPApokWBgoFrRDRq84oEys
 dN0aV0Wol0LDOOw0PtPKsKDeYZp8RCTw6bkJAf6hQZCCV8VanxNS3ZJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

