Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA604BB5A8
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622186; cv=none; b=QEIVxcEnociRVl62Nzcxxsvnf7OyxqoM7HfqvCxpSeChg7zOoGejlAa9G/a505ILiYnppWC96cR8huUnAD4ZdV7gzkLEdam1ahZNRAzIZB0knw80NCpaqMBuAyvwwYa5k28KAvXIWPHhR3xWu9HQLjut+H46iJVm0avUPnAyb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622186; c=relaxed/simple;
	bh=0vlezWZK4fA+Na166NVdgqHlRZAT3nhTjycS7km+CQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jL6V62pPZ1oXot5/21QPYFpaoxvOnjWqKaWmL09I0eRq9vm9gTYo5fq9S2QSxnLyPgWE2dbdXS+6STLSue7ojZHs+qm4Wo9mhIqiV+3ZS0EXbFM7bMPLHmR8BaS7QQSmzmgc6JPYyu/scY1q/nPAouiHKkDzkp4bluF/jJNy38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0i9/Zc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uq106sup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0i9/Zc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uq106sup"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685EhLHT2542417
	for <linux-usb@vger.kernel.org>; Sat, 5 Sep 2026 15:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1DYK2Eht48WiBu7IzlXKngOjp19WSTBRUJqw/HlGt0=; b=D0i9/Zc3VKRn5zg7
	tSHp3YUm8ykn6xaGVmpo2XbstGF8w/Dhj5PyeoT0XESIc5CglJ569q1UlTii14Tg
	Ake2PbFU2G/5uBPI4rjenWlGexBWvIK/cre5jH9jIpAloR9hRq/Cav1md85ow8Ky
	ABum3tHylsSXycP/5Vyw7nPAR0CkXRu9l3jNmoYWbPbLcklEcgx9tELoU2hNW9nl
	S60ndYsOjepGcIycvb1I8UBcYXOwCtq3R90RpCogLJ0dAvu+79280kVNCVX4gbVx
	1lH+wL+i0e3T6KvuCd0Ls1NeGCDLLq18U5dywJBNmu5OioZW9Kq68DpclEsCN4eF
	MiOFyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhhgb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 15:29:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso3336481a91.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622182; x=1789226982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1DYK2Eht48WiBu7IzlXKngOjp19WSTBRUJqw/HlGt0=;
        b=Uq106supuX208g4Qu96sMQ7s7VDF8e5zTG2Em6FeDnxc7M0G5ZgmUtZ5wGT5iuEXOq
         E7al/O1bbkhTSpZWBtUBL6R3ROq03+57HxqeOCwoudSvtEqaVxzmr7jmCxX5zEGh3Z4i
         gHoPntkX/z0zHAQ70cXpN1gNAfO21cCqOyaOentmstHgQcE+79j834vrQtP0cLoT0SPN
         MQWQa9W+NpFmFXjqe1dy8L/Gsa/Ha5kD6+ZgKqALnWyKeZWhQAtQ6pIEDLVT+S/iqnph
         egfdLofkauhkVB1H/+xaZdxRTqMw/iYDMFNc/9Yam1qLft3CHl1pLEXmXwuD1aQm5tQB
         OZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622182; x=1789226982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1DYK2Eht48WiBu7IzlXKngOjp19WSTBRUJqw/HlGt0=;
        b=bENAhPFB921h0szDWWWBGgMlhuTn6JtpcfFhLUhaHVDqJ+hieMuuhKxzV5Wj9nTkUm
         HpfBKOr0d4fn/RHYFAIGV5gqhdJwdq+lvdV04MSuz7AdtzmVGyamEYLZ3yrZrWgMCZvA
         atPBBOpkW9Dz+ZPnquuofw+1Gi98XQlJndkVN9O0DMLKSVnlml0n0WW7IDYYACl3rW28
         qOPAr+75eOMkgU7gGc8btODYBL68LXmdTX9bGqIyhGPaukgh6XZ2/UmqAM0Y4HJGV7kF
         Su4EmzGf6TcOB+LvoipHqvQEZIfiHNJTwk9nc0wUTGbzq3W6t5Yl6Kzwp1ZYvX1kQizK
         2FWg==
