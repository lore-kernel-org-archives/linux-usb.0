Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184415;
	b=CAcS1fuk06W8FpbfKxl/3DYa7sNp2wIa933kmt9WMGben0EE0nrbWpQ/B5rLA/inY5WX
	 2QbaPRJCF4qBE+vFIS4P8vICwWs99N8UTzQtCVaZCtoabpLKvxo4TpvCRuTAyD8N6kOq7
	 X2hBCWi6A2zSbvxuliiFa9CZSU8GJQA05agAJAKtTg+9ON8etsvdXOPxNyvAfRZGt2Yo+
	 jpWUVREvBlSi1x96UVqyhCtob16CqhMaYNwhfr6rpjrQDn/Ivu41UwFUqsr8w5XM0S5GB
	 mq9VoM4Jv4nX4ALS+SGxc7lOjfyXQg4lQdffF1Kikq2s+19Umf6i21ySbkCgrn6HFYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
	b=GMZN4eM0/aoOCKtWJOQ+y6WjGv+KSLUDuK2p72GTi82QO+MVPUQ2QEMVvj3SFt3hwC2a
	 b5pbwOshGN9rSyEb0HC3bgT4R8D2E/Gn1IzeiJZHOqOAVDTvx143BaGFgOqKLF2KVl10j
	 fuNdh5unYkYxuxymzr85vjCejV9UKQUSP/IsqGisWSPQDuGFsMmgjHfoaFNZQG606zaR/
	 ON9eMEzJD/Ezt+0pBtFVO+WqsxoEN1UnHv6mK/QnmNJGo41qov8vpUgKC2e72pyPZnL3v
	 Y2M2vpL2n9m20dIr5cuPdt8sfvHNqqNleDjis67FN06QUglFwyGIWsyVKexLyuqkXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DVeB/ILu";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D00606A326
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVeB/ILu
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1968325e9.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 16:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184414; x=1794789214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=DVeB/ILumBTLtGhAnK9SThmzeGROX65vDDXvaMLZaeOoYlcOfAZJzCyt6um5mYfHDv
         Y3VcmUpi6VTDyzOrubE+TKxzkEzeV7DSAlF0WPPNZOCE3moVlSnmkE+1qezIdsBohAmP
         a/93IAhud+Xk1IuhtXMMbD/9JTprYk8GiRs8RDQKDOz2ajUzeKy1jt8xEeKQ03ZHTNjl
         KWqIgDs77rGbxNx92twtTmLWRqapsVjV3jMP0O+gf6wVsaSd0oWYgtJXqPstZO6rnlkr
         fdQkYrgvqlA/v1Pb5mWvu8AR3xbxLkneLZ+FWfx+DKb2+C192KWMt4IWysE3CQA4Jrx3
         3R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184414; x=1794789214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=z5LFtxDoZYUZjtqu+WW25boM0NID2qFRetXA6z+zJow+hhC/nz0HuSu7V6HOQ4KpQX
         GCDuY4aKRwmP7jnAJdP4ZmWjzcvlH9QOAPH5BsWrrx8wN1AmQNfcCptJULzqjXE35yJE
         4WkypOPiUcr2E8t0Lw7+tj9ykH5hZSDovgoVgE1A203XqwFb5nDB7EouvkgQhAaYW9Cq
         2r6Z9HNvWXtwS9M876DuIsgHEz5cQ/AR3c+Xfgquh4OQAV3zMawOLVuvacz/FH1MM77A
         WsN5zSZ4i6ysNAQ2W7shl/JC8wJIOq0CTdmA0r0+B5cc/Z7T9FRJPXWtjoO4djbrtBfy
         XNdg==
X-Forwarded-Encrypted: i=1; AL+hErG+moSCXQ4Py/m/nNMwUjTxjyQaK27MAvICMxNUvhO22Z4kv2oDLRNPPMUyXj9D8rQQztSYWbogHY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W302VVLkxSJRt0YJ8xa8lwhUZZObFnsZlAS8q4HxbWdj/rCa/
	hBtuC4JW1impDYTgxx8bhFaGtyljyBhAsOKw79ssvAEZ18eu/sHmn9/W
X-Gm-Gg: AYBFou3Of68Btsnt7NYgRD62+pa/1BktlbhhhXCb3VbR/in5uT1JolKVmARhzENgkSt
	Acv/lR85XJfb7SzgY/LpB3nq66D9bH4yk0yMo5j1zMD2Dg1//w3TSooTQUjRv9Fj+3kAVtPFhO9
	FrnSe+mVOmFhQQxhiRlNd2pnMUiFHEEodZmUyze5VBlI37su8NSOmzzFvbm1yVdXeL9ubBfm8BH
	oUbpvljPi7eBGJh+rqrxP5VkmzZM/ETWeoRQFbYuL005+sJyqIfrNDqPsLtt6OdCFl9lbmrCGjU
	xOTlXdTAjyrTO1VbzifJWieohbAZ7hADY7oykHua+KqzGZltWRF2OebYztL//Hor9r+T8fUDeaG
	6XaCPWWbc849fcQEUDNxHNXzIiCXqkhMbITkkBilTuKR6FPaKKTt5zI/x52OXvWLKn4a3NKF7DL
	NeikyOl6znK3153cJa2X6MANx/YT6GhYNw+t8K83DM9+Sv18HToYVKTFBsYA4wCZ3f2ogsuw6DK
	LW4xcEmhquyRkbzS96OHEDrwocgvaAgxS7Ckxo78hCg55ug6ja0mhWILekLrQHzm0t3pORjQTC+
	W/8d1bJN4tuAEmEKFfRdD/+grOH/X86PJ4bakV5z
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr50119595e9.7.1794184413846;
        Sun, 08 Nov 2026 16:33:33 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:32 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:14 +0000
Subject: [PATCH 02/17] dt-bindings: firmware: qcom,scm: Document Halliday
 SCM
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
Message-Id: <20261109-halliday-dts-v1-2-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1033;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=mntziyVI6wQ2kSkSteAmiaUttlX3LQ+YCHknAe0v+s4=;
 b=6KLs+gQMEgAdwwaI8XXKZHARhr4EIqJqXke9wpzWMnotth4jMEZlLGfBGwMvNoTpcE0tKCN8v
 aRJBBJI0d5iA+Opb629gN3RAQt1TeYIjZdEvW3ChlNmIbJyjVXak7Mn
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

