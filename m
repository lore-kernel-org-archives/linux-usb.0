Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABCF2E738A
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145313; cv=none; b=ttcs0nIl8/K4JyGn4RO+BZGV3nyeQu91UGYQNb10dXvJLE4F59YS3ZdGAo86YJWhAT8xNp2ZzKz6StcFZ5CB8ZQps3Lr22mRO9IYXnimepGeXh3biLy5A0gt5J0U3hZovh0K+KJqQCQ4kkeOigQ+T0416ac2H4uBlcZ2D0sksxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145313; c=relaxed/simple;
	bh=Pn4L322TdhvY27KSERX5TL/og7eGJhKfJob4YXqtKAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=IKBk+J/TZ7PXxQ+RaC2zjgeNvr9q2VhJh+jpMfMHpWd1exvTCwUb6QHrTm+W4keNtT8BvwbXhMgUtqNuXCxfYMMeca5dBu7na8Ba6YK4wm1hM48ZyWUzJYr+TPAOJmZ86FIsxaHj8nLh2v4+jTs43Q3864yEboMUwe2NMS6aa68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDQ1bXwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqJbo/Ch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDQ1bXwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqJbo/Ch"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bPH61496291
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S1j7LFL1EZkClE0wOGR2LK
	kQAkUcy/aYxZClsVrKbD4=; b=WDQ1bXwQ6Lid1ehd0Ioazokupr87hyefyN55bS
	QiP1imgU+f1286jTAecZuofR97aNldi7K4GfNK0vwEUhMfZSACTs8k8EIKgr+t6l
	f0qY5+Ov/xQMo17Vp8gTCKzC5LZMFOsAdzFugEBL2EhiuQw4WbBeO1neflsFZCmm
	7JQmR1xAhxKu7NxqjEYlEks5UzItw6zKkR4qHM8HteOptsVpGn1Tm01QpMHNpW2C
	r8siIdL6vJvsd/zVo+XKhN1V2QcbbRYDn6gnex6B2GOQC/T5nnUrvIfXM9nwdvVJ
	COVgf30gA/nspEPywx2qjwShe22AEcXbFH99LKSLk0J6oylQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq844kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so762597a91.0
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145310; x=1788750110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1j7LFL1EZkClE0wOGR2LKkQAkUcy/aYxZClsVrKbD4=;
        b=eqJbo/Ch25gyeWc+WQ11NxeIrSzle1btkiGIgG6iUF704HJ1acWpZapIttRF8Q+bER
         EiK/6VhaFcIKUCn+Gv4xqk6tXB+VB5It9DNqbBAADY2p9neRkJ/WR2DJEOglOQ2yPYQE
         H4nYrx/oaprl1NSQSiahBdxpaNvJ6k0tK1x3D6oPItM/2OVSAf61ff4SZga09bdBcLrF
         s7hZmzAVq51tSmASgfFlqf6a4qxON724H2qPTxZthgDVPK/8GTZApIkTpjaoSn/H55i2
         wevYSuXlpd9oFQ0DMWccyhrl8IEt67WeBM1HXQccrvE3QqqFkzTlm0C23xZW29aZ91jT
         537Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145310; x=1788750110;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1j7LFL1EZkClE0wOGR2LKkQAkUcy/aYxZClsVrKbD4=;
        b=rMQe9gFF1lguMhCrxw5F2CH/x/a3TXH6df2hpkRgTI7H3Bw3c3ASqrvgFm75lHckE6
         ZiEOgoRyCf/i5UNhX7gyAelIKF1rtzn7txp/Y9arscfmdV4o78ZpOO0MzryTYro9DFDS
         NC/3YEjch2mEqpnkKoS5+Jdu2beoPH0TyqziaN2Ssp2Bnne/orCk2FAZABkGDd4jUDYe
         C7KYibXYzQyIut1sei9h8u4bcZFU011wXgq6cYcx82EH00tQCNi9sWPTfMOeYVO+TtJZ
         56KiRn6eokkG5okSE4rWcyRyx9uGou3XVlwf7Mau1ssPfcHycmKZVL0PFc43C3ptSymE
         PPoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoXFzccAttskMwPjxx0BF+ssPvH7VzFR93at0CoqTlfCfC/f9weMVpIcEADQ5/Glqs/l5odYKmP9U=@vger.kernel.org
