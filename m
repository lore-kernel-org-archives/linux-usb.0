Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901087;
	b=kLC/6ALNsxYLi2i8IxldxTasLJK+pIT0KiU2St6Iq2lCXYhCsz7zhXm9Banug8bmfMDw
	 NeVxNb2BaLmuXB/szUEsewD8Zh/M8IXAlwlPcfxWaCviZ/UlNYUBqPBJiOdI0fB770sFH
	 Rb/sPLkdBWagsUc8z9KRIYHkIeJkvg8OoRbxHOS4PRPNwd486EWtBLmyJW086WRpCJlLT
	 x19a1p1i2k4K2O/76/KSiUYFE82wez8N2hBFnmgAaSMxibnlzmFU/63rRzbuQuUNnhFQ8
	 fpd2JgaL0r8ShV04O7+/ZuP7YUqVq6X/wKC3PV2TWUxVoYJl1BrtBI1u0X0RVXtilEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ViP9+48ZSzWFGjqx1S4gvxbAIq4F0l/xyM2CEmgFoKk=;
	b=VB8akyWfNKu6KM7Asm2rAwoZyGRRixV0oTA8qT2gcuNbbOa4+wjSgyHn47aV+H4CBOaO
	 LNzXd4CbQJtJVa44Wt+bzjbOvoNAZrU51L4Cj6bsDwclXzjZRe/UgmdBjn6jl+u4lhnGH
	 OT/RzD8aPtz0pOt4lZJD6fo+Wvi0FFRPN5nYEj4eir+M0wL6L78XZXIphQ/ebN+IKJNRF
	 c2r08XwTBRwhyLVm6qOz+KyKVea8v6fxPOqT8pG3hcBEirXmU21wuOHEbmvbE6+4NfcXP
	 jOCRILVgOLGWVX7M16idZTJUbgDJpxU5pXq4Kr6Ffw5YKRqgOKeD3HVzkXNn5N6JVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZvQKeEzb;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA8606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZvQKeEzb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901086; x=1825437086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jarMznw3N3zo3mBDV/tAy2M49SA1R97kedzWcQIgZ0k=;
  b=ZvQKeEzbsNyiGw/qrhwOlV4j7J13dcLZcBnnSUPzsj441hKXc3rN1xZw
   ISkH+3KTg9V1zSmGPCY/3LfPRBR7CN3uAAM2KVFeCH5+OAqMOEPJOQfHe
   pe+HkM3tWhhZYNK1HBj+ux51/P+lgE56zwQk3UYQEPJ5mXbkPMRmWsOMp
   aeuJVc3OQLySP1aomsCWxypm0yoYjQL5DfVQjg/E7LHMvAO6F43CBx7IA
   flvvs2wND7JySLpIYsn4BuzgsU4bt7m7PlVTFSr5kWxcn2pk12ac0tSG2
   uVep2dtV2B/hwzOoQ9VOypALMu2Zq0/2ycFgVUoPNOYm7OhU6rKsvOzzq
   g==;
X-CSE-ConnectionGUID: Kf/EaqitQOqr6o49TiDSNg==
X-CSE-MsgGUID: PcpjrAv/Sa6PrXd4WA2abQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2572529"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2572529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:25 -0800
X-CSE-ConnectionGUID: VOR7+HQUQA6sscZpvUSvqA==
X-CSE-MsgGUID: nKlH6CYOTMaK3Hizciditg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7064848"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:22 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci fixes for usb-linus
Date: Thu,  5 Nov 2026 19:51:01 +0200
Message-ID: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
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

Hi Greg

Some xhci fixes for usb-linus

[Patch 1/5] is a fixup patch for commit 6895dbdc19d9 ("xhci: give back
TDs and clean up ep0 after disconnect") in your usb-linus branch.

It sorts out the issue sashiko reported earlier

Thanks
Mathias

Mathias Nyman (1):
  xhci: keep port link_inactive and connected flags in sync when polled

Niklas Neronin (2):
  usb: xhci: clear stale bandwidth data after hibernation
  usb: xhci: fix 'num_active_eps' accounting on allocation failure

Rishabh Jain (1):
  usb: pci-quirks: always assert xHCI OS ownership

Xu Rao (1):
  usb: xhci: disable the correct slot on alloc_dev failure

 drivers/usb/host/pci-quirks.c | 13 ++++++++-----
 drivers/usb/host/xhci-hub.c   |  6 ++++++
 drivers/usb/host/xhci-mem.c   | 16 +++++++++++++++-
 drivers/usb/host/xhci.c       |  8 +++++++-
 4 files changed, 36 insertions(+), 7 deletions(-)

-- 
2.43.0

