Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670766;
	b=VUl/2wk2dp/oCBFJ9Zkuk2BvaKew2/kePDDSaCRxYOrQpkicRBtezGtf4uQihB2oSwXo
	 8tgl4de4YT8ySc8BPr05qDSK6l5BFEFUwzZXUrFY+yltDlZQWRjvgnr7b7oCLSRVJ/wZr
	 Z4B7Ts4hG1m9TZE4eXy4NsEKHWd9e2cUSlsCHBZB0Idjjp5k8iqKeE9uurlcWYBfmo5Mb
	 U/BnmafxGdxxb8hMviM3AJKzS1k2RcH1E3VjK2PxCq3J42cO7SHS4djt0qKyzW0mDdkXP
	 vLRN3vEwTnlf45XfP9Odj55+SrEkDQTtiZkojFV09fDDJ24FWXOcrSfxmX5nYTBXNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
	b=JlMseaGJQbVsrXypsabGfxcF8MrAvnqdy9IwFPJRCfc0ZUQ5XtYATQb9uetl4IJA+VZB
	 DLDDCjBI8wQDBxfqRMbQ0xJSB3nUkJRvoq74Z37FxowVAGBB8c2EM5n/6wfw7WMB6LviO
	 gu0cJVtO5JcBsXR1r/U/WJgTufMGlx7TjJtam0CpUF8j9YzQKlL20UeuKJiCo48k/Njpx
	 n3xWSh0YvHHynb3EXB5c0zO+IZw+KPxiTnnacBrKNvUkey41LeYwjmvXxeE6SucGHsmOV
	 nnb8hAXod97yGlFhtY3krXooOtG4COw2ia0wL03IBibqx9WrHcVWm91G+r0JVoEDRIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50A606A33F
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C50A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkRaK3630543
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=; b=NuW2YZq0Y41HQpkr
	fnC8EY82DmUdPIgA7mZsD1h9N263pSYE763MDan0BExrWxog84vFzN9yvWjUsc8k
	Neji8rVB1KxtF9iUH+WKDJAa+Ze4pV0fuShj2MNCiVemBhTHc5dsxO67snggvMNj
	hZB1lA83CYMfR/qhnXjhf8wSGEiE3LpZ6DTzoj76naB0z/qeZZy4cRGFJtq0LO51
	EAPivJ4y+rYbujXM8TirtH/WfdC3vgUJCGfWc1cNXE6DBl7JN2rcbqEo3JKxVBec
	VYJ/6rC97gjUlgQeMmnbf4PsmLJQn8tLQCMbi7t3a+L/JE7TiIIfUWaxCxNS5Oll
	mV7uTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw92ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so366321985a.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 07:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670764; x=1795275564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=igE00FZR5jgQO+U4ihtj1yJKqqcpVhs8pkpQd2X+yedPvNTGfi+BkfIoabjks2QuXc
         xYlApRqC7/V2fWUN+aXS87PfoYcTZn/vVbfmQiICc/kpZiiDcZos5YvnT7Li2HErIqSK
         UgdZAhcxbP31+g+WrAyn0zjDFAGQrYz7WJk1FysZJhPuaJil3dD+lsYcQIq/dvbFaNSH
         OKqASf9XZzlPObPRhm92u7h0GMQz3Z7I3RGcrjZUZPrLP4TDdkFkUsnyuJ4fpAbj+s6e
         Lac5G0rWR2XTx8DxcrAdy4ZyUIIcIdnC3vSZfL5wFzJPG8enMwFEl9gc3aNa53Aak7vc
         jOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670764; x=1795275564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=nWHjFlhO9lnjQNgo4WP5y1lX5vtNAjDhx6qr7Osii48wEb8uRQtzSN1Hfq6ToeMUYc
         EsALzUVnCqWjzJqsOCyoFy1ozuODl7oESBja5rJM1ole0pdpkybakQnuLd5F511aJjJg
         sB6iAsh5xxLXla3VkUUugtoLMwdtgdeNk5EIUtHU+XpmfOyIXfrlCPt2VFuE74K3A9gF
         giYgFGCj/tWRUquLr/5+LY1O0x1lbSZpqzdi3y2AqX4zGOzrkRDNflAg8zTFGFLKoTYf
         57eZMTnoxMPzxINOHt6TrtOAQ1+TMIcrcc1VQeTCtuOpemn8gk3oz3XD7rz+3qZ+vMah
         +3Dw==
