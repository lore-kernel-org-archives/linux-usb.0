Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C04B0C99
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622166; cv=none; b=cjwB0t95UGe7xUlHH8eZh2QCEt8USAaI15/RidWkT2xqQxW7NNZhst5lMDKJxituQl55ROMMZ0XZfKo/LVo3IIuAAx8iZl6OJWvu88ZR0HtT8T6M9IFhJDPfozGCC1Q0JBQMRQczXwc7qxvb99b4ay2bbmORQXJ0tsUfsBtXHH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622166; c=relaxed/simple;
	bh=WnXZK+/CafaIjClk17Obq+5PjwYns6avlw7ViAZaMp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0M3E3aNueayiiF5o6KSso2qEptN3MVcnIn1VjJUPz2ie3/FRUoe3yd213wxN6Bbgp8ySLKIKoFvkyWWK/bRdb1iovKb3I8+iyyXALtnj1CF5AQLXq2I6e3TZKaCU+3/DnnxfVmNgKQi5WqmjteewBPhZlROnn1ofJ6nlJaPTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Soxe5nsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeU2LKgx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Soxe5nsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeU2LKgx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685Eh9rP2935093
	for <linux-usb@vger.kernel.org>; Sat, 5 Sep 2026 15:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTWsGeOsKcKPKKrUyN9zOsyxDt3cWAghdf/v1vcKlIw=; b=Soxe5nsuE1MnuEHc
	H3N28K9LsUe5uFQbHRzM0VgiVJZAgTe3l6kIJsWXY5+lQqM9TGJwmF283u6/SYRw
	Fg5wrTXozULA55HOOnkwJ3HW9OhvRRvqiVZxwUC8l+6AOvxtu7Lmea5v9fT1aRST
	JZMm2kdWopNAsd4Us3dVhB3ehBn/GEgzQ8JSrk6YoYZ0gxztRxcfB8GBBVg4IFT/
	GceuN/q0x/wW1Oh4XtZOdYUeY5QEKYnTmkjU3SIYliYg6DBJdiIExF1W6aU7MwMk
	UW0GTrDHYqn+TkiY64ha7mtDCCvhB10fLVynvZTyXb09jKOU8SNe9LZcFYGzPqRo
	yw7dSw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga371je9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 15:29:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso3641936a12.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622161; x=1789226961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTWsGeOsKcKPKKrUyN9zOsyxDt3cWAghdf/v1vcKlIw=;
        b=aeU2LKgx5Qt6DiYuf5MLuOJLH3G0E9zIvLU+wgwquDJs2u3OE9FpOp4DPJVmQ65U9z
         rY7//TyOEBzvx56tlp2RPY207O42p4PLp964zlHmEdHpw8jZcRGTcbv1aAc4Zu0YnZaE
         qPZedzHL5jC+z+hhXOdwZgvp4GFvf0UvNeuU2VIiDkjbSASP5GVZRLP6o7oTQ9dhseKG
         zNxYlfnHYzVGOuM3xaSs4tYlIXuXSi4mFRA17XsJRFU+XTI2OXf0Ic3Uv7vIFYS1ulad
         UpT0gSRtVvfHWoNnO1kOFrJMZyujH/FMe/K1R0+XEZmSdba/nblZhJELcHIxF75uoTTY
         CEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622161; x=1789226961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTWsGeOsKcKPKKrUyN9zOsyxDt3cWAghdf/v1vcKlIw=;
        b=fGSnD4NeyGZyy7EhPQU2TzPi6J8gMnux8T5T6fPgmw8kp17L03QhM68PEfqUkFbpHz
         y9DnUfiA/rIdrDmICPhLTFJ0cAPYyBQu6s5gV/ED2U2Nv/r6Y5eRnvdX6iRINbprBkyX
         GAhgq5JJzJ+VUE7rQvCILRP1OU/T54cb7D7QzW9znBWuyfTvAD06jeJnz9boirWYfF9/
         fJakyp26fo2jh8LSCqTrqkSQ+J8uxqShsatF4klWH/yY5I6jK/lVeVzG1/Sr4K+6kawv
         uUw56U2gYcOZ83xxnTqic0k9o0o0A93lOcPu8tV9sW12ba4yMvXa+/IYKaQBVqlCao+u
         D7/g==
X-Forwarded-Encrypted: i=1; AKwUvBzhyix0XyYCiWNzTfIakJ3tFPdbUKy3GcjJ/3qDf8cwqOcEywtHHABdFkzjU697nURKXjF5XhN/7ww=@vger.kernel.org
X-Gm-Message-State: AFuF++l/iAKGcfkbR54dONaNISgtXoNFAQ6ra1c5dSsNyWQbqLA+ItSG
	n5/eizc2SVZouY7OXpt1MtfceSL4NQBDB7rwHQdEMSRbjdme5VLAw5OjAIsuJrwxTbVsvyXrk+9
	nqd9aBM9uqxE/4Z+s11dLbh9asxw+B/f5bXaO7ili0iVAQXv/yQEMz8tCcjxjB9c=
