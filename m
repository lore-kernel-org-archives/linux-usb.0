Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7A23C1D4E
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362161; cv=none; b=NJpuEpxJ4I3UXV1xdFaHLzQh7mKyTJW+f6CA369J2ryZrVTru4GOeAgRND1fSSgkRkM5EIbpCfDH4Gg1SFMf5+1D1Js4sESCnH8FCbxv2MVH60jHMCUhJbGobMJ4ZHcmQRdP4mEYKToGfWTATngRQvJm81ynP3O8RyhkHE7ZWj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362161; c=relaxed/simple;
	bh=qhRCylRHTRaGD5YJ/0I53n0rejgVTgZ4tzsI5TfFies=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4PwX1HR9QDrz6DSqmlAkQrgW8bKgLekh/HWAnVB9cbBj2VLZJQCtXtY3JUBSy+btNnEOa6cL7BOQ5cLzBEqGX8rRXaf1lkvKlkHHSfCGFyG3tWU27i8aGS5jkHiNVk4Yks2MJnPhtSTsbdhxUFIS9EAlMbyUJ74JL0Gw72gI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX4IhYaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPWYYbnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX4IhYaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPWYYbnG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S6XZ1232128
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBHgqITPjiMrZjSXDcK+2HIpofFndc5Z0v0BPQOXm48=; b=PX4IhYaZKAaU2JJs
	HhCLezqVQ6Nx9eZzMEx+idZ4G2sHefm284a3EW8dBKDHwcLxhtnsW3tcnxjGdLxL
	ziORSXoeuDwvuEgroch1RRC8jnewWYwua3ojB3TYhva+jEJBuS22+t418s5Ru6qs
	xUXjfemf/kLRHl5z6UlTZY35Q34pz4AfYPDkDFCYboOl7ioupz9ap9Y834UG/LAl
	N/M2FLHGfjRgBU0IRs8xKE5TIWih1I2LXkDiAmSjkp+RLVvCOAGVR8E+ExJXr2Rd
	qjvzwQR0gTrW1OtT6p3VZuH/jwXh/iO3fYKw7oN7i0/dB8rPRKV45oXdFU8U26ay
	xBfXRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh58pjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d33c89a29so15734541cf.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362158; x=1786966958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBHgqITPjiMrZjSXDcK+2HIpofFndc5Z0v0BPQOXm48=;
        b=XPWYYbnG/MTZ61ujIPHOXQw115H15v3ytJ4OcpBgG3D4E0EqWXAXLrQEWV0gVcoh0L
         X3KO8XjpJcG7N+MBVYgHMaFLQlbEzLVLi92ckn8sSVARlAclTmJ5Ed9YcqGtLEfKtYJe
         InMT+98ThFDxb90HitB4byXWeEiuX5ourkGRbNdffE+hkOiuN9HYRJYs2c2r26bKKYd0
         PQ86tHpp6vrcaF886huaY7hI+LMMS/MvLhwdeGmHMKrEDZphzDHt1gqqfVYyG6P4w3rt
         9icJDC60msiM34//skaNE5wPrQupgcenp2kW1lm1HPO2mnjPfVYgQPWU2C67J44XOitC
         FJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362158; x=1786966958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBHgqITPjiMrZjSXDcK+2HIpofFndc5Z0v0BPQOXm48=;
        b=Z2WnOT6qmMKmpeyqzf+gqnQA0NEA2sSBPgZE2Fp3GJp9k/EYYYh/GzKzLi15DW/MQr
         ZowGHph/VcIi2td3jfCqzrxaWRmN7eHyzfITYpGQPZz7/L2Fli3PVUE8qvi2Os4q4wmy
         RdjZWCMYD/YkhC9w0IqR6YnSoDmOuOM+SbsJqCNvbnm+O9J7fXVGeuptoHqfL0vl9/Ur
         Z6nLe2q77NJNB/rpSfDfJFjFvoGCpCvnqYCMcjDVUjbvxEoq/9jEaQSZvnQLYYYFtA+C
         z3QkKcqEEsl40NbgTtGosUmUwF9JHgoXNpc13r9Hdbb3V3ZT1MxcFlG9jOwS/awcokqy
         J6ng==
X-Forwarded-Encrypted: i=1; AHgh+RpYwTTHQbvkGYWcn0nF//dxfMJOIkSx0eDo2FQe+XFoHw01QAgy1ZXVZGyy0NOjZY6GmwXHzYpp3IE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQF9yg76dD7W6XoQTBOmXSzvOAJTRQErv58lONBU3Tr341X1GF
	btm7xSMzJXKcL1PFpoc/ExQ9xSsrCHD8gvX4+eggJziO5BgDYF8tVd8ar2R2IcpQCfWbtFE9BJ/
	6O1YCuWcXl+CHu24jt85/Xi9hHZ58M0A5iE6lcv0RoNOmmBfLyMBPPSxhxUamDjs=
