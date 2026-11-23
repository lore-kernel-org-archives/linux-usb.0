Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430870;
	b=dn7HM4IixB5kes8IkuoZgGZzovV5GZl49cUJeSZlVlyxEY/KhLhxCL9Gvq11ZS9FzUu1
	 e4DGAap3YjApGn3uN15ND6G/3p/HqEWEh8zkfWqBtVUCmpEY9FBY1ayn5V28V+7MjBkOC
	 W9pGhC+ZJXaoT2DStwz8BphBLyE1FIp07e20Tbr14/h1n9aUGKZW817k4A4rktNPen8uJ
	 QMrzsvqNLc7sZuueFVggEs5BqRtCeoT3yqTMLr/UTFv2eBVPJhKahhAcBXqCguBHwpZgn
	 bAkTuZWhJjpFzBmwXB/hvIETHmVHifD/1ySc86TzMHG9u8ldfcVvzn+h/xSJ37G2yzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
	b=2lRaoarsp5hpowIoTSHtBGTVYL6owKOSvXPACxWxJDpUVonQoZG9TfqMyZfaLoNORnJF
	 ni7YwZpwnbk67+f4t0Tkj+Osy2RqJWTqlQHDYcQoHskbPnloW+FDybjwrVcGsfiU0CKWB
	 hDV981uFgk3T1feXPDs97qGsUy5XLpoKjL45V4CXOrSXpQmUJPxSQ9NdFNvd3U+TDBVA5
	 aDSiFahQ/uVUTJIMke5gO/sCuZqIiYm6b3V3X2WlIkEOmLJnf1YzF6wMWsH1ETsd/T/02
	 aGXl6B774+djxu4yR+v2NzEJ7UnFikRP5401mBbJvl4J4yV0aUKQSE7WW6CyY0oljeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/Lf1EU8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38428606A321
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38428606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/Lf1EU8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GDOK1900214
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pLDtqrroGwv
	OI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=; b=Ly9Q+0CR8Ggwndo3fOEmB9/BA6D
	8AwsQ4j479LV+4erEoWm4CykwVJDXMHnHjkugQFWalTMG+Jx/uY1BURVDe+aKFFl
	UQqQcpXcLPEPCLCwDS0Tehh1G5bV/29YXn9f8GqfEaQCifv4yyw0BkyZ+JPYlhuq
	nFcsJLJLJns1JAesbqxv5BOVZ01Mjzzqyf+ajVVUDhLa6ZN9gY6ixnGLxE2dUbCu
	uYfx/FCWeY4JmpLHAeuZmjzSf3Et60FeUfzvJbdrBuZ9qCJq1ubeDzil+ct03g37
	dtZbVQyuu6MWKAeEfvx9Xc12TbRnDGbmmNYoGlBeiZystJ/lRoW0GzzmKeg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k11f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2713390b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430868; x=1796035668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=K/Lf1EU89tt1abEp7rmYm2hmd1KyWknJeNMnsgvH+D4AbEd+l0PtGlnmsmDgv3rape
         /MkASRvxZ2OUAV7UEoPwOAYpPD36vlmd74USdGwBYbq4f7/BaWfn9zNyWNCFgABYRbpd
         yb0CMZBuIq1+6b+cNBQhPUBBfZTMUDO9cXnEjWzFYaPAuwAcbHewXnKDzHDfpHtKqHFy
         +/jSiN3QUGKOZc9J7R0H52wHlHgE9BHUFhYGaMeJy7rZbjUnQ7vceCU0JclMGfH14R6B
         4qIMZtrEyzBi55LaFL7XORHI8v6lS6awYUWoS00+kMplFr/k6kKb1qmh4K/oUH/ddUJ6
         xF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430868; x=1796035668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=Z974tYnsVsrYDnjEsoxFV6oYCHhVPqHP1gjRH2b2gHkfMXP3LW41g4AxejKZjet21X
         xpSMIPV+FOiE833wWuhrCK0BDHOl+JWfTnY+giLt94sX3pO1mH1/wZlDsFG0CIyHb+b/
         X45aKPy/btU6XUylcs+gq+VdDdBrm05Gh+gbgDKLX9zkmedro337bfGclc8LqP5aZd63
         BU+IIchiVgm/yVui/yaUxqRikeMHCYXoYMgRT9B1JfqA6wVsE3/MnD0Y+uNJc/R8G1oy
         RCQvNWFa4RbEwDmSsrSXU5mqrdCon0v8z/lHBixM5GVyG2OmaZZgR+j0uPFAEUutpMHA
         VrCA==
