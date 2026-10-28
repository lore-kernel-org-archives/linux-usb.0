Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213998;
	b=zh6wVUCFaJ0h9eS4J0lcfjPl64fs7Am85QHzziWOQyncbgzjJhDY6pUkmUfAzimrM04m
	 pSvLEfkxxa85dxYlGber9wrxnmgHoCODVUeo8u3u5V3ZCRP2AIRM0BioPjniC9S0V9U3p
	 PKmkoQ5zkChWHTTA4LAj05G7uZBbNYYX2LalI2I6KyhYlSIJOiA5geEJa2bXJl2IQkba2
	 1PhlbRHp2igSK/CtxNCypWDJg3nfYhwV9X+JvF2WesynD8CgKUCUbuMwAYm4K3T+dLAAd
	 /HyruU1n7yaDsjfOZcApvDcqDVYgDeYmNgkdQn16MlnZYeohKurOGJBddw9MaY6r9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
	b=H5E6hr/uOGddzHtn+CC1Z3zZXgpEKeIFtVliYkXlWfDcVhYjn5d5tJxARSTd1JTN/q0U
	 fnvdywk50HIe+W8ccKec0F0VmMF0kYQXwcEujksMrljohOcpjlySwjMJtNdv17qu457uq
	 Biox0htmB7mKggnjDHHB6/VpjFVhc1g03wHq/lz5xI9xN5L61UmlUpdW6Hbxousi+savN
	 NMjhjPQIOERhu8+opqmq+O+ypjVbdewHUXaWUym+M1q4g8vlIOc1LklWOYooDynqVQSDE
	 eADgfrBtN401hvjrZ+BGNFRQRM4HD8Ea5VKukIKsV3Dx94uR1FSoCbM/0T1OCAwsE/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ep/MW92A";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/A82y9b";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB88606A336
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB88606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ep/MW92A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/A82y9b
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPqfh1395684
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kz1wdYhqxOh
	UGYZF5lOTha66reQmCoEbGUOxnWTSoQM=; b=ep/MW92AMSe70dcCsvjJGLIy8P8
	hERNk/Gp0UUP/A2xMSGQrwIcWj7Qi5eBb5vRgaIMQhAiToPri8NiEBYSfr+POUPn
	A2mj1UfuRSjnDJfn8aDsMD7a7nOezhJP6pZOcxjhmOn78iEWbBYCheNG1QxNO4v1
	0FL3f/sFdKTSwAYeI/t4HZtptRyqdPMjyfJikN9WzOnJoNqs2wwLBGgWLufd8LLW
	AnHxH3QQM4JmR7GLQCC+4bDLD7iRKPh6RIDOtam7ZvRG+COuQn7puNg9b2O4H8tG
	oOQnP+wzwhpgIoZ+8wrtPy+jRUmsacpJU+BObyJeXGspjdsTnBjgIKmIdcA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjhhrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so1764051eec.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 11:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213996; x=1793818796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=A/A82y9bamf9FAiiSiQPeluhOlU89xBTAs0e+JNXIjozNluzNO7YX1nNdsRROWEJMN
         W+anD+DXft7e34tQa+4ddc+YN/8wyGryj5T9gtmO8fJ4zQm5+xNOp7Xe6E7YLbYKUUHr
         qDeyxnnsk6I4T1l9qtIyeRdhjGt4w0mwtQLXqI+NMcZ/DoIdVxFgsUYV4GwRTvTBT+Qu
         VNLtQyY4N/AcpR9KgpDecfsfuqxCz3RblAZxuffcKnINO5sgQ3zOLFbQUQHfZABMpsmD
         OLSVsFBjY8+h7wilDyzjRc2aERI7FCwUaW8jIWCpDflHIm/QXZeEKpUydU+C1c9AO5bD
         EdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213996; x=1793818796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=UAE1FGHedrmX16kEHDwNUXZKA3BY0AVUJsHQGvjBCAbEFF7K23NI3Ye5pFvIw64kLU
         KdoSPARr6Q+aZ/bBjSMC8O2R6XdfaOELfV7a18UmCVzkMAs5J+XjQyxX4HLb4XPjpnmH
         LcwXpESp4cgV/p4j4LJdiDuVHLtjpanfDvMK1bSgBdakGWFsmOvZcy0ZvR0R+TekgHC6
         o1AKKT309qs0qEXPUG+VIWZIBQy3SO2gi0Hir+XG9tYASS2hDeCzpdBlO6NnuKXSuDPA
         23GDL0wfIWK7YbWQdvfKG36eQ8CBiEgSguWAx3hpP3yjN61yUOZ8xwrzndpuviZNysui
         sa1Q==
X-Gm-Message-State: AFq9FYKkXaiX/U08awLCcfPugO1TLZKVJ+tvYWBs4PV/5WGDhWtjMaIU
	dFAEUhHWbWdjnDZpcuQSfy22JxIP4rNgzg1bz95whP4BcyGnAo1yQ3ZFXGjYZ7cAbQS8/Vhq0eW
	WY9O3FIU9+4ZRtymr/Zqrf4NcRzqQjqS/s8fRjlqhKFwG4GRkjfYRwtFfosq3lKO2KgK8PLQ=
