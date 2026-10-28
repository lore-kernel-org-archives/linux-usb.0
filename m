Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213994;
	b=JdtyqKlxsZg+HmratvA3/UiZGBd7Zhbs2bxbiZmtssIcK5kJW57s670ga9cJiLDM8UBJ
	 uPdpgVOuevz2LpSwYZql3meuLRCDqL0R9iwvcrvucdFtIIEDIqhgrioh4epVUkkw2LNUg
	 0RL78R5t4G0NX79+vP++/ivIzcpt+ORdUoX4O5THLFCRXEPFmm3e9B5+vYvJdSami73Fx
	 slbr4h22nNenHGAHxm035Y0o1bdpc+sPLQ5LMvCPHXImKcIaSTuIHMqDiovqseug0BqJb
	 h9rtbpzc11H9AQ0h//qfyRWGfq4oOqf6XZyFl/kx/AoQgcd9Mj/raDtXhrVS5ON6m6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
	b=mGI6F2uluuOa6UebEWnxAu+KSZSydbRVGBUyuObcuSOxN5dPy5g5Uqwq6O639JYsl4qr
	 052mWOH1cO5UAHh9Eu4PHZGElQuDSiCZEIre14PH0DNXE2p1TvY3bhYTERbl8JDvR44yj
	 P5/1ZzP2nZ89subCdGfe1VO4SW6KDkZRI1tRbFSQUSyHrtsRq3CRSJufSPSAAhZ5f37ij
	 Np0Y8qnRP/GgtlIFSgBhaZSEwnmbAJ1a5/IolMahMpqLioiB6UId/KJ5W2Setg6oWwlsr
	 esxezW9pE113p5Mkvzw9pD71FdFqhTAm/CSH5ZXD3FTgIa8YQsMLrlUnnkNQy8lz3GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLLHmiL7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BVpg/oIh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B04B606A32E
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B04B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLLHmiL7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVpg/oIh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPJsg1898223
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VfDVxALSW97
	OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=; b=YLLHmiL7LRRFAS3o6PkkWiRyCpG
	8rHz7D26TAvIACIOESgrQRz5AV+p2PTt35heKebPPNW1ttNNDUkfvreuTq0XK+FI
	eMI4W0ek5YpuuG+NnTwj2AFjwiwmMxHImX0PviX0Ko28GIOhMcpV7BaPLrCxQlzR
	ufzd3Zmjt8SJBZeg2zcZk7sgv0hWINzNSH6C6vHQnLKqfK+PAk+Ni5WAN40FEA16
	OAX9mZhycbEVmTGn0WeXcf+kqNYk/xGXaYPXWI1omHNaeGiDAOs6fh0iotMR2QFv
	AeKsWA5+ucPGS91/PeZogGpZkqaM21bCIOd/zWCuj8R+xFFeiwn8EpREI2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehj3sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:59:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so1942309eec.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213991; x=1793818791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=BVpg/oIhuvODiiAChzNftA3cS1BCyRhf4Bly6jYCfcQG79ygWA+8lSLjenBc4BNlbQ
         b8fCmGxqZhnn2/aZzQg94vNGrxKL2fk0Ai7ufi3pE9HsgUuubM2TNQsvzbiOBdxLyh+2
         VHAZum7SUHJo1kcRHj7BJ6UWAjT/sCP7XJbFmSrA4a7V3EtIOkz/9vL4hsBGETP6NOio
         Z1dltUIHGF6Mc3mf1qv3NAIUVcUfhgcZ/arUG3heKFwvvXBTS91/cF60qjXPxONFW96l
         Qp75+0V/EGILjJ8sMT5IJoePD3eXeOn7+cm6lMIJBsWVgk8wlhgti/akBCd0YXJXJJPu
         IOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213991; x=1793818791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=LwhKuvbjtyDR4PlKr+0uZDoPcchhwdXt+M6XeAFy+5ayapWfRkdC0ImR3x1YTrhbxW
         eJSFFpb6ZrJWNfbz58LzBBF+gHgGRcPSCzrEZKTI7ZPndfmSFUZwrYFRQhGwP171R/FL
         ttucDvtzVOupnlzwqEbCJMd1041JSTrDmrgMAqsqzDuiSSeOTOC74hB97ACMmbc2bHOQ
         7KxEpetoJYD4Tlzbc2i6Sx55GaKJfVj6gTsUWXTZww8ujTLc99+CgujMsE4OozVO8bFg
         Q1aC8qsqNK2jv1i9UAbF9m6DfesI29kt90AclnO1Ku4zLLdMRMHRazmaoqYK2CEpk1A7
         oToA==
