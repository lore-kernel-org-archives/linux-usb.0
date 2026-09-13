Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D73F1ADD
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310487; cv=none; b=J/c7Z+kj2HrSS8uhCKR4uIKQ8aNkoEXGITiLwISDCZwUbfgGYu6EHFWG++iP0jkGGZAWUyLazBs5/62tNtcHIyuNYIm1s+yW0J9TpNvOzweaOxBkm0Y/5rA7JPHZhqUAK0eXZAvrwPVGU1N5dhxvb8SZ8ndXzzAKrkqfvAW2F9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310487; c=relaxed/simple;
	bh=ZxUNAsUxlczNYSQtVpJk4jpYB7XXII4MY97qOtw6FW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9mhH0Dk0dmXaJqv+Pjwk6grXaJOKIY5P05o+pbDn2hIz0+GzE/uGnOwB30Txp3ms5TC2gtKajNzD2G0QA2hRxxJnfJKpR7BpgHjjyXf9EDDAjKz2CTVJBopX3pX5w+PikTUIKPcX9ecYe/ekVkVZN0LYiT9y+wEGlSpaENDwH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGS6pZ/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRifNu10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGS6pZ/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRifNu10"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE08Ib1952311
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYFyJ1F4SKsDsBiyEupbuIpq62nd+4MH7xdAqe/Aqkc=; b=NGS6pZ/DhxHc0z3V
	jVMxrLOMYQDK+o9rec23ltfYtrZJlknnLIj4jAR3/PpXc2z3xxDYK56a4SIsjw1A
	Wr6FP4CB2Bu/LoqIjfzTK+eXQrMam6Ll1Kuz/H+7oiB+2THI8QQSnABaF0kEa/tq
	uzi7EfmAdZ0sMg7EyIXPiiDB+PkZVB87Rs/ynqWoQDaowiOTDqPOUCNcX0JkrHeJ
	JcbBgCD0nZscs48RA13X2Le0JW24SF8H6DbuHoRGCN0V48Q639L+ru4RtWz6VhRi
	N1mLgdHUtrSw7LDrqi9AIajZliCcd069aSZdcQCIi5AhlqE9jL9pi+lYu4561H63
	3eHs+g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d3fkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso5611977a12.3
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310483; x=1789915283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYFyJ1F4SKsDsBiyEupbuIpq62nd+4MH7xdAqe/Aqkc=;
        b=GRifNu10Q9qTWfC/AVpWOtvDExQosWRhZlHvuUjBsbIaXtxHgU5DIRIpz6Es835QZl
         fZ3MHa4VmYBcB0UTEbEYRLS7TY9MRM7pGZD7OIoe/auU/E0aO35/+/zJCqHrirbaWmdT
         5goyghq7ZSuwlvICNX5943UK8gpQph/+NAtO9BEEZB+ZitUHFJBPn1QE9JXcB9OhTIL0
         P+Jkji2ReWjQfarl+2cIuqaiV2IxIXwUTBArfHRo4OQ3nlonyZrDzjEcjdODlM/pTkZN
         eesGivEcbuR+SaYt2QtfSFtXP7Pk1QsDRg+FpkDon/ByMxnJssAWRlTZN7/X7P6IIzLr
         /7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310484; x=1789915284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYFyJ1F4SKsDsBiyEupbuIpq62nd+4MH7xdAqe/Aqkc=;
        b=VW/vuecwAsA2qhdG58sRCAtyxb7mGmz1gapWJhM6I9Ub2rQWwUBESqq3+bDVZYhs75
         +6uJGMt9T3V7/d7gLCMMmQou3RLlCzpnuHzinUVXO867Bo9h4UUkXufNyeZWs9DXR8Tq
         BCX89gDVV8IyQylMtNZTJE/wbo/vG/EZcEceYhJgpTAFIgrgGco4ln6sU6OtyRNkb8wS
         RDPGZ+kFONwAfiovsam0ni2g/3OPfEuMJ21TgdRM+JJfOQWvCICoKBZdP5mHSX+HhbVL
         BJZ8VOiBw4xp+C9e/E0LMZqgav21EHbTv3ysXkAazddvIXmmQevLzd3BYL0Gho2L5Mj/
         S7+g==
X-Forwarded-Encrypted: i=1; AKwUvBzP/vRB1hxrSHTTXqLIqtTTkxjsu/xsFFGfPxYuRUneT4DWaU56gXO+WTzrUZCvoSFtZP637y8Wv4w=@vger.kernel.org
X-Gm-Message-State: AFuF++nhBJvr7bazLvOPQ2wWKUET3lw7VxI/6URFKmte8c5iH+jA/tOI
	Ic2Y4M0oHVWMnQvBaO5CdJRL/twAcDun12v5tbwgXn047s6XPingDe1xc1l0WoYuTQLC19deiml
	wsYbaMSRav78+01dsx9zbZsDnySmxRpH836l+6Q+pcO4NrIQRBCnnndjHe7DNFyI=
