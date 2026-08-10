Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E407E416115
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376545; cv=none; b=uL2PWXnUsC0j4slV8zyBZgoPOfRcjHpCqcFjPtIfedX6HUb8o17uddc2bXlM8ehA2Zt28QJ+xvJa2XvA4U7PLjQfTG6RpN7t6ovlS4DTyZBI4lTcdLxXgFAkBbp+m2pg0LFX2z+GTnh37qf4HWIURanxB9gQZVT3f63KFBiHIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376545; c=relaxed/simple;
	bh=TkrMMSM5qDrBbFDzv/+VaChi5RjS9zkmjtBE4vr35Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZ1WVnlcVbOgkRK8cHuhipP/V9peTWrhMW/ulQAiO+5tAPbtJoACXZSOW1KmqGksvjiuiDJ/waaugVRZRpyqelDyLnr/2hg/c0/brDQHa3as3Q00gS6iWLXa/lkowlSgvhBYhZLX7iMteU9kN+qJ+VntupjkflPQyEomPjYvFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeS01/Ct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIpjQuXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeS01/Ct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIpjQuXD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWZW81754488
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=; b=AeS01/Ct5gaVVxuL
	BGhfFfceoK4d/rRNfiK6ZSBPbIpCmCzbID+VKl8ITCe0wUSneI9auDdnRDDCCxnL
	qWwlYHDL5E9bwviIOlH0k/YWs17jIxRilWjf7FFiABa5ps70gB3DNSl6kqjyICT0
	42xgyUXtCx19u+YkHhjfC/+SiHf6UQJmCQ2yGgwUuCsrQ2ACF1pxLEna9abtBIMC
	fWV/IyyDRRiI5M0aZgOb0HaYD/J7lIK2aha2Dik8zf3jWDjf27XBW0bmDFH3mMmP
	r4la1VhTPJ53QWl8P6mgI+hRNBfeM02sX5PPWpygAtInFV94rLSqqAgBHRHhryZ/
	UaF/PQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4aa8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so46201061cf.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376541; x=1786981341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=;
        b=OIpjQuXD2oVjibNDNjZb5aFeg7LEYm5UJY3rdPzMLNIBDQoHv51y4up3cQkw3q3NDF
         fhbciJ6c8jV9HzU79dHaVu1Bw1dTEvEEGTR5guvkCGNaI4bsvhrGd8qF93NNHkWbImzj
         uMFHpOwncS10JOSCHywRct5zAhNL/PZpQpa6WEKcDdWjOcuo9bLfO6wc0yxnFjqfqUVP
         ODrVgzl5pxrNkPFireImN8JgArLlUviIHGTIjYH5tR9WBvDOh4AV2ihrjvvAX5aYV1oP
         vPGctcfbkQe5CcoE0gqUbyRKMayq2QE93tZtCnZmRUBEfLOYPAKGD6iPwchyu2mnbAXw
         l7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376541; x=1786981341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ol8WpcEjj06q3ha1b2ZdRY+l9xpEFrE+uyJaWfhLJI=;
        b=D3/PyYgZZN57/Q80kmZAJj0+q/V0WM5mjFoMz9AFv1YVR0ImrGn8JiR4cNwVsPRrsl
         FL48Mcv+eYhUPKPz1ZmN4toXErejGatlDGg0Mn6H0kcX49DogL7sm3NKZu+aCdGYc6uO
         QPNR0H8Z5D2sK1CjTXm1oC4KU4/guc1mNnDjKcnb24pl/Pv2UVvREADolpmPUnCUgm/H
         Dpxghgqh2X/xXsnpQXjhK9z/D9nHJ6F9hMEkUGqWDMun/tlecwXd/5YbF9zAfzq5yfCk
         LTIte8PP/E3N+ZkzRHRTLZIBden1Vr/G6GMOJ1CDUrpDAYqUsJJmjaZ4sH9lsNO85mcd
         ONuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro49r+bl9uRe3UBk8jNX/irMCOfOuXdQ3E1SRPcO2aiAPGhOW4KwWb2B2xC7sDQ15pivv98X4OjOVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oUA31yRnroNqgEW6Sz91l+LKKLJ5kU4f8/KpSRiRiVcnsV4o
	QFLXmm6BB2S4fvRdR5fh5TPE30g34kFl8TdHTEYmbiibb5LPlDe/UPXUGkerG5+BqTBAvceuQL/
	HwKlxU+y+99RalyQWgGxqyCJmZ8RMlXue/8DqtRUf3/hzDeRugoAmX1a/JMiSe4E=