X-Gm-Message-State: AFq9FYKKidQWVU63b57XtP2nAIZ0uEAK5PUcryCnAAD6DVDrMl2YpvPZ
	h3NixexvVxrPuIdvboPWTfVv765TADdJtB+GB81yZ26nwY1Tb/BCCImdc7e5GU2WljMzi8gwVyM
	qPldU0l9OxQbM7+/jSBnxcNvWQAxBISOBuh3ntZJFHegs7g0g/bBpPnsphXMkb/++HbOXgio=
X-Gm-Gg: AYBFou2MIa6lMU2mbPI5ofWPsxIuz4N6oGuUaol5X8SnZRVWyHPdmOIrkzl2ZG6E4Ee
	wd3Hp2UP0PDIm4YAqRh1qtDX83ldouzb6NBF2yaW+znZPRvQdBsqIbOaBFdGGdG2fSLP2ZmhkyR
	XbF7sYIa2FB7jCvc7+5HRCGIsOby4U5Xev6IXh+ehSXD97qzlQwyQBvvCj2kXsIRfIzni4g8BTT
	2+F31cRsyOFmktBgoA7gczuptcjX+hbNd0DCf6oeZ6NIhj/wWKNgVL8QKV7oCqi57hDNN51c/Rh
	NFJSdhWaQCJo41MkA9BEh5cOxXQMy2mKQV8Ha4CKTZ55Ma8JYpCZCHBgrWU6hNb8ybDxtt7zrni
	uzIZIsoyq6bzDt55gv/AWj6nX23vGwjzVpuqoq9d0ZZXyBHomh9UHbU7Pulz1o92CWN8zzf8QUB
	TGE2B0ag==
X-Received: by 2002:a05:7300:bf18:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a20443a5emr5127235eec.41.1793213991021;
        Wed, 28 Oct 2026 11:59:51 -0700 (PDT)
X-Received: by 2002:a05:7300:bf18:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a20443a5emr5127196eec.41.1793213990474;
        Wed, 28 Oct 2026 11:59:50 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:49 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Thu, 29 Oct 2026 00:29:32 +0530
Message-Id: <e39a38d334b5276d8a47b917b1f0fcd0a32bcfe9.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX97/BgvYLOOoB
 HAB9LcxvNadommriYUq4wGWwXI58NosAkcDMWEXPQRJcIea+gbtxifBwQ/wD6WsqvC6Uo+Mk1Vq
 Q9GmAk+KXrleMME/F+l+fni9J7oBsMtozyf2J0Ls0FBDNjxtavLcxsZuWPyuWj4JUP9GzhucAFI
 G0iv+dXmCliPZvdxvGSPfl7lkbI6UzY+JcvBrlOEH+XHAdVTkx73GcBBVUmAk8dg5zsp7pukaG/
 +6k/223Sm6hyRma1YpJe2k42JnS+poyOYCWQfsrTsq3ByEc4GfpGtN80eLgU7+DX6EGW3i7BGF9
 TpMHFfviIiBerti2VmHDzxb9I9Qck11+ex3L2FTvEqr+o+ynbKWUlOKFgOSTTDdfaWdHMfHEw0O
 H6nEqK6cxMDUt8NIZY2SRIB+JXOj96SoulouCZcMdrjNGNsuWw09qFUCx5Ad2pC7nZXNeB3X6Vd
 mrS7tD74l2R1zvuh/Mw==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae24628 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=tqe-1LZTDOhu2qnNqD0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 7op2ZEj1srdsh-aNcZnKtw3JCbDMh8Wm
X-Proofpoint-GUID: 7op2ZEj1srdsh-aNcZnKtw3JCbDMh8Wm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXwPojv0aoeBpA
 TOGnL0cVdPbHkSB+VvAroTyP0PnfyO8N0M8iJOmvE7VMr0ClBlS1d6m4TrA9aN89V7q4VGf3fL9
 7g2gWHjVamHSpUfmux9X2thYL4RebFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

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
---
 drivers/usb/dwc3/dwc3-qcom.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d4fda4dd81f6..508b1ee7cd0f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -346,14 +346,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	qcom->wakeup_irqs_armed = true;
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
@@ -380,7 +390,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	int ret;
 	int i;
@@ -766,14 +776,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
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
 
@@ -786,10 +795,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -826,7 +834,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -835,7 +843,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