X-Gm-Gg: AR+sD12WH5hxZt5n6Mguz3LCfYK3ZTywAQacMJljqUxrlEZtj95ZnkpXJQj33D2hVWe
	183PzZJNjQLf2V2+yWFa97KwdG6QsQzM7zwAmKpoabn/vHKOsxO7lW+5oK7y9EY9V9jqxFVO+Wf
	NBih353QBP5xeKkYdGFimpoe0G2o/2pjuEGOe8XslP7bqr4yNQH52enCDyQ+uva77KoLLjbvIdo
	Rv7xgVsOTnkD2KyYiDudmkj4Anxmzg8dObioUg4CWopcHEOgblF0MOeGdQRzWo92G8MM64UMMJ7
	KozyItivW8iOhAYZGMvZaolDw0BWH194raXf0b15iZPM0DQupH/IeKDz6icK0J4ULrASiOvoGwA
	vuEBbIihxWWp3/9EycF8t4UpG3SP5izqWxPotKjuodtgj7Y760zzbVMVAe7PXrFYkph4IviNw9u
	kbQW7H9iKEJsL+IQ==
X-Received: by 2002:a05:622a:587:b0:51c:167d:b346 with SMTP id d75a77b69052e-52ce6100d78mr441968721cf.23.1786362157665;
        Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
X-Received: by 2002:a05:622a:587:b0:51c:167d:b346 with SMTP id d75a77b69052e-52ce6100d78mr441968331cf.23.1786362157230;
        Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:31 +0300
Subject: [PATCH 01/10] dt-bindings: usb: qcom,snps-dwc3: document the
 MSM8974 controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-1-1a47e1185524@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qhRCylRHTRaGD5YJ/0I53n0rejgVTgZ4tzsI5TfFies=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkoAdyxjLuhPkbluIjiVxsxgMpnlxghHtcQU
 vZW/mxZwn+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1TR1B/4+J4GSbVP4vTiAOU6zugN8JT9A/BvENs3t8WPdfjuQAWRV1eQQTvGQlBhWyINK8JFLCSJ
 p6bWLIQKP2FkILVw8C/omiE0QqndUMLHBkwGQkIbohEBSH4gN9BC8n/qjgeEj6WvoL8kABit9hK
 ySCaC4pibJKE9Tfkw9RTCXy0kbxMym0eoHRbJ1TpK/8fKQdiHrqOqK3jAte0A3AOMI6fbtNp3JA
 ORNKwajHTTJY5tAW3yJJeT6cNzeNIQpI6nXQ6Ic87hPmRXVykE/EyFCaqUiekfg0EjVbR5pa4zh
 U6kEjfrUm62kZLUW7ZMrjvXafAaed17u2aXsz7VoDId/Cj6q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79b92f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lQX3LMpwEkNltmwnNXMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: v9cQS1fQugh3IKUameCIliqwPOvcOFj3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX5KjKMYkcxq/T
 AIFPt/8exjGx8rxCJ9Y7vsC5NgzOFdU0LVLVi2YOYZn0hC7pIT3ie7GkuyqPHj19u1AEy7lzZGu
 bwMJbQ01UyNbSrLk5EJgaMmBZzvBbF4=
X-Proofpoint-GUID: v9cQS1fQugh3IKUameCIliqwPOvcOFj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXzC+t1waXvcWv
 I+RN4/Pp2fb7WCT+YLpcaQt2u7Jjh6u3/X4ix6So7Cf7E01DTWltNAlQrUXl+mP60Ool7GW1/Dy
 EmJtlycjfkdKCOm1gC/mpjx6fkfGv5djVLhzlONsrtr0MeySHSYdWazaD6BrEBsKeGzTnpmp1mn
 doPAp4xzllk2JTEak1WPcAp51F/KEDIu9sfTjyIFm0fWvxdyNxpUipQZIE6JlP+69AisQc5tAk4
 dDRRGyh8SdGKLz71qIFTpra2iIzNWwbjspREfUe3osbOLMTihEaFLmjgdibR67qqKmODi/THhL1
 2yHz4P3c0oVVOCCXRucWdd8N4+wPTvTsON4bRI0HN90LrJBfEQPF8ut9xj79GtNFADVD/brgQz4
 rfSnEC3ZH1K1+g6sIBUTez6V8MMfdemhogG2GFkPhWYOhmzWsK5BlyopmYA93KsgxOxj5cOpr7K
 zTpAEFVNHalxfy7O5jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

Add the qcom,msm8974-dwc3 compatible. The controller uses the same four
clocks as IPQ8074. Unlike other controllers, it has only 3 IRQs routed:
core, power event and HS PHY.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..9f91c8711e02 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -40,6 +40,7 @@ properties:
           - qcom,maili-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
+          - qcom,msm8974-dwc3
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
@@ -268,6 +269,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq8074-dwc3
+              - qcom,msm8974-dwc3
               - qcom,qdu1000-dwc3
     then:
       properties:
@@ -453,6 +455,23 @@ allOf:
             - const: qusb2_phy
             - const: ss_phy_irq
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: hs_phy_irq
+
   - if:
       properties:
         compatible:

-- 
2.47.3

