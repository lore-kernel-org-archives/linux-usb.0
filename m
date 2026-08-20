Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2293749E9
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237452; cv=none; b=ZdUBD6zSrq7PvEL9NWSKJVHmJal+r3x9Ni9XYIKpFgBny2Xd2JmO7X0yAlnMtOO7tjNq63359nT2Z11ZBz1JTjM3UPveDY+bZmmp1JbROv7bU6o3a1IcHu2wJSPcV9UOm9qKrfLzKmYLJrDrIFdrVCdi18XMc0PZTWT/WCVhDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237452; c=relaxed/simple;
	bh=nnn2VvmmY04QPKvQdTFVcUFoN3Rvxlc3uGFzFkpIl3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phrgLfHQkuC4n79e6zT1ThhlWMYNiZ6N/zYijAqilxG7QM7uK8VnhAUsh0dC6uZVr9i+mMyf89ZUvLbnbiZQQd6ka5RrhpNu4IunBv/Ju/Deu3hDYxWoIS7y3npgkRwMRVZAazTTbBqf5YvVfPbKrkQgznHDMfsfhfSnS2vV5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8w76avN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EW0FODES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8w76avN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EW0FODES"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7erf3987813
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S7BAfSM3xAy
	lZQ2ziEWr2lR6yuzSoZq5hoVHdXm5m90=; b=c8w76avNVE+ySgMegkHf3kJOS5a
	uDxaJn5bH0JOkd+w5pSnKg3Cdqa0GEF13tWtrCfcpH44Tb1AXUJuTsglN8PXd2v6
	Wtt+tRq55Gn2IWi+kJGBmQpaaDM9CrJ7KDnxVBE527YgTtnTz4bggfSn81bNIZuT
	4P4LoIsk7iTIpL5vLenp9eGzoCVQJttqiVUru87DUCfeKqcNbOZYqSfI8Eosh3Ji
	0scNrU1JAL+nOLAgVAm3VUMr4ce4W+7u+A0KPBQGGalHZ4AeYxODwGxnl/AyeDtR
	tdLtW1/yFWAhJm/0zuXHkqDl2TVscg4+6POeEWkT1EXGCnvL3/brRi01XiQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg89521-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:50 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b12d84686eso2496431eaf.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237449; x=1787842249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7BAfSM3xAylZQ2ziEWr2lR6yuzSoZq5hoVHdXm5m90=;
        b=EW0FODESl+X+nwWA3DJ2dDircqKSDqUm1nXXjvmc5AdyBED3biWNp4cpRy2CnmGT7C
         jyjubhpOUcIQkLYhmL/XAD4HReTg1HfUrGTqr6dxVfEqYpZi43CFLhPpJdj5+vR5d1Mx
         he7KFg+PwXvYvYdDwLXKwrMm0lyvbsCB9/ppp9RLX0Wa5uuZMnDlw6l2Q/9d5iCIy8Eh
         oQI6Cg11tcA9OyVZ3K2simvIAak1MPDHPt1fs+TEQh3YMVdY0/+W/ply8wBTMGiMCnpH
         SxlSJzBIoPOWpVhgION+6XsrX+PYhLdgCIDQhNsj4Q/g1pXw8oEO0RJfNhP0EX5Wero1
         xFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237449; x=1787842249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7BAfSM3xAylZQ2ziEWr2lR6yuzSoZq5hoVHdXm5m90=;
        b=k2GO1QkipFpj65doZQHCUKwJPRJyFaVZ26uOccyYd1Xf9XnzAKtdSp9nVGJfC435+d
         +b6xvzRZlaQ/idXxsHx6YRbVCpPUTShiPS3aozEd7h2w2GeYDf99cesbnU1XXw3LZkUv
         XHGhhl+O8GnC5KzcAsbysFKejrbquRukdsvE0nKE53XJD3a045gdeYigW0OtAh1eHQ1y
         57ZyzBIoVIZMrSssyazgZABetwqVn4DQJ/YfvopP+EoHuAS4+48u0I7wIm8V0VPW6siz
         BzWJj9l3VBPg0fJc+8Vm1TPO70jd+m8pGVVHVEl/pSlLrnSLu8D/WZ/bIDwDg70tcw08
         Yp4g==
X-Gm-Message-State: AOJu0YzV6KX/YzioNm2GMm8OkE5zZdbkQNuYOb65zXyQ0KBclx73+B55
	eup/iJ04w/+s3KEKq8/IdZi4uvWzmqlFdrOjkwXsYITJBpgfSzLgWQI7MuzQj351HObeVH4afgJ
	Co6q+hZS/5kPwYWeJKw+7uuDIawXzYIt2fQquzsR+Ud2qLNF5UoMsG7UpWBe3YiM=
