Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE05028B4FD
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322563; cv=none; b=FDoP4hOCXFoWdFf7EeHc4SCFdAFffPiqZAnZ3qrhtGeP9LNGIVp95Y5tVfPTFQjbClPfhWT2nkg/9c7Aoys8dcINpBtUs5WHnR1Y6YnAvBQMmokX0bBbBPp2a/lchSs5cqj7dr5EKOAVyUw0YBoTiVzt/zH3WtyR1k/0KNGpaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322563; c=relaxed/simple;
	bh=o6cPBYqmfAyO1nQGAWMNIPJr4TcWhPmZALAkvjJ3MlU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UsXXRXCWMrGG3DTuw5CWbGB0I+UMxE6ULojx3OLKe6lhQ7RAXt/J5VYYnBEg6ZDXdYdP7exAshV4qW8VqhpA50WgWlHUvqq5nWnhDWB0ajDTNCm1H+lNfeAr3YustWLEkLUfc5tZSLmiM4GQYvrY1Ux8yRNl9yaMndEncDyZ07k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmgaXIdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2syNZ/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmgaXIdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2syNZ/E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L77Ok141100
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CBXJXiur59WDEq3KDTN4bT
	zmvgmx2u4KL8wGFuM4+gA=; b=mmgaXIdtJ41XC7aMaYA/AbnaIomqCe27sfXYlk
	6yKMSbEwewZiLwCPHEQ5S3bG57zuX2MJqGazMbsSAgUcgfzCOAqzDS1o6keXdF/S
	YtGUuBtgB2/K9IrL6kUm7/lLe3Xdb2KQunt/C5gl3pypUHaO4MyYYKA+TF2jvc5F
	zqaaup6kQDbT72eMDdw43bDnW7RYmybOGsZ+AfTPNLjm2NR7y96wW8h057bLDSDx
	kigcpXW5KzyFQpZsAiMlHeHqwV3OK5TE8PVPq7gsw368xIMm2FhXRQNh05TlSi9F
	47mUr86tSATe7h3X3IUvdZeT4JcgQt3wb/tZwx6S0g3kdGmQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqkwyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:42:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904ee4473a8so11039766d6.2
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 17:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322560; x=1786927360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CBXJXiur59WDEq3KDTN4bTzmvgmx2u4KL8wGFuM4+gA=;
        b=H2syNZ/ErAdhACtsh5k5YDy/9KucWu/6fTvijTDKpMvmxiScAq3unljdtzWHTVtABE
         mmLpVkJrfURqPFzcCuL93vd+O153VTLoCgC+Gf0zC9NoOywynWVmf4AnvwDrnrMI7oe0
         wm2gmvAc3meQoN7+q4FqJ0IE+fAp0lcwpZJ5KIq4twctzV2kOcuMscsIe48f37wbrOZJ
         2Gig/0RVB5fCeQ/GWQxWhvKg69Hg9iJsF9LN8bR9lMhHkLbaJ5Smgi+HsASUbk+R8Zyf
         D5xxoIB6T3R1c7HUHRIPrZEi6Zx2Ir/2/rFadjRd5wALEeS5OM8nucPeZpfPOsFZoHH7
         ungA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322560; x=1786927360;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CBXJXiur59WDEq3KDTN4bTzmvgmx2u4KL8wGFuM4+gA=;
        b=qlSGNCc9KnyzAN/2he0JHBhjy4AQyBmi0OMKc0ciDJ1vxW3SYX2ilJM/992/MweK5G
         y29qffv3q59d3xV9yntpEXrKUMAePyX1RhLOAvMlhAMBnRgGTMG8k7qg2aaA8Lh+fHLf
         6sNTe+aymv8DUgApCopDWuewpLsAseKwh0tJvxQzkwndkMTPGMGCppo5jY7qIZoPH4n2
         rIVwMt9cegC+rLB/1uxTGbK7Bvwzr3WUtzdb69ab7YQKk4hcQUoTRIAuKo1zxJY0ynnk
         9r1G8TbEdJ6Umpkz0ZSP8GyBpwAoVCfHZlQ/nLIA+FPZKNHURm1RJFpSc4rxY987imGP
         a8AQ==
X-Gm-Message-State: AOJu0YxWuOwGtItTaQHVZshV5Wn8z1vqow9VAnX7tS2DCXUVBbIRtMD2
	5JxC4a6/tAqjxK4MHXirS5td6llpw3DXKrbiSUm+GCaFkm+brD2Zh+KsLBgfiU2bhrSCeBBC2pO
	mmNXT+0kL8HVBNMlTtv+g1iGcd94t5fwG00V7Oaoj0TmMTnega5fyELygZJcBjRU=
X-Gm-Gg: AR+sD11YuX0ToZ0grG2gDHKGKr9HV9OGps59iA8JmrcUBj9FgTVUG2vhawHzmaxGLkp
	8THhUvj2nhPQohOG1Mt5TRGlAz4P3PbM+N4mI1gp348cn6nSNkGwBsMdugti6wZ+T+gXjnc+5Tx
	gOsW858ocjPcrSvjj28BALxqAwognc2psiBOH4KvS5vJBU5aHN5QAWTIQqnrOyZ4MDcVHmnHx6K
	pqnHwLeK4aLJZqbXL0VZe52CqktF6A6AvOYnfh6ts3Tt5bJmIc5r2LXghGBgslrgaU2M39TUEvu
	YZ7uKHv0in5p+OPlAs/9kx/UmpW/Hg2jTJX4ZhgMR+SdWqDuyTVJZxlvAivw5blDM50puTS/8bK
	3tKftoBvS8r9zCyzPNw+vr1XbYYSbe2famCnvgfWTdGATGjRGLBdvVlBTFrd7xKaU5yxxTJ2iM/
	w23C3cjyjd8AWuNQ==
