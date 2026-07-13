Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BC93E1693
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939725; cv=none; b=BCGfL2WF6DZG+W2dar81PwfNoOoD7BSf1xbta11jinjakm8V/sJcBhXkrt7EZrEKT9SEpbQA/4VhhiacD9ZTMzpGtmINox4+HB3z4mUAM2pup9RCtaja4oNrYN3+wyTTz1HrlQo9JGgKbmyRFDtyblpAu0SOCX7PaCi7A1eEBOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939725; c=relaxed/simple;
	bh=4y0Hp7doLoYhnCCOeMFON+9opGx7KEi9DAgYlcT70II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvaV7PYvYmWzjJiNokl0Doho/oogW1T+p2WqoBZS5hJrYDce6U38sw4K9Uxm+FBxAYJs+KJ0MWZWo7bHQsNqM11/IB6NwlfJy4ZXoqqImczNGnB92B88hZc4dFzMb33131YdpqAxixdCWCpSir+uNQehPUCyKvAOQkH5wdz35As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBwOG1x2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBwOG1x2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939725; x=1815475725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4y0Hp7doLoYhnCCOeMFON+9opGx7KEi9DAgYlcT70II=;
  b=iBwOG1x2fLMNGCwoheBn7jgGmnCWGXKd/h7v2xmQv26WCoGeyNBYwjKd
   fZtGCQYkKYMNbX9bFZyObtoDtj4iB1KcjEb10uoBA9LMZluR/cCZE5qyW
   cgYiW2mgY++XCyAPEWU1uyQqhpG3LBaJe5IfaQ7b2KMYceZf6ajb0Zap5
   02Tg0ZAp5cBthdwIBxYoOcDevbpm7Z2mWjZEe6JgO1282DMSDbO3hJH+K
   NMd9KUbQGbnQCbhkflOG5vDikGJjw1ZbcLc7C/2YxCQaOHUgGas7JAQnY
   S4Vka1gNP6Q5P6zotAZQ8HjFE/8uBRUrfZxjwwWmKY+OxO8K31tNBW61A
   g==;
X-CSE-ConnectionGUID: RGf6JP6/Qgek8yDpknMEww==
X-CSE-MsgGUID: tJjOSFw6TKWE8Tk1XZgwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84323784"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84323784"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:43 -0700
X-CSE-ConnectionGUID: KLW5rtIwSyqYYjZekOH/0g==
X-CSE-MsgGUID: aE0z637CQh2nA9E0vzs6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259821867"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Jul 2026 03:48:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 68F9A9B; Mon, 13 Jul 2026 12:48:41 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 04/22] usb: xhci: rework Port Indicator Control macro
Date: Mon, 13 Jul 2026 12:47:18 +0200
Message-ID: <20260713104738.629612-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
References: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
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
index 89bed19c3c65..7bbc3105aba1 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -56,11 +56,11 @@
 #define	PORT_SPEED_SS		4
 #define	PORT_SPEED_SSP		5
 
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

