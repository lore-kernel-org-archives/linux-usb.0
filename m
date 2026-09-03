Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5D4EC677
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449957; cv=none; b=b8e+dnhqpAifY6WGx7XJCMhoXTDzJxtZaa0yfPWNwPYuqqFpLXPIq1RJbP54tUPwPFNRIAiEigdZgNVyyYthws54pqL7fMIJR4Vss1TDGE6vpUiTSoAPHru8MLd5iKNk3QycvasCmN3ylZ6fYCLiGvZq0pSdQtY9FEOgw8Oyd98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449957; c=relaxed/simple;
	bh=X8FEyWy8jy9wrxB4wlggYX44zBaBBglO/Vfc+r4SqMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SX/KXRWOSGC9R5Ufno3w8vJaLZvsilL1I57DoyGy7vvY8Wk105Xlv7brBE35suivJ04vpH1z6D3VXR8XAIWSH5rhioTXN4dgCedGaTUmN+Jcq98aMxcuEoka8Hp8cES+6OyCyhcca5rlakR8PZY+zt6ESPI7KQix8BYFvTgB5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXgHhj/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBrM0G+t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXgHhj/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBrM0G+t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAhVo4158284
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 15:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GDN3qovgsfL
	e+3+mRENlSPwJnvZlLbbD2G7tZd0eDHw=; b=DXgHhj/yYGAiGSJAuWpBVKt8h2F
	CNQZ2shEX57HiJK1GFiDChm4JjcQEsKsmeIzH9DYVURZWvG1ShTeY3GFYreHrgcM
	NL7S+E10QpaF5lh30URuboXFQDMmxBWVIV5b0S3EZeoBBdmELhF4JoLhzQKC6hnu
	rRqJHtovCZ8wDPgAt0RYQJ6+6gE7I6L6GVzzd8yIMzXErkD9wmQmgFWFBawFPegz
	SjNdyfBT0V/xCIcwMYupasYApj2LWqj/ex7HjTyimDr8tpJjn6ZYqplKC+6cj30w
	FtM+eqjqTi/zevwWh3nNwI8GJ/8QjcAmO7YAAIc8zVmiDbdyJooc7x8/35g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdsr32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 15:39:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8544b721ce9so3278028b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449953; x=1789054753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDN3qovgsfLe+3+mRENlSPwJnvZlLbbD2G7tZd0eDHw=;
        b=kBrM0G+tW/Pn4T/m2wCw43Jd6oulP2bjMHyduSrusAQez5e4k2HbHHnw4HTfNDP2Hp
         s1BSNyVbD9QoCxJ5/lcQxb+zxcIeNq+8evBVjXX5oU9Jt9v4hmmaCL3mxAHZdhJ1aBhX
         LgS4iZTUnfVvA2S+7hv6aZC/+LyPxTTbeJNg6zY5tPDwzuPeVFGQknBQJVBm5vSbucxg
         Vw27D33VSbswgaY7qh4Fz8MYkX592IyHqqypRF9BAGX+ci2WeUqqVwue9+5L2l8WmoZa
         hQ+GdxhOARafdcTB/TxTPDgZSgFXYkfs4r9JQp+zUL5oGiPEie7ir2nJDBshDajsbu4p
         8/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449953; x=1789054753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDN3qovgsfLe+3+mRENlSPwJnvZlLbbD2G7tZd0eDHw=;
        b=CXQMFqQHX5p8SblAlB96NK3kQu6MO3fAyisAF1iFERvHIilZENAO/ybP00RUZ/OxOu
         6fhGnycg1AxFem5+qZuT5mw4YfnC1E+udt5XokuDWGry5ejA39K3XvLAhHokkSeDy1bk
         Ma4Sk63eGAJFJ1wTn15HxIjTiLubdQ5sOU+LnERwphd5AmFNYOJWexxRu7hB6mLyluoG
         0nBhXwiBmX7jysCaJItxITze6hHqIb/GbPp/OzUreNxx/+gbe36xxmlN1KUALrVzyvMM
         exRuceM3bfu6g2+/zBkuWB0aYuLANdibOSTbWuW8yEL25kUZmih3QsZ0/uphNbN4+N0U
         ZM9g==
