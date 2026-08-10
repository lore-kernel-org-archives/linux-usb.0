Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDD3C2B9B
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362166; cv=none; b=DsBn6DYdmtLmyrykCgSwuwLFp72DGH4fFlUidYS987FFn8kcyzsPhV9pX7ldxov3xdYWfALSDKzIFGfele6n/Gz3wqd02fmsUAmHx/hWv2QY6/Tasu9nBMg4qWC6I5FFT+umjyREu6YgBNch7EsFFnMHUMusBUZthBY2yB5zG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362166; c=relaxed/simple;
	bh=ITMy3XXDdoRhBPGbOVQrXlucI2/W45zsUXuZZWnavdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXC70Z2+snl7QzXQVMLsI0y20eqQdjA+tm+4Xz5gavW3Bka9aYi4tivKIlVE69tm+ColZsTNbPkgI68Z37s0ZPxIDw3JsPg6OJ8w1omY8S5cCcqgBCeE3Zt+lPxdB/Uq7WRXjZszB0P98eLF/zGd/jeLp32bZU9R2UW0TrtePBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osfTvwyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOwVj44y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osfTvwyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOwVj44y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SEZH446746
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=; b=osfTvwyzBKQMAJZq
	2G6Uavflj0vVcaJppNiLaLPlmqLbJWPyBu1GITbU1//8ffyPy19exZWFJ+iKKfqj
	Z+dIqZsWeQTDU/Bde8nKs9gNowFTOLO2XwIzJSRiJDdbNMvMbiE2342P6LV2LwsS
	mWRMnQolW2wM/3mqNTYNbnzIKLkhbKplD8ZlVN4RpqpSiKov8oT1AjM2Yj4JNUzX
	f6FVIjmHk4Hkt6891SFqaAybrjoCXo3XRz3+uCiJPKPFsFY87KMcZVnGkdwBpKOt
	MGAfkvIfj393DhlDv0i0O6YjDRbImRCglh4vlQDCebUsSi4D0wrEfl1/5tSYhsFI
	inGl5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v9190b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so167010385a.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362162; x=1786966962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=;
        b=SOwVj44ynqc5FOVp0k4FGCvYER1X8JMj8Wrn5/fYBE3xcXa0Sj/64gbWThcYIsxcUx
         L1EFNHrBT9TOc+Kkyxlu8WXMgLYJJSxHChVse7LGdHLWgPKsPqt7BSdvlL+AADHOmMe4
         z7FNJVMKn+lTrNHW67xpH3XpKQ6YxzX5BeoIDBKUD4sQ5wY+0J9gpVJPcHjP8tcrv+0j
         9rhwV0sbifai4WQUfat28nluPsZRk0fpl3UwpF6lN+jH6a4ZPmdcytMdgwnqHD3BFUtf
         uSXEZ+Cpe3++oZgPhI7A5Qp5DCwagqMTGCCezgAd02eM+ET7rfV7i2Lo0hcwG0uL9RK+
         ojjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362162; x=1786966962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=;
        b=HyAD/nEqWQcT0Eg49ysCqwM66bboJ1KKiSGqFhdL6UxdXht6g3eTz65ICfAu556lnf
         kkcCWkAcaCAm75CkiM9ZVXoQaIhEav33Vni1NYRBn3VHpHea2tV2VgUrw2sfsbLHXp6K
         flngMMBrca7mcKLaESbNyQSK52ZYa0TL8aP2fAbxg1HS+kuFCuIi9gDP4lOA6wpsujnF
         XiVG1YZKgXZPlMrh+RqM4BO59R8K4LN/xVQ4xu/X92PA82wycrUMQw3hoPy1AL0Zv2H3
         U9xntLzyUtS0HknelFX695QS8YewQ+uPGh/SytjXGLZJneWUEHhyXnUo7LrfoCc2EZ8K
         7pww==
X-Forwarded-Encrypted: i=1; AHgh+RrlHfdG/LLCvbzkmHa+xLo8It0Dcgj0y4P7IZY/gA1CujldcaUWQXsjLXJd0zd4mtcP9hPIIEpteT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrfKOgy/r65LwoELeFIdITzyI244CNo+pm2IDRw9YzweMInvJf
	fBm5sviZxAibrryxpRIUvYPx+PaKK6IzWWcPd5Y8XOTrxvcheD/qv1uVpBcHVWOR1ogFD+5wnlX
	zpSarR9TqIM7wCOrXHKS5Zub3y8DeywyefIgE5QuxGhOEKgHDW9I0K+Rng1TFIfo=
