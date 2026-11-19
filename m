Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108757;
	b=YWAo/I+jRtrvkc3CEJfMrmqSqPgqK9IH+PIqPNs9Fyvgm/ISyNye6/ltGB9iFKXdxxs+
	 Vnj35wKBWCD3EPyhczn3CpguXedPobLURRj92WTAyNHbyFrO19hGDpTFrW/wswlrgVJ/u
	 uygBQapMrHM0CsD89y1wo8CO5It7ai/dl3z6fwg+hQuJYuqAgB+VvlBBTltWFn010nB1b
	 ZU1DuFAmDqITta74XPE86iAGTk/xeHUPBgjW/Ny20AOVpRLe3+Oz/GnnoxLBjpA+8L/2/
	 XgM6eEnQXbtKDDkm/+wwf0ej8VoO1Ch+wNYBz0mTOuAN8G5j2auvQ+Z/aeppgMsNVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108757;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SjqV5rTCbNQRpH8NA8o+ed9jet4ZKeu2BNONKnS0cXE=;
	b=fEXQrDGGtEgo1wLjo3NHv99vLpNNmR2usdvP7by65kzzYTjyRiCj7SJ0Joh23BVxFZkK
	 ZyMoZmLIDky35+Rhg1BpvXPBAI2eWJMT/XLhI0VnhOE0nv5hZy82ihpQszZIEj7lMkXwu
	 Wsp4PHgb9c+or/0kQPJhg2VO7YwiB41Hm8sBn1VOfbFQcz62ZyKGOa8cJ/PWT558cufvm
	 9N0QcvMltjVT2XPBC5E6Bh5rZ1D4+V4CoZ/60nlcyWmUN2tBnjbiXNxwMV1CP+XGulie9
	 cb9Mps620owpaYmAFAS5cnLKbLmD9kbkvEG2abErpRbINFNfvZr+kUuuLqGAy1k9bCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CBskgbXV;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DE7606A326
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CBskgbXV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108756; x=1826644756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qa5N8YxF8MqsrVRwQnxP1TEwot3WwRgxz1P99jlRuDQ=;
  b=CBskgbXVL3kIOmdXGRPQoN3GhrLK2eCfQ7Hnzcc1oPEnAjaplmwiCUh2
   /VzHYNYPJqfn+Koo0/f9d0+Dv5eRIfGuszxf+6rXWkFIpHKMVFk7xXFxJ
   5xtRWFXBg1IgzhvGIZZ9SalCACqkqum05kcAJyO24N0tLzVX0nfxygTGw
   eAig50D84upMYdxk5hS5N2rwsfTI3lDOlwQ9IaTUN/DQRlucTlgeDb+d8
   DRnBD9VTwQVtLURLIXrmuBJ+QE/2NloSMYPtBy81axiyOLhh9xgWzeUF9
   IbsVSlxfz9IckGkWf/tznMtVW1ZnddBmrZdhVuKDCT+yLknlTVWo1X7D0
   A==;
X-CSE-ConnectionGUID: DUj6fHAkSS+C1WM6VMZbQw==
X-CSE-MsgGUID: sE7OyP5eTB+T+ydyjBT0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3958980"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3958980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:36 -0800
X-CSE-ConnectionGUID: AmaitKfvRGWyLYEBIn7/kw==
X-CSE-MsgGUID: uvvTurg6Ru+D/SZ97kOtqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381717"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 07EBEA1; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/18] thunderbolt: Call DP tunnel activation callback with tb->lock held
Date: Thu, 19 Nov 2026 18:12:18 +0100
Message-ID: <20261119171232.1616316-5-mika.westerberg@linux.intel.com>
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

tb_dp_dprx_work() decides the outcome of the DPRX read under tb->lock
but then releases the lock and calls the callback which takes it again.
Between the two something else can grab the lock and change the domain
state, for example stop the control channel, and the callback then acts
on a decision that is no longer valid.

Fix this by calling the callback in the same tb->lock critical section
that decided the DPRX result.

Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation asynchronously")
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tb.c     | 4 ----
 drivers/thunderbolt/tunnel.c | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index acad8461011c..3c4903adb687 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1930,8 +1930,6 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel)
 	struct tb_port *out = tunnel->dst_port;
 	struct tb *tb = tunnel->tb;
 
-	mutex_lock(&tb->lock);
-
 	/*
 	 * If the DPRX read was canceled the tunnel is already being torn
 	 * down by whoever canceled it. Do not touch the adapters here
@@ -1939,7 +1937,6 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel)
 	 */
 	if (tunnel->dprx_canceled) {
 		tb_tunnel_dbg(tunnel, "DPRX read canceled, not activating\n");
-		mutex_unlock(&tb->lock);
 		return;
 	}
 
@@ -1996,7 +1993,6 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel)
 		tb_tunnel_warn(tunnel, "not active, tearing down\n");
 		tb_dp_resource_unavailable(tb, in, "DPRX negotiation failed");
 	}
-	mutex_unlock(&tb->lock);
 }
 
 static void tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8145657835c5..90bc6e42d89b 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1115,9 +1115,9 @@ static void tb_dp_dprx_work(struct work_struct *work)
 			tb_tunnel_set_active(tunnel, true);
 		}
 	}
+	tunnel->callback(tunnel);
 	mutex_unlock(&tb->lock);
 
-	tunnel->callback(tunnel);
 	tb_tunnel_put(tunnel);
 	tb_domain_put(tb);
 }
@@ -1703,7 +1703,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
  * once the tunnel has been fully activated. It can call
  * tb_tunnel_is_active() to check if activation was successful (or if it
  * returns %false there was some sort of issue). The @callback is called
- * without @tb->lock held.
+ * with @tb->lock held.
  *
  * Return: Pointer to @struct tb_tunnel or %NULL in case of failure.
  */
-- 
2.50.1