X-Gm-Gg: AYBFou0RR0y2zdNggpu4GjYM1dKjeAK+jges0vcqfiTXQ2uQqNUygGnQxskaycRuOzD
	+TvzhS7R7ecX3PCUynq2W4Rf9H6jpSTSjf7TaSeUcledxiczTqnZVW3Q82UWUyJe5MIfbTWy5JW
	djjsn+UfyYkiMzUugWchmcFRE9tprGxTUhZvJpmtRkH/YqEVTQeJfI32D7wzZ8yY4ws177ggPT4
	Jp8LsfO102o6rLEF050fmPHF+/hIDGM6chcWLg7uCZs/6ahcMlIPC4R/7w+oNLFSNrM9iaEbCQe
	g+nb1+xrQTiZNUYoyttlvfyMjNdke2VMKn8mJlrRSH+lc67lIjKGczbZ5/Ug8UAfa0NrFwxJqVM
	b6TapbwXRgSQszK+MngAZSWAp++6HGbVTpwAm8H4C67a3xvU2eD1a2erVZmelHkdf0R6vJA==
X-Received: by 2002:a05:6a20:914f:b0:3d0:88f5:f813 with SMTP id adf61e73a8af0-3da39ee3852mr19354223637.11.1788622161190;
        Sat, 05 Sep 2026 08:29:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:914f:b0:3d0:88f5:f813 with SMTP id adf61e73a8af0-3da39ee3852mr19354164637.11.1788622160739;
        Sat, 05 Sep 2026 08:29:20 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:19 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:05 +0530
Subject: [PATCH v7 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-1-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=1887;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=WnXZK+/CafaIjClk17Obq+5PjwYns6avlw7ViAZaMp8=;
 b=FvNIJcoQHUvV30JecgI00eVRWrAFvuhbeEqY1R2x9CkSMksgbKoVLmmcGvrUMz7mPvcbNYgvH
 q8fcOFQ3pynCDxp66AGyc1Vjzoq+3wzdGt7swoMB0BUtvODU1uBFOBK
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: WSopN1yh0kmhuNYTNC3paYcv6fpj97EP
X-Proofpoint-ORIG-GUID: WSopN1yh0kmhuNYTNC3paYcv6fpj97EP
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9c3552 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L1EOSesq0gyy4kqEYQ0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX7v8Xy7tZrsqK
 B/1MlAY1aZWFBRUubI24oFKYUwVXiLVunnS9860SSHEzHazqkeJk8m/VMCY0+Z6xj0f1mcv1GT4
 yVo4wlxtFrKUBdcTFyIaD0DsMrFwpVA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX8pETRvOWrT4F
 ySjEt34iPgPhfG3SQ0rNDRI3BywDooKFfe5dy7VwGFB4/r0ndNvnOLtLule6aaM827WocIHPyVA
 FHDZ9BkImh1vTUGWm8cbzO7UHpVFLRu440i/JN4t49lp05a8BNs41NRc5247JZyBStzd1CB9Gux
 muEZU19+Sh4ZWCWDMQuxgNwsrv+awxXWubB4GfkFXoP7akOLtH173YDNujlKP0ZO3TmbIBvDGHP
 cjSi8tUXEKVuO6gd50Nc/PH5m3HszRigGZOsx8rxCdXlunk8wDF0RVcgSBkmErXcKfzq8DJvfpy
 miatwcALbHkG0C9ma3g2sT5O7a9mWNt+bHCYFJlkxHl5b8VUDLWJXmO3ouPLmvSwqOne5b0ZMt2
 2H37LjhOqRKEqRdqkbC63nJeXtAUCoyw9lw6JvxszwvqQLHz1+TNrKZDjVBrS0y0IO72v0tN2A5
 B6wHF4R5pdieZGaG57Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

eUSB2 (Embedded USB2) is a MIPI Alliance standard for chip-to-chip USB2
signaling. Unlike standard USB2, which uses 3.3V signaling, eUSB2 uses
low-voltage differential signaling (~0.4V) and requires a repeater to
interface with external USB2 ports. Because of these differences, eUSB2
PHY initialization sequences, voltage tuning, and register configuration
are distinct from USB2.

Additionally, eUSB2 targets handle wakeup interrupts differently
depending on device speed when operating in host mode. According to the
eUSB2 specification, remote wakeup signaling in host mode is detected
via different data-line assertions based on the connected device speed:

- Low-speed devices: the host repeater drives eD+ to logic '1' upon
  detecting a K-state on the USB lines during remote wakeup (eUSB2
  spec, Section 5.5.14).
- Full-speed/high-speed devices: the host repeater drives eD- to
  logic '1' upon detecting a K-state during remote wakeup (eUSB2 spec,
   Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's DP and DM lines need to be configured differently
from USB2 PHYs, controllers should be able to query the PHY type and
configure wakeup interrupts accordingly.

Add PHY_TYPE_EUSB2 to distinguish eUSB2 PHYs from standard USB2 PHYs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..555a022c8c0b 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,7 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_EUSB2		14
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.34.1

