Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502D84AF69C
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622176; cv=none; b=sU+vZhotb7Hs4KnIEgbREwoM7INzu8elbbRc+UEG7hag3bFt3KSb2R7HRqEkh8ndYYbhv/lAnLIf9cBBNb+53waVs6FAL6KGpwBU3KTOPr0NjGstFYCmzQS4t2VlGf90uHOtNIC4f/iRBo6M0jSPZQaYb/B7WbP+w9rEL6Q+sDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622176; c=relaxed/simple;
	bh=ny6Hrk/6zrJ+j5PBR/sQwQVZSTpedg6BrsNkeWMaR/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpYt7E2CDqs1+xQKO5kSnk9jIDEH+H/69pwN3ceWPU1KDPxevcjQDeUkfeyF8R2WO43yOdkd42oWwmHqB1SC9QbE2fe+pNsK0vIPS62yAvTa+f6H6ICi/MGkq07/WXgCA7RdaE7fdV6Zy9Zqj7yjY+KySjGtroy9o0OQQMU7jq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZsaroV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W95cxljI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZsaroV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W95cxljI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685EhrqD2002929
	for <linux-usb@vger.kernel.org>; Sat, 5 Sep 2026 15:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhDPHYvbCWK+ZkvP3pGp1ZgPvAm0ynGerHy69+0k/2k=; b=AZsaroV42QA6Hik1
	uWNn6336NQJKpbkq3M6nRC+Z7y2XzLogIRLYf0npveW+7swy+vA0xWK6IRrzVL4H
	Hx8S3VmXnYT6KPuhAqO8btgH1o4mmjn1fbTWYpnQJBfh1LeRSsqfgDd5SGZjc3WL
	umC7dlLvgMnIHQZpp7YPTdKCEzjaCT4PgXCBF95IiJg2766TQTzlGnzaH2ARMo+7
	iOJGDZGT1YF0+beyK9BZ5KtoDiUd3tAD4X6gIH00phn2XqmpN1O9Ud3xzwry38FQ
	tuHSq5bvkt4SJQzDNdNf/ksqRWCBheqFvect3z9FnVijda8Xn48sZ7L/SQVuTkIt
	HJGqOA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8heqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 15:29:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so3434646a12.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 08:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622171; x=1789226971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhDPHYvbCWK+ZkvP3pGp1ZgPvAm0ynGerHy69+0k/2k=;
        b=W95cxljI0kjeaIe8d1Xzhl3FxGP+ZjxaAXwXip+pklEpQ+1ko/VrqmxtxoUkm0OOWB
         rjKvpJd1BrCYHYedv0r0bDajVKTY8+pZV6BUppmyX2YuECyXvluXhcDHYB+1YMwPUQcI
         0Un062RkMjyrTCQeD8Bnztvvqp3g86nGD6qluZCBoo0krnqPbTc9JbOkLXSBPP3qo+9q
         kxpQx+ViaGFmwos8l81QrTX4EQbAGmacrxuSdC3P2xcMxSoLiQkg32jQWdgHOCi+9PEE
         nE0LATbEpSIX7R/vB8J5NVjgEYaIpML3NsYCady9Mv5n4K6uhjGN5ETejffD9sB3Hiwg
         HnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622171; x=1789226971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhDPHYvbCWK+ZkvP3pGp1ZgPvAm0ynGerHy69+0k/2k=;
        b=LDDcvvTy4nnk9AJIv+Hm6GgxZsJRXnQhIYkBAYGrfSvOp1YxBjtLJrOGkKSp89ZSib
         NTyeAeecfGRCg/Ziu1QXp+QrqL6hyqDsxpgkpqZm+K3sZCLLyqAxtnTGShFlhHk75iP5
         +V6oZJMhXdhlsJdgo4heOONYc/hMESx1o1Pmzbe274ScUXdDbVEHc7pqmQhfZkQVeF7g
         +c9xUt83ClEs87l0CLj1YDv//mugY/xB7pZW3oy+ifYt9RPivhackuzijoi3L9FUR5ga
         6jG/Z0qz0YX7aXuaxpBRvWuy7B5LBp1pIrz6+sSzY3wyMY4/cYBWhJHWWT3Zrzr7Sin1
         dOlA==
