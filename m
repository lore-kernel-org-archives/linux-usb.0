Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CCA4A1E13
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622160; cv=none; b=uI1X6sdn4jw9Fb7EvWUzEwnHesyyNqXhuIEYuYH4FDzX980Jl/rGAKPQy8OSs7ExMLF1EKv7LkFAUpjAq9T1fuyxI9nYq0szsEl5Yie6Lny0FBeC8d1LSEZ78DVHQOamQ0XDDe/gsqllIaY1AdVdrwmwYAXHsKpdTk9KJM5wHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622160; c=relaxed/simple;
	bh=S6XBJpEz5Dek815jzmE0b9XkrXDLKdAJjoolsM8gc9o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ykn7qNOiXr+LmWW+hYZ+ULOTem2ITagtJjKkP7El/Gaa4gCMfCTq6ZpVvB06ijlTiIQzjuDH/dcPoX8cW9ftmotf0dogPVtUPzW1x5vH/H/XwcMchpW+KBGb0vqAnSilbKoMr4UBeu+DFOoNc/ToXUITo4kBhmZuuZ12Fxfru30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxP5jvUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gn+kIKDB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxP5jvUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gn+kIKDB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685EgZ1q2540141
	for <linux-usb@vger.kernel.org>; Sat, 5 Sep 2026 15:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1J5mbzKQXdFCMf3jwBjnv/
	NJRWMI84WrAPPqfVmtmcw=; b=LxP5jvUx2lKO/eOcO1/amnatFkIbZ6u9R5XRuV
	zabkJz515FblvKsvfODp8AHwH6L21GuSYhnl7dHBbRDMFEH82hiFs2/0poDhObl9
	22ODcFy1Pmeua3qym7an/qDSEJ3uKzSWkKFu6k8hYCB8qCLhpMphQo41ItIgfKqK
	0PDXMdn3XI7/zRh0W2pvMTUjdgh//gcnoNp/VF8nKJ44BFT7OtHHuQ9hYLICHyzO
	RHz0+kRVSVXfVA9ehghnsv+kuUgEhy1TxZlFLK9BHS+4lKFjiMjHNZeyNdNkkBHx
	4XdJhiiKLdIyNAmLkvJVfjHBa1qhcOJpqIBkPWLBkAgsgzZA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhhg9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 15:29:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8623e5d4279so2412702b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622155; x=1789226955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1J5mbzKQXdFCMf3jwBjnv/NJRWMI84WrAPPqfVmtmcw=;
        b=Gn+kIKDBkJyLmuSgXmuKhdBH65eqf8c1iWnpTGKfxITVebt5uiUTryv0rZfRVIz8PP
         yfpjnj04zwxAJ38at99aun8r0RmIxKlriymJxTulvMGHl4qZ5YDjt8/ekH0vPXLcq5OY
         pw0UQ1/RKWVJXCaCu3MqenWoEMSNKjd4/ioxS/uyC/mTdHjncdFblGZfCOwHjMqTw5LJ
         XiewLzDaZLDx3j/txB4wryPx6q7o8OHw0ZZcNXlMJ9kHLXwbUEz5b5CkxyRfDkaBUWbm
         4mlcNXiXVJQk0OezhMAmQ0LbmVN4EKrCil61D3wzBhJGrrSYH+ltAQe1RwznolD1JE04
         JYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622155; x=1789226955;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1J5mbzKQXdFCMf3jwBjnv/NJRWMI84WrAPPqfVmtmcw=;
        b=ZtkUPr0n2akiNFW/B14CmdsqFwM0LG24OzAleEvHO8ar3lrMPNSBFEXJL6RpYD+m8L
         AozrbMO+vS0d28rXV1SEEWm2KtUvuswzJ09fnkPDZdGz3jwfv9SwxLL+iUpf/OMlPgCz
         9y6E3egcE4NtS2UgeUGEbxyDYUvLlrn0vmXp0RXIMtnRr7A0WYZ2fIeUsvfBByGaQUNn
         B6wISDRmepoZA6fkQzvAN9QcWsh5yD5fXR5ZmFzv7aIxKZKXpMvERmIw7hvNtGzKgV9o
         PqgrgccY4ahYOyL9ysiZNuOeQONDU9eruadKFtmWzt7wuRtjN59M/KZ/qfXMxiRofX5z
         Augw==
X-Forwarded-Encrypted: i=1; AKwUvBxAqpqGsn9bawnEhQ3R8MV90vqx7YlQDvLq66BXqXEOQFdYOMMBF1omyUPj7edhJdgKW3MEpSS6fzA=@vger.kernel.org
X-Gm-Message-State: AFuF++n61qLRSwI6DXF2mdr5/YyqXlzCGU8ciaJDIHnNA4Hiwc/AX6yC
	WdvqGqAlCLruD25sKsmrRnO1xd8QBXMfcfMo4IMrIiAjYuD14QtU91l1oGQn2ULamwvsYtA0VYw
	QbkcksJYJiAURXiF/nQpFq66Czjs0bsCY7+MyQmdsdfCyB9VE6s0CsfVCJALMM5Y=
