Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214012;
	b=hAOguhGQ9vdyzmJ8iylHw5eHBR2ufaDvIKLUUewcDxIp52VLu5GFUFRJ8GUMTBZA1NK8
	 2hBGfEVT1L9OPCIdex0MLS3wq2hmD9A7Ip783KNv4pIii3jlEeXHS5xR8NcVf2DTsNFDe
	 Dt26ZBl54WRtcGaP/A8DrgG2YBImRG4lxs8whXFeF67GwAwKEptxV0KOxQ179AKsX6Pl8
	 UtCPNw+mztdczhHt+9HzAdf7ns/Bg7HoVL/h8+neUrW1g2cVBOpEsAw/c/O606a5pXinA
	 KKVwl3MM9nEqOlW+1svc9Xlm5avOFpYAgjtdu/4mHGg5xdmoIcsMFzfwkPA/AANpBYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kTSeVsyIytznuZGRKd7e7D9ceiU4zKtidC3tGELBVoM=;
	b=oiERWWTetP8ipEEUzgGkrXg7zKsz1Yl8vzvpd0nLLIRYdnPmzkyH/18NMK8UycTZjVL4
	 K+QvJgHN2Eiq7Wl0TCHrAo+4mnuHZz9wLioyT4JanVDGdnczi73T0YUOjnvCyk2sPyasS
	 Nmpo85bV6nOIc8hWiF9Ua6qkcX4hkyMCNI55fUhS6QJbBbnOu0dTJEF21oh3dzErrBjvQ
	 v0aHrhC2FHdsZWBeeT74UKlPPA0nPFDlNYk8uU6HYv+7wzK8LYoHQ4q+0F/o0ybPz3gXJ
	 QTaiyyhsKk3LVaLiZV3fBiU62YxYpHIcBZH1LnM2h2Wyi+5uhLWMQ8UrwJ9yasWJAcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UkXvlf/U";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5PGXuo5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1278F606A339
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1278F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkXvlf/U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5PGXuo5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPDpF2969688
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kTSeVsyIytz
	nuZGRKd7e7D9ceiU4zKtidC3tGELBVoM=; b=UkXvlf/UitbGCvHuUDRW2D2Kvt2
	JlLsvEnCP+Xed0ZmYu+KcxPMmNAmq0R9+HJlQpl07E2o//nxt6O2m1RVGKPIZ+v7
	UpnKQbqYDOHbuk0VXCydYA5H6NCqBIhg9ERahgsbqii5qUDT+gsTW3X24A8+xivr
	X2a1y+ec3npeBiIE7sd9mHa50l82dba0JlfT9iqk0sCjLAtee8CVnL/6Jm1yodmh
	oi8vLzqYgCtsDt5aibnVdnK/nUVXdFIYf7dgrw6EzFf4r+neMV/I18Cq8kiMK0X4
	FvB+19We2z5/bUb7b/nv4g6wbWHdVVAm4VFJs10eesnzo3Ylt2XYO5soRnQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehs2gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:00:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so1579199c88.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214010; x=1793818810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTSeVsyIytznuZGRKd7e7D9ceiU4zKtidC3tGELBVoM=;
        b=g5PGXuo5PIaZPl8e8SvEkwjCEz7zybDCb91WOYKfg1EFgo/FgrUCl6PRKVu7rMV4G6
         nZhwCo7J8zteZBlJcn0oSUKb8mNODwF3A0+kawCniGG9gRgVFLFBAqC1SV9rEhA4FiYg
         3Z4JOnoQRTzyGWAG29aYV2UcVrsKN9lGJDB8dRvo82dIlC8MvO1S7TrQ5RVUSKNyTXQu
         N6iCL9pEMNIVWRMeupZTGIVigUiz9WWj2JeX6bmMAgWjVmuzee47YfHvdbaVhd/uuHiQ
         8ir4/IORbY5JNfqGeOYmljqcMmKLA7bt/PH0P2o1M8+wISNy+zBPXWR9H0m5+ThrSGDc
         hlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214010; x=1793818810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kTSeVsyIytznuZGRKd7e7D9ceiU4zKtidC3tGELBVoM=;
        b=VfvAZZIZO7wH5QcckJOnkhDDEjo0Gz3md6ZqZPAqrTKgOMnWCyT4Kq96ypd5NL6Jn5
         aOT/Uiw5xi1W0+LszCmIyXKmSn3hZah7qLcJsTMD06Pv1UMzmhwE0oguZulaQH1JKrhE
         RGdv6s738Kq4N3SCp1/pm6geeyW/Xga40lziCNrWlGokhIowFPsvfC0Zz///0O9y1jFK
         fSR9GUAQY7tloiMJftxGVw1QmTlnZxXTU0EaA3JfThKBty2pHzNe3GrNPQErmWrAJ8ei
         snit71P8UZQTkEjVDmW4DZZYJFuTQcaGuJnPD9vQ0KcIISBFlOK0jV/Oyvljc5L0S5v8
         HCzQ==
