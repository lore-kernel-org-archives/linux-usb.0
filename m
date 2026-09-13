Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCEE3F1ADA
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310461; cv=none; b=WLzR3hWfMvoTbbRl/ZFG2yq6QuCjmL+Yz/jTSRIHI7wCgD9OjsPg0l//rE4HpEs2ujkkUUt2ixRWBxsZOxkAkRyJG5Kl5jxomvNtnCsqHizA2g2nNEB4ZooGvsB9KCbZv48gcwqf/U5XCb8lLfu0db57wAOHYO9OpQpkmh0VdMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310461; c=relaxed/simple;
	bh=Gxqy/sab41dTygvKiRjyoOb28YWcdxxuwKAM8sQA/MI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oFX1YgoiKlo06Lfa06EJczwDzDPMxeFQ+lCO+WxorDC4mVqpqKwmM+MpT9XIyDVfnxgJ0m+cIVvLnvTqCnnZXrlMbOtf0IHd9A657g4LV3AUAhUiBOw/v2R+MSjlY+/6CAU30oOD74ZXYSXNElvPyC2Lmysw/rNAqTLYD1Kg1lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/CGxtCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9mPp7Pp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/CGxtCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9mPp7Pp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE026Z1200336
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cc7emweiprHjSxKjbMHJ2a
	c8qRlQv/5NgZ1mLvSzUGk=; b=B/CGxtCE9C8+1EdSpRQxz8a/a4lo2ywSzRL9jy
	yA4F6RFLzg5JY/bGYTiGkIx9z3Hqc6RuV+fyDE0ObTTODRsO0ZEdha/5kD8kJGY5
	Xkfxh77fSW3zBrIAqDiORRDOAm2VNy/zys6fXFsAj9BS7NBkG60m4VedBZBKAIMg
	2EpXV8vegxUJc7bkOdF9tckPomIZWz771ekYkBBfCJdw12oty82X3bLzdihvquG8
	tli2NaX6sIIYiGnb66ox5hAtNrnOffw/0JmXHMTvFtB0DUT6+6tuUvQi1KILxAYG
	idcfwtASxxl7O4chalQuVsBnIFZRSvC2eirZcm11rCog2XHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018kc2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:40:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso3778395a91.0
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310458; x=1789915258; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cc7emweiprHjSxKjbMHJ2ac8qRlQv/5NgZ1mLvSzUGk=;
        b=e9mPp7PpRr4p73BLNNH5O7/SUIetmSV1t66mfzl2zDyFIJLuM7B8pdB/3yR41kgW2p
         ezQCqbrOXqMFwylKJfEFiabBPXfa3LXiJ3mfUpgNcYw/CXsGT5qgI54d995Rax4EHiz4
         7sx7bpfzyYp4MIucE5RbaOFZc3l63Qrx0Pl0yxEJjJBJC+sUjkFAGJeK7mQYMe3IrAgJ
         Jg/gGMc0DjQ2aDgc7r4GdkXYFrTmtTSNKzqGPxwRpTe8q1CG/xuf7PLW/mZNXFeY3aqo
         mbkJ9KOhKV8Abr9anwIcgQlOXkmvctJ6S4qUE3JQnOLE8nFd2bwSfG0vN6nLRMor23Hl
         BWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310458; x=1789915258;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cc7emweiprHjSxKjbMHJ2ac8qRlQv/5NgZ1mLvSzUGk=;
        b=S+Ew0ZOpYpQUKT7DpMdMhsZbPEMQNosaGeP95TO+nTHRI0G5SaktLgPXWHiCsYqngI
         OAMX188Jky8+VC6xHJlCQlWR1DK9zIffEXzjb6ypeg4rDrRo0nc3y9pdIXlAi5Fn/NNa
         LR/7ACAoSJgXvzN/b9S4mJ+dLG1Z2YYDMscz9jpIcJs6zEoVfXsMGcBlqOzZeo5XT57d
         YNYOQ9RIvpiusE5E5pm7WHWlnnyyarFgIB/ja3Z9QhpYw3pQSG8CtaGJC5NgSpLzatwo
         oVAEjpKp7TNg++gkOr6qmTkrMv4V7iWguoRLV2a+gm/DNTfSSss28CS0f17PQLQNVbrV
         KhCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI6vdeXV5uhDstx4aE2FWQp1NIh5ay+mDO/ghVVRZZIfAMdxZoXflDMm7Q+R1xLkArhf8usKQM7Mo=@vger.kernel.org
X-Gm-Message-State: AFuF++n1T/8errsJMbUwkEQsUTAO+sYXfP99SrgywxJS1XWGp/BqZvu7
	m9uXAE8KsjOg92ndaFfPxG1k604gWv7jLJZDaaAMjw3GQlbQS1S9F+pNFpC6xuWc6clZgMj37yW
	leLAAbnPleaWc43YyD7B8Dm4oWO1xoEjgpqncp66LRACjN861e0vFK0/VSzwpW3Q=
