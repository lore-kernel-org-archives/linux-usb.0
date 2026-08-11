Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A433F58C
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484177; cv=none; b=YgxipfpQBR/xDdXSn9ia4+D+8O3hPgTY4vFIPqk78eNfjufvPNS+HTKX+68qvuTQrHe+BWaOee+jXZyZVR56hp3/ehPsVbu+4i2fm6K5+I9lP8NoTIErGJFheKvSQxf7eDLq9/j0HmNVBpq+1r8luWukz3AlnBLBp2lH357LvF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484177; c=relaxed/simple;
	bh=3fBoY/gw7JMZOBQhzZTLCz+7QXmmworuPQ7CK4Xh6Js=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=a225WMZScnydkyUUtWDu8Ilzhe4Za3FmVRHw6N8Emrbjj2PhXzBLoFw6tXCsjMSZCq6JwSPhIDvvLHEYfHFP3yKewgIk4t/9MC1ah0gfjt3m8PQCAYkKXpMjm0GywKV4Ouo41A3NN6CVYpFvne0/S3Jp78Q7d73XSNXgIWDyr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhl9H2si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D628UeVz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhl9H2si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D628UeVz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQRAG1835903
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gJGCqas17nzmHYElMsAVn5
	uGCMRCKkOk/uITSYbuvYM=; b=Rhl9H2siFHqURbuXRGoaxINcZysfgXz9ML7kwt
	26+mPJZmsZDc8L7jrxF2WUQvKzh4tlmdMHegPH+MZ2IeWMBIqXtYMeLv3Yz/q4+j
	IjdOIydK4uy6/G7Ro+70Q6rHlBjwMA8dYLbObAhJLborjFH8XJwrOWbPr/d4azK9
	2P8ys1pMklfdu0Gjre8pDXir1Gd1wcVy8/MxixpsORwRCA29D4QDfyw9KQMVWlJS
	q0hOUR0rfE54GYtPsraQWp27TYvhLo3l/r1Pz2Thnpr6zaNlAZkuDDRTa9xjGxQA
	5wdJf9uKw2xdOARP9K+0tacjjioXR37PUYZ0qfKxVYJRCDmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc2rmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:36:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so3706075ad.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 14:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484173; x=1787088973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJGCqas17nzmHYElMsAVn5uGCMRCKkOk/uITSYbuvYM=;
        b=D628UeVzdj8wg3gACc3gNmH4llgr+aXsHRbQVGAl+93aFccavpKsa2gtO5CX/+x7FR
         P/JixBrOT7dg9ypCVrytIWwWfxUwak41AUx/nwxIwkT4CJZBLJGxypSaXxvP7/wMuTJi
         psCXkMbYMOS3NB3C2VB1Ln8tBZfPtLOO1doxhstGtGztfbmlYJTq5qff6zuwlUWB8WcW
         90h6NdKDuHjFvRK2lTGYwWdWk84/j02oHZKOfzC51JAXi3gF1+ZHFZvgEDjuhx1L0aCG
         uvTcoyOfMBH0lt2TeEbT2zK40QehiOPeylCvR6e+osYFlMIngs6VikyhnRxCwxfLkyDM
         loXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484173; x=1787088973;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gJGCqas17nzmHYElMsAVn5uGCMRCKkOk/uITSYbuvYM=;
        b=mZif/a61oH+QsU7Mc2eg+A1o7cpZTxRSyFZNvUOnK/IE2xUJVeGrQGn51nn1e5yCVd
         D/312kzNqrTOr5yd7/bxkuAm9pZ4xfk0hdJU5pHJM7Q59CWKvzHkHRzNWRPawSFvsbu7
         Iadxd/0lxl5XR2H/7802uv9/qui78TPpH4UJ150v6Ej1KUtxpiZIi4oKuJl5iXlxL8Q1
         3K5ZBpSwF2fYGJranV7AElXNc0uUuRWOM1t5tJ316UcsiyMONL6Ren1ZZwdRKMzNNweD
         jLZllZF5x7VOLMk8G2WV9uChfu8ncq1Vip0aJIEIUiy3B5DJTZ5xqaltNq/LRtf/JCCV
         nlow==
X-Forwarded-Encrypted: i=1; AHgh+RpanWetP5bj4ncM4dUr+McH1R3G4HqF8hxDtP02Iud0ZZQeoKhdYv57JD9X0GzpBh/7HACq4BDrwQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+vDAJIhY1tFcA2BHVFt2pim3uAtF6cJ6yhmoDt9ACejdymjYN
	RWP3cuZq53o6iy4g6ctpJlKqH4gcpkIRy33lrDlEmVI1bHRte4uwdv4BNOs95d7DlcXuFKSCPXy
	GkceV1Y0TWsTioGLbGTdyQk+EirqSJtCWFWtc6M5rr9iHTgMGyJJFwcSSW2NX648=
