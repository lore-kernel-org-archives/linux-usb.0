Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686449;
	b=USTCDiAxo0LY1gQZxgHz62sE+KeAJPHVnbQPm9fuE3+sFmgBqlE9Zp1k8NTujZXvqXsk
	 GpiR5KT56SLpbeM8/XASMki4QCV7vCTHg/fDTHjYXNPKGL9t8yoNW2RbYULi169DMjDFT
	 zKXK+FiKhCkpOIU/1NUDluaR/9lMIvhq8EVLtcqZisbrpIuc67Y2B0CCF0BZd8vn6JzGd
	 VMpXzHZ9G8cYfVCA5RSRUVaXFzql5kMoJP4muM0BAMy4OZhkebPlFfo82wM4J6ooSIq7X
	 HYmToNivzoBhbyywzPElDdQxc07yQC8Sl+574/pI3axSL9K3gtt4MYA/Kuy3CABoKhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ozx3sL1vjM+KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=;
	b=jQVxdv16QAw434Cq508QfJy86rWKkdu0ToSRqcIqNlYveqS4nC7ndShhFPXP0XlpQYso
	 vqdB5s6EW0NFR6BvWZECjaZzqaepYv3XX0NWyj/OOS0P7RYaw10wcrVswxGg9ICdv4/8T
	 rqIhEVFf0JCEbwh0KJnE7ZPc7iMQo+t0CcEu6a+8zFqVsSzjZYD8knRQ0ryCuwTtfIIE+
	 /nYRUdv7283coJbqTFtqOdVv7GZ4kiIDgpFRf0o6zhZsold+7+V0l//Obh/V8hgCh8jLH
	 hjDvImsAi7hygka0Rw4psv1LnAbe7Ir/6YMEMoi+LIHboN+R+F6lKX6Hf/R3T+0mcQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7WeFENB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0J5Gdww;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8195E606A331
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8195E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7WeFENB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0J5Gdww
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31e1DL2402838
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 06:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ozx3sL1vjM+
	KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=; b=c7WeFENBSj+ToB28uUo6x+EOLkW
	3o+qH53gHDMstf9MtEsMUm2EP4oy4FYPw76HHQpd6tLEHYjapYiKOxA+ZyiLGNNB
	KS43/vlQg6IxMaGJSx8HJE8NY0HvToCfztnBiLrto9+PIrmBgIdUEHtpYwdo4nQr
	Lh+QFeAiFV8qJpJ3kXU7/h04IJFMQIipLFgrwS4bc71At6/XTTCntqrIcG6ViHNp
	ukTJQeKnOlgLc+hNJKvRBLY8XfJA83HZSNXsSRk5R1CLmoLPsR8hrkQM3RI3Ldw+
	sqMIe364efptEjssdpC5nputuzoZ0MAbYWk3YW6ukoGFP5/GI2KgYbbEXsg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy1cg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 06:14:07 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso648010c88.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 22:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793686447; x=1794291247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ozx3sL1vjM+KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=;
        b=c0J5GdwwT9T/3FHZBmUTyRC1AJc7gyJIwEx5gFt8J4ocg/M8aJj4Gz2LySWfHM7xD0
         pQFnCV0FkHv/gIq/XEfsqWL9xzhBNQZ98yncV5Mv5SAbTZP4IKpUlbLZAus54DIuOYxI
         Ofgoun1iCD4qbOVseHMzBHMjSuXVbY/pt8GkvMJ3dNMqHdpE7Z6BA+2vtp8FBRDHuHYL
         J/TVaT3UJ+uI1m8XYVLw7q9foz1tH0E8hLmhnTSHsu5ifiod0xhnIZZ0dvC+fuys6e+E
         XA2XDFieQH9rRhArzS9bDTK3Jz4x4fHeG29iKd89BhTGN3i+7h/4/SeSi76pqL1YUYEf
         IEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686447; x=1794291247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ozx3sL1vjM+KA5bfb4Sfs+2VwP+PC9ffPlclFzHQgaM=;
        b=UPRT0AWFq1zM3YOCQGfI1J27Em++YJPblO8C1l4byb2HvQdQhnW6y7evZhjY6wuJr1
         d+37xoZ+iBmcVta4m083F+1frz8FTOc5Y5MrvgrSQ5IRWlQaQAhbSA4l89b63bVRrymD
         VzbBDvuhGr52FuttM7pKuu2kMbaFVANL9bZ/mWA07efUBAUbymD+qMcDmBfDcl1EL3So
         iExkhVbpiWZMsvHAmHraR8v8AkcJxITEsWG9Su1w9bWdQ8zEfDylNQ93Mtk4cylO9wRN
         Zz6+fUvzw1coPUhyoVeKzkLAYSULzMVbNF5nZmb8KP5V+FrBLDekCgKclPpX0Pl0X4VP
         0szA==
X-Forwarded-Encrypted: i=1; AKwUvBx3XA8wyd4waDjm7ukVDK/TyJeFSuf49sT1PvMElVDb2uHqrC0zgR8Lc3AOCJx7pCKDmzekVsXQjBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iouFugGbeepmK+qpY6P9kVh9wTSBPTycLweNcaJopBHaBbPpB
	VbzZAPJTQ42w23GjiZDF/dVGbhH3yEcOZb37NqKOd61WLPvq5UIpbZZ93DyWOvqe//mzsnaE3Bn
	BiMMAalfIEWqSpLtRMQ9J8q6SfwJwWjFb0NCbqO24NyRlsCyEisC8SpnF6iNiFGY=
