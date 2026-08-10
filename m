Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912A3043BE
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322574; cv=none; b=R5JtWxP1ARzZ8kAgT5MUCWr5n9j92U62biEFyCg5nE8g5Ata6kIjatHG50bNoND/M/WlmYr2aasfvhj9l5S4it88PWZs8OAWYFP+O09W3xbFQJSgZkrTRGrsU7pAU7NAKhxzUAXk3yJZ9eovNeKP1Mv7sdwp/rUfYSLQUYDKV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322574; c=relaxed/simple;
	bh=7xxEO9iBqMmQrjs1cD1cY6/zkav8nUrrWhcmcweWbCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9K8K7ZpLHIgHpYDwbUZLyy8VjBsfM0TMH1P2yazx3VowEkQw+OIAh13+Ud3HldflpGU9hFiKXuRUKrN65PP92TLUEHXd8l+0Sw5/nAIEfsC3hqfE/9MkrcrMMSXCobdG3c9hSJ2tl6QnRaPAQTDJAsGDq155zjv9dgBiuKPkp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOIneIEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsPJwCpt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOIneIEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsPJwCpt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679MuYE24010013
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gm77B4g5P+NCS4VWYrUZVvsJNwJFQO7NHmxMjKiPJXI=; b=mOIneIExY8fWB6Ch
	y8PdQjkPcbrPh1O2YmIwHvKPg50p1jzAj13PhnHSUA/L2/sM+7kUtm13FmQBzfia
	f1hc1ybJsQf64WIihMGNatgK/MYdapjtW6LqoXy1z+zF9nWAykOUIV1qrX8UWA+W
	CA6L6B8z4DtJX0+2nm3DE3SYKjhy0LXeYt0Hw8JZJs6O7qNW1OSlFpNpgK5NJgB3
	0i0hWQ8z3iuj6zWyoFNyvvBfhM/OeeYg2z9J9nKRMFLUPbRoVvQpjHuoD15+M/nm
	y4l8A509IEWNWUkzP9H4zfNocKHlBXZotGHOKXuwzwGKKEgJfS9y2/xa2z3YQ3YH
	VflMuQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp43yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so15483016d6.3
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 17:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322571; x=1786927371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gm77B4g5P+NCS4VWYrUZVvsJNwJFQO7NHmxMjKiPJXI=;
        b=NsPJwCptjhyenFMiuUJdy9nlG75HJ1W/9mZpCy8oaUSxQAQdxkrabJZyMOG8/6TQHj
         HBM3dom/uuyt/u8NR5uYtms5XoZP53re5i2/0oIyNF2pq7zDNEwiYKosaImSyHpkePqN
         yj48xSdXVxnkPTcn/7tHJstuKLRSA7inZWiua9DcNy8YhnGsVX9zY5S9ecSxSaZ59tqF
         8jv30TIMkTdQVFUcrG40QiKHOKVgg1CqwxJBM9RVo6HFcoOQFK0lgUxaJmHrpkd+k4rR
         U6J9f547+kYU1VEAjFJ/I9LD8Wko3FuGRHpD9xE1ftUJ5eBiCZxwfW/11lRZS46pk/9D
         wqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322571; x=1786927371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gm77B4g5P+NCS4VWYrUZVvsJNwJFQO7NHmxMjKiPJXI=;
        b=I8+VAf2/0HqGFIo5FF3Tab+2MfUXlvFGeDDms7TOOJpnpSX2xVmnb4AIsT8k6/M1Kp
         Oj8U1z35NE6GNU4mggQSxUTt6q8znqO1Jf54S1UjkUxGDW6VwhRBhtN8irTUyOVVvlEj
         HbL+WYIWmQ965dKLhH2nLM/aF/zk2cBKv2Q0Y9q/XwW9Hsvq7r2ETk2RicddkdG3GFhe
         lPEYKFVhgwblS84f0qfMPNoD6sVkf7+ZqMISkpggdGCNY+EvkDdpjhgnIdrs56/yMtaf
         LSNzSt0SI2BY1EkAmlOen6qnMc52c7dL5218vWnosdEucOOiFO3GxCTEqRSZUuiiScTM
         aj2w==
X-Gm-Message-State: AOJu0YxbnHtojPf1cmYLZf4zfCBoc/9p4AoIkouPLLZ2rJZIqQUtXUXN
	aJm8lZbSCxjeUnS3Er9EmhxoIU9wzp60UasyKDgbrIL/4X0Txgxk4z1UwdeZ7Yic5qTW2HXEcPK
	FnFg/dzQlTWW0NbS70FImcJ88oeETJBhIcAMT0a/0mfj/iPCoihEWZEP/tydNXcA=
X-Gm-Gg: AR+sD11oeejwQ13q5FH4EJymFjNWalCU/WbT4aWcTPTnPv5U/3CTRsw4TvbIkGdVo5+
	dpXm0lqWlqcJ1C0+KY/dRAPbgqURl59TfqirCrn8be4ryhV1h6LjyxsgDWaS16rX16XDUSEOxLf
	iOrf6ubXPjkdIgdlVUbkeTf8caawbTbdOoma6A99sucznx1vBcmtZqv5vaStmao5otVTwACiVh/
	3gsTc44XXx38vHE4KenGcrTAiCTNPEauc60Q/uRgbdmBpznsoeecz6fGh10DFa+aXhgeCsYSmcO
	hBAXv/vi3i1Eu7R/24vrD+0AQIPoAnZdLY+ckkEiLbOFpPkdag3OZz+57A2vO5Gjw/Acvd6AHNm
	KzjDugsuVhEg6wtPhjLYcHAceh/CPoWExDOf94LhxOh5arZ0nkM+sNiam+FW7a0vcf//j5j61Ae
	FhxsIg1JFb3vSRlw==
