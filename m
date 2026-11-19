Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108360;
	b=drEhguA2eFQWBO8+KQXzJen6Q/Ops4wJZKPTDynSbU9RI7AvMmqVaU2HKS3/P0KcJJo/
	 q9+48r8tIkP7Gwqi5PmW7TAL7nC2mBXb6qMAzpUmhykd64UsF0rhGNUvn6qQuYvLf0Z0j
	 K5m60J1pL3R6U5XvfDk4x/8M6hPQ2VITk55v/Q5FxkmCowF4KjqlYUXFEz8DQizfTiqbS
	 iIUKh+Hz+8ce6rvTcwrlO6WVvObSC0Soo4JA8VEauggZ90lKXEqnEDRQAnFoTk0Ml0qkD
	 AySrAB6Pe68UJTuasgvm/qZu8rSlvqFwOGKN+srPHtao2Z1MWra5mEwvFQnBGp+4Xuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tQHKYqyyorvWrhJezBkgp7WIxAOyvP8P9EFZyd0T9dc=;
	b=rA9BN5iWr1U/8nitG00lCIiwWlePk8jAJFlYUBoqfznek6Pi47LXs7YwxUITp6a6y8we
	 wgjf8xiI2hpQOzh0T1/gBxB8sGy2V6SNF7vXjI7E7du5kDkXDVEPSuFd1ey2k6aYxw5Q5
	 e+Og4VWOCNkon60EopKP7R/d8qSnMZl8Ere6DQEQzxs1HyemsazH7jeen+hhtCMxAOce0
	 WaQ+fomAfgmzX7nmz8xyPA7uBHvzCx8aZ7WUhQHmU69TKH5OaC3QUOhe1Iyq/3PttB5dq
	 e5Gr6a7xhe9Y6DaoDoFPLgllNchzYCqFwcXUOeUDy/uKKEAB3cJUsLS1guuqHHSzo2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QeoTWTqY;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD516606A619
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD516606A619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QeoTWTqY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108359; x=1826644359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w6W4Xu1MBCX3gnAOqgyaCg+jvcPGASDQPtsCRSBRmG0=;
  b=QeoTWTqYY2RyOjcCKyxucCQ3Ha/Ih6w5WNTL/oCK/t9TmJlcAETquPAW
   GDb7IE/P/RGLQ8YkKc4BOXaWQXVRc2mB4P4bOCATPUm7nQGWUuEMicN1H
   hiRHitHOUSHJo2cU4z4rBtc/Z6aqzfaNGHw4M5wO0M6FZdK7yWK+vjEYo
   3s69ya8j9QEQFBZZEGvS+Xgxk8TZRyL37hrCXsTb10DGcukJ9QuFG9Dpr
   D3euigbdZ5VTRNe891OBCkm3CYPB7xIGchIB4Z7IOiK/qEie8IQclWQaf
   5k/AgX3mCm9YAsX2rmmM6YlOTcruw09OWZClvdLtJ4yLeY5Hev9oBYPKj
   Q==;
X-CSE-ConnectionGUID: 07m3bzCjSZCyZ9M9sqZExg==
X-CSE-MsgGUID: cRSiVJ74RLybHYCRLnuG4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4012996"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4012996"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:38 -0800
X-CSE-ConnectionGUID: lmsqXiiiTTGv9RVFg6ddkA==
X-CSE-MsgGUID: NeYh5xNSTieKnSI88ggQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575071"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 13B37A6; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/18] thunderbolt: Move tb_plug_events_active() before tb_switch_reset_host()
Date: Thu, 19 Nov 2026 18:12:22 +0100
Message-ID: <20261119171232.1616316-9-mika.westerberg@linux.intel.com>
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

We are going to call it from tb_switch_reset_host() in a subsequent
patch so move it there. No functional changes.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/switch.c | 80 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f890..c748158a7044 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1598,6 +1598,46 @@ static void tb_dump_switch(const struct tb *tb, const struct tb_switch *sw)
 	       regs->__unknown1, regs->__unknown4);
 }
 
+/*
+ * tb_plug_events_active() - enable/disable plug events on a switch
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+static int tb_plug_events_active(struct tb_switch *sw, bool active)
+{
+	u32 data;
+	int res;
+
+	if (tb_switch_is_icm(sw) || tb_switch_is_usb4(sw))
+		return 0;
+
+	res = tb_sw_read(sw, &data, TB_CFG_SWITCH, sw->cap_plug_events + 1, 1);
+	if (res)
+		return res;
+
+	if (active) {
+		data = data & 0xFFFFFF83;
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+		case PCI_DEVICE_ID_INTEL_EAGLE_RIDGE:
+		case PCI_DEVICE_ID_INTEL_PORT_RIDGE:
+			break;
+		default:
+			/*
+			 * Skip Alpine Ridge, it needs to have vendor
+			 * specific USB hotplug event enabled for the
+			 * internal xHCI to work.
+			 */
+			if (!tb_switch_is_alpine_ridge(sw))
+				data |= TB_PLUG_EVENTS_USB_DISABLE;
+		}
+	} else {
+		data = data | 0x7c;
+	}
+	return tb_sw_write(sw, &data, TB_CFG_SWITCH,
+			   sw->cap_plug_events + 1, 1);
+}
+
 static int tb_switch_reset_host(struct tb_switch *sw)
 {
 	if (sw->generation > 1) {
@@ -1762,46 +1802,6 @@ int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 	return -ETIMEDOUT;
 }
 
-/*
- * tb_plug_events_active() - enable/disable plug events on a switch
- *
- * Return: %0 on success, negative errno otherwise.
- */
-static int tb_plug_events_active(struct tb_switch *sw, bool active)
-{
-	u32 data;
-	int res;
-
-	if (tb_switch_is_icm(sw) || tb_switch_is_usb4(sw))
-		return 0;
-
-	res = tb_sw_read(sw, &data, TB_CFG_SWITCH, sw->cap_plug_events + 1, 1);
-	if (res)
-		return res;
-
-	if (active) {
-		data = data & 0xFFFFFF83;
-		switch (sw->config.device_id) {
-		case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
-		case PCI_DEVICE_ID_INTEL_EAGLE_RIDGE:
-		case PCI_DEVICE_ID_INTEL_PORT_RIDGE:
-			break;
-		default:
-			/*
-			 * Skip Alpine Ridge, it needs to have vendor
-			 * specific USB hotplug event enabled for the
-			 * internal xHCI to work.
-			 */
-			if (!tb_switch_is_alpine_ridge(sw))
-				data |= TB_PLUG_EVENTS_USB_DISABLE;
-		}
-	} else {
-		data = data | 0x7c;
-	}
-	return tb_sw_write(sw, &data, TB_CFG_SWITCH,
-			   sw->cap_plug_events + 1, 1);
-}
-
 static ssize_t authorized_show(struct device *dev,
 			       struct device_attribute *attr,
 			       char *buf)
-- 
2.50.1