X-Gm-Gg: AYBFou0WXU4PH7oP8ZyncWi9WiB+bzq2s5W9C7lxG+adulDczpYnJUShvW8DgorrI1D
	DZ4veCLw1TN2rk1bEm8gjh3fSkUN9Z9b8qvyUL8Wr9sx1Yekr/q1zcHv/tB/zdUnNY8gbHs65Ij
	RqSiI6IifLkRtN1kinBVpu3UC5xqWBAlkC+TAHUyhNeCsE8WIwGu2ZmTEvGlhBexZRLHhFF+Hqi
	EiDoZQHgn+1HgHzGTJEC1w5mdybm8TTowNjVileYLja/j7q9S0BqzQzLf3rhzs7geR0LxfqRDkE
	dyhkCqcuTOyaF+NtwQSAEDAuSmfa9tcQJ6n0NJJDV0lwXLs82H8dMQHBpDFenoe1++9Vnau+UYu
	a1Qp+Q5/FyhEnufq8WL/h1VmHJdnnayNfruWV3dw+82/tOz6anSuwTX01l8Mq86lCKs0C/Q==
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr27525207637.24.1789310483549;
        Sun, 13 Sep 2026 07:41:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr27525141637.24.1789310483159;
        Sun, 13 Sep 2026 07:41:23 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:22 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:48 +0530
Subject: [PATCH v8 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-5-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=6358;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=ZxUNAsUxlczNYSQtVpJk4jpYB7XXII4MY97qOtw6FW8=;
 b=c0ptxnRcLFIuw80x/cdK3JLwkGCwrUNYbYwWIuOFuebHYUTSwpeeiXbZqx05wICe8gviolqNu
 EAKX09K78MoAZT2m75YoZKeITkyw0hW0IZXl48Uv7BKVB8WvSFzk8/K
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX7adZpnYTUG3i
 qvvr6pAgpnjYHmYnj48+1/WdligkwAh2LzMuhEH5kdRmoQHPCm7nZSjt5bqITQWSVXh3f65/nHt
 x190zIt1mvP5Qtaz+hY5kazeBNUr8CI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX/vgVo1A1pQ+B
 euCDKkpjws3UwC3MZFc5z04L8d9q2Hb5dLCROH/Q1oFbNu0t22WLePiKsU2fdi1iUVYcT5/5GyE
 MQQWFIf6uhAeeX++CqV6PYrt7pBZ2o3uUBXPmdhKgRQ6MeUEBzeIeGbpoDOdsiJ0egznIjdYjiW
 7a0bo4yN6t5T+Ha20CS5G18Fm/Afpt5CVbR47/6Y/FBr1JYnqwRnS7X/21ppBcfvGkU2vD4UdEw
 cGvN1jp+hXbVYblvt3cH0XqKhR9CiR76g3KtC8IGuvzVb8VYVI2/u4Y6J2JLV9st0j/kuaREjwO
 GxjWm2ww6AIBuC8E/1CVjspe2h4yJSSQqHmbiY+FD4mAbWzf4GoHl7l1QEqOonUY9hvgV/0uN5F
 1jgUgkz3A05xTJSHQgbcO9RgxsllEn+kLlGA1h+Z9lKeCNKcuiBF48kLC25NsAPSG/AdhmWgYCV
 eXSvYYGceMTw8h6g9qA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa6b614 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=Rua53wt-LDCXJtC3cl0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: cl0BDwdmJVJJBHIicHwFkXV9kFiH_7Pw
X-Proofpoint-GUID: cl0BDwdmJVJJBHIicHwFkXV9kFiH_7Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130210

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
eD- line states, query the phy type and configure the wakeup interrupts
accordingly.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 63 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..e6b6beb38fcb 100644
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
@@ -289,26 +298,38 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
 	 * Configure DP/DM line interrupts based on the USB2 device attached to
-	 * the root hub port. When HS/FS device is connected, configure the DP line
-	 * as falling edge to detect both disconnect and remote wakeup scenarios. When
-	 * LS device is connected, configure DM line as falling edge to detect both
-	 * disconnect and remote wakeup. When no device is connected, configure both
-	 * DP and DM lines as rising edge to detect HS/HS/LS device connect scenario.
+	 * the root hub port. For non-eUSB2 targets, when HS/FS device is connected,
+	 * configure the DP line as falling edge to detect disconnect and remote
+	 * wakeup. When LS device is connected, configure the DM line as falling edge
+	 * for the same. For eUSB2 targets, the lines are swapped and rising edge is
+	 * used: DP line for LS and DM line for HS/FS device detection. When no
+	 * device is connected, configure both DP and DM lines as rising edge to
+	 * detect HS/FS/LS device connect scenario.
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
@@ -324,7 +345,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +353,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -617,6 +638,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
+	struct phy		*phy;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -683,6 +705,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	if (IS_ERR(phy)) {
+		if (PTR_ERR(phy) != -ENODEV) {
+			ret = dev_err_probe(dev, PTR_ERR(phy),
+					    "failed to get usb2 phy\n");
+			goto clk_disable;
+		}
+		phy = NULL;
+	}
+	qcom->has_eusb2_phy = (phy_get_type(phy) == PHY_TYPE_EUSB2);
+
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

-- 
2.34.1

