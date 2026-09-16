Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3850C282
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568160; cv=none; b=KUh4L1ibKUCx09BeQVeyW2IYKy5VBsrhwwKjEvsHsAs+ljyWFbTVtigj5zqXVnCepYdNxVcbCbgcpaZn8ZVPa35AoUHECV2TyzTCOGLJ9nchcK3+n6qjouMQjoGjtf41JKWt4Sgev4aa39WSQ5/inU7/gfkYiphg0xXzM3SisUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568160; c=relaxed/simple;
	bh=NYUEChbPLWzihLSVSV2QqS/mX6o3PHvu4kpxBJgAMp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEKpM50puepDb0ffABH8lBuPgGv7M0MYWwLBvuhVhsYkqQhx44UUFfNloxpMQLdqwtDlqLebiHlLhE2Om2yrWNgtOkm49/eJQM3UOSGZiasvOOw30koUUmEiTRfPpr7NyG2hEjqj49T7p+nIOD0SHm3f5yXqxnpdqmnx9gY0z/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVWF68+9; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVWF68+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568159; x=1821104159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NYUEChbPLWzihLSVSV2QqS/mX6o3PHvu4kpxBJgAMp4=;
  b=JVWF68+93/PhEjMNieuPrmi5rzhqEbdfwhv0xPgbrHaYJLMjgjuaoU9a
   PW/tkM3BLpN5kMWvRuvBbZBuM5dOS/ThBGN9WWmyyyqkiRX8lCmr3xd92
   J8MlcIdb74EXY37lrbORCmCg7z1eK3P5IxDLplFFxaWd+KB25ADpTMZxU
   jN8DJh6Lzjv1cxVAjwB5504Y6/JxBc59OkBSak7TwhYii8ooi9CDCvh+O
   mB6WqjoR566GX0kmTLUKDoa7CCG4lhtRgA//md7xNgPid0xRKwEICG84/
   E7CRMQ/BWS3UmMXrh+d3FRZuDi5vXx+Lx5mPZwkG+hKKkWMWl41+eBGUe
   g==;
X-CSE-ConnectionGUID: aX4BUcyNR9WCxQr4vVkttw==
X-CSE-MsgGUID: xKABMLWnS664w2+9mgzeSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="453765"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="453765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:15:58 -0700
X-CSE-ConnectionGUID: U7IzfhEBS3Gx+RhYSWC8wQ==
X-CSE-MsgGUID: lZzeLdNcQ6aNdY7IkeBTiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273889302"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2026 07:15:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 46FAC9B; Wed, 16 Sep 2026 16:15:57 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 05/20] usb: xhci: rework Port Indicator Control macro
Date: Wed, 16 Sep 2026 16:13:54 +0200
Message-ID: <20260916141409.629621-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
References: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the standard GENMASK() helper with explicit values for the Port
Indicator Control field. Rename the macros to match the xHCI specification
defined abbreviation instead of using custom name.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-port.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 752f33e35bf5..dca6d5c7ad1e 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -56,11 +56,11 @@
 #define	PORT_SPEED_SS	4
 #define	PORT_SPEED_SSP	5
 
-/* Port Indicator Control */
-#define PORT_LED_OFF	(0 << 14)
-#define PORT_LED_AMBER	(1 << 14)
-#define PORT_LED_GREEN	(2 << 14)
-#define PORT_LED_MASK	(3 << 14)
+/* bits 15:14 - Port Indicator Control */
+#define PORT_PIC_MASK	GENMASK(15, 14)
+#define PIC_OFF		0
+#define PIC_AMBER	1
+#define PIC_GREEN	2
 /* Port Link State Write Strobe - set this when changing link state */
 #define PORT_LINK_STROBE	BIT(16)
 /* true: connect status change */
-- 
2.50.1

