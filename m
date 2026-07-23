Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271C3442B0D
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804110; cv=none; b=kJoy7RZB0HdFMmrDsaZjcdaT3qfkcRB/LGJyC/M1NKLkkxyMN3oOi5ZdvPaEHW2VWboRP8WCQHaN0JhmICNTV1CnazSDlv6GykRH1S0Ht/47Wpyfk+QMBbClvhhNrpEjbeYxrpbTL1EZSOd5XZ7NNOP7dMsKs34xu9HDEANUhuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804110; c=relaxed/simple;
	bh=SkWYEA8SWQOC9OQOzgvWGRyQB24DxeCGK0FItA5xjH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ogsyRQHiF5jUkp1eRSztk6QUwDNycsGbqS4Fa1sJrukDlt+Q1YPB0arQ/li8Qb9hbnkJBd2kcyKtRTdDRP3YAS2CAgxWouA6ztZ8QDmTnSLsv1j4jZdJLkswQ39r6AtmBOzNIJfGEQxMwufuP4rIaLGFtgiRvz7fofbEGRXOPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anMlLd37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmPtAbjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anMlLd37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmPtAbjX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qfx83642614
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AD10OMBFOQHaMcw6UwRxqD
	mekzrLtYWRebhPYOowu6Y=; b=anMlLd37mid5ExCK+KH1SuPVUuxyHfR5c9z2bT
	6XSxCm4Q9lYtpHlfO15Md6jEkXS5W29kALNDEY5bf6a6FgckqTodElM2FGRRWi0Y
	D2esQGzidnfybUzovkCZQlLyFGtNc9VJkR52hvH6Abgt+I52BFoMpTzjI/Dz93JV
	sVc4j6UJoX6cvrs5uSaa7yDfQN6h7bx86CLSWQGwcjj8wrCYXgzILjLq+T54K6tQ
	jc+psuTsoWSRAECU52P7kBQG7drqGPVZrnLRkhzZkX1lTDj/ALMBiVbQq44FKGHq
	hxWubA0ZBIL/1fMCYwoKuoOs0uk+uM4jarNS+oqsC74MpLxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh9nud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:55:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487eb67173so1034568b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804107; x=1785408907; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AD10OMBFOQHaMcw6UwRxqDmekzrLtYWRebhPYOowu6Y=;
        b=dmPtAbjXTfDuJ3f/AIgEHZgf3SISKHDvekf3xgzUYe5PtIUjM4/Rgwiyerqx9VoUSb
         BDnbLVbWVW2ba2ZpYcMn5ZM0R0DvABKDqrohv5HQRhmmqUcsBGENz/WFtylApuzQg+8a
         9ClXvbg+kBL+zgXnW91pNMpvdul5/xaJahp5uGBvJtq/HRpOAJcE/djHc8P4RRjz5WGC
         LGSfzoIU3W1rdvQX9Z+BeMSSrmtzk5EsRfELFpgewYxyxFT9/azESgqoHJeYkLqfsAfx
         7jUYzPgAzIPXjCyBcdFUu/OM00e0IES1XAmmmVUmT2VCsGvEoj5MHkplpSgxd58cV33O
         NqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804107; x=1785408907;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AD10OMBFOQHaMcw6UwRxqDmekzrLtYWRebhPYOowu6Y=;
        b=W5egDula+bgGdd6T2U+EuzStvkSymbYcBT/X95wxYCIrrr5MM9vlT8W9wvEN7zGCu0
         irVs9lcFrbO/i/fo9ERLAMk2KqgN3wuucOxyXthusQAyAgt5ftvN9daZH5NHtGe4tPHJ
         n3UiOjIxn3rjo/XjM7b+TyqyfLqZh+6MoEWPN4dnP2jCC52l1RegNMkGEP5rBhMehX5v
         HM+6BLoGd5+9d54zi7Q5tcUDlDE2oF1zTm/JDyR9Vap7NUdmOKrFwyt9NEgrAXOg357A
         K3t0zVcmuiYFFUbAd+jPjKwpxyBmCLl40vcDhSJ67FRRfKkiiTKWTRAg3M6WLkSB0col
         MhJw==
X-Forwarded-Encrypted: i=1; AHgh+RqAsjEB8Yxrv5oOyPSADRACj/BC8kb0DWHEllX4ZTPf4ppvXNm+juct2hoQsIwnXLwX/zyc+I39iZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPVMDGrpNIlGhnlpiLZf4lfyiAKaDl+adRPw4ZzzUlK00MrDuC
	vp78s4Hl6LsfY0UrQqIYIwDYt+C9XqXs14NJuM730hPCWuo0uWf0tWhAPnqCZeT/WmoKi4Gipjk
	ndyqI1iJHMob2b1+86T451d36i27P1M5AHDibtsPCoxPLKGzqwAsQSVvwq0YXhiU=
