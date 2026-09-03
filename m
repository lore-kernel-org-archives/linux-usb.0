Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74C4E8DE5
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449941; cv=none; b=aBav8ip9HqeToWH1o5hYsIVKwwDsjkP4IZrYtU/0JOw75yASpP+e7fz8I/hAK64T04QkQA2Tc7wlNGSnkUm66iOoBz08M7w+AxN3+zDdw7SQfLNKQMbaczNFe04rNtO2ZD+6VrAMIlMwhUtLvHkoYR4cL9c+azyC+O3K5i0H4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449941; c=relaxed/simple;
	bh=AjrT+2a1V/dFdE8w4G6xJN78eEUrW3q4ENCnkqhARGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4kDiRqzwfonl9nezw/k4/GY6+pF2lSym9zqIhNnM/+FDfldMkW2JRCeHGo055PhB8bQxEHqQF0MmaP2DOg5EDcn43MOjODYYSWHf44tm06tKFHuYQZA8GZBY1sWmUMqfENvP57RzB/E6n7DNI7uoElxOu4wb5EIJ5WujT1bRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHQoWt93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JzKEfGf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHQoWt93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JzKEfGf0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DA5XJ1704802
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 15:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h4izH85dY8s
	43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=; b=CHQoWt93bSf5i1CuMopCg+AtkSZ
	np0nNaMAjZq9Lhyf01UtWo+mkipkhjbvnO+Yi3vcbncBI65hCWZFIBQR0cuPtCN1
	L+zSChXLIx92RG45YnSRq5Qaj11YMMj0bkvQeJzN4ERaeIiIczrEbOb6OrbyAJIX
	hFDWYHQwtyCK7DZVY5haz/Mw3Go9ePnkYG71zSfb+pLPQKxmqYXgfn6zo5QbORsg
	YykpkywNktjDXsX3LUPXbU1uXsMe/b1pBFOniruSsGpAvIjLJe8kTkESQe+sjlz5
	mi/gPbU4eqMp0Wd0FmRcSRuCno79XaIS5umo+P9Oh7yxtofDTfAnAwRz3wg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b18qmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 15:38:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e048a801dso3285392b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449937; x=1789054737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4izH85dY8s43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=;
        b=JzKEfGf0nZp2b7peAWg39guA3qCaASuQictTJ4OgeD0yT73Sv4BnKY2a/MhO07pYPI
         5PwWaql7gx1LBQm3bDdUhgUuEvdaxSao1SSmN95qFjCnlwXSgBFUUSccj6iyRLsCH4qy
         8UV3sT9Rm3lOnBDYyf5vycmeNlls8O1NHqS3xjNap2oxWvG2uc6S2S9llSbe3o/IoKPe
         nlUi/RwD1F5Q35TiGcGOtqPkCuoYE8re6iwIckpC9ZgmmyPW/iTbi8fIb9LFPnFrM0Xd
         BoysGxm/uaF9LeH23D0/+Y68eqARGR5KU4FqZq0ZppMHts/e+jmYu6F1cY2tq29cBD05
         hpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449937; x=1789054737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4izH85dY8s43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=;
        b=U35WNbZu2sy0f9MhuddXKHO5r1TEa+auTbpb5cDtX7pGcr5qI99BKbbtl/pfsTqg8s
         H/5TS6Zeq/kp2KAxvm4b4DWThlQmTszXBc3UpiO+XEE9SUYRHL4S5SXIc+epW1gYyD3X
         8oKSkQcubsEIurTI+Z1Bk2JVUdMQx+vZ46nOpsNPmJ4TQkVLQrWA9zQoqETYkvTqYkFj
         Qwg+rjAsw1BZzTZPWhgGnsXXpkwppN9ql5/5Y86C1/dzQLBLGU3ScZZSskDqm8hk/McS
         MD5z3kjMdvEp72HpWAwQ6q4VpcBgY/KIsUXUmjVW+HT9yapT85erEts3dsC88UJUJWq2
         s+wA==
