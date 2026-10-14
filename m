Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8935AC13
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975443; cv=none; b=i+07n8zC8k6l/JrgBV0JQybKycaLEfqDuRqYCOY93n4bnZ38geHAvWy5a09WPw5rA6jVZUcf2/srqWdJqRVOKFoy2kic2a6suvR2ZL39AIqc4iGdjWqmpGKcr2do4lAIa3Yy3SMKZzVBLWpSWpxq25lINV7etX3SsgrNDLFE3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975443; c=relaxed/simple;
	bh=UdIyyP1ApsBk1pCqs7Ih4NsoUeemI3hETxT2kMh9j4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OF8lIDrLH/wbm1C+LP+5Iz58hBCRta5bP2iZIhMSOZREjyP4/Fl5snjAIFEWf7aJzVU++NrgA9Zr5KVOfFnAozCvkgZJuJZ09UO59em+N7DEk0/261W1kGW1FSGWnK9DfnUszq0CVzD5NSOEKDBFSZjRVg0scE62ggTMnfxo7LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub3/tZ84; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaQ8VEWn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub3/tZ84";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaQ8VEWn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E66G7K3366064
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 10:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tji34sWOk4uE2FZ5pTc7yNpCndx/9KM/rdx
	f1s+86uc=; b=Ub3/tZ84k3vUxE4iC1baW5k2p1MU04KVWUM/xJAn6K083nQw82z
	swvcB8YJ959+Ogch50H/ygEpl4H0yCFaG9tP640m7cUUbz+7oJAQIh63gxZNj82V
	Dp7QN2KQnfZcq6Vbo2Tq+ZZKe/bb0oyfnJsDi8vYEeAggzhEKKenHf/OJQTS76lh
	Q9CO9AZU7mHvi4MoAdvufCGIHQ7vnXJa2aXW9edhguc2qD1kKo1k4Q6dCiIbyRSM
	GNQb5PxAL7lgQ204Ublnbcugsmdf09cgQAFETETnMiajbX4nRMpa6l3e0fkh3WBJ
	YNz0VBe0b10vyCeOzHRmcV1TaBA0mG7jr1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46216uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 10:57:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so5217536a91.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 03:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791975439; x=1792580239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tji34sWOk4uE2FZ5pTc7yNpCndx/9KM/rdxf1s+86uc=;
        b=XaQ8VEWnVrGETMk3d5WPxL4QuhgEcLN12mQy/z5silq+nC8NeaO4gQUqF4+9PMp1rt
         i/g2d1BDK0ipGuaBO5QAP7+bz+V2nFHqpRqvNJsn7ilt5Z7+vI4J5kDxdkjW93uUHnwa
         Fs07b57yPTdjNMP3gutiL/sxvJOhzTY42b6YOMnvZXAiBiN/7Zl7+4IdpKxiKBkyKcAk
         thPIzM91dgpOnUTdGzcFHDIXZYl32cnu5ZBGtnE+BTX1yP9x3qsWpHA5ezkYDq8wwhca
         gSjH9nX5W6H7+7pe20C+15SKLOUUvuiCInuHJjjv3pg8fRBSLxPNEzspEfBwssEnYbRw
         xzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975439; x=1792580239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tji34sWOk4uE2FZ5pTc7yNpCndx/9KM/rdxf1s+86uc=;
        b=FMgLMXm8V35XPNk0aVUBGezmEF1CePbtLMiIIFgC9rxIFfg2hdyY+pyOvuSEwNJnJi
         7F3kAqSb4Zwnco83+Yq5SPb7Mgfu+SL8xI9MHR27kTMrMXjVTsZVmCx+b7YWW92ySCEL
         h/+/er6SeN0IHUyNzAmXD9lAlvr8NgwfZJJIN6Hid+/rM2CcNIuliEFPifeuMtBtCKyw
         VWOD5pnDWbsbx2U3ODZCX0s/zaa7riyz80nfpAbhnANnJ80a3wzqIdRIMszW7tcvfjiq
         aRGcFVFwmql3W7igDGGJYF26VzzrQhPh+6EslW3Cpvb+/ePe7iwmUN9whF/htvhzByCF
         4Fqg==
