Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCCE4A3F18
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438900; cv=none; b=UOkEO4JEPDYQJy3LBf0OFaR0JZgXhDf7fl9lW8lbr1WwAOucRW/acpP/xNRVolTBl2E4yHEySF/tE0l/C9tZE+ObumYd/dtPoxlLCk47JZ4s3r45xO7HfpIE3ZwR+ReiGW8oBtxGq5mUtTbA6lYMsNmG1AfBvgXqlvniCP4hAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438900; c=relaxed/simple;
	bh=FYl2vBPAyXMitMDynzGe+1d5ABy4gGbP5qwCtR+oGOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUCIePjIaaELr0aDYZ14EKlIQXpEQtW+kbuyttB44y7xVW7U64SH9JjTzjeAUz0tjSyRALTGaOaOjXYwUhkjpxuBx9wmhrm5n6cTHau1aBKTIezpmj3UTTm5c9fPYDPAQ4MOm0yLa/j7QVaqLs0sli3nemSCfX0hEdJBaEjHh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Exo2B9qP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Exo2B9qP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788438898; x=1819974898;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FYl2vBPAyXMitMDynzGe+1d5ABy4gGbP5qwCtR+oGOw=;
  b=Exo2B9qPaZejXRJsNmu2Xv//7BxKb4sHJfRaekd7r2tvLSRur6pZmB9T
   2eYUqLT7fkGJkpomCbkv0664pgG/ztVGBUsCFekrIgfI05BOBWsdTx8bN
   NZVrgAP5N5LjDCqpzn0O6+tmuQ04gTBBSteS/GNOoeCQaqxlG4cqxJLtj
   Ffa35pmyk7DjOYmoCohCw9C+fQh6NIXKaMYHGIB8+0m+UJDkr1+wN8Uc0
   VyMNujGnTWg0TAg8hX8eIdEo/0D7qc8dYVKTjhyhGHRiK0/tVwTG8FjQJ
   5IqSsyieNmXmN9/joTwZj+JKFDPyU/UXGLITj7IQ7k1xQzAA0nOvLC0VD
   w==;
X-CSE-ConnectionGUID: F9oJolKqTx+ZQN1Ycxm3Cw==
X-CSE-MsgGUID: 5dODVaLPQQ6TqO6OXuHVQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99250159"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99250159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:34:58 -0700
X-CSE-ConnectionGUID: euaQY7vxTS2fiCHRP1+xhA==
X-CSE-MsgGUID: 6fUuuQJwTEi5YOYA4vdjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267123219"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2026 05:34:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0AA1899; Thu, 03 Sep 2026 14:34:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/4] thunderbolt: Couple of improvements for USB4STREAM
Date: Thu,  3 Sep 2026 14:34:50 +0200
Message-ID: <20260903123455.2048076-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This includes a few cleanups and then two improvements for USB4STREAM,
useful when it is in the default "interrupt" mode. First one is to avoid
read-modify-write on the interrupt mask path and second one is to use the
same ->start_poll() mechanism that the Thunderbolt/USB4 networking driver
uses.

Mika Westerberg (4):
  thunderbolt: Do not WARN about already disabled interrupt on polled rings
  thunderbolt: Clean up ring interrupt register indexing
  thunderbolt: Use shadow copy for ring interrupt mask
  thunderbolt: stream: Use polling with RX ring

 drivers/thunderbolt/nhi.c    | 104 ++++++++++++++++++++--------------
 drivers/thunderbolt/stream.c | 105 ++++++++++++++++++++++++-----------
 include/linux/thunderbolt.h  |   2 +
 3 files changed, 138 insertions(+), 73 deletions(-)

-- 
2.50.1

