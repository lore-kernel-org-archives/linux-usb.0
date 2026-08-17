Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78403E3D86;
	Mon, 17 Aug 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983166; cv=none; b=DiDIT9c5BoThidcfQMrowXmAg7QWVP8i0UzlVLRetu54YMyPA0D1eRXaZ3nJETP+g2Dm5B44jyzZryJ45wgJ/SBXPoC5ILNhcjfCwLdsdz7rz8A1W8dSL4DYkHuEa1HRZfznnMQ5afQvXT/r2eLPujiHiyLA8p5CNGsnM3Hb0dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983166; c=relaxed/simple;
	bh=PTMpg55IZjzJiuy9wBgegxcZqTdph7dEvFdFJK9hy6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q6e0g0Q3/sgvNry1phi/thSEc79BMLbRk2PEhNYFuR0OioxygqIInCq1411908ew/UxQB8yxVa5MBrx2pc4DPU/9/W3X0hTl7mNEsrkbUxsJyraTfpKQKLsDffcgDOaKillhEU7LVwXtQ/72/TckN3cVFPIFCAH7spCM2C3CXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKEqLEe0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKEqLEe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786983165; x=1818519165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PTMpg55IZjzJiuy9wBgegxcZqTdph7dEvFdFJK9hy6s=;
  b=JKEqLEe0rAAf4klQlEvo7SaMTYbFwwZeexxom1Se0fbI7wTljobQ4SZK
   WoTS+cH9+pMdwE2ezlR9EQX9mQH/HpBww2/ltmoxYM9MbecPaI62h0dim
   SGnS7emOn0lZ2jRec4629v6oEKB+P9hgSQ7mOXiF71FyDn0T+H0IGTtW4
   VOl5rd75H/5ph04+t/buKghrygCzmY9oJRrUEvCcABYM+a7M+WsEk7o8V
   sLB59U6zKH59ST3ouWyA1mXxiOhkFx7jpQKHotJXSbVI5xgQuuV/KXsTX
   ctjQw+WACIbYVthNhPOCZJvrW41KpeMQLZUxiTQFnor11SvDvTMaqLy5R
   g==;
X-CSE-ConnectionGUID: 4yyCfsjkQqKjGZyEHDUNFA==
X-CSE-MsgGUID: c6uoo+j4T9Gl2I5FmjrZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="86423517"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="86423517"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 09:12:44 -0700
X-CSE-ConnectionGUID: vPsFIzHYSE+o5g5DgL3NLw==
X-CSE-MsgGUID: kTnQQxzaQ3KXqFdRMobgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="294879694"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 17 Aug 2026 09:12:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id AEC0599; Mon, 17 Aug 2026 18:12:41 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 1/1] usb: f_mass_storage: Bump local buffer size in fsg_common_create_luns()
Date: Mon, 17 Aug 2026 18:11:30 +0200
Message-ID: <20260817161239.1448582-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC (Debian 14.2.0-19) is not happy about the buffer size:

drivers/usb/gadget/function/f_mass_storage.c:2970:48: error: ‘%d’ directive output may be truncated writing between 1 and 9 bytes into a region of size 5 [-Werror=format-truncation=]

Bump the size to get it enough for all possible values.

Note, although cfg->nluns is limited to FSG_MAX_LUNS (16), the compiler doesn't
realize this and complains about the buffer size.

Also note, the existing comment is wrong as size 8 for the whole buffer doesn't
cover 100 mil numbers, hence drop it altogether.

Fixes: b27c08c953e9 ("usb: gadget: f_mass_storage: create lun creation helpers for use in fsg_common_init")
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: elaborated chosen approach in the commit message (Alan), added tag (Alan)
 drivers/usb/gadget/function/f_mass_storage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index b7b06cb79ff5..3d1823b74cd3 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2961,7 +2961,7 @@ EXPORT_SYMBOL_GPL(fsg_common_create_lun);
 
 int fsg_common_create_luns(struct fsg_common *common, struct fsg_config *cfg)
 {
-	char buf[8]; /* enough for 100000000 different numbers, decimal */
+	char buf[14];
 	int i, rc;
 
 	fsg_common_remove_luns(common);
-- 
2.50.1