X-Gm-Message-State: AFq9FYLRHIsF0wpt017xtUzkWvVVp4KF29GOrq6g5MaIL/ZSyV1vovCB
	r8J61d9GZNpd/uS9mqxVJ7gRIj/1cCG6SYQ3ro1GrZjw1xKJk0RQ1iKmnLbyauz5D+iAEubZQRk
	mYS3a+bLRgvC0qQyvucYuSqibenK1kkaiBHsydRHWpPxZVeOPzwOMoKq6+OUmezrMkEhajX4=
X-Gm-Gg: AYBFou034UwuHc7c7KbxINk+QPOGbY85az3ZWSJ0PD0V98tABFdMDk9AsWFrVKEfvEe
	mcSLbTSNq51WYjHe4vImgszkdd1ulTSM/kbqUVBSXIdlQi2gq3Zxj04nYIMQZ8kAtpJf+dS1gRX
	aOXE9E0I7eTHKRSPfY+JkArwoHZHvq5X2URwyiBi+0/QK/Ca9VG+Y+Vud7v334ErqvMqq8BmM1D
	kH441KmKhIp16nH2IRUYYqe2X2Ct953kPtuszHFGBxwXhC2D+RjIljgPHW9XOu88AY6luAnHs4z
	slNU5hSX7xCwpnFoDrb2tw6+d0Oa7mIM2TUw5FClj+2pBzJE6csU0NDYP60MaBdGbkd+srAm9md
	K+xVQAUhmm6apdcwpNSqV3O/1G2pB37fCKkekYK4VIuCErQaHhTv5d1C6xwJEkZi9blGuJ5BwKU
	JvVtxvRA==
X-Received: by 2002:a05:7022:6727:b0:155:7721:3a4c with SMTP id a92af1059eb24-1a6d15f8182mr5795580c88.35.1793214009549;
        Wed, 28 Oct 2026 12:00:09 -0700 (PDT)
X-Received: by 2002:a05:7022:6727:b0:155:7721:3a4c with SMTP id a92af1059eb24-1a6d15f8182mr5795490c88.35.1793214008522;
        Wed, 28 Oct 2026 12:00:08 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.12.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:00:08 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] usb: dwc3: qcom: Support firmware-managed resource states for power management
Date: Thu, 29 Oct 2026 00:29:36 +0530
Message-Id: <d04522f9f972637133b8b080919f870e56a66395.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AuleBn6yBkpJ1fBs6KnBsss4yEd9PgK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX/Ko+pTQpR4G1
 CRwihV9wJYjlx6bbsMt7OlSGFjWImwLzb6jDWzK8j5ObnkZPI5wnxyLQ+Nhjx79qAEr++KYrTL7
 2oU/z/uSonO+G8232jUeK9Ge0E0679CwU7g76KPIpksf4TNoPOHZ9su8dgTt6LhsJf+jBcrB6ae
 EcTwNpwUb04oX72QvFiiFUo/cPYbkLBwRmuYcQr9YLg+j3JTrJwI/Y0u73BGMpVbVN/40+FDuBE
 wykTXAgIw0lt9U6t1iliIMXv2CLFXa+ohdTvv9ZR51t61RXGmXTuV+t+s/UcPvL86oSdIY519uZ
 57r2TrxRqY7BkVmHrx1bm225Xp5udWom/bDq0DpwfS1sXTJpjFUsfpO83kb2iGTgudwAKTBr0Au
 hqPICg1TYEyIdtQxRMbzFmGQZoMOfpAnp8ECr5Dxxh5g9VGO+1bsJNTRqer9cv+jf0j35LEbpCk
 Twc8Mx2OC7h+hnQhvcQ==
X-Proofpoint-GUID: AuleBn6yBkpJ1fBs6KnBsss4yEd9PgK6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX/i3Cuhf95Yep
 6PDJi5sf8NmeZvSAuEfvkZeasMzzMNgK83yZzlYGWtsM5R8/0U/Wr+3FF5CZvGpofF3dFGSrkKx
 8z6JWo+1risfo2i4PP3oLlwzy+sJIYI=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2463b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Rglj1UawH0vecOVH_24A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

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

