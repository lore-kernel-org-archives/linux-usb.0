Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBA54119E4
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610422; cv=none; b=NnlY0h934VDJX0Lv95E+J1/aUhMMXTuVzmk3I8kfZIG7LXAL9bjeESJ9rh+A0gUD3+OL8vWCM+nZm+QCcJjgwJWMqcGje0tGUbs5ZYdA13jJLEKMBjlLpGdU8L2XUZNc7y5fQ8BITloopql/5Ru2p8WwnerHjCPzI81MQQ+TdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610422; c=relaxed/simple;
	bh=kogPWcb2tCkfq09Kcpjybypxv5BNMASpBIbZXmQnNoY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=da5Wf7Hps+O9RRH894KQ2aHgdlfpbPK9I56HXoBlHagiy7qO4bAtXrRndl67VlyYErXlf9HZ+P3g90JSSioCLoq/Y+loGiBYoaFoz05np7tvlW0uCfIevm9CU1DSorU71BNCmSObb9/vxgiGvWIwG7grQOHDLXSA0YYR8wsuAxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3+IMr9A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jATO2QRK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3+IMr9A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jATO2QRK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A4BhRB3207090
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kTSeVsyIytz
	nuZGRKd7e7D9ceiU4zKtidC3tGELBVoM=; b=i3+IMr9A9VFvHmRBHbC36H6ncqH
	2R/ZiWBoEKMePI+78DrQKlTzhY2Ufdq2CjSlOlV98x76HGmvfJlaFm1oPaSr/lr6
	NLLBDOit0GeOV5HEPYjQDIOO+vYcZ9D7ydZpUd7yZ4p7vNlAtEq7GtORolkYDUKw
	wMxLVqFd1wkoevwRZ5zM2icYlpfhkKU7gT6xkZmiQXgZyD1sPbLns7R6N+Py8MKC
	ach1TZWxAIjBGPyR440eiXMNE7Nm7Bgh6Jzrrdv0GzFDzuxzt1T53jBqIFjB7v9z
	JRFUSxjq8c90M9vHaDVbsrkumjbfEgHVtqsmrw8Y69p29vkcuJjA4C/26ww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4e84xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-892ccb01fbfso291508b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 22:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610419; x=1792215219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTSeVsyIytznuZGRKd7e7D9ceiU4zKtidC3tGELBVoM=;
        b=jATO2QRKgiww3qlxzgP6ckGGS08sEDUTT38eGqpIx7MO8CrX/beQ+S/6tIEQwHl6nQ
         8LTfWe64lE45RiRGTJdlrBlM0BMmHCqKa9tzfpm/M6cACGhtfrK0c19KjmOC93Yx0DHB
         MREkYpi3v3bRusHq3JdymKI5WZe280MprHLQH2ysRjr/Li2YrryahG7RvzokTwpzAaCk
         Q1c2z7cBFGUZtQh3b19wxU8ZtEz7apSAX6VVDRqjrPx+6bdCf6T+8la+dLX+oCi7bA4q
         NY9JmLRedK3v0JxQ8Pw+HGO4NGtF9/VPb+FhEk5JfY30BgYNOkpLFmYL5KJl7SyVkwTa
         5XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610419; x=1792215219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kTSeVsyIytznuZGRKd7e7D9ceiU4zKtidC3tGELBVoM=;
        b=Q/E9PRXAn4xDWxC/7AKznSJFu0J/rHHfIWInnKDnXs6JXK2lH7y9JijriFKBk5NcXn
         5czGp10tZLOyMknqnPFKdn/v0yVi2Big2WnhVSjBduD4WZ7mfvtu2ngx84yBOEErmoTG
         yzZhJU4KAFN9nmtwRHAXjr++p6eBesAK8j6eHFFXChoxBjY4frD+paOM4cu1wHhfonNQ
         LARITQxNwkrXeWWxzxOOeYDOjjJONyji519PlXz+1DQNLGcGl5HAzSy0ZIqBAWo/yk1L
         60YFhh9QRLYKQslB+KPLKqx6+Fs5uGprx798Uuea/oNKZbf5GgV/H17xSMbJjYm3cIqe
         R1Sg==
X-Forwarded-Encrypted: i=1; AKwUvByX6+qCnlzUljiKqaS9i0HsApGotHu4eLZrQXY8+4wL1Fcrv03fh9Ss3GvMCs1cXupdZh/jSCuYNYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRBNNeAta+1abt+eutU/4x55ktZ+PMcyxgqGPClYdKUfIfVzAV
	X7ujYlblFa/2LnMcXHrJ61bVhrpMkPsvaIV0ACpHwQUCKH6BaO98o/+cqDhnlNzP+l12JKda47V
	MHuf4b2p9aEuwif+EXq9P+H40+kHddP2+PMNv+Fmz2vUm1wMVkpHVja50rcz6bLw=