X-Forwarded-Encrypted: i=1; AKwUvBxPkTwty/iPnNR6dZi+XmoQVeEBt9pvdbXAsjTUEnuFX6XlNVHFiHFJKWKu3GfRknQCjjXNpYLuQ94=@vger.kernel.org
X-Gm-Message-State: AFuF++n5EMrdes3ae0K8oEb7frLmr6NmiEUmEiiWy5ytTiRW1H30oW1P
	TQN/5PqZv9yLmOWhQwpxx4zDj1mN95Ry8dGJbzYUPy0ZXsvn+TnS9xLqOTKx164pAmx8/YB2YvW
	BgmqbeH2NFZhYPR7ERgOCxLGKrSaHfOfs/et6847+FpcOK4buQvz3opGPEpRvaWc=
X-Gm-Gg: AYBFou31EsoY3bg/l7JuCttuH7ldim73TU7/dZkhMBr03HYmMllR1vbnow7fggbIa8n
	wTVKJOd768lqRhupDBGROehvIF/I2JX/yOWZrHBiLBYJIpHAADcLMJntOUw6WHhsLbUKVRkjqRS
	/t7Vz8z+wB7zLtl59DV/2owfqm6Q8K72EilEYJmvXGeMQnwFAz8Ux1zTjNxS7ZTW65CasVK4p5d
	sJgmQ9qjfx7U+dUOUiKCYRnCVJ4rsziYC+pMPRMuQDhRjq1WkkSOkWYzgItFkZnYS421MVYPQ4r
	0pFmrcHa39uzfv5YW4zbzz2i2PD8oQuiSaqBvF8IGH8XQ+SwB331fN4IrOh+JIEZxM1D+86lYE5
	bx/9QUTQ4d22GeuuWNYlY3cLV2PrqnKiW
X-Received: by 2002:a05:6a00:27a4:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-85ed5ccc11fmr18834186b3a.4.1788449936529;
        Thu, 03 Sep 2026 08:38:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a4:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-85ed5ccc11fmr18834103b3a.4.1788449935994;
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Thu,  3 Sep 2026 21:08:24 +0530
Message-Id: <20260903153827.3463313-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LCbRyehHhF8pgfbtroU9fgUaBGkuBIov
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX+dalsSE8t0zh
 b2IhogBem76UALrc1sHyn5Bd8lRzelFgh1CxgK8UOKRg+53VZm5f52ktDZBxah6ALcsHSEyBOnu
 V+z0gasnF1zO1g0VBNWL2d5ca9/GcM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX40yxoEwuRpD/
 jJkESpJZrmCQVX+0BFp14T0gJTLph1LPhYarNh9dbnMUrl3O27HyWPX71yZMowUgZpoWCthgJXw
 9L6rhmCIxYOdDt1gEtIAOetjvV7gcDs8plGYHXZdhzn0l3MTmgJtYmatFA8hMnTbAxwJSaPU0WA
 ykpMIuQ8z9wtGq1Yp/GaMOk/LHTOd+NfAxOnFnGeQK0QW3hjdS0VFPIy1tbpNyuFwTwqE3psIzo
 /5C1ZECWTKQy7/RFZltFKjDwXVDNQv4m0UnDI7jiRDVG9hi1m1uLLGPN98hfGZRjdKDnUN0rjYs
 wZwFwYx6b7ALSrtnbIZyyFoGrtLuIFQtUBWhnBGC7tUMO265YhmPEeYcJ+hkq1hbzG8Zyegv2xR
 xQi+GgpOShRaKmnhccYj/NOc4fveivN9SBsPX1XB79IN/uQbQkTNu0ZsWjWTM+4zkAMJtpC2uGG
 fgA1jGC+IP73nYhCp7g==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a999491 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: LCbRyehHhF8pgfbtroU9fgUaBGkuBIov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030136

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 074d9c731639..7df2947d13dc 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

