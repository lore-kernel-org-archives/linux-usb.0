Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402834E13FC
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449951; cv=none; b=anGrwr3dGy32RDx9nBdLKMTu+EPXvyioNV2tHOcmxY2DbdciRs/9k08ZmJArreEwSzpWwofonr4yxsLP3I+1aNM17gFEPyGrHRWLD2VeLHAHvHoVuatnqyuZ5pJetU3Jr3nxEj7ONUrIbmuXV30FU+gKIxvI+83sLqekoNZrGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449951; c=relaxed/simple;
	bh=xjwKwPBAoS+oJeXPhEfFoGavfUt9KF+S7kYGFE2+60o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g9dj6Y9/97a2WD410dPzsXt54fygOswF53ocBH9tpYrAeyyHw36nfA+VC3tprZRdW3yjrAN8wQpbXiuh0tFWL8e0OLNrMEcmFV17DLeKpEU/Xf00FODqqtk6QKqJjGR0atX14NMg9LNGJlNXcz3RPToXVrvhc4yOjWpiHtbrKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htH1XWM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKmNKuyP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htH1XWM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKmNKuyP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAehm4158190
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 15:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WTCQhZSlp6i
	Q94A2uQ2RNllsv6nihm2FSeg0BHczjqw=; b=htH1XWM4GuiTGwG9KmhjqcKZIjp
	Fza4ezihA+UjerSGESnSpfGtrJDEVWuU5DppkNswIxRle0FfR7hBLUhWooo6S9Cw
	BCNC2MHUMoA/DVdr7x77Uukm9s/L4whItrgPxr4j6kMP1M2RpAKvLc8E/QuJtD53
	QOdClVhWW2h94IUGcHFro0wKVzAz8ZlFYsNt3vjuEq3NNcD3YJ1LWTnEfl60YOB+
	wsi3fhKjqhj6hZyOEbzh36vOYYUjv5Zbr9lloy+kGvuwBUIlLZbDoXMdgwtEDXp3
	6+LyBH6hCA76wr7h16tTx3EYe0f4sWrKPSD2yjn5q27VSLSEyerYXxMn/tw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdsr2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 15:39:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85326b426c0so3109575b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449947; x=1789054747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTCQhZSlp6iQ94A2uQ2RNllsv6nihm2FSeg0BHczjqw=;
        b=gKmNKuyPacBrBEJB3r0QwdUPpKHYcMkMzqEfE8MwhP92n+CnfCzcpmMeyinNC5UoIs
         lCLp7O5rekxN0uBVpXSqMAsgN3lM9/obXOv923Ywe/pC1PcfjUyrHHeOVxf//etT7p+w
         xRFP5Tdb2wek/vKCoPL3+YunDZQbazckF6ODPf1OeModenNyNb5V1b4jEAIv3i8kVwRW
         0dzQVE0SKaSfn1S44vrNHITF8f1UBzJsbWV1g+DsB1yvoSOY+2rbOesRy7bMwzck5aKV
         z/d8jBJ7aG2uOQUfjE23IDI8T8ESx1mSdGlzqmEvX+che7ZCvyspH6TDT5tSpHdNu5A1
         ywWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449947; x=1789054747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTCQhZSlp6iQ94A2uQ2RNllsv6nihm2FSeg0BHczjqw=;
        b=nZ/wMErji4vaO5hTP8nsstZz/TBMLnY0UkJ5fUoz3HEEJSGf4+2+wwfwD55Dh2qUkY
         CWo06wfpQwjuoqVFfw5n/G0tIu/lN8LIwxNXnTC01jFClN16mzrHu7LkG0R5LzZEjdf7
         4t3/wnv44vpp70xEiaoPT9s4ywWX9AiWZDQx67Y2CgHRiL5ROtlktKhjJNSQxxZokaA/
         O7MLrCNSQwbnE7uUGB9TMHjMVsOqsTxHZ6MqJa3jaUKWdgzgOZD3L78ensXoV2bYSdr7
         J2aYM5ufNZqO0f87LBlfjkKaOxwy202Z8kvGpnNXAegpeNlUNvs5dPG8Qpvf/S0FuY6j
         WwEg==
X-Forwarded-Encrypted: i=1; AKwUvBzrsFtH9i/5DZ5YXYio36bd8kNFLBM8i8laf34jXLkf1fbJnoLCViOFmlEWBUISVjE+xbCBE2NQu34=@vger.kernel.org
X-Gm-Message-State: AFuF++lTIdtaguVxJP2M1WzVzJ97JGt9QlW9166m5m6YeaB3VAd60fsO
	U9MaqT+/LMFlhxyP/yWpAkf+haLqgqiuom9YXb8NUybuH7k0LASOgZGHMejtCPNVAQli9q0AcTG
	8DHXYA/hLztjtkvypeGryrg07iMjYG+fVrbLzHCecfIR6vYR0O5jjE7YrYZaSyKM=
