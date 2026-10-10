Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB23BCD0D
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610393; cv=none; b=OvPhaSrRMOZYnqOdYef9e86MuOqeFxd8Y519jXnayGCIT02bq2GD/fUx0lDBWZj+8jswKY+ekLEIdIqwmLSAId1rTtfzQf4FeEJ4lwd9hq50LmND+r7QTdsVLqERaQgQPiGYovV2EjZ5RdWwk3pHOFD30IHkvDFBGWNUWEZ6YYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610393; c=relaxed/simple;
	bh=KwPkXKwHhY0MGsm9sQ6jA/6OmjR/oIXJK6V7dFaiufE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sRErYqhRPC494O38NlTIQdMPeCnIVws+/vOL/hlks/p3vWglXnfeRXHOtC2XwQVmzKt7F2mEWzNBgNkJJvXUtDyy3nFT4jaIsA9joc5phUIWnBMxSE50JrRNFKgEk76Kr/rzFUIxvV37rU9KtG4/xymxh8m8BnTPvL7yhTImpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ck4l1rOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnTjJiRe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ck4l1rOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnTjJiRe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A3jdWu2721789
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KgcDUP83Bl5
	a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=; b=ck4l1rOdaOSCD2cGuEfmSjZIYpE
	l2va/9M0i5NRozCw9gdhYA4KtPMr2zfNMIYwgLqh7SbvK3TWCMhiqrK2WNqmAk+r
	f/0rGBIpq9Y273LNwh0tUFxGqIy2jXf5OkyAQ/8yah4BIUmgNkDcotA8laSm8qiB
	M0CU08lC3Oi6qWbVPMrnRqm1G73aPebQlK99z48RxVKwIeOjQW4sELdg2NF/Omsr
	Epk7IStiTZTOoi0xBuXzWAnP2MKCWVUFhO0dZsTon8yK6J+0h04bNTa0SApioQ3Q
	+brEl6YriKafBuK5bSVgL7q/fO/klbBKssI/JM64SBB2JETVS/1UONoJCOA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dr7g72m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8862ed0539dso446714b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 22:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610390; x=1792215190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=TnTjJiRenLsX0EUD/LznvcEHP+AfDp09upzF3Qh4h1nAVNk2NziXxLM34qvFBXM94b
         jlyrZ5dQobKiqO8e9g/a+Kv89+jMEynZksZoh/MIYfTzo9J4GXivGz/UcvJjbLiHAwlA
         0tyeUQKi5ti9OPRoYoCGGGbi6YoukutchBx7LhZN2y7iR1a9mDsutCdpstXhs3SOCI+F
         2ZJDZCrmZI6JPtDhCzg832JraG/z4wP4zVOP4BMGyFLCEvawN/Iq9NjJv8p/pA/9+Kca
         pIOG3+nBJ7p926/NPCFpW4X5uUzZ3RrP8WcmUZJF41A9WkvT74SNl5txogDdOKuboWNt
         POOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610390; x=1792215190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgcDUP83Bl5a2s5ql/jyk1n3BPOJSPT0F3Csq2uM3lY=;
        b=wjJKG2EKCjfqliHwK9/FQPCoydIIxW/N5wlrX8LB/RQ6BoTdW7YXTGa8LFk5GuuARd
         RK6g4i/smGbUphilqRC94eibfM7GthaKRQBNF2QjOckp7vrN3hz2Ti+8RLOFtHoKaGh6
         wpao6VCn+34p4J3opaPefzeG3g2Rkgv+j3MQlrH8VB0CE0HVHxLuOjFKdoGsEv9ee6+R
         1wDL7fNgHwBAsSNGoA4SWRyyGFsF5GddBRn5YBBQnmCaSsEl3Zpq4kF4lrHqG7aWcmFd
         vyi3ocw3bSk2gCyGMQsUYPJ7xaXAQJfj03QRvVCacuZu3psxMGT0oLBITLyXKbggiV/I
         ghjA==
X-Forwarded-Encrypted: i=1; AKwUvBwBiPNH8MJ/5fgUAS8W/37gXAqCvi0bUuys5iNbMQMRiRgI9cmryz1F7ABu1byZ1HEE+xnHC42HpjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPuPHHW0RlcIDnMdgNQYop9k55GCHXYCUD2QGLH373jHuCz0mF
	1yzS7UuyDJACBPbaW99La382YhspKZharj+oK4Ew4Ag0AogeujoOgCwtSlQn4ybds96kVAKkory
	aSl27Z5A6CmIArZDYsBUu0IsLTXJzCE2yX2oQxNsIyrG4zP0PCyg/NKJpx8YeQ1w=
