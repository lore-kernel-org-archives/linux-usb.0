Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430866;
	b=Ln1EJdc0NvcXNPSoTVXIgJ1j4Ryt9xgpJfowMo9E6/YG8CcYL6KxDFs1HnVNxjj2CO9c
	 IqL4yQux5gHu6nlA8qT5ei5a6/O5jzmrxeZtA0IXRO35uouCrkIHV2zvSwLu3iMrRD8dp
	 16irLMGONcP3g52/ted4ahvR7CTwAS+aDwebbI6MC6kKpXtdn8DOSdcfR8F9IiGovbFTH
	 t1olG69E5tWo3kzoS5jCzhVEapEewPnthu1MtKDKrPAI7k3QU1gxtndj5299c3gcJrZ2+
	 nWV3eGFvYO13RVWSVmPU7q+oav942binO0bsS3DHtBctl9Ebu6GtvR779xodxVHM9rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
	b=OsaZefTtX9VLJnb4LC90BPpmwJmRh1JN001+mcVisRJywiehf4V9firysn/9IzLxVSPB
	 Rl+IOnoVsKzCsHNvnhRx/+yP7E4b1HIb1KLlQ6ykiKwfCvDzG69hMpag58EqYW85tITDZ
	 2Eg1a7+TezeG2Y0QWgDWsihxUIc+bAdZ1sslZ7JpTIYzWiU4ZqnZwBzhjIgZhMLgJnnqx
	 e4PhjYpm49IWpwEWaK5CNkfPyC+nq/LYZsgzoT1pq8y8QFqnhsT54RJs+f5cUfNBS4VsN
	 YxUghyWHNM9vcchD3a/z81DKJTgpxAgyPzGkQzY3FGryOUvL8MO0OZpyE68T/9Rqn4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7J6HDR6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB78bWp7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FB606A321
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7J6HDR6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB78bWp7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G3sm1899423
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tKohM3s+bmB
	Ppn7yaP/14kf3LkHtuqPYBgkRVsYrueA=; b=Y7J6HDR6HMG8PbYebGjIdqTh7AX
	TEo7SmiLzi/3LIMTFlCp+wWHV5sxJjaD+m4eEvrYAl/gPzG5e11zWcZarxYXnxAa
	LjBalR3OxxUDK5Y04HDtbEv3c3QmRCPbdlJ526SgfbQPJncgiPxBhAn8eUcdd3Le
	2d66kyXcXrEpVujw+L3iVajrYt13aE6mfUGKJHTU/mKOHJ7AMmF2iQjEX6R8n4Y2
	sDP2IYaHNzrCWtg/36xCbTwdMk4l1LC/YxKBwzMGQORfwVyvwdXWDperkKP8GfWE
	BA30mFzhJ5zWVrInNADCBWEwHlqVyRwrpfM2ZtgxBaIQJ44RINhK9tH3oEA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k11et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:47:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2713372b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430864; x=1796035664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
        b=GB78bWp7zS9X4LEF2FdQE3ESCovLrulO9QK+c4fU0/ERu5tf+rltyRIfWYNElBbePU
         TrX3De2L/g7EV+EwrSjOO++L4nhrtrCCumK7QpNJbZsPgFnWwn0T1r22ZSSKxPM8+4Wg
         w1+xG0A8NCJAZTQk9Ar64HHyeH09VeRYytom2kdV6PevbXKrO5WqBcvrueE8hXMD7Zhd
         8i75L3l0OFeGRnMDRPFfsIS+nrHanM8f/wv0kD/ulT8DZLSgiaAHCvxlOceSjbVjPyHY
         xYVgimk7GTObwywRT/Hm0YWI8Vn1p7Ln2/4CkgYC0gAHfZ0yNxUaq0Ue4uMPRkidRjN7
         tn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430864; x=1796035664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
        b=pxs/xMqjBlmuejtSCGogX083ijkvWfGaGkHgn9wO1fj68sh68QJCW2eRGeX2C6NuZd
         T5KTRwDKc7CYIN4ykPk3uec2Yj9XfAzL8E6epymQg1luABbMK9Y5ZA5C4lV9EwFNmWk5
         6ZjdXtIeNKG7EEZ4hwlbC+sPg8FTUUAa2T1QHsI15GErvD6qZodrIicudIktz8BVLy/N
         jOgcKeMZgeOpx8byjtNQ0bSmLqD+zYK5DKr7OaQfCRwrVZeyxcfo39m6pns422MVzECi
         BkzDv/IiAl1qiyC9Dr1UvKvzzQvZyn1FjRmyouFE2Mkci+Ibd4sz+j0gDDlSGIJz7LLc
         U0rw==
X-Gm-Message-State: APuU4Z8knGXIeIAJG+hPLE85e5elIlLiEu5uGJ0huuBXpoSdQxNLu5Ll
	gDSq+K108rqm/eRVRHDwaTk1TWzBJxao0PPs4HrOc/B6WMWNPoHlWxJdhS4fUjPLdkS+6WZzLz8
	4Tc2fSkvQYm63eCaETd4Gf109q+lmaa94Z0kOdaABoQ0AgfvC5lguZZbymLLBZ98=
