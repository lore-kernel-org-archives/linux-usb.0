Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65643BDB6
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803168; cv=none; b=paLNtEx6tPpdhMd0jHzjAJX9HIfCQ3+yY/KzrlG5IaAXY3pAsdheSPBLbR0yoRdSiJFKjmpn1zXUll6Lp+8s1pKweKtQkGbrqstCgsT+ce/Earu1hGDVgoIwragLwX7k6N4yZe1j1bM99C3O3FDiI6YFQbd9jD20+Bcsr+9DFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803168; c=relaxed/simple;
	bh=faea8Mbb2kXKgIHJRv7HjgYpvWzfWD9zJupPwvcdcrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehKeN33QtnbMK0LRsrC98poOV07fcNQVPrTbw6SXSz6R9C3CBV5J5NaEpqqv2AEFEVj+hSgzZ3u0nf4PEcibc258x4Ghdz0hE69Rgu9SSkjT2HX4vnZjC4RpnV9nyY9rVa6i6hcq8eOF+YNaxwb2rAngbXVTmyy8b0F2ptcNudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQ53gVRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fURkg4kf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQ53gVRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fURkg4kf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXJN3648564
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCiwavlWx7fmZTlnPc68q9XviW9MLGTcHd39AeRwIB8=; b=kQ53gVRKeEpDfn8u
	Wr1Dd1vXBM8NgI2o91cavyKGbL6+KIZ3j4fT1bX6GSLjAIp3cGY8kyJCpfOR84gm
	4/GKcYA0Q6Aj+9MH6fPKtclxQ6yL9zMsDJYNR7IzTDAini6uBnTPRLlvQf4E2SK5
	vmeps3KA7YXnEXa+8GgH6Nx7ULG/D3RQCkm+WH3V79h8LhlBvi67CyqDhv9wngSt
	elmRTlmnnJw4yOlhiCE/pqsujxJJhe6ysVuegyIeQA928NkHAMbppSWmk7cgn18g
	OlFNQrWkp/rdjJXIgG4/9lfcptipuiMzyGDCjGsoPwYMxZ5fmH1Nz2k8w8QogY3L
	TgRO6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jjp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso613952b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803166; x=1785407966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCiwavlWx7fmZTlnPc68q9XviW9MLGTcHd39AeRwIB8=;
        b=fURkg4kftUQqwrMoU+aiIDRvpr4m1aJhNfae8po8HebuyjlSLRVaAxSanS7YOxFjmU
         olQcLii6hLoZImXs26+labjtWKlNg8QVht+s1Rve08/Lb/32A+2yn8oIUJEQNfmHTlnG
         38OE9ZyrPmx5rxREGHGTmRVEn9fuQeCtHCt+reHGaqQKN4myg0Jz/EvQdqnRp4+8+h2N
         MSJxTlMbq8BibTDqEaOdft9DtzBVrf9GINHxOy8cuJq7GqZk7OQ9LlcepXLCjSQbkTb/
         W+6reVwN8q7mG08wD6vEIGmCcXMgqKx2Upci0cRqVT4OuLUpPqq3dBoH3XyrolbhblOr
         S+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803166; x=1785407966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCiwavlWx7fmZTlnPc68q9XviW9MLGTcHd39AeRwIB8=;
        b=Lfjb/S52V6/yxWtcpsKr9Wvo5O4lT/9j3DrWW6o4kFQ8RorIfgutknl/ZRU7g+QFy3
         3RGmvUHmgBJ/jJvVdgArkhFPcKjuueOv8WkVWzhquRS0xKGV5oBSxXsnlo/SqV6EKTPQ
         +08Qyo3VvHxzvxS5MgJ4epVv4vk0GvWa2gHZaRvji5YIngf4ezPK5qw2RXOqPoKjb3uw
         fZI4Rg4RQGFJpVIscWRwl7xzCkaWmQICZ4csENO8R8MerMdNIB3q9jGuc/NSg7ig/vEX
         kRmfoN7BLhk6lYkdCR/2w8mz6xTW1okg8bfWSLmx1eZAJp6a4YxzCJXK4Bpki+LtHViK
         O7gQ==
