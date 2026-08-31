Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0C93BD62F
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182325; cv=none; b=kVl344dpnnYElDbtyIyq7c6Jha19lDRbqUFXvEQfwy/hekdTpxFELebKSRIuZpUMP/5/RWM+6I+3VWplIDT4vhYs8EQbRMoH/hPymBdUijjTO8KCxIQdisnxszmj1etynDeUuh5z3W3Sf5xJZ2prrdwT1C//SZ+9vhPe5g31lwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182325; c=relaxed/simple;
	bh=ksRmScYObAhciSA65yVsd2VJmmsly3s1Qrol77m6w0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNn8CZyPvIXIk3ysmueqXMilGs7/1d+rgnY+L/7cTMV8IO1a6hTP61sCOkBfLW0AE+x2sj4D93DVnc//wFPoZiIy2FKKE5DNnsOcqaGhoynbkOAg5CqU+V5naupaAm7ReafQ3Yxvsvro6H9r88RL0NpgAl6DneqheFi/P569dg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVPLSS1u; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVPLSS1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788182324; x=1819718324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksRmScYObAhciSA65yVsd2VJmmsly3s1Qrol77m6w0U=;
  b=aVPLSS1uOe2L6UiUJdali2BcUmy/NdTCA9VKeWXihKguz8EbE8rKFfMP
   96LA47/AGeiZZcCUkHC3FEiHAv6yVrjeHwe3J51ODkd0RcWI7h77oL2TD
   3X7neKMsA6Hope1RFEHV1r7MqF5Oy+AUOrWfpu8COpMZmPQOP3FwosyCK
   NFzs1ovIxUqmkdq6bodKBCZTqye04AaYTSwh0GDvLsQkVF3YPAKZzmGpM
   Mod+pmjtUZEFx8yJIZSzqXgbzvXiqNZ5RRJmR6/OcG3Bm6esE+ZwZJPHK
   VB8Kkt3nQzisgDLHqfc20ECfkT3xXpFc+pVuUwF1baSPvmlJKxjEeN2ZN
   w==;
X-CSE-ConnectionGUID: huAe8eIaTBmwXCPGEBdiQg==
X-CSE-MsgGUID: Au9Gu5JmQ5K0MUDyr3nkKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92276905"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92276905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:18:43 -0700
X-CSE-ConnectionGUID: cz4UeTayQyuyE2ramxGG0A==
X-CSE-MsgGUID: 8D171PpAS1+vdsLdzyVvKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262662288"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 06:18:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EF9529E; Mon, 31 Aug 2026 15:18:40 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Milo Chen <cmh79479@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] Revert "thunderbolt: xdomain: Notify peers after enumeration"
Date: Mon, 31 Aug 2026 15:18:40 +0200
Message-ID: <20260831131840.1982842-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831131840.1982842-1-mika.westerberg@linux.intel.com>
References: <20260831131840.1982842-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e027dba038f0008df9bc9575f5c3e803e90636c6.

Alan noticed that this causes the peers send change properties to each
other continuously.

Reported-by: Borzeszkowski, Alan <alan.borzeszkowski@intel.com>
Cc: Milo Chen <cmh79479@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index c179bd751fe4..05442df0e99c 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1814,7 +1814,6 @@ static void tb_xdomain_state_work(struct work_struct *work)
 			tb_xdomain_failed(xd);
 		} else {
 			xd->state = XDOMAIN_STATE_ENUMERATED;
-			tb_xdomain_queue_properties_changed(xd);
 		}
 		break;
 
-- 
2.50.1