X-Gm-Gg: AYBFou0npPJ52GXijecPj/QCIjx1Fnr/8rZku8RIH2a0IRVFR2QGSrKopHuxohOCUmV
	+FNSJtCFvigwwhB7WgFpO3NGPUWTNFkvUFy1V4Zbs/XNY+zsn9O+95GKnIy9CmoVPmHtxFdGKBe
	3eQhEFNHRTa3EPQj0Zfw4toy3r07h1E5bUcLNhp/U1UnYB7PoGcKBk0T6uN54COSdIo0c0XzTUg
	rPDV+nIp0ogN9UwDYCP34EIgZvDvbfRdGNOpXJbPUVvWnTsfy/kJLMiat/Kxfw3UPacSaawzvkG
	/2Hk2007jbYNn1ZEHvnzm5TStbqwYh33joEvYH/QYmLE60qSX6iofqN9LNI7FZwcnIEQDfn2q9I
	8mMDhCv1e7frnHmkxyx2MOLZflagfMeo5xUjUKcaYXy2AkG4mbPJC1g3tA/obijDtU+p2fjqiPa
	0saOX5apSpi3UsvyVOFCJ1VQ==
X-Received: by 2002:a05:701b:2086:10b0:14f:5cd:f286 with SMTP id a92af1059eb24-1ac5e31f780mr19304277c88.34.1793686446885;
        Mon, 02 Nov 2026 22:14:06 -0800 (PST)
X-Received: by 2002:a05:701b:2086:10b0:14f:5cd:f286 with SMTP id a92af1059eb24-1ac5e31f780mr19304228c88.34.1793686446281;
        Mon, 02 Nov 2026 22:14:06 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36c8d3277e3sm1947091eec.29.2026.11.02.22.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [RFC PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Mon,  2 Nov 2026 22:14:01 -0800
Message-ID: <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
References: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8Qp4D7MUmXmboWK5bCcQO1QmX6_3Ijjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfX4gCzxcUlUt1O
 MRM9k1aizyiAmZP+zu5iigQ/5fz54yBiHxeKLTXyCmvrWARJyZwq/FX3FCX3gT51fjwoWa99cZN
 o2AoTtKoNOJkuaS1UKV4QiDCPKbKtb39XMSrWKqGG7Aj5lJFC5B1QnDPL4dBLOXxgeqz/iLnaRZ
 20nBgUrRrII3GX8ltJCB0DB9qj+Ov93fvUin4pGiepeoakHPA0PRsJLIGXChtpmI/3nXGulJg6c
 SKc2MLNmOQrenUuE4GjgnG/NwoCP6TY/ZJ+RMgobVyU3LDJrAqa2SIxVtitiTMpwvpTaAgsiVQ3
 zUaSq7drq7039klfD53+lfLUS7AR5xek3jeD+AF+7DidejbE1y7swztXWGVRoRxd/AKrPgi1hIF
 PuXS3y/brGN1m6DEriMuRpwUYESutxtcAvWLW3aImvAFsdo9FfBcEMzUu5XMamZRm9r/zYCzwjW
 W0+5Tby2oClgpW1NL9g==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae97baf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UBq5q3rzQQf4y2_YTtcA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 8Qp4D7MUmXmboWK5bCcQO1QmX6_3Ijjr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfX5oWlaIY8HGk6
 DpJJzRnyrcOSof6u9PLglWaYx1DUB4+4fq8OG/mvbr6PernOL/UBf9G+7uxDqZisANkX/hm2hqN
 4mYiwANDK3mHyU0naNVEArFE+kOV5t8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030024

The "wakeup-source" property, as described in
Documentation/devicetree/bindings/power/wakeup-source.txt, only says
that a device is capable of waking up the system. Whether wakeup is
actually enabled is a policy decision, and drivers use
device_may_wakeup() to decide whether to arm the hardware wakeup logic.

Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
property is present, so USB wakeup is enabled by default and users who
do not want USB activity (e.g. connect/disconnect) to wake up the system
may have to disable it through power/wakeup, otherwise, unexpected wakeup
may happen.

Having wakeup enabled by default also costs power. In host mode,
when device_may_wakeup() is true, system suspend keeps the controller
and PHYs powered (dwc3_core_exit() is skipped and the genpd is not
powered off) so that the wakeup interrupts can fire, even on systems
where USB is never used as a wakeup source and could be fully powered
off.

For USB controllers, keep the wakeup option default off and only mark
the device as wakeup capable, so that the user decides which USB port
is used as a system wakeup source. Users who need it can enable it with:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

While at it, drop the local wakeup_source variable and use
device_property_read_bool() like the other property reads in probe.

Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 8116dc94c181..1451b5eaccce 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -653,7 +653,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct resource		*r;
 	int			ret;
 	bool			ignore_pipe_clk;
-	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -757,8 +756,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
-	device_init_wakeup(&pdev->dev, wakeup_source);
+	if (device_property_read_bool(dev, "wakeup-source"))
+		device_set_wakeup_capable(dev, true);
 
 	qcom->is_suspended = false;
 
-- 
2.43.0

