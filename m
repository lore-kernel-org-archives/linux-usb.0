Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB881377EB2
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165921; cv=none; b=BXlV1OZbAml+csYWr8f6XIP9pwEyeCj192Vb2OGWxJ8DE1lw+p5BhbhBVSqGJjn9Cozj/SxrBYPAF0gblGbl57cTMBJXR7+2Kx25P2/5HOog8vd03U/1b0EyXfqtD03yaNQbvO1uiOeJBaHb3sR/UWFoIvcR3+Xr4y6AqZ9ID0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165921; c=relaxed/simple;
	bh=0UB/RaRy1ouqQkebbPEeOz036DGdJa1e2gX31mDIAA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GeCGfSq4GgDID1X4MrUPQ1ABPqRYPdpKQQD27FWV5TPD5modAvGmJgWP+nt1zWU7EQzcf//0/P2FPcCsNOOhUu0gaaq6oqVGXjKzhXCLDa2qpDnryLvTg1bPG2MqzP2SyJly+vWkn0g+NWqIBchaf/wipQTJ2UnxX5KMf4RU3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeCin4d3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqBwL+Cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeCin4d3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqBwL+Cz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GRfi3712096
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 08:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq
	9FNId1gw=; b=oeCin4d3RJTpFfK//LqhiIMeFeKaCrfvdtlTTIQq1IwUnvIdOUv
	+X7xKw6J49bF7ltUIcAOZTTbPu3NWQYm8ZUScTMIMxnmvWpvRHovWmn6sFrJlgGi
	B9zh/S5iEFUrhcZ1IhPhIcCdVW3Q0bgbwfUEarajKnZ5Yskd0Azy0UtIyTDbdIHY
	OVhNAvslbUh5LqZgqTxtFfPCn6OUj+hzhqbfVehMJJ2WdD3L7dCOF8ymkMLr2NlD
	pPTRDi4ewGLgx5jiH9ujFDlD828eaoB/kSp5lDijScAALIq5pLdpt8UVJ1ZiSQcY
	S0vJ+mNUxrL8GVdX79el7uCYa2FJy8Qekyg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uad63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 08:18:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8509934b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165918; x=1781770718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq9FNId1gw=;
        b=NqBwL+CzWATlM2NUqin8WETAL37SDvB8+g2eykH1TbBbXMxCpIDrFkcplM8VC3DxMi
         ZzMeVBn6z2mI2WWIaselcP/E9vQvR3cIt/Ju0d8Y991B0COHPwem/SumwxDm+cAXG4Hr
         60HZjm/811q/8EPvkRCaJkbUKZYui5epoE2wQwm/jBBUzCh0HpwR6g0tzbKVPeTj7Swu
         uNs16xVMzBANqI2bG4488RagUfRPYAG+SHrqKwxebG9rB2BzbPtyJ9iFRuuoJHNRNorb
         Og+Jwh7msSpBkmlIQAJ8iaTAb20MPz3DPo1Bg/7jQ82+uU0GBddKEI/7EPXlNrddgVHU
         RJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165918; x=1781770718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq9FNId1gw=;
        b=CEwFRsM/Go0GPQ0ZGuF6G31YoHV7MOSVHxeV6Zch/C7xcm6JX0htCxHCsSL010tvyE
         LPuca4JmygEKE0E4y8+ql8IXwVmYmbjHKTMn2WijBYkIBc5DTK5c14bjxL+iYCYzIvR0
         xKJH1+uhcXEesY8btAfzmNlBdCROgdlczzSus5NP2D8LQr8hpe3dLvYYgs2OyuoaTAT4
         px4r9vwcOTB7josf4o4geqnLcRlpBHKutfndqlKieFZFw0+35PuuXMviRXJqbvWJtQWY
         KJOvE0LflHv0aU+H8JT1DmCHD+wdSLEo9j5L0LacpYQHTE1vQVG6d2eCn3JBeS6m3MMw
         8SlA==
X-Gm-Message-State: AOJu0Yx9xsrvl7AM7grwmlhImoSR+rAbjnFEWgvdxMB9dEOSLzFy8vq5
	dud4FDjLA2LhEdW0WpDWt/ARaG+NBHJDomWjZLY0mrFScyvYiqYcbfzYS+mImP7XVCuZxsIioOb
	tSu54a+KWDZZGAW2oBd94rqMjYtvrPPCoELo8EldJiMXBlfatcj9j3ob8fsvbikU=
