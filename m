Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879324E235E
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449931; cv=none; b=LCLT3j3aAslT2+AnmclaMnh+8rzn1B1GWoEOdqQRoc5BEEDFRJZS+ZpONzjq84SHCsOnjwQQkj76SQN9EEHHl/NtmHDL54bAv4QKGe/EeU7e+HyatJerUUugI1+GeoKIPFZHA8KgfCQz8m/KSBT5277XJkxanu9FimLpeX3PzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449931; c=relaxed/simple;
	bh=4vXFe8mDn022Y/B25bfpbZTEc3rDqMffSWmcEmGusgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HwtRKmx05QW3t5/RMVQN8JWH9cc7kKRICe37sGbkLuj4nhTHM9zCGUAouHWnCCn+qiyM/7v4dZfw7irEX4y4JeDgyXqxevsh3KKFCKwa/aSAY36/PZaRjFjvNEhN1Nu7gmW8ew086pI6bAHdSrPnff5h2UYZLBHTjvhLiyUWyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqq2ijWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pz1dUzIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqq2ijWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pz1dUzIw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAeON822720
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 15:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7DMo5aLM7KO
	0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=; b=Sqq2ijWcT0SNyBCiTdXleYzVIjK
	+kj43fUvy9GKD0Cfu6UuuqZOgc6zoYODmiUyVymagv02D2J8F3snItulaT8ERDUk
	81ZsL8k00XTWzlD1FO0mWxxVSlFky2cOJInswXWv1DRmAwYdoKn3eAb5HaSSRHMU
	oE+r0TKnlSlhmBqWKPQgedP5R4VtdL6GgNsxyx29bZKNYn1Gp7AV23i6oiGfQzyx
	2kOgs7P1PoQ3ijou0d9c3DCndrC7WZHDw+nCEtl5jhH2rvgR2bkWsMWiScy40dAV
	1B6OR1XekvdpXtvhw7OBFWuhhCQfknLuN2V6C66I7PSpXpVbaNVHDoq6mQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p71g80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 15:38:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e048a801dso3285217b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449927; x=1789054727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DMo5aLM7KO0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=;
        b=Pz1dUzIwEKjwFTr9Xxfa2r4odP+m25zAMItQwkUYfWvwIhAqDu50L1WOcbKKYcWuSL
         O3FNrGL7tUJ+mD1G06cDWPh7Kux2gRluZOHJ4YPWbMOwQNp0lUWf9/EODjaMfmm9mnHd
         Xh76WdCzQWIKZA+JmMUbkwHjek6x2UF4dac4Wb0VFPPHKL4knS5UbNCfymzG/tDo2v5b
         A7Cxb2pJMSci7jVE2F4RPFOHhtGrfkGQgr3qbycB0k/8dIjWWl3iIoWQ7o9X+dSinLSV
         QjnsLhfNoy2A9Fo1m7GgEeLnhVhC+nM3Q89gxZazJcQzRVVAREZj/eFwJ+ciwo12OH78
         S0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449927; x=1789054727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DMo5aLM7KO0xZZuqnuCa7iNDZoWTd8Rp83SaIim8bw=;
        b=eLm7SzZ+99ItoFkI10Mv2cbn7I9RQj8WB8SXrBgFL0iMni4/eg/tM4iVIa9afng2Lq
         K9yrYdm63gTISCY6Px2dIzTz999Jywy3QDrFswByj7kMqs5G6BuJ8UxyHHBeyIq6P0X7
         ITWVLUgAJXBBXjlDwfWg0CTva1KEllxIhoa60pGnLxahHVsvdRiMY6VV7JeEuQhTTNVF
         MP3zaL+0BNceMIQf3FLpqUK6YKiqWUMBOEm1kYtGQk9r0cPjAfd7eG0jD2peVouVwUBn
         aqjHuMUwvGiN1gXOn1ur8UB0EjE0a7vhQ7lwhy7JGgI1vkFkD3Q76ou9ADO5jXZXWC8Z
         zpsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4gSo18Gu/Vs1bpqeXEJspgSppyyQb9ZtUkefYkiJm2/c6EdYaE4v5BGqu+5Q62a2u+/LwubDOG8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mT+0ycYNz/naqmxULpUJC31rAWz+XFE7s7EAsxOOewfDXYG9lv
	SY/AODnxa7kw7MamEBzac+2efPcfpIcFujLNRT141/Li0UN5fnu9WBwppv18rOFmlFQKtaTddPE
	GJ63XnUtWnfJIYuXhPbQ1n63ewHOQDE8f0QajHfR7zLJ1svnhPiacAQANS1h1yG8=