X-Gm-Message-State: APuU4Z9g+K+Itf2hM0S1RMPT2mIwiMxHQjHXCQOmD+zunEh07Qd6rp7e
	RwOTyJWErQn48cZtdnRUy0i1G5FARmvZTZtQwgnvHW+gL5kDA3rQRSfleNvQlPWoZYtWeIiewCe
	9i1xldIgf19zhhteYDMmuoO19O2rMaVYnC9dr1M501M++SVy1lSpMcmcD+mOZZ2Q=
X-Gm-Gg: AZFdTZfenM59DeT3piBXJAsBxUhEhzNPEKHhqjgsAyF7sJbRIZfmuh3Vgh/vwdrx61M
	DeARtw5e6iwfdhjHk34NBNau6Kt8R2hEsnHT9+X2mzKmpZw1veHVWyReHS0kHakM/V+O+NEspFg
	3TDW1Zh0ayXKWiDpnnE3d2Bnlk20d9sUwmMJCkbjgup7vW1mA/hQreXVw8JS5mglC+ybvUHTHs5
	XdHEvl+sWp3uZPSlS0RcwUOt2YQ3Odny0JJcmoG8z3YwX2cZEnyLUxGgtuHCQ5qsKT5cjz0ADXR
	2qW6pnVS1dmgsVydkQPjOwQM1IFYha8x+vk7WYNjMVtyAAjQkWyVQOYuTW1sQGVsFzmdwirRsJM
	lN4NJPjWxkhxXwjbaa5pJ5luzyNpRfO0xDh4KdfAagjpesnD6PekozKksAs326zmpm+Alw7fdF8
	YZ1y8TXA==
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625596b3a.45.1795430868089;
        Mon, 23 Nov 2026 02:47:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625582b3a.45.1795430867614;
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system suspend without wakeup
Date: Mon, 23 Nov 2026 16:17:17 +0530
Message-Id: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX3qlE1s5jl4rY
 0coHdqKvKM7OSenJgwZ+u+n/oEHlgj7AIKAgqo1SRs+qk0Z7afRRN0FooYSOntO+EDe6y2eLL/U
 7NPcLC14q3txDvkMhsH5moWmc7YCrXY=
X-Proofpoint-GUID: Gj-K6xOl0XvZk_HQ_PgHqZASOeZVXMhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX8vLyNtP9JtVp
 BnsYFxrfX0brni1lqN5fnEKjHj/uuijRuTW+C8/6KFDy1uQFKqXBg/cdfbkJB9RRpd++hEcVXTr
 gkqpzRiW7ys9bTVcUQxryGtbYJO/lF/QfnYjX1MKbWwuBRqgXAZ/LR+THKcFtbJo06GBLRe7SqM
 sgpR+rJEF4l1laH87uOv1BNAhUrq/mdzFYem+wXUKzH7ILEzYtocXTzjEqA35jKDrT0V1jMZ71/
 5tmpTloFdIt5Uh9hWAf5SidAPCvD3qcGVjAbH2pzBUkMrsLStXEMGSJ+7e+XXqTSaZweRMGXGvt
 pqGM4u3XPqO5gbLnPaWF6feWgctHmd85pAl+/MiIcu2flWbqcwMh9uzgXppi+AQzrGa68EL23pF
 2rozULThubI4MtWanUV8qTQvSNpjbC3qMTPF+9mwyKIeNrNWgp9ldGIjMuoPVOuk7mGEazQQEb5
 MEoXhxvkeGTUWaym6fQ==
X-Proofpoint-ORIG-GUID: Gj-K6xOl0XvZk_HQ_PgHqZASOeZVXMhb
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0419d5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=f_oCHbJux9u68P6T8RIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Runtime suspend always arms the wakeup interrupts in host mode, even if
the device is not wakeup capable. If the controller is still runtime
suspended when system suspend runs without wakeup enabled, the
interrupts stay armed as wakeup sources, so they can still wake the
system. System resume does not disarm them either, as it only does so
when wakeup is enabled, so they remain armed after resume and the next
runtime suspend arms them a second time.

Disarm them in system suspend when the controller is already runtime
suspended and wakeup is not enabled, so the state matches what a system
suspend without a preceding runtime suspend would have left.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7a7225b900b3..18db19cf2065 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 	u32 val;
 	int i, ret;
 
-	if (qcom->is_suspended)
+	if (qcom->is_suspended) {
+		/*
+		 * Runtime suspend arms the wakeup interrupts in host mode
+		 * regardless of the device wakeup setting. If system suspend
+		 * runs without wakeup, disarm them here, as resume will not.
+		 */
+		if (dwc3_qcom_is_host(qcom) && !wakeup)
+			dwc3_qcom_disable_interrupts(qcom);
 		return 0;
+	}
 
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-- 
2.34.1