X-Gm-Gg: AZFdTZc2gt+fjlN0aX+5LCSxNU5y4keJ+hiMf2rSFBjv4KjDzPp9Sll7dqWfcCXRyZX
	+R6pJDIJL5eCr9uIlisZGs7Ak7+rVig66l60Dcs0CvNdhN8BVWcboHLsIlXNLRumZPYzrOiI1C7
	xrmHvRqiaKjFRcK/xR6FP38cKmXLn2KgiVX9yDvhpzu4Cim2RZM08sHvpSSPEQ3hrFCYuYhOXTp
	LZfuGPdG+BPoGiJvDJiPp/NECuQHBIpJrap6szLwjqhWEla0lsJ2/j8d8VpCCixKFIzR9ge9KiR
	j+/46tZBA3pyxGvIgVjhWjibcAz9if7rc0OW0d7DGzwpn2vTdHFSler34C/GwGFxR5WDTCfgIla
	/Qa/XE/nmaahsV6DceJIdGSjwR6KWN8vr6OEyc/cv/SOxVwqlLF6AQojq9GPNaljHHrBYuYlLIN
	ijesPDJQ==
X-Received: by 2002:aa7:914b:0:b0:89f:1b32:29b3 with SMTP id d2e1a72fcca58-8c8792a498bmr8816139b3a.5.1795430863724;
        Mon, 23 Nov 2026 02:47:43 -0800 (PST)
X-Received: by 2002:aa7:914b:0:b0:89f:1b32:29b3 with SMTP id d2e1a72fcca58-8c8792a498bmr8816122b3a.5.1795430863245;
        Mon, 23 Nov 2026 02:47:43 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:42 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 01/11] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Mon, 23 Nov 2026 16:17:16 +0530
Message-Id: <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX9p1cINLjVgbD
 Ltzm6+mBJAJ8fJfHnzQpPGXFFHNb0syAe7bN466yJ9tftSa7LGrBBCjPmjkACOHUCFCDWvNjM6+
 ey/TW5t/sLCE9JWtdLdk/ibavL90smE=
X-Proofpoint-GUID: iGHfHsIk9VbFS2BW2scAZoJYftxwFchL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXyKuSKEVSvKGk
 YJEk/IlCAX+HiDzW0N6AJeZq8EBwgCS+Ksp06PGZ6x4OTPNdPedBUf+ZhazmVYvlZSOTGQXjcxn
 54kjMJugu4YXROfebcMF5UGBddH5aTIy04+srpaRdF9SfXcHLri9vfbkHFx9ZJReETamSA3MxRw
 DWRbz35+PVpA8zsd0YXYW/QTT2vPt1T+5NdkK2M1Yc6zyZc7cPcFwZ/e0WC5rvVBTEZY3WcwhpJ
 Nkp/nVzrPngZhwGL/PpZs8kVCQNCasQzhsMJODXbwV5ActqD9cD/xfYDo4dJqT18mUeO1YRwOAb
 PUpABYKreZwkiaQsxQgxvXG6bWnlCHmWyYUy3vnu7k9fen5N264wl8eS/inxXjH9l/IT5wgW7jf
 PSbZcC1cM3NgHru1NFmcuVIM/QWNx1crZ4pY5xHDyobuslNepJilZbkFfNGq4+W/qFSJ7apmnIe
 dC+3Wc4LeBbV0h9RONA==
X-Proofpoint-ORIG-GUID: iGHfHsIk9VbFS2BW2scAZoJYftxwFchL
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0419d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=tqe-1LZTDOhu2qnNqD0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
handle both system PM and runtime PM paths but cannot
differentiate between them, preventing distinct power
management strategies.

Refactor suspend/resume functions to accept pm_message_t
instead of boolean wakeup flags. Use PMSG_IS_AUTO()
to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
system PM (PMSG_SUSPEND/RESUME) paths.

Preserve existing wakeup behavior: always enable wakeup
for runtime suspend, check device_may_wakeup() for system
suspend.

Follow dwc3/core.c pattern to enable future per-path
strategies like differentiated power states.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d44f093ac243..7a7225b900b3 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -335,8 +335,18 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+/*
+ * For runtime PM, always enable wakeup.
+ * For system PM, check device wakeup capability.
+ */
+static bool dwc3_qcom_wakeup_enabled(struct dwc3_qcom *qcom, pm_message_t msg)
+{
+	return PMSG_IS_AUTO(msg) || device_may_wakeup(qcom->dev);
+}
+
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
+	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
 	u32 val;
 	int i, ret;
 
@@ -369,8 +379,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
+	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
 	int ret;
 	int i;
 
@@ -750,14 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -770,10 +780,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -810,7 +819,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -819,7 +828,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