X-Gm-Gg: AR+sD13s7QvY7VsJlIZjcYhA2XYgh0rsOd/mgi4r3aydVSep5ikST7Vax7IYuQdpLqw
	NTrIIdmjKLIAKmevH8tymy7TaoZP9z5F7b5g/e9ARb2g8gEbSmqNndtwPm1A3lDm8NAOs2+x1IU
	xUrlg/tXPw5StdL1JZAkpBoXfuUgVWPu/Cgz9wdi3KYHr9M7qVJFhX9z6a7T3i6kp/asNVRFe7g
	FzwyNYrIN9iFampaxG5kxrbnjCrOUcRVh9Ahuv3FtY3d4GWY/epvIRmg1EGHE9zlj6wTh5Hzv86
	CRRdeo5741T9xrP2WE88x8S+c3kAc7UpUawaaytdIhsb4O14JEgHNy8NFt3otXFWGLUfHJLPQb5
	JDqolHqm/Y8OSEAdLTeoE96b5rUY9wtszN8BF9nmAThHES1sAmKDthYRTREk81glQJuRg8A==
X-Received: by 2002:a05:6a00:3913:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84e2c204c5bmr3091708b3a.51.1784804106927;
        Thu, 23 Jul 2026 03:55:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:3913:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84e2c204c5bmr3091675b3a.51.1784804106386;
        Thu, 23 Jul 2026 03:55:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17577790sm2874124b3a.34.2026.07.23.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:55:05 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:24:56 +0530
Subject: [PATCH] usb: dwc3: qcom: Add support to skip phy management by USB
 core
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAADzYWoC/yXMQQrCQAxG4auUrA1kRqjiVcTFNI36WxjrpFWh9
 O6OuvwW7y3kVmBOh2ahYk847rkibBrSa8oXY/TVFCW2sovC/Uu37ANGRsbEjxllYA1BLJm0+6R
 U07HYGe/f9nj62+fuZjp9X7SuH4Foqd94AAAA
X-Change-ID: 20260720-dwc3-skip-init-quirk-c110eae068ac
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784804103; l=2268;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=SkWYEA8SWQOC9OQOzgvWGRyQB24DxeCGK0FItA5xjH0=;
 b=tTFRl7YH/JoNmp2YcwmhP0DfaQ2+MKf+PW2O7gayXkGea7oFP/xiI7aR0IJrRJIHoURi6DLxj
 TSk8JfDWEJZBK8gvRROBDwh8Iw68z7j89eZTMuD9XKIhR5JmpoAcFmT
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61f30b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=TPm-v2h5D2wtuVy3nSYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 5TOIaDhOMt7mFyOs7SjFyhxK7stnxV7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfXyUcu26kWFPOp
 griebAyl+SFcxP2SnbbIn0w+GOIpcy82sAD/EIkcuntBszvMyGyOQEStUMztrTLnf+LdY/0BLnC
 MMVy3z0YKoKxXvj5r9yr0YlcfQ40Acemlivc6ZimoF3jynCi9qdEyLpLwkttUMqJ9NWPl6J9Uj4
 rKnWEYgzXik3TjDYY/MWW953m2GYcpFzT1Bqs54avL356iKRXAlTsOUfcVuHzJ00/0J/7ygQjHk
 2/69MskaRDaNKKsSFj0+5cpFsMX7z8ESgxnGboApfIl5ROI9mEp/vxWjpn/Wy0kxgshFrUQKxQC
 hhW+dTbPi4NehxY0pgVcg+Tz5RRmt+WX/nDuLnQxnhQnp98YRoAJO3zDaRINADgvGUtwhAcL9k3
 d1DrIm+PqiO0DiH8n8j4KdusLZxhkgSdFDSfEbRX0awoYKSiqlitrIRLIRMpVOOgknAGZFkUmRC
 zseOJqKfNfdsDm+YGeQ==
X-Proofpoint-GUID: 5TOIaDhOMt7mFyOs7SjFyhxK7stnxV7O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX+UP0kwuRqgKF
 3ME9nyrN+oXXVmAfLt5gpB3ZMqLAhBMB/U3LjHqaXQVAsDzKnXoAi3jGnbHZ4rl5spB+x9BR9ZB
 iWSgWxZSCrD2DzO8iQbnQyV+SQGXkmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230107

DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
exit is done only when roothub is being destroyed. Due to this, during
system suspend in host mode, although phy_exit is done by DWC3 core, the
init_count on phy is never down to zero since HCD core also did an init.
consequently causing phy's exit routine to not be called. Hence, add
support to skip phy management by USB core.

Some Exynos platforms still do rely on USB core for phy_calibrate calls,
hence disable USB core management for Qualcomm platforms only.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to PHY calibrate handling for Exynos platforms:
https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/
---
 drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..ba26e61df915 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/property.h>
 #include "core.h"
 #include "glue.h"
 
@@ -419,6 +420,16 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int dwc3_qcom_set_swnode(struct device *dev)
+{
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+		{}
+	};
+
+	return device_create_managed_software_node(dev, props, NULL);
+}
+
 static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
 {
 	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
@@ -683,6 +694,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	ret = dwc3_qcom_set_swnode(dev);
+	if (ret)
+		goto clk_disable;
+
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

---
base-commit: 80574c40598aedbc1751c528e414d7e224bc6313
change-id: 20260720-dwc3-skip-init-quirk-c110eae068ac

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

