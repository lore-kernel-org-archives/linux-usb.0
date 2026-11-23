Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430884;
	b=BsVvpsOPsxqCvJL/i7VPk826v4soxmJ+hZLxS3jpnpbEqYXw3D9l/1U3nyjN2qY/c5PW
	 I+P8plIlElJHzlWka4cyAvnhn78yn7bwe4eKBeTPL9H95q47I3JWOM7mLbyW5UWJQpm78
	 SEJO1b72I4G64+6RMHmJ1MkdUGCkNIia4oqP+BjZxwbhUa+C92VKSWUWAFCdbzWkshi3R
	 tU4qrC4nM5+jtm8WIL2qO48PkUZj0zlxvVnzgQ3G7uUqqtmOdQWe+Hr5QWmGnlfMPqhw0
	 9ttPrYxpwJbcVO/g+fuetjbzqoDf3UmVqRwdzoyVF9JpiPM3e02czOPOx/MqjjN2GFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
	b=WO58JCKriLURBUJ60Ig9zQnNDbjzE8DjLifn5pCL03/b54R4TorbQRnQ8cipN8LztKar
	 eaiINbC9ZoL/MdNrDAUUfF0oWD7jhjw4T9aYoeB5o/qX7hGI9eM0AB1NmRha0LgWbm0Cj
	 Eex5qyHO3f/rnOdtiklK15JO309kTjY4Yw1mjolUK1CkaReIdNsqs69OoG+4NUQfpnK9d
	 MebseBs8pstA8jGFt7ep5VBeYbBj/l0bBtAUVg11pxPmLQeotO9pYW4whUxWoWZD12gPS
	 cD356iHeyBZn5cPU80eDKx3o+o/8xPNcr4mrPl+0flgGNtlc2CbWZDVD72rw7HxDhdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT7cLukP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FiF/qUYe";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FA606A338
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1FA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT7cLukP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiF/qUYe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7Or4095721
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1hiszdcfzdC
	GUJyecppq+zRwkuNF1B1hD+vsd51JBCU=; b=KT7cLukPHNq3j+JRfLnm2/5LBKU
	Twe3coafXUjeVvnOpn5z3Wevt93cTaTFAWtqddIt0Ojx8ph6H4yD49dMwBvWFlkN
	UrwoUpyXO/4TzPSyCAo8Q1cVyI/lhPglEYTtkiVyx5j23cz+0PDz9Ovvfv1ws6dV
	OO0XoZ4dnaWwvehJOCHQBcE3r5p97nR28cDOIWi5oneNVZIA3EiKEu4+Gj+feEtN
	qVngorI2UY9Rk2JU45/K96r9rei87U8/mld1b/+8I1MbWhVoJ+WC4ZYRljiKfQEO
	ahlw+1HtpRP01j5nc3IAd83szfWs8piFogvJ0IOUfZGsxTxl96i+pER+g9Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7410js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:48:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so3012052b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430882; x=1796035682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
        b=FiF/qUYel/l57c2fwjXx9y0+GDO3L0nG9e5tNDAV37PK1OO1LsFtmOBGtNdRr9feik
         RoiaXPyvW8ymePGabd8WdQMimBlssZS8eSjBG57a8GEpd61Rke4UNFmsNp/08loE9yKw
         pMBEy8fCJNTeAQ32TEX0roYRqPBPn18+14wZkYhR7fqs8e/6HbOM/LTOWvDFB4I4ZORh
         RSJvEfN1Pr8V3y68B3mK4uNehwKCvPs20D5nNdeyOOTwdkdPR/r3bB+X9pAVN3B+4/AL
         ZUH0/z/31lPvnpekk/7vmBu7oJQm1RHl6lzbi+DH8iZLPkWL4YX4pl1MyLi3qhpFJJOM
         1R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430882; x=1796035682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
        b=yn7+7FBRxbAzC8uAETmv0Cq4Rv3RRyUawHUWOTgtQYnhfCOc6h08ztFpMCzHr7LRMi
         vjkur1riUrw6AVbV4yya8XwChLN5grlpCKa/VqlqzgaBaDhCV+jiK9DYJ+O3AfnDG09O
         JZ04HV8ZBtuKleGhBlcJEUwsC/4nigT5Gp6vn578sTn6iHrbpSHYLE/b21Hj6c/BEyWi
         bAdeNboAHDKxXCII7gE6VVP467rCCyCcHOh4fG24KYRmqPJowvHS//ClytRJfgdt22KK
         xzdszc+xAQg8TBTgeNb/aZBxI+pG3u5ca/VAmv0qNeTLO3fM0tGWQQJ1BrAvB98BrkG5
         xR5w==