X-Forwarded-Encrypted: i=1; AKwUvBywxgAHUy8fF5l9ov8VvIt175c6Vav7SDIaPc+vYn4HGnmFtbARfhWgjx2tVuOQt11yczdWjmb34pI=@vger.kernel.org
X-Gm-Message-State: AFuF++nb1KrttrUde7c7hLNRDKfLbkJ5A4c5e5hqqWqNksvNs0iaeFZR
	/ByR0f6z0Fr6fiUBRKccTdKdAl83NABaHGGRieCnkH7SaWAgxp8p2kR7++2MeGhF+iJY6sclB2K
	3IKE+7snL7J5hm3MW52HNMslgQFCJeGjmQGTulQ80t77eKxYT925yBxd7dehzOKg=
X-Gm-Gg: AYBFou2CSUWkZxz10YdmfuWB7h0V2K4j57Fp1osFIs+DTVGbup2i1rQ/dL0HDwKErzM
	KEN07XmZOCGQ9AHbVuociWRD5mBtawXQNotM5Nq+r5cdhnAjHp2OttgIAkawo78XJFueuuGcIhP
	BxLf9hncWKP529AaVMqPLz9Hu9ng1kOBlKLDxI7H+GwXrH4w/aID4zLd391rKO+TLGZq21MBd5N
	4zaApnCgtYduajHYuxPh2hxkJ0E+hjOqxfB7vQ4Fb1o0YanTljgS2MdxWgC8gVNUoy8kk5Ta/8m
	d6wLgh1DIxqGmt8+aMzr7/cFdIdhG8JjARvrq7cYb4aO2V0MOIL4tJGnFlp6spqOrL9clRsa4WH
	q6khrpmJAicq1jB2e6cre4SGoBCwB/O9R
X-Received: by 2002:a05:6a00:17a3:b0:857:7337:5dbc with SMTP id d2e1a72fcca58-85ed9f9eea9mr19645194b3a.26.1788449952365;
        Thu, 03 Sep 2026 08:39:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a3:b0:857:7337:5dbc with SMTP id d2e1a72fcca58-85ed9f9eea9mr19645090b3a.26.1788449951628;
        Thu, 03 Sep 2026 08:39:11 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:39:11 -0700 (PDT)
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
Subject: [PATCH v2 7/7] usb: dwc3: qcom: Support firmware-managed resource states for power management
Date: Thu,  3 Sep 2026 21:08:27 +0530
Message-Id: <20260903153827.3463313-8-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX8Cd3bv2//tH8
 pmH9KiusecIwnwAi4LeBhuNh+3HF9e/sQZocOJ/2GAEYJK/S5d6ZHFLOqIBRf17cw1MeKEizhBP
 CWeQ4xhHFBVA0LCHCtvaJNv9DKGzmnQ=
X-Proofpoint-ORIG-GUID: dOFSax0lG-66Zs2QKs9SG14xZa1DzhvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX314hK/+uJgzN
 h9wsBDMJ+HrxPfGk9F/dC3XxK719XYIhtYsm4j1qaW/akuwE1lrFAkHLSwm6gAQy7kA0TlJaRWu
 My/F5Pl10v6BpCINKRM06by4dpeWoIuCCCz4vvTzspacgDGWd6URtswLxAC1aPNTGX76pGSFjbq
 wEU8mE831IdDwdT2VnTNb4S4IbgYgn5L837Myyp0c+invYMjfaA7N7xYrk6hPJ/EKky8PxuRFmg
 G1XlqFQrfIjwspx1zkeU0IMOYi/f0AiUdAOK7ylkeL11TT+h4+qRkrdeRAZg0INP0ZjpflOhpMQ
 RZoKsJvVDYUBXhuAOisygVJjgKdBgKE1gXODvi5bT0xNzzE2J0iQmUprdFA2umT6NeQYzrw9nA/
 UlI9iQF/9Vph7OIpbBWT9u5ZCyNPAC88QoQQQxCcC3DYcog79uVvy1NtegV1W0srCzEP+xeqVoF
 x/egoM7wLKEefnz5DSw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9994a1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=axS7kIFeZIf1MfX2eSIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: dOFSax0lG-66Zs2QKs9SG14xZa1DzhvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

Add support for firmware-managed resource handling in the Qualcomm
DWC3 USB controller driver. On platforms such as SA8255P, controller
resources are abstracted and managed collectively by firmware, and are
exposed to Linux through SCMI-backed power domains.

On SA8255P, resources such as clocks, regulators, resets, TLMM and
interconnects are controlled by firmware. The driver communicates with
firmware through two power domains:

  - "power": controls power supply (GDSC) to the USB controller
  - "bus": controls clocks and interconnects used for data transfer.
    Register accesses through the controller require the "power"
    domain to be enabled.