X-Gm-Gg: AR+sD137EEnA5SE7gG/kfVfUvRWsSEW1J65bQ35zF1uQF3+wc5pS7FF9LEzQ5fr8jmk
	NaJRTZWmq6kI79WIk+dXX0SUv56e7qDeV3FYUEjR/dZzEiaxfFQwS0dob47o89jdfVoad06B0Yx
	TPVzrskUrP6wtSQmhLLlrY0B6J9c/1u44bTxeJej5NJHuUTeT05uweRTRRu4Lje5aDSs98L8ih/
	syF1+Ietps+6oSVUlY8/OlU9DgWvE/zOghpbpwcXFoAT7z3InZTzUYVCIMXSHdiYovGuXUiaqui
	uSz9zph7+ecqxyS2315HT56Mog310Go1H5gG6/XAjhs21+aW93xeKbiCXkla5yo4kHBc28ZTKTM
	p9ebBkPx56aFws/yu2wRFEgdJrjk6
X-Received: by 2002:a05:6820:4dee:b0:6ae:aa38:a0bb with SMTP id 006d021491bc7-6b13c64e72amr12538941eaf.33.1787237449298;
        Thu, 20 Aug 2026 07:50:49 -0700 (PDT)
X-Received: by 2002:a05:6820:4dee:b0:6ae:aa38:a0bb with SMTP id 006d021491bc7-6b13c64e72amr12538882eaf.33.1787237448849;
        Thu, 20 Aug 2026 07:50:48 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:48 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
Date: Thu, 20 Aug 2026 20:17:36 +0530
Message-ID: <20260820145036.2035641-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX/g8E0FbzzNSN
 LftVU4MUMKJK8DPhl5xAzh1Z/RLnhCiVYIDqxvxvyF0JkSFmbUxgzEToKP1eKRK2ATwzuYvMTtm
 PPT66Pf4vsbZ2oD1qMKcqRhNTIAZ820=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX4hL4MsXz/ftY
 H5RfsR+gIc3JQpJDsgsSBUV477V0qO1fgKVRFokGd93ZP4ZuJmiUh/JMJYipUqkxd5vePdZ8uLm
 Wm5QATdmNox24DVcQ4amO4xcKnGivsdX89uXjEeEgJDak0vGZYjUwcVD9INJD9IG3AJbdBeZgdc
 /DIy6swoKewxWaXL/TEuiiKr+5qhbIkfzq5OWoOCABqochNHSBu/fWSk2gP3x6pzM3ww6pOfI0+
 U70EmsgGcOvncRus8seM4CHABuZN18ObkBODBRleVZjTym8owNLye3NfcaOoYD1fYzquCs3Jrlm
 t2E0xfv4D6H7FXib4uPGrgnVIXv4oQuwWYodrQK8JxHvP/OJ3bx7GgDJT572DOKZr1wpbCp5S39
 PTC9Q2QXjtoesQ4bOucw6iecRs4GcECHqvt95Q7j4fJYpmW9/hhdVM5NaawO9rAQkj+FdtpX3gW
 /vjl/d85rDSt+ZN1RLA==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a87144a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=PyXS-OjWu00qIW_W-2gA:9 a=WZGXeFmKUf7gPmL3hEjn:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: uo4Fk3FI0eCNN7cvI7lBDi7YDuAbJW5P
X-Proofpoint-ORIG-GUID: uo4Fk3FI0eCNN7cvI7lBDi7YDuAbJW5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

Add the device-tree binding documentation for the Cypress cypd6129
and cypd6229 dual Type-C PD controllers. These are used on Shikra
CQM/CQS/IQS platforms to handle usb-role-switch for the USB Type-C
ports over an I2C interface, similarly to the existing cypd4226
binding.

cypd6229 is a variant of cypd6129 and is described with a
"cypress,cypd6129" fallback compatible string.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../bindings/usb/cypress,cypd6129.yaml        | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
new file mode 100644
index 000000000000..f709f82f2092
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cypress,cypd6129.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cypd6129/cypd6229 Type-C Controller
+
+maintainers:
+  - Akash Kumar <akash.kumar@oss.qualcomm.com>
+
+description:
+  The Cypress cypd6129 and cypd6229 are dual Type-C PD controllers that are
+  controlled via an I2C interface.
+
+properties:
+  compatible:
+    oneOf:
+      - const: cypress,cypd6129
+      - items:
+          - const: cypress,cypd6229
+          - const: cypress,cypd6129
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+anyOf:
+  - required:
+      - connector@0
+  - required:
+      - connector@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      typec@40 {
+        compatible = "cypress,cypd6129";
+        reg = <0x40>;
+        interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-0 = <&usb0_intr_state>;
+        pinctrl-names = "default";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          label = "USB-C";
+          data-role = "dual";
+          power-role = "dual";
+          wakeup-source;
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+              reg = <0>;
+              endpoint {
+                remote-endpoint = <&usb_role_switch0>;
+              };
+            };
+          };
+        };
+      };
+    };
-- 
2.43.0

