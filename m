Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29623C4B89
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362173; cv=none; b=MCV+cz8x170OJcxVg/Ez8KfDeGa/D3kx8Gur9haFbN6gxHxPoITXURAwA20NX5OPjX/53VEjfmWIsm8dtFDYpeAI3yh3gcGwUC/pDBlEJPqOtY6M8hbg2L4HVu92NKDlpI2zM+3dcDJSk5P6AGf/pqcpEswkw/6whY2OxIftQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362173; c=relaxed/simple;
	bh=OYi6f9AwLzmmNwj8v1UFVGj4qbTcQCvlFwbYa1BPWUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGT69eOipSTpnHsUUNvrhCNIhezdTbqaJM9QIcVZFzxNIl71ra+vjz9/aVmVIbzidaealjOdeOYy6tE2S4T7+835G2mg/aPAOOfNAIq0vcBW1pMhmEjnNySNqeN5TE4xD3iYpTRGnGsf1JQVyGB6vYB56ywz2e68OIx1YAJFp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxsU4qnq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuTn6lax; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxsU4qnq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuTn6lax"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SKH8890693
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FxjLgeWFi+mMGa+EL8oSeg/rTTm7+nAMX8xUxsPM/I=; b=NxsU4qnqvwXMNyw6
	iiAoXVT1pBedpGDtGNYKUbc9VdvpR+unkQmPazE8QT67JG1Srjr1QUsAFSHCtw1c
	sc1GW4KDr3TsxZEjY7cH3LhDA5xPI8SghBruDUyXZZlWapcur2nP4hiclc7SbebV
	4eAekUECUf6JXYZw+NKrg90jspWn5woZVYg2t0EtB4eQR4wQjiGB5x8Y+nssEwx/
	eTHoAmmJtgKvG8zmtET8DyXSmWfHKe9kAysaAmjeHDrG7+zQTb0FCPgkLrOYjhsL
	HDmccfEhpoVvMcpYK9qv0VXyVgtI7a7HVOW2CZQBjlB8w3OyBfNXj1LIyQCTxNV1
	FsAU0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v49ah7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 11:42:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso16523121cf.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362167; x=1786966967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FxjLgeWFi+mMGa+EL8oSeg/rTTm7+nAMX8xUxsPM/I=;
        b=fuTn6laxOi3ve+WxUD2j3+8vfyexNeQeebHWSPqceIQfD8pOzEmYd9eUXqD4eqkJP3
         pDnJPOIIxE8huPJ6GQjWiM087mI61Hu+bLpunnixzSFA8Nu3rXVvOpoaURT5F3fcrk+I
         kxY8EXAsipQ1KwszfmFTuh6Q6TOQgrC0jIb790NybkAnulcfR3rNDP5dkm48RoZojhYc
         IuAzE/h7WEmTEsaYlh9mTCJfqTbdkliQz+Jpz7sYUXVe3rLH7hgfFoktodFP+SlzLtFM
         7Eit/bE/1RJaaFtMQf8pu1iZ5RDyL/6hnbo+lBUyb9qvJ0WNgOJ+olXh3o0yB+daOjA9
         xAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362167; x=1786966967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FxjLgeWFi+mMGa+EL8oSeg/rTTm7+nAMX8xUxsPM/I=;
        b=fO30d2KQdivHneUuzCyDy2RweT7dZzluhrCy68cXj0e4XOnhdDXLVMD36k6GCGGyCp
         hu9hO09hcEHnuIwmWVItWBF4ENnLJ8np+HoTu10hYr5nHhOg9CiwJuZM45dlOvKA3llD
         Eg5jSZAMTkYhWsJ5uJwh5J71SzoH6HFN7DZVtl1otTRfe9Y3MfKZgnKSb1HtNDc/DihN
         B6ZFgjKD4T79u3aTGYFXK55xMAJGzLw1ZzgHTGUknOBxeTEdp7tCCoASWjBQaLwU1yhx
         VqYU/p6NMNan9OZoL4UBOkctgq90NlS6GL/Pnh7BOIzSWvUxUq4696JlDgVvRqhuO1KW
         9FCA==
