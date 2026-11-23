Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452190;
	b=c93vnM4Y8GYyeWRXwKEgiaPtekGGuqAkNxlYJrJHeViBGxNMIZP5n65tOtSODA+roT1X
	 o76lJsNyLqZZVTpssbhtzDJ4S8D2tC2pdnjrYJz6OCodwf0ywe4z9ifdUa5hsgXuxB4Fo
	 naW30rz73Db9/g6CD/gDs+xEETk0I0ulxFrimI3jkByoSkXprvLm6F5Vs40svEqj2W1sk
	 jSgHQ14OHyjNvICLLBgKnInuA0Az9myjNdJbhG346kF0OSykMB3k3w0Cdu+A+VnWcDWeC
	 VgBQ/BR3ZtPsnmTBCjbl/yd+uK+if6YWjvH4dkBUXqPlsvmPfjGRllr9GMCFhRhiIdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
	b=Xp+evSWkI8/tDYSDazJvEKKhIxguRjZADRiiLWDo3ch5UHuIhn9CLIYmw+hS4BBApgtg
	 sN3pqw4sjy1pISyR9+2ZQsz250dsmXIDqM/RxFq+hsZsycyh6B/k6TemTA0ySXObc/iZT
	 ch3a+8tDtFKnX34Bgxmj4i/et8AzRmInV4EEsGISr7Yzw8OD+nDEmDn88wQsRl+/yf+tZ
	 UeSomZ9174M6qdHCiQrw02+xkT9H8wK8/qHTDhZVlRaup4KXjs+ebjtpwdqcQUB8w+get
	 8Fq1ao5g1rIw2pNV8pP7OB7zOF1QZnJhisGun+s1L6DE/g+au4sKBw0qv8noVT5uhLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ez+CYzI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2932606A690
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2932606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ez+CYzI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH4913730755
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=; b=Ez+CYzI/AUVa4MJu
	y/N7F9NT+XsRTH0kSoS8+h5QK821aBadbEBGWlRawp6Bk45sbGMe9DPnagRw9CKe
	XR568NtA5Qtjgc3QofGiriwHfOS4AeGXVHZLVEhjmW2iP9lRQS6Um+noIY4gwAVQ
	wH5TmFKT/CXq6dbmUC4QMT+e+kImzZqVw1b5ueKm7T655IgkVGRJdkN7dnhidJWJ
	Op7iQI1J9NgCa2PjgShKS01BoY509R+s7q+NTafMHx4rveVHQb0uSZih9OnyxTlD
	xVmTXhrlFGpOaPddUh8dS+yMaBfj+EFLIjxlU/ILw/CT31mX8XMon3RpCjn2sXgm
	yPufXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2ef3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece3cd5a00so2401562e0c.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452188; x=1796056988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=Qr1cLOQagWRRghXoXdukbKBnL0X8gDYMLIaKfcjoa/FyRlE2F2aUlbIOx5rZR0PQ/8
         oPo+ryT/sZd2wNpT8Lhjfxp5MfCALb+93SUgswLveurkWqr4EQ6bbYd6+J+ccdrHWl0m
         k/6LnhLMcaYI0QjqM29xViRgH36lrKPEBNeLcAGpLudniCuyg2Z9aSOvm6ymPMjzHHIB
         T6kn96d/eBl5jueBvqphw16VEHYvDhSXh2fchW3z5qFaGYQ+Ws0ExBbxkeS1IZnoro8W
         zZtqyq220IadLbCNPucgwNHVNzEure5XhO5Hf3CkZcuBpaf041D5CnnqB3is2FcaxNd+
         ZvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452188; x=1796056988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=Go+bk/S5FB3rFX+ZFpojCveefsLKCSIQPFD+cw0SMhOGJuvYftT9f3HLeOfamSWDcX
         mlsTM7p8NB4sDO0avec2vEQdBO2RIKuIVBhMyBly99S7g4oKHyfKrYL7l9YnDOR8gzHD
         Grtcrx409uAfPKJ788DErHsq+0zOqOkIpP6aPMrKKZz1IdKW3q8Yx1gzUyRuEWY2cP6O
         6wOFOiw9LYW8Cq22n+GAl137vYOp8BvIc/z8GGbtCjKMAp3TTpY+GX8aqn+fzsRyNf39
         VqiS7vJf9fslksOAqOsSRdEpusol+zjriJUlJSqMcNXaVDxTu0OCZWhXVKgFy6+FeRBW
         b0ug==
