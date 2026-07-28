Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09B40B36D
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239506; cv=none; b=RhdsIL7agJImxW52+2tMPWXLo64S8a92UWoyB6cAoFB0SBPg7yglb8YQwS+Y+FcIbXLd76pb8LWXXeD1qM7C8A+eOdzPtHmPfbvbFBzFAzy2tVg6gKgGiJ9pjnIvsvrs25aLJiO/m0GtWYgxmE+AY6QXnTIQj9cH2zQtLBdZ6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239506; c=relaxed/simple;
	bh=xTHLrWbtCZWK5vQEUeHMLxIYKV3GwdOqoc6JS+wI0oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QN/wuXfwFhSqQ0+2ixfsM3JrpH6j7YFCemYiRtBURhJXeai+n52EsYaET6fyH6Tp50tc8MJatI0XNIAfoZSoGW0NvB4BOAY3sgc8QJcknwPYALkncQKiOr1mm31361YZez07m0WXoMGwRE5Q4UXUAP/Wbf36aD2ddAK9SAAQB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYWfDVSA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYWfDVSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785239505; x=1816775505;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xTHLrWbtCZWK5vQEUeHMLxIYKV3GwdOqoc6JS+wI0oo=;
  b=gYWfDVSAc5RPaXDyOWQuLWiZ8vqYVgak3WpPDEzf0PiIZ3CCxw9Ff/Hi
   H/2wpYvNf2+hsefxUD9xVfbqUo4PXudknaDpKVFv2uuxKOtuGfcmgCKkT
   ek8MJ9UXQrOu6KScZ9oemCDp+7hyKiaDOxqVh8q0lmTPL2YhQTznjS/Je
   TbI5yX0L4+ojBi/hsEb1pQKXEuXyIBLjyrJcq4J3RvqxatfvjtQOlx9xU
   JitGyynp8nKRB4hodeb5aQmg33jYsCfxtVOaKqXqslf+zZpYF/CX2qn9c
   OLQdELImto+gALsI6hsf1QCiMu5uv5KhFaEZG/nXj82OK6VPfVKZEru+x
   A==;
X-CSE-ConnectionGUID: e4aA052BSUe+H3k9osMaNg==
X-CSE-MsgGUID: g3qSY7ZPSNOLxZAAdvqEPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85939316"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85939316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:51:44 -0700
X-CSE-ConnectionGUID: hZYMJcH3Q26unpEI4fsViQ==
X-CSE-MsgGUID: cUdK15THRke0GVMHushIxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="253353518"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jul 2026 04:51:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 53FED99; Tue, 28 Jul 2026 13:51:41 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/5] thunderbolt: USB4STREAM improvements
Date: Tue, 28 Jul 2026 13:51:36 +0200
Message-ID: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series has a couple of non-critical fixes for USB4STREAM driver and
then makes it work better with io_uring. In addition to that we add a busy
polling mode that can be used by applications that need lower latency than
what is possible with the interrupt mode and worker scheduling.

Mika Westerberg (5):
  thunderbolt: stream: Restore consumer if copying from iter fails
  thunderbolt: stream: Fix possible short reads/writes
  thunderbolt: stream: Support IOCB_NOWAIT in non-blocking I/O as well
  thunderbolt: Make interrupt optional for rings
  thunderbolt: stream: Add support for busy polling

 .../ABI/testing/configfs-thunderbolt_stream   |  15 +
 drivers/thunderbolt/nhi.c                     |  27 +-
 drivers/thunderbolt/stream.c                  | 256 ++++++++++++++----
 include/linux/thunderbolt.h                   |   2 +
 4 files changed, 243 insertions(+), 57 deletions(-)

-- 
2.50.1

