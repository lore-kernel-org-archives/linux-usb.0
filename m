Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400372;
	b=vL51DVrnxgpehoP41jtZRg7M0gL6+pzK1MskPBbKhMSu8og5haRk36qgcV0UAXlwzy4t
	 PFYPD6hFASw4pgLcoX1drblczlO9QePmAKP6nAuwlOM5jcRDQzJg5Rwe8yvuisQyuVlRD
	 9dyBzAqx92ckCBs34wigO3R2Di2yGVkEd4LMMehqqi03cDufDbOntBpNDaSjBafi8bP1G
	 WsfwMqtzUfFiH/0LN5DtzLNL38WXkVw+Hn47ytcGZsYj00Qf4kXnMT4ufw7sMUhvKrfK8
	 OJ8Cward46byqaqqCva/W7Y0B77oJ0UKeGCZTV9BfEli856rF6ze577JcJVwKn26U1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400372;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Knxk3WTu0JrykHzA6hEarKkEvqlhmu3XzNuaF2LqpoY=;
	b=sVtePV3x31FxDZ2h6bwwXROx/pR3nfDQ/PZilgbYif4brd+HpP3DU7p5oY7AyWJFrZg1
	 3p8eOLWWWB+OZNaEKcPdcvoAGNjNvr0y8fHmlYq3yp13IqCKp8Osrx69228vzslOko3T7
	 AkvNy1I6O1HqJEQCAxqwtnghaCwzlX8PPdgg1p9xId+D32hOOKPQCZGRRtJGVV7KaGlST
	 iz3293YBVRxmMRwMpTUMvAv5tfOjXkH1BbPhAjdybWeBmXQSW/7CBiCKfYegA3i0ltr/D
	 a1QELpRIIlOLFIrAzbT30UW3kdLPVVGE+f0wswiKjRnQih9F4R1ebIeE2w32M4p/cyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VDmnB14k;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B031606A326
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B031606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VDmnB14k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400372; x=1825936372;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rBNOENBeudy9/Ymf6wNtC76Atz7vZznqXZ/2VzO3w6E=;
  b=VDmnB14kH59XUMPhZiFreyPegfK1KZ6BGJFeExvWXLF/mqsEDENa4Ztz
   9o2yyUZ7fCPZth1mB+bbuuEHTgG9xzjI0xH34JCtbmvzbAtkw/eEnwoqi
   npSxfRoTsexpIRVf1RmjUmBDzQ4su5OfqJ65l1O8G1za/lB/QTN4XCacI
   wuzLe2Hn4UGZJux7ix200K2/gcwpqB7olV0hunXO5bRIj7zUe7I6i2EFx
   JxDigL/ZTJ34Uu8T/FsI1ioA5SWkod2vUPFmn0q02mY4iS5p6zb3clHAr
   e9D+cRk6gfFCJuwg+q2ypz173h2f5rKYLaq6NOavee2PdQ3A/4qT6GA85
   A==;
X-CSE-ConnectionGUID: /E5ZD0EySa2UM8o+VeHZww==
X-CSE-MsgGUID: rDTgn4ZtQzi42bsWw31cwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3071453"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3071453"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:32:51 -0800
X-CSE-ConnectionGUID: qk+vGxjBQOe4ys7Q96n6ig==
X-CSE-MsgGUID: jFY/oyu5REKJEveemO+bZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="10197365"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 11 Nov 2026 04:32:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 854999B; Wed, 11 Nov 2026 13:32:48 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: debugfs: Use DEBUGFS_MODE with path config space access
Date: Wed, 11 Nov 2026 13:32:47 +0100
Message-ID: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
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

Commit 398da8e64321 ("thunderbolt: debugfs: Add write capability to path
config space") added write support to path config spaces but forgot to
update the mode accordingly. This fixes it to use correct mode via
DEBUGFS_MODE.

Fixes: 398da8e64321 ("thunderbolt: debugfs: Add write capability to path config space")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 6a6875eb07ba..0d9f41a0f2cd 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -2519,7 +2519,7 @@ void tb_switch_debugfs_init(struct tb_switch *sw)
 		debugfs_dir = debugfs_create_dir(dir_name, sw->debugfs_dir);
 		debugfs_create_file("regs", DEBUGFS_MODE, debugfs_dir,
 				    port, &port_regs_fops);
-		debugfs_create_file("path", 0400, debugfs_dir, port,
+		debugfs_create_file("path", DEBUGFS_MODE, debugfs_dir, port,
 				    &path_fops);
 		if (port->config.counters_support)
 			debugfs_create_file("counters", 0600, debugfs_dir, port,
-- 
2.50.1