X-Forwarded-Encrypted: i=1; AHgh+RqJkTkjLSZcAtQH4OZt/pVTr9WI8p/p76PN2GJvtFWAe+TGq67skwoy/vO/i5D34Ccd5xNVY5hNCnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0AGjSVafIQWeRzWJlPvXMy14aV3QdIk7MRgmgqXQszt2Eaik
	pg0DzaZlfl2oVUBeCHDrxXv3PDbMRzI91bUvmFpuL4V09yr2joVjlnwGUecepxirXVA3kU8oHVI
	eZuUEWGfl+wiScStJBtjaHFZH2gDebb2JruvwjALZoMGqdvzg0hUgXKWfFTAuIS8=
X-Gm-Gg: AR+sD12Plz6RZtERCF6uRDi4TOmuSsv/kcN7zCqbW17hVKxBazq7b4VlmmQIWQweA1n
	Wd728nQuUVM/i4Z61d1ztNqBNVyEaTuWK/hTzGI6BrEGeB4eNplTgGpvEjry+8Be04ZMr4kGp9F
	Be45qokyWn/MZykLzG4adEeRiQxONwP2vqGsvXv4ybgSep1Y9OqnGYUxf7WFVBUXy/1XzLM6eUO
	asaGQlSw6YH287cjCj43RGtD6Wk36IakxFYQPownjbmpemCDJKYFaarCsckaNRZ91TGjWCj3BtE
	SIUJDb7CXXdAcAmHIaXgyBcewVb8s6vteyscJp/c2chuKsldHybkU61WGcTn1ZGx36o6sCx5azm
	D+/K6e0TUgG0/tVf53qKvIalrF3Hnj+tyTcGfpgLz8NuOqZzwaCP9nLmIaJCjHHlKaRAxAQRcu6
	/MzwcJeFQ69ZOWZA==
X-Received: by 2002:a05:622a:54c:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52ce602d792mr424280081cf.17.1786362167325;
        Mon, 10 Aug 2026 04:42:47 -0700 (PDT)
X-Received: by 2002:a05:622a:54c:b0:51c:84f0:d903 with SMTP id d75a77b69052e-52ce602d792mr424279521cf.17.1786362166849;
        Mon, 10 Aug 2026 04:42:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:36 +0300
Subject: [PATCH 06/10] phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1 field
 masks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-6-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2968;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OYi6f9AwLzmmNwj8v1UFVGj4qbTcQCvlFwbYa1BPWUY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkpMNvA6X2ZsjyRRyaPajy4vJi9r0w3Q44Ay
 a9G3PnWc1KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KQAKCRCLPIo+Aiko
 1UBECACicegOzQiz81YXo3vYqiF0fPAPMa2BzBnAFEX+KstxyrUSudkiqn6Y/sDQaqhDkIQxTdo
 MxvfkWbq1JivxOMjIaFCQStRJYhtOVDg7aLug5WBAmPThycC5Hsx+9Izhe3BzheQLZCHdlcJvgF
 J8p5g8HCJI9A2/9bR+RniDxTpdG3uiFcr2KLsqERp8JGLZswcb2dS7e/6U/2uNocIqoLO9xlgWS
 JHmz55oJstlXZG3BRF0G6Oks6ttAgJhdHCE6cy0CLjYrhJa/7YIeOVgzwVB3LXi0QJD5VlidaNw
 /d+4cLLtbiHe4FacTsE+yoUaoc9QVB3glwhq5SliODxN5BTs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eyHaeDXcUpA98rl_XdiHuDEopRJpVJKM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXx1vi02qGEghU
 nB5+OzXFGkpd/zDTHpIRr8w6h0K+kd5G3Mf4qLuyqQG0qLU4IyH2+fEF3H4ltZsJFZaFrxHKsVr
 MbI1eJlBzmkbaQjaOUg6ZBlHuPwa0hY=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79b937 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=suuTTCwZaWWrlTMXb9wA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX52eHiFUVmxpW
 cF681bhJh7FPRCOpjwmgbS2xuyEpl0R7vL/5rX/M7kbN/eSdoc/Lbh+LRTQXah3UTQdfJBcCm+v
 GUaFRwI1zNOhMbN4WfxWrWzGDHrTKGqSnm4Q3vJO5hLVgTzRilXT0pLg+hA7gkWWCa5lh31L/0e
 GFBBPRj1jGHiZnvGtirPDgamcNyRjtXyF95h1sVY7Zif/8ey26gcpOqrKBk68h3FZkBRxli9/Pb
 J6DKMEtMzVKrpeXxaaBwZXkhKAqSZIxILNUdr90gvc2Z0GGbeSPQJukYqBXhxLdy8Wxoh8GIn6v
 ognpKn5TwsJvQ3+L/PIn0VR8OScUa05VYbhMNx6VgaZdGi/sStzQ0lanwhASoPgkYXcBtNfhZjI
 Vg0lisNfgz4zit+hrhwTD9ICh/YmPmvL/vITEaDKBMugLjrpFA9zltB6VtYu/Z18JkIAmqqXZSD
 Vnz8L+TylHR446JqifA==