X-Gm-Gg: AR+sD13DBezP2V5b3ca31HDAtQsNqbd3flYcgSv4Xmky5uaESluP4lfic+zaf+sGHFI
	hYKrqbxoYeO/x4YoPIGT5KyBKD+ZIRxqZVi3wszjg08jKDKUiAEQp8OdPZGFkSeh9rN2m8OXzFN
	l/ktfFXfMXbpNM3QdjwI8dIGm+CE7mtgRNK+JfB6jvDyOsIbLaGrTfUjD4cqmBwP3GApdxijagv
	+PqJ8SyUXNlG9tgRg5ZM7qRCBLcBTQf+OSi+BizKN3IGsiP/hVuPvCWUYAG0Eowx1xdKAL4eKaH
	MAZG14KTCuDGzwvFHrTvh+toz39mSsZaReMfntUsflLwnM8iy1U3G682knGV4urz/3P8ZhhF4gD
	I4Su5StM/bm9W1IiCxYhQitsC9WgYwn77wLrEojhpJhH8hxkDTmhQ5sK9mxAl4TCR37Nfs7VkCm
	D/nUM6T0ZWQ9NHQw==
X-Received: by 2002:a05:622a:53c5:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52d4be1a6fdmr9801141cf.7.1786362161961;
        Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:53c5:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52d4be1a6fdmr9800561cf.7.1786362161461;
        Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:33 +0300
Subject: [PATCH 03/10] dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add
 MSM8974 SS PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ITMy3XXDdoRhBPGbOVQrXlucI2/W45zsUXuZZWnavdw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkomTnjHcCd6nz3fUS6RNEbpdeJ0MAPF/iz0
 1xmLLF66LGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1YVBB/4sjxT6n2+RmwKxwbuq5vt2IrhORlwfQDmH6ba16857DNUAleyku2Hlaei/nxogyF8/S6C
 Tm1c+5JNCIEczvSmTzEgEBrkGDkZ4ThAP7bdKl7Um5zJRXivVsT2nlLEWeBA07S47nd0OmXMYnd
 /F6VnUiiwsd2OsIz8LnxNAzTVl2fHaQELdFykdueLilDczls+ROpmrUnfh3tUCIX/n+KRerK1Yc
 SppNhyOFPDOk88RdhraI5fFG+1NKXo1MHd6Xrw8mrQTXfLWFF6J5BrKjPFNZNtCtSreiqWr51vY
 EcqwjbADMNbEKmKeRENcfedQNz6ZnWbUgTW4sHIyGDXHyyv8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX0c8iuM9ZS0+Y
 zrZxA4NrPBfMJfkGEGX6d3p3exa7ZhR+mw7aw3K+iwAm4N0i+htzCDecKebAol1vmmDN7onjLsi
 3eA/YSDcjiOxrU8oH+CrGY2bArbHTsI=
X-Proofpoint-ORIG-GUID: 6X6gmA7cjKLZBKPbG21-3nGDWNYwTgjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX0oBbN0/f3yKO
 uM4hVT76YNB0WOIyaAlG2TVGOsaDDj/aJYO9XjUyFHFfVPNIgJmOTQEa6oAE7vDiyVoVUtJG1hh
 b4ui45lhHfM55HbcNCzjdPgTB9Ho/nHO8s4pwxTz66cvcFRo14iH1WJ8OHdpCEMr26khnqBLIkr
 Yfq6POOm1Ug+Ia1dabeZUyjYBD0wl2eayMf8g186GdZGtluW3i9ucLlolzfVqsACIVlCdbkgqeS
 cwZ5dcFYzrSejHnlkLqY0AQC5bE8S/nvVr++uoSzqXRikgkslArIUbWB5H/WZEXctWCbOhrKdbq
 WrZ2+aNBbiMfrvHmF0w+MNHRlcq4Guzt3e+RMJqseGkpcH4MNPk0yoIkFidDTvyBpM8IOIx1Noj
 iPFBao9uJvHxrfqKaA4jcPVKlIyQQnY+y/OcTmZbl8JOXl8vx+4x5sYJbZgNau/ksHNnu/l+gHD
 GUhZcDBZQYXQkpcBo1w==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79b933 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kaDxNF_GQ7L6msPqR2MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6X6gmA7cjKLZBKPbG21-3nGDWNYwTgjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The MSM8974 DWC3 wrapper contains the same QSCRATCH-controlled
SuperSpeed PHY as IPQ806x (SS_PHY_CTRL at qscratch + 0x30 with an
identical bit layout, CR protocol port for the lane registers). The
SoC-specific params differ from those specified for IPQ806x, so add new
compatible for the PHY on MSM8974.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
index 6cf5c6c06072..29cb43cf7348 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,ipq806x-usb-phy-ss
+    oneOf:
+      - const: qcom,ipq806x-usb-phy-ss
+      - const: qcom,msm8974-usb-phy-ss
 
   "#phy-cells":
     const: 0

-- 
2.47.3