X-Received: by 2002:a05:6214:540e:b0:8f2:4100:8613 with SMTP id 6a1803df08f44-90a343439damr205018886d6.0.1786322571095;
        Sun, 09 Aug 2026 17:42:51 -0700 (PDT)
X-Received: by 2002:a05:6214:540e:b0:8f2:4100:8613 with SMTP id 6a1803df08f44-90a343439damr205018556d6.0.1786322570694;
        Sun, 09 Aug 2026 17:42:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:42:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 03:42:34 +0300
Subject: [PATCH 3/8] dt-bindings: usb: document the Prolific PL2775
 USB-SATA bridge
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-onboard-usb-v1-3-08a805768328@oss.qualcomm.com>
References: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7xxEO9iBqMmQrjs1cD1cY6/zkav8nUrrWhcmcweWbCY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeR571JSJk2hyke7aAQqlgTqEQwipVpf+VATv2
 SZjs/USoBKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCankeewAKCRCLPIo+Aiko
 1aURB/sFK3YSPiJDdwwKQKfzmbyEcQlchSXjCPt8Ax7u3lcFw4Cgc/NABFjH+6dOCvXZ1CiuyNl
 1lXemRKaOO4fibenIVojQQOmT5L+2sp3uQ2qfClB017Yl3mxBcRsK48srIUN+Z2YvO4edJzuBZL
 IWVheDl0IB6XAJSQbsK4AhVUlk1a7k5jxoTm2cdma/91eJzV9TIoHuf5rBSh6nF3eZgGzn768s8
 ElVhL7nFU9O0X14mauZRKSfIHgUWtbE2Ai1bOBqYeVv23TikRMxRdpmLM2TrHsuNiueIMJHc8G4
 TkT4qSL6ScX1w+6OH+Vu/XTq7m80/iY/8x5Am6kbYf/W5BXt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oeHv8L-d4rFydf2P0xRlxr7o1y1lCgdI
X-Proofpoint-ORIG-GUID: oeHv8L-d4rFydf2P0xRlxr7o1y1lCgdI
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a791e8b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=XqfhFsZh2exzjFNJnAMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX+Mnzk6ZzJo6w
 BqYpugzq/U7tLIfuIFhJjfEbiaHbSMIrN5teBSoPwCWCShdCit5hUVF1M/RVfItnrtQ8xsFBZcB
 k/BVHmVFscuIJ8H/HFCujnEhfpIhUxfS5Bc5oluj3xzMU58PSW6Jvz8GmaS1TBQY5MycveoEqto
 tjYjLzn2o/bK0eRIPo4QrAXBfR9qABUSNYt26OYPivDeMWvCtJ0khrsNRK4NzlBgWmQWPnj9Yqu
 hiIi7fsrkh0MORFWNgSfnplAARuxME6Ld4zqPSc9JnPE2yyWE9mvW9sJzpRwkbU+/e8t8EhnCUg
 g9iL2X2ySZFCflL1KvQXsiEaZHC0g2GN0aQQBCSmRFC95ZrixRMNc7qfFCQXomRm/a2SXRgcZen
 1atgpuyR8WvRVuEOYaK2KENqIFmQynCH5SsS2ahDAN0jXwVaS1ubji7t9Q51piX1Tjtyuj3JgpY
 AuSecN8207Z7pCeZRFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX5oEE462jVSxb
 Ni+/roJ6wjfbi5TpyYo8xjrf6EAnHfLwptUjLXchEhYXcEfBdPU2J5sO7uVF4IwNWp714K5qllv
 YJGaDL4Eugqc/qAtcQ1wl6j+L3qwft0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100003

The APQ8074 Dragonboard has an onboard Prolific PL2775 USB 3.0 to SATA
bridge whose RESET_N pin is wired to a PMIC GPIO, so the device has to
be described in DT for the OS to release it from reset.

Add a schema for the hard-wired PL2775 (067b:2775) with the
reset-gpios and vdd-supply properties used by onboard USB devices.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/prolific,pl2775.yaml   | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/prolific,pl2775.yaml b/Documentation/devicetree/bindings/usb/prolific,pl2775.yaml
new file mode 100644
index 000000000000..5af8b4f5ee64
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/prolific,pl2775.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/prolific,pl2775.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Prolific PL2775 USB 3.0 to SATA bridge
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Device tree properties for hard wired Prolific PL2775 USB 3.0 to
+  SATA bridge controllers.
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    const: usb67b,2775
+
+  reg: true
+
+  reset-gpios:
+    description: GPIO connected to the RESET_N pin.
+    maxItems: 1
+
+  vdd-supply:
+    description: Power supply of the controller.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        device@1 {
+            compatible = "usb67b,2775";
+            reg = <1>;
+            reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+        };
+    };

-- 
2.47.3

