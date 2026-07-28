Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF803B38B9
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221548; cv=none; b=m5Dwn3YvkRo9kKD7PXhAJZhKX8Rl+NioKi1aSrlaoDfDHl5vdae55dYrOBO7ZPXndKje5VHOxl7E2NTIsq9E+9vTkT6ZIKp4LZujwfHuXtX1ES2ytvfu//tU1qzB/da0nWc2P5ZvkdVoFNXNxUuNtQQhh4ImqPRcBg6Zxqbk8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221548; c=relaxed/simple;
	bh=cSK4Dt0T/nUTDJND9NrHCtZrNxU8lJ1HWyPb34zuEc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JBQip86ZxRGciBlcg/VW3dvxHq3sUSheQIiwgxsxh7I60cR55FStTJeSvcidOACmbZBeNH+/MCmObOrXYm0VRdFKPtYQ6PhlQHVoWT8dec4jXyv/2Y5cYmzoXua6eFCaO2PjJYzioSjkHmpRA1jXJFXNVuSFyMJfRuSWXoiXXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amcNwj+i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amcNwj+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785221546; x=1816757546;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cSK4Dt0T/nUTDJND9NrHCtZrNxU8lJ1HWyPb34zuEc4=;
  b=amcNwj+iH55+53nJ7MGSUVc5nPpphP6mt1OtaXnxpTDJUaUXKVPjjYrV
   9mA324toVS0e6k2TzGx77Fe1S+5QmqyJ+gjKEz+m2Ai32YrwlVEZ4Grom
   UlDa7w2nLOeF6985sJUpMoLtkpAcBjDpJKefBR+X+1EtVP9sK7iHGuHWm
   dx45n/SyhVngR82o6jOeGgL+MaIPZDoiRTDR02bhXK4uErOKb2cP90ATb
   THR+YNEi11cFtVeXaCmyFPJ1DzJa7hFpAAerZYNDSg09tA08gIuiMctpH
   DIyMb1UMG6Eu91mDBiyS+oO+jCONiMixWRYETikshTwA95Ap6ZveGZK0n
   A==;
X-CSE-ConnectionGUID: f61FxlL/RzS5nLMfTWkFzQ==
X-CSE-MsgGUID: lyCNdrJHQoOQbrW8mRHjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84924533"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84924533"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:52:26 -0700
X-CSE-ConnectionGUID: S5KBIBAUT4yKuaPV+3hxAA==
X-CSE-MsgGUID: fDbC+VaKRoi24i62wlMORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263119300"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Jul 2026 23:52:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BC7B099; Tue, 28 Jul 2026 08:52:22 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Woody Suwalski <terraluna977@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Initialize ->domain_released completion before it is being used
Date: Tue, 28 Jul 2026 08:52:22 +0200
Message-ID: <20260728065222.2550284-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both Woody and Marek reported following crash:

 BUG: unable to handle page fault for address: fffffffffffffff8
 Call Trace:
  <TASK>
  device_release+0x43/0x90
  kobject_cleanup+0x3c/0x180
  icm_probe+0x19c/0x550 [thunderbolt]
  nhi_probe+0x1a4/0x370 [thunderbolt]
  local_pci_probe+0x41/0x90
  pci_call_probe+0x5b/0x1a0
  ...

This only triggers on the error path when icm_probe() fails and the
domain structure is released, it tries to complete() uninitialized
completion.

Fix this by initializing the completion earlier.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Closes: https://lore.kernel.org/linux-usb/amdezCBiW4fd_DuB@mail-itl/
Reported-by: Woody Suwalski <terraluna977@gmail.com>
Closes: https://lore.kernel.org/linux-usb/62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com/
Fixes: f5cc545f5969 ("thunderbolt: Wait for tb_domain_release() to complete when driver is removed")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 0f795ea58756..35e3c119d5ee 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1226,6 +1226,8 @@ int nhi_probe(struct tb_nhi *nhi)
 			return dev_err_probe(dev, res, "NHI specific init failed\n");
 	}
 
+	init_completion(&nhi->domain_released);
+
 	tb = nhi_select_cm(nhi);
 	if (!tb)
 		return dev_err_probe(dev, -ENODEV,
@@ -1233,8 +1235,6 @@ int nhi_probe(struct tb_nhi *nhi)
 
 	dev_dbg(dev, "NHI initialized, starting thunderbolt\n");
 
-	init_completion(&nhi->domain_released);
-
 	res = tb_domain_add(tb, host_reset);
 	if (res) {
 		/*
-- 
2.50.1

