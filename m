Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E2402BB1
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763853; cv=none; b=RhJYSbFFxBUve+HbjFb1F6DUbxhHYNWX4JnLbgKr2rMSnfhC6eIDQYQizv74UwjtDh1E4K380x92dNuyRvBLaLowALSoxdVnGF0zyxJMwZGmK0QILeCb6wsrdX2Q+AsXjoM+qgjDAK8rSEuCGKwPI6S1iqK004nliM20xAPcT5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763853; c=relaxed/simple;
	bh=XU1ptAM6EfnwzxCKISypTLGtRTu3B+bY98zEVbWVya0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8y2QD6KMDt1mVd8yaKsE0tjMXoBs3FcJd94/+RWrFjNdOtdv2KtyNbnIS+MNlw3CwdccjaUVThaHWSTjOJwF0drAlJMzBpiq9zKQbfMRoZA9nIr2gLW2WbOTNBBctk1XhTVGcTZa7wsGzH/R0SBdTMiavxe+1haNAshNRRkrf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2Ms9lGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPfTtBSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2Ms9lGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPfTtBSZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuuBS2103523
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=; b=J2Ms9lGQoNzDyXdW
	1jty+4rgueJGi4vXkfNZluUY8TTj7tMwOFbBDIeVODLIdsHjOhGrLbz90xrYmxzQ
	HViZhxIVHEgfBSQRo9s5TnA4LThVNywsxwHTsid4SFDcGnOExL6wYQZ1C8iHkT7I
	nTgon60/shyhhXco3pdsGWeigqXXVMB78nK5i22smYTVT01VadIorRRnltSVhxMI
	zZ0K4bNfWz6YSk7DTZYS7cIyvDby9wcWOm+5I8i8vXB5+3EfnZua8iNDaeixxMQA
	/EpWIXxnElftHrEFrTBP0ekRLZcIV7NQyfr7w6vviVPmByUTaN2qmcicaznaTkgU
	8+LXyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbrw9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so18787845ad.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763833; x=1788368633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=;
        b=kPfTtBSZr1SQ9cvilZ6uVXU5fULPT2kYcnMPyzrBZbqj2MDwtQ3koHj4i5ALha6idM
         ZEsfkeA8v3PP7Nl8Hu4YVrqp3RjZVSPeSBoDYcZFy+O67y/U2OVOtgpzYOy1717CpjYO
         OptAJHRyvgn36cgRFTvCUcysXqMuWZFG9A9fFfMXRFWCiQg+E8AcGp0Mvylih//kxPTz
         a+J8AZP3z1bBusqVMud2OZmTda/ILvrsqfWbHWTJqe7M7WjWsFMyPlh2207RJi+xPJYT
         g10zooIud8zDoBs/uG/seI5prWII/o7apx/SswHUFcVRjhRExVksGAFkfsKg6Qz/AODd
         c0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763833; x=1788368633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=;
        b=ReKSDgVNI3cLfoXUEK96iwscrm7yE2f2y9Km3MzlS/TuROmSGBaOU0G5rBSXo9HzE1
         wvVtyy/bypd1wlM6SLO6Q2IM+fwM8Cf7+Q+lj97kt+c7nUluRjHmZ2MhdJOGGZuHW8lO
         soU1HJV7cJFvvMoX5Qf8M8E0k0SCpW7GzI6BpJn/E7SIK6sNH6sED8Z+iZ3mFxd09AOT
         0dhgVY+Hl+WcqQArAQ4fhGBJcFiUmUB1dPcyXKvIoOhljerQKJfIoTYsjITuLH9DVJB8
         Ucx2yhkJEA7FIcGKxewrnYH4vwzLQh6TAG1BJyq4/OGDtzlIFRQ7n1vmLOvUOdn1gSD4
         cUCw==
X-Forwarded-Encrypted: i=1; AHgh+RrHn20nuQ0fFPvffZCKhsRooqySgRzGqenjGQfBzqWa0CzLjiu35f6vNhL7NMv1QIp2j4YIvq5IVKs=@vger.kernel.org
X-Gm-Message-State: AFuF++lExdHfHy2r2e0s84CwFLo6qcT3fg9s4L0OUo70bPaJKNfiYZE8
	zM4JO20NcKTO5Z0WTPEjdqYGkFB+6pk//byAPGolBuzJq6hL7DQvrGQ2ED6qZ1hi51xIMTykyhG
	xFm5gk7D6wIZE5ew8zaHkuskHow8p5jqBy39hfuNYrWaxADdr1y3hddCDTL9rKh4=
