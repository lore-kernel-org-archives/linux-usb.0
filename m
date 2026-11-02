Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618273;
	b=xfG9oU8AqqHaU5HOCfUcawGl/ni/1RbRXaXpj3/9oHtgbVL2s/ES2BN4rvpodHwxlowL
	 d8M0DV3mYBfDnNEdwV2JHmdKm3aBG6B3MWWGgTB0OtXFcWJTTZp3w+/L6nDLMmRu/2O8W
	 acrHVutbg7YTokwWekyvHbJEcxuakTeofLinWkShC0QSmXqR0GrhGmG4h20GfOAttysKa
	 CWnqkQO0a57kaCqYAJuFqP9/lSRF3Rm/wjGCx7O/1yk78TKE6SpC+/7jli8XjAUbW56bW
	 wk82WEIT3PIVYGfsxuE+FyMJQbUaSXVkH4oeBTsiy+tuZ30HtkJ0HLsL6EbCK34Bqzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
	b=dhYZ53HHC7OOZHHO9qw72AWwipJ6XjC7HzZxZxn/7U9cf84lv4KqZ1wXJzLuLe0jCmBS
	 ecQAM5cHdZObQqln/LvmTUri0zpdURskVh2j+xD5jiFJdUzAPpl7FJSNAlkoLRylrutYf
	 Th6HKDhLwuF9Own4599ua3dESbjN3aI8DS5jikRj4yHoz5q21J+IuFVahLDL3db8I4OeJ
	 Nlfy3bzVirLse+Mim65kDbzmgWDWFiTDpHikpQ+DVCXb2dI+KHoH5lbiI2VRYnJzzhAEY
	 zN37vsJVS1b+O1Si7HmssL8THFlci6Wlz53++H0Nazrhh2RB1pxpWAYI/ZRhMLpw6jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPpSuRlX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkdvSISR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97122606A32C
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 11:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97122606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPpSuRlX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkdvSISR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3xK3402983
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 11:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kA7vRuxICWw
	iYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=; b=NPpSuRlXxddOHdI7fttzpZFA9fe
	0M51XwzH1AcMfO9hmt5MFhtqTPjan6HaTaVSykGgZcf8M/3yQeh8WlakFtxhgxtm
	wdzET/aRt/8a4s6AbL6fpQ7sJOJcZw1PBPHpJ5iWkquM8I/7TgvBJ7RH5OpO2uCI
	8MPTErBhYHK1bb8si9IL7K+//Ue/u37N9a2yIGxIh0ggtT+fU8K0K4w1n2R2DIG9
	ahJnUCdDbpP3JQ8IjBNCKNCCmZLHoOCNhIWE331T6tufhZ1ECFbZLhD4Uha84BVX
	Eyt4eC9SROAP8w7PteKHx4J7hyFmhKIaJU0okcLC250xCUpRjXVZj4WmWvg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8tw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 11:17:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5741655eec.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618271; x=1794223071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=kkdvSISRCasBYcLoKVAjp5C2F11QyxqaQbGsZNXHUMpiFFKSMnYwryD1l3obVSwife
         pkQsbM5zS4rzO34p354OUmnwueyadMxHCF/6b+EdnM8Pe+RyBEySFnstqPRh3NozFKmf
         zp1lT2Q2X+jz9eJlt8LhpvmBlSE7/mnnzhGVBUUTlYWRz09jcY3Zf2qZEJ71XcAF7Y/e
         xLaVtAc3El76XSLVMF9LWg5QKFA4+3r4PPaiykuuTHNh4azYLUbB66OYNbBB+rrAtckV
         BCbalAEUiyzKLTgH632NA325fSJSaqWCf1mLIejL3skI5KBdfghizsnIcxptFAtcaWMV
         tKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618271; x=1794223071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=PIc38/zkz233z9GS89qnkLC8PysfdU9J4/P1smEv3jfPtq6VMmJ+a8PsAPnGgG0JSc
         MutTGw6ift0zFF4XQplJRur8FXW+BBIkx5UvTMrNA8I+GGSekzcPE5xFzR1cIcA7xaZ7
         x80YwKe/zFDHV25/evOhynL0SZXZz6K4xJp/O2fp/1WpM6eM8YukuEGJvzQmXHZChj70
         MaSV5whyBcNh8o9hjS7j9vV9qmCdDiNZ7qVNvKFF9D8ZhLOBU6+Ezj9Pe1PgbklQW7oB
         wWG6BiOS24BK4SXc3wQsm9ygMz09CLa6P1FyMaEnayV7g0RhfyhhdimF6xDlvM/71v6/
         0Xkw==
X-Forwarded-Encrypted: i=1; AKwUvBzG+gRdCIMk8gjj26i5NiEUWZU3WO/nvKddCDwq30Ha5/ZLo+t6KSEBXFJsCn2B46HdfzAxB5qyJw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XmqX/hylkNL7lrzQ+37+2rJBPzuJuPtWM9Xs2P70mMn4ZM/A4
	CP4ryAaqQXeYcR/b4hOfEqP8KkJeCCeOSpIOWiah9F0NGl4glq9JClXlUZ4hlt+CCfIIthe5yDO
	4JVtE5iPw34Q6okFFw1LHXFlzV1fdf6n9w8i8PvPSqNYz/EoqjdYT58E5TdqFxIE=
