Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864401;
	b=1xzLODqKgUiLOiiRm2PgGajXR33msNb7OWJShTeoFv6fW/KcZ1kGLK7skyElDaw5r0l2
	 qtUBTrx4SDVCQZCErXBy20jWPEIjHZJ6R3Xh/onJxKlKv/sWp5B1hLtqOpmJvSDFwYBcd
	 fLtPDYGJy1YTtgsmxfHmH7DxJNrUvrLvF0T0fLojQgigApND5XIyz0k+L4IxgXvmAGXz2
	 zJoYhy7I0m2W9+47+5G7WjBmanva+wPaWS859QkAs2jOh1Uz5mzksD8ei2rUlML4wZ1F9
	 d+DNS4Un4gtZeishl1fnENUcdUE4EPtFUdJblpxvQjIqzze34VFG04Cvh4qJ+GoipJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
	b=YBjFlGRqa4fKuFp5F2j01Osj2wIienPDFYNCYJhQN1r8g2yH9h2GQxZfZEvaE0oSXtDa
	 T6lGDiEP5jnj3Xhdn/ugm96x42t6IQddsE3L7o+PKtiBSq2VFWOExCAoScW1sMfGWPMuc
	 RnhAHoQkt8XB9BVuSPTo/d6G1udA0i+xwyRtYr3aydGLx1PSMa1g6YhcGGbgDlh7hXRZL
	 pb7aJH7fFXIhNH23AhwSUznLwxH2jZyUjJeiKIKefUjezVrPyvFbZ5F4zZHScT1CPXPy5
	 xCI7yfONtg0HttMqgM+/kWoXafVV3So/kBnZP0zIOpC3eAowJsiK7bCDldI4LykO3Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3jIIAKb;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59D606A33D
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF59D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3jIIAKb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so43360025e9.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864399; x=1795469199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=y3jIIAKbbbSqQMJBSkJHyd7OrigIp9VoXLj5TrsVjC1P5SJK1+6GfH/CwfjSUDChdp
         aSUwKzVMSzcpqSu+dYj881QSy5uTr/mR1OuilOAa2PvT9ykPWZFupXWFXDJUWg+Evv7+
         YMfIN375w4C+9j10ZwuEeWRYPJesN+qvcukrs197w5O55lUuxshj1qTYZTKsY4pTkB8q
         AmWVhst/9ZLMgOWXi9rzj5DYH6Nkhc6djSlUphB9PtYcVDNyHJItRCJ/2xhCROn2FZJc
         u07Cqgc9tSSpuyxqc+gXNYk6FMS5PVUI7wsv9LBks2s6FQbonvj25Ul9GhnE9u2M+hED
         rhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864399; x=1795469199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=nK5Jw+7773XB/O0iI88rkipC7SFz+sgu1trArplVXEXD9guAle0EdyTqCMluEia20/
         hW5Dm6QHjKqicifGrCXuv94cevKe418IKhXHRa8BGUI9Kv4BKO6g4pHEaNwTWqgO8jHz
         5mEEyvh7H9Af9t6rH/Wqiud7Cs1PzPLCYao0RuQ9yJEWFG91gN7+lS0m4U1Dsu7GnsaU
         Z/KIKjh6eaajqeH3lNvmAJ8/xVCNIWKkLdsGV7fVjkrDVCT7LAdV+dYV48zpqhRhlHTK
         IbA5s69YF7PR8GfMPHBuyO3QXHXdY1wsjPJswkEi+TIFGkRPv2TvZDK4pyHCHjca47FO
         YJSA==
X-Forwarded-Encrypted: i=1; AL+hErFonvd8xDavQ2xNMAqhsrwS28vYc97STd48ccPLhawIHpIKGveqb4XZ9L8n9yDyfzCIdOHzwCD1lAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z87iqeEoD4UxfGdkcYHW5KfwskvDZyKzY7cixhnf+Md1IU40JLl
	1sYvzZDL67M2z4imsJImybXHHR/HfkcJWt/v0M7XaAXIqAw0iXr7qFX2
X-Gm-Gg: AYBFou3APpX16p5QJEaU7ktzpyS/bJC03rU01Tr8HMPgFp6grWhgKKLi12wsDa1ZHPZ
	uuio8/NMgYI0vL2QuoXYj7z/aJ02CEpy6+bGCBbo0uXKz4/3UIWXLEJFapd66PA/2gAQNLZAYiv
	0pigBrpds6iF3xm8cYN+p2Zw6qOZwNFGLd1TEZdjZ9cXQe6sy5Z8u9QfJuJ65+TzGZqXWf+19X0
	Ph/LaNJIy0cHFd6ojE9XCdQLss5smIrFRi8MhORuObrHHZq7Uvwm3b8OcKU7PE/RFHdBtxbVQD+
	FNffxuLMHEwSOxoWvwkyLzOev9/EiMG5HaS5laIL0eRChGVEObQ/fF+AAlNonqEcpcBBP3vPDrl
	vDKcuFNoWfNAAWaRNl1R+JXJK5fAquuw6vwQhK1ENr6DDKlGnRZb16MiIkhEITVh/FTPkqe0byv
	RCZIYgqMdPEjU8Pmug1vyeM7f7rdS7xp5bcUwLeAqw+qm+mVMgf4XqafgrF5/Z6SH2mXIxOhPlD
	3MVeoulXFkzLpmiRBreO644A6VvkR1fkJ5vX+sGJ7YMkZDOllG/smfUctJsDmuYWe7F9HKx9fAq
	FOravhJ5l5rATsOkn9XrO7/4BzRzlzBcdxYM6Wtb
X-Received: by 2002:a05:600c:3509:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4bb559f3633mr229913355e9.1.1794864399079;
        Mon, 16 Nov 2026 13:26:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:17 +0000
Subject: [PATCH v2 01/16] dt-bindings: interrupt-controller: qcom,pdc:
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
Message-Id: <20261116-halliday-dts-v2-1-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=910;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=TIEe9N/cyAzKgpuoZBtDZhrBfZnBIMsVZBId/jMf7sU=;
 b=dpF7p0w+OJpIxiGvX34+YlsXwN/di/jZgfYFaXfY2LGvx7anrS9naa9DX6XaW0R3KAm0CLz0p
 0yoxibSkrgQC5/lkQjgDmvTXyvnDrKaMbIZimtpZ/81OcVIj7o3EQjp
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