X-Gm-Message-State: APuU4Z/vNekFC0RJBVCdUkPdZlovT0wLXxvRupijbqyQHirCStYKeKfw
	MN0H3bYDI/u44h8QB+74GKmvKfkXa4j3OGhLuvwc7/F6ngaaBK5OeCRdPEx50T4Pnn4d8mC0H8Z
	rd0NvTqLDRV3Ch0c+fr/0/0RW5BWMU4iHx8Af73r7Oy3GlP3ITT/hrhKZkR2r+KUSAY6fLxE=
X-Gm-Gg: AZFdTZeaJNkL7nzkqKZydvV/mjvSj64UQ2OtQRwJZ0T/SHF+bAqTyl+PH58lIdlh8YW
	rEWY4CHKL+J1JjtGphyJNfYo5YNTWPn2FUC1RMUXsa4nHqSB0h6gR2pdg0kz0q+O4Z+CY4Aw9cS
	eKWB9R2P9I2zad8giNbu5f6NSmMqvjxmanOY5D4y/ioROUTZjN2gxuvGJco/B0mQyATQXeErvau
	L2DHHcIoWt/xCJWEv5HvPjWe4qwy0Kc+dIsXPVSXcwjK98/6JEEwWMmA1iA4QfNQNvobOOWxIsT
	VQyw/N/pOaqqbNTJ1Me4PsypwGvH5oNgmLEYfBwPnnhXNGspE2jA6TRddAGfG9RVuTH5bYH8FOZ
	HwlZ3Cqr0fXaSfToUyiuoOKPp1tW1mrwVqba72OWgb9SAQq85rsLA3MwkfoAFQWGLMu7KlmSiLQ
	fsYpmYHA==
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8c87ca508damr9415771b3a.45.1795430881979;
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8c87ca508damr9415757b3a.45.1795430881475;
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 04/11] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Mon, 23 Nov 2026 16:17:19 +0530
Message-Id: <20261123104727.1539149-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: t3PbV61c7mj21ogZg-Ox5_sDMg1rGnu8
X-Proofpoint-ORIG-GUID: t3PbV61c7mj21ogZg-Ox5_sDMg1rGnu8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXw86I1AFHL/QS
 old4arQT2eK8vgV9tjfAWbgni4UXBou0RQo+gFQMibUIAxj+e61kbQv2pVVmwzXfVMCiie1eZet
 0mvHYQvGTvGCKQAidBhx5mZL1qp2NEM=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0419e3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX2sE0sOylcri/
 YT4d5Y7MunM2c/i9eQ//IdGHIYTGRmQcpCVUCilqmVHMtmEYAEx8zK74ivdsQ6LSbVunTydtyye
 cWADXby3xCF/7jvM04lG/ndVeUq/qvckuR6P5S3nwft4QmwIy1tu+DY1F/Dj7xxWcDYMRl+rprv
 7+QPCrhF8QH06OIJ0D8XlG106Vwn3/PYpzpVUomkUF5jcfwTU0RSGOwlBNPkvG/Pm8jQaOhVotF
 H2yDfwypTaetI626nu0vRPleVlonVEOvwgFIHeQXoYIVOBLqo6Lw8fBt1dHgRbSDd0wAo5PzH20
 PjPKR3WpawRNBju3dmJqVIz6JLBgJFLU3HesPH2hNFQj10nGnwhrxVKN9iFg19bn0WpFuJn0cVA
 p/7GhZqv4sBibUsLW0qyvFmAsI6obeMEvHaZBmVyh+anj6GNVV+H5o4rv72GNio24bvdngiozpQ
 vHb27wawBWLYcx269cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