X-Gm-Gg: AYBFou0dGePXR8QUFgaxYUCG6vC4yZiPjZ46tY8LMUSMNiMhUXH8VdCzb8yNvi4pBd6
	J6Yx+LHp2P1kXgMH4gq+ideBx6/+yOKXAy2hw54+3pW5RFCLmnOWsiZOpAGUqtzzDnPlBOhy2oW
	8bidLQwpTvSOdMdnDVmvaJrJ2Bpg6Yqg9xlqkQCJLvy1nRu63Ov1s3mY2pJg8fTwefWO6UpEjCa
	vN3wDg30DxDXd0diNIN5jcdkpV6qGi0JDH+cSmG0L9zD4K9XjnficLlNpNmKdnwcSf1nNzrTiOP
	FA1daz7pVBHhKAUdJa+G9+rwIyJ94JFKBhU9pcAsSPXmqjkBKynG9n33HJ1A6xkpGRwMDGKCdYk
	YOvSh/yDSEAWbdJ8q2YYB5/ofXLefEm9vmdd+epa1425xVvmgJ2d9By9p5pNGTFq5ky+cbmUQaF
	eD2v46QtYKHLmC7IjqWpf0hoag9ZzJr8KB
X-Received: by 2002:a05:7300:4f24:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a422224d1mr13572825eec.2.1793618271172;
        Mon, 02 Nov 2026 03:17:51 -0800 (PST)
X-Received: by 2002:a05:7300:4f24:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a422224d1mr13572778eec.2.1793618270533;
        Mon, 02 Nov 2026 03:17:50 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm16492078eec.17.2026.11.02.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:17:50 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Mon,  2 Nov 2026 19:17:30 +0800
Message-ID: <20261102111732.1678646-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
References: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8715f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX43oMt8vYklMv
 b+wHTND+Da5xhx+fImZ51uq4me8nEfWOc4SWbDeKVQAR7pXdp4qqrxMdzZ+nXEiXqGjzyaXH0jl
 n8tHkPtbid8lOtkpcYp2yqvVbloI9I12mcRsZNADw2qug36+yJmEYDZKwlY/2qp4LGDufSF94al
 GwO0HuyYzo1QrkwpE6SdNKSOYouoa4x1P5Rak/cvs67resWXzPGeyBAdS3yAaEzWOBR6Z6M0bMM
 AB3q3pgjmaB+ySIUJt3Be/ENXUJIb1qyWxMjnsmUHwn7gSfkB8sRGqFuDwz9xyip2cIsfZ9vF6R
 CFM5hOmM8doeVe8jDRjo6NAjU5No3A2+XHMPQOutUnl58cMYP5I55mfj+XbL1le/ngFpdLdMGZL
 WLIpQCn3WN1vihqAJpQ6qJue24G1LS9oAUxcadcA4JHu1N0hDSlFqvk86yxXLbM7Uihvnm3v7+m
 vUrEfS1Gl2a0KWMMk7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX9Jf6905kNT+Z
 8DT4w6EOtDgdiWHgbzRZVpIV/mFWhOKGp7PKHy2lm0d2QTuSrZfd4y11cvxtiaiw4UuLJHA0dri
 Zt4HyH46pm449UWGg4fIJ48tCcdgRtM=
X-Proofpoint-ORIG-GUID: XpCRC2EqqeCFBeDioUk7R-mkTJMyzTi7
X-Proofpoint-GUID: XpCRC2EqqeCFBeDioUk7R-mkTJMyzTi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/usb/onnn,fusb15201.yaml          | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml

diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
new file mode 100644
index 000000000000..09f2e964d3ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onnn,fusb15201.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi FUSB15201 dual-port Type-C and Power Delivery controller
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
+  controller. It runs the Type-C state machine and the Power Delivery policy
+  engine on an integrated microcontroller, so the host is not involved in
+  Power Delivery messaging. Over I2C it reports the attach state, CC
+  orientation, data and power roles, faults and the VBUS voltage of each of
+  its two ports, and accepts commands to initiate data and power role swaps.
+
+  The two ports are described as connector child nodes, addressed 0 for port A
+  and 1 for port B. A board that wires up only one of the two ports describes
+  only the corresponding connector.
+
+properties:
+  compatible:
+    const: onnn,fusb15201
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line shared by both ports, driven by the I2C_INT pin. The pin
+      is active low and stays asserted until every pending interrupt has been
+      cleared, so it has to be described as level triggered.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      reg:
+        maximum: 1
+        description:
+          0 for port A, 1 for port B.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required: [connector@0]
+  - required: [connector@1]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@50 {
+            compatible = "onnn,fusb15201";
+            reg = <0x50>;
+            interrupts-extended = <&pmic_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C0";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C1";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

