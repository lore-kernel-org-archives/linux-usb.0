Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521245;
	b=LIvGrdB6P7CdAIui6LzQGSPTXwDIQad2DpXj5rWO8Istf6ba9TEm2pB7AOpuoVx3Tgxt
	 +RT9xoAFEtN9MudDMAZZCVQ5uQGnclFih4d72C07xwU3drruD7yfORU972zhXgMbbZ/JI
	 xWWyMccs8dlCxppp4F++FXnUdZ6wqkjQ/U8heZyyYwxP04Fgqqc7Tulx5fnw8mf3gW17R
	 baotEgE4j1hjNnszCZtjXKgCoyaBRLvcZwY9x3agaDAtCcZ8GMDZhwNBIWtzL2dJrfxQL
	 iJOZgy86PIkGUFGMyMMu8w6wT1do6hAxZVt14UkDphbNJdYvti7kmzrIX31A6dJSJZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521245;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Jl5V+up9CTnPfRbmE+Zkg2KaP08KTF4AzN0xPfpOgIs=;
	b=OW0fW3cGr9URIxqxaFgIECJeYFSwXOqlzePYafpCICHUNNbwIQ3wFGB/bZktNN8Ql/IK
	 0/Kk20G7vWcZR3wQ8obCvjTVtbNApHltoshgShP2pp+z04PiZH/s9T0e3zSQ7iYH2KKt/
	 ITs1Ulcaoocx+zR02Kp1MC6EmJqXzZZnsFt5pZY9AXbagleR1H4B5BXgcf6BewS1K63El
	 mSWaM1004FdUPRUPFMZeIm97eyPIUycnsmtZPW8YycZU3NVXdzYZsIxVFiUIlzQxmtc7y
	 OsxvWmpPw6uR+TRrlAwlTkbOPI30ynDS7hxQaKWWF+i/WJBJsL0GYhk/tP5wV2OTPMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dGJUpdly;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0286606A31E;
	Tue, 24 Nov 2026 11:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0286606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dGJUpdly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795521245; x=1827057245;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vDMN8UF65wYcm20kgAjfuObbTYXo/nQzVQnxXZpGTjA=;
  b=dGJUpdlyGmiLi+Zq5+1FkvMyYcdDmTC1O9tX5/QTMT7iIjCGf7hShR1B
   ZkMG3fPLJ2LfR0D7cW7m+Rh8UIxd4he5pULmInIvSJtZPo3Bv/Qleol9/
   epNBQipbb4WFLxMRpD1mDOFsm6YdI4TY/Cm9zLN6qSlqabRvzQOQkmmyi
   O6QDhRIzm5ZOQvUz/lsfcSWHIUOF/U3UcwK/1Br25yzeFRaA+LLUnEY1g
   LooREKT4+EtkUb05rVCf6+xJJs6LRTJvtnoOGr39dL4ofl4xXDHgpKwJS
   BpZtyZtXX389PvgQfJF+O3xMJxpOMOIfhaGkvb7y1qYFAxDfgHB+gAGqP
   A==;
X-CSE-ConnectionGUID: mXxxfcYcR/OBERlJrXruqQ==
X-CSE-MsgGUID: c8gzg4kcTfuJlRCvBUk/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4250046"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4250046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 03:54:04 -0800
X-CSE-ConnectionGUID: JGV6zHqbR66eNiMtdp1h8A==
X-CSE-MsgGUID: il9skO5ZQ5aNplA7SgAiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="12138576"
Received: from intel-fishhawkfalls.iind.intel.com ([10.99.116.76])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2026 03:54:01 -0800
From: Jignesh Patel <jignesh1.patel@intel.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	madhusudanarao.amara@intel.com,
	jignesh1.patel@intel.com
Subject: [PATCH v2] usb: typec: displayport: correct DP sink plug/receptacle pin parsing
Date: Tue, 24 Nov 2026 17:22:41 +0530
Message-Id: <20261124115241.2956206-1-jignesh1.patel@intel.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code always reads bits 23:16 for both DP Sink device
direct-attach plug and receptacle cases. As per VESA DPAM v2.1b Table
5-6, the expected behavior is to read:
- bits 15:8 for a DP Sink plug
- bits 23:16 for a receptacle

Example:
- Partner Capability VDO = 0x00001c05
- bits 1:0 = 1, indicating DP Sink Device Capable
- bit 6 = 0, indicating the DP interface is presented on a USB-C plug

Based on bits 1:0 and bit 6, the pin assignment should be parsed from
bits 15:8, which gives 0x1c

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Co-developed-by: Amara Madhusudanarao <madhusudanarao.amara@intel.com>
Signed-off-by: Amara Madhusudanarao <madhusudanarao.amara@intel.com>
Signed-off-by: Jignesh Patel <jignesh1.patel@intel.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v2:
- Added Fixes tag as per the review comment.

 drivers/usb/typec/altmodes/displayport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 263a89c5f324..bbb7917b155b 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -114,7 +114,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
 		return 0;
 	case DP_STATUS_CON_DFP_D:
 		conf |= DP_CONF_UFP_U_AS_DFP_D;
-		pin_assign = DP_CAP_UFP_D_PIN_ASSIGN(dp->alt->vdo) &
+		pin_assign = DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo) &
 			     DP_CAP_DFP_D_PIN_ASSIGN(dp->port->vdo);
 		/* Account for active cable capabilities */
 		if (dp->plug_prime)
-- 
2.34.1