X-Gm-Gg: AYBFou0Lu8aRxnAAd6A7fIdkMGHb64y/QmUz880DhtlCBGywDs9hy1zpj8XClxjndWp
	AixCvZ+SnS3cvJI2JAWEfDdbJVxKGhtser60BQJCBc8Bxgy/n66mRRDyAM42E32eyqkHoD/MALB
	CCG1vQCnnZF3iPSsqYp/vE6Z8Io3LI9x82TF31e0EdQIwCOdt1tl0hLuZI/AB2sdIpIgh0LD/xu
	GFNOpFY/0mlAf3IxSMExSUez73pLOXBq9BJbTulR2QsSqhcGBrYH/HLl5vL9sREzGrHRd2LqzsY
	OSZgp05XaLjMvjyqRJB0Snv5uMGzy0OKvqk1iBt2o172Sbej1iK4B40MFKd8bnAj798k3TYwfae
	btpbIblGwvqtg7BeTQsd0QRrwT4VujIRFCHSJx/n9SLhPXzWflrzq8k1ywDdGqcbOBCB/4Q==
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr22462826637.7.1788622155341;
        Sat, 05 Sep 2026 08:29:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr22462764637.7.1788622154950;
        Sat, 05 Sep 2026 08:29:14 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:14 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Sat, 05 Sep 2026 20:59:04 +0530
Message-Id: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEE1nGoC/yXMMQ7CMAxA0atUnrEUTCGBq1QMJDVghlDZSYVU9
 e4NML7h/wWMVdjg0i2gPIvJOzf4XQfpecsPRhmbgRyd3NkdkatFQsmFVetUcPZIlMIY9ocQfQ8
 tnJTv8vlNh+vfVuOLU/meYF038Eu/vXYAAAA=
X-Change-ID: 20260905-eusb2-interrupt-v7-22c8d8138b74
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=3296;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=S6XBJpEz5Dek815jzmE0b9XkrXDLKdAJjoolsM8gc9o=;
 b=8BWq9KCEu1Xr+PEyUZ9vWUy23HYTgxcbm+CJXK14EYPeucN7Aj/6bD/42c4UKRxSERI8X1aKh
 6/B3WjwWnZHC7BRkzspkFzGOdKecsDCXY2lhE7zTbAzc7CGtCZrYW83
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 9JgRd-QozGRKPP3PH7U614Lt-hzLQtWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX63LwTjOtUy2t
 fXHziPRY/dJn00a4Fl66tPTfyLFZrGWWPy/PRvVRuhD79WJegIEZrhSK5x5LSCmccH60412XmXY
 Of9UMagfP+dTckTRzUUmOdYPwOiBtS5txeOPJ07FFreVM8mAbIKGowN6ymFBhSUmoC+ljQfKfB8
 3qImquIAnhfF1E5AANPYc+jtAcFtrCqwkHoo0UimSBknVOexkxk14bJfDmH0su84cmqAVvYTvxR
 SnmzaHU44ujUsdug6ws5VUkvn3h55X9Y8RS4gXruR/6t+YnNfeN2fK4JUtqwkGcFuFYc/kSq59u
 8SsOqdmVZuyHdKGxluToALc8Aljn1fTej/5nGI6sOt/Oyg4yTgSxWW8ouM1N6tn8eZjiakF1U0H
 zxsuwyQNcrdni0enOeXQh/dnfX795iOuUSWEqZblAAmQvQBul4/HPH5vWHe1x35sp/CZssBMo5L
 xED3Qku2Lk+D9CxNKag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX/AAGeMgvegCu
 M5HmyvWA4S8Asa8wnsWRmxVs8GlSG9m2abTQjpoIjLv5dzKGIpW9I0vqq0LbRj5EUMbH1WPcQZP
 j7picKSLjSfZCVJtBQCprt17wQ1xHr4=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9c354c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7T7YwCvgW8qH-pAI4vUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 9JgRd-QozGRKPP3PH7U614Lt-hzLQtWf
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
eD- line states, configure the wakeup interrupts accordingly

Add support for a new phy "type" attribute to be set by eusb2 phy drivers
and be read by consumers (in this case usb controller) and act accordingly

Changes pushed on top of usb-testing branch. And v7 is only compile tested.

Changes in v7:
- Removed NULL check for phy pointer.

Link to v6:
https://lore.kernel.org/all/20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com/

Changes in v6:
- Update commit messages to reflect why new EUSB2 phy type is added
- Update phy reading via index rather than by name
- Remove redundant header files in phy driver changes

Link to v5:
https://lore.kernel.org/all/20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com/

Changes in v5:
- Add support for phy "type" attribute and set it from m31 and snps eusb2
phy probes.
- Removed adding a new binding property

Link to v4:
https://lore.kernel.org/all/20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com/

Changes in v4:
- Moved to using binding approach as suggested by Thinh

Link to v3:
https://lore.kernel.org/all/20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Removed multiple glymur-dwc3-mp pdata entries
- Replaced use of ternary operators with if-else

Link to v2:
https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (5):
      dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
      include: linux: phy: Add phy attribute "type" and associated helpers
      phy: snps-eusb2: Set phy type to EUSB2
      phy: qcom: m31-eusb2: Set phy type to EUSB2
      usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

 drivers/phy/phy-snps-eusb2.c              |  2 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c |  2 +
 drivers/usb/dwc3/dwc3-qcom.c              | 63 +++++++++++++++++++++++--------
 include/dt-bindings/phy/phy.h             |  1 +
 include/linux/phy/phy.h                   | 27 +++++++++++++
 5 files changed, 80 insertions(+), 15 deletions(-)
---
base-commit: edc1518454f6439e50a9220e9a3ba09044ea8d8b
change-id: 20260905-eusb2-interrupt-v7-22c8d8138b74

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