X-Proofpoint-GUID: eyHaeDXcUpA98rl_XdiHuDEopRJpVJKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100102

Each of the PHY_PARAM_CTRL1 field masks extends one bit below its
documented field: TX_FULL_SWING [26:20] is coded as GENMASK(26, 19),
TX_DEEMPH_6DB [19:14] as GENMASK(19, 13), TX_DEEMPH_3_5DB [13:8] as
GENMASK(13, 7) and LOS_BIAS [7:3] as GENMASK(7, 2). Also, the field
described as LOS_BIAS in reality is called LOS_LEVEL. FIELD_PREP against
these masks places every value one bit short of its field, so the
programmed swing/de-emphasis/LOS parameters land shifted and the
neighbouring fields are corrupted; the masked write-readback in the SS
PHY init reports 'write: ... to QSCRATCH: 4 FAILED'.

Align the masks with the documented field positions.

Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index cf77e0a66e20..3d3e9d6da298 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -68,15 +68,17 @@
 #define SSPHY_MPLL_VALUE		0
 
 /* QSCRATCH PHY_PARAM_CTRL1 fields */
-#define PHY_PARAM_CTRL1_TX_FULL_SWING_MASK	GENMASK(26, 19)
-#define PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK	GENMASK(19, 13)
-#define PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK	GENMASK(13, 7)
-#define PHY_PARAM_CTRL1_LOS_BIAS_MASK		GENMASK(7, 2)
+#define PHY_PARAM_CTRL1_TX_FULL_SWING_MASK	GENMASK(26, 20)
+#define PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK	GENMASK(19, 14)
+#define PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK	GENMASK(13, 8)
+#define PHY_PARAM_CTRL1_LOS_LEVEL_MASK		GENMASK(7, 3)
+#define PHY_PARAM_CTRL1_LOS_BIAS_MASK		GENMASK(2, 0)
 
 #define PHY_PARAM_CTRL1_MASK				\
 		(PHY_PARAM_CTRL1_TX_FULL_SWING_MASK |	\
 		 PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK |	\
 		 PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK |	\
+		 PHY_PARAM_CTRL1_LOS_LEVEL_MASK | \
 		 PHY_PARAM_CTRL1_LOS_BIAS_MASK)
 
 #define PHY_PARAM_CTRL1_TX_FULL_SWING(x)	\
@@ -85,6 +87,8 @@
 		FIELD_PREP(PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK, (x))
 #define PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(x)	\
 		FIELD_PREP(PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK, x)
+#define PHY_PARAM_CTRL1_LOS_LEVEL(x)	\
+		FIELD_PREP(PHY_PARAM_CTRL1_LOS_LEVEL_MASK, (x))
 #define PHY_PARAM_CTRL1_LOS_BIAS(x)	\
 		FIELD_PREP(PHY_PARAM_CTRL1_LOS_BIAS_MASK, (x))
 
@@ -436,7 +440,8 @@ static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
 	data |= PHY_PARAM_CTRL1_TX_FULL_SWING(0x6e) |
 		PHY_PARAM_CTRL1_TX_DEEMPH_6DB(0x20) |
 		PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(phy_dwc3->tx_deamp_3_5db) |
-		PHY_PARAM_CTRL1_LOS_BIAS(0x9);
+		PHY_PARAM_CTRL1_LOS_LEVEL(0x9) |
+		PHY_PARAM_CTRL1_LOS_BIAS(0x0);
 
 	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_PARAM_CTRL_1,
 			       PHY_PARAM_CTRL1_MASK, data);

-- 
2.47.3