X-Gm-Gg: AR+sD13IWn1cFUWlg7oQ3EmK6b1bBiZDDhjflIMU2aP0KlMwfyzOvjxJDM50MUfvYnq
	p2/HjhRRbe7ZD3ScENzJSuHD1/CVEYYJrCqxzvE+jm4c+gkNdUkyBOWLSnxnFNEA3XKHnS4tjTE
	By3lwAxbYdrQXZDPxCoS/1zk4LLQytXjPuOLin26Zy0OC9i29TOdKkfCgzwVb2Lrxzba+EXL8fc
	tSWaZ+zoliZHspR6Pwb3jxnWmpnb6ZpVfFYkzPR/7zrHFJEwdhT1j07R3zi82qSRzePODRhf6mx
	hlEsHUzH8Y9T5/WAKsUqUQFJsWP8GQZgYCybHCSSsHEcOP+W3RlJVY3Ni0yEzWdHRCd3M5YKvRw
	vunj0lukHqFm5SXceDspPERHwsums+Lr+tOtGRiRPBeR0JqtsyUBj5fZoAYW4yEKe/D1f547q5q
	PLCFKAOBFyGp09zA==
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr252033421cf.41.1786376540633;
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr252032531cf.41.1786376540166;
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:08 +0300
Subject: [PATCH 04/10] phy: qcom-usb-hsic: engage HSIC mode from
 phy_calibrate()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TkrMMSM5qDrBbFDzv/+VaChi5RjS9zkmjtBE4vr35Do=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQhLz1oU44aOjR1xi5aFB9HrDQMTdOWypAd
 O9oOzFRa32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1WzIB/wPUZAdSQaPXXJvH1bFmntgi2oxFK1T9jsaAfhtC18IWwtDkzXwfNlhfk3AR0XZmGY5UiP
 jjQmoXwuwt/VtjrilmmUZx+u6hDAXj0Zr9EXcb9Fo3CzLGNTgRNxoXu6V3Z+7f95saFMXWBPRS1
 iFeT+5aDaRKCydJtyiI83UIVsC5DaW4p12w/1A8f3yxDD3KZayrQ57H5az4GkXml707CRQxLm4W
 pJ2Wp+9PXIMGEA9EuoqvAdtxrvhMdgmAz7JqCU2sd/YbFJO0ls1bXVkQOmqcuno1MxGNGc6qfXa
 nyCZ/v/i0ylhMp2Z/RBbFkaPoFNGFX930//CM7CRhxNKITVX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HxNefNp_xiyEu1xaAyOtJzKJY509BTcG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX1pvouzBs0EiP
 lBTvliAnLj24ofEmx8AOIgFzLg1hJpkvWCItBAclz5KW369Zdo4uuexepIzcY7GXck5tGTTeyRa
 W67YOLQf6bA5R6RtMqSaiIPWOZq3nFY=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79f15d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0xrA-bSJ-g1zX4FYa4YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX/hVytHz4jvat
 7aHB1c8qKNawWuAYvvFZCOTr/04xIA5a5xTCjHcjYpCRr6jOwfCxTKncX32PKknVovpJCBC63/M
 iT3lEL+rwWVOFQzkFMIpaduCzmbman8fijZVSeRD9teYKn4R1WdfR57YArjdBYdic/KQBYLfCtl
 Y173g6SE+zOGG9wyWXc77FH0fCQ0U0pDjggsS7AXkDU/opwhyJmgXzO9i8SWg8s33IJsimXHvpa
 IKjYeCnZVfzOvq8epuenD1kZBtzwjt5XilS3h00dQYeiT9qENrNWb4FN6GQOpisd+C2KvHZ8ELO
 hMitWCdRfx0tAAMVYETdKHuVa9e4b7IAW5qQHEa164yzoObkDttJ2JsfX6u5DNI9p5tDs0m00Rw
 PBRvePBuDvTvvcQfy8yaFiyuPbbIm45TyFCnFFu7B10Edus6KIh9asdvMHRGrxNuUn7VtgDbCHp
 NnjSSq7WWgdZIInYdKw==
X-Proofpoint-GUID: HxNefNp_xiyEu1xaAyOtJzKJY509BTcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100135

The PHY power-on sequence ends by engaging HSIC mode. With chipidea,
power-on runs before the host is started, and the HSIC connect of an
already-present device is latched at the moment HSIC mode is engaged:
performed before the host runs (and before an onboard hub is taken out
of reset), the connect is lost and the device is never seen. This is
why the APQ8074 dragonboard USB4604 hub never enumerated on mainline
while the vendor kernel - which performs the whole PHY sequence after
usb_add_hcd() - sees it on every boot.

Keep the calibration setup and the pad mux in power-on, and move the
HSIC mode enable (and the auto-resume disable) into the calibrate op,
which the chipidea host now invokes after the host is up and the
onboard device reset has been released.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index b670ec364a2d..e0637522eb82 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -63,17 +63,6 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 	}
 
 	ret = pinctrl_select_state(uphy->pctl, pins_default);
-	if (ret)
-		goto err_ulpi;
-
-	 /* Enable HSIC mode in HSIC_CFG register */
-	ret = ulpi_write(ulpi, ULPI_SET(ULPI_HSIC_CFG), 0x01);
-	if (ret)
-		goto err_ulpi;
-
-	/* Disable auto-resume */
-	ret = ulpi_write(ulpi, ULPI_CLR(ULPI_IFC_CTRL),
-			 ULPI_IFC_CTRL_AUTORESUME);
 	if (ret)
 		goto err_ulpi;
 
@@ -85,6 +74,26 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int qcom_usb_hsic_phy_calibrate(struct phy *phy)
+{
+	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
+	struct ulpi *ulpi = uphy->ulpi;
+	int ret;
+
+	/*
+	 * Engage HSIC mode only now, with the host running and the
+	 * downstream device out of reset: the connect is latched at this
+	 * point, and a hub that has already booted asserts it right away.
+	 */
+	ret = ulpi_write(ulpi, ULPI_SET(ULPI_HSIC_CFG), 0x01);
+	if (ret)
+		return ret;
+
+	/* Disable auto-resume */
+	return ulpi_write(ulpi, ULPI_CLR(ULPI_IFC_CTRL),
+			  ULPI_IFC_CTRL_AUTORESUME);
+}
+
 static int qcom_usb_hsic_phy_power_off(struct phy *phy)
 {
 	struct qcom_usb_hsic_phy *uphy = phy_get_drvdata(phy);
@@ -97,6 +106,7 @@ static int qcom_usb_hsic_phy_power_off(struct phy *phy)
 
 static const struct phy_ops qcom_usb_hsic_phy_ops = {
 	.power_on = qcom_usb_hsic_phy_power_on,
+	.calibrate = qcom_usb_hsic_phy_calibrate,
 	.power_off = qcom_usb_hsic_phy_power_off,
 	.owner = THIS_MODULE,
 };

-- 
2.47.3

