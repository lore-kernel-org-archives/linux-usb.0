Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108357;
	b=zg8qKYD87ZGMLaKU3MCbCzoGPjknXuAot8leQs4/T60urGEjDZ759WytVI3xGRwF9iCW
	 S+zugOdcXeUevEar+gI3lSHU/rguGy28Lc6jBPw/PnLLJr/UDl4BpLWO/MZk9TBQNRO81
	 y0f8Ox4AohfhOGU3hBk8KaQDJsz6KVxvmWwzkpoOh26nj59bGS0UQJkbu5mdhtJZLxFbh
	 suQIq28X3tO6X03FUEzwI4xaUYECS0/4al3oXcByVQow5hOUsq1KFye1FdSf346bhkCaJ
	 XLno9z4Phzv7d7VhwpiTQTX5EgQMUgiilh8hkda/pKs1y7RV7su8Kogw5ibXVZ+uYFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GCRW+SI7f8RMyLGLG/nfGCOnRGtJsyEZjxFAWGga9g0=;
	b=Whg9NmeiNzgVq5V/Aifpi24Xw8D5MhYzg9AxGHS75JsMRwX+dNUL9nEQeXZc1TDxuWSt
	 1LpeaZaYY3pvdumfQCA8nDjpJbxkYnq51Nfm32VFq3f473CYsb2EPM4tFCjOM3R/GgCUl
	 +qAV6gAEnouClnvgdMVEnbZiHfckM0oP98QoNThBanJuveKmQYIDFseVAU/MnbS3FqCBr
	 yMqEHJ32WrtQWGwUClujv961uiMK1S8ucOyg/l4TXmciyhTyxTYQ13VXgHeOUWuK7BEFY
	 kFMNd1Oyva+wlf+3W6Q1nH4NUdIpBldQRMW6z1za0U5Q8sxImxGf7MViyGfHsELgdyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="l/4xFFyE";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EB2606A600
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EB2606A600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l/4xFFyE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108356; x=1826644356;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YxrvLcEf2O+dgILQE3tXy7kogFszw+Qeqfh2d/eZZIQ=;
  b=l/4xFFyEpYmNM72BgbnVC6bfm6jQx9DXTzRsjcHFWrKE5b8WHLkgZN92
   ziHaFbzJxe6tLGF4PYGgKRo/YtXYE3gTDYsIUchqRGQQNX9vJ0U2p6fwQ
   06v+xrVvaEmKqHGWSw22TYmQicg9u4RXMVH7O2K8Y/kD4xhn2S5JFjgfU
   Yb3+Xg76PyrgRWyzoi/pJ0TZCxCbKFHlxa7g/VRIHAViOJ7kJvouwMX2f
   wQIin+NjlWlmrxPI/jjwV6b0lhIn2aZa3Jb3ztSH978tmi/EcPtdSEWzV
   oAv/qdR1MmZXvYfB+inIBLCamrHW3oaKPxJbqY9fF2ROtfc0MJhjMYcqV
   Q==;
X-CSE-ConnectionGUID: ej4dNUnmQcaOtRqnlROYfQ==
X-CSE-MsgGUID: 0psDOb7YS5ixuCX6sYyakw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4012982"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4012982"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:36 -0800
X-CSE-ConnectionGUID: 0uQLyyhBTYGN3yEbIS7ANg==
X-CSE-MsgGUID: 6b8X0LsUSlqXqWwUIq9vEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575061"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EFBE699; Thu, 19 Nov 2026 18:12:32 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/18] thunderbolt: Add support for shared buffering
Date: Thu, 19 Nov 2026 18:12:14 +0100
Message-ID: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Hi all,

Currently all DMA tunnels (over XDomain) use dedicated flow control meaning
that each consumes fixed amount of buffers from a router ingress adapter.
This becomes problematic if the DMA tunnel is routed through a device
router because that may involve other tunnels like native ones that take
away their share of buffers. The current scheme is such that we allocate
full credits for USB3/PCIe, some for DMA and the rest goes for DisplayPort.
On Intel hardware this means the first DMA tunnel gets full buffers and the
second one gets one and after that we run out.

This series reworks the credit allocation so that there is still reserve
but a smaller one. For DP we allocate as much as there are DP INs on in the
host router, then minimum for USB3/PCIe/DMA. Everything else goes to common
pool that is first come first served.

Then we add support for shared buffering and lastly enable them for DMA
tunnels over intra-domain links. This allows more DMA tunnels to share a
link. The inter-domain link stays using the dedicated flow control.

The other patches before the credit work are needed because they fix a long
standing issue around suspend to disk. The topology is now reset on restore
so DP resources the restore kernel left behind are no longer leaked. That
would otherwise affect the credits too.

Gil Fine (2):
  thunderbolt: Add support for shared flow control
  thunderbolt: Use restricted shared flow control for DMA tunnels on intra-domain links

Mika Westerberg (Intel) (16):
  thunderbolt: Avoid leaking of DMA tunnel after XDomain removal
  thunderbolt: Tear down DMA tunnels on every XDomain removal
  thunderbolt: Delay re-pairing DP IN/OUT if DPRX negotiation fails
  thunderbolt: Call DP tunnel activation callback with tb->lock held
  thunderbolt: Re-apply Alpine/Titan Ridge flow on resume
  thunderbolt: Return -ESHUTDOWN when control channel is not running
  thunderbolt: Add usb4_port_hotplug_disable()
  thunderbolt: Move tb_plug_events_active() before tb_switch_reset_host()
  thunderbolt: Add tb_port_state_is_up()
  thunderbolt: Split host router port reset into a separate function
  thunderbolt: Reset topology after suspend-to-disk
  thunderbolt: Drop tunnel discovery without HopID allocation
  thunderbolt: Always take domain lock when tb_tunnel_put() is called
  thunderbolt: Assign domain to the routers in KUnit tests
  thunderbolt: Rework tunnel credit allocation
  thunderbolt: Add KUnit tests for shared buffering

 drivers/thunderbolt/Makefile  |    2 +-
 drivers/thunderbolt/credits.c |  685 ++++++++++++++++++++
 drivers/thunderbolt/ctl.c     |    4 +-
 drivers/thunderbolt/debugfs.c |   43 ++
 drivers/thunderbolt/domain.c  |    5 +-
 drivers/thunderbolt/nhi.c     |   17 +-
 drivers/thunderbolt/path.c    |  101 +--
 drivers/thunderbolt/switch.c  |  374 ++++++++---
 drivers/thunderbolt/tb.c      |  201 +++---
 drivers/thunderbolt/tb.h      |  200 ++++--
 drivers/thunderbolt/tb_regs.h |    2 +
 drivers/thunderbolt/test.c    | 1106 +++++++++++++++++++++++++++++++--
 drivers/thunderbolt/tunnel.c  |  495 +++++----------
 drivers/thunderbolt/tunnel.h  |    7 +-
 drivers/thunderbolt/usb4.c    |   28 +-
 15 files changed, 2601 insertions(+), 669 deletions(-)
 create mode 100644 drivers/thunderbolt/credits.c

-- 
2.50.1