The two domains are voted on and off directly from the PM callbacks
through dwc3_qcom_domains_get() and dwc3_qcom_domains_put(). Runtime
PM usage counting keeps each domain enabled for as long as it is
required; the driver does not attempt to track or infer any aggregate
device power state, nor does it assume what state firmware or the
bootloader left the domains in before probe.

Runtime suspend/resume vote only the "bus" domain, since the "power"
domain must remain enabled for hardware accesses that can occur while
runtime suspended. System suspend/resume vote both domains.

The domains are attached with PD_FLAG_NO_DEV_LINK because runtime
suspend and system suspend require different supplier states. Runtime
suspend releases only the "bus" domain while retaining the "power"
domain, whereas system suspend releases both domains. Ordinary
device-links would couple both suppliers to the same consumer runtime
PM state and therefore cannot express the required policy. The driver
consequently manages the runtime PM references for the attached domains
explicitly.

These votes are taken during probe, remove, suspend and resume,
enabling coordinated management of grouped resources according to the
controller's operational requirements.

Enable firmware-managed resource handling for the
"qcom,sa8255p-dwc3" compatible while maintaining backward
compatibility with existing platforms that use direct resource
control.

While here, harden dwc3_qcom_remove() and the probe error-unwind path:
disable runtime PM before tearing down so a concurrent PM operation
can't race the teardown, assert the controller reset and mark the
device runtime-suspended once cleanup completes, and keep going with
best-effort cleanup if the initial pm_runtime_resume_and_get() in
remove() fails instead of leaking. These paths are shared by every
qcom,snps-dwc3 platform, not only the firmware-managed ones added
here: the added reset_control_assert() and pm_runtime_set_suspended()
calls are unconditional. They are safe for existing platforms because
remove() already fully powers the controller down and probe failure
already leaves it unclocked, so putting the (shared) reset line into
assert and marking the device suspended only makes the visible runtime
PM state match reality more precisely than before.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 309 +++++++++++++++++++++++++++++++----
 1 file changed, 281 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e58a9ca23b00..7139eadbfb1e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
