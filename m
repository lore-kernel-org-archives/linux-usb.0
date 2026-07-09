Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218973EA977
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587183; cv=none; b=qafcxDU1+21W/tFwuxwSvjm+o/jkFq5OSpcovyoLjcjvW5r7wvsQw5s3hshjyy4gnF0+zKeuBqG+fE4AI1+1uJZTpWhPHj+vOBLroaFJWF6mB3ZSMiB8xiQBwzQg15/cLgQlnuKyXxpX07W9TqNfI9JCuuVlXIDU+V1adQCORH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587183; c=relaxed/simple;
	bh=2LC4TKuvDL/8ibezYhZ5/e526GGw+mDJkG60Rt+VgOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJKol0Vh6ed7ZAPmCbrLdIAwR9sNtUORn3zr2nKyByIh+ChcGdWGhRixNDXFnSxP/LodjH/lwcxB+3xRuTW1cxuBxgHW/B879/05WEiPPpu9mjUUOdX/fFiebxQmVchuXm53GC5nMOGh3QYv2uB83Uqd2tovI2Yh38DLOpnLs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0H7Rg+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cf2rfvG9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0H7Rg+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cf2rfvG9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Z9A837398
	for <linux-usb@vger.kernel.org>; Thu, 9 Jul 2026 08:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8x1vSQ0yLHsjUQfaDpuXr3VOOZai+I3ARqOIth0tqys=; b=D0H7Rg+A1yirMptP
	lw2c+lmUBJodhyxOfeST13/J7lC0huNKHf/DWxEt8Gp893yQYSdGVMzxeYf0/TkU
	u5nGkybLvVefQo0Ei5kF0bPGKiZBdcmcGiDCL99XkNlyDj1o4/NmpBCLcbDAmo9R
	8PxiyZHnLQWIdPlvD0wAuphABae+9grlpJikQkf2ZPLoCmktImCJPwAPPgNvOZcV
	rYe82gYF0hzlR7hpdH4vAbHMvzi/cttnUKdzSEDhEPk+SOFMfuq/FYYvYcX8f2lS
	TLmMd0nCJ71aMI3GrrX8q/KtQ8n//rDpk7QppVsZ95xTOkwImfdnrjpchMmGA30t
	/Z40ng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwb9vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 08:52:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso2114211a91.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587179; x=1784191979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x1vSQ0yLHsjUQfaDpuXr3VOOZai+I3ARqOIth0tqys=;
        b=Cf2rfvG9w84wFlABTvTn8zwFru+la7gRvZJaK0eon6aKn+IKTkz0R6t0AGoMlcuJ+U
         ICAxTEVt6uDYAMa1bUuauxu+8MZ5K8e/8v0tTCiFPYaZUcpYsUxVwy093AAXGYKFC0Cg
         ps4rbVkmmziWd6cjklSMgU1Nco5yNtNIw/wfslqPJWynzz5Blk4c1HaCsPH5j64MhDIL
         nC29q5EdSWKmzk8ehSmWnFZrM0pOdMvZLP5dJqS4LjaFK72PM666GB/Ag4JM3/eUJgsU
         zvQbkqPBswl5PFmuNjCmGsXWfaMFmHFPIeUi+97aDyBVXZZ6K6vFlYWO1Gxb8eK1zTUD
         +XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587179; x=1784191979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8x1vSQ0yLHsjUQfaDpuXr3VOOZai+I3ARqOIth0tqys=;
        b=gz9Clr7NiI7C+apjM7kTixTaJA/qDbPZebEX7zBjZO+WTAOi9ab0VhoDF3IO3vKDVU
         7GJsXsdP+OYcM4LrkTd3wyLFPAsOZMjf5tChg8xXshzx2b1gYmwrrOrtxuSCpgJwlQVx
         xWKPgCSzRLgbnbulvtwaYdgRnGuCS7wKBm3jxMvwwetq2y7LUgRDCDLNeg9MF6Mk2IRC
         nng0tKndew/sxfwhhT+LW+0pANn+L+lZLvEWpyoyuZ10EqJ/zui8aOa35s1aCu3R33xi
         +cV49+uHOiUAmDHL5aVrKfyD8jnKv+vCLklPqmmfWFcTGsTlSszuTCIRyyRNlXYlYdl0
         9HRg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5O3cbe3wWQGNI7P/KT/HSX3Q7yptPgTdmhM+r/F/YyRa1pyO6L1apkIspg3M348py3cHF7VDjjmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxbGJXLiDlXdekAK3TmiA6h4fxLgv+RGnqJEgRGbq+hB5jPXO
	TQJ2N9S7p0NW0+P/ZkJbJC/r6QIlA7WLCROphkjI+2PeDF3Nm+/DaYNViQpEmeig4Me9rfEAKQG
	kUVE8cm+L4IuwcD43dnA5Pj9Mxa0k8ps0jVQSJ0y+rzs3hzLPFUkl53c4kk2Ps9E=
