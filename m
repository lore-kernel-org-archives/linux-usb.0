Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E1A4E236F
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449924; cv=none; b=F452R5tEu4jMxuAx/n2djapwi9xd/QANYYhgmzntXWTOcfLAY2BjOKnHNMHfAf+UCdHyEclrvGXkIbsKZhItiXmnWk/Uz4y9YIC9y3xsSkcZMp0bCYm3DEoL19yvRimnRsVZp4B0L5inlnxI9NNHHjLFqzU+8R+T7LVgzEKU6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449924; c=relaxed/simple;
	bh=ALi83rRNuADvE9ffMiegutYDx3cZlhwl260kOcGTT+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uBMDdheIwC4fMk4h3LOF9vQ1GTRiNQrdSklY7VvYi38z3blMZ3p+364N49FWpxEjmAOGmrH0/vo5+p3jUsti7dFaKNbjwhuI0pv+Sq14+mSxOCko1dm2R11N2xVnisSF2Yi2AFQ+QFvTkDtneU4Q83b/cat91+jr5wyDMIJ5MrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gwy0lSCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlFN7HiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gwy0lSCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlFN7HiF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAhhT707742
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 15:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/Hy99dl8vB9
	19AY9DOVP/bYhGp7iGiD3x9D7uELTJ0w=; b=Gwy0lSCnKFrCup4JYBWJodCYrVT
	sVxnLI27r2GMj7AQrfocR/U/YllWsHkYvmrmHaxeZkGYiLUe4aFpdfIAmp2Sx03C
	067nyjIwxO+yVgZI7BS3mu7qKHWoV+4jS5Bp6PdXVpsQ1ewYOueIIyOjtt9KK6DC
	uiRQJyafGH0Vh8azNeM0qUYnjSuApLfRz3LFN+XgtX9Nx8qcL605xY3t0GTWwL17
	vSPR6qTabLnxh1FRz1orPK6p/W2bBO14BVGyQUEPkhzaZRdVAmr/0Jp2Yl9jASWA
	CxvS/SpNeu8J7HFYnff8XATo1mUMEeD3gF7oB37ofT2NEV3r2y49BH2FbeQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekj39h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 15:38:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85602449126so5280159b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 08:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449920; x=1789054720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Hy99dl8vB919AY9DOVP/bYhGp7iGiD3x9D7uELTJ0w=;
        b=IlFN7HiFhMrdM/8Jrh/i9qPBAIhoFR6JlTlua0IojHh2lVKxIL/JxBUyY6X8Pl6uWg
         ENoW4PpKHeC2l+aFXTDR6PeN3pzCpGqVb5hI/QBO5A9ab15KCq6tz8WIA2XiLi6NzBgS
         +gCtu1xPZnbj0pn98Vr/W1g8rT2irxeQBMm16Vm2N83g+3L2Z8ydulFOa5gO1sw3fb6k
         kys7II7BQIRn/7Ctw0CtyZazso0q5KW84JA6f9dn9lPndLYjKODcg0BN78VPT7AYg6b2
         gVclMxcCXqTTFeayNX1aqnoPqs+R7KhQeMvycAXsBzSWSwfSywS7jllwW6ujz1CT5sl8
         t8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449920; x=1789054720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Hy99dl8vB919AY9DOVP/bYhGp7iGiD3x9D7uELTJ0w=;
        b=ppWvaS4uWJaDgdS5k6Tu/5hNk1IgkPiI0hTS63SU3lzR3p5f5FPMGF9NWGZigRS/ZJ
         VlPc5yJNZWi9JIsHzxvEA4adipFUXLSBCpI9aYCIT90tCmiVFirhmTwYLTtNBsX8W97e
         4QeEdm8avT43d9PZoWeAHUfNB2N1p1NbBwEvJHcQWgnifrOYZ5oYCttQxxkkUM/ObRYS
         l2gsM3+amvQgXJYCU+nRezunBoH0hqqor0nUhk+TT4FjXtBwbpVKm0GEME9Qn/D12LDy
         nxgF9ZjqMHdDwjRmw60sJQKpMbmTOkuyrZr8d8qhR088ura7RWpRyAVizDW5WE+WFJlW
         uwkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNYOVldnLqoRxPnaTDBBswF/kbMM8kk0rqTPbGt8NsDdFnNg7NVyfjGvR7zbYvM0WmwCwj8QCIGgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mKdLqaWwWEzATXB8PBUkMUKm5UO6CHXYhDb1MdzMn54BzB4Ujm
	U8ExEUiS1UcmMGGrS7dqTlS1PZdhI0sC8YsYk42DYpi+X3l8BVM/SGqxVVjJM8stutWXZzZP+X8
	7a4SntcgrIMRo84qblCMpp5sixhq6exCTO85ACXMssVhnZw7a+WUCoYB2FJ28W68=
