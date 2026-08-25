Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62036308A
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634532; cv=none; b=laF2mWWkGjEEj68caCCEa7bMInCYenG0i2PI+FXRLRVXugIh3A8qPHFwp/yasNs3HWYCqn1GBQCe77CAHbhKc2rgvFNLqZEDHeKN57aa4JOw90MzO2ftLJ0OPB5RUXCkx77aCo5fRkNuKszDjogVXzj9dqCAKgYWZQmHDQvp2rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634532; c=relaxed/simple;
	bh=qBYt6yhJO7+dHZiSphodRC2EaEeWcgp5A0hPgNDah7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/q3/RX6I5QxKy0MUhcLKLC8JFRBhIw3+Ts7VYaDpV3zBcej46Bh2rE8//VmmOdaQbgd2wKocDdMtAVzIkPH55LCgpRgdIPKRLFoZnazJsMZgrJksG7cd96+INo1OFy+kXWmo6DFvCHAhqaCy/hc9frchYKBc4VoZ7IBX9aT5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNZh01um; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CS7s8cjk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNZh01um";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CS7s8cjk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R2Ww624824
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=; b=eNZh01umv4GdOVwv
	wCTXkPyXFSYWDH/36bn66FgXDWTY1XbSWM+fqLlqYheDN8fIse5m/nCj8AMIlzej
	uiKUxQpH5P2SDTJhZMiHVJ2jpZWukgpDipRREoFBewEsyxibF3jJlwBB2DXBts1K
	x/4RoQutqdVYYuV3j6MN879/cAKLlREruQRKrhHc+aZg9VFIg18IKDL1OY+zweR3
	ntdQewXqWZJBog2b5XOsyAkPBH38aywdaN1sOzkK4XQ99nK/VEbLaTtQ90L8T9w8
	U6KwbOW0aNqrGwCJ/fcKPRB7lA4ThwB/p2NzQGRQ5YGdLjCX8eYzWwoXT9aBACTo
	e4DPcw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdk87u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7523414a91.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 22:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634529; x=1788239329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=;
        b=CS7s8cjkzm2ULrmq0NgpSDuHaGyZKKntHW4hHZdBFPWy1RECvg2FLz5rrtnHtIDGKd
         OMuTzRw14LJ8jGk4PAA6Xkz7k+6VPXCxv8JUWWIsA++0p0NyEzGfBxBq8wpalJJ2tsWL
         vtl89D/Vrn57drTtzzvCg9o2RT4OcBXWERsLY+gDVD+0MFVT2OHwhpiti8RqI8myBo1W
         Hdg/KsMEFUmqRMk0OwWaiCR5AY0vG6FgiB/tmgCa/RwRVC6ajTulxRVF0FkvfuGw926l
         3wLNTv0f+5F6x/c/9ODhQHHfBp4dq4UXuqGG4T/5UZJTtKHzgEo+qm7NtCc/3/TplqCc
         MVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634529; x=1788239329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=;
        b=iJC3p5AdKcxpnBvoO1r4NDbWtbJEKA4c7Od8y34lGeoYQUpqEVs2QICA86n9h3odY8
         AynCIViMHT2xdmbusthhSwzLeHyVgU2yN801sJlnG5mAX68xnX2M/TRzooR2GzmLvOYQ
         v3GccgeoEfGgLD7PknI0fZCQRuUmFiXrL/1mZa3PnFMnPTBgUGiKrKOhwsxUIcFrJt1g
         e/6B6Ph7h8Tn+4HD+en7CTy/uK0YYFB1dsB2pXidvK6lTY/3+bs14oFLxhtAHSYau2if
         9LP66WyyGudOiDxnJolA8IfI3/ozA4ht0pT1JD/Ant7oAC2EN49ashm/aiLFRbDCL0vc
         ncSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyjVcM41sHiv2Bn2V58Q4ROjRZIMKmO1VK8zi8fb/PhS9yE6r0mcX7MlOMURwUyf8z1W5K8JMkAoY=@vger.kernel.org
X-Gm-Message-State: AFuF++lpwMd8gYk8nLcZeBGE+/aOvpGXM7Uh87vG2dOfI97leA3AW/yV
	EIWTn5WYrByfLCEPoM29+I9h/dtJUtaMFV5/6Nmn2UgrDNYFuGWp9so80EZ3Uu/aXvpTjtrE15q
	qV8ZjDWLqbEF0Cd+zy06Dk6YzNQP0mmB2dnLFbcwcYnYpIKrvOa8J1ZtRs5H22FE=