X-Gm-Gg: AYBFou2xAlEi1GCCI5oKWRTUOo/caJt5FWcAT1XPb9jLx0yNcFfe55YzKBodcj88Nwd
	DrH+S5ZGsY6VkwUftbUMzgi30cJw64DUxZ3pNU1bOybh3a147yQdJD29Lhd51vJlKJ8v98jfnSt
	zAjGsWsxQajRIebgbpdaghidWaFtYUDGnOfgu0jrTpTfl+gT6i3SNOe6OYVWy6TE0oiYzqdKI13
	ducwYlvo8NpLdZ6T8z84LlJbilDJmpeoZ4W+aMLzYPhkIjhrZ15EKcWr0utOlYdQfxFFMQV10KR
	C17YuOo17ZtwYk8T0K7cN0ZkhiYN5oSZETbZkKhHapSk8tHC9FX+eKAXDzqG1uisWdv5R5elGYY
	j0dT3ScSwVLPT0mI9GmBwT9pzGzbXqiGx
X-Received: by 2002:a05:6a00:2309:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-861630c5ce5mr1031b3a.0.1788449926228;
        Thu, 03 Sep 2026 08:38:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-861630c5ce5mr932b3a.0.1788449925461;
        Thu, 03 Sep 2026 08:38:45 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:44 -0700 (PDT)
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
Subject: [PATCH v2 2/7] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Thu,  3 Sep 2026 21:08:22 +0530
Message-Id: <20260903153827.3463313-3-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: AsGxBJF7I3vB5Yntv6zpVCR4FFR5mCfS
X-Proofpoint-ORIG-GUID: AsGxBJF7I3vB5Yntv6zpVCR4FFR5mCfS
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a999488 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=tqe-1LZTDOhu2qnNqD0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX7qqHW3A7xWGs
 W+Wb3yTtAl3sN1vyNLOVcdgXY/i2Ci3/Rviazy6ma7bzNkyiS9Ft4Q9Ze40jLQW8kNx2gRIgiBb
 FpcpAPykLUL57XOdntZw1yTI0Uj2aNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX1WEJtqfVSxpo
 OZ9wsMK3DYI6Q5QB20xkMibN7MJIb9BSDObaqsa8ssZHVmXtsmP6qvhtc17aqonwrx9JImdBvNz
 Xl5+y+C8YWZ8ClcJQb4RE8xwIe84ZP1XCSWCMQufni5XXqP5iYrfmjlIja2ICSnH/lwCZKRtMna
 qL2bzm/TRwqhdANaK4qtv8IBjBBXGv/ra72iiGEsPd5bSLBPl2ot5Hr4UKQS7WINBqnMWyxiAxv
 KVcfA/btSsGDBaMbUaBjPmc7upbArIQI8lPa1ee3LXczZ7FH/VarXU0TLIhHeBvFItDGLalz/Lx
 bedMqFc1Fvkqnml1zXsLG9Og6JdknLezS1DilBZBopFQDWQxTjKT+SzYFNmiRVNSlE0HObIboBr
 VZQbPW8D+55mVMrsDrLFUBlZu6/3wRtV23ftXMvX2cqGNTGBjP1IIpkZcJy5IcPlmP5hxv98Svc
 BrWz7Ni3gSLPTnOqcTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

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
---
 drivers/usb/dwc3/dwc3-qcom.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49698a31b2f4..6d25f81800a7 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -335,14 +335,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
 	int i, ret;
+	bool wakeup;
 
 	if (qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime suspend, always enable wakeup.
+	 * For system suspend, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
@@ -369,14 +379,24 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	int ret;
 	int i;
+	bool wakeup;
 
 	if (!qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime resume, always assume wakeup was enabled.
+	 * For system resume, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
@@ -759,14 +779,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
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
 
@@ -779,10 +798,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -819,7 +837,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -828,7 +846,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

