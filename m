Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B102C0268
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726939; cv=none; b=prGvXYMW75bku60PE4/+3J8BLKMDtgFowA4DnLnBX2cSVx/22VCmkiHZyOqCgp+JTE3TrwcksFzUllCgNvxUayadji56oiwu5zW1ocJkdVT+vHmdyQOcJK1FGqwSSBKQ5XIVqoUShuZRpZHapzisMdeD6cBdGDTIN+OPpAkoNe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726939; c=relaxed/simple;
	bh=mRhZd4ArISJcnX2zf7KSxh5RdZds15VDAFB7RXCaohs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=O6xBgC51aZTdlysRLd1m2JB3fIWMpRNc+tWereUM9Jvn640GA7ZsHYJOlH8TPzDoJMjzct0fxbpEHnHgX6V2uWUb8xBystM0JF7vjr6mQ6qOaEXSs1EZM1ivY/2KGccdPV1Xq7mKi/Jx+/GDbTk7bVRAu2wM4ULCyVBvx1gJYlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hx/KdwQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqqaBEgf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx/KdwQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqqaBEgf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672NW1FM2867726
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 03:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=alsyKeVDpdyzB30QyLw4UE
	PQxiF/ylPHfRQqsBXzg/A=; b=Hx/KdwQauF0kK2wCv8Cm36GYYOu32RkZ9axIe2
	J0shmGc7+xcE85C+4EeJXfi4JyUwlmCYCTDw2GQMpCEuQbu9SMtRZcAVaEPUpEuC
	u3y9/XNK2YjS2xTrf1ELHZQV3sZWL15aYVyeJw1K5w37GCppiqLVtmk3cOX+xDTC
	cbRH9WsjrqA+y8cN9zBtPMZzmYIrVtJZGRMM6cG3g60ojpZQ0Ax9dSZGTEokgxem
	20Z4w+Hd3qoqTi/gco0WwQt5kY6yazAHka5Gt6fyhl6uNQjB8rxsCo09v9jBVINv
	XFrc7mwWiaF0ranM0cKPiZoE8hqBPMvmdYEha3Zckcubxm4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfv3sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 03:15:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2734987a91.3
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726937; x=1786331737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alsyKeVDpdyzB30QyLw4UEPQxiF/ylPHfRQqsBXzg/A=;
        b=UqqaBEgflxmQl5J39R/9lWTAQDeHOXTz2p77ROUsh9FiTXE42mf7MLIkOfngN09vwN
         1jTMVw4CTKc14QJyr4LTjjZM0Jvqx2Dub9rtm96tnQ1p2MOgnR1z4iLde5Ob/A3bb7Sz
         jGcpsL7/unnkZncugHdsyWpdrWFD37hnSfWBDHcxEK84HylDQ2PEhpuKNiCB4oGvSfKK
         ySqURzLkBbCgFoLr09vmWNGoMxxEFidO4uhaBvUyQUFpd3hzK1GfBB1Ne9D6dQ+nvEg4
         4azIalv2T9smk53/iPXKn96iKaJejJ8EDne3XReekCb7pM5kaem9KWEGns3neZOuxUbX
         FekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726937; x=1786331737;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alsyKeVDpdyzB30QyLw4UEPQxiF/ylPHfRQqsBXzg/A=;
        b=epheld7QeY1zmFVpgNSkfVYw8EwutJjn2QrjtNPwm9f+WGfflP11dZ8/Ne383AjX6a
         p7KRs0P7h5d/0MbQKSpOw5lLzx3rpMyWnAOm62A/F4LTQD3+0tY3NpLaHA47kN48GDk7
         KHB6fZh5zTwcU+08S+Kpno6vt41PeJm6MYWNu6XWR4EAxJeDpj3ST+g5qcyKqfNnNI3z
         BCSwY14YM3Y9vj5crZpeztYNsdmKMz1c0JtjFqvSYvpo1MSbdX8z8te+0hZj0UMnbpX4
         j+zNXia+osGEatbdESAzoWeNV/JyJf36TDbtfkM3LZa9ShliETz3E/XdyDF+XVmJ9Et0
         K6Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9PoHCcMiWUtZVVD59QnKOOvfs1Gc/kIHOfuBltGZQCZ4tLyABwGMu/tE6N14XDhtNxEh7Zx3uHaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTCFbMnAtLU+aWe9WA9Ky5z0P5+236eV6tWTjIAblFskEkw8j
	Pr9Tnt+jydFgO0q0ngsMP4gCfdAwKRxtI0QnjN7BdQaiovWAts6UeLeT7rH3MUMSM6saCGFlc6m
	rhGEjciQCYPRfYKxupeFdmYETS1k+59I3N9VwGBzBnwWdv+QYtL1C7U1hxRlCqX0=
X-Gm-Gg: AR+sD13vorPmq4kL4MljTqaCU5nydpZZ1Rf/D3y/QlKbq9E/MZBjXj23rr0vNhtvfcQ
	4FH7UnaYfwlg8so9w8ZsH0WVJx2bKq0HYmyffdz6+zbEOVANlbMDzD+s/UZO7OWtgZ7mcZtysrV
	x9VDBtkIvT4QoX48BpoRJGOw8XkGWA4R+AU98O73TZXYDHKlGs1PsW6GeejpAif9W+9LHU/UXKm
	z+Noe/vHuAjMSzku3Ghju/arZr3Dn5cTKfAYfvEGTpc+wEU/jwYmrf+/ODKvR1ZfUaWgAt7AWuf
	uzT1rhJJSloraioAgcPjZLOJeViuvrD5LEIqxR1Ep2pxTnTZVhgj2DwfJ5RAfBH76LaaH1FjRBI
	tp8bCy7HD9Y0Ji3M/m3qUagqhX7iISPdJ8H2KEMpcNVjrp54luMkGkQ==
