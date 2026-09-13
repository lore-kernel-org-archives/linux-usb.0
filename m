Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167F3EF0DC
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310466; cv=none; b=Ji4vzWQXSJlkZl6d0jWHZa3njOULzx3nuf/04uiJGeZD5iN8XSFml4femmIn1B+usHmvIrDIBh6oJjYwaBcAArx8Lw5nxgwAIAGuv2QaYENNJ+VximgV+elmS71KwMBCK6stPgjU35+Uwy7hS2zf1sz4odKrys7qlf1qg9M8Rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310466; c=relaxed/simple;
	bh=IY2WnSD8E/Qc7eoIlUp3aoznMSkvtOFuNLNJe202z0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVY/FmIJx9+0Z3u/qgcynyxuttD4v0jrY89v0plLnoYh7xN1PXQzZ3kKpMoRu0DRxeyc9XmNqkn8t30r8qav/nth3MkerT61JHjzLhvabNn+PzhKRPbgwM3lO5zB0M4v37B+ko8L3OhduMVc5Jd6hU7mi4uuE26XSn5tO+7hNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkQTaJdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLrDOPeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkQTaJdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLrDOPeH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DDxrp3698546
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WADuGXO2aoMe0sj7AUt3ZiPoX2ZXMtN/W8/YvHMCyFc=; b=BkQTaJdVMzXzaTgO
	KfiKVTg9uvkbTmRyXTZU2ckmy2yLfjAl24DHPYSxLkevVTYf+u3be1twM+p2NnY0
	3IjvT+OIUelDurfXnvQUAAWFYlYAApXBIXddAcZmMz5yI4qednV0MDlIn5fCs9PT
	XrIhmKZ0DBraSQX84yLOom78Gxbpwm0mDbO299pmJo2IimE4ZV6rPdyswyv0RJik
	8d3yoxCMEJbHl6fXnbvAPfSZThufEgUHf83+CoyNiqMS3Kqn/MKtrOeKbPb45VyY
	w2C0SxM2d/Wl2olS8StwFODmGbGwoJF4xZEogin7MsEg2zz2wiupJw43H06WTzQo
	pe20pw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh3cae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3520382a91.3
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310463; x=1789915263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WADuGXO2aoMe0sj7AUt3ZiPoX2ZXMtN/W8/YvHMCyFc=;
        b=fLrDOPeH2OGqhTO1RflKYxww+bweGfL8XfiYifQFJjcF369uIilCp/ZNOOXJcFIOdU
         jzsJfbpTwoPia3ANUbPLPEZPbz95oGEQOeV9WofLUz0A30ps4eh7JinyiLdTcjaE35tC
         nJZZaD19WHH1ZsfaFLsxaseSs80GlZBEfvjzs8ucm3uXKNYoJnzGXMS5yZdujFDXCfzL
         llJoJElITK3sRLVnusQhUJ1qsHzo4W1Mhn6qQfVmItw7MjVcJt/NeNNOePOvm3gI9N9o
         OFd7T5byOn6Ln4+bTGVgBoitByiY1POHL+edT3q/XHi/y83JyY4z83G9lph6QEMYUOft
         h8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310463; x=1789915263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WADuGXO2aoMe0sj7AUt3ZiPoX2ZXMtN/W8/YvHMCyFc=;
        b=KwEzhgxBoXMdHDts1J7xmBPdJyetC2GpskjVMa1TOv6A5RiBM0sDtuDLLs+XzLuUIJ
         Wc7SUK1DUpYJipG6Q5zXaBW7xfgpFJQvG9FteObLuVk1tzkht0o/jtCEOnMt76slVIMM
         VK7LabJmKYh6Kws72IikXPZu53GUc9nfCQ79zN0kKHllc0U1cIYGpwoTb6m1tD3tPFoI
         13nMxcyx4PVQ45Lxbl7KKaWYMRwofQTZaJsf1yy6yCiMmkXqUpYdXZsStXIA6gnnNOI/
         E86ZkYYdyjT2DMr/lOcdhAor/ruQHJzxviJXpdiNbu7+c/KM4rhRPzxPOdZhGa7dYFPV
         4bsg==
