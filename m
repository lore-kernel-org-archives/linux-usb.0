Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433862;
	b=vRzopw8NjxdAthAjzD1+5nOZGw6Uj3ds0O6k66Woq0IlU0oqHgyd0P6NGG4A2dRb+YwB
	 /5LsioXkWEMSZrSII6KAgC39bQP0rGCoidPqkCl4PELMjgdnndJD+57VKUxDpWZRLhM3u
	 Z/3Qah+TUDIh1fF/vROu6v6EHqLGPV/hT+Vbyo53LU+irUoFrrjz5VE8BfqD1WJyUl6E/
	 6hgacJb5GAEjwwuHP+xpY35SA7n4MGSNjQfKu0GWTsd5JWe8sS0gm9Vj//sUa2o5ig5xP
	 1SoTVzJAwo1qMt2q735HeunfUADd6v+E58F31RrIUFgLzcuULFSR6iB21tBcb6TuWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433862;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=sJT0P0pxlnO/2UL96KYZBEI78j4iAu+YUCI/UbuX7rw=;
	b=SlCroWnfTtojlkiVfV1uRt6gqwvSvj8tWI77DQdUmeTz/gNxtfs0H5kkNsJaJSe+2yVN
	 NZuPO6r2A+wARNQs+XjGNOTJRumdo5z/z6hQ0HPb4UJTgpcmJye80amIebMCfhdzbF3s3
	 bVrUC2++r1xvArcVwhG+NyMx42ZZFJ4Pdr92yRQwU4GZKCwh7i1xiHg/3aMNN86NjHwcO
	 TtSdKrv5XxZ7q0Ps/M/8x5zEgX5953pebPPCYddTOVURbM2sHNLPRKTfG8AsrjgTA/tM2
	 +RZlNDdp4fY3jERvDFfeewkVLKQd/Mg9ORvPC5VPhkpZz2r5k1oZpthKVlo9jrvaiew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZN1L0SVB;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F985606A690;
	Mon, 23 Nov 2026 11:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F985606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZN1L0SVB
X-UUID: 46d1c5f6e73211f18dc8c9802ae25ab1-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sJT0P0pxlnO/2UL96KYZBEI78j4iAu+YUCI/UbuX7rw=;
	b=ZN1L0SVBiogJU+Yj/I6HkXp/xxWu7ONEFfFxc6l+GnugO9I2/GpnOsNaE9jvKEqrhjcVs7qniCkYkGeq8fpmhbwicIvzgApxECeQ/uUuJAmUnm3d+KUt0cK5YuvMLpsBBj7H3yWNsz9R3eTGMgJiu1tDv24GM5FoFwtcCfm3WxI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:99e590cd-c699-493a-a703-447764e6b21c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:4ef7f319-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 46d1c5f6e73211f18dc8c9802ae25ab1-20261123
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 765829569; Mon, 23 Nov 2026 19:37:34 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:33 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:32 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 0/8] thunderbolt: Add support platform NHI driver
Date: Mon, 23 Nov 2026 19:36:47 +0800
Message-ID: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Historically, the USB4 / Thunderbolt subsystem has had a hard dependency
on PCI, bundling the core framework, the PCIe-attached Native Host
Interface (NHI) driver (pci.c), and the Intel Connection Manager (icm.c)
into a single module (thunderbolt.ko).

Modern ARM64 SoCs (such as MediaTek MT8901 / MT8992) integrate the USB4
host router / NHI directly as an MMIO platform device rather than sitting
on an external PCIe bus. Furthermore, embedded and SoC-based platforms
often do not include PCIe-attached host routers or require Intel ICM
support, making a mandatory PCI dependency and bundled PCIe code
undesirable.

This series decouples PCIe NHI and Intel ICM support from the Thunderbolt
core framework, introduces a generic platform NHI driver supporting ACPI
bindings, and addresses probe error handling, link training timing, and
disconnect warning issues observed during runtime PM and suspend/resume.

