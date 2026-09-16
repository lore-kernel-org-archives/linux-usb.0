Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7324F7971
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567179; cv=none; b=fG0GUsotTNZ8FY7VWBoGZh20l3DdXwJ6uqF7++BerhyEJlDyPWslGnJ0Y5rrDQPajJZOqav3NmwbmWXJeB6DjxewkWcIkqZBl8Dc9X665MvOfZL/a0YbVQVMj1KUi5yVIoNT+rrtVCfGUQtNyPWAajI54qS6NdRSLl8dEMyDXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567179; c=relaxed/simple;
	bh=dNlCiFXswF1Fr7PLA3aiv3UeITCFkH2J/BpCPdFze04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuljuQVN6qTPzIeW0+f1y1SBslGfDC7MVpm0li+qAP0Tq82CUjXpE7i6yIja4exK6uQZGoDFAf3G/NnUa1j21Lk9YS7pE39UUjS+bknGGLLkyMiswcGa/W93y82BO75VZvRLEMeenBmmufJ4wDlIvk9BrHYWOKm8msz9CqkPhEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoLpqViQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCmhOkye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoLpqViQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCmhOkye"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDJhXd2283711
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vfNW1OxUfVz
	0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=; b=KoLpqViQzTDVmXK7KUjPZ6v9thN
	hraQ137W61/PyR9er7bjCnsUVaX1OOw4d5qoCw1CG7QEyrv4govplP+nwtc3jrrs
	2XEFX05/0EFoBXXUNw9eRKMkm2sTolHQPH+QGrIi4H6AadqnQ3aiYbucFNVhfiTW
	2nU33aLoJB0hKSsctPXyioiVQxXQKxbeXOcxbyreQAJ2XM9dreOnLpZTQ2rkEJqm
	iDq6gFOqJ8SavpymuaQ039+Oqb1NFoFnlAKLLUqgxKFhnTgdrvHBcK2KBviPbAxL
	4E3Lh3wnZ/HgAZyRpSytBTO8w/t2n3XbSabixc2n8YeI2ua1+1uowNLEWIg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb0505-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:59:35 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c7f1caa802so802947eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 06:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789567174; x=1790171974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=ZCmhOkye5h17w+Gva+ux+l13UAhSDwc3QMS8vkjuPX1gf26s1BrxgjxdfVEo5JcYKl
         2s1w+0ea579wujr4BR44uL5gF1aOKL9q+YS+JqqPTSwfciGrDo4wUSAd8FAie3930q3R
         qcBunBAfi0ghwdNWothmaIqeZtZaGZKkaCv91soSRWdtYzcIPNve/gcwzFcfkT7H/xVH
         3sGhkhgkBrzAOB/lsdLGOO/hrcMBMvaV8Oc2ds55rAkS4JXs9ZED+uVOB2uUPEY+3zmC
         z/scXEuXQbOMrWjRXA5AIsTMxRch+slsPvMJNI+SCt/afvQSAlEPvxVrC+HGfcmZsRDN
         WM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567174; x=1790171974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=yKctKPod6HxTs4pkVKYSAmr9OGOvjoiHdjTuaQqrwZkdkFXwqoNz7fsVhbBhuyKV1I
         sUjR47UoYdIsXLYccoraZlabkYrHX+qxJTsUMamtm/jmdUjT/vBsS41VorC8C2XoprOb
         pFaq4f98uzUwvmqm9UMk8CpZoe9haszZk8iVoGas2P6xR4onm2sCfsBTcUzjK2iYYR4q
         XP3/2pYdhgNihQywPmVky5HAzfrs6AdEIoSHg2zwDYgrutu1Tn+QyojSozvqNMvbRccZ
         gsGKz88pRk1oOYHErQJqImPVYnN/cFwRnoiMCoLZ9rPi7cUX0y/HiYaxs1+lmHbLvK41
         6K4w==
