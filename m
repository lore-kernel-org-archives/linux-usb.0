Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A532415B67
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182326; cv=none; b=COlUm7mJ1zk8/A38D7MHPj6/SBm2Lqol6D1w7tYVl7BuOYAQ5ISnSpw13lXlohiMMvmGJAC9y2x+67oC8z4n0cgTaGNh6pLnvCD0GC/wAra4IaUwnLIyBVDKDIky0GGWq6UcLGLkYPehz/oO/boeBQ1Wzto042eVQAQQ3qEOfo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182326; c=relaxed/simple;
	bh=MXFf6JnGhOrwIX2B1CgOP5i+ogHQCndc4ASsB5Na950=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsYlEODxG/L8TeyImzxivJCoelsuqPL1pqm6XOrYTk8P7ViaPCVcRubBdR/gYH+++mQw8fZE3CZjDVS9dteOs8XM1eUd6LC3DiS6DajqgGS7QaOwvaH8OkT2vmNiF6kmmNeeaGRkKUfyhiS41LcpOOOGt3VORXaPrumiTIZLdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hcl+zQx9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hcl+zQx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788182325; x=1819718325;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MXFf6JnGhOrwIX2B1CgOP5i+ogHQCndc4ASsB5Na950=;
  b=Hcl+zQx98hRYs7LRSfUd44n3ywfrxnaF6pa3QciwkqMAjSL72pfT8llG
   j3GwMhu6eAXQwGptdgnL13Tv4Vo8SbMlv3ADngEaWH4Aw+V/IbefabBV9
   /Jx0JGNl9a0RXVIJ4NcRGPNGzJvOsKIfqL4s1ZVMK9w574yuOCimdYgyA
   44/aZiJkGA/Qfnu1gll5gDWONH1UC7pvEy7yR2DWweGc8j2nVQSrJqv7F
   PuoGyQPHzFvN8F24eQVgpkiz624HPAEltegCji/8T8Cz57WjhJcXhTBLO
   bNYqnSqSR5yXG+n439L8BeKAEN6bnZ8QI+6oK3sS782jf9v/8eMzzcNNq
   w==;
X-CSE-ConnectionGUID: d3WIYYc5R0CXCIKZyYXSUQ==
X-CSE-MsgGUID: mK3Y3ZePT5OpoH7cV6Jb6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88351590"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88351590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:18:43 -0700
X-CSE-ConnectionGUID: /ki265Y8SFGaqPYfb6UW2g==
X-CSE-MsgGUID: gP8REYuYTYOTFtUQA9Rcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267465865"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 06:18:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E719F99; Mon, 31 Aug 2026 15:18:40 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Milo Chen <cmh79479@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] thunderbolt: Couple of fixes for reported issues
Date: Mon, 31 Aug 2026 15:18:37 +0200
Message-ID: <20260831131840.1982842-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series contains fixes for issues we have noticed during internal
validation.

Mika Westerberg (3):
  thunderbolt: Fix KASAN reported use-after-free when request is canceled
  thunderbolt: Use separate lock class for each ring
  Revert "thunderbolt: xdomain: Notify peers after enumeration"

 drivers/thunderbolt/ctl.c     | 63 +++++++++++++++++------------------
 drivers/thunderbolt/nhi.c     |  5 +++
 drivers/thunderbolt/xdomain.c |  1 -
 include/linux/thunderbolt.h   |  3 ++
 4 files changed, 39 insertions(+), 33 deletions(-)

-- 
2.50.1