Overview of Changes
===================

1. Modularization & Namespace Cleanups (Patches 1-3)
   - Patches 1 & 2 clean up internal interfaces before exporting. Core NHI
     functions are prefixed with standard tb_/tb_ring_ namespace prefixes.
     Intel ICM mailbox helpers (nhi_mailbox_cmd/mode) are moved into icm.c
     and made static, and interrupt work initialization is internalized in
     tb_nhi_probe().
   - Patch 3 drops the hard "depends on PCI" from CONFIG_USB4, introduces
     CONFIG_USB4_PCI (defaulting to USB4) to build PCIe NHI and ICM as an
     opt-in module (thunderbolt_pci.ko), adds a .select_cm() hook in
     tb_nhi_ops to allow connection manager selection without core hardcoding,
     and exports symbols required by the modular drivers.

2. Core Probe Error Handling & Unwind Fix (Patch 4)
   - Patch 4 fixes initialization ordering and error unwind paths in
     tb_nhi_probe(). Moves dma_set_mask_and_coherent() and spin_lock_init()
     before ops->init_interrupts() to avoid race conditions with early
     interrupts, and consolidates post-interrupt failure paths by invoking
     tb_nhi_shutdown() to ensure interrupt work is flushed, IRQs are
     masked, and controller power-off callbacks are executed.

3. Platform NHI Driver (Patch 5)
   - Introduces CONFIG_USB4_PLATFORM (thunderbolt_platform.ko), adding
     support for memory-mapped USB4 NHIs via ACPI ("ACPI0015").
   - Implements platform-specific tb_nhi_ops hooks and runtime PM.
   - Adds support for an optional dedicated wakeup interrupt from an
     always-on power domain, necessary for SoCs where the primary NHI
     MAC/PHY power domain is gated during suspend.
   - Calls pm_runtime_resume() in nhi_suspend() if the device is
     runtime-suspended, ensuring the controller is in an active state
     before system suspend (unlike the PCI bus, the platform bus does
     not automatically runtime-resume devices prior to system suspend).

4. Link Training and Disconnect Improvements (Patches 6-7)
   - Patch 6 increases the port link training timeout in tb_wait_for_port()
     from 1s to 2s and updates the kernel-doc documentation. In the USB4
     specification, Phase 5 (Link Equalization) alone is permitted up to
     1000 ms. Factoring in Phases 2-4 (~200 ms) and retimer command
     transaction delays across dual-retimer topologies, physical link
     establishment can legitimately take 1.2s to 1.5s+, which previously
     led to spurious disconnects during wakeups.
   - Patch 7 decouples the TB_PORT_UNPLUGGED wait time from the overall 2s
     link-up timeout. Under normal link training, the port enters
     TB_PORT_CONNECTING within ~200 ms. Capping TB_PORT_UNPLUGGED retries to
     400 ms allows genuine device disconnect wakeups to be handled promptly
     without waiting the full 2s.

5. Drop WARN_ON in Disconnect Flow (Patch 8)
   - Patch 8 drops WARN_ON(!up) and WARN_ON(!tunnel) checks in
     tb_disconnect_pci(). When userspace deauthorizes a router via sysfs
     (writing 0 to 'authorized'), missing upstream ports or tunnels can
     legitimately happen if a router was unplugged/lost during sleep or if
     tunnel activation previously failed. Removing WARN_ON() avoids false
     kernel splats and panics on panic_on_warn systems while cleanly
     returning -ENODEV.

Differences from Previous Versions
==================================

Changes in v3:
- Patch 3: Added 'default USB4' to CONFIG_USB4_PCI in Kconfig so existing
  configurations retain PCIe NHI support by default without config churn.
  Exported tb_xdomain_remove symbol.
- Patch 4: Added new patch to fix error handling and unwind paths in
  tb_nhi_probe(). Reordered DMA mask setup and spinlock initialization
  before interrupt setup, and ensured tb_nhi_shutdown() is invoked on all
  post-interrupt probe failure paths.