X-Gm-Message-State: AFuF++kRgxdQ+tCY52VLFfO8q9DEUm40USnAbXLJy5mxK0qTPEIf5fjg
	OIqok5eKbTtwehvl4dsMd6VOeW8EnPlEvZiPaPQnkGEVYm1ZNkktvalvlYohEBSAIYV/vPg8Mdo
	635dpCAj0Xp5CbKMO67PYeSYXS9qRYjX8CfklSVHdJzCsEFsbUwdUidIbuU/xnqk=
X-Gm-Gg: AYBFou2TVQv+LKvHiUc5sxDGDNvuHgd4Q4HKanpIq0yyWw55JdKK7hnJIre3fH2P5Ez
	GAXmdhXRUs3/m3PzLv7adBJClTLKbCuJ7LX2Vq5oDSEvxHNagFQ05sIDMA5mT6GZ+wWOfn0Lfg5
	DuxwKz2x8uTPbJEne5rYXWr8xYCrYEBN+jINohDdD70APzlOvtkDL1V/tDw64/166quV24V+nWU
	WudZjWvyvfK2BOpnsOz8MZcR0FKZatt9O75nrbcVjglHyYA6DRZ4irvcaWBJFIF+jJL2BbbK1Lt
	RfCq1hUKOX3N84+ij0u4wUrXBu5Ofky2y4qs1C2aZ9GqoBGDN3Zv+ViMxqNNspxyHDNuGVb36JU
	zvpIrNPL7c9X9m/nHq5k0dS1pUFLU2tnFnK2i3OBEJhmygX4Y2uJEfw==
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr38925147a91.2.1788145309595;
        Sun, 30 Aug 2026 20:01:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr38925043a91.2.1788145308989;
        Sun, 30 Aug 2026 20:01:48 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:48 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/8] Improve Qualcomm EUD driver and platform support
Date: Sun, 30 Aug 2026 20:01:39 -0700
Message-Id: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lObPnxkc6Q1keVS0X3BlDNi_zsmfaIq4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX/v3jTEQKpTex
 Ew7HLlp4JgEnrgA8rUwmZZSSG/nIoatbHMod28oa0WgHxfnVmaBw/CJMiJqKe/kSi6fmd0RIG03
 RVYIBd57ymF9cUwJJPfkOWGFF1n7rVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXzAmAzmpjeLp5
 eZvNigZTqPMU5I7xWPZ6pjAeoAQyNlXbGxn3IQ3+78LWpR4Wemnusz4YBAK6JpMc6RHYCFgMsbL
 ksMbaOtRovdeH384jjBBo69fxQBxufWN7p9pSATRoChzMQl88CgejpChiUmprF2iASSYLe7C1R+
 vSM7jo08a3+e80Sfk7TJgTqKTdmzHuj+9etLwVa5GWD0kzxJEkzkj48NajIFChkx4D2XsGeChE8
 1Pee2juQ/VBzhBtNbQXdRWr7Wy7/f66U5vq42no8lEw99/hRUHrG0/XhEEtW42VYLfgXjrCmtHg
 roWb0Q1n7O39cwdyS6T3+gdxGvh9joFbCWC+u2367qgQi4y8Pnet/lLSWykcYRZU/b8s41Vslhn
 wHLwl+DlR9AsA7nzUdPhCu7m0RNqHfiV5E5iMA3ymmgcxnNOSgbusP9MTcu/59NR1+es/aCW+wq
 87s6CC64UjyQPO7V/Zg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a94ee9e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wYpSvYA4TNd1uGNCPEsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: lObPnxkc6Q1keVS0X3BlDNi_zsmfaIq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

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

Regards,
Elson

---
Changes in v7:
 - [Patch 0001] Explicitly disallow the legacy ports representation for
   SM8350, as pointed out by sashiko bot.
 - [Patch 0004] Simplify fixed-role handling by relying on dr_mode directly
   instead of an indirect USB_ROLE_NONE check (Konrad).
 - [Patch 0008] Squash the Kodiak EUD board endpoint remap into this patch,
   as applying it separately leaves the OF graph bidirectionality broken.
 - Link to v6: https://lore.kernel.org/all/20260811213610.2956147-1-elson.serrao@oss.qualcomm.com/

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

Elson Serrao (8):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add role-based EUD control
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector
    mapping

 Documentation/ABI/testing/sysfs-driver-eud    |  19 +
 .../bindings/soc/qcom/qcom,eud.yaml           | 134 ++++++-
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
 drivers/usb/misc/qcom_eud.c                   | 334 ++++++++++++++++--
 14 files changed, 525 insertions(+), 73 deletions(-)

-- 
2.34.1