X-Gm-Gg: AfdE7ckX3erBLgefEL+7X74HpAk9n0/Gxm78qTtWshfqpXVYtMbyD7FO+ERjLG8tUPO
	U/kyIgWxIOs+Pk3BSFwHYuUeCI5hy53KRo2bLiGcLuTEv5bia1WxpDXfKD54rL+7ujOb1DHrcIC
	Rkt6tUX7V6kr5pcBwizWnuNZoqdl5AxVsRLmZACp0N6jCTxmccUa5iMHuerhXXX3ekNnwjp4k4N
	BmHBi0vOEW5ISNOpSpZN7IcmnN+df1/VpN5xXbC43OTLftHsFZYrAOxRoFhbkSlZwInZpOUOtUk
	eVtU0HUCIVac+M/AyCWZdvejtCuyUCJVWm5CpUi2V6sJABjwQMNXoquOCd6kAKCbRsf5r64Wf2K
	7KuYPuRooWcGpLOgbRUBju1mcc1LThRDbf0oO7gcQdAtI0envuS4LU43y2Do/BIrGC+q2e/939a
	XSCOcG
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr6638414a91.5.1783587178788;
        Thu, 09 Jul 2026 01:52:58 -0700 (PDT)
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr6638372a91.5.1783587178287;
        Thu, 09 Jul 2026 01:52:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574c36dsm822771a91.6.2026.07.09.01.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:57 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 14:22:37 +0530
Subject: [PATCH v4 2/2] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-eusb2-interrupt-handling-v5-v4-2-d4f993925608@oss.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587165; l=4842;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=2LC4TKuvDL/8ibezYhZ5/e526GGw+mDJkG60Rt+VgOM=;
 b=smNUIwlTXF/VpOZSNou22Hl0IXiuqTmfsm8JOd7qf2CBOhKfQHY0upcIuUMmu5suS0QkV93jh
 AFkfq+WV+vvAW0BChuC0x4K6Oy/seub67vv5oaBdnb4UtTJjHiU4ZyU
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NCBTYWx0ZWRfXzuFQ/T3UOzDQ
 qe7cEUTBfh31PJ9YA0QY7sh1jGqbAz/wdVy2xr07ZpdP8iWQyVTuGTjcxrvSBeY4KxgKPpgJIza
 YA+D47d4Lzh9HKpfzgW3IbRjRGoen49Zzp0C3ecmRD9JfyCW67YOJTQcHV8yH0FDMWWFYVcAMu8
 FISmGk6M7ooWNI632NNXWCxGQ8oX4wol49XOem4BeIksRApsiKFAzAOsLFSNWRjuF14S2mYAnTb
 Scr3FyLlF+K1T68XG2DjYvmpQDKEldJISt8H98+ECyiiTjMNp1GEzWYFlH3G+eWHRpZ8CyYO1FY
 TfdiN0PXoA9xBS9uZOqRU4NAW6GuwsjuDVWBxcZcdU3mTlHAfH2LGMzFIdpbZVZ/TllHF65DHRL
 mVPzZ7+3YIdxZLHomPzGdta+FeH3lv/JeNvodYj4WP0/XUV0wM5a08ojxJ9vvtvJoPLwkyhyHrt
 8KQv8K/HjbnfU1Gnn8Q==
X-Proofpoint-GUID: UVAZVnxke0JmotR4YwSsjXe0CKJiRetk
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f616b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tc1UND2VpooZlN5jxTkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: UVAZVnxke0JmotR4YwSsjXe0CKJiRetk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NCBTYWx0ZWRfX3QDhvVDRYDU2
 epKInfGH1lkYLtcko/AorR2fxg1KTrgyxDoRfzF92ulwSmICle9a7AUOkA/J59DScqKJ3DwW9PM
 hUf8roxuZUrQM4ThFGmHfHuWwd1nsmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090084

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..65996d47da1f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -85,6 +85,7 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			has_eusb2_phy;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -272,15 +273,23 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 	disable_irq_nosync(irq);
 }
 
-static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 	} else {
 		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
@@ -289,8 +298,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
@@ -303,12 +314,20 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
 	 */
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else {
 		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
 					    IRQ_TYPE_EDGE_RISING);
@@ -324,7 +343,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +351,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -683,6 +702,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	qcom->has_eusb2_phy = device_property_read_bool(dev, "qcom,has-eusb2-phy");
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

-- 
2.34.1

