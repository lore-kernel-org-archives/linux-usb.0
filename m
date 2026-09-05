Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992374AF69C
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622171; cv=none; b=CAM0fkmUFVziSSrgfk7BbKkwMjcFmOmRqGdsy0gLUAW/4xLgrBe0fFn9y5uWl3CiR1vr4DLnTv5/542H41LOUjuO70scPSkd32HMMTg+UVxtTvh4jtFb2KaPMHbR0cU8P5NZ3MBfKE0itD0AtOmsGps1dfOpNnb9G69Ngu7tBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622171; c=relaxed/simple;
	bh=Uyo7hXJaEAF1gH4XY+cmoRAczUbVpxvWUGMccuon35U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QveLG/Kd0Vc1qV4VJo/sQoPnK6MYpjDAMiTSeCQNX5cTWWEi+nuqS+yGUw+Wko4iMgl39kld9BihjvF3hAalI8dYBBVhBtrcFePim96Thl7OLmBnXA8JshNr7uHmNepwVJtss2NiU07fSxJxaJZhDvzpzibu604jzVFvF519Jv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuzICB/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixTgFntG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuzICB/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixTgFntG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685Ei9Mm2629432
	for <linux-usb@vger.kernel.org>; Sat, 5 Sep 2026 15:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=; b=TuzICB/wAXrp8Auc
	kwsrO/t2aw8fVvtUQ0z9ewxvcdYOx7mwlTxf6BT4wy6hFLCGEldJVOpZ7cvSlcGz
	WTfhOiGXYpRlaFwh5yJe0E5cBK4WUBTQEKLITfLV0AgL7SMiN3MchU2nKuLKezkX
	lopDAHhDBrHKdh2hpjVn6aO027Jledi+sACKgWu2EgJ5EDrGChJ6tSQtvlcsqZty
	bDPnWCmnD3SyFNq3eDhoTahU+BApQBXZ8C7bxHXF15FB27hQ8Rh5gAFWhzVIIOJS
	xufNEkGCIz2chRcNV7uEA1wRAITPwLAT3xhJV2p3nJJvWaUQzflRJND9HhD3aGHG
	hmKKlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq1xxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 15:29:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso28207235ad.1
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 08:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622166; x=1789226966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=;
        b=ixTgFntGWQwRQAHzjzSoJgsMxql/2cZsARX2S/IOtfZYWKbfQFh7+PpkgykrUOiFME
         y+hn5JMoH6Pz+qO4LDniqt0LKbhON8oha/teaDS7FGbg9R1wGMfdp23HN2xYMAMdmbT7
         0yPEfclSFSHBoxIBCm98Aapy/HD/ncBvXNvngE5i3R1/ej0dicUNpQ5f92ytYtM1Jd3u
         vVfGLX4UsyaeaDSnXmI6tZg8Ay/CUQcMdS4yOwus/ENUMUIMn9Vv+UdpJSWk4//2EN6z
         JkiQozG3fnNP2aUG68L+yG2tmddndxHl04jaBdMqmXpz8F8qjIh3cvUGocpTDmQEoXEp
         5NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622166; x=1789226966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=;
        b=Cwu6Pc0+xAP+U3AHCMg9hKrA4B4sfXBRIVMVCwK38wIhPUu0KMn7kXofLZbAwf7KtT
         S83o3iR5MVzT4ZK/F37tC+pgKCMcHARmKvZq6iTKpcN3Qc9GziG7e3CaFJIVItsPQ4A3
         gNPrEWhfw+UofW4BvqnCJaEEY9GLFcvLHYglVgr+W/VvwSSH3+hzse3kBHQ658VeLp3O
         dWm5Z1u6JtkcbCUqOeD1AxJGPp+lxqtIbM7+2xLn3ql0uHvVUiz8zrvexNJzPCSGaATq
         VBu4dY5stTLFDXMdiLUgsCwUjMp14zhEVYejlTbVHhtZv7WXmc/ihd7e8G13B86RPls/
         OEVQ==
X-Forwarded-Encrypted: i=1; AKwUvByrDxFd8d72SUYDp4pyl3lfL2BpAUppomh6xWTBvBCW1W0LzVaioPW9PWCbOiG9Xso45kdqlRzkRRM=@vger.kernel.org
X-Gm-Message-State: AFuF++l7Gcil6eHjNATWqRTJPEsE3x6z+cDVPEF7CGYnBmjUE1n84gUt
	2zpt5txZ/GN0NSddyD8BQG1XyxhC/As8IA/PgduhVS86dgAcjgTDybmnq2aOBWxPRp/u1m23qaX
	3mswSIUrg+Ku8KMlBeTKt2M93fwHauquF0Xi59brwxAtjmH+CRsO+/Gd3mhmlQiU=
