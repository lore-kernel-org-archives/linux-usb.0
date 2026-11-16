Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864435;
	b=5M9DQCX6+ScBKHDcU3Ty9RAf/FxIowYi/a9R/BzuScZIayaD+Iund+ev39OYw25ot+pW
	 dsn6/xEim0xehLYVFJyhSNMappSbgpzd5zsASwLSQgh+Hh+Oevx2BwK3xXI3AVP3/dLkU
	 gJHIEwAdrZ9j8I7w2j8hBbt6gc5fsXApHro6R4HsQRoCzzvJRPyP3hpwm8xy2GGy+DGrN
	 4P8Ta6PffUrUy/pPRRds9EMIzNFJTogfX6AuPJF0vIbBWGMPI2xorzCMki6D41j1fyuqf
	 TmngXnX7RSKrsgjxa7ZSJaV+aYdeJZimVhn/OMA9F5Y2ORkq5qDex0pxMPd4kHiBa0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=rOfHlmhT5dh0FFsGyPxGCastnVeDiMLBaUXIK86S94D0ylsMcJCTl045VugRJeRB+CMs
	 X4okw7ewPwJdE9WLs5Lnc+t6+g43jEaC23X5SolkL5e+C7hV1wDYx3y5zb72wx3xHg/X0
	 gWPkaHf+GuTGFtQIyjlCzTuOlDJ+trrpQOTKPzqNwcBkXdeVTFALVZQM1mZy6q9oHGLF2
	 fR8ve0AFHVGf0vW7ReA4OZ94OqajxFM+xFqQdgasZiTexECdKZWNL2n6rKzkl/m2r0sVH
	 6W2HueOkaZlOnduuTI2/i/rrGf7tPY3BBRbGpzJTkW5sJCBpiHWALFAZPa/sBGk79ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1644C606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1644C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1997448f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864433; x=1795469233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=P16DvILvAkJjX6pET/OY1y6yCbL6KHNvFmQ8Vc5ms2Nh4pBtOsH5swOYSMdfoItM4b
         t5MUV5RS8EsfFWLaJSSS5E70h3/UCARtpvqtPXICi2MnbVDPa95XtCUmcFtAYjMi3iD9
         sCZvL8DZRUZv/G7eI4SHBKPuYPPoNAExEKI30EQbOIauyxIQR0kIV/+D532rj4kB4ZjR
         LbaVAAYCUUzAIoRJt6nlQejAo2Qj82puHxbZwDW1Fa8tRWYcjQNNMrBV4t0c64r9Bq5k
         XxoBse3bOdVc5KRCAVJVYP/0nrxUtbAZayRyyja7hKGad0rPdK7UrkQNvPW9f3BimHA9
         xUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864433; x=1795469233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=ckXWYoSO77w3DnnPpvCUFfUQkULwVbMhh9eoPvp5kDqJV/6gjftaofDvT57eq9Zflq
         y/bX4WDsWFXqEtqv6IcEiuvZ4/p+YTfJBxbSGx4n9MQi7ZE9eGRuDlR+zHpZ59H0hzuC
         SgN3r/RfaAjAZwq4NJEL+sTFlsETODhuWq43Yc80st+dvYqUjPKHANlxVm0LqHceHp2f
         jAqPPyv13WOvTZ7vhU/aWrLE2EVRNUrGBuHj5muopZIyO/qbaM1RBo+YR6G75Cer61vX
         tPMPJt/bH5BfOle0WdkjuAksjE32xVrar+M+zC2x9GHa82kJoYQ3kCy1Rys5otc3OsBn
         YVlw==
X-Forwarded-Encrypted: i=1; AL+hErEyJ/YpkGyj0k47QqOAVg+5jRTIyRxT7HfYDgmJ+yRie7IWAgO7ueK0AFgpViHpEoBMP91PrVD3NaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X6RBD9g2z5k4Uxwm+h54q4D1o3qTKBJ7iESxNejGOqzGRshd8
	UuwJ0qAIFMZDLs3u7boJmThn0s94QW1gA5J5wMOxy2Do1MdcBEZjD+ev
X-Gm-Gg: AZFdTZdYnJnd9NFKge0PVzdHQ2IWjHRbv+rgJtWSYgcVR/cD3yjlA14OLvyUfYO09c4
	0nWPe5qBR2WZFTFNEXuqkoQ+4Ee/FShykfkeJgsZydgJ+885vxF/NuRfqwyW4G4R4UW7dmQe5tv
	owAOuSQ5VUHQKGhMmcOp+OaPgWr+76y4sUGhOBypGztGvXbW4KyLETzj1jTsOOqYBuoKUJiJPSv
	uoIKpsvLWQT222kx4L/mxNws1OOto7eOVYqUJAnWeWati/SBf6JIp1fS8DwWSxuIwI1IGNnhO8g
	Exy0Jool8nZfveAaTXDfdXxk/Y76jEtVZHLbzXTUGD+jjj7e1pxLTHQW10btEbOR+SmljceQMi+
	KlDYjR2RzkH0SpuUvBQgCwpSzKGdAZFWqt2bNcaHSak/ArJS4JHPMEiR81g8j+emSpt8wjRn9us
	xE49bkVYoRFO5N39iBKOvKhSCUuEXQZZ02TRktcfXanajtAt1bJYele5qdxG427Vp30Ta8JB7nP
	HaEr+aUTYLsjFm67wiZlm6yt4wDKMMlEFdonK/Lct/bhsrHC+csxGdNtb9rM6ElF5cH77gadzPT
	f4RjaJVlOWpUyYiMMQ7YiqV78GFTS+wn037la9ZH
X-Received: by 2002:a05:6000:610:b0:495:5c83:51b9 with SMTP id ffacd0b85a97d-49c7467a893mr27328310f8f.50.1794864433590;
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:22 +0000
Subject: [PATCH v2 06/16] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=XlBnHuuXKSsmwBoy79zd7CM/aQS0V4vz73O5I/ykrhOgY3nFJG4rnY0qnm4zfFTA5sK35VFT6
 GeLVT3WztE2DdDA/hh0iSPFr/rHt5tVJ5B9S1do1YbNU2FqHh/CJpdT
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

