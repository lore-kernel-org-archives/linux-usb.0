Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280DE41F5CA
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236155; cv=none; b=SnoIoeLUGveAR63rgp5xO/OAxrT7+D9cSEEDUu/bq7y7ojnUbP5vuZGVnyjM47Hmf7S2lUDcTovxCD6+0cvTlluuDhzwN/38iNcleYAHSLn9skhlrAJRWFaELYiGGeVT2Frt4Ri/zx5KSQB5MWvoKFMifNE0v+IaGOeYxeFxJUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236155; c=relaxed/simple;
	bh=XTLt0c5Dv59ALcqjp16DIRAjGHZtam6MfpOu+WlMqfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Df5d3WlDMSPjPGfuVy2cr/TXUtWV+Xyz0kweVMoObo7XwCr3muytBvCcsHsC3fQapgmPOcEGopbUvyslcEKMFdpMhZRnMHD45pg1kuaZSt1fkA6YuAYXDVtI6GErpkYDjETJmYFTwG6UJHIoVEkrgQ8cj4fYCSI4tSV6FPGbPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIZmVThj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ciRWpOwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIZmVThj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ciRWpOwS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eAge567589
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F04EeTWi1RxE9e3yAxNT6w
	8vWQZp5pUahO1E1kO+Chg=; b=ZIZmVThj+B8s2Yt1FRxfN6Kp2asx/zeI5/JU97
	IsLLEAtmQUthcxaEbR6sNGugqHGSk2Lgg+a7ZN/nxwMRoCjWXWap59zYOC8QASii
	gZ7kRiZ1ALu+622WBljFdZ7BjpJ0v23+4S+8IFGhjK5OAVDEd0oLeTPP+hgAIrSr
	0mYGdwal+NnBMYG+NEfWYr3ogVN3uUT7EcOos8xdbRByW4YAKBwRvbgaLMxSy7Ow
	zfCbQ5vntSRB5D0Ti9kEOuwY5U18mHmPreexwKFm94Y9/UThWgfkG/TcNbN3BkTA
	RuGOx1yMSnUcfxVP4c/ej52buU1h0NX7AQ+rXqRhUrXPRqFA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh8s48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:49:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14318be7d79so2092549c88.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790236151; x=1790840951; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F04EeTWi1RxE9e3yAxNT6w8vWQZp5pUahO1E1kO+Chg=;
        b=ciRWpOwSJPNYtPtH1USgRAnVWZRGPfYRO2h2am3SStuNHpQVtc2Y+5pTekeaosCT/d
         4YD98MD4UtiR5HvLRQG8QoSQS3LrO881DsVrMFcbBgOeqerLWy9JAjUAJ/yP3RRLRwwi
         YQGjw/76y4cikxRdljSXyE+DgEeH8/lfRPsWdLrW4bQ3L2oGL6DBEi3ez1ctfybNDyAu
         3Vh7tCQehrg+LFggzJKIJ1PgzQNTccwWV0L1qvpOilx5BPsWyoocND95sn7zNZ5qvrhe
         H9HKUS5+2hFWn2LKUX6r5oLjyUXpKTeP7Cj93RZVE2Adw7B4DBSCOAUxW382swZxwnZJ
         GIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236151; x=1790840951;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F04EeTWi1RxE9e3yAxNT6w8vWQZp5pUahO1E1kO+Chg=;
        b=KKHYaiWPMmwh39ujp8plo78So4k4dpH4PYuldri7pBOEkrySTnmZ19ZKJ04v7N2PB1
         r9dxMxw2Ef0QHB9AXOiNSWbRI1EU42VlYTaNJ7y0WCN3MHLbjjQu6s/tDXlaPtoakQd6
         tBwkuT/iFwLwuh2TxLm4Yyh9Z7mpM9KVjOT/1QdFl93b7BMMXeFOPv5VxWPT34a6RaB/
         IdM1l8D4qmlZuRpCo4XouQ41yrZjRNP3J9J6xhc87n4GirdEBA+KEOGvAr3zasA7nfF+
         dQruhbf4GsdXA4YSIlb7Ix4YH1uyhytX9TFw+OoTeCcADa2AUzqjUFkO7+sEQsygL1+D
         U0Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzMpnXwmrNttMsNslNXwicKtXJkrSg6QCEVfiHh05PIcV1BQ0iX8gg/MV+kX6kD3yw3TeTNdfjj1IU=@vger.kernel.org
X-Gm-Message-State: AFuF++lu5B3ScYb8+pTjHPL5nQol5Plz8PVHUNFRwXkWJnd63uXCAcOI
	/clzSVTJIo0Fp8VRxccQuCiLpudmv/4RVL2+HW6axSJbptQbf4QnOkBR16k3Ut9P4YNCQvOJ7Qk
	xVwhEI2Xgsf+pqlE20STL1H0EVaSsphlzDAJLtUZ6685b0pfLZaYKSvk/WAgmh+A=