X-Gm-Gg: AYBFou2MYwLflncwj4c+w9Exy2S7D17sWow0UCVXXaYbMqDkUnZlb8xf3rBzi0BVeHx
	2YgDWnmzMl122xIdFqcDY+Hsypq+U2Xqpwl7J5nbWO1PR3yXDW41q+v77XCGZ2Br9KtEQIe2+nc
	X8iwWhjFirjE54T/YL6od1+FnuR0Y70CQ9nNeVU+az/rykQ2T4kMxCV7N1wKxbFQRqmpMqR1zKd
	0S0GOa163mJ4c5MKuDMsSMOpyDG5QxImEML8pkrVNspBLNMVyvaguDn6xqQw3xZoTVddgZNtaX/
	ArNkBR9+5BqU0rfrL8zYrPRMEI/2dJAf4OA77vspJcd0hKAExfbpr17GFE2ro+NHZvuaYU8tQGw
	h21vHhBf4xOzAmZ+ucn1tm+QEU0sQqIk=
X-Received: by 2002:a05:6a00:3e12:b0:886:77eb:38fb with SMTP id d2e1a72fcca58-897c6e1b5f0mr3409414b3a.25.1791610418450;
        Fri, 09 Oct 2026 22:33:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:886:77eb:38fb with SMTP id d2e1a72fcca58-897c6e1b5f0mr3409400b3a.25.1791610417944;
        Fri, 09 Oct 2026 22:33:37 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:37 -0700 (PDT)
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
Subject: [PATCH v3 6/7] usb: dwc3: qcom: Support firmware-managed resource states for power management
Date: Sat, 10 Oct 2026 11:02:45 +0530
Message-Id: <20261010053246.2991984-7-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfXykK4mzY6ahqG
 YvstFmo+p8d9k+ibPyegCzad2npI9NGZG7vnvCsVJEmIEQOtmY4QtyX3tRmso25PNiAnBXgrD/k
 rtUgGa7s4O5I+686/uLFyTLxhQXSSgDNTOaKf1t0C53Elz6oeUz0SRPCxQaK0FoS8wmXQdcdGoc
 Yd8yNOUKvP9lK/czfJ5STZqPe1xEmV6Nq06cuU6qbuAE1AD5xUwW5G4LpXii1YhOBOfqxxgZtkT
 xh/kwMwdVxlz12xKtIVeXaIk4tUkwtgcE5+dz4tE3c9CzOiSiwsLUAwWcOJuFu7/yrxPREpBZ6U
 woFImWlIZJZ1sd/na5FDAUfKIkDuy7G8c3tEL3SuHWacizjiToK2bhIMQiHKaEzaKR/NDMZS63U
 PiTyNjd3H2KX2ONUy2jPCt9DRhngfYOyDI3Ach5yRUrDlkRsBTOYomXnoDJ5e3S49BSx3g1Aa95
 i+y2QMVz7ESFTlPcDPQ==
X-Proofpoint-ORIG-GUID: Kz4T7OMPV7NBmQzg9hscnoKn3-2w4uWX
X-Proofpoint-GUID: Kz4T7OMPV7NBmQzg9hscnoKn3-2w4uWX
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6ac9ce33 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Rglj1UawH0vecOVH_24A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX/z2pW6XdGHBu
 vZg1Uo7hjnTIhvbZ3YH2sY5YW8Nx98lwWRRCE36j9fYvht0VDRX9hVoHnGmksMz7qJywunNvi3j
 SjeL3QLnE+psNmOZd3N81FbEceNvX/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

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

If system suspend is entered while the device is already runtime
suspended, only the "power" vote is still held, so system suspend
drops just that one. System resume then votes both domains back on,
which keeps the votes balanced across the cycle.

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

pm_runtime_put_sync() drops the domain usage count even when it
returns an error, so failures to vote a domain off are only reported.
Failing suspend on them would leave the driver thinking the votes are
still held and unbalance the next resume/suspend pair.