X-Forwarded-Encrypted: i=1; AL+hErFnvz8bcAL7xT04//6DCKWxACzuHWI5jiApaF7YIEn0IThPTgzcFeTjN0kchHzoTvdNXgg9vY0XuT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i9WMgfRwX/ou2wTVohXJGnGb2imJ4KdvVWg44/TLA4XyON99L
	8GcIxJSTE63la4BbCpuH5oV9+Hki4Aq0yAb/5TmmgzEqjkaYdmjb+0a15nT4d3t9NrFUEJFytR3
	g1gMS4k9DG4Rpe9dIDN5dzr3WpEBMdZL0HRgutZRIsTc8xiXodhR+OdAlWZ3GVXc=
X-Gm-Gg: AZFdTZewXdjW7UK7wf0sBxEFr/K7eB+wXLfTzInNdAgtAx0h8c4LOfBKVsSe6Mjcv/l
	eCsR3G0Vt+/yviCHgoevKVWU0zNgrI+AxVjJCnm3OoWoPZ/BQ1rgS7/g6sn5S5ttaBLbQABGY3o
	YDEu/5TsrisK2hpddjn4Vw+r+qkb7hJkN3a4NwXruy62z87LeoqPh1kI2iZbrXpVFipZ3KExqog
	S0Va67IsibL+QVcRle+eMRDadEBoBmq1QPK4GMp/PQ0vv5hTT0tYowwedvTLlb8c3xyfk5K+1zP
	fgReE1WYGAA5qXtIBzoAbXtBJJCHwwdl7DFbD7uMtiwULgZI15Qs9chkKbPXjO6ej/XhjUGgQhZ
	/aouHwHd8f+XOoqGvuajYkChlihPSBTSL3k2xsF51CQb+vvtgH6zzbtkAy2fQ6dIi7uuJm73w9y
	UbQzKRTBRrFO/u
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741346e0c.18.1795452187876;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741307e0c.18.1795452187438;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:57 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261123-qcm2290-eud-v2-2-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Tz-qXPw2bIpC5TxQm4UAPEw8W3GMW8RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX1SG8KNnAzU0h
 UvFp390/SWQp63PzAWqoR/JY3NeOpf8NcVsBwbHTqFJJj+TXyEWJMDN2giB9mxhITINivmWY+vm
 THXMSKMa1qRI7v2lSw0YxA3Bb8ImCo97P17J3WHOryRdwguNeILzi1C5oRcPo/d3ebrezRo4Ohr
 BO/neCfFRVBEBMcFwVUvoKs9FCSbcQYpnby3s9vW60jo1k9lUgG1dDDSjYf8/+64hC6AdOjGQAi
 lLp6785TgJNQTft4Kce4S22nirnbdxzRl9/GhXwczxNk/TCxRM8S0D2ia70i1O1QUroMl43Brpw
 Lmo1kdTKVWddM2J5IO/XojMp0aORILbXWX8gFXE6sfgT4DpFDwRfEde2q8YiYU66TOSV4gSVfmR
 aFSYIz0vc/gwcNVQXn/Yld2O+lKxW5+IBCpKvfPg/KAYyY6AbCtsnk8VaVw4bxHe4nXhhuE8qGS
 cFdUuviKSBdY2rfyFdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX9N02FKGxWMHA
 AScjQvtKyAqkBkocoxzrFKBueaBYoyabpMWjVxs/Nc5g3kq5ntCqDwxWgbOlWF44FmP+G4YeQcO
 BAd6uZqicJdBHsaXo1bYJMnHVwdYe+0=
X-Proofpoint-GUID: Tz-qXPw2bIpC5TxQm4UAPEw8W3GMW8RQ
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b046d1d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GBRnKKbz5W7R9ATGUUsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver.

On QCM2290 the mode manager additionally ignores the enable unless the
TCSR register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
the same before it enables the EUD, and the register is written through
the same secure IO service.

Add the compatible and a "qcom,tcsr-reg" property that points to that
register in the TCSR syscon. It is required on QCM2290 and not allowed
on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..bea03468a499 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
@@ -29,6 +30,17 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the TCSR syscon
+          - description: offset of the register that has to be set before
+              the mode manager accepts the enable
+    description:
+      TCSR register that gates the EUD enable. It is written through the
+      secure world, like the mode manager register.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
@@ -50,6 +62,19 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      required:
+        - qcom,tcsr-reg
+    else:
+      properties:
+        qcom,tcsr-reg: false
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