X-Gm-Gg: AR+sD13+/ookaAdW3ePsQ8bMejms48EFmoJkp5HU0GFo4BelGjSao7+HGcFZ74rIfF9
	l9AzHRoM6VBXlQg+wjt6/V0EWROYTAnNLjh5YVCSURl2QXZvpe/YRPpMdw4U4ETSS8EaHjbuoHW
	t7zFAU62oWD1BWz+d58TOzVwjfQfLjvNPZsRpkV03YOxoMjeWQPNQYiP58TKOrkLYo7Sqzo+3n0
	IiY1wGEjJEm+qa6PKI5U6MqRl0bp5ZV0tssMAOSuXopwJZUGS8xoXa3WQs44JFNB/pLyPs0749r
	O1V2B+ywHnkHCc6WYQWt0seFHl/RHHgQL4zVByJzDgs5ltn/p0odnGBy9+iYXq3aE4FjV66DJcH
	vJHyVukBB9WRnyitc4H9OhYfH8dxrgdFfChZIajl9/QIqaNT+2WsU0g==
X-Received: by 2002:a17:90b:2e4b:b0:380:f389:447b with SMTP id 98e67ed59e1d1-393014fe4f7mr9305a91.11.1786484172456;
        Tue, 11 Aug 2026 14:36:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4b:b0:380:f389:447b with SMTP id 98e67ed59e1d1-393014fe4f7mr9226a91.11.1786484171945;
        Tue, 11 Aug 2026 14:36:11 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:11 -0700 (PDT)
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
Subject: [PATCH v6 0/9] Improve Qualcomm EUD driver and platform support
Date: Tue, 11 Aug 2026 14:36:01 -0700
Message-Id: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX7F5Y22TW2Na7
 LSqZPejEf1OR2rT/wxpjlfbjDTqh8SHZOJ2rYxwgoh3dSnIjFtAuX0S9VK9SuKAi+MviBVM8i/s
 XUAznSSpBWmYH270lupwJs+UYGHa47w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfXw+HiThuplvmr
 TRd6dobIjRA5ODOfORVzLOmrHRCc6rEBvmipd5aRKmlbu8s9LjNwWYxdfaF9/EW6cfsBblGMGT+
 GpwBXG1JHST8KTI5991StlHJ5iVnCo5PtBh61gjS/wWb2IaF6KnzUjzo9w76C9N36cEYZTWaNFb
 Gz6quNxrObFrAMlGNh2c5VrEpwgqPga9YUiyOe5gePTiOcygsz3/4MaU3DVh5NT17/JNOZ8R9k/
 vAO8BUW4Ju1eyqb72Oy9OzxT+WqMEh6MT6g/y93CeCN3EUNCHV+xWf4H8HFoutWBCYzbRP2BEjO
 tCFjAmSsUR3Z0zhSn81vb3RxPNlz3+KPSINWG/GnnN2jYe4edFk5Hj1MsZGDuZ3OcrvcwJuPdvM
 llLo86jzS+PVnrNw5DXENHQDYwXrDB43EooRAz4hANvlzGwRwdIcjquT73QmnQxDeZwf4+hCQ7a
 1bGzVQ62FtLzbTDR3MA==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b95cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eIg1vlXWje1Bm5DpEBAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DP8FNL8VN_Y5A5sHOzzOKwpwnLG5AeEt
X-Proofpoint-GUID: DP8FNL8VN_Y5A5sHOzzOKwpwnLG5AeEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110182

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
Changes in v6:
 - [Patch 0001] Fix oneOf schema to properly enforce mutual exclusivity
   between 'ports' and 'eud-path@N' (sashiko-bot).
 - [Patch 0009] Extend the eud_con remote-endpoint fix to
   sm7325-motorola-dubai-common.dtsi and sm7325-xiaomi-taoyao.dts to fix
   "not bidirectional" DT graph warning.
 - Link to v5: https://lore.kernel.org/all/20260803031534.2942628-1-elson.serrao@oss.qualcomm.com/

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
 .../bindings/soc/qcom/qcom,eud.yaml           | 133 ++++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |   4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../qcom/sm7325-motorola-dubai-common.dtsi    |   4 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |   4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |   4 +-
 drivers/usb/misc/qcom_eud.c                   | 332 ++++++++++++++++--
 14 files changed, 522 insertions(+), 73 deletions(-)

-- 
2.34.1