X-Forwarded-Encrypted: i=1; AKwUvByper392J608/mnOggjloKmdCIuBSyB3j50rKPQ+7xrlAn6eunXxiHztMKNVO0gkC9kLDtn4i61HYs=@vger.kernel.org
X-Gm-Message-State: AFuF++mzd2tabntGbCjGxKPqiNz1oxKmSjdqkIjwbUvq6VmVUFsivoSn
	OY+O7uzBPS3l0teuKhp0Tr/YpbqfNKo2VPqUM8aCPpQYcotsjx4ae2Fc0lWqKfQXl0DL++pZnAj
	ujxKW22B/dEJbeqo4EDSAThMVDb3RSJrf0DdJVQd+DHMu1jVnNhhL2EE+npKDO0Y=
X-Gm-Gg: AYBFou2yFvhlWbnWodCWGXAgw8XdVkUSoPplAFsLIg/fCGBbtHFT3pqfCeL51+UWCTx
	Bt8z299mITJuLQJWqwSeAGQxgPkwPcysmb9UHdlYACJW+qysGT/P3ItcKUskhUbbfP1huxhMvqW
	88WOnETB8OKx6TBYICTFuC7SSm/Bno/JDGjjxTVeeBDbg37xXBrrgS5q3GaI+cCjIzTXc4Tw3uc
	N/Rt9HXtWkM2365U1a27sNwjGOZWwJEVg9hCeiGKj+r4ZAjcuX6loMtrM5wlbQZzFGfIiTYcMZY
	IlgkCpOk8nvbJslt9iSvuR39Po+hJwFP9nW4BQo8Uubtsl+mLqeSpcNENaWiCHlk6ACxcVoxU8F
	SlvKk6GPFm//LIZm6jAzKc1Y4XNNo8slk5HFnHajFijRw7nEll0H67QcH64VzJRRe64/6hA==
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr22010633a91.24.1788622182138;
        Sat, 05 Sep 2026 08:29:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr22010587a91.24.1788622181565;
        Sat, 05 Sep 2026 08:29:41 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:40 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:09 +0530
Subject: [PATCH v7 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=6273;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=0vlezWZK4fA+Na166NVdgqHlRZAT3nhTjycS7km+CQc=;
 b=fqAYeayRuF80MQHmjWGW+p52Hhfe0N8b2XCwhMvq5pKCiatZ8e5jgunbPWytfIT0k+gB6d1gi
 bAgj4qvkvF0DWRCds99/v2AFIEAG/P3q0GAWHMD7oDU0kzoqjHoVrhR
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: ODIYwmoVctXwkvmMnAswwYmKbVPAjFS9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfXzVxlQl5+31u8
 A7Zb6gqaI+fdTmkbv+9LZQ/M/4Qwo0a+afa0Y1yhzlAnRWHIPVDhYFRgFnEGfQQmp/7c6jcwdLB
 Nvu1ko5GmGS3BXI1xJZ+rLUPPQNzJ2Mh4fhcF8VYVa3pUkAza+0LuvRzgqriIUDUnKsKTnX94b+
 Tl6rQXl7NgzgdpeBdHI2rP9MKnjJB35E4BQV8teI+/LS9UsDm7jKgHY9DXM63TggAMS2m55WQZj
 uo5ycI5rHQ+K5YNTRmI35e6OMbMK4HAUtjbvUi11nSGx+CshFWKRqg64EisBfih2ET8LhjQ1d9L
 K1jMuoa9XU2PckJM9ZyB0vLFSK8OVg53kgcaL6+c7l/euvDzt5mK/WLPer3pIglqH7GX84ooDMD
 zCUZopv4T83wbyQFffdrLDYG3NvS36fm7dkvhn3LYzUuc174aoOKqCRB8WojNgoMTj//RxQECXD
 /hPbIkNRrDs0W9bBBrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX+lXfnGErpSCN
 GtcA6a61pgZ9X0YAFuqoU+7EtJe6DLBcyIDi5b97e+VOEBUGbRJgrHBh4NXtAPwNzZlFXWiKbqr
 pm35A5yzFFhzlvQ3/3R8PIs2SKsjtVE=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9c3567 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=Sf5RIT6NobiIG8tfIdUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ODIYwmoVctXwkvmMnAswwYmKbVPAjFS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

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
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 63 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ba26e61df915..2d1e66ff72ed 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -86,6 +86,7 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			has_eusb2_phy;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -273,15 +274,23 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
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
@@ -290,26 +299,38 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
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
@@ -325,7 +346,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -333,7 +354,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -628,6 +649,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
+	struct phy		*phy;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -698,6 +720,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_disable;
 
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