X-Gm-Gg: AYBFou15MMUA04MML7nVzNIW2H4231TjpyfzzkH3qKczp82M7cXecAg19c97aZXigxc
	hfNpSqBUkoSf+JPxCQ5/uii3QmsAMgjrSifH5WGSZhHi0q8qT2dFhtXjRrSS7tsiLrkynIC7P9e
	NLKTGovE2TvE8YGUcJ4lLjatCgAymCpn0RtuBgR8lddyH/USbj4xScyaYBMIwKG1Iglt+u5ErUd
	jwDHUMS7dxlGvQ/dCVIRcJ17rxQJMf3c291iJx/N0IsczPNs31ZeaniR2aow85hrSee/Fi168Mr
	RacYqG7nBOWzsdZ94LtSlRLHYm8d4auV7neUOUwEYNG9MV9E3zt6W6fBYGf7jxdhOrarvCYSpPT
	Vx28bwRiEvNd4A4KQ38ZkLxEZYfpzOnHZ
X-Received: by 2002:a05:6a00:300d:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-85ed1d08cdemr21215602b3a.1.1788449947076;
        Thu, 03 Sep 2026 08:39:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:300d:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-85ed1d08cdemr21215520b3a.1.1788449946441;
        Thu, 03 Sep 2026 08:39:06 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:39:06 -0700 (PDT)
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
Subject: [PATCH v2 6/7] usb: dwc3: qcom: Support broken suspend for SA8255P
Date: Thu,  3 Sep 2026 21:08:26 +0530
Message-Id: <20260903153827.3463313-7-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXxhHDR+0oPwaX
 aOnO8Kf2K4C11MDggrisHMO3Tl4AZ0DQl45TRcROk26ZWwALCcftP+FAF0VsLJevoc5tpsEwzW7
 LoNfZiu56R8dQe+jJtKliCgfKaPWIaQ=
X-Proofpoint-ORIG-GUID: R-hwfI2nV29DD1krq40sjb6FLewXBcMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX0J/ARJzQWmHQ
 PE4qSz7LriVOxRabtRgobSlii0kri8SRcM09dXhLyBetyFMVu7YEXvjn/oVLBPGdNogoADRVfbY
 Mqk6yC1dll5aOKhNoCSt7O9UJZWJUjBGHy+fdGLCb+85hKDmdMxF5oHs33SQDNEG6ZuBiO83PBU
 xNYseUGGUhxARvvyl9nb+GjOIwifndh7ppthp7gqNRIX2lTfoZBqzL2m0C2RBOxab6PbyWKIvS8
 TA7ZY7dOJOxULUrhfkoix99d+BmVO1yDiLS6EtqOq6jlDxHjzcv3P6hAzhvj4Bo5K9oygvTjlQX
 L0rGLF4uM9Af/iaD8txOufl8rN6pUMf2dfGgweYKki8WOEP9igFBw4VeTJ7JRqtDG4mf/EjmiPP
 6Ro+DVO8Xm7Lf2YFcfdAw7+FjtkiAK/20YSAOYoJuZQ1T2etxeeY70rXe96AsYC4iPs6ZJPE4/j
 vz4uopub2eg1HTtDWrw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99949c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uWzvkLexRb9NFxrCvYAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: R-hwfI2nV29DD1krq40sjb6FLewXBcMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

During APPS Suspend, the clock controller unit disables all clocks
to the CPU and subsystems, causing the controller to enter the
Power-On Reset (POR) state. This results in the loss of
Qscratch programming.

Upon APPS Resume, the USB controller does not have the proper
PIPE_UTMI_CLK_SEL or VBUS_VALID. Hence, if only the High-Speed
PHY is used for a controller capable of SuperSpeed operations,
the controller will assume it should use the USB3 PHY and not
the HS PHY as configured before APPS Suspend. This behavior
disrupts the normal operation of the USB controller. Similarly,
if the controller was operating in device mode prior to
APPS suspend, and VBUS_VALID signal is not set after APPS resume,
this will cause the PHYs to transition into the suspend state.
This behavior disrupts the normal operation of the USB controller.

Address the issues by ensuring that the PIPE_UTMI_CLK_SEL and
VBUS_VALID are handled properly after the system resumes from
APPS Suspend. This is crucial for maintaining the correct
operational state of the USB controller and preventing
unintended suspensions of the PHYs.

