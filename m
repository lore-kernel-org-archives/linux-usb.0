Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16621254B
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904953; cv=none; b=k0hR19UJg3gS+JUrN3dpsPkolENs0W/I0O8Ts/ELhhf1LZvG7qjPI2vKjSC9OWW44y3HUn1mnL1kX4HDv83zvG081I9qW4TA5B9YuS1D53Wf/Ca19nbRu32U5i4mQw0cD7EI9WJm59frq7MndrLJUm3QyiHWxecMKS0PUeI5nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904953; c=relaxed/simple;
	bh=rHwWGwZU0EcalIz4jHl8ygpsL2QmGNrZRsxShRd9WZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LxC8lUqEu1Skukqu2y0S4eztmzKOtlPCQsWRNQcz0ko+4q/+u9TT/qZ83C8JkWhEhQnGevej7fGKOLKq1hZr0xQ/kLsVkg/eYvoPXutSlYID59E0gcjERZ/FiAR8KGxMFYuNsbVCqG/IyzlfyEeEc1MhlBe/yA2PY5U+jlMN7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBF9bLkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hD3dSVtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBF9bLkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hD3dSVtD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S7YZhZ2446846
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 08:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qbULV2SnljGNcmRaVKkcLmoVphsQM6DVdSI
	FokbpMcE=; b=LBF9bLkAAHPH1POj2O9+q0rPee2Mw+GohVyGvFYv1fO0BpKfEzX
	MGCjdd+3QH1VX/DpaRZObA31M0UjxWswiu8BYOTRGDfZCF2MbhOfqjUBglmfw7TO
	uwRGxW/RjT8aoYg/n205Vq4LzQVTErc5+DLNQ3j5IEQLfWH59d3wtf4Wo9NoAR0D
	TjnHqn1Duv7g+1grQYL0F+BHrXgyIN79zdVmwYqsFnisOTx0LUOQJBRUSm5aHcg1
	bfp3VrNe211vTgRjA+MEfT+rNuc9NQGaSmw+2JhXUtsQW7CgAAQ8em4jOWHMAojR
	Pm9ccSWYeRYiJmHeqp7TR5BC/NpConvQ3kg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h04we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 08:15:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1286776a91.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787904950; x=1788509750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbULV2SnljGNcmRaVKkcLmoVphsQM6DVdSIFokbpMcE=;
        b=hD3dSVtD5yaZDrzuX5N1WS1Ly4MPfACO0txavhlAJ0X3OMUyAr8MgGFnXuC7yqefkJ
         rRTjpv4ZWrodHm+pDHKBT537FA7v0/Y+98roG0yPFDwW9BWDpzLZcaPtLk7OTlKTLWtd
         ccfJpfJY/T9ytqo1VZWp47hRGWkFFzam14utsR+T+6wdfsL4BE+lQBbgwNGUuArEiJWx
         3FNPV0Z6r7cPd9P2jbl8UEAiuIOna5PrQwhS91qOsiVMP2uAjAYWL3En+IbPGLgTjG94
         U0DrtMuNygIOd/Jd4+HCWq2X6JyOohLJEepR8ucOne3lggd48Bd3ScVnREu1s8fglZqF
         W6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904950; x=1788509750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbULV2SnljGNcmRaVKkcLmoVphsQM6DVdSIFokbpMcE=;
        b=f0GaKKKwYiAm9689FGpN9vyRdXdujp2pXYF5Eax2AIaHq+vLGj4rtAUIeT80rCNgQh
         9IMJgKGC/m2PvxR4BbPHdI1afDYgVqkuB4QaAaEmyLlFne0hMsIfr0cMx8G9c+ygy6BI
         zwPKAKWicG4bNmdYhnJj69OMCEkh45ID/9B8Y24dzy8rYcVVf88ANR77yfF8QbGtwbRo
         OdFCcnQiW4ZdITKqVyIY1Tp0G5G2BlWuB8PV6+9WRgb2ZmM0nSLBgMIc1W9Uym8QhHh0
         TDaOx1rg9HrZDw3l4Bi2+mLVV86cbPzFihefgiFkZJTTmfGX/fJQ6C578eEHGdPD/q/R
         uIfw==
