Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA23DDDAB;
	Mon, 17 Aug 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963663; cv=none; b=Mq6jD2qsRdoGZ1bBCGDnvy/Nv8Z0MIBDDWWF3xaQlFzyc52LZPuZ7oBxYiyu33cerA4MyGng0l8Qnmsgf8uNdsX23CMlvcnnOB/vBL+v19+ULFwzZbhN96cA6b+Z1tknIq6aCvX55rEkpw9DsK+MQTLtp4Z0hzjxj2LcLuO1lPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963663; c=relaxed/simple;
	bh=mKlQgb/tpoD+qHB8Fk3kWVW3a6iZQywlMudQjWhR5e8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hse9TQ77A/WXlIP5/7T8Kbr31AjX6817OLuDVxUtgJY242Mvs6rRTjo2JkDMjsUWKOka0ukR0daMIe0WzOYxQDaNF1PeT7xkW+uyt/dlrY3LXxlUzMCBdd1wdC7T3511thrlen6FhQnjlVbrynXU+Tkytbc/gzaoEFeGtEWdagY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOCPSn2R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOCPSn2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786963659; x=1818499659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mKlQgb/tpoD+qHB8Fk3kWVW3a6iZQywlMudQjWhR5e8=;
  b=JOCPSn2RUEqTXrpSvreBYLZfQla55Vrvgley/ovMAR+xBZgx72iwcabo
   z30q9j2z0UUcF77skBW/sbInlhHWI8VNo0Y6AkDQAu+SLw2VNASQFek68
   CETD36A4wZ/ljCnOPWurDAFbSW3x5vTs3U0iWJoUXpzDQtOqYw03LfZtw
   wcSTKQUc8qfSqFdoLib6JeVMf9RjBcMg4WIkmlr7v7cLDXbY0dk1ikWgM
   beO4+sAbdoXCKM+XZfkWU5Obf3+Z/iQhX5VeNgaIAcBbzWUCAfRCaKkQb
   7bmQgdZPCsglGYiOtlab78b1UUh/5JrlzLjWtvy5TZsP/8kNCD0JwJDTJ
   Q==;
X-CSE-ConnectionGUID: 1ZxJR05AQVyCe3C/Vdq60g==
X-CSE-MsgGUID: +ENfMDeHTRG4j9tjXKTBTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87292705"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87292705"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 03:47:38 -0700
X-CSE-ConnectionGUID: IhaHPzawSpyyIUvbLgbmYw==
X-CSE-MsgGUID: 3fKhEvJCQl+nsUOBlYB3RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="303113348"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 17 Aug 2026 03:47:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B4CAA99; Mon, 17 Aug 2026 12:47:35 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] usb: f_mass_storage: Bump local buffer size in fsg_common_create_luns()
Date: Mon, 17 Aug 2026 12:47:34 +0200
Message-ID: <20260817104734.1031300-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC is not happy about the buffer size:

drivers/usb/gadget/function/f_mass_storage.c:2970:48: error: ‘%d’ directive output may be truncated writing between 1 and 9 bytes into a region of size 5 [-Werror=format-truncation=]

Bump the size to get it enough for all possible values.

Note, the existing comment is wrong as size 8 for the whole buffer doesn't
cover 100 mil numbers, hence drop it altogether.

Fixes: b27c08c953e9 ("usb: gadget: f_mass_storage: create lun creation helpers for use in fsg_common_init")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

