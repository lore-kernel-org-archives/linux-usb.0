Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294B03254B0
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726940; cv=none; b=PhtoKv0ZFBF9mJdPkHo53vuXkL6Gvv2Br7dvI9meUxcLN/4u/V0q7OOJbH/F68z0JB8033DT0p2kTBWjXZalTSVw/315t0fiGwUrqFigvWwoQkxBu4YY5rpHiG+MovT029LagAkmsyAf7jteuVuoGKNEfZOOESH5PPmgv8dPw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726940; c=relaxed/simple;
	bh=Ms8xCSaOs/jykWnpXTey6hmewHvpI4F5jGwv7/LeqII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+iGCh5bbsQBuz5t8UR3oG/iMhe0EWzkbd8Bgr3Pwo/cHdVFe18pTgPkNaLpKZl9EM2xe2WxyzBdduTo74zqZDPWeMVRDixkk7zD9Qm7TzSD08T2v4kOkVrCZpSOis2x29zs2nNoBvG1Ato8ib2WlxcbPriuUipbFMVmVR2clsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMFxrHhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdPe/C21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMFxrHhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdPe/C21"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVxhd3960718
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 03:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yj9yTw9oRgk
	ITJCjIE93n/SQASuWUbkhzKAsAeSQGow=; b=CMFxrHhTxZ1G42ZEnq+Jnl6Fqa+
	LFg6koyCTJSQBcKGZ9kksVwzKBXqqFBq4fkYR0V5fHb0PzqVHehMgoPPwm1e5Y9l
	nZtrVlpGeBZOoSxCJ3USfHV4Vrpcb2BXM3iH2635tICPWLG5GA3p7/VcZ1zi6fL0
	uFYdMfysYMVf8a/XfylRqAay2Hv+HCQ7zbWssTpwoCveE4K66e+iIf3g1fkVVUri
	O0kUHpkSRhtUIAXFbqM0eveXN/7r7B9KdCJtudrgaTU+FrxEz7K1k8eBMgs7GCEu
	mT79P28eBxEKlGq010ckHKBqiOgvfT4pb3lBm8RcbtXQcDeFLHJ4YBxDgoA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fah2s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 03:15:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca860baea9fso7616688a12.2
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726938; x=1786331738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj9yTw9oRgkITJCjIE93n/SQASuWUbkhzKAsAeSQGow=;
        b=kdPe/C21AdDuXLtSzd9dkZeFCjXDJHxtxET+aq24JOg3m5hxqTCeFZ4oztNIlerPsP
         fRDIRRwjdWCqr89X4ESTZdea7TzpvhFbbVYYrNVQ3ezOePgHV9GyJACljwGB02puLXa8
         a6zEB65Qiv6wd39oKWfHavdsYQAURXH2ABn1tjyACSGUBLQY77WpYRPivcj43qsSbf6P
         LKy/o8sx1ssQQZDu9P/dfquf53T56Ym6uN3ALcThG8qBsvzuJ+nL1q6Yr34MEZZEfvR7
         BwTZ+5aS1njEqxqV718sd4pRTRjgo4CAlFiEQDiJcnKtNxju2YVxqFFqmoJwzKguQsen
         GbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726938; x=1786331738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yj9yTw9oRgkITJCjIE93n/SQASuWUbkhzKAsAeSQGow=;
        b=R390NA1+xFq8yIOjWBl4CH0q30jJVrarKfoZgs8fvXD15mc/m38SJiEzj4x2QLQEIo
         jgza4qO0aLLVQJpf76iQkmNHRAoSVgdn8UzvwzxSV8kxWyJPKuzmluz8aDcPUoyyhkYK
         bj3N2BhNzSJZ4ojhMbhw9IVm5PcocKM9Mt/q0XO+SAUjex8AG/1nAilI3CIxrHMbFRnz
         xofxdZkG8/mtZFVl48maAsKb5MioKdF+DwnKTbzifhUN5yJPy+Yn2Zcjv0tGjM7RjfAI
         S9CR6/r8N5wrA+V+Thj2PL9gSI5J+v5lRwOEMCstfFU8IGcwnr/qpKWFrE54Q7E03VA7
         qnGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJJucDpGyISrbuzX66/ga9kVJneJR3XovW2RO7kjf1iHZ+AcPEfTWD8V/tlt+VcGyoZcMz6Tt2taE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWokdHk+BGyPV1RQy/V52or+Q12wqK3ksgk6wlZmeVy/rsVapr
	HtmwvX4XGRMCebqF0JwQmZmxsdPeQUzMw2m06n9oGq4m6eva6MJzl8YQtvrWWASV+8yQefWR3jr
	7bKg8ZoVxwAXQ09REe799TdGL5agueHolEayFDKm2h9W9s2fFwaxtrs3J//M5PVYpyDce6Lo=