X-Forwarded-Encrypted: i=1; AHgh+RqckJhnlZC+OgmEUkrIYdeHje+7PN09bLJFihYqazyhlxbTMcW+JenTLAzvLezgOzbhtgNVIQxgb6M=@vger.kernel.org
X-Gm-Message-State: AFuF++lXTthI8d9OMsZNXzoWDwPsQRn2GDOoewzA/OihfhGWF1BFe9S/
	JlA+mBjyilRSt6oMekqcY+zhUSpxA2uruZ/fW5YJcoa3eQuuf8JwVcOC307deCe1nLU9Y1dYOH0
	RWEcZZyJEKnb91qvAzxu5rC5fa4y97krEfSILKwof8D38EMBGk2cDzuE6bByZPRGZDmxRLbk=
X-Gm-Gg: AR+sD11uUEnPb2wdSw1lHhKNKdh4s5WxeTGe518RcMdFOs3EwQlYx6KD7tseuFw+Wa8
	sX/gOdydS7l7eTCCJteEObu6Lp4ekZlf86QHIffCMFQmI3aZoTaec88oEFfE+xwSsBGnm24wFs4
	Qo9xPSR0jiIVUQ6bKRSBo6kEDV897Gyk5C40cEDwDYEVaplvwlhPmXGHQbJPSk7zuaMfi8KlTbK
	jw+vpDwswv6TnYLTfbCj5bulWcl3EDQleHYN8W+WcobrLVlDJdtuwzKMjdtpagUYX+XmKjLDHne
	3Dv1ESD8zO9TglUQuq8zUNM4LtAAR/4u9L8EL+a5Dq4vF5PoAVEqOlGlnGUMPod5Yx3lsHs5b0z
	/Gc+nCyuMBmC0X/vNCk89plSdPCQ0Kt3AxQQVzK6oL1BUPemeUO86u4DYZcEeW7lAJFlpnQ==
X-Received: by 2002:a17:90b:5281:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-3969ba3a303mr19004369a91.2.1787904949696;
        Fri, 28 Aug 2026 01:15:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5281:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-3969ba3a303mr19004286a91.2.1787904949204;
        Fri, 28 Aug 2026 01:15:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm3832089c88.5.2026.08.28.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:15:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for non-MP controllers
Date: Fri, 28 Aug 2026 13:45:42 +0530
Message-Id: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfXyMtjpLIqXcIs
 RKLbFW4L2gjKb0W0j9wEjmnQ3ldMzBY6/Y7x5eTkK43/clY+URn2NhfIEF1ilhwJlWq8TGbnA8w
 bTuFJZv66PX6Ak0leSpe05VITUXAwQU=
X-Proofpoint-GUID: -vUR3Z_8gk-lJ5bi2Wzq60wKbQch2DsM
X-Proofpoint-ORIG-GUID: -vUR3Z_8gk-lJ5bi2Wzq60wKbQch2DsM
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9143b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2POTKgeWoQizHkAibKcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfXySKW/1tHZziU
 zE5ZkLjcsyBDsr7dPJSBJAeZ4MgYdMVriXwtYKrJMWRM/LUQz6KnG4+3vnN1pHNW/trXKXd2ZEE
 fdjy7rdYihvQeiN8xAGCZM8EiXdHKblhMrfoT+gNG29vQgj2dnPWnXVDMXBmHijol4ielbHKZju
 56fN+xT2OFa3ovmcgmE2CCFNJYLHIXuhrTtxJunIvs8jYmhVuPbA3x4h4/ZHtCLrqOhjSidbeEp
 iu8Hua3RO2oqP04KW+vIKUQBM/4OkUymneeM0KR8JD0+W/srO4GVhY2LMdNXmYg6MluwdXmZZU0
 Ve73DARhi/3bQBiXUyAFNGe4tNbXf+OCHQRn1bcz+CsEXnw3AFXsK+W1EXsoC2kDmzc3PQ9Uij/
 uPqEQu+ihlG0hs7EYQaPpQNEBuCyM/zAjsgSmeyIXtqUlCOmZ3eW8K7dXh71mUZWAvYE5lk5+wh
 Uo0H13ZTEsvBA/NoCJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280069

Currently for Glymur non-multiport USB controllers, number of interrupts
are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
present.

Mark glymur non-multiport controllers to support a maximum of 6 interrupts
including the hs_phy_irq and ss_phy_irq.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
- Modified commit text indicating the issue in max interrupt-names for
  Glymur non-mp controllers.

Link to v1:
https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..3bef18f9557e 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -524,7 +524,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,glymur-dwc3
               - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
@@ -547,6 +546,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,glymur-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1