- Patch 5: Added 'depends on ACPI' to CONFIG_USB4_PLATFORM and focused
  platform device matching on ACPI0015. Added pm_runtime_resume() call in
  nhi_suspend() to handle platform bus runtime PM behavior during system
  suspend. Cleaner Wake IRQ Handling. Kernel Coding Cleanups.
- Patch 6: Updated kernel-doc comment in tb_wait_for_port() to reflect
  the new 2-second timeout value.
- Patch 7: Clarified kernel-doc comment phrasing ("router resume").
- Patch 8: Reworked from v2's sw->is_unplugged checks to directly drop
  the WARN_ON(!up) and WARN_ON(!tunnel) checks in tb_disconnect_pci(),
  as missing ports/tunnels are expected under dynamic disconnect conditions
  and do not indicate a kernel bug.

Changes in v2:
- Based on Konrad's patch, decoupled PCIe NHI and ICM into a separate
  module (thunderbolt_pci.ko, CONFIG_USB4_PCI) and removed the hard PCI
  dependency from CONFIG_USB4.
- Added preparatory patches to prefix core NHI functions with tb_/tb_ring_
  and internalize ICM mailbox and interrupt work.
- Built platform driver as a separate module (thunderbolt_platform.ko,
  CONFIG_USB4_PLATFORM).
- Renamed plat.c to platform.c and updated driver symbols.
- Squashed optional dedicated wake IRQ support directly into the platform
  driver patch.
- Reduced link training timeout from 2.5s to 2.0s, and decoupled the
  TB_PORT_UNPLUGGED timeout to 400ms.

Testing
=======
This series has been tested on MediaTek ARM64 SoC platforms with an
integrated platform USB4 NHI, verifying:
- Cold boot, device discovery, and tunnel allocation (PCIe, USB3).
- System/runtime suspend and wake-on-connect/disconnect/remote wakeup.
- Link training across wakeups with dual-retimer topologies.
- Concurrent sysfs deauthorization during disconnect events (verifying
  absence of WARN_ON splats).
- Modular builds with CONFIG_USB4=m, CONFIG_USB4_PCI=m, and
  CONFIG_USB4_PLATFORM=m, as well as built-in configurations.

Chunfeng Yun (7):
  thunderbolt: Prefix NHI core functions with tb_ and tb_ring_
  thunderbolt: Move ICM mailbox functions to icm.c and internalize
    interrupt work
  thunderbolt: Fix error handling and unwind paths in tb_nhi_probe()
  thunderbolt: Add platform NHI driver
  thunderbolt: Increase the lane adapter link-up timeout value
  thunderbolt: Decouple the waiting time of TB_PORT_UNPLUGGED and
    TB_PORT_UP
  thunderbolt: Drop WARN_ON() in tb_disconnect_pci()

Konrad Dybcio (1):
  thunderbolt: Make PCIe NHI support opt-in

 drivers/thunderbolt/Kconfig    |  22 ++++-
 drivers/thunderbolt/Makefile   |  10 +-
 drivers/thunderbolt/ctl.c      |   6 +-
 drivers/thunderbolt/domain.c   |  14 ++-
 drivers/thunderbolt/icm.c      |  59 ++++++++++++
 drivers/thunderbolt/nhi.c      | 132 +++++++++----------------
 drivers/thunderbolt/nhi.h      |  16 ++--
 drivers/thunderbolt/pci.c      |  51 ++++------
 drivers/thunderbolt/platform.c | 170 +++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c   |  23 +++--
 drivers/thunderbolt/tb.c       |   4 +-
 drivers/thunderbolt/tb.h       |   2 -
 drivers/thunderbolt/tunnel.c   |   1 +
 drivers/thunderbolt/xdomain.c  |   5 +
 include/linux/thunderbolt.h    |   4 +
 15 files changed, 375 insertions(+), 144 deletions(-)
 create mode 100644 drivers/thunderbolt/platform.c

-- 
2.45.2

