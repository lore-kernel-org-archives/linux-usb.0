Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6947D951
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484179; cv=none; b=LGhw1I2g6zLHzmfrMXzlYT+6U9xg8IPfdw19Lox1ol4B6Mm+jpPVJV1vQdwFNEtHX/Jy1vueNPzdP9wtY6Oh5faw3UhxWoyzfqTUruEfn9RjZqUazqyJhbNcIp3dBzIohl6AemBk33b7T6lt7Kzy36sziERcO6Rup52nptvZ3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484179; c=relaxed/simple;
	bh=vMN9xFS7+UE4CpC8JHmwvxMa/ZHXGxw+m0BPvf48J2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=syxJ7XRYMhwNLvST3G/ZAwW0WTyr/bU7ONZBeE2tmWY+Gz0pFi5O3/YL9Dkk4G4FIYfFgjPAhu4qKhGGvjKd5CzOy55wFf1n3orsnecZRPSyLq6mwawbMSeyw2bZfg37MNgeHSJsSjFN+LzFXxf3iONWSWS8kdWMN2Pv0jQBZ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEKvAmTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBh0TxS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEKvAmTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBh0TxS2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQDWE2159598
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y6Vl3S9Ln2Q
	++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=; b=FEKvAmTobjJytMmB9Le3k1W4Elq
	mYQ60EH8zAZ2jda057ej2RJlmJUo1xpeBIfcqb7sg9AdBjb/u+JG/xgTwLG6vchu
	V7sM73cb3NpdQPdZCaGZsMMCwt68EzL9X/0w6PwT5fwJzwN4GRGl7UMzaAhaDQgl
	HHaC5WLuzuB6d6uhu29k06K7lsMNyqmliAnJWBZL/0qU8QUBS6l05glBr9qc+87Q
	tFU+BHpNaRWmoHWMOcCJUOxXlyPLG81s4/OIO5+Rla2j2vrQpaeH12y0WNHPbW0I
	N99bMInffo2ffSpL5wX3OfczJWgLe9MK7ag2GI298+QQS6bPLuvOcmQBwIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049et67h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so5643755ad.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 14:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484174; x=1787088974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6Vl3S9Ln2Q++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=;
        b=EBh0TxS2Sx/akIIs9KeydtbJV8zhkFN7cuH68grGkGSW1hrg7UK0jcIZ4LWdcK4HpN
         tzyr8aVUSi0l3ywO7nNIIe2KRZVDB4y0Xw6W/pXg2b/oHsc95ShBPPDSjO0f87DIx2YI
         2cdvVIx2zhKmHleMErNfjPvsp0mcg8zYJNcDO0awdywAr6MI2rTZxRzuvDcEEMTNe0uU
         sh1zG0O/1qMqKan0VdN6LYykZPFIIq5KJNbV8zYorW1r6NIuhc4TJl4irKGJNUgO+G2R
         K8U7sLeR22gUxjru9n8piXgiwGAv9dxQ5GqA7MF8nkklRVe/9LMogslMv3cVJYqktueF
         3TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484174; x=1787088974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6Vl3S9Ln2Q++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=;
        b=N2Hzixh4WICuOuc8Gh2KqeTN2AL1ImDhcEt3veYo3JsWeee5xUSF2LUxbWriVuSyf1
         9J23g32Tboc3BveDEAoEFCVAGYbZp7mKmbGhdbRuQtwW0GLenEMy1O5Q7jiFqYSRrP55
         ZicaORwU+aRWqqND53zxwm+YYd0kG/IstKcrDyyr9HWNmINvPPxFHH/RN/ae0RHK2Py6
         7jsUewXJNMWKkfUG7NZWCFJdzeuLoFzVEVCkGYYq90YZCnnFi/dnIMuDEpvELOhb87vy
         nIZIgE+AUhD229AUFZnG4nSNcxpDUPRYt8zTTalapp5epR/e3g8s0XZguafqvdqK7MJu
         g8lQ==
X-Forwarded-Encrypted: i=1; AHgh+Roh29PtCpM3f8hbBcw8Rue09hSYii3KkJDSjb3qvBldrtiRG98aSJ07MZeXaZq7xBfSmcp5DdqbK60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYex54Wan9cm0u5lVuwYkubh0n/XqdsouGymEMHi6gTWe9xBn
	KeHIB5EXxKTQEmikM7/d/5HOW+/TKvlNljrf/UUg9z0UIRSXP1PFqMQvYQo8q+YFsYw3hRHYyiS
	46t0rr1XP+c+iYfn//UqQV0ZQfYDOS+2LTOkKn9959B0qhX4kXbb6rB36xhmFaog=
