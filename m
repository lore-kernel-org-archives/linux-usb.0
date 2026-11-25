Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578254;
	b=zHFQl7AzwEDH8oC3bsov3497zCZ8GRnG0HCMsBEwyAU1UDIlTNaER2MawgRHzMTmYOop
	 v9Cx0N5HgGYEPjvDUX+IBr68YnAaD1uNGJZdf9p1uRQtXoNKM7Vc4cafbihnYNof6LIj9
	 6+BmzOljPCPeSVsBvkmWcQh2r3sU43qEPbrHnumGdjfnPSMBCdQo83LqM856fF+hH+wZ8
	 C2kpoWItLTdqiSZDy0NpM22P5ZwKEEAeylbBbHkmX03ReaoD6fci+A5pfwx7cYmv443k7
	 zNj49NsFFUVYGaF2rPexEvZEnicgm2hMmQCDCUW//y2pIAeLVy94yHP7x0Av1dC1JUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
	b=DRF8GOURtk2x0q+33H3rqKdjgaO75+8V2pJc7+9C5iF2rCQSdXTcWP1HIFRtPL28ZkOn
	 u/Sgh37yHtUuk1YbYs3U4B7BL44qBo1yD6kACHK2jOs7joZ88nGXJ7WD7uPmDmJx7h9LF
	 712+NDPI5a0NKPPxyOh8klLBrqPLBmRYidvy/8BQnJx7OAXRs/0AJKgE6ovopj5HbUYGN
	 NcDBq4Qki4f3ouFDH4f1BXyb/LN2i0CVlOOei/EKJROHH+X6ZQe59zuTYCt8eX3mT8CEX
	 UugcDUKVoAmaJd50NCPZSOp9VAIxsyTblmxyDpif4peN9LqCnCiHR/oXwOKjLhOkZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CC606A337
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70CC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso50198015e9.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 19:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578252; x=1796183052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=lEdBuKcF0JncIpcutUemWRCVLwcBptVk45nftYoXdUPaaPEMjOXhRvlDgUBMqszRSi
         GjVW7ES9OlK67a/2KLB5I65GkIV14Ylzo/LfhicqUla0tHCcqXUHFVnVhyXZGsWk1GYi
         30KWFrA88HI/8R90LcNab9RdDuPnarcq6aW8IuA8Dbg3UasrVz81iXsAmAz52FFpSxkl
         kwCNrdjoDvsHBIUIV7L7pGx49IZu2fqgEP7oIu858HUHqjSUGsKRfpJS4Xm/DgASvkCY
         ohconOG9BXS7zsTTxG601/wjTYdl90IpxPDLaEEQRmhw8dfhpInmpWHAFkRnignmsUL1
         jNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578252; x=1796183052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=afSb+bJYpvKuATP2W8KRVrQdqrMSR3f7PSPn9QzsXhEaDDdEugq/zJUi46AVjFsaKH
         k+9Xk2SH0PqjSMaJCeQxgbsBBYahXtBcPtypYpWEzcpId4dgqnOl/nrkZVgm8T9jA0Qu
         uUbLSwbkHZJjbqIOSzMrhV4ubV21ulsaIzbdL7SR9AUu5YVKBhwRRbquoE8xHiI+w3BF
         u+JKTkJhTXZO8TOtFhNXnRakTu8zUFy5myBiK/SQt/J2rpn0y9nv8tWuw7DvU9z8eIlz
         viwCvIvzPvQocj7fLQq0IP6sUmaG2+ySKnDHWX1d52fcWusH+4jX7E/Iqv5ZfRIPOHOy
         5LPg==
X-Forwarded-Encrypted: i=1; AL+hErFYF+fAae5jDaWD1rA1hwx+ZhtHBD45zqpz6HL9F87DtlImNfcljEcvGJaiyyEOk4r6c93V1caYZxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WaGiOEdJM3GwWywkvqdIYFxCKb/SipqSvszc1kqtAMSmhHOY7
	Q0Pe4rckqcr6lAivK/HQiqOXnVWb3SKs/RDJ40PNCt+y2bwJlWWs7ClP
X-Gm-Gg: AZFdTZescQxzVxsWivPYX0yNLi+pCP+XgKVk6gzrisvIw7M44YAtRgVhWLFTxbP+sEU
	qaWtqk3XIoSPB2TN7zHErCV+XU+/RUcyVcRz5jDpyYkQsrp8+I/0CLgQLGh2w3Uhp7U4t+smuFi
	yDK+C6CI+qKZpd+Zcr8N/9gVkilZieN4z0JiRGYwe96+bYCKqbcbgdgsMBcnL5h9i60vZwnAlNN
	i7X7x5XYNeF2b+vh4VF3eGjq0HQJGhasTmsC2YzaHAZz1Giryvr3to2TmO5WDEK8ArwM26NSQG8
	M1GffCh/34d3bNa5RYMIU0j6PIJh4AfyIj55DwGBnuqDPMrPf6gbVH9P3TVTx9898hfv2YK5Ft6
	ETjCN44zPZx/t4SyCK6FNApCHx7yoPVT0/B0X763L0U/b1P+gTgtoY/OaNxCHMDdeU+DeXbVM2K
	aZLPv8rBRL03FFvdbnO/53QCBX+QgKotolMiZEHSZbc3EnTJFPJlprOJ7mAsR1qNF5GB0JJj7Wr
	E7z/kGtKdyLS1WyB4fBLdQrywhXMZ95ihT9JtNOPQpPqp1mJygZVCB1icpF5ro+wDVgmr43NiC7
	y4GH64flSTK+uSe/Ef8Rsrn/Lj7/K9EJIlQAXuzmCMdYRspPZmEKtUz9glk=
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr399963545e9.12.1795578252392;
        Tue, 24 Nov 2026 19:44:12 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:10 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:04 +0000
Subject: [PATCH v3 08/14] dt-bindings: crypto: qcom,inline-crypto-engine:
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
Message-Id: <20261125-halliday-dts-v3-8-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=991;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iODhhsd3yfvGtcciUvxgx8qkDXgsEtkBlczLh6ZRfrQ=;
 b=lvcDevXHoUjfOVIKmGcAADmxVZULBy9zMoHqx2H32a0E3wUM2ikLAFlGNM8+8Y16B1yXdXwzE
 0y99BcDJDu0At3F9ibFbmmvIZEbRo82dQ3K+iKDoR8DVQfXtRsOln6S
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