X-Gm-Gg: Acq92OHyal0CPThglhxqir6wXJb2sxjC2iA+784CfAoyyymiZkMuPCUJQaUd2nDBLPt
	o9s+Bs73NoT7y7NHVL2Qvi08Iykwgj31vVS1kec4WVSz8z5/YH8u4FE1wJ1FI3+U2w+k7mDkzXI
	oO6WjVriJ82Z7Ym6q7OBS7jtBHrFimux1cF6VZCmnUkRb/EV8mUXZDr+G3XBwMrILAQMers3K9C
	ZsRdQrj5xCzOZ+b+nQ8oPu/CQpGdoF4LZsDphWnOLshx7GI/fufoYd3tdv7UVTGi1+09yZhM5B4
	zUtsYQokzSOhjnHyuePW0hJguzbZdXM0s3VMj66kCrulJqi6/5O2ZvjkNzrUWkRIx5lCtXvewpO
	ju/bZOUEgDZsKEvdh9mout/88AEh26xmIM3lNNodxScfCdHYU1gRsCVzo9B3A
X-Received: by 2002:a05:6a00:1f18:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-84336908cbemr2281710b3a.12.1781165917645;
        Thu, 11 Jun 2026 01:18:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f18:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-84336908cbemr2281659b3a.12.1781165917134;
        Thu, 11 Jun 2026 01:18:37 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8433831ce8fsm1188753b3a.57.2026.06.11.01.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:18:36 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] usb: dwc3: Update nominal max votes for qcom usb
Date: Thu, 11 Jun 2026 13:48:21 +0530
Message-ID: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MSBTYWx0ZWRfX0vzN80xCIPb2
 lGfvqxqCl3ldkE3V/bWMFeXb7zaTcn3CvEIeET0op4Vou20/VZpKPni7IXD+EibgeGc0ufTPYb8
 5kIMHpZ0OAU9qBGXCz3MWHPc8jQhVL4=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a6f5e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=g64AcZ1iVWnUTv4HF3QA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MSBTYWx0ZWRfXyli+vWVIAojI
 txzb2a5xQ6UaJB/t4MzYcqp13lBlnE8MIW7AEFa9fkhT8I9d3V+mj3uTupuTapqqmw/oKmyH6qt
 EoWz8+GV+qlXrDBEBrxqN0q8CrFbMbNrQNvHdStQ0wzo9uEp1vtJlKLYPXJf6bS4yA6ZO+ZRFTS
 yN9pkAMk/fVlrTvFodMzaEjpau1p5aEzZYk4yIxM9LML5inktUdFQm4coeVgAQo6Z3HqlXwe3pY
 h3qgti1iOv9m2OdoaBbOVa0KuY+RyPuLiFx+ffX5cgbKcIURzK8sLfRY17LjrctlWMst8f2K8IM
 ZehtfvHTmHmruZ6BqwO5Oh3RNW5OpJjSFpmaR15vfgXX+NZ4g24j9RNTk2b0p9WQlYUOHGHki+X
 Q8/4xyYGAAchScgDGJD8+p515L0Eqm+zuvrsJGQCcFBo2tNH7/eRhkZcLo/v2Hi/TQ+NASWUOs7
 Z0EEsvCdMR+MFGBURtw==
X-Proofpoint-GUID: dT3hEOC8KmvnyfJmA8F4s0L_HYy2Ay9R
X-Proofpoint-ORIG-GUID: dT3hEOC8KmvnyfJmA8F4s0L_HYy2Ay9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110081

Increase nominal max votes to improve DDR performance and USB audio
use case handling.

Currently, Bandwidth vote for max nominal value is set to 2500,
requiring DDR to run at 1GHz under normal load.

DDR is allowed to run under nominal range at 1.5GHz, which is
consistent across all targets. However, with the current nominal
vote, glitches are observed during multiple audio use cases over USB.
Update the nominal vote to allow DDR to run more
efficiently, enabling simultaneous multiple USB audio use cases
without glitches.

With the existing vote, throughput is around 125MB/s. The updated nominal
value increases throughput to 145MB/s.

Benefits:

Enhanced performance and stability for multiple USB audio use cases.
Improved overall system efficiency with higher throughput. Slight
improvement in the audio KPI from 17.9ms to 16.6ms RTD-USBC.
By implementing this change, we expect to see significant improvements in
both performance and stability, particularly for USB audio use cases,
leading to a more efficient system overall.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..aa43a03f3c7f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -46,9 +46,9 @@
 #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
 #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
 #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
-#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
-#define APPS_USB_AVG_BW 0
-#define APPS_USB_PEAK_BW MBps_to_icc(40)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(5500)
+#define APPS_USB_AVG_BW 40
+#define APPS_USB_PEAK_BW MBps_to_icc(80)
 
 /* Qualcomm SoCs with multiport support has up to 4 ports */
 #define DWC3_QCOM_MAX_PORTS	4
-- 
2.43.0

