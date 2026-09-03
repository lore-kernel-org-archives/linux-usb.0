Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4354457C2
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433798; cv=none; b=m3GkWxZqaV/tCE62A6DUO+v4Zejmqd+2STCs+tLOJBS4Ocg6kRgEcDufnAUWMOnoAT+hcS1hKaPq0rOhgC71wCFuVtIRp33dg7YVUupRTz4O/7tdvHroZrHorvTkZ5ZNVNP4u/5Mj73sUnhi4sWAQAKcRBDtWUP84Ne+ZuXaa1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433798; c=relaxed/simple;
	bh=CtFHA+QFaXQGtU+XSjFdTydzfPMx7yIqmy+eAPi+YfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U7+AtEGLGETgi1AxFIGyQtXHNtxOssrZZgujfVgN5bhmpU2kSdmtp8HnV83tnEu9+gDJaqFACgnN/ZQycodxYqSDSTd5w+kSMgL78l3qRmR8Q8RvjLz2KN0dyGGLytWxOUSps9QQX7mahTQDRgTDFfmVmZVGaCFE6gLt+J0esZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omx5jlkx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omx5jlkx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AquWO740898;
	Thu, 3 Sep 2026 11:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Pb5QgJ1s4Shuvdea1lRJKr8VTjS5FByPtu9
	Lv9zqGSU=; b=omx5jlkxxQr5goJfk90WtZRDp5DBqMaT1x23zXO+rQx83PB6Q6t
	8deP7nycurCnJ+MsBVbwRg89UrBIo9FuYHDop9HCuKtIw/IwdlbxdaD1M2QviQJJ
	OZ5xyBzRt6Gzy8wXi+kioV/GqgcijYQJm6/roAoi+7RXCdDOPPcGdcs7P3VZP6kt
	hAunqy+JboMXLqBoKLmLhJrrI6JrX62SYUU4nx1z2eoNat+TbbYCG8RpjSN2grpz
	AOQZ3LTYvZ6/qvUAxHmR2NVA9fY82CwAXgSeaQ1wmPIHGd1w93jbdpbcpjuPxwCi
	nKkS4deS04Og4XDQ01Yi3jGAHSNk52GmwSg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hf21-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 11:09:53 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683B9o73370782;
	Thu, 3 Sep 2026 11:09:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sarar-hyd.qualcomm.com [10.147.241.63])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 683B9oTa370774
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 11:09:50 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4160332)
	id 829F163C; Thu,  3 Sep 2026 16:39:49 +0530 (+0530)
From: Saranya R <saranya.r@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        Saranya R <saranya.r@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: gadget: Fix spurious suspend event during HS link training
Date: Thu,  3 Sep 2026 16:39:47 +0530
Message-Id: <20260903110947.2761354-1-saranya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a995581 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=dUsWMgTqjhcbN1arKrgA:9
X-Proofpoint-GUID: Ww7PYUXERvp-FMNMNjtAZ68PBzKUAym9
X-Proofpoint-ORIG-GUID: Ww7PYUXERvp-FMNMNjtAZ68PBzKUAym9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX9tCaOxA6STLY
 vUqXyIIaexF3dz9I3imW3MarTgQtRaeweVBjlfCCOyvdogD2nGZcvfh3QHs1sUeHmEI8FSbtavT
 UiC5jtxPlA3QkivAHm2zP6CYtHPT/X0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX3QbWlNhnF+Vd
 HmyKcsRSbqeWPZnl8oPPyr1YaL5+tJvgxSQ+0cvkHeIPKgTgXhCwmpV7hVxwJG1Ri3VTF08FmfC
 Q0buuiFnx3xzSRf50zqC6aAKy2qxVBn8SZBBR74awElH9z8GY+99TL/KHioH5lKCqV46KvZdvDi
 gPgGgkI4THAXCM2Fy3cFk92TMturouyqblkuW1w12Ol1B8UjSFvBoupwiwBK0kIUR/uF2JoYCig
 4yNFDSrQWYaFZV+1UJ8RJ1iN033avsP4poc9iqNqw4VzyReAKJO3FmRI65TV6RZecPa8hppnW3q
 andx7SfURQrvcPycfXkgmDb6+i95o71IbFC1VldWfvKWEnG8616OsNvdo381SuzWEK6FfCcXzki
 MwtlPx7UqnRm4NmtS+RubuyAasVY+SjVq08Rmm0VFzp/vDV6GeMEhel/SRM2Wg3prDHZwOSGvWn
 Zku9DaQPMPZdE+jxP9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

During HS link training, a spurious DWC3_DEVICE_EVENT_SUSPEND carrying
link state U3 is fired before CONNECT_DONE completes enumeration. At
this point gadget->speed is USB_SPEED_UNKNOWN since CONNECT_DONE has
not yet run. Calling dwc3_gadget_suspend_interrupt() here triggers an
unwanted composite_suspend, causing the charger framework to drop
current to 2mA and then ramp back to 500mA on every USB connection.

Fix this by skipping suspend event processing when gadget->speed is
USB_SPEED_UNKNOWN. This precisely targets the pre-enumeration window
without affecting genuine suspend events: a real suspend at ADDRESS
state (required for BC1.2 compliance) only arrives after CONNECT_DONE
sets gadget->speed to the negotiated speed, so gadget->speed is no
longer UNKNOWN at that point.

Fixes: 4decf4060ecf ("usb: dwc3: gadget: Change condition for processing suspend event")
Signed-off-by: Saranya R <saranya.r@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index bfb20c3ac392..7d0d24b6c04d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4465,8 +4465,18 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		break;
 	case DWC3_DEVICE_EVENT_SUSPEND:
 		/* It changed to be suspend event for version 2.30a and above */
-		if (!DWC3_VER_IS_PRIOR(DWC3, 230A))
-			dwc3_gadget_suspend_interrupt(dwc, event->event_info);
+		if (!DWC3_VER_IS_PRIOR(DWC3, 230A)) {
+			/*
+			 * A spurious U3 suspend event is fired during HS link
+			 * training before CONNECT_DONE sets the gadget speed.
+			 * Ignore it at that point to avoid triggering an unwanted
+			 * composite_suspend. A genuine suspend at ADDRESS state
+			 * (required for BC1.2 compliance) only arrives after
+			 * CONNECT_DONE, so gadget->speed is no longer UNKNOWN then.
+			 */
+			if (dwc->gadget->speed != USB_SPEED_UNKNOWN)
+				dwc3_gadget_suspend_interrupt(dwc, event->event_info);
+		}
 		break;
 	case DWC3_DEVICE_EVENT_SOF:
 	case DWC3_DEVICE_EVENT_ERRATIC_ERROR:
-- 
2.34.1

