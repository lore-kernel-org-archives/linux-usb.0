Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C551D416C
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797836; cv=none; b=sbhL7sDN+qFGG5F+S/rGPlzfnuZM2NCQCLwz0DMOOl1J3pFDCqweV1onFrlWn+is1Iuyv4jtSn+Aiz/MItdoHvaMNxU5bQkKD9Spn+q2RnfhrkoAK/x28HfxYmLxxyVMFtaNVXURzRlh5es+A38KjYaTGVzfCY1pK/sNOU3+4e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797836; c=relaxed/simple;
	bh=70pPnT/EtjQEEDK1e1qoEJz1Davnlnoo+1/hv2+cdw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ijhWC5CgYA1pPJ1XrRYzPJzFC2JJuqB/l4cYT6aOaDFzodObrKPbypJJpy9l3k6Vr/TDxKmk8QJ4svUdiI/eXIM+Y0Yf2pNDHwogQUoa9yobbN7OfHCGqcpXS0EZsYAqAdEX7s3JpzuiPfpNoq3F7s2EVHHku75oZvsS5dF14rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G63k9hLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgqKgUJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G63k9hLY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgqKgUJs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KbX72873974
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y+I5f9T/y6bonaL2H05XMwEcoDN9TAEPi8D
	NqiiPkxY=; b=G63k9hLYDwAOLTRefluPoEskB4O8lcIHdEcSHJa8p5iMt+IkduT
	v4fauCGH2b+q08IRy74X60wqgnTbBosmAQDCEAr7lQaJJgx6+H61fP7t1VV3nXhM
	Te9VtSmSuUYlYs37EO5h+7vJaGVAp4OEbdfo/N1GJf2FkGgoP1ALAheU2fM8zGXl
	2JyE43Mk0fvCQrq5oR8izzSmfRsxrOiGcl5tJSA6kETn7fGp9lBySrCIllGV3Tq1
	XM3+ZU4UxkVCEzfV+ozahdXCFt+a9SXJ4grU1UKzFca58rEOilXsyW65Y3p5Z8Q8
	5zsQs5vqT+bd5RSImV1leKYsmfxgJeHV3Mw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe89m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:37:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso1371184a91.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 02:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797832; x=1792402632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+I5f9T/y6bonaL2H05XMwEcoDN9TAEPi8DNqiiPkxY=;
        b=cgqKgUJsCCdNwaPJmVrcxvgrn4soYwl3IHC5/BbgI4yoOrJHY4Z1BVG+9O7lR898De
         k3ttrnqMXEcQnuXerkymPvpzN0igBkJbGdy8QekPwY9sIbS8WsuRwt4lc9MN5KLdXBbq
         2pddlOWmgRsPj2ahIgEdclH5KolcH+eKF8ApH/CTGgF6zUEhd8hqzWDTAUuf86TVQNlj
         whybzFTp+qCgt/K7r/QXoFU87CnBHtGDcb1uEfZUrphkO3Fy2ut7b3RAC5y0FGNnPSXU
         2iPgtfiF98SAuOJrhVohJLPRMokWX8KbBHscWQK7xFxgu+D1iW/zlYRKRCJVrXuN+HOS
         1FXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797832; x=1792402632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+I5f9T/y6bonaL2H05XMwEcoDN9TAEPi8DNqiiPkxY=;
        b=qUzKfdBKxyvXrHzqn6FuMKVWOLZoleEbBcEDSTQF/p7Tyxb1HrXIXuqAiPoD0HcOSy
         EdfCgWw/eIYlYwwq35F7MrSyPQTpNt61cmHIxY0qG9NTsoZbrBLkSYSuQMcVExukvSgm
         O0eOGyL7q+c8X6469jreABXqE4PojWkf3QKxC4o6N0CXh/0H7TftJx7VuLXT6DYOU3eI
         Ji0xOQCYiyuCcPtVABintNsluH819vcWMTuSZqdbRhAMF9oZgdkYjmsPoWvxPUlqOmvl
         H6oF7UrfjZyCq8m68a4DnnHL33rYR0nxyL807nqjVO4egr7uRCASYOou2krsvP0Gcfhz
         D1Xw==
X-Gm-Message-State: AFq9FYLjRg7XQxrmNI1ynWIC+FOEF1zNwyxrb32BcAtiQHWhe9O7Yj6l
	r7IPlYw/rV8ICZ2uPvNkn3A/RZgw4fmrCpJfvDlCQYE1yOJDubWiQRhcQp8yQonl9LnWjXi/8LM
	D7Y1+OeYb2rdojc2GlI2AePFaFJrX+fZyO5PwOM61TrOsi76+zCpJheoWFDvNACdRreF0dGg=