X-Forwarded-Encrypted: i=1; AKwUvBz7dviRfrIGRbcoMO0H15K4L1y2gwF3UG0MXimOOaHsAe5SiNjKvNGtfbZIfXnqZmAQpwCFSVznhLg=@vger.kernel.org
X-Gm-Message-State: AFuF++nIDAaLvn5LlSuCakEuiZjGwMlCR6CtMnGXg79LaEl4F41swy4G
	TcvLxtmSTeCt70v0yXLwqoJ5BtEdbA7SEkD/1ew2gEhVm0KASH0839U75jQnUoOq0POagPrmbZE
	WTKW7teCesroj3WQqUxvJjHneDZbNpGmsz9StgzedW4lsro4fLaIN+NASfFplPCY=
X-Gm-Gg: AYBFou3L408VjVCjJIuZWT2jN2cRYVQjX+TuMXwsG4Y+uDmYNdMT7cXPj31MHUby8mm
	CObyGOSU0aOxDcuZoPYIZ/UYASRgEcXvp2EiXffW//TryU3gPkKsMH8DHX3iAjLpM1FRc4ql8Eh
	rI58KHLkskf2bIwwBH0V6URBdE77dP0ogFNzskCMgbQOr5jUy7OUZAeyyaucWkcqaiJi0AV93Ul
	yl+4Adu871W7qK4Y6FejWCtoYX6bbnAb+RfjljDkzfNBW6WV2rYlTwYXtpyueXGOYeYRHAIcy+t
	vCs3CC01k7ZBIk/6UCnyHaeDQ4jrRUrU+Vju8btTbdyvMyRIPpIQ74R3CNRW3nQhsJWU3gVKf7D
	wc3rKBnnmuQGcA++1kEkrlcuZjnoJ52efjPIU9CXenm/QxsHkRGJ/oW1gFYky
X-Received: by 2002:a05:6820:4c16:b0:6c3:ce1d:8e15 with SMTP id 006d021491bc7-6c7d1fe8056mr2678778eaf.25.1789567174357;
        Wed, 16 Sep 2026 06:59:34 -0700 (PDT)
X-Received: by 2002:a05:6820:4c16:b0:6c3:ce1d:8e15 with SMTP id 006d021491bc7-6c7d1fe8056mr2678713eaf.25.1789567173870;
        Wed, 16 Sep 2026 06:59:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm6507940c88.9.2026.09.16.06.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:59:33 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Wed, 16 Sep 2026 21:59:17 +0800
Message-ID: <20260916135918.1017527-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
References: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aaaa0c7 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=rBiNkAWo9uy_4UTK5NWh:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: i0nLvhpGhgzicpgWAEAdOCvVMy54Brwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfXxBNEiGge2miT
 nxw2ChzvK2SXDHaqCVtbPZqbsvJ/g8f/hUVpmgZJA/ZzAInRoknPYvnrrWYjJ4WsyETmUgvmZnS
 8gzf6+6//XcjtR+MWIO/12I0o2+QnlbDNsJWzZa2jGFI65VlGLgqyG1I7trak7s2HzmcW3jfLmB
 OD5aTuuaSHfDan5cMso9T4j9ofIChD9ILojEqZWdjtf8hU7/RYrfNbIILREvTOzzdFN9RD8Txp+
 aE8O5yNugfFy1LQXH9gCzGhLApXx/S819epv6ydYSwDj4zAQ71lJMzZNLggz55GBJfFp8vCNlRI
 K4qZ2f0NfFQtAMEyNvXGdMEl58bBPmCSZneK93zmzNMkJs7LHdHPxqPwzWIYMSzueiBKZ1WgP0/
 2liZh1tm4WD46w4VHHkljHto2deWE0676cy5LJpULjEzDK4GiwWrgyZBj18bcrvDuXDIvV1qTNT
 PES5qanE2AV90HACYng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfX4miWKlEQg9Sg
 nicj3cFKpVXzlnPh6xn+mYiDhBLku1+hxtjJL3HmWxeTOjk8KIwK027QEltCFB2jh/HA5u5DmDn
 QWvXKEdK5nIQQEwB+Q5iu35b8mxKZCU=
X-Proofpoint-ORIG-GUID: i0nLvhpGhgzicpgWAEAdOCvVMy54Brwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160188

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
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