X-Forwarded-Encrypted: i=1; AKwUvBx/DZ3sciUlzqwDlfBt01O0AtJ5SXIfqhHn96YXHFUTFOlqRSqzK8kT0jx2aLcWp8JWPJHc+usN94U=@vger.kernel.org
X-Gm-Message-State: AFuF++kie7pOgGnM5uUcx5mZn6dUHOdXoxZJDokGLZBD+F336KMIi558
	RDrujKbZNW5kfg53/3ruXaaJE+nLO60NRAjJHXELRjwA9niAYOuvtLm2ICF1vZOBo0FG172pxfh
	j26DeIxV03+ory71jR3BmtJniHS7+y5uz5M66xDmwVhHRkaAWUyet4Vr2DD19I9U=
X-Gm-Gg: AYBFou1pJpupLM5/cPc6PcCFrW6v+hOaFIpwLxZorswXg0Fc9w9KpRiiUMUJqxzpAo9
	J19ucusCF4y2DBWR2PIE/jh+KwnuJqQUhuWPlsS/uErNfxjYgVi3adJ2X4xbjeuqcPp5bh/Imlt
	FRzctiJjWx7FhF2y3hJ4iB1RO08bdMD1GVJlMwLw9Xg4MicxtOQ/4IwYEVXjjGDaQ5QZv2p3TY3
	7CTPHFeuLAJjSjVrPh7o6cGrMMeKLSceJnHkyx6dPSeSuC21nYrC1Tp3H/D0UqXEY6WHcPEkGpK
	GJy6eC1wDVlNsRYtHUHwmxtu07O7MjQfkdCjDaxXmlo10JsrDOnU8bPUUlhTpf2M8eSbOrxrGAQ
	J+EqlfrhNO6IOzTdCaZxaqOf6inmKuZ50r2AeVhe187fujuDI+dChIAxQropNXJlZK4fOTg==
X-Received: by 2002:a17:90b:5408:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39dbc6a0196mr14224707a91.16.1789310463150;
        Sun, 13 Sep 2026 07:41:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5408:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39dbc6a0196mr14224655a91.16.1789310462739;
        Sun, 13 Sep 2026 07:41:02 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:02 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:44 +0530
Subject: [PATCH v8 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-1-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=1964;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=IY2WnSD8E/Qc7eoIlUp3aoznMSkvtOFuNLNJe202z0k=;
 b=O5E116sLIKdMq7m8mU3ZS4xE9nMUaQM50pmqzz3y0t2E/twLbTfyVIOTlWjZSaucWPmnWISos
 ucWaTi3SA0xDUMH7MpWkbiG+X9MYhCpULb6YAOuoJ9f2UmuPrIY7Ugm
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: TbgpSv187il4RZSM7uoX4grRBfroEufa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXyEsNJJYEEBP6
 c+62cT8lNsXEz6xYHy+rOnepMZiDxrFg8KrWIHVJ0hSaE8nT4Ib9vqHR2q4UNUTj6OJo+PhY1J6
 Qan3dxQ7RO45tFBrwt5cb9+5zdbqw+95J3IunLIshPUYVLzID4C9SHUN7TwFqs+qz2Vve/4iL36
 MznZ3w1Mrisht39gq9K1mH8w8P9iz15GRP6mla2P8Cj+tSH3tKEWG/5rKqmYL9FKiU16LS8NiII
 bYFqStODUWJiAgjOW37D2RGZgW03GHMv1WphOks5ZWftyGiEb59+H+EczZp0ehc40Qtd6Cjjzgw
 /lPWGVZQGUl6qPBYTw8C3NWPI6WKCEao3fTxtbfEXaa1sKQ5RykWsPEABKVk3M7uDRTDiiAtBZz
 JH+rzbB5YuWNsNcaTjAl9Vs7qUcwhUi1VkdQMwvZo31XABAa1CW5lt2OW+oaGO3BDdNi77sYXAR
 aDit+zmzX5xBqgdDSzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXz9Fn/gMtGpmD
 MJFDgRCVRdvS53JqJqnSknsQSzAUpj5QIgds1b5apKC2SKjLw64UApv/scSTbS0HIYdtuB7937r
 8CRRExUhD/zUpgXmIOiOr72iJIlVmJI=
X-Proofpoint-ORIG-GUID: TbgpSv187il4RZSM7uoX4grRBfroEufa
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa6b5ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=L1EOSesq0gyy4kqEYQ0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130210

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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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