X-Gm-Gg: AYBFou1JLLIc6ijqcU4GX5FRoNnIjwWuGyV0JwKdTlQakY73aCinr4GsMnwF7+5w0o2
	ZvlkYVWcMYOhggJnrQpZTsXrNgbmnz230yX9/9r4QwoE2OTYE/eLsfyCLvgYnHRLnaaCkAAd9ki
	w+Jhl365Ni9Jo4wcq+wWecVRWIuTrirGYJ6nMQj3XqXvmysuAy9wcu5IvEvd6pQAIUkcQwNn8hQ
	SUB2qxqmxtVUEIyhwyhFEdsD80lsYGpLqzWKL/2obqQGXHcNvRD2wNUqYKMOsRv5SgpmlFSY1Q9
	zMDNjzE0QdOqUkI0dshQQZoO2vFF7M+X9zEh7BLTTnSfKwsJu+6TH3mifFKH0cVHQ4rLcVNcCXU
	1erwRYvDRhp0T6dIxJySkhnqoFcgM
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6677804a91.0.1791797832101;
        Mon, 12 Oct 2026 02:37:12 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6677788a91.0.1791797831577;
        Mon, 12 Oct 2026 02:37:11 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0ce7sm16637814a91.15.2026.10.12.02.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:37:11 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: Use the correct PHY mode for USB3 PHY
Date: Mon, 12 Oct 2026 15:07:04 +0530
Message-Id: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX+iLSH+Lvu7hO
 I1lcCVCl7SUdoRfOmmjZhHIgyXZXN7G1uddycnTlN1LOKRmZmctzYDzFqQ30UHPSvbU9YIPu8kU
 zQKF06sfmgFJgHPA5LA8v4a6a3iCKDs=
X-Proofpoint-GUID: pY8CjnPbUv9HRffvqWFHVqoGTwSRxD2Z
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6accaa48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=g4LtLXktVRgdyDEntd0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX/N/WmaJbZ2xQ
 a3+zkZ2uZ1kK7CzFRhbDiOgy3DqLdeMcxBoJ0RY6z6FqQe6w+mdjF4oWAXCl95953JtZvZW/HjZ
 xIZzLzCo4sdOzTgFqLqRCYRalksFO4NUWNNidUXplDP3Q+DH62GEr+1lT7wjQCGr9sHMk244Z1q
 dRsXMmylb0rm65tEUYpr5Cf8SGirhLQuC/iKdlRPAEDm/2LAWQJg0VDLXl4JMHDzbLNrN5WNG2W
 i3IL6lz7HVZccXgAejY0GWOXVpvRwam5his6bTNCPJ/swRCjVucQlIX2+K00BKKMxF284uuj04U
 IhHIqmwTGRQTf1d5B9IcxMF2CImqTvSHKvjry5p/jNezrZ4IHSnTuILAzvOdwygWbwCKnbcuQnp
 D7tVqMX6COXjUFvGu+Q0REa9SIN68Y6Ah+KzOgARqg1+Z3XyvuKUwXppw1M0SkooehtOHIxYGou
 NBxebwHYVqiSI1nZHIA==
X-Proofpoint-ORIG-GUID: pY8CjnPbUv9HRffvqWFHVqoGTwSRxD2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

DWC3 currently configures USB3 PHYs with PHY_MODE_USB_HOST when
switching the controller to host mode. Even though usb_add_hcd()
sets the flag corrrectly, it gets overwritten in DWC3 layer.

Some PHY drivers distinguish between USB2 and SS host modes and
expect USB3 PHYs to be configured with PHY_MODE_USB_HOST_SS. Using
PHY_MODE_USB_HOST may result in incorrect PHY programming. Fix this
by using PHY_MODE_USB_HOST_SS for USB3 PHYs.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..1bb87a370725 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -251,7 +251,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 			for (i = 0; i < dwc->num_usb2_ports; i++)
 				phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
 			for (i = 0; i < dwc->num_usb3_ports; i++)
-				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
+				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
 
 			if (dwc->dis_split_quirk) {
 				reg = dwc3_readl(dwc, DWC3_GUCTL3);
@@ -1643,7 +1643,7 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 		for (i = 0; i < dwc->num_usb2_ports; i++)
 			phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
 		for (i = 0; i < dwc->num_usb3_ports; i++)
-			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
+			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
 
 		ret = dwc3_host_init(dwc);
 		if (ret)
-- 
2.34.1