X-Gm-Gg: AR+sD12jrYVQPJhb+gQhaLIVet9qTvSdp68s3oflVSa7GOp97uZpdtCXcY+HahWZ1h4
	Px8LsEglMC5gfrZf7l9JiTXloWzh9I+mMeMh1WvQ0tjzpRVuws6AU5qn9R0UFajR01EFgikWMt3
	tQBfbo4XHukuz2tNSjum0u1nsicwga1dzTqnTeWOhowbOKAjmIdQLMKUXZorgwSuZBdNd/fV40V
	9nHwMAz2gESXPJOYH67odL3ps6+9BYkBxcotNf/Odeqj+W+jki/YujTniDLB7F4faLDuP3lBiNy
	lpDIlkqLaB0kena+GmK6pkLDtaUCzgadafLcWnufzfO6wLXvj74Bl/EMI2k4k3cFaOERNEHqnZu
	MQ4s6lEDxfXhiJ3sWE6Drwt2vF/OzvVCeVGV5pEi9+HvLTkqGMOuzuQeQsOvRCYusdvnItQ==
X-Received: by 2002:a17:903:3243:b0:2d7:2677:4355 with SMTP id d9443c01a7336-2d7267747a2mr9960165ad.3.1787763819526;
        Wed, 26 Aug 2026 10:03:39 -0700 (PDT)
X-Received: by 2002:a17:903:3243:b0:2d7:2677:4355 with SMTP id d9443c01a7336-2d7267747a2mr9926445ad.3.1787763806509;
        Wed, 26 Aug 2026 10:03:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:52 +0530
Subject: [PATCH v6 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-2-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=2226;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=XU1ptAM6EfnwzxCKISypTLGtRTu3B+bY98zEVbWVya0=;
 b=nRTL3Gl/PRzPtuvHmkGijqsbLBwsSkFNJsrC/6RaBj8Eqzt4P2wULurs7hkAe03n1JhDZOq//
 hRYF9nz4eFDA/7aNXVlgMEAMFugpOdBb37GFCakBXzIiuq8K03X5sXH
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: WyjaFp6U_2RWQK93Y_8a5mQod9BNfCBu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX9Yv0Npfelf0M
 Ej+oApirLlT4heNjyqvDPpHgDoyBGfPJ0uNVwwVJYJzdvtw6eIWs5VX18+eiMTy9wJ6ufUXGXOq
 dre5OUUkBnvzkmaOReJ9brSoG7OcA4M=
X-Proofpoint-GUID: WyjaFp6U_2RWQK93Y_8a5mQod9BNfCBu
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8f1c79 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX77DiKVcz8ZuR
 i2+VcgyVvCaMWnaMVdM89XEicvw8r9OUwA+JvH3xnQ8QlvLBHCI8Nuh2DJ+9AUT59I30j/y8YKx
 ky74pqe+AgTrVU+P4EGp0Hh9zBLpQNO9XFiARUDWRjKSl0FBV0GmxzRhNLofCHucuaF5zEmHmC9
 SjLUeCiHjznAO0F4Da5xaa0qIKLrylFXCMH8Pmz3K6X5lXeolin3PjkcNtlTWsHuC+GKXiL/M24
 eVJZ/8TxTonCihHwtyHixBYbGorakzScvpFEC7SxTIhIrgE8ftyGinxFfYYOONT2867u/64xsJo
 m2cSCkbqvKGyANabNo3Oxughf/iRx/iwAKvFjtYlLDdlTA6GrTQfwanhZndwYZxzXBzpKGMri3k
 EL8L2NtBsOyK8IO7aq46Gr6h9eecbPI+Yp0GbfBKeU0JQ607xbKDGrhCeCiuDFfZNvFdUhMwUAE
 4MStZ8O2njHfh+KvvUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260141

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

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

