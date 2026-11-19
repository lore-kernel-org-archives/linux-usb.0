Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108757;
	b=CZ4WPvtFtb8srePgX/5d+71zbgcu3Q7pMho3c+yVyMvFVRa/t3l+1H2EnKICU2oxJNRq
	 UfxMdxAORngIr8PmwAB26cV/kdwpUMcpQ7+t+yG84SswdOc/fogxbAYxwKEVk3zsMhjvu
	 N+I3ULXnQUts8otXpaYFkxgNv0A2NFtIjT+7hfnGJu7ZOYdpFmcFmjsn7Aa6Bn5T2VUHL
	 I0RtWXfUllcUpGetnglXFwCqu+iJTJqeAir0/mFtt4XAUvbTCML0znVnFGSZ+1YBtZt2q
	 zv4jQj6H+iiqZGOPfEKW1iBRw0Z3fjS8M84XrgP8SUU20d6WYSHUCY9uoZl7na0JsmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108757;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nNMftS1fN76hvumciIoOeNpYMiYpMgBNj7yB29WXcYo=;
	b=d41IRPEFLCYofAIeoDa2fyO2uZmmjLCLELiSvBWh92kD7XeGZGJGVCY57KmMLdwI0YDG
	 u0AWXHofKnOjn72bVBVbZhr2u3/3rkNGhroT8oq1bcUopZ3ZZrbrnY0h9uKUarjOzAq8k
	 9fJrHR2QGmvn+ZNrY0x2NmjL/E6KHEwocIZMPC9caZ0nT/fsNSnZe8U6/AzmsW4deGRyx
	 WBIh16DFV/le2GyZWhoS/Ba4UikCUGcj3fNOHK2L7aaI8MkSLiAZyZj6piRIcFaM1oEa1
	 YVoXirt4r43G0MuI1q77zBCPGoMybFIRGoB0nL/6tcxYQcO3lhEf2vnQ/w/6eXhaGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XyYZGsnw;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46708606A331
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46708606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XyYZGsnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108757; x=1826644757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N2M4Ksp+B/BYMj/1Tv2h7S1/voVePgzARlcK6rWbUQs=;
  b=XyYZGsnwIH+Q0CsuddQRAeKfTZJyKzUfQX1ceITvNDU1Eb7FoDpkTuQx
   8pNI8n3VfhyulVF+39BPYiny5ELbcgTMjGX9PAr+g7IVV9OGRqvZkz5B6
   jR1xnK/c9bbhZODM4hTcaY6V0GjyrpoM2dgnLMjA/3KsmKbyIfu8TUw3/
   qBrzzjVVKYBjyYlU/TqXzjQNYbVMWRjG7vWADgLnFxL7nQhhi7/3MFZWn
   n7ubzmhOezgVe5mN/J1xct+Fq2jiRIolhR5vqobd5oQm5ncwnkuQUoubx
   AUKSXWx8S8mKoB+s4dlZPYZ9MhEivtCADYAUupw768xjiNQzzhcsAdsGB
   g==;
X-CSE-ConnectionGUID: VqhhTKOKSD6X6+/4oZEYJA==
X-CSE-MsgGUID: KX4kqDKkRf+5rrNeiQ7TCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3958985"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3958985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:37 -0800
X-CSE-ConnectionGUID: LYC7YEHaSqaWitqyMGzPxw==
X-CSE-MsgGUID: /FNCiaspTFSiDpXY1kHUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381720"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 01AAD9D; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/18] thunderbolt: Tear down DMA tunnels on every XDomain removal
Date: Thu, 19 Nov 2026 18:12:16 +0100
Message-ID: <20261119171232.1616316-3-mika.westerberg@linux.intel.com>
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

Currently we only tear down DMA tunnels when the XDomain is unplugged
(and when service drivers explicitly do that) but not when the XDomain
is removed as part of resume or replaced by a router in tb_scan_port().
The tunnel then stays in the tunnel list until the driver is unloaded
(or the router it goes through is removed).

Fix this by always tearing down the tunnels when XDomain is removed.

Fixes: 7ea4cd6b2010 ("thunderbolt: Add support for XDomain connections")
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tb.c | 47 ++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 655bcc699410..680ed23db0bf 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -83,6 +83,9 @@ struct tb_hotplug_event {
 	int retry;
 };
 
+static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+					  int transmit_path, int transmit_ring,
+					  int receive_path, int receive_ring);
 static void tb_scan_port(struct tb_port *port);
 static void tb_handle_hotplug(struct work_struct *work);
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
@@ -456,6 +459,23 @@ static void tb_scan_xdomain(struct tb_port *port)
 	}
 }
 
+static void tb_remove_xdomain(struct tb_port *port)
+{
+	struct tb_xdomain *xd = tb_xdomain_get(port->xdomain);
+	struct tb *tb = xd->tb;
+
+	/*
+	 * Paths are torn down here so make tb_xdomain_disable_paths()
+	 * from the service drivers no-op.
+	 */
+	xd->is_unplugged = true;
+	tb_xdomain_remove(port->xdomain);
+	port->xdomain = NULL;
+	__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
+	tb_port_unconfigure_xdomain(port);
+	tb_xdomain_put(xd);
+}
+
 /*
  * Returns the first inactive port on @sw.
  */
@@ -1352,11 +1372,8 @@ static void tb_scan_port(struct tb_port *port)
 	 * If there was previously another domain connected remove it
 	 * first.
 	 */
-	if (port->xdomain) {
-		tb_xdomain_remove(port->xdomain);
-		tb_port_unconfigure_xdomain(port);
-		port->xdomain = NULL;
-	}
+	if (port->xdomain)
+		tb_remove_xdomain(port);
 
 	/*
 	 * Do not send uevents until we have discovered all existing
@@ -2491,22 +2508,8 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_recalc_estimated_bandwidth(tb);
 			tb_tunnel_dp(tb);
 		} else if (port->xdomain) {
-			struct tb_xdomain *xd = tb_xdomain_get(port->xdomain);
-
 			tb_port_dbg(port, "xdomain unplugged\n");
-			/*
-			 * Service drivers are unbound during
-			 * tb_xdomain_remove() so setting XDomain as
-			 * unplugged here prevents deadlock if they call
-			 * tb_xdomain_disable_paths(). We will tear down
-			 * all the tunnels below.
-			 */
-			xd->is_unplugged = true;
-			tb_xdomain_remove(xd);
-			port->xdomain = NULL;
-			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
-			tb_xdomain_put(xd);
-			tb_port_unconfigure_xdomain(port);
+			tb_remove_xdomain(port);
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
 			tb_dp_resource_unavailable(tb, port, "adapter unplug");
 		} else if (!port->port) {
@@ -3167,9 +3170,7 @@ static void tb_free_unplugged_xdomains(struct tb_switch *sw)
 			continue;
 		if (port->xdomain && port->xdomain->is_unplugged) {
 			tb_retimer_remove_all(port);
-			tb_xdomain_remove(port->xdomain);
-			tb_port_unconfigure_xdomain(port);
-			port->xdomain = NULL;
+			tb_remove_xdomain(port);
 		} else if (port->remote) {
 			tb_free_unplugged_xdomains(port->remote->sw);
 		}
-- 
2.50.1