X-Gm-Gg: AYBFou05qOOhKcT4e8qO7iZFj5RNKs3U/rH7qGy5NVAaJbWM7wgARyaxoRUkl9Iu0si
	+h3iKhVCjhjNZHFM44O9bnm0DecT6UnH5gW1oiZNcLC0ZJRI27caStwyXRvANeDF9/wc7scp9s2
	43dlpq0BSmNf8K23xcY/2d4T24cXWlPrdLE0YqkyLNvVZU7L7mk8YQ8/ptHDp5snd3PbXhqbW0c
	iriNsOQsqV7FGL9qWizoArd25Ar/zvTEhCV11RlFJMekvz/bnMuHz4v/dnVO80tJeL0Q+k1K+ad
	JOcxlORTe/G1sybwX4YOoZVxYVqCT2pEqKTuYp3Lv6lloHrbRP+wac3NMmAuCuaXlNfr65obQBn
	wvwalKzzwWKCmYN2vVlLpufAeEigPN/k=
X-Received: by 2002:a05:6a00:2793:b0:874:478a:f7e1 with SMTP id d2e1a72fcca58-897c75e83e9mr3158486b3a.25.1791610389511;
        Fri, 09 Oct 2026 22:33:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:874:478a:f7e1 with SMTP id d2e1a72fcca58-897c75e83e9mr3158475b3a.25.1791610389076;
        Fri, 09 Oct 2026 22:33:09 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:08 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Sat, 10 Oct 2026 11:02:40 +0530
Message-Id: <20261010053246.2991984-2-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Qr8wuFRHoCcO17zUaHyrzBF-Z8ZC7ZBm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfXw7tKLlbubHZa
 JkNgrJfQt/Zdm+JBXaAUIGDq3svbbi+VUdxY/Kfe9WlpLMP0loFzj+V1rerOMsccjFfbOBUqXZx
 68Vx2CXt4Nvm5w4w1CFVGALYYfhJXDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX5ce/dxL980i/
 ucYeC1vDVSdLnp/RU/XtpRWz1sw7DKC/RDeaTCI/PgNdFPztODM7q0gAec5vkDLnctrWZEWpqJK
 IxuL3LhZDkc6EXy2bqvw7t5ryoFI5mnNL3e4N1ARyYRiowIHel4y4Up0xw1BD0VjNZ3LicfOFAC
 +mdZD1SMTbViKlyCoyfrM6fnIIJr/hdqCAUA+jRaC4EUtj6OHRzObcq8e6howp4VIiY1Y01OZl7
 rwjFehdOZdCA9w+foVhiYYwhXc3Ps2nPHjIiF32H2M26LheNSrRuGIZI33sfIyLKK9fkOgOPp6j
 FqsMBVBwLK5fca7Evet5cIB+T+DuPgj+DweNhvIyh1rCYN1nyT1X+0TDFdwQHrT52o3luAUmYPw
 JRf+7Ls5Q+opBQ5QkR2lZTU3tKC5wmFrj4T5ihs8T5XjGHjgz72MK9jeV8W2lfWKO6DzEIbr+A/
 rCu+OyJ5kPJhSpgkORQ==
X-Proofpoint-GUID: Qr8wuFRHoCcO17zUaHyrzBF-Z8ZC7ZBm
X-Authority-Analysis: v=2.4 cv=asknmiZV c=1 sm=1 tr=0 ts=6ac9ce16 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZXqkfniAK1spq4Hy8MUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

dwc3_qcom_resume() disables the wakeup interrupts before enabling the
clocks. If clk_bulk_prepare_enable() fails, it returns with them
disabled. The next suspend returns early on is_suspended without
re-enabling them, and the next resume disables them again, so every
failed resume leaves the disable depth one level deeper and host-mode
wakeup is lost for good.

Re-enabling them on the error path is not safe either: the
level-triggered ss_phy interrupt can stay asserted, and the handler
can't make progress while the controller is not resumed, so it would
fire continuously.

Track whether the wakeup interrupts are armed and make enabling and
disabling them idempotent. A failed resume now leaves them disarmed and
balanced, and the next suspend arms them again. Disarm them in resume
regardless of the wakeup setting, so interrupts armed by a runtime
suspend are also disarmed when system resume runs with device wakeup
disabled.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d44f093ac243..d4fda4dd81f6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			wakeup_irqs_armed;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (!qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = false;
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = true;
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (!qcom->is_suspended)
 		return 0;
 
-	if (dwc3_qcom_is_host(qcom) && wakeup)
-		dwc3_qcom_disable_interrupts(qcom);
+	/*
+	 * Wakeup interrupts may have been armed by an earlier runtime suspend
+	 * even if wakeup is now disabled, so always disarm them. On failure
+	 * they stay disarmed, as a level-triggered wakeup line could otherwise
+	 * keep firing while the controller can't be resumed.
+	 */
+	dwc3_qcom_disable_interrupts(qcom);
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-- 
2.34.1