X-Gm-Gg: AYBFou2uP2xmTZLPHjDhTDtlejzvBg612ytCQg66PH876y3vFEk9UNwrnQmhalyiLsU
	5QgVI9VpPU4zwlIYSpOk92UK2zcAdqkhE4a3ppVHdUWwJSOR1S8ialTdzctI+9Ri0IvfPrspd20
	dHxnu1sOzvcDT0nto9upsmRq2KMLEoU8H2PQsWEsdW9vIbw+ZA/m20LZvZz0Ls41cUHa74NamNk
	Rp86Dnw95nidJu2Xoz32SG7wxPaJGzg8qjDOxoklPNkWvGt9TjbJACgSgpJpRvvTLfMP/Gd1spD
	21vho2anFSpK5JdioYmqxWS0HVB0Q7Up+LKGJK+XPJhkFLCOs7rbCyWqad+mzZf8m+1SQhAUoSr
	qgVXU2j1qNeKsE6YuLx5l/yP0duLpqNok
X-Received: by 2002:a05:6a00:ad8e:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-8613d06f6efmr1606471b3a.2.1788449920612;
        Thu, 03 Sep 2026 08:38:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8e:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-8613d06f6efmr1606367b3a.2.1788449920010;
        Thu, 03 Sep 2026 08:38:40 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:39 -0700 (PDT)
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
Subject: [PATCH v2 1/7] usb: dwc3: qcom: re-enable wakeup interrupts on failed resume
Date: Thu,  3 Sep 2026 21:08:21 +0530
Message-Id: <20260903153827.3463313-2-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5Fl8H93PwZkLZD57K68S2aK-7NOLyBsp
X-Proofpoint-GUID: 5Fl8H93PwZkLZD57K68S2aK-7NOLyBsp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXwyTFaBJQ/FEr
 CSP4OpcKnTpxbwmJSYcd789HRskCpoChrtcn25nR0r8liolp734MXnghQw6DfpRZoc119Y1x5kV
 dMi6BCTx2hbW3+Zco2mJNv3OldXnp18t44R2+pik/Qire64Up2EdDEvwo8r9MiPz83FneAC/x4A
 7Za/A6V+MLSYgzpRp7puRSQshiLVwNclrRQ7eVlWNsUu+9bnNZ0W37azsRlekHNAmIcLBnxZlsH
 diblv2B15Z4G2a2znRPCqdU9XPm0rCRtTUONRO9AoAd/BBH4zV1ZXurg7DSYNcNm9V/aorzTwbM
 ZaBiYQIbSitjpsnQZTRzzYZ+SJh4l4GpTeSHiXNCB1+5tbuMsW/cIjHq4nTcZE7qrZxTIKE2JH9
 3d3v+r+r0BfIRUPsjfX51K2PFSiV6xypjcNU3Gwr13cimO5jk33uvce2PTnt02p1tnf6gwdmSar
 a3qBfPMaHuQ6XVSmNbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX45xt0z2tAjav
 EmBNzf547d7wEiupeHTDBGbv4PY99LH3F9vOB05dqbRI0mJrCuN2ilnVCDqoPd9cL8y3c1jefM1
 L/ciCtD+KQDccCjmMvmV9kTAcnE+hbg=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a999481 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NhDn8tuv-5NqXiZlDHIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

dwc3_qcom_resume() disables wakeup interrupts before re-enabling
clocks, then re-enables them again once resume completes. If
clk_bulk_prepare_enable() fails partway through, the function
returns early without re-enabling the interrupts that were just
disabled, leaving host-mode wakeup interrupts masked after a
failed resume.

Jump to a common cleanup path that re-enables the interrupts
before returning the error, mirroring the success path.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..49698a31b2f4 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -382,7 +382,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		return ret;
+		goto enable_irq;
 
 	ret = dwc3_qcom_interconnect_enable(qcom);
 	if (ret)
@@ -398,6 +398,16 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	qcom->is_suspended = false;
 
 	return 0;
+
+enable_irq:
+	/*
+	 * Re-enable interrupts if they were disabled earlier, so a failed
+	 * resume doesn't leave wakeup interrupts masked.
+	 */
+	if (dwc3_qcom_is_host(qcom) && wakeup)
+		dwc3_qcom_enable_interrupts(qcom);
+
+	return ret;
 }
 
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
-- 
2.34.1