X-Gm-Gg: AYBFou125wKVtXQw12xDlreP0QiRzDUiLvXNduALFAU/g77UtiJ3SdbQ3YdMmsvFv7v
	wKXHIfkpuLpom7iH3RYJl9OLVqCF5FGdQwH94W45rutxNYtS7HhwVes7ZmILw55vptbQXRrFzJL
	j/AepGr4ybx/tQkZEeLn771Vz7sn0b3RROMVNxCyurPcOAUunQIWOck2K2vA8LU0JoRp8zH6HL7
	X9++p79qgJvt0YxowG8n44M1YXIiTR3hwbe6yTDj+05vi+gPq1/lNuVgJM7V62o5BA6YbnB6TG5
	Ip4pDqwxVQU8ka/ZgooVNLCpVFFYpBLZnYCDd19mkQPD52aaDXUS0qA7fU5fzp62Wr3R77BcYZT
	HtrBp5GGrG6/C1m4oNg0wdM34ek6J1IHMHe57sJWiWWU3YpQd28fApiDhukOmQ+27EYjS6RB9D2
	6c8lXdlDytc2mPyNiXr4atgh8czPGO
X-Received: by 2002:a05:701b:4205:10b0:144:f86c:e330 with SMTP id a92af1059eb24-145040374bamr1222731c88.3.1790236151366;
        Thu, 24 Sep 2026 00:49:11 -0700 (PDT)
X-Received: by 2002:a05:701b:4205:10b0:144:f86c:e330 with SMTP id a92af1059eb24-145040374bamr1222711c88.3.1790236150749;
        Thu, 24 Sep 2026 00:49:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm19401376c88.7.2026.09.24.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:49:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:19:05 +0530
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPDVtGoC/y2OSQ6DMAxFr4K8blBiBkFXvUfFgsEtkYCUOCAqx
 N0bQjeWvuX/nndgspoY7tEOllbN2kw+4C2Ctq+nNwnd+QwoMZcFStE6O4hcqoxUJpMGU/CnH0s
 vvQXMs7qypXnxNHctoamZRGvGUbt7NNHmRCCWmMBZ6DU7Y7/hjVWFxt+YXcZVCem1JSGWqlBp9
 zDM8bzUwwmN/YDqOI4fgbMfstAAAAA=
X-Change-ID: 20260820-ctrl-6015e1503b24
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4d5f8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=10T2-SsU0MHo1Rfz7GwA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: X2VU15kyid9kIvlgAVmJvTPQxrxsUH08
X-Proofpoint-ORIG-GUID: X2VU15kyid9kIvlgAVmJvTPQxrxsUH08
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfXzyah3lcJwT8R
 pdXozig/oTDjsx/oyg6UemUU2cEA0HSJ6rsUgtY9G4GmJUQp6dBw2PV33CYvLrma6vj93VAZdj6
 9UIcREXZklDN1c92VZOCXAUgGfFVrfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfX/qe4xddSqx87
 1ljW2OMdODw5hte7444e7KELbzsLWQlWdCz9Oo369UZEprYobdQlVF2rWJ7UqUw9DYz7gjzroEf
 P4I4kPCC8swzFN8uupM0MuyBmZocJzEY7+JMyd8ePxySjaqsueXSrTyZgHw1CFmWe8WeIh8oBQU
 iCMz2bj97iqTEboR0ZGibMb8yRkXNLiAhzPT5ogAnUc6KP9K4EmNM34DZNEAXNp5Be/1KWtDMD0
 JYlAMXr+1ebe3jUAhrPJmnbLUoZSLgfw3MEtI+xVvfNYY489lEnNZlDNIMMU3xUC+0cnxFWwu+M
 PyFMhpNseBmT+7mJJpGH9qoxxVcxuKyIGLiOeIjXSYQnuV0eKWGc8m8FWg9/UrEOP8WTP+XamF8
 aag0qSqAk3hf4aSzOcDA5xIPNb4/LQj3pmCs45Mg/JhXjBwL/w4ovRHHwxa6UgO619xF/Al4PKh
 MucBbrxx7aOM04SI+iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240033

Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.

One controller is connected to a High-Speed PHY, while the other is
connected to both High-Speed and SuperSpeed PHYs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Add bindings and dwc3-qcom glue driver changes for adding support to the
two USB controllers present in IPQ9650.
---
Changes in v2:
- Rebase to top of tree
- Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
  This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
- Add ipq9650 to existing clock constraints instead of new constraints
- Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 9f91c8711e02..a8fbf72c6375 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,ipq9650-dwc3
           - qcom,kaanapali-dwc3
           - qcom,maili-dwc3
           - qcom,milos-dwc3
@@ -210,6 +211,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
               - qcom,kaanapali-dwc3
               - qcom,maili-dwc3
               - qcom,msm8953-dwc3
@@ -525,6 +527,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
     then:
       properties:
         interrupts:

---
base-commit: 4d7e75152b01862a4ec598435d79a81c4b254dd6
change-id: 20260820-ctrl-6015e1503b24

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