X-Gm-Gg: AR+sD13lRrb0i3gvNnP/gt0NPsavufr6k2vaHjIIyJ5+0/ak6TKG5ta7JnBGApt4f0+
	6tDPKSzV0Qf0cPrF+Yc+7+jeJXSUdDjdXhTyO7jcGpmJNDtYLfMx2i04XXSO9cui/B9wyTQhEIt
	JkBzxuz7v6hu0iLQPIAhgYu+jbhMaxPh7N9f2S6f6NcIHMnFj9Q4yTyk/bs3G4N/y9x7Tb6NP0l
	45mj46q0v/mLD6HPaRAfnEemH8Z7v/DKatz0J46mzLCNLHwMqjAdYjOv3gy9ujsDF/5sztl05YT
	+4yJg9/JZXAr5VTPQ7SSFNhVksyxiIL5lkVaBzQQaQtFXM4k4CWv7NzO1L3DHItP1mMoNrImiLq
	o9lCXbt/JRBTXtBotExirXHwi5CNTLjj568arcLEfRdRF0Mmf37n3Ow/b4YRNO2aA6/iOf/pKzX
	/PNjtnomR9OBig2n1suLMs+rRoFu/fzg==
X-Received: by 2002:a17:90b:5112:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-395dee8a5c5mr47102555a91.4.1787634528666;
        Mon, 24 Aug 2026 22:08:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-395dee8a5c5mr47102483a91.4.1787634528264;
        Mon, 24 Aug 2026 22:08:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:38:33 +0530
Subject: [PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass ref_clk
 to the core
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX1uvG5PGaQjdb
 Ohk0/A5QSUr5h4MJp88DEDf2nr9V50MQxjEPqzGLe26sDp/xd86uAR7vURLDQLuLoZpoC0Eirxn
 +FR1M9rZDLsldrwbrxDqMx5jJ/JkRS0=
X-Proofpoint-ORIG-GUID: 6fyy1R0oOCPP3vx1YBtphRVjpasJHvJl
X-Proofpoint-GUID: 6fyy1R0oOCPP3vx1YBtphRVjpasJHvJl
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8d2361 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nsXwHlzZWJbxCLJ-4VsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX2Avopf0fiLLj
 ORA+b4CvJ/sDmO9ODtt+JJpk0Zma3OnZsVqu6z09GXWHsIX5ot0PAL2XN9mRnFX3QLcbmK3N+Fa
 5sRFGnj8x2lXYNX9+ql7FPsM0U2RP8NwKl08WklrA8w7wc23sPRIGGhWKge7n+2z79A+qDzvxqp
 1o2b4Bv5R+0FKg23SwQTbSCI5j3drmFnQ6MIsG1aJtYLk8VqIyEHnhMtq7dCsCqMSCN2ekZWe76
 Yr++NXbqh82HKzWsQTOSJUdNYwRWrgIFM8fFWKN6R0B2a/+R0sIzOb72NLGO2S+dUaEP2hv4YYZ
 F6klgk5lDbCxign05faaEHQiVX7PHjzyMov4bAPrWTEiiNKpzK32XWpB70n6/6BsV2GvwR34Eo6
 c8SpFjo5FY3BFSkhBZcFJrEHsPBmVjJq5B79ray5daPfX32u7oRU8W2HHson0HcO01fF4O2Jp9D
 oB64va58Idtkcjl85pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250041

The dwc3-qcom glue layer sets probe_data.ignore_clocks_and_resets before
calling dwc3_core_probe(), so the DWC3 core does not acquire ref_clk on its
own. This prevents dwc3_ref_clk_period() from programming GUCTL and GFLADJ
from the reference clock rate.

The deprecated snps,ref-clock-period-ns property is not a suitable
replacement on IPQ9650. Its 24 MHz reference clock has a period of about
41.66 ns, while using 41 ns makes the calculated FLADJ value become 0 and
leaves the reference clock configuration incorrect.

Allow the Qualcomm glue driver to provide ref_clk to the DWC3 core for
platforms that may need it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..2d6de6469c1e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -705,6 +705,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.res = &res;
 	probe_data.ignore_clocks_and_resets = true;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	qcom->dwc.ref_clk = devm_clk_get_optional(dev, "ref_clk");
+	if (IS_ERR_OR_NULL(qcom->dwc.ref_clk)) {
+		qcom->dwc.ref_clk = NULL;
+		dev_info(dev, "NOT setting dwc.ref_clk\n");
+	}
+
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");

-- 
2.34.1