X-Gm-Message-State: AFq9FYLl9TxYCL2emadhwT1NiIfRRtOq9TAaNs4FcyWo9eJaJB/b1+fq
	jcu9RiXiH412bS3NSqtfxsRK6If9JQCQso+6uXGS/hw9hi7NRNJfdLhuZjwszsqD54uE0DmRdNc
	sD8rU60HL+tBtAdWuCdpu411nvMZerQ3MSkgHI3SbImmdFmjqvSBjzfu/VekZwps=
X-Gm-Gg: AYBFou1e49wYQeZUnyD0rRNy+R6rCcb9QYvPdCI4nOrmId9ljSLzAG3qgrc8Q2SwalS
	h7ccvAa59G9Jl3ZE/WHpg8cIg/UAggDm+qBf2LvGb5L9Qcfr24aHXYgkYyQTNOq+pJpPMLuw52V
	jKOAw60nNAvThNB+NsNMAy8+0uirX75QbUYqItMqDSAaNkW67TCCTvSVEkaf5vPd3Fc5fDZmNVI
	IqdquFfbppIkSeFeP0fpcpoaooZJeerxI5/v8bbXiThiJOXgBnpcaun41t8nmEZXgq924/FamkW
	f75DQB2Hmw9HGA3IliBBYV+Fc/8wKGHHLh3rvmKjXAgZuVZxlD/a/aKN1lx75R89gEYouiYs+sX
	5FxVjUm8JK+fk5FgvbXeOrZNDAOW+
X-Received: by 2002:a17:90b:2d06:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3ab3ad0e976mr7839184a91.43.1791975439056;
        Wed, 14 Oct 2026 03:57:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2d06:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3ab3ad0e976mr7839170a91.43.1791975438591;
        Wed, 14 Oct 2026 03:57:18 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm2294922a91.2.2026.10.14.03.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:57:17 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: host: Mark dwc->xhci as null if xhci probe fails
Date: Wed, 14 Oct 2026 16:27:11 +0530
Message-Id: <20261014105711.1708244-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zG8IXqta6ktYhSzK8WUTzvrebAAEHhnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX/Uq/VyQLow4J
 dM/oicZBrKN2aEALghKBOf+Pt0ZHheCDhH2c0NR0Fn0lcigUDxrDXlEvhiuv1lxORnbaqCcHMSM
 x0GEZVeZ0cX2HJ5GSglH2dVJO67oX+KPFHeoFtDdil/he4FQ9qp9Rpdzp4hJfdibdzEPtAo33gz
 JWHQdnilx0wHEJvrLfepul0zdOe0994LIIGNa9PXhuMshO9LFyIFxACDCoyaP+tT6gEweAH0RcL
 ondOkG9nGe9BgN0+juGISpaLdVGswyBUjv3d3B+Ptg3znVgm4RCZup2qpvEi+cPErxVqb7mWt/C
 0OM+9B7geCS/oe9kU3gzpIcB6yxDx5iIrtBRkskwjIwh16rA/9FV5iWTzko+QCTv1lbqgWce6c9
 sJT37BGmRJsmBV2UbmX9Imvgh8ws1Me0Cq8gorlVEFeRy/mufDcCxIjuIXX7IkG2oLydxzD5qEh
 TDX+Kfuqr4RTYV+mRhA==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf6010 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=byRqvHi71s-wVIH-LgMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX8uki3svjVcvS
 VKjpPtjKm6uFP5436IIoL++hfVCMyK3AGwO+jMDnSYTWi0tCU2Iq//g/D6ylybXi/5HrYdrQ90k
 smSnkW/Np3YNQNUWPa6IQBaQ+plCcWE=
X-Proofpoint-GUID: zG8IXqta6ktYhSzK8WUTzvrebAAEHhnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140043

Currently dwc->xhci is not cleared when xhci_plat_probe fails,
leading to null pointer dereference in dwc3_qcom_read_usb2_speed.
Mark the xhci pointer as NULL to prevent this.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..b01cf49454c2 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -219,6 +219,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return 0;
 err:
 	platform_device_put(xhci);
+	dwc->xhci = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dwc3_host_init);
-- 
2.34.1

