Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79103DBD6D;
	Thu,  5 Mar 2026 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731119; cv=none; b=AdmC4ZmTttEnLftzUYdmzuTHmi1/oNAElYawTkmHBXhsfEzr72/GzICqB3OsF0WZKPj6tVc8VvM+0ll1iNtj4DX3SHi996NYwy0iGfJoh+l8+JzjGcy0lF6qy3b87YWm8MUXdqiFvlxELxdIHAtcxtDpsPdVV95lxtpMVQy28VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731119; c=relaxed/simple;
	bh=ISvSRJh68MMZC9CgEP5gCnJP8dBeh+Gpn2Er1GrHs+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoA8RI2GXKgRHq8OKdhvy5H+v/KmwAlzqPQdY9lymemegh3pFa+nIdGSWYS1e2qndjtTTD5U8yNQu9ATN51y2F047HHm498d+OerBrZUwNCTP/6QDF/xbqCSYcXBXZ4gC/crYtliaSi5ACrgh13mGoWDh0oWLw8zrT70yC3q5DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZhSzA1P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZhSzA1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772731118; x=1804267118;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ISvSRJh68MMZC9CgEP5gCnJP8dBeh+Gpn2Er1GrHs+s=;
  b=VZhSzA1PgEIVd88QXIBhVSAZE2854K4zCJCLO9FR8r+N/etxOzV8rubu
   HNrDDOeD9LOjzRE7XrdIygd5Re2/2Rffjv6PAv9LaF8zS70+CC8S4cNic
   9JxKvzKJUpMYdzw9tin72Rr310iYhse7xBc5RBR2KUmV32/FnlmQc4n5w
   A3Acw8WGuwHmQPLf9Vk6zt/GzxPv9cZ1cf4K1GGaqabjyvFwLip+fpX24
   vKeZLdXbFaZ9FnuIxha65tO7pHQIA8bt9sY9p/MyO2Oj3XMTBii9EpFOr
   bS+gi7oVmsUzgGLTqtjdewNUJktmJX/OCYgXyMewa5je5ntN6hBr5Gv5V
   Q==;
X-CSE-ConnectionGUID: dzxot+HpS3Oo4Pub6KZJog==
X-CSE-MsgGUID: Gw1A422OQCCD5ay1Bp4pyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73874990"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73874990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:18:37 -0800
X-CSE-ConnectionGUID: gzw3uIWBQSyZiGYXk5nGgg==
X-CSE-MsgGUID: RTwvVgV5SH+x079UI+6R8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="217884314"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:18:36 -0800
Received: from ray2.sr71.net (unknown [10.125.109.20])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 211996362;
	Thu,  5 Mar 2026 09:18:36 -0800 (PST)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Remove bouncing maintaner, mark thunderbold DMA test as orphan
Date: Thu,  5 Mar 2026 09:18:37 -0800
Message-ID: <20260305171837.3114157-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This maintainer's email is now bouncing. Remove them and mark
the code as an orphan for now.

Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c2..c32d76a949979 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26300,9 +26300,8 @@ F:	drivers/media/i2c/thp7312.c
 F:	include/uapi/linux/thp7312.h
 
 THUNDERBOLT DMA TRAFFIC TEST DRIVER
-M:	Isaac Hazan <isaac.hazan@intel.com>
 L:	linux-usb@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/thunderbolt/dma_test.c
 
 THUNDERBOLT DRIVER
-- 
2.43.0

