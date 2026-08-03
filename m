Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1572237F337
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775534; cv=none; b=PLzJUkKW/jX6V9t5nPKHHGBvcQZUJ7C/Nuv34kwV3bZxLfevsKFY9X9o+MwUzThkBZT6XjLe0f+HZyU50s/QuiES9AeGolK5hzOIIeDmvFJUnAAtYA1DXLNpJQrjw1+y0dFCYPMBXuZNJYhGWKK4JOutF7ZWMNwcN4+QXPlnwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775534; c=relaxed/simple;
	bh=nwl6naaxytQX8PQ++Xqoy/eymebArXXzvsHiSLquU04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSXimoUGfknghuEgUtXLcz7D6ft9HL99lOPsr0O/sBMBu6n4kAIBrhz1nym8bQTZR4ETU7D0jTljv7QYuWyU/XAo8+5KSjbZKY/Yk51aFpov8fgfg/ZtnARcmmARe/Xfzz/OqcTjI+3jmFn8RKjIRr/A7VbzfxbZOIDJurecZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dl2Jkv7u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dl2Jkv7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785775532; x=1817311532;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nwl6naaxytQX8PQ++Xqoy/eymebArXXzvsHiSLquU04=;
  b=Dl2Jkv7uK2F2Xy5/E0WP9NR1JNMoROgnA94Z/N7ow/cPrTBlYQeqr79y
   VqbH1MKmYTtWwAQvZpzyonwSrQQ0pWnZQmH//24PugTNRBInDc5wpUAhO
   /hqNJYsPrrDyvpwQ9puE90/ryuoE489XfuUFYlkLr/uXHg2QZ9st9DlKg
   LpPUAphNJsDozAqEod5jvSjr4e5taBKwRWHZ3A26MJRGd6Dt41wz8WtAN
   Cj7yryXZ6FqsrUUBkvNrIKGbCz15PdRZCLrHEO8itFX9fyXH0tWZKsILo
   X4ybvQ5zfCF1AhqWuCjsWze/qy0h0izaNMJERQ3bkDKRYvr6275zd/DLH
   w==;
X-CSE-ConnectionGUID: pLgC9PUTSye+AcDBZ4wFiw==
X-CSE-MsgGUID: yRkXUdFDS4SJ26t/+YNvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86264959"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86264959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 09:45:32 -0700
X-CSE-ConnectionGUID: h3ws93miRu2JJlobfZJqhA==
X-CSE-MsgGUID: E+2osa5BTSKlMIHuNyY4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="299487829"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 09:45:30 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 28FAA1205B0;
	Mon, 03 Aug 2026 19:45:35 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wqvnB-00000000FJ7-4891;
	Mon, 03 Aug 2026 19:45:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/1] MAINTAINERS: Update usbio driver maintainers and reviewers
Date: Mon,  3 Aug 2026 19:45:33 +0300
Message-ID: <20260803164533.58833-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Israel's e-mail address is no longer functional so remove him as a
maintainer of the usbio driver. At the same time, add myself as a
maintainer and Antti as a reviewer for the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88de4216d7d4..d1c26db44ca0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13430,9 +13430,9 @@ F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
 F:	drivers/platform/x86/intel/uncore-frequency/
 
 INTEL USBIO USB I/O EXPANDER DRIVERS
-M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
 M:	Hans de Goede <hansg@kernel.org>
-R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Antti Laakso <antti.laakso@linux.intel.com>
 S:	Maintained
 F:	drivers/gpio/gpio-usbio.c
 F:	drivers/i2c/busses/i2c-usbio.c
-- 
2.47.3