Also, as the controller is starting from POR state, make
sure the controller Reset is performed.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 128 +++++++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 6d25f81800a7..e58a9ca23b00 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -68,6 +68,10 @@ struct dwc3_qcom_port {
 	enum usb_device_speed	usb2_speed;
 };
 
+struct dwc3_qcom_priv_data {
+	bool broken_suspend;
+};
+
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
@@ -85,6 +89,13 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+
+	bool			broken_suspend;
+	bool			ignore_pipe_clk;
+};
+
+static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
+	.broken_suspend		= true,
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -335,6 +346,23 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+{
+	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+}
+
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
@@ -388,6 +416,28 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	if (qcom->broken_suspend && !PMSG_IS_AUTO(msg)) {
+		/*
+		 * Only system suspend fully powers off the controller and
+		 * puts it into POR state. Runtime suspend does not, so skip
+		 * the reset on runtime resume to avoid needlessly clobbering
+		 * state that was never lost.
+		 */
+		ret = reset_control_assert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to assert resets, err=%d\n", ret);
+			return ret;
+		}
+
+		usleep_range(10, 1000);
+
+		ret = reset_control_deassert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to deassert resets, err=%d\n", ret);
+			return ret;
+		}
+	}
+
 	/*
 	 * For runtime resume, always assume wakeup was enabled.
 	 * For system resume, check device wakeup capability.
@@ -415,6 +465,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
 	}
 
+	if (qcom->broken_suspend) {
+		if (!wakeup && qcom->ignore_pipe_clk)
+			dwc3_qcom_select_utmi_clk(qcom);
+		/* Make sure vbus valid is set for PHYs after PM resume */
+		if (!(dwc3_qcom_is_host(qcom) && wakeup))
+			dwc3_qcom_vbus_override_enable(qcom, true);
+	}
+
 	qcom->is_suspended = false;
 
 	return 0;
@@ -449,23 +507,6 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
-{
-	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-}
-
 static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 				 const char *name)
 {
@@ -637,6 +678,15 @@ static struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
 };
 
+static const struct property_entry dwc3_qcom_props_broken_suspend[] = {
+	PROPERTY_ENTRY_BOOL("xhci-reset-on-resume"),
+	{ }
+};
+
+static const struct software_node dwc3_qcom_swnode_prop_broken_suspend = {
+	.properties = dwc3_qcom_props_broken_suspend,
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data	probe_data = {};
@@ -644,8 +694,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom;
 	struct resource		res;
 	struct resource		*r;
+	const struct dwc3_qcom_priv_data *priv_data;
 	int			ret;
-	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
@@ -654,21 +704,33 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	priv_data = of_device_get_match_data(dev);
+	if (priv_data && priv_data->broken_suspend) {
+		ret = device_add_software_node(&pdev->dev,
+					       &dwc3_qcom_swnode_prop_broken_suspend);
+		if (ret)
+			return ret;
+		qcom->broken_suspend = priv_data->broken_suspend;
+	}
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
-		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
-				     "failed to get resets\n");
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
+				    "failed to get resets\n");
+		goto err_remove_swnode;
 	}
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to get clocks\n");
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to get clocks\n");
+		goto err_remove_swnode;
+	}
 	qcom->num_clocks = ret;
 
 	ret = reset_control_assert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
-		return ret;
+		goto err_remove_swnode;
 	}
 
 	usleep_range(10, 1000);
@@ -676,12 +738,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
-		return ret;
+		goto err_remove_swnode;
 	}
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		return ret;
+		goto err_remove_swnode;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -708,9 +770,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	 * Disable pipe_clk requirement if specified. Used when dwc3
 	 * operates without SSPHY and only HS/FS/LS modes are supported.
 	 */
-	ignore_pipe_clk = device_property_read_bool(dev,
-				"qcom,select-utmi-as-pipe-clk");
-	if (ignore_pipe_clk)
+	qcom->ignore_pipe_clk = device_property_read_bool(dev,
+							  "qcom,select-utmi-as-pipe-clk");
+	if (qcom->ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
 	qcom->mode = usb_get_dr_mode(dev);
@@ -757,6 +819,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
+err_remove_swnode:
+	if (qcom->broken_suspend)
+		device_remove_software_node(&pdev->dev);
 	return ret;
 }
 
@@ -773,6 +838,9 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	dwc3_qcom_interconnect_exit(qcom);
 
 	pm_runtime_put_noidle(qcom->dev);
+
+	if (qcom->broken_suspend)
+		device_remove_software_node(&pdev->dev);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
@@ -867,6 +935,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{
+		.compatible	= "qcom,sa8255p-dwc3",
+		.data		= &sa8255p_dwc3_qcom_priv_data,
+	},
 	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
-- 
2.34.1