X-Gm-Gg: AYBFou1eCs0pcurERgusHFzB9rJ674J67JTjNhUpAz2FjkG0LUNpUGMRScmSQepNWN/
	kwAJKQIPevqt/mtDSPbTpNW1Yr+owU/u8vPI4jHpizo4sdG173kcTXesKv/uFs2JD7d4zsGOPMq
	LbHIj5gt4RT0H8LoCVTCn3UJjOvP1/C8Ll0I8cf4MNSAZc8mo9WfeHXEEB2LQeJlAHrtTYVWSTQ
	MPPWX/ivBP6CA/S5b1dBTUldZ6rxR9DS9t6Y2WzZrxmjSKv+gEwRiX0dP7Ti6ACjgxtH8w4KY1x
	bFvoU4bSF4qOGeF01KaxZueRlcV4mUDl4+oDdaKEW1igGNMv0Klk+5OYSxwNE/nlxYQdQveo4Ik
	/SaAsZY3w0LgkQ9wLrhi3yVJBai3GdeMuVIoNM/hnxi/pPAKuyJkO4saBy3a5YOWP24J8BtDOBd
	PiVhwx8A==
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976370eec.18.1793213996255;
        Wed, 28 Oct 2026 11:59:56 -0700 (PDT)
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976333eec.18.1793213995448;
        Wed, 28 Oct 2026 11:59:55 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:54 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Thu, 29 Oct 2026 00:29:33 +0530
Message-Id: <3d056785e2168de7fdc238d274d3d993e0f52464.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXzrBAxZ+ww9kD
 vVcFBKSiqyX9K7b/U0FV/vNR5admAzPbM5za9wAm/Nv1Jnzo4HDqWgXYD2ZXdKVWNv0csp/JKhc
 wLkAb5Jp5aGJEihfc7LXVB9cN6DCeJd3xcnKsmHFaF+VJLYb5T9NxiWzG6Mg9WLWc6AZy0rPNGh
 iWVIK5/lMMX+kEnGOnDAwjr968+UfZ7o1KP0yRZO8ODsBtX8SCtaRpqv68BB75vGt6VPQFNCGDn
 DJfYjKWFS5nuvZOE/d3TK9LGiNcxpJoxdP0o1qDake1HYwEu4hBH/XPtOlQpSgBIMNWE5ZH4964
 jP8xHguJxxCVl478MPz1WWQ6w+ik3XcHHJraEYpKXDyPEUyKqTby4+MMtkBXoJftz1KKfu4Erqx
 eSRwBSknXDSw9mavB1MNxR2FpRUnpy5QXBpebbY8tdzPn1tydmP26LwpN3UKO7/O9U+fFiROW/R
 dewa1vDYidn9KZnn4Qg==
X-Proofpoint-GUID: FhNTqhNu9-x80PJVeJazHqw5SKcDZSc0
X-Proofpoint-ORIG-GUID: FhNTqhNu9-x80PJVeJazHqw5SKcDZSc0
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2462d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX2yryoUFXWH3T
 UeP/731RnTh9rscLuhbjqtmrHQitsGqHiHtYQh/nfkr2BF8ZiyyaQmCbnrnXIwK6miJo2rN+I+E
 Yyn7zkcBJ/YE5rxsLNl0GUp+lF+FiM8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnects, resets, regulators and GDSC are abstracted and managed
collectively by firmware.

Add a new binding file for firmware-managed USB controllers where
access to these resources is exposed as two power domains:
- Power domain: Controls power supply (GDSC) to the USB controller
- Bus domain: Controls clocks and interconnects for data transfer

The binding makes power-domains and power-domain-names properties mandatory
for firmware-managed platforms. Clocks and interconnects are managed by
firmware through these power domains and are therefore not described.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
new file mode 100644
index 000000000000..50361fe97c7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
+
+maintainers:
+  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
+  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
+
+description:
+  USB controller on Qualcomm SA8255P automotive SoC where platform resources
+  such as clocks, interconnects, resets, regulators and the GDSC are
+  abstracted and managed collectively by firmware through SCMI (System
+  Control and Management Interface).
+
+  Access to these firmware-managed resources is exposed as two power
+  domains, one gating the power supply (GDSC) to the controller, and one
+  gating the clocks and interconnects used for data transfer.
+  Both are SCMI power domains that are only switched on and off, and
+  neither carries performance levels.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    items:
+      - const: dwc_usb3
+      - const: pwr_event
+      - const: hs_phy_irq
+      - const: dp_hs_phy_irq
+      - const: dm_hs_phy_irq
+      - const: ss_phy_irq
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@a800000 {
+        compatible = "qcom,sa8255p-dwc3";
+        reg = <0x0a800000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dwc_usb3",
+                          "pwr_event",
+                          "hs_phy_irq",
+                          "dp_hs_phy_irq",
+                          "dm_hs_phy_irq",
+                          "ss_phy_irq";
+
+        power-domains = <&scmi_pd 1>, <&scmi_pd 2>;
+        power-domain-names = "power", "bus";
+        resets = <&scmi_rst 0>;
+
+        iommus = <&apps_smmu 0x0a0 0x0>;
+        phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+        phy-names = "usb2-phy", "usb3-phy";
+    };
+...
-- 
2.34.1

