Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8BD3F23BE
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310482; cv=none; b=LM9nD9qFZa/PCZrMUkJFaoSYAmVvfbQqwZbu1MjBzxpuIlvhDVEiLpI3l5jlyTp1rZbgixe23bFQ4HEKCwuWvZB79ZJ/iGGSpBCqTbxNDA/YJtliGSVmmmdt5DI4rRAiK0L0chIOhhHlnUPjAVmoouccddBPm/z3pM8KAI76X48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310482; c=relaxed/simple;
	bh=jS28VZk0Rau0JqBMt8Al/jaaN4+ZOI4m8Zl8cLC3QjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXA4MqDRkMcGTJRB4cFWugNcXrfTberR9XdRCPoD8fDLKNsYGtQcp927iMfFNMH9m91QHRQImUfmq4CPa6wWNVD7/OcGjV7PAIn6wfRfz3XXCVF+uyVDmiVM8c2ymArUNNuuyRaegxXZt+v/39KBOL3OUXvcoq21kseeM1qXhCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy8yQlUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=El1bFp07; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy8yQlUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="El1bFp07"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DDxxB92786170
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhPA2j4mqcFAfYzRHFfpXK69gK6PZSz1XQZ4NKgDFZU=; b=Uy8yQlUbf1gUF+iB
	+71bPwglz9o2s031kIPR1csnonmNmCKJanV+Y+744AgEEMX/bnT/MyATTZ3QLlWR
	cBQpOTYOdJkmhstIV9XXPHY1SxKJgsbdlusXQyWMaS2ewBTCJmhuz5E1PGnj0HBe
	QuNichSDYBCAA2Ce5XEYTQck9EdcLtFrQr8bdd31IKiV8thAjszExmDlH9YgNcoP
	gqhT2Ej3s9zzw8drIoBIF7B8PwZeZJgEa5ZNlTT+P4w96iZwgMWtUEfAWZ495ink
	SD50lkv9SnleRQHvYxh4osSUyeI+ZGBS0pVCOJ7Mf4uGrjnkilVj1J7ux3hZxcS1
	7Xm0bw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbh7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso2993232a91.0
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310478; x=1789915278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhPA2j4mqcFAfYzRHFfpXK69gK6PZSz1XQZ4NKgDFZU=;
        b=El1bFp07kqvY86/mrduYdBySpudcOadM7uPiC4id5KZUXYIpJQuMgL/s8x/nn8u+uN
         tszNdoivUXGWNrdlqikE9FDe8n3ec+X8iTEu8pocAIZRMhQtp1He0S+8sLnv3eyWFEIZ
         DcV4Dg/+Iyn6dbAPLb0dOXo2+C+hTD0jV6jjgJhlNN7iA/yWoiSluIZps8qgL98RcEKg
         llmBrA/GNLiq00D3Eg4GNHu+IvGN2CRrGYFXpdimiof6RMU//GnvwDmnQ9HcjJPLe2F1
         C0m0FtDjCtMCmmfDNeL9Fmxo096qp+Eq6Ljk+NJgR2Dv9wzs0kaLOyz0JoXmUy/2JdZa
         Wqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310478; x=1789915278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhPA2j4mqcFAfYzRHFfpXK69gK6PZSz1XQZ4NKgDFZU=;
        b=GG/6Z+XsS3npbqo9k6Bp3JEJHIGTUGh0hPkczRRoww3TqW+KDXmNwM+pQw7+dRbK/b
         QMSRY5/Rz/R1uudJp7FkkEHDqY/Wn/+DfJBkD7MOu9U41MB0sKWwaeBlQq9gzEZ4bHEG
         TfEvq+Gd9j5zGMZmTK2ChEHysV9KlEbZScq+LKr4loz5z6K10eySVYRRO5pElEEw+j5E
         mf49277MobwvZe3Qpd3EIlMWNDZsrusH9Vbxk0DjU7dSYjKL02AIbp9edNjT6NqsmsL8
         dTY7Hu/2KoFMjc2HCHXXglIz8e3x4hiGctzadFA1ey7xDch2RYAp/XZyCnB06Ro7dnNj
         FyfQ==
