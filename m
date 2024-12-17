Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F441DC1AF
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423751; cv=none; b=ugjPEQJn8JUWgwoSwu9ijcehMkkwrg01QwEqlOsd/B5xK/PAKGRyyx0hgKyzHkBul02rAcqTPozgpdfPp7QD+RE8NQPtfdwZ2rEsD1gsiGDCpnCRkmsqeIQTWbmdg7neyvLFt9WJUjk3svU2tkxD5Ks63dFhk8mIBP5Sc5n9rLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423751; c=relaxed/simple;
	bh=WkXQnHqsnivLu1FZYtXzm47W5XdZHPbxuCE1F6Qi9O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kc7f2JdS/TbrLKWfftimpq2jYjETSvr44gz/wkKRyGRm2pW8x/nxXoaxPLCtyOoGMYzPB1eIVnlmQb3HT7n+8P4pnaTmCtSImToTh7AIVfEavmeKCyWxEXqtdOZ16KGglHPLCe1ThJGEK74Za5v/1AHW6OfBHrLW2FbIOPML63o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAIeBMF9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAIeBMF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423750; x=1765959750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WkXQnHqsnivLu1FZYtXzm47W5XdZHPbxuCE1F6Qi9O4=;
  b=mAIeBMF9O3AkPKRpFfsggI3zoZFUC1wT0GsByFd7Xx4qIsthoYPZSG1h
   0JjPkHKrAFeGnYgNfVFjNj649AzgHlYmT9cOAWfLH88Iozjgdnb6rr+C5
   8+TKAsB5tCepdcKD3o2OwdDvLbycd3f2ziLqXV+PCIp1n2GZR7BINAuXN
   ApqHoG+fVuinNE6wxaARdFmbuDrma7C3IjXLgNzZWHoGwwlfth0yzxAoG
   ywi/yGIcMMUjM1MQSwfT6h3kjzCfeM8h/0AVR7ZxdICrwptQy6E43fZJC
   2reblvO19SPbtkg1b04ZPlJ2UcBT9qd7fwZ6m2aLgmzsQ7JCZbiw3iYLb
   A==;
X-CSE-ConnectionGUID: Bj4fRSvDTwWO4JOYDI4cjw==
X-CSE-MsgGUID: /SoeY5yxRFabQwkhxFoe1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38511452"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38511452"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:28 -0800
X-CSE-ConnectionGUID: 566nqk/YQa2ixLBL3RPicg==
X-CSE-MsgGUID: Hy4usd2iRf6y5Ji+Nr9QXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102063249"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 00:22:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5198B92D; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 11/12] thunderbolt: Rework tb_tunnel_consumed_bandwidth()
Date: Tue, 17 Dec 2024 10:22:21 +0200
Message-ID: <20241217082222.528602-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework to avoid the goto as it only makes it confusing. Move logging to
happen at the end so we can see all the tunnels this is being called.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 09619190c34a..c625b5b84a7c 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2361,26 +2361,20 @@ int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 {
 	int up_bw = 0, down_bw = 0;
 
-	if (!tb_tunnel_is_active(tunnel))
-		goto out;
-
-	if (tunnel->consumed_bandwidth) {
+	if (tb_tunnel_is_active(tunnel) && tunnel->consumed_bandwidth) {
 		int ret;
 
 		ret = tunnel->consumed_bandwidth(tunnel, &up_bw, &down_bw);
 		if (ret)
 			return ret;
-
-		tb_tunnel_dbg(tunnel, "consumed bandwidth %d/%d Mb/s\n", up_bw,
-			      down_bw);
 	}
 
-out:
 	if (consumed_up)
 		*consumed_up = up_bw;
 	if (consumed_down)
 		*consumed_down = down_bw;
 
+	tb_tunnel_dbg(tunnel, "consumed bandwidth %d/%d Mb/s\n", up_bw, down_bw);
 	return 0;
 }
 
-- 
2.45.2