X-Forwarded-Encrypted: i=1; AL+hErGwUhly81CT4hPDY8CuYNBVE6uD0RvtL/HDwtzDXUuR2i3kC4mgFxUANLidrL47kYXxQpznfkwGHu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r75jW+r8ePSAvqw8QGMFibWLtYTN8+uII1LW3RbiLzUwsFQgC
	wcqX7aZZKVGuWipZNAXSvEBcI4L+XZyQETf78cO8W+TiAIMGOsNToygtZ9BHxYo3BjytIZV4ruz
	tDDDefJtLnbNqy8FsouCNL7c2kNlct1WfnjLPOQLqu4RoMraDBSFhoRS+R6EGj08=
X-Gm-Gg: AYBFou0QwfrLCcwCqywWxzfTfr9B8hmk5OIwRL+UTEnoTt712+tI/GVd9Mq46zQlF3L
	054FcPsCZqAHdAdSfCd4DsZ8EmDjYSXTRB/yonjV6DiJJL3aFe/EmYO9Y1qkfPAW0ZIEuFhn+zv
	NVv80jALCWD6+iY9VEY7r9F3sYlAZmKtvc5mlv2Mq6qkse7y2RTYOrv9X7JgX+GJo/g5uoC23jI
	70cse9iOUhzNghH6XJK550ZbM2LsIPQUaGSJBVCdaL6YHnh5Grphha8CY2BAEHo69hXp7ybCv1o
	W00BCJFkyY/0D6fR+/oFo9W9Ai+mo0wUKZmI7SIrpcybDMeZYPQ+q427TnzuMYhd/t9Z35gBFEK
	tW6UEsCOuMlXEZclEsWOjyKEY711ANiYg7TyiUwZDvfn9+/1l2Ev6we9UrxO939hz81jNejwddo
	QZWGiWNWnGQqQO
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030874585a.59.1794670764573;
        Sat, 14 Nov 2026 07:39:24 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030869885a.59.1794670763980;
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:04 +0100
Subject: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX4EMcYcYfoJTf
 PyuPS6czOAkuRNYUXc01S1WhatH7U1izjJsPr2ehVaL5eQNpYhC7RzKTqF2SgbuijnZIYK/kzMt
 pQgHm857+m1O4pT8hxRPxIKrOmLSMWYh/FUoBVobYBlpewivS1xP7m8aYjY6IbfPtLZsAC4hkea
 iNlbrsT/kX9/AAVGLGz9VaL2c3PNzQ9Jk196FIIddK7tRWExBN2sHkfmn5KbO/U0WGYUepWZikg
 Xv5LcR6v0JmLGmOfyScQyWbCerIQBqmkC0jj290I8qIFSKNu5cYlkxJaW4UHS2ZSrDSv2Lza1lP
 SxDnpCD024+y6MktOtBMfshBlPk6GqHvGFKk2OG0yWSCDk/I+ZyNDuVmd7Vrt1PwYQ+7uwxKiUw
 bPzgB8Gxgy7AC5VVgU140gUtL9M8QoqgX37ioRg1vv4L3+7krtMiT5ZAhdZwBY4Z/6OB1QLXz1Q
 znEx52aJTzeJQS7jeMw==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af880ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=A5wwQmU0M-B_W0dhetIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MLfAXmXhZJQueBIe2f_beOIJpSOpS1GI
X-Proofpoint-ORIG-GUID: MLfAXmXhZJQueBIe2f_beOIJpSOpS1GI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX2rLHIihiF/Iz
 hweRv6D8pO9cRgEZqLAHbswgqq9dD0vV0EN+GtGmTNxOs2qsnoEZH/XO1u78qLYS+imgQqFZd7N
 U4TueAzqph115gReYPSbFddIGrP0wJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver. On QCM2290 the mode manager additionally ignores
the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
the boot firmware does the same before enabling the EUD, and the
register is written through the same secure IO service.

Add the compatible and describe that register as a third reg entry,
required on QCM2290 and not allowed on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..14503527cdf2 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,13 +17,17 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR register that has to be set before the mode
+          manager accepts the enable
 
   interrupts:
     description: EUD interrupt
@@ -50,6 +54,21 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      properties:
+        reg:
+          minItems: 3
+    else:
+      properties:
+        reg:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