@@ -70,6 +71,7 @@ struct dwc3_qcom_port {
 
 struct dwc3_qcom_priv_data {
 	bool broken_suspend;
+	bool fw_managed;
 };
 
 struct dwc3_qcom {
@@ -92,14 +94,147 @@ struct dwc3_qcom {
 
 	bool			broken_suspend;
 	bool			ignore_pipe_clk;
+
+	bool			fw_managed;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
 	.broken_suspend		= true,
+	.fw_managed		= true,
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
 
+/*
+ * Firmware-managed resource handling
+ *
+ * On platforms where clocks, interconnects, resets and the GDSC for the USB
+ * controller are owned and sequenced by firmware, access to those resources
+ * is exposed to Linux as two power domains:
+ * - pd_list->pd_devs[0] ("power"): the GDSC supplying the controller
+ * - pd_list->pd_devs[1] ("bus"): the clocks and interconnects used for data
+ *   transfer, which additionally require "power" to be on for register
+ *   accesses to succeed
+ *
+ * Reset signals are controlled separately through the reset control framework
+ * during probe/remove.
+ *
+ * The two domains are voted on/off directly from each PM callback that needs
+ * them; there's no attempt to track or name an aggregate device power state,
+ * since the actual state lives in firmware and is queried by voting through
+ * runtime PM, not by mirroring it in the driver.
+ */
+
+/**
+ * dwc3_qcom_domain_detach() - Detach power domains
+ * @qcom: Pointer to the dwc3_qcom structure
+ *
+ * Detaches all power domains.
+ */
+static void dwc3_qcom_domain_detach(struct dwc3_qcom *qcom)
+{
+	if (qcom->pd_list)
+		dev_pm_domain_detach_list(qcom->pd_list);
+}
+
+/**
+ * dwc3_qcom_domain_attach() - Attach power domains
+ * @qcom: Pointer to the dwc3_qcom structure
+ *
+ * Attaches power domains for firmware managed resource handling.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int dwc3_qcom_domain_attach(struct dwc3_qcom *qcom)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags	= PD_FLAG_NO_DEV_LINK,
+		.pd_names	= (const char*[]) { "power", "bus" },
+		.num_pd_names	= 2,
+	};
+	struct device *dev = qcom->dev;
+	int ret;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &qcom->pd_list);
+	if (ret != pd_data.num_pd_names) {
+		dev_err(dev, "domain attach failed (%d)\n", ret);
+		return ret < 0 ? ret : -ENODEV;
+	}
+
+	return 0;
+}
+
+/**
+ * dwc3_qcom_domains_get() - Vote the firmware-managed domains on
+ * @qcom: Pointer to the dwc3_qcom structure
+ * @bus_only: If true, leave the power domain untouched and only vote bus
+ *
+ * Votes runtime PM "on" for the domains this call is responsible for. Each
+ * call has exactly one matching dwc3_qcom_domains_put() call with the same
+ * @bus_only value on the corresponding disable path; runtime PM's own usage
+ * counting is what keeps power on for as long as bus needs it, without the
+ * driver tracking or assuming any prior domain state itself.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int dwc3_qcom_domains_get(struct dwc3_qcom *qcom, bool bus_only)
+{
+	struct device *power_dev = qcom->pd_list->pd_devs[0];
+	struct device *bus_dev = qcom->pd_list->pd_devs[1];
+	int ret;
+
+	if (!bus_only) {
+		ret = pm_runtime_resume_and_get(power_dev);
+		if (ret) {
+			dev_err(qcom->dev, "failed to enable power domain: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = pm_runtime_resume_and_get(bus_dev);
+	if (ret) {
+		dev_err(qcom->dev, "failed to enable bus domain: %d\n", ret);
+		if (!bus_only)
+			pm_runtime_put_sync(power_dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * dwc3_qcom_domains_put() - Vote the firmware-managed domains off
+ * @qcom: Pointer to the dwc3_qcom structure
+ * @bus_only: If true, leave the power domain untouched and only vote bus
+ *
+ * Releases the votes taken by the matching dwc3_qcom_domains_get() call.
+ * Bus is released before power since bus register accesses require power
+ * to still be on.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
+{
+	struct device *power_dev = qcom->pd_list->pd_devs[0];
+	struct device *bus_dev = qcom->pd_list->pd_devs[1];
+	int ret;
+
+	ret = pm_runtime_put_sync(bus_dev);
+	if (ret < 0) {
+		dev_err(qcom->dev, "failed to disable bus domain: %d\n", ret);
+		return ret;
+	}
+
+	if (bus_only)
+		return 0;
+
+	ret = pm_runtime_put_sync(power_dev);
+	if (ret < 0) {
+		dev_err(qcom->dev, "failed to disable power domain: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -386,11 +521,23 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
 	}
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
-	ret = dwc3_qcom_interconnect_disable(qcom);
-	if (ret)
-		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
+	if (!qcom->fw_managed) {
+		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+
+		ret = dwc3_qcom_interconnect_disable(qcom);
+		if (ret)
+			dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
+	} else {
+		/*
+		 * Runtime suspend only needs to drop the bus domain; power
+		 * stays voted on so register accesses remain possible for
+		 * whatever briefly resumes it. System suspend drops both.
+		 */
+		ret = dwc3_qcom_domains_put(qcom, PMSG_IS_AUTO(msg));
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * The role is stable during suspend as role switching is done from a
@@ -450,13 +597,25 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
-	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
-	if (ret < 0)
-		goto enable_irq;
+	if (!qcom->fw_managed) {
+		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
+		if (ret < 0)
+			goto enable_irq;
 
-	ret = dwc3_qcom_interconnect_enable(qcom);
-	if (ret)
-		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+		ret = dwc3_qcom_interconnect_enable(qcom);
+		if (ret)
+			dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+	} else {
+		/*
+		 * Runtime resume only needs to re-vote bus (power was left
+		 * on across runtime suspend). System resume votes both.
+		 */
+		ret = dwc3_qcom_domains_get(qcom, PMSG_IS_AUTO(msg));
+		if (ret) {
+			dev_err(qcom->dev, "failed to enable power domains: %d\n", ret);
+			goto enable_irq;
+		}
+	}
 
 	/* Clear existing events from PHY related to L2 in/out */
 	for (i = 0; i < qcom->num_ports; i++) {
@@ -713,6 +872,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		qcom->broken_suspend = priv_data->broken_suspend;
 	}
 
+	if (priv_data && priv_data->fw_managed)
+		qcom->fw_managed = priv_data->fw_managed;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		ret = dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -720,12 +882,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto err_remove_swnode;
 	}
 
-	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to get clocks\n");
-		goto err_remove_swnode;
+	if (!qcom->fw_managed) {
+		ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "failed to get clocks\n");
+			goto err_remove_swnode;
+		}
+		qcom->num_clocks = ret;
 	}
-	qcom->num_clocks = ret;
 
 	ret = reset_control_assert(qcom->resets);
 	if (ret) {
@@ -741,9 +905,31 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto err_remove_swnode;
 	}
 
