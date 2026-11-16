Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864477;
	b=ShBH6zF8VTLKQx1buekfaPHDF8M+fuViLq289QoploPbpOO3LjUehtOO3Gyt8xJCEUWy
	 LNwbLCWpj0CbkvMGUUn7oTw/RHV278AxOl9TAdFoofegjtZ+/gEsWfpy/zIuVOPNZgdag
	 dB0n1me/tIc0F9AL+6FzCGFitlngp4qynj0V1HLg5zdNfYZ+sMRjvC4dqgHN2Y0plhdjG
	 cx+8htdpsP5MyKgnYh+zEsxko7JV8RZ08UtCIezVCdZOXFmUa28JJssNsF4L+EzFmfS6J
	 n1gvdZ6jiyinRmdWlWbQQ7z3YCfs1sXNrk5GHuLHmP/tDIvqjK7refswzeqFbY2xILw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
	b=V7697VUat8H9A4l8MCU0EaPvJphXwK8UEEMT0FdxTCzhd/WGaiUiN0C4fBShWzEEE3PW
	 Qqi5mNR+jKra2Kwi5TtcRPZfUgh003UfM7ul+CRiofMb9fiN3mmWAQBS5fg8MCj1/UsM5
	 wtGQhcHBJEoHWHMHabEXpWalGQHfkWF1cnV0gShBi3bcCVzNvQyTnM6Znxv/roMXTSQyV
	 2TaYlQe/kk6UZmlFzHkAz8hCxRK/RFiObgL2o51i0CngFSVJ+mh2GmtN5D0amFPpNqK0s
	 HA2kO9aH16Zklw1Ipm0Jov80lnxtCrybhULNn16vG1IscsxdXorC3Ic0j+Y/F4uLkgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD07606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so231026f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864476; x=1795469276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=FPpD0dISyKSAsA/OfXo9aET02c5v7IUiKwrzM7OGBDFvjMvTZoNbDoYV4Ex3Y3uYhp
         Y6vCQ7xir6up1dfUVLJ23VAaalNZ4uISwqpeaXPNkJgGz301zcyyvNP+hYTj/McltQK2
         nHoILFZ40kLf7wxINR1Pp7egTSiFzWLEp0yKng4RRniW+DeMhQ4V0omBbBAyczu0GDB0
         pjCabrcA7S423UTuSJS/0gDXZklx8OB2tDXAufmuhZv6NgJh9UmOymUt4fRkyObYF2WD
         JPvPmLCEPG7sKQ2EBmwHpk+O5gd+zkO28V1bvTe+aAAB0Uos9QSDOxduGncYaIIXzqk2
         6qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864476; x=1795469276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=sbECefCznLANi3WFkGOlaWtOyjs/4vMqOWNMa2qU53rezFxy3rQ8L7kAZ2WybrPb4W
         t7uJVac9tEMvuigKdseXV89mVX8M4JBekPW1aGPleZXkE4bmeOt4MMmYEQE8flrJEN9r
         G71uFP1NpGotmRF/pSOut93Bm9W4fs+PMQYD5mVs4fWPS4velx6ENK6pueR33jj8S9Y9
         6s+jPuX4fM57BjBnhvLvt9TEV8S5pGUaHUpcnd/gheeVfXuHOB/H2pwLvbX11ceaBtcl
         9F/CrwsjZwmBn7teXkZqwaf4be/GDXKTnJKbHM/v3ILQnjBh1+I9fQdDQcbmcWidqKv6
         OcsA==
X-Forwarded-Encrypted: i=1; AL+hErGoR5es36DwrrPDAxGLLyO9uXotYDn+7RA7pmxdBiDY7z16hB+HxWcfTkK0yQFDitWFqt1huGmvoJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WlDHpCsoXEl55lnZx4oxb1bZC2rkSc73ALmmjHSFqXT/QjcDS
	4H9FwHnjGqqNhenzqdt5E19kIRWJ/q+aD4ywtapbdj4vODF9Q0zl3Ulj
X-Gm-Gg: AZFdTZdvVvJuGoN2fIM4uDiNsSJs+ZQ1Jbd+rZ1ZvRnqkrMGbK7hQyWSIfrAZlP6+0q
	SKT0tC/q4zHtrnuViQK6Q7wuDC9Ol5CEvCMfVCepKmeUXAjKsm6LmfrsuDyulJ3qnCH/kV0LPBt
	zzTxZA9Tlk6PkByXgh+CcgF0UieHgErudjDHO2HQqCOvxzxERNiKJFO4IhFHkIgvLvV0DNQwgux
	Mw/qDnj8iZnr5ahT4eE9UII9QXIxqxcNgs4nbN/Nlaze6SApFw3g2aGAxRy3uEcu8QAIsuJHe9v
	EjgGXJg+To/AEcToXzHNjjiXLRYhy3DsGBqRzDeHNJD5LlNI/MHVntvMEpJ2CvdyolPJyhZXJFq
	2TIwp/yJ2df3sI4py/q+gVbLTc5O+WrE5GH4ZZ1hjVDSchCYGHUWFDeMC4gyfem6B7Sy69TC8MT
	EC+pzQTrXjIOOUynTYqKjmiUdUxQIxE70x7Z4K2lKBQizKt4Mmdl8W14gV0UWoWjwqBxQKDuk55
	LGOQwSwuDCxRtDXuMAWUteQIXlGU5ONY0+UW68jcOHLrBkF6wc4Q8ZR3WDjIzoptBSWSH7JKksV
	Ddspw36Z9DdG9gaktuiZ8gtvBxEZpVp1eTg5hN3K+l5i/eVHOYcwKKz2rgj8Iw==
X-Received: by 2002:a05:6000:4706:b0:49d:8ce1:2652 with SMTP id ffacd0b85a97d-4a36bd51c5dmr1648244f8f.1.1794864475624;
        Mon, 16 Nov 2026 13:27:55 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:29 +0000
Subject: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for
 SXR2250P
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
Message-Id: <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=746;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wp4yEFlEeRirWebvDUNwJG87yvgwIo0fuTVgUjPIFVg=;
 b=c3M0oozAyWICul1zqZyYV4A722e/xl51QI136kZKSBBz/N4l9sptO65yuOtgNCZsSpOrbqAMq
 sRMLJj/ahy6AipZ7ofcwU1aakgIIwxaL8YroDdkKta3ZC/C45UuYvvM
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0