X-Forwarded-Encrypted: i=1; AKwUvBwVo6sCkN9epbokDqDerdkcUNNoaClMkA4kl9wYIr28gpVKJ0y085TK/ssbTuHDoJrWN3Yj/hqyuh8=@vger.kernel.org
X-Gm-Message-State: AFuF++ntJCy6GbYNETBOOBKq/L+g8W/MrsPNiXaByjtXgZeBIGPK5Wm9
	cqbFS8p3UAY18bRzl761i4lWH6IU57iU2ctid5Tsk/ozDju9UqXVR+pvRHY1jAaXKN6VbZ2yi4J
	l8Fhp/e3u3ESfFPJgDY6GGFLrGbGDSqJw3qkZVfNG9cuGvn+PFUBkNjpSkEwO0Vc=
X-Gm-Gg: AYBFou1ej1+6AsJd/z3fxcm+IXT6xQsa3/mYQLPBOtIl7Ktl3HD8Ql1UaDANgYCKBUg
	XgkC7EJGaapENn25MT0/FCQcwSp/htjKDg/wJgoXpdHZeq177JUQ4MVY8v7aV6n2WsVA7FpAMHS
	jEo1M0ldUq2Vyw5bfAioe+unxGzyFIUYCo4p2fbRaM2QNAcN6r1PGX3a1q95JLCJODZSuoNZMmM
	tcAmqdecB6KH3x3T3aIGyY7Zx/mKD31XcNtZa2g9M2t4CbNIKiS1KQsU6wmMco1IEqd//an4asO
	EgrjlD2XwvYN0E0NYAs99HkN9TzuuVBcbdPlSywzHuggnPWfcXkCHks/KDhu09INVIE7B+h0bbA
	x+juDmJq6HbXDSgoDen7V9IIrQLO2HpyObSPkp2Ob2AeMAWKXi2pHtRa1adI1MJ0N2srxoQ==
X-Received: by 2002:a05:6a21:1788:b0:3d3:ae50:97c7 with SMTP id adf61e73a8af0-3da3a16a519mr20675423637.20.1788622171542;
        Sat, 05 Sep 2026 08:29:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:1788:b0:3d3:ae50:97c7 with SMTP id adf61e73a8af0-3da3a16a519mr20675356637.20.1788622171138;
        Sat, 05 Sep 2026 08:29:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:30 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:07 +0530
Subject: [PATCH v7 3/5] phy: snps-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-3-820cf5377a70@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=841;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=ny6Hrk/6zrJ+j5PBR/sQwQVZSTpedg6BrsNkeWMaR/Y=;
 b=PFGi+VuwLJietQ9FZZr5Z1aJ+X03Kr/def49jv9TXXtB+7JzqGYpNP+7ObIo58mWFKOX5GEzR
 pHC4tsgXFiBBrYqiS+7QIo9id+lD4VLlsgRPAclJXdN3lCgEBFbI7pG
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX2l6UU2kCUXwD
 ADb1LCNnFDfb1LAjXOlE3yhfQOmsM2Bm8S7+at1mXE8SEl6d5tUE4Y8i5K40Ra+3LKugmVJuE4W
 1oCjlvEpOcJ2LpkojyagdTpERlgViIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfXzMtyTA/QqGWj
 eSYNP5P9ibyOEcGjhJ+UKcj8lZa403qgtT/SE/JhetYIO+a0/Vevsoqrf3rp/B4Vouo7QLo+YY9
 ItAS4IbPZ6LQ+7whWQHW0/aErIeUXx4/0Vd/VPauTPX0WybpXOxfan6BnwKmozElUIew4QxQdhr
 UZ7vgndtjeUP6zTBAIqLWy48HffIDEkDcAcXA7EJ8mnVFCIik2VKbQNNv/W2BZQMhRQnj8UMSj5
 EhCFaOrUNbzpQgT5kP0mMl6R0690QEjHokkDNS1MsswHIk3MUZHbdrNfG/+sPZDC4K3RBsI3boi
 0UHCG4YuOsgDmbSnUp8D13rhbHt6arJRRVmhCuvYnCbNWjsNjoZjs5MCz7UyDdwuN3pDWEdKKjL
 IMcNbPOBZ4XFwep97UAKY2zyLtbQE10KT5sUX5DGzV13zgYNKne6x3iIGwfFuBozO+DHl3VawpN
 N4aet49osQx4B4MDaFA==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9c355c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=ugjOiUgvsQrqGD8bgbUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: kTesnDLSYg0_xnWiIPSLY-CtHqI8dE7I
X-Proofpoint-ORIG-GUID: kTesnDLSYg0_xnWiIPSLY-CtHqI8dE7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index af4fa17ac6cb..ab405108c727 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -596,6 +596,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(generic_phy);
 	}
 
+	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
+
 	dev_set_drvdata(dev, phy);
 	phy_set_drvdata(generic_phy, phy);
 

-- 
2.34.1

