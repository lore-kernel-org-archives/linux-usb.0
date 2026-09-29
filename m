Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6233939F
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717719; cv=none; b=cIMizhDuxES+H22zDQOu1T0QJHyKSqif4hSk3ZThibC8n7+ugjfVWyePeBbZwMPE+VuYP9O3GoWo7CfU229ki+FwzkYhQNlRqPWwVbHVwmGMRyH5HvixWan+rGNJvLOD4lTtr/s4hJjp8YynY/OWzq9TeOhpY5eja8Tq1/msqe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717719; c=relaxed/simple;
	bh=+TANDYm6ah2cdF4DYp2QHbrCh9dRCdDfTS51LvnK6mI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mLQEjKT4lkao+6rO6Ay+mCnwA9Q/w2ikdp6ZSMMtuivG/nYWKTcTUULRRXIxrSlRzqapl8JJ2KAqftyCmaBATfVrClZQG3Ugyuf8rhUiXOZ9FDj8+fL4HU6Nchx8HIPMZ5f/+MHoyIftoOcj1htmNqnB3sUvi3SqDv/05CRupU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZ/stb88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Td8agWnY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZ/stb88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Td8agWnY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TIb2qi1649624
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9nPZezZutpaKi7THhWBLJv
	8xi1JfHSSAV70TbbK6SEY=; b=aZ/stb88bgHlHPqfGNpNMCBlyqpZrIigFiBCbR
	i4g7GgqSYfWhWWkSvGnq0Vw+7LnPPFcz40hN4JscNzGc8YpYXY08f/m5uObTaGvB
	Eu+TeZsW4SWSvC5tlnCYGe0KbY0/0udfpnuLAm4o2/A/gCYlbS0vnaoOJsVrL7jv
	t5MV05kon7U/Y++AR7XjtnSYLvPMtYSyHijClDDtZW5Mn9w/Jj2Mw4B5tb4l0ycH
	enkN/rOfC28aKZZydlbYzc/WtFHEGPeX8/fYxaeY0Y/yuaTJ73dLYSvcwQF7pO+S
	PwCRKQ6UXo7rY4Y54n3aBFFJk0U5D/Pec2L57hH1T5Wa/hVg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et29xfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34344599f01so3511458eec.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717716; x=1791322516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nPZezZutpaKi7THhWBLJv8xi1JfHSSAV70TbbK6SEY=;
        b=Td8agWnYY12mH7tHfuZMLelq/H0h2fdj8iIuu0VnE0sQ5h1mvzfM6xWCANxINVFq3M
         6T7EBn3sjd9TBXXMNskBRAxd7YyZ+aBgk3tBL4SOkGmm04N9rjSLijUafY+neAsbStKK
         cpvrVPgWogCd3HZJT7XrxcunCE34lfiMjOGBQELeeubGpy5J8WvsQzLLDD9O5ZnqEN+x
         r6j1v0xPy5LWQdGAZbKUjl/6YvWGKd2ZdwK6eeynWqotqrCYPQNKUItT5wVAnB+FNk9Z
         SYPme2kgYATWdfYbReERtVJttq4IKUrjS00vwsKuDjntUe5u/Zq4Zczz0qcQp7EH6DT+
         HdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717716; x=1791322516;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9nPZezZutpaKi7THhWBLJv8xi1JfHSSAV70TbbK6SEY=;
        b=kyXDR9yqCYm9KuaFSZwGniwjkqAWFCdC+pr+iKOBKLygZq0SJQ6KkFzyhLHxokYHmi
         Z4g47VSGjY729m7MLfaJ/bbs5qN95dIfqBDYJJjFPTEL+YdOGgCuvmIzXsPxxUa2+7YH
         s1fH+YH7q2r9E3uwK1Nac6hZvlytSqL8NuhE/eqeFYLNeus4dsgRLrtwE4giqG8eKBie
         a2+9YS4SRUKr1KPtPHoS9nHVsmXtfr9U+F/x+vfWRCCMaOfb55VvjN28sPbDneEDZBk4
         epyLGu1S8hIQZh6lgjjvjDzof/ilAblh0RH4JHrWDsLs5Bo9hyUCpjrn9kyC3A/9LOEs
         qVbA==
X-Forwarded-Encrypted: i=1; AKwUvBzmHfsgEe80caanaFqpsoDLyPIqXCM1OGYHX7/DI5sM/G56pXgSlOH6GIIlzOSyR4ShuAm62IuyUas=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvO7QhsdQkjE+ctORb8nj9c60UpckC70NF57bxwqmYiH8Hb2vS
	oMJO4X0rXj290rRGeoaouiPWn8BGaXYI4Sf9wm2xAU9ZYBkQUoJfMNm4i7qY7vJm0kc7dgSpOm0
	08icqu5A/oimZji7Znoj4EETCHMhsUnT08rM0/tQ0NnyZxIcE8FhDFwR3k6YSgKbR7Y46nUw=