X-Gm-Gg: AR+sD12pBAfhSFsrN3xlGdq6cgmHMCa4ccArLICeFuhsCodJdgv0+X0yPOUbSReur0T
	5+rFb0EoncJYkywrU5qajjtyz29SF17+kcNtZ8ZgIgT42Aza555CqFns1LHYrr4y8tJ69QCMf2C
	hh7rRwc3jNpQe30io1LiMfvLh7OWNUCxoZwJCboscw5DbIzCJBQdNV4pu1gLqFsi+5dZNnsYdYv
	aEAfTDH4cq7D/kvQIh0+S+BMVkVQkFcjEWZ7HcJpmdppUEFTzig910ZY7/IkWsOOchxceOOe5MK
	Z34TrOscbI3cI8svnKxkPaYLx4EfBJlxnHeGjf7C8JBSyFCrS/PZZ0hcFoV/jSQwNCWSu8pKoe2
	Lcs6rljzLZ1gtfIwfStWv1Mw0nmQH88cLs5dobgOoTBKjLDD6qvECbQ==
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3cc2baf91c1mr9221725637.20.1786484173501;
        Tue, 11 Aug 2026 14:36:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3cc2baf91c1mr9221656637.20.1786484172935;
        Tue, 11 Aug 2026 14:36:12 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:12 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Tue, 11 Aug 2026 14:36:02 -0700
Message-Id: <20260811213610.2956147-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX06jDC6cQHWfo
 THaA/oszeslM8n14Cw1xDAqdS0t8QNJP+T2n+6CYCMsbl1oItnJ7X6ulaKq4XLN4+QQJqAQaFx3
 e/jj1wWeKiKlbI+35a2JHaYCoTjApkc=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b95d0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kV4M3lDgqtbltz7fOvkFlf57u-iQO6bJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX5bgnzO6n+Fz6
 vBxD3qeoK534YLyxo7KCwPf34a6PyZiTdLmTrMhqcZQ5/fpfAa1tBV9W/L9SLYm2Uah/dRZVbsI
 jiljqasyxFi4DuOeaC7BfLQ6/k9F2WR2xChfcsdY5wFJwVunAJwNiijxmBJXeIKBqaNCYl6ePnu
 plwxamAgp9261ZSH++CGNVRVSMYM5KC2tfHJmZRkP28e5AVwLVJ10dk8ggejd65kTarx0aWKq8J
 PCw6Uvl9sTbkNCVlBq8e0KcfuFW4w3gYNsBVAfQ9E51/yp/dL2BeoTLsXdFpeCpBuw+By5lyv3m
 uq3ytBDfulNT9+NTB4SqokeW5ehP5gWi0Oc3tkDfFg1LY2YwT/b28dGE/pq2x3w48txuBikFGW0
 nZMQW6bq2DGXpDVdj+3cCyKfEls7uaUZxN6SGkxWTGoT3XUnOuDEHHMzIGGZOHBchy2pnHKlqH7
 7bsHQSZ9/yzHVL4WwPA==
X-Proofpoint-GUID: kV4M3lDgqtbltz7fOvkFlf57u-iQO6bJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
EUD on the primary UTMI path only, while SM8350 supports EUD on both
primary and secondary UTMI paths.

Each UTMI path connects an independent USB controller/connector pair and
forms its own role-switch domain. EUD routes traffic based on USB role.
In device role the debug hub is inserted, while in host role it is
bypassed.

The existing binding models EUD using a flattened ports representation.
While sufficient for fixed device-role configurations, it cannot naturally
associate a controller, connector, and role switch with a specific
EUD-routable path. This is problematic for role-switch capable ports and
becomes more pronounced on SoCs with multiple paths. In such cases, each
path forms an independent role-switch domain and requires per-path role
awareness.

Model each UTMI path as a separate child node with its own OF graph. Add
an SM8350 compatible for dual-path EUD topologies while retaining the
legacy ports representation for backward compatibility.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 133 +++++++++++++++++-
 1 file changed, 132 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..0e35bc9a9d20 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,87 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD relays USB role-switch events for this path and
+          performs role-dependent UTMI routing accordingly. In device role,
+          the EUD hub is inserted into this path to enable debug
+          functionality. In host role, the EUD hub is bypassed and UTMI
+          traffic flows directly between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+oneOf:
+  - required:
+      - ports
+    properties:
+      eud-path@0: false
+      eud-path@1: false
+  - allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: qcom,sc7280-eud
+        then:
+          required:
+            - eud-path@0
+          properties:
+            eud-path@1: false
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: qcom,sm8350-eud
+        then:
+          required:
+            - eud-path@0
+            - eud-path@1
+    properties:
+      ports: false
 
 additionalProperties: false
 
@@ -77,3 +155,56 @@ examples:
             };
         };
     };
+  - |
+    eud@88e0000 {
+        compatible = "qcom,sm8350-eud", "qcom,eud";
+        reg = <0x88e0000 0x2000>,
+              <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            usb-role-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb0: endpoint {
+                        remote-endpoint = <&usb_1_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con0: endpoint {
+                        remote-endpoint = <&pmic_glink_hs_in>;
+                    };
+                };
+            };
+        };
+
+        eud-path@1 {
+            reg = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb1: endpoint {
+                        remote-endpoint = <&usb_2_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con1: endpoint {
+                        remote-endpoint = <&conn_2_hs_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