X-Received: by 2002:a0c:e085:0:10b0:908:92e3:a37 with SMTP id 6a1803df08f44-90892e30cf4mr269774126d6.32.1786322559944;
        Sun, 09 Aug 2026 17:42:39 -0700 (PDT)
X-Received: by 2002:a0c:e085:0:10b0:908:92e3:a37 with SMTP id 6a1803df08f44-90892e30cf4mr269773806d6.32.1786322559489;
        Sun, 09 Aug 2026 17:42:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:42:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] usb: misc: onboard_usb_dev: support several devices
Date: Mon, 10 Aug 2026 03:42:31 +0300
Message-Id: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHgeeWoC/yXMQQ7CIBBA0as0s3YSirUFr9K4KDDqmBQMU4xJw
 91FXb7F/zsIZSaBc7dDphcLp9jQHzrw9yXeCDk0g1Z6VKZXuMpq7DRgii4tOWARh9YEbY/jcNK
 TglY+M135/bvOl7+luAf57buCWj8jgLYudwAAAA==
X-Change-ID: 20260810-msm8974-onboard-usb-98d293645270
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=o6cPBYqmfAyO1nQGAWMNIPJr4TcWhPmZALAkvjJ3MlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeR57p3nX3GNlwd4psv2SF8WQY7zDH9y78rSrG
 fYWhIxEBvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCankeewAKCRCLPIo+Aiko
 1Rv+B/90wT6Opjrub33+F91zcqq/z8CixmOXkPF1PDDjor/QPtKVuLw+6EDdY/E+iVPDkcy1f0J
 A/kqNXhZvyEH+zP8JEL7EtJtb8qCmkpf1vY7ZQTXcK4ZjJisJB1s9+HdBolo0vUIYgcX2B6Lmii
 8RJDZZ9AQL8Eh3J+6UccbrsfNrGNUMtqtpGH42NjR20JcLXJbI9qOiq+0GXXKKxBwUn7Qj/a+5M
 Qv4GeCK8sao1tHJqrrQxiTTKFODQVAMe2IXE8x21o8DanZXQ2BeGoI/LkyZ9bGvYO4jMbguTNF6
 K7lPO+rZaz3kLTjAwFX34/3eDE9gvFhi4i1GSoWi5kjhUWrC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX5lV3m701dGz6
 UC0CinCAyIguElmXMbv+scJO9QE8rBf7kuUhT4G+PclPgUpXiyFOEhAjCI+O5DHt+zABLIV1Hc0
 ky9mi5aeIvFUo/oxUTy/OYGsjIp4hxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX81emw1BHySlU
 1Wr2ss632BgFDAQfp7xumOBT3l12fZ9BY9UxYxww2RDZQzgq/0MFZjAoNRxbL5j8kESpS0b9Zp3
 vInOf9k9/dCIk0u4QJMQIfdpgSMezO5oEz1rfSKzyGCplg3LPnU1xi3gpO0K1vhO0f1+R/17hgM
 8XfArs3dRXXZN1+jT5OUFNRxXUyXQuzPMrwwXrhdYf2IpQo/zQJRgBO7SpgWCJHx6h5R0LPMxKq
 eJm+neiMNeY1RgBc3AGAdrlS7tFqa9AjNXKV3tFxQmUA8xdp0bAmWK2L7rwcesyhfvXGNGauMJv
 31gnf9M6U8CkEMqWf8QmS/X90F4cvJcVWt23qyjytyVsAyIR+Stfz0kuc5od25EB2q/x7YDU8pR
 UwA/bnAZIu3lQCqJ7CcH+6qFI33ACy5AXxDwzWce+B+eoeWUEPe1TELpxkqOouBBJTp7e0fRg7V
 ofUVvGHQOLtNd8PhYpA==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a791e81 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EXsK5QSkjY9s1esHV-QA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lLcPNrBDxQpBeWtNtgWbm8cSFe7HZCPc
X-Proofpoint-GUID: lLcPNrBDxQpBeWtNtgWbm8cSFe7HZCPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100003

Describe and add support for several USB devices present on the Qualcomm
APQ8074 DragonBoard device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      dt-bindings: usb: ti,usb8041: document the TUSB8040A hub
      dt-bindings: net: asix,ax88178: document the AX88179
      dt-bindings: usb: document the Prolific PL2775 USB-SATA bridge
      dt-bindings: usb: microchip,usb2514: document the USB4604 hub
      usb: misc: onboard_usb_dev: add support for the TI TUSB8040A hub
      usb: misc: onboard_usb_dev: add support for the ASIX AX88179
      usb: misc: onboard_usb_dev: add support for the Prolific PL2775
      usb: misc: onboard_usb_dev: add support for the SMSC USB4604

 .../devicetree/bindings/net/asix,ax88178.yaml      | 10 ++++-
 .../devicetree/bindings/usb/microchip,usb2514.yaml |  1 +
 .../devicetree/bindings/usb/prolific,pl2775.yaml   | 51 ++++++++++++++++++++++
 .../devicetree/bindings/usb/ti,usb8041.yaml        |  6 ++-
 drivers/usb/misc/onboard_usb_dev.c                 |  9 ++++
 drivers/usb/misc/onboard_usb_dev.h                 | 28 ++++++++++++
 6 files changed, 103 insertions(+), 2 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-msm8974-onboard-usb-98d293645270

Best regards,
--  
With best wishes
Dmitry