X-Forwarded-Encrypted: i=1; AKwUvBykmF0yIoz1lUcygyEAaGmOcBIvwX5ubTsi8pr96NIzYYbv6i9OnOZ8LEXzF4SAzfp412ys9k4cuyo=@vger.kernel.org
X-Gm-Message-State: AFuF++kWDPa/no31a5jnkh4W/G1AtgHW/DVNDJ2pKak4M2tNikkA4yNP
	1gfu+YxMOhyaMZDFTOsXfwkxA5iNLgd6o3ll2TYTBohaC3ClChGh57b4PxfQ1nC251VePvG8dlR
	/f3zLos762wp9kLVPY/2NGrpVqF3B4PKJ+K8FXX92X8hkmrmLuYqa5CPf101myqc=
X-Gm-Gg: AYBFou1QnlS2PKFf1QfJsrdiSuQusxkK60y/gA1I60TMrOpdFyPk1QH/AotohaOUaxv
	HcdfrllTM2QzaF6zC0/6/zNzE3fk+qFY7wHfWSYGqFWngZxd2bOv5dZyhVnzqT0rVA/It7m2B9e
	YTHFVoUL6QyrVCgrZBiLLr9Wm9xPxnKJf/RSsu1bBd17tkE9it4C6IpYcxq96pBFbIukxFLJ56t
	olFUmxTToHiCvRVzf4MKFTdIXvFTp7e2n4rb5jlfpVZ2Q7sIrvJHKeop6B6Uvn746Kh6Ekvvmp3
	egURXALMxkKIOiNSzXsWB6wYWg3bghpo5Fbszrlcx78mFCxiMBxkpUp1jtbFaFntB8fMyKJXNx3
	AyxhWAdG/1LuwG/PaGxyjyTQD0eCRikIxB3C1EBLNVb3+T/cMq3rLCJNz9Qv/VUn7SaVsqQ==
X-Received: by 2002:a17:90b:2f03:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39d9c21b37bmr23537021a91.18.1789310478510;
        Sun, 13 Sep 2026 07:41:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2f03:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39d9c21b37bmr23536970a91.18.1789310478080;
        Sun, 13 Sep 2026 07:41:18 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:17 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:47 +0530
Subject: [PATCH v8 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-4-0f505b9c394b@oss.qualcomm.com>
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
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=1075;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=jS28VZk0Rau0JqBMt8Al/jaaN4+ZOI4m8Zl8cLC3QjM=;
 b=p47Uw+B6PdI0txbmU/WyZOWDfgwfIDM2jiEHu7HO4vSu8Ia0F8aTmiV5xA/VOh5A1Ijo+xmlf
 VOXJgMG4uwIDLZGO0TddxHW2apN7kUokmOu779N9gen8REScYeh4SWa
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXyA+VGzU/ew4Y
 u+qyh8PIv1bB0zGEIgV7TNepvBwH3hOXeibXuatE0zZdbPnuBhzwaViW8st4Mj6rNbvGK7T6+0Y
 nYbcmxSfhftt/mff81+rokmI5wQSPvA=
X-Proofpoint-GUID: BolulHooogzMnoZBm9LswAWJEn93QFr4
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6b60f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=2OgWd8xqfRB7MZEj-yQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: BolulHooogzMnoZBm9LswAWJEn93QFr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX1qRcZ+j7D3OM
 Vl6i9oDWyACf79/T1YLu8FsUzrbh0dkcT/AjqZiFSj/TRGi6NuwzORAAlsna9sg8GVGAN+1LEmY
 Jll1nYe7Yc8mN5fEDE+8VY9gFYc0KlXtbxtQctxas8zAFpp4VG9xmUd2I6pwGtmyhYFJrzy7jLU
 caedcfhKyqj+PQ1RIWmtALwa48qB/o8rmxcssqW79xlNe7M7how/WYyHofcafjxpoGSnxNCgRge
 Z6Pxwf1+ESR4B+1P+5TGXvj4gvk9QqdYk9cDvPIpv455kQmIAIPTuMGOa6StpVMJBbgKwaQOeZ/
 PK0Npdp67eSm/Otc5k2BbGDGxqNNRH99D9DJpiY5wELuqu22yLkbslTDD+kC56xNq7GEzFC5roj
 Ot12yvedvKlP1s024m5l1Zu6xNyOo6zBYSZIJmu9qytAZqoqnYXhQ1Ws5Hi4fDxL+jwHciS8bL7
 mBhTuwN6aqe99QIyfuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130210

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..72fa71003fd9 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -277,6 +277,8 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->phy),
 				     "failed to create phy\n");
 
+	phy_set_type(phy->phy, PHY_TYPE_EUSB2);
+
 	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
 					    m31_eusb_phy_vregs, &phy->vregs);
 	if (ret)

-- 
2.34.1

