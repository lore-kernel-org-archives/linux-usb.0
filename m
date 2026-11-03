Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679510;
	b=WH43DkWSzUn1qVc+L6g7/rgMRllUSOde3QOzal7ZKmbzbwiyE7e+f9faQ4Lcz/ULFFgI
	 C66yj47KgD3ll1BwOq2+UZHFXwEGLxnlMDKfE24PEAniQwUH0axp9qNrUIelo78nLN06V
	 4PcrxagwVQ/6BotE9eQFx8ejkJ0lktM2nkvpaG5gSD3vCkX6eCeS2IgRkPsMWWtRiraWy
	 Ui1EKErFfKrpL8RfteOlQUJNViUIa5+oTBRjb83xjbDT0IOYUUKG48rUPRX4kwxYpLYNY
	 fqQ0ZoZ8Dxxz7tkRAxETDhkUpC1O7oVWBz7RHzmfqMn+to6rhc8E/BQFNU4vDMnuQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
	b=Ghh9gKzBWyaxRLbCNiaQpPwDBTOkaX1r6S7v33/KtoQkZN1GCHXMJAUtCxBEltTeCvIy
	 y/IFPZXHFA5uJnle2nfZCZYRI9VtwekHQ1jZ2nwXwQDCCUQik9N+ybT6XtFUyA74VMPnx
	 4Ki9Rtvv5C7/f3RRnCdKTIWdbXycD9/TOx8hHJOgkSiNk5pjAK8Z+vMDgLejj8jEt1gGG
	 Var9N+ivBs70+pG1oKx6ObyVYZVU9DyujzvyCZCLiDoqKoRT2klsEr42tHX5Y6IoDkqFj
	 u3r7E3IlDawybg+HUFplxhhVhYmNcKWfev2dAl/4GAdX9IeE+ewYh1LQytEBmvjqyCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F0606A33E
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 04:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78F0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eKq8470772
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 04:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kA7vRuxICWw
	iYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=; b=gL1FLBrJsYgHsyZl2GKn2DigmGW
	r2OpLEPVUWDvF3Zg9yWSSqjvV0KVLjsocQCl9suKn2683H3Y0UCEIfitjhMKUZPG
	1Xy3zILY4bbvcWZBsM/JkDSlySrakWs6gVeCCwWs/7uPfGgUUs6TbjmVY2TxnZtK
	h68rNPyL0eLhejZZHFGguDB/114I6XyIYhSI4jvCto2w/TtEtR6btydhSHZwOPd6
	F3iKS0zdwja06+vhMdwAphVWpTZGSOE4u08C0KSyZHHZ9tc+a9ugd+LqpupPQBtZ
	JbqNc2EQnPmD6mAy5TDNIIp8+jIp9ToFuINcID/LT+ie6DULeiCo6E5WcSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081suh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 04:18:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so15950279eec.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 20:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679508; x=1794284308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=clvyGhB5TprZZJsZiH+tr+NjrDlQgpCUwuRCPtEr4uCWtl8HMZdhKCMTVyzOy3sgK8
         klpOaNkFhtU2VztLA9I1XeNFvGH0ie0lI69BE3tUKw5miVX/BCePu4M5fupis7BfwI0f
         T0YXI5YeXjZ59+/Ul2sPSxy1p2rpm5hYh4oQ9lJq0OXp20Lv4HRdpwVSTECYOdxl56QO
         bARujjDPFsqSHXZ6KLoyGxBi44NyeQ3eCmgKKkVnkOry1lLboir6fuwx1koaZf8NV1RU
         SY2uzcu8CCfYwy7uE3c3shOKVOAcgwU7hC3sG8LK9PjkgE9vvFjOhdM2MmAmeoRcMxa2
         P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679508; x=1794284308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=UT4YTLEl1AgDDEpnCx3fCzy0bD88OVHAcRFg8BCX4Guz6KT1gFftOgnsA6YEbIEmXE
         v4EzAe6gHjR+t+wQYrui0jvxuvy3AulIvRkFvYRow8BjNLmR6aTdZGm7Ft/hLkL7yvgP
         klBXPFuBaNJl85nNLxD28cz4kU3MY1DeFGS95FHsqW9IUGbD04tWq9K1xCrpcihGd71O
         ZYSLf26/NmkBOQGZsYNjmGc+ampHZT/ebE65AqrJwUoGn6YNanVwM+zabzBhy1RQ8iRf
         AWe82Y1WlcY538w5l3MdHhsgFeCjZrCh+O7GPBCrXWrhoYBnPkaI35EPf39cWJc2I5jk
         GS8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZYSouYaKJoVTdVBEgjttM4IJORZqujxZSSGqqVq4QNtlT68m3TFbBKUfa+O39HhrUvjYdZrskkrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEw7qy6G2lc2x3We+5QTjYy3jNNGmwaiJ0zPNvQcpOKSxdx8d0
	K0cFmnfE/goBLn9y7vLZf+59RWaNCN9CdDhjdUCoHyh7jpOueSyI5zxBWQ/Cf0RTnoF03A06HCc
	ZSJmAryCA/kK0GyJQVAe60SysgrrdjD8KH4NGT293KDKwKkXdd+W+PUuFYQKZTFc=
