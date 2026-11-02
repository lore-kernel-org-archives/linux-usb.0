Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656295;
	b=In1DQzFKd0KnFQoBxDY3E2m3LzZt2qmJfvC4iVLZoPJj+tLuTbrWfhHH7rAFJXqXFwgu
	 3/eiCQsRUzM03lmPZ4XWLE+mbXhQI6iRq0Ci52UOWeC7Nt8QtHl8uY20J986Q9Fqk354x
	 TFdMAd+V8WY/CO9qxxF0kWXdNzuh0RRHlj5ScyXoTXmvc6SiLq0g25e7RbTP9vMNkyNLw
	 puUYV4GEwrjRLlY31hZRJ/DSHzsMoqs287peVMWr1nt6oEWYp5O7HXNrqr3rTDSBZ4sP9
	 PwvQvI3Sy+uXS+09Za5bL3+bHewnVK/flvK6ODIOeU7STfC76YeXBlqJDqA8axr32Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
	b=4oNMaHh2alJjLb+Gyoq3JN4ruVGg4mc6FvFWYI1s/m1Mq7UK7iQQGE0anGpmF05oLqQL
	 ao3fd8NLQw6oKjJAmykOfnz3e7jEUnukCMWp7NKUyjsNiMWiZMf/5RjuF1s8jUQPRjGmb
	 kumhwiAplczrqw275S1T2U4nw3RB3b+0LpfYW/z8lq5YSbe4tyIoTHoXCfklhkz9ccODH
	 RGuYsLyUVVKeXfgJYdrtCeUxuen9jiDEKn4uu0qopgS/Pd4izau3HxFA+e22t348w1asR
	 L/sxdHO82sVEGpHc+ZAGNRE0BqG4CYdylintCArfACXrSEIFYgYj3OtAEsJmtrCPSpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E41606D835
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 21:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E41606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6008048eec.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 13:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656294; x=1794261094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=dNTSo+ArHEY1p8y6b1Gl1CtTGFOW2OPldm8D157toJld7B0aLlPSHWAsnx771XKWWv
         +acgqY+siIoIZGU5HoMCJ+UxlcZ0Y9XJLQh9Ed1A1camRF1+gKook+dsdrXZpjT9BRpM
         v62LnC8uAIBlkJ7zCyQVHZUfsepAmSfeuuhCG/p6sHcJyBDWCNi9biiNteKhCP4UQmj3
         L/96MDWkO8t2uQjrLSjd8EnrCbd7XfVWWqvzVO2vnnE6HwU3mv5kb+Ur8wxDDXbiO5Ja
         6dOp55l8ef5KzbOYHo6IftBbkj6JfE/Yv7LIW2wPg8vxOB9IRaY1mNFy8/wevuonr9kK
         vJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656294; x=1794261094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=FD10Iuu2J/DQBo0YwmrUamn9mhkJOXCOiQLcz9BRGnVPkuj5mDBQt4mjW+7Oygj8at
         J0fYj6vV4K+8kOx6aqsGxKnDps9ChZGPF4dgvG57DUaGWCGpxbgQcD5yaobFAJBnagTv
         4qz9R3WgZCw7FGVi55HONLMk7FyAvflS40A7x1ZxsD6alXHP/efQU0t5wjf1VEKhcpe0
         SpunPe/pNh812fizxjzUE5snsM92IrfnZ+1weYEIFwox4Yrl3iJEhQ6XwIy1ZUkSaFFi
         JALsvFE95VKAFbPGd6i4uTsDxNy9e1jnst8iJa6LLuvI68nptX6cUTQfYcoy0V/0HWHf
         rYFQ==
X-Forwarded-Encrypted: i=1; AKwUvBypaS+NJPxtasEWvDgudD+QrUKnkXn5/w0QgTN377rRMcv19DLFW61g59RKUgXRJ+ljchP9vZfYtAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bwnrHVFOSnyst19cfHUkbonxIZ/bI1XHBH2PKvQ8dfdHRQS68
	bdxej1C/+xZ452XSpXxF1+gaqwGlJRUUq/V09Wqpf59/M5DkAevEpJ6g
X-Gm-Gg: AYBFou2cGefL4ff6R+l5pGZsSkwTI2dONL1XPyp3Ykw9mKPr9q9uEKPKoBEwzcYbnkv
	4RzcyoJ3w/VAW5ma4T0J1stAr4OErtVk65RB8YuNdEB5A8v9up1DIuCt4gTNA9UuPravnH44de5
	qZq0VFxwRJQomklqfSN0wA+OWvsvsdUCUPmp80OwPDNZonl0vNky8DdcME9soclYxJywlA2z+dY
	BG4FDmVdSZuuNB33xacuSbS4xMBFkA0j1H1eYF8rrMM+09oQUpo3Gwneh54okIriOcJx0cR71zM
	ljb8Gwlx4AgR0HO14K/2+aeHvtuOIMrTNIvMj1KRcxpvEyxM5p/J4FNK/Bf4PoRAr2EE0wSOCF0
	42MIdrOhPM9ZX7fb7JUaNL71qUb0zzycQeSEaRpVZzy7BozotApcXaMmibQMeFFFCYQnXRMWRt2
	l6kbbeu9OCcsZ00hukS0afkn/KMl0t/K/uWpca1Z5xU6DLFvECmcbLq5gdGZsbBPzdX4aBYdrI9
	LyONHkExKcaPJVWnF5wXKwUjinoVyEBI7NNoFH3Zeq0helMDpr0dncHe4G3GJ7BRP0NHSzQQ2VV
	iObcIaG+V1di0/amzCWVTylIUVxLBlngly++cZWe+q/T
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr16226283eec.30.1793656294172;
        Mon, 02 Nov 2026 13:51:34 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 06:51:20 +0900
Message-ID: <20261102215121.738-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Make the USB controller a mode switch as well, so that it
moves to the UTMI clock first and keeps its USB 2.0 port working.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