X-Gm-Gg: AR+sD13WkAXNQxHvmGptJfCe6xwVgp1JK0MV00IMuykb3jgPROPcdb4bouq8k0+PvFw
	/NBo+ClcKkyqfMccKkOJ+iFbiiUbQQaxxGA/KIgRn5WA9iBS75sHjhpHCP58BMYIfZe3rzYSPEI
	FejaaidXG0r5b40ziVZRgHigdqFCD/9fUOOa8skY4oaetMJqGi50+KG7PpocqDO+egQwxgtAuSD
	Y3sMyrkQ56oN7n7i6jZd0wQFrwvEQaGrpqQzxvMWZA/GSrj3B4bwnKW5QWF/xUzIvbPmbeNcxQP
	CIsxMz0lbcGs8ubLAuKcPgYwx9iD7W9HN19ceYGfmkDO95Vr7tQHhdex3CsjDbhYxNfkib00by6
	9ZtaiaQYD4P4offgO6a5/2FUu68bgyl/uJ6oYaRwY9aVIM42qUSNgIg==
X-Received: by 2002:a05:6a21:7a82:b0:3c3:9557:3b56 with SMTP id adf61e73a8af0-3c92a992c4bmr8639754637.72.1785726937674;
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a82:b0:3c3:9557:3b56 with SMTP id adf61e73a8af0-3c92a992c4bmr8639735637.72.1785726937285;
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Sun,  2 Aug 2026 20:15:26 -0700
Message-Id: <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7007da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: S29QPKYWF9np0eh208Vh5GEOzb5NxEdI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX23sX2MP1D0JK
 ptzKWcXic7U96msRLE+lYIk/8lBxaTbpZcH2HiCYVgENmPrUaxhppmwZwrV2UstXMP0zgX6b9Xn
 Eh88zN/JV4e6499HG3+z9ugRjQOiifY=
X-Proofpoint-ORIG-GUID: S29QPKYWF9np0eh208Vh5GEOzb5NxEdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX+hnfhuq9Wnwc
 NfmcW2dOpK6WnapfvRiF4tW8VvTtCsgvIciqtk5Zu13fEXPMEIRgyioBdlAX564iPaQ+oHTr16j
 Kzj3wLHIigSI1BPRLx+ybKZi3wFmg2nHMEn7bfmMNQ6wlm4yi2qIyGLzHr4G8CSt6Cvs3yGYSXc
 crspLhWCCVfGNR6rbVKsmMVXUD5pM5HctQ+4jru1KGksaEklY1IF8MnUKbz/Ii1DXv3mgfVMlnq
 mb/HTYgOlSpXqs+FWORcrESAGAa8ehGQt8EJRemsdCVffiTpIELqdIqtWT1ymjUgbK0PL40CNh2
 ntEKQ1MDYh2T8/k2EdSxjTlPXRORrky2w3sxA+Ju8SD3+y52O285tOg7JX7R4yO5Kb5KMgSF6iL
 dnFzMvWC5uMBRHkNy8rR/isyu0X4ISgcTiNhWwGI11wUAhyH9i/zGFiiW3rbWfSg3ohGjbOmYeo
 Nn32Zd457hVyaqPiPZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

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

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..6fef958487c8 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,82 @@ properties:
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
 
 additionalProperties: false
 
@@ -77,3 +150,56 @@ examples:
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