X-Gm-Gg: AYBFou2rrxEDySzuEaIeZbaBb9nqtJ+GcRJskrN230kVceq45tmaB55l4ZgDb6OPkQJ
	pUqSaGSkSfi7JYgnR+gXBrayxVeod1ptNK5Z6Vg32u4tMDa25jkEa/t57j0aX8suCAqEj8wcWTw
	WPGU1xF/8jismBMbvoxQV5aOsD8cDk9UZMlk01JI9BdWCfA+LEAsClJJUj3p+ChmP0gdA0MhbkJ
	OAsihiXVVAGNPmkGmENdDK8pmy5cfRTCOUys0lJ0EQ0TddR4UIs1pUF0ML6EvoR7VVMAFr0YheF
	HwliCiPPY2UIHgx4lwiJqXzsal4HLqZUounf5/usdqgWlcU9hX3xRiazyOxQHN36+A8Byz1AOO8
	dXziFH1yRW+O8dNVlpNGZTGqiZkOLYTlyrC8HffiWRTmq6ePrycE0jK5wDedredIhEmSC9JZn3z
	xqVgo6G+Ht7kgcyUTar4BKCIW1Kn9ifS6e
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594669c88.38.1793679508275;
        Mon, 02 Nov 2026 20:18:28 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594623c88.38.1793679507479;
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Tue,  3 Nov 2026 12:18:05 +0800
Message-ID: <20261103041806.1885974-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX/uAjI9tY0APa
 R6ISZueax4QZFYlVx2nmxke2C4tPCQq2p7Gxn/dJfZgb5Wo91jU0ZYk/I3NQnE2Ew67RnAtIWUh
 mE8TgmAYdEUGB/VHF0/FbU6MfGbZLXk=
X-Proofpoint-ORIG-GUID: CSw17YsxwwAHD80KoPvbyLR02r68RZkh
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae96095 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: CSw17YsxwwAHD80KoPvbyLR02r68RZkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX+ito+aL053RN
 cynMbxyTTVs2TaAUAwYnK8J5pI6zRuHwWDMsKVWH+eLIM/xax7JUyd8vbdyX89QpGdzMcleKNme
 UY2vUX3x2ZqisxZ7VG2LBmLhQwPSnpqY9e8Jb7iG952tiGMTKMAeCQy44oVmyE5Oa8zPBuT0GVx
 gsMM1/GjFdfm4fagcX+mahTHstlyQg0O5vcgtb81zw0FXcmhcuXAql6CN5R76t/PF/TA2UGz8yE
 JrXFBkVLIA0nj0n4KJGv487prLa1/YRywmGM2YYYPSxiCMaqDMEZXI4MZgiOqEnPt71yyvzxGLA
 OW78uoCwcKEh3gwCJiAI7Pj12H333zx7UQ4bFPSIPAWoFmqigkj43FojSkaK/FntGUwNTO+yYfd
 pq0n/e+7bMP78RfMlqTa3pd+Nf/ds+aRC1yudqG+45/NEx3zs83Gu3fuJPXMfj/N7ZB98n+iQ8v
 JWEGxIla0n7hDkLUHUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030016

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