X-Gm-Gg: AYBFou2nQ1GVF44sqTyX32RmYhukoJb0zb9DnXez6A0sVO1ZomstFSmmgch2Zpq4K99
	pOVsDMYtazZaxF+wAKCD/IO3z2E0hV6wHOtMcZ0GaGsU2HINXWDzU7minZ0BZDgsIViM9D9Eoku
	oW4Tz518sZQQL14onOS/9oI6Y4vCsKtXkuICyqDvcpDKNr2qDgkKDs5sA4+Ez1ZIhOPa6oM/DFg
	PaDJXCr6nRrD+cI5tZTxC8nU7lVw9W/nrhfHJbcM7UZwVu0SBL8d2SN5BooDctHC8y/6vCW0/LM
	wYcKd0oN1KEk6o51rGk2fUpnPaF1oyEmwCeT68bpTDiHH6ghi0eBp/oM8TiuPx5g4o+D1meFxgi
	AwrWoDdmPbta0xXMUNHdMRKJCutIckRzkzo+uzlXfDJ78UemxPrk0Cam0ySkWX4tm7B7hPQ==
X-Received: by 2002:a17:902:ce89:b0:2da:e967:7953 with SMTP id d9443c01a7336-2db125f1626mr175066005ad.12.1788622166532;
        Sat, 05 Sep 2026 08:29:26 -0700 (PDT)
X-Received: by 2002:a17:902:ce89:b0:2da:e967:7953 with SMTP id d9443c01a7336-2db125f1626mr175065495ad.12.1788622166057;
        Sat, 05 Sep 2026 08:29:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:06 +0530
Subject: [PATCH v7 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-2-820cf5377a70@oss.qualcomm.com>
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=2281;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Uyo7hXJaEAF1gH4XY+cmoRAczUbVpxvWUGMccuon35U=;
 b=5QchFc35Jg6+fBq4P788nJWtG3L3Yo+D9VMtZnp/+4UXnmsYyJtl1KAulTFo3ukVADJW8/zVL
 EO9jE2yBSFXAqy2xcHlyjnIwE1iH+gBwcfKMLdKiiGKeMp3F+K8ENgt
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9c3557 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX036F5G5DHJt9
 NElnPjeVyCmDxdOY7id++5rahlVBWdemBhYhFJu3ifyWqJUgaHLqKZeSRCEk8u2JzrEMhRUcbRg
 1MTspzMlhCoh59Vh2YF+YMfdmIhOFUE=
X-Proofpoint-ORIG-GUID: C_MAqzIDsxyXcdc1gLoNM47W9WRb6fbu
X-Proofpoint-GUID: C_MAqzIDsxyXcdc1gLoNM47W9WRb6fbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX1xAmNz7qNvHq
 KmUybTMnFxFg6downb+aKUG7AwkkSupM6w3WpLTGekLw35j9gVFmpaV/sMb7UnJ5uECYQ8ZYfZb
 opcWYMgt+LYBEKi8rukxl90eKoaHzW02cSltGjuzYAmyLWtzUnS1KxMWdoyfQQOSDFaLY5G90j7
 XC0sqKBjX9Bdk4J4SEJdQ2tsW6aA78rxHZ9XiMZgJF4IQlfqeWqKYPgGMC04yV/fCBI2e2dw0yw
 rjfivvgw4dqWA5nGAG98ceVFIym5yJ3gYbC81aLvh+ivtbmd7C+PnHPZmA3eLatlEnMRxvxX1Af
 If3xiGH8QzXzwP0wYQpfgf07EzIJTv4tD0FvH9N52rgKNoEq5Xmw/l+EZUXzblOBlIcD1YHOx1y
 bI9CU6PfORqCiPmctTYuJ0ke+NQ+e2SLmzI+0/sO5NXYOhva20YqAqGwZdJUMCZIllJbhwHeZ3D
 tucaFqNKStLPdKotGYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050170

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..038c2b58bbe1 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -21,6 +21,8 @@
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
+#include <dt-bindings/phy/phy.h>
+
 struct phy;
 
 enum phy_mode {
@@ -152,11 +154,13 @@ struct phy_ops {
  * @bus_width: Data path width implemented by PHY
  * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
  * @mode: PHY mode
+ * @type: PHY type
  */
 struct phy_attrs {
 	u32			bus_width;
 	u32			max_link_rate;
 	enum phy_mode		mode;
+	int			type;
 };
 
 /**
@@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return phy->attrs.mode;
 }
+
+static inline int phy_get_type(struct phy *phy)
+{
+	if (phy)
+		return phy->attrs.type;
+
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+	phy->attrs.type = type;
+}
+
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
@@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 	return PHY_MODE_INVALID;
 }
 
+static inline int phy_get_type(struct phy *phy)
+{
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+}
+
 static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)

-- 
2.34.1

