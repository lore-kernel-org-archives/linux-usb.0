Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108759;
	b=GEJWMwURZ92uzxe7s2yeN2ESjNEPKk2dPml9x6MNGxTbfmC08HNiH0HsNsSKjlb4/D5U
	 KmVNzvYBQg+MfXQpW8tyFIhVrXXsq1fJY1qUPeHVJnGeme7qD/BnLrvQKlSgDuOBra0W+
	 0yqhp68oPRbmY3wWcaIN0yUdQcKT1jshr2x/JIBG9p3QmlLY8F5TBr9JxOUH8tB1ENmmo
	 2Ecfqxs4hQvndjfa/+z5qTt9Fhwkc2ACEu2aPXGKBjKrCM2nMDgMvWjvk01XZz/aLNfmu
	 VlR9lCzgTHSKZxCkyTFXuxlYih2ycbnHkbniS47WoDWGAUcZazvEIurTJRfaU81Bpjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108759;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s3wMWqeBQ2x31gIj29dzbloXgpxSAvIcP17vYkAnS7w=;
	b=DZJ9kLEHH5EQYAEIoqP7JZptFAJoFnk4iz23hXNQdX49MgOQTzGSdbh5+XItLN5S+OD/
	 9ZVhKULwz7DHe0UrKs2WnqxbU+GrmGlOxlIiq7xN3Kv/zTxqas61nj2SESu+Xpdz4UFY7
	 Qk5g01WNBrAf9HZM9xp7tP5+vVKCVduUGSJPm8f6M+8BaG3wraw1TvHfE0hxQeUhWe4xD
	 3fRKE8aFE4lR+9OoHQy2bOzFpX5IdvfulOpVt2aGeqDNtPpUJR8oMK/dGJ3QpqusH/DW1
	 lqwYKPxWfsX847mm8hJih8fSWWqH4EUA0JkM+MBbbivpMjl5XjQvW8X6MzZg0c7cPrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UTbsuVtw;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03460A2609
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE03460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UTbsuVtw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108758; x=1826644758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T4RSF259WDkjOko9reghEy6DbFNOR5RIaQLeEajLnXU=;
  b=UTbsuVtwLJ6Mo2DPXqabOAC2ApDsRyofIGPkIdszHCfeq4JYR3Oo5ybZ
   fxsf1vSgOyK/83L/0B4iIRY5o/KPoObAAdYlTtAzuxN6qxdUEo0L2Ecdk
   hTRN2h1ycdxK6/zPtV+0I1FbOYkoQ0eDY2zNPUMyRSxI5I3YPlsXGWGuy
   XmiU5MufCt4tyXyTnS17ojVdTHNQRW7cI/WJttkyAlobrzT3/ma6RmsIM
   Fal/aK7dqbgoJMcmpmc+gweIIVOPi/WuX0ZgJNcB2UzbH3np7RCiBTgF7
   GBHaBdl2jpp1VhSE3ytm6IjTVF9uHErCfLBVlFKy+T5YWH8VQxrhczeWG
   Q==;
X-CSE-ConnectionGUID: Gnp/BS4+QFenqVXuw0JhrQ==
X-CSE-MsgGUID: 8IAH7Ao6TuyGeq9UMnVvdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3959002"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3959002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:39 -0800
X-CSE-ConnectionGUID: 3eRKHjnRT3mF0lC9JHWdwA==
X-CSE-MsgGUID: FLeiQtohRNiwkHMKT5vjHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381741"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 19AB0A8; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/18] thunderbolt: Split host router port reset into a separate function
Date: Thu, 19 Nov 2026 18:12:24 +0100
Message-ID: <20261119171232.1616316-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
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

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

Move the part of tb_switch_reset_host() that resets the host router
lane adapters and cleans up the protocol adapter path config spaces into
a separate function tb_switch_reset_host_ports(). This makes it easier
to extend tb_switch_reset_host() in subsequent patches. No functional
changes.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/switch.c | 88 ++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 39 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 26a4363f94f8..85a2aa67cbec 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1649,53 +1649,63 @@ static int tb_plug_events_active(struct tb_switch *sw, bool active)
 			   sw->cap_plug_events + 1, 1);
 }
 
-static int tb_switch_reset_host(struct tb_switch *sw)
+static int tb_switch_reset_host_ports(struct tb_switch *sw)
 {
-	if (sw->generation > 1) {
-		struct tb_port *port;
+	struct tb_port *port;
 
-		tb_switch_for_each_port(sw, port) {
-			int i, ret;
+	tb_switch_for_each_port(sw, port) {
+		int i, ret;
 
+		/*
+		 * For lane adapters we issue downstream port reset and
+		 * clear up path config spaces.
+		 *
+		 * For protocol adapters we disable the path and clear
+		 * path config space one by one (from 8 to Max Input
+		 * HopID of the adapter).
+		 */
+		if (tb_port_is_null(port) && !tb_is_upstream_port(port)) {
+			ret = tb_port_reset(port);
+			if (ret)
+				return ret;
 			/*
-			 * For lane adapters we issue downstream port
-			 * reset and clear up path config spaces.
-			 *
-			 * For protocol adapters we disable the path and
-			 * clear path config space one by one (from 8 to
-			 * Max Input HopID of the adapter).
+			 * USB4 Lane 1 adapters do not have accessible
+			 * path config space.
 			 */
-			if (tb_port_is_null(port) && !tb_is_upstream_port(port)) {
-				ret = tb_port_reset(port);
-				if (ret)
-					return ret;
-				/*
-				 * USB4 Lane 1 adapters do not have accessible
-				 * path config space.
-				 */
-				if (tb_switch_is_usb4(sw) && !port->usb4)
-					continue;
-			} else if (tb_port_is_usb3_down(port) ||
-				   tb_port_is_usb3_up(port)) {
-				tb_usb3_port_enable(port, false);
-			} else if (tb_port_is_dpin(port) ||
-				   tb_port_is_dpout(port)) {
-				tb_dp_port_enable(port, false);
-			} else if (tb_port_is_pcie_down(port) ||
-				   tb_port_is_pcie_up(port)) {
-				tb_pci_port_enable(port, false);
-			} else {
+			if (tb_switch_is_usb4(sw) && !port->usb4)
 				continue;
-			}
+		} else if (tb_port_is_usb3_down(port) ||
+			   tb_port_is_usb3_up(port)) {
+			tb_usb3_port_enable(port, false);
+		} else if (tb_port_is_dpin(port) || tb_port_is_dpout(port)) {
+			tb_dp_port_enable(port, false);
+		} else if (tb_port_is_pcie_down(port) ||
+			   tb_port_is_pcie_up(port)) {
+			tb_pci_port_enable(port, false);
+		} else {
+			continue;
+		}
 
-			/* Cleanup path config space of protocol adapter */
-			for (i = TB_PATH_MIN_HOPID;
-			     i <= port->config.max_in_hop_id; i++) {
-				ret = tb_path_deactivate_hop(port, i);
-				if (ret)
-					return ret;
-			}
+		/* Cleanup path config space of protocol adapter */
+		for (i = TB_PATH_MIN_HOPID;
+		     i <= port->config.max_in_hop_id; i++) {
+			ret = tb_path_deactivate_hop(port, i);
+			if (ret)
+				return ret;
 		}
+	}
+
+	return 0;
+}
+
+static int tb_switch_reset_host(struct tb_switch *sw)
+{
+	if (sw->generation > 1) {
+		int ret;
+
+		ret = tb_switch_reset_host_ports(sw);
+		if (ret)
+			return ret;
 	} else {
 		struct tb_cfg_result res;
 
-- 
2.50.1