While here, assert the controller reset in dwc3_qcom_remove() and on
the probe error-unwind path once the controller is powered down. These
paths are shared by every qcom,snps-dwc3 platform, not only the
firmware-managed ones added here. That is safe for existing platforms,
because remove() already fully powers the controller down and a probe
failure already leaves it unclocked.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 252 +++++++++++++++++++++++++++++++----
 1 file changed, 228 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 3860ab83c28c..0896a323bdda 100644
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
@@ -93,14 +95,142 @@ struct dwc3_qcom {
 
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
+ *
+ * pm_runtime_put_sync() drops the usage count even when it returns an error,
+ * so the votes are released regardless and errors are only reported. Treating
+ * them as failures would make callers believe the votes are still held and
+ * unbalance the next dwc3_qcom_domains_get()/put() pair.
+ */
+static void dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
+{
+	struct device *power_dev = qcom->pd_list->pd_devs[0];
+	struct device *bus_dev = qcom->pd_list->pd_devs[1];
+	int ret;
+
+	ret = pm_runtime_put_sync(bus_dev);
+	if (ret < 0)
+		dev_warn(qcom->dev, "failed to disable bus domain: %d\n", ret);
+
+	if (bus_only)
+		return;
+
+	ret = pm_runtime_put_sync(power_dev);
+	if (ret < 0)
+		dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
+}
+
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -380,8 +510,20 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 	int i, ret;
 	bool wakeup;
 
-	if (qcom->is_suspended)
+	if (qcom->is_suspended) {
+		/*
+		 * Runtime suspend dropped only the bus domain. System suspend
+		 * must drop the power domain too, so that system resume, which
+		 * votes both domains back on, stays balanced. The usage count
+		 * is dropped even if this fails, so don't fail the suspend.
+		 */
+		if (qcom->fw_managed && !PMSG_IS_AUTO(msg)) {
+			ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[0]);
+			if (ret < 0)
+				dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
+		}
 		return 0;
+	}
 
 	/*
 	 * For runtime suspend, always enable wakeup.
@@ -397,11 +539,17 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
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
+		/* Runtime suspend keeps power voted on; system suspend drops both. */
+		dwc3_qcom_domains_put(qcom, PMSG_IS_AUTO(msg));
+	}
 
 	/*
 	 * The role is stable during suspend as role switching is done from a
@@ -456,13 +604,22 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	 */
 	dwc3_qcom_disable_interrupts(qcom);
 
-	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
-	if (ret < 0)
-		return ret;
+	if (!qcom->fw_managed) {
+		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
+		if (ret < 0)
+			return ret;
 
-	ret = dwc3_qcom_interconnect_enable(qcom);
-	if (ret)
-		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+		ret = dwc3_qcom_interconnect_enable(qcom);
+		if (ret)
+			dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+	} else {
+		/* Runtime resume re-votes bus only; system resume votes both. */
+		ret = dwc3_qcom_domains_get(qcom, PMSG_IS_AUTO(msg));
+		if (ret) {
+			dev_err(qcom->dev, "failed to enable power domains: %d\n", ret);
+			return ret;
+		}
+	}
 
 	/* Clear existing events from PHY related to L2 in/out */
 	for (i = 0; i < qcom->num_ports; i++) {
@@ -699,16 +856,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (priv_data)
 		qcom->broken_suspend = priv_data->broken_suspend;
 
+	if (priv_data && priv_data->fw_managed)
+		qcom->fw_managed = priv_data->fw_managed;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
 				     "failed to get resets\n");
 	}
 
-	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to get clocks\n");
-	qcom->num_clocks = ret;
+	if (!qcom->fw_managed) {
+		ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to get clocks\n");
+		qcom->num_clocks = ret;
+	}
 
 	ret = reset_control_assert(qcom->resets);
 	if (ret) {
@@ -724,9 +886,33 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
-	if (ret < 0)
-		return ret;
+	if (!qcom->fw_managed) {
+		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
+		if (ret < 0) {
+			reset_control_assert(qcom->resets);
+			return ret;
+		}
+	} else {
+		ret = dwc3_qcom_domain_attach(qcom);
+		if (ret) {
+			dev_err(dev, "Failed to attach domains (%d).\n", ret);
+			reset_control_assert(qcom->resets);
+			return ret;
+		}
+
+		/*
+		 * pm_runtime_resume_and_get() is correct here regardless of
+		 * whatever state firmware or the bootloader left the domains
+		 * in beforehand.
+		 */
+		ret = dwc3_qcom_domains_get(qcom, false /* bus_only */);
+		if (ret) {
+			dev_err(dev, "Failed to enable power domains (%d)\n", ret);
+			dwc3_qcom_domain_detach(qcom);
+			reset_control_assert(qcom->resets);
+			return ret;
+		}
+	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -790,9 +976,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_interconnect_init(qcom);
-	if (ret)
-		goto remove_core;
+	if (!qcom->fw_managed) {
+		ret = dwc3_qcom_interconnect_init(qcom);
+		if (ret)
+			goto remove_core;
+	}
 
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
@@ -804,7 +992,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+	if (!qcom->fw_managed) {
+		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+	} else {
+		dwc3_qcom_domains_put(qcom, false /* bus_only */);
+		dwc3_qcom_domain_detach(qcom);
+	}
+
+	reset_control_assert(qcom->resets);
 
 	return ret;
 }
@@ -817,9 +1012,18 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	if (pm_runtime_resume_and_get(qcom->dev) < 0)
 		return;
 
+	/* Also disables runtime PM and marks the device suspended. */
 	dwc3_core_remove(&qcom->dwc);
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-	dwc3_qcom_interconnect_exit(qcom);
+
+	if (!qcom->fw_managed) {
+		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+		dwc3_qcom_interconnect_exit(qcom);
+	} else {
+		dwc3_qcom_domains_put(qcom, false /* bus_only */);
+		dwc3_qcom_domain_detach(qcom);
+	}
+
+	reset_control_assert(qcom->resets);
 
 	pm_runtime_put_noidle(qcom->dev);
 }
-- 
2.34.1