X-Gm-Gg: AYBFou0tqSD28VFJyakSnEpRvDVeNkb4+Y67TX7CmbNFK3boPR5sZG+S6LC2cFEleet
	3Ly2nysOHpOwRYEPyBOElFVY4CqmDI+vIevzITwY2yAsnT2jbGd41kWlugF0FF7OkUScJu8WUkR
	3jIa0gj7VFKiBkv2dbwZsGaNoldGUQTyRbDAYMwwm3rULuTYtHx2CCp5lgSk8VQ0iGdmOFAxcXF
	6aXx2vN6e1QJJwALPF/mmbTVwLMMAp5c1UwXAAiWkPpNkJYIVTxqPU03CwKxmLO4oiil99anP59
	AYxKp6XSnaz7VUCF8WkWolcyVmpOXwWgbWF35UFt+OkrGsuq+kC5295cTi2Men/Z2bYUs3AtSn4
	LtUKbJRAiiGqrMpRvNG7SUwWnsSJkfAHSRC7ywB5bCvxR/CjC7sFz
X-Received: by 2002:a05:7300:ff44:b0:346:7c2c:1d23 with SMTP id 5a478bee46e88-34c6370ed98mr631919eec.13.1790717715985;
        Tue, 29 Sep 2026 14:35:15 -0700 (PDT)
X-Received: by 2002:a05:7300:ff44:b0:346:7c2c:1d23 with SMTP id 5a478bee46e88-34c6370ed98mr631890eec.13.1790717715232;
        Tue, 29 Sep 2026 14:35:15 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:14 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
Date: Tue, 29 Sep 2026 14:35:05 -0700
Message-Id: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C86UDq3agarw3OPpWiu42I_TFShlNj9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX5cAnTPJ2GE8K
 nqRbuc5+fhjcoXNnitHCixkdt1NTndDuj5k3A7yopWIQjsZhP+uJ9FNz74TfqFk8BHwQgCpXp1R
 5wTvgI4P5vbGUhVYCoVhHNlMjMwatTCQ4HSMFHn4cdRk/zrrPZyONxqtmLYeMTiPll2ozLZpb1j
 dW4/97+tmFw7s8nufFDee/4Wvov3VlOX4KRr+i2IplV0VQ7qit50vTWOulWLUvDXZKWLO3BuxAr
 VWNnWVwEl0O2IEY916GiBx/ty04Wi1imLUK7e2TKCAZczjX3J+XaFJUtFjYK9+l014j4qCqSCqr
 40dSigi2ZYKGlPjIUzRN0qZVSbaPGzI1JvzqqwQ1rYMU4gz6/3pRb4/gPMznckIU/jeaYr6er/p
 tsTk4p1aw7MRlcsBhezssvhYn6Nh6V3GSlqIVUGSMFH0zPZa5/GTzIzimqTexpyrpkRbDN2AgF1
 Dnbkwhi1Mibzr+IRaIg==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abc2f14 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=R9ItacU0h-rqzXQO1ZcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: C86UDq3agarw3OPpWiu42I_TFShlNj9F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX2q3lbAxHiklX
 Fqiu54hX0IyO4ooTvorCXd2uHp6dK1gXnys1+Iqowpi0PtvqF1eDq7uqa6nvPYqgiRGKz8nhP6e
 v7zCG4JfSIybeshgUSfF2PkPB7IXyuA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

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
Changes in v9:
 - [Patch 0002] Initialize port_idx from the hardware EUD_REG_PORT_SEL
   register in probe(sashiko bot).
 - [Patch 0003] Fall back to primary if the hardware-selected port has no
   matching devicetree path.
 - [Patch 0004] Add missing of_node_get()/of_node_put() to keep the fwnode
   valid for the lifetime of the registered role switch (sashiko bot).
 - [Patch 0006] Avoid mixing goto with guard(mutex) per convention (sashiko bot)
 - [Patch 0008] Reorder eud_con label references alphabetically(Konrad)
   and extend this routing to newly added sm7325-xiaomi-lisa board file.
 - Link to v8: https://lore.kernel.org/all/20260912225301.3396556-1-elson.serrao@oss.qualcomm.com/

Changes in v8:
 - [Patch 0001] Require '#address-cells' and '#size-cells' for eud-path
   nodes to address Sashiko bot feedback. 
 - [Patch 0004] Set path->curr_role before forwarding the role request to
   the controller, as it reflects EUD's view of the role rather than the
   controller's outcome. This also addresses Sashiko feedback regarding
   EUD hardware potentially remaining enabled when the controller fails
   to complete the role switch. 
 - [Patch 0006] Acquire the lock in different execution paths to avoid
   potential races.
 - Link to v7: https://lore.kernel.org/all/20260831030147.1500616-1-elson.serrao@oss.qualcomm.com/

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
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 ++++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  37 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |  10 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../qcom/sm7325-motorola-dubai-common.dtsi    |  10 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |  10 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      |  10 +-
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  10 +-
 drivers/usb/misc/qcom_eud.c                   | 369 ++++++++++++++++--
 15 files changed, 577 insertions(+), 96 deletions(-)

-- 
2.34.1