X-Forwarded-Encrypted: i=1; AHgh+RoflaokxGUThfK5pYjR65+x4XWmRoo785CJBQdzo7fpN6f8h42xBwImKa7fpKhfBfb3E7u5lCNXEFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3jihacdjdBEOYysHQ1I4MA4q5qXr8vVWEDYr9C7/XYEuK9LZK
	NX4bDhec1ZRiqWXJEASUChX9rSf/Y5CJyWGrEb6GWrl1Wcqb1uNXCttpZb1iCZVP5IZ7VicXZvH
	DZypHJA1w6gxD3dId2w/gcvlwcK70VS+CsQhyE05YnpOFvBkSFz8/k4AAUtznn9A=
X-Gm-Gg: AR+sD10N4pga7FMyxUopy4vMkAZfgO38B2McUPJ928yWMXS3qp1vnMlC7kW8GJXjIeO
	aBV9n5KfynXagl3JEDPbfxwupwRpMh4x7OvfCW0ytDJGtT+GSaCQ4A8WpnyTNWo29h697ehPXS7
	aXNO8fsrFLokXi4W/S4vSkBZxD4hgV8ajfP0nDQzTklxPSTnvPIHIYgyPgWdb2+g0et9X4+G3SA
	1lSDWE0/q0RV+G6OfRuRsAug76TecNWQFVZTz9com/dP58vK3tZEJxcjD0T4soWpNZU48cQawE6
	qA3g4AIA5roJ1cRJM5UfvnOmgsVOdwkBrBfNahJtVEFlG+yyXo8ywxvLdUsapEkRwpFU2Jkxcru
	OnD6P6mLnQm0lDN/+pAFxfaZJwKpwdZhHngykKt5Fcy6YlCrjAPzQG8GvH11mUW2o4CN+Cg==
X-Received: by 2002:a05:6a00:428d:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84e2b7fd971mr2755407b3a.6.1784803165758;
        Thu, 23 Jul 2026 03:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:428d:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84e2b7fd971mr2755375b3a.6.1784803165175;
        Thu, 23 Jul 2026 03:39:25 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:24 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:05 +0530
Subject: [PATCH v5 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=2137;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=faea8Mbb2kXKgIHJRv7HjgYpvWzfWD9zJupPwvcdcrg=;
 b=fEMu9zZnFd3/YJy6BMGAe8bE3WOzBECRnZpms5zx4J/LBjcblGjKYuZa6Ifl1BByEOWU+9ZsU
 ih7iU/m81S4DMESCtDpdZbTpwBohgm3L41WrCyx4tvQykIVi8shv6uY
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: EP_ud9NAiu0V2exztHzR-8mEjRHmMVGI
X-Proofpoint-ORIG-GUID: EP_ud9NAiu0V2exztHzR-8mEjRHmMVGI
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61ef5e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sXPWvSmTxj0M_2YBHNwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX737TGDict+HH
 IYUZBO6bgNyCjdvwrPwuzy9kBYXABkcoPij+NOnZVLrxw1k/TK6nsQCjh5pAZnkpiiPRxXARGJ2
 NucxDUJocOtnccA+ABklHqWjjHgj4RU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX2/cITnBLdtZV
 IFHZscMsnQg4EEXmdJfMSZZRspaTiH6E8+ZylJL1ZZ3vDF9SSqj8M2hfQey4QkIPDOkfbaLxueA
 lK/1+GXkicdzb+OfiaZ8eCEbgb2MxWmXYkL0B7udAqN7zzPCQy24eYTNaRV/TV0FSd3GmnIKLyJ
 lH/CrDQDG18lzwKf6L9x+lJQvcP8feRP2bPRWQOr3iACJ8bvwN00S7ulF6ET5Y2eseYJD2eKJVD
 wYeoG7spgGoBmGfbUuSoDVNdJxlWESXeR+MzF9X0MFz4dsGNs65Gw4Blo7EWtC0mjyYZUdxEUfa
 nnZ1Ga4yrsd1ub7nl/LGceRjnJM768sHMaKmzpl+qNexyityc5dqtZqveYsb5ijT7Jcwf378F/E
 cSZd/Xsi7C+yAa5yXr7uIaast98mPIRv0USHX15jZz0nUA5vJRw8PVbgi9lmfz8nBV0ScK/Ek/u
 e/LfRDh8g85a9HtjJbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode). Add
support to cache the PHY_TYPE and add the following helpers:

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