X-Gm-Gg: AYBFou2HBqRzUUq17Ef8vLcbzIgDPs9MgEP2zDWfUm60Nii4KCOsIiuN+FKqAjBEUCz
	fpQRnE4wNlOLxGf10LVedrX2Py7IQAcVprBkBfKY7Dgz+87fz3ZhAHgHj8IG1UTow2z2WSbL6mY
	MirLJmXD00cBj2F5XKoBeTjiNFdrtSk9ZJbTdVEt63T1HCKQzUVjTVYQ6/Ta5MWI41O7ZMp8sd2
	VAzKZ3EU4rJX3hcYGOXm44py8l4DfzSNsOrWwBNoMs/U1I3Vcymt+uR3bEVOxSc57lz+Zm/PSWz
	PQT9h6216v7q0rEA1HxgZ2IXBsMttrMYXTGPrZw5eaLOGxI5Jj8ADvjpwm3q2uvUU2qtl5NsA6p
	zoGCmN35vIhGjSzahgLETRdeDLSzaK5avhRa83Wg5sWlsNrH5xEJMvii1nUWeCFtnzYBUxg==
X-Received: by 2002:a17:90b:1c02:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39dd54df000mr3332336a91.11.1789310457967;
        Sun, 13 Sep 2026 07:40:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1c02:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39dd54df000mr3332283a91.11.1789310457446;
        Sun, 13 Sep 2026 07:40:57 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:40:56 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v8 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Sun, 13 Sep 2026 20:10:43 +0530
Message-Id: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOy1pmoC/yXMQQrCMBBG4auUWTuQpiKNVxEXTfqr4yKWmaQIp
 Xc36vJbvLeRQQVG524jxSomr9wwHjpKjynfwTI3k3f+5EI/MKpFz5ILVOtSeB0ZaXAh9HOcjqA
 WLoqbvH/Ty/Vvq/GJVL4n2vcPg1KtK3YAAAA=
X-Change-ID: 20260913-eusb2-interrupt-v8-ec30991dba4e
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=3453;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Gxqy/sab41dTygvKiRjyoOb28YWcdxxuwKAM8sQA/MI=;
 b=p/ho+MceyjOjapmZ7Nd3A63hZqDqbWufLLpqteA7hiGOffZ5U8fYrhaQL7G9wx7Qs8B7bUY+c
 NNwuXTv+/AeAjllma7Hx9W6ETKLP/miPVMsNyRLla+PeL9PJAPa1QeE
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa6b5fa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7T7YwCvgW8qH-pAI4vUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX21MMWT9Ymtg5
 59yAsOAv/PxbVlA6f1UwDdiuYH56lPiSNkXujJ51aZQrc8Gm3Bm6vorRZy+8ANceLrQsA6VGC/Z
 yE4H2f/r1LerVhtPq3vSNTjtODVmbOo=
X-Proofpoint-GUID: qFhFdTP1F32IF7Yxj0FjXTTPV4blCwek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXzVOdTELyTVWU
 TmZBztFoa/d+Lz2QiDYAaQTNq/D3PEoKo6/9J/pXQK0unYPz9VtoEvyqFKEdxBrR4QJlAcv/Sz/
 XwrGTCgnlhM/Ug05c+JXhYE8fI7+il9HJcvmTYTdhWjNr0UJwjboGGb3i9DOQ3nRvpuxDEc+K7c
 1qtE2oMcn+ebgGKG/XdAMlphmmOHe/C8b/mH/q24G+3y4l6CA9jLC791TR3UwObEPM6LWOZcy/o
 XGo8iMt1fcee1EBWn7tYHIMIMvXikCllCirv4fTE2u7rdFndwnSGNzj6imeAgEeX95Qep3mAi4B
 IH/ihKhqY8hP1xr/UastDWg/N5pNdVzO/dgwKM3b/8SagH74qyRJCMLoV/pl2EiruH7Ks9+dG4I
 /iXqG8pkdWE1LroDdmd/nwvhoDtHmLpXXPCKnWFfQ6Zoa3cZ5HH2WpCS5Eh3eetrVEhmVZ4gZxo
 veJil94CX3Mn2NnYJ7A==
X-Proofpoint-ORIG-GUID: qFhFdTP1F32IF7Yxj0FjXTTPV4blCwek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
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
eD- line states, configure the wakeup interrupts accordingly

Add support for a new phy "type" attribute to be set by eusb2 phy drivers
and be read by consumers (in this case usb controller) and act accordingly

Changes pushed on top of usb-next branch. And v8 is only compile tested.

Changes in v8:
Rebase on top of latest usb-next

Link to v7:
https://lore.kernel.org/all/20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com/

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
base-commit: ed2050bc671b44b2c948dbd4347cc534d44ccc9f
change-id: 20260913-eusb2-interrupt-v8-ec30991dba4e

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