-	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
-	if (ret < 0)
-		goto err_remove_swnode;
+	if (!qcom->fw_managed) {
+		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
+		if (ret < 0)
+			goto err_remove_swnode;
+	} else {
+		ret = dwc3_qcom_domain_attach(qcom);
+		if (ret) {
+			dev_err(dev, "Failed to attach domains (%d).\n", ret);
+			goto err_remove_swnode;
+		}
+
+		/*
+		 * Vote both domains on for the remainder of probe. This is a
+		 * plain runtime PM get, not an assumption about what state
+		 * firmware or the bootloader left the domains in beforehand;
+		 * pm_runtime_resume_and_get() is correct regardless of that
+		 * prior state.
+		 */
+		ret = dwc3_qcom_domains_get(qcom, false /* bus_only */);
+		if (ret) {
+			dev_err(dev, "Failed to enable power domains (%d)\n", ret);
+			dwc3_qcom_domain_detach(qcom);
+			goto err_remove_swnode;
+		}
+	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -803,9 +989,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_interconnect_init(qcom);
-	if (ret)
-		goto remove_core;
+	/*
+	 * Initialize interconnect paths only for non-firmware managed resource handling.
+	 * In firmware managed resource handling, interconnects are controlled by power domains.
+	 */
+	if (!qcom->fw_managed) {
+		ret = dwc3_qcom_interconnect_init(qcom);
+		if (ret)
+			goto remove_core;
+	}
 
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
@@ -817,7 +1009,20 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+	if (!qcom->fw_managed) {
+		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+	} else {
+		int cleanup_ret;
+
+		cleanup_ret = dwc3_qcom_domains_put(qcom, false /* bus_only */);
+		if (cleanup_ret)
+			dev_err(dev, "Failed to disable power domains during cleanup: %d\n",
+				cleanup_ret);
+		dwc3_qcom_domain_detach(qcom);
+	}
+
+	/* Assert reset on error */
+	reset_control_assert(qcom->resets);
 
 err_remove_swnode:
 	if (qcom->broken_suspend)
@@ -829,15 +1034,63 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 {
 	struct dwc3 *dwc = platform_get_drvdata(pdev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	bool pm_resumed = false;
+	bool domains_suspended = true;
+	int ret;
 
-	if (pm_runtime_resume_and_get(qcom->dev) < 0)
-		return;
+	ret = pm_runtime_resume_and_get(qcom->dev);
+	if (ret < 0)
+		dev_warn(qcom->dev, "Failed to resume. Perform critical cleanups only.\n");
+	else
+		pm_resumed = true;
 
-	dwc3_core_remove(&qcom->dwc);
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-	dwc3_qcom_interconnect_exit(qcom);
+	/*
+	 * Disable runtime PM to prevent any automatic PM operations during removal.
+	 * This prevents race conditions where interrupt handlers or other subsystems
+	 * might trigger runtime PM operations while the device is being torn down.
+	 */
+	pm_runtime_disable(qcom->dev);
+
+	if (pm_resumed) {
+		/* Only perform operations that require device to be active */
+		dwc3_core_remove(&qcom->dwc);
+
+		if (!qcom->fw_managed) {
+			dwc3_qcom_interconnect_exit(qcom);
+			clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+		} else {
+			ret = dwc3_qcom_domains_put(qcom, false /* bus_only */);
+			if (ret) {
+				dev_err(qcom->dev, "Failed to disable power domains during remove: %d\n",
+					ret);
+				domains_suspended = false;
+			}
+		}
+	}
 
-	pm_runtime_put_noidle(qcom->dev);
+	/*
+	 * Critical cleanup operations that must be performed even if
+	 * pm_runtime_resume_and_get failed to prevent resource leaks
+	 * and anomalies during reboot cycles.
+	 */
+	if (qcom->fw_managed) {
+		/* Always detach power domains for firmware-managed case */
+		dwc3_qcom_domain_detach(qcom);
+	}
+
+	/* Always assert reset on remove */
+	reset_control_assert(qcom->resets);
+
+	if (pm_resumed)
+		pm_runtime_put_noidle(qcom->dev);
+
+	/*
+	 * Only report the device as suspended if the domains were actually
+	 * brought down; otherwise leave the runtime PM status untouched so
+	 * it doesn't misreport hardware that may still be powered.
+	 */
+	if (domains_suspended)
+		pm_runtime_set_suspended(qcom->dev);
 
 	if (qcom->broken_suspend)
 		device_remove_software_node(&pdev->dev);
-- 
2.34.1