X-Received: by 2002:a17:90b:5888:b0:38e:7268:220c with SMTP id 98e67ed59e1d1-38fbc4eb925mr7753177a91.32.1785726936819;
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5888:b0:38e:7268:220c with SMTP id 98e67ed59e1d1-38fbc4eb925mr7753155a91.32.1785726936288;
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:35 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] Improve Qualcomm EUD driver and platform support
Date: Sun,  2 Aug 2026 20:15:25 -0700
Message-Id: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LOokqwu2-k3ezGbYoJvsTpZ00hDQ1Dag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXwZdoN5chaX4s
 9ZqqehKhC3LNzK1/ChOSALICKwH2p3JB+LfZKjo6vex8n+E3A0kMEulPEk5S6JvNxrTJRsT0Ktw
 WYOLQuByycq8VvDXCELxOFjqYRky/VGDVboifl6eH/+rQwfoIRarAZ9SPRSkrYCDqjnkQuJlj1y
 baXI95h2A8tDtraUXCee71LBtQU+8lw8VkALsCWx9S8HQQjAu/6vsm6YKfnbpt2Xmv5NLtWbnp+
 Oy4sNUL7mzHIsQa6qvlFON5gPNVf2WRL9Wku4eit0aB2EXxYioOOsS+nLo44VZJxqRbuYh1bsPI
 paTr1/6caiJDvJ4+lAPfZOqdp5A9ggFSVV8Ak/myMgbX1RS1VC7ijPZdzjdK4Kqlv8qLKql0A0x
 OG2cTfFO+1dOZUEnfU8MjX1MRP9XlNfffZJicpcwgQDOpQzl+gQPMtO0OGcXjqRPOkDePlmWnU7
 /Kza9ukOfSR9ZYmsj9g==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a7007d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eIg1vlXWje1Bm5DpEBAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: LOokqwu2-k3ezGbYoJvsTpZ00hDQ1Dag
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXzKhvWB0jGuJ/
 l7Qf8IEZ2cv2V8KftKTqeQj7rwgtu88Q+Uzjkw8v3B1UMoJO3RgwxOWfmyoZPgnoVAMV1/OPBuc
 w3kmMa3+WY5pUE7Rk4ldEt6LY5P7r48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series
addresses those gaps and introduces the necessary device tree updates
to enable testing and validation of the enhanced functionality.

Below is a high-level block diagram showing the EUD and its connections.


			              EUD Block
 	                   +------------------------------+  
			   |                              |
[Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
			   |                              |  
[Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

Testing feedback:
 - Konrad Dybcio reported running a slightly modified version of this
   series on Agatti with no obvious issues:
   https://lore.kernel.org/all/8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com/

---
Changes in v5:
 - [Patch 0001] Add a compatible for a SoC that supports EUD over two
   ports, restrict paths based on SoC hardware, and improve the commit
   message [Krzysztof/Dmitry]
 - [Patch 0002/0003] Document error codes in ABI doc.
 - [Patch 0004] Zero-initialize the USB role switch descriptor [Peter].
   Add a dr_mode check to handle cases where the USB controller
   operates in a fixed role without role-switch support (based on
   internal testing).
 - [Patch 0006] Drop eud_disabled_for_host flag and control EUD based on
   device role entry/exit [Peter]. Allow EUD to be powered on only in
   device role and defer enablement in other roles until the port
   switches to device role.
 - Link to v4: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/

Changes in v4:
- [Patch 0001] Restructure the flattened ports representation to a child-node
  based model.
  - Preserve the top-level 'ports' property and add per-path child nodes,
    so that each role-switch path is described using its own OF graph.
    (Dmitry).
  - Link to the discussion leading to this design decision:
    https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
- [Patch 0002] Use explicit port names when selecting the active EUD
  port (Greg)
- [Patch 0003] Use a scoped iterator when looping over child nodes and
  drop redundant EUD path validation checks (Konrad). Preserve support
  for the legacy top-level ports description.
- [Patch 0004] Register role switch per path and forward the role switch
  notifications to the USB controller.
- [Patch 0006]  Add host mode co-ordination based on the role changes as
  per the new design and drop the custom API that was used to get role
  notifications.
- [Patch 0008] Described the UTMI path as a child node with role switch
  capability.
- Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/

Changes in RFC v3:
- Replaced the per-path (eud-path@N) model with a flattened ports
  representation based on the feedback.
- Added port@2 and port@3 to support dual-port configurations.
- Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
  and role-switch information is obtained from walking the OF graph.
- Updated PHY discovery logic by fetching the PHY from the controller
  node/fwnode, and exported a new API for the controller to report role
  changes. The dwc3-qcom driver now uses this API to notify EUD on role
  transitions.
- Updated the DTS structure by moving the EUD-to-controller port mapping
  into the base SoC DTSI, enabling EUD by default, and adjusting all board
  DTS files accordingly, including adding the usb-role-switch provider
  link on connector nodes.
- Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
- Improved commit message of patch 0001 and 0003 with historical context
  on why EUD worked without PHY references on single-path systems.
  Expanded the usb-role-switch property description in the bindings file.
- Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (9):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add role-based EUD control
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
  arm64: dts: qcom: Map USB connector to EUD on Kodiak boards

 Documentation/ABI/testing/sysfs-driver-eud    |  19 +
 .../bindings/soc/qcom/qcom,eud.yaml           | 128 ++++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |   4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |   4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 drivers/usb/misc/qcom_eud.c                   | 332 ++++++++++++++++--
 12 files changed, 513 insertions(+), 69 deletions(-)

-- 
2.34.1

