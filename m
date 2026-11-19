Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108758;
	b=FAubxr2t9INPLHsWdLASGmvw1ScIV8IWJF7D7kLatsYqXjj/a5ql3wYtJrvHJoNHxDf1
	 VSFsA1ajOrG+k3UEH/NQTMkfSsxtEO9KWjNfyvQO6hqekYeY8fupXuTO5+M1wrpL2LeRa
	 p1zb7kiHlJrp/MUk+7669VQjbuYOCJR50MIBOLVufndUwsIo1ixBYozYm7MHsvZ7hGujp
	 V/mnZApWt77oAoNKivEBnko6LAK4TrBKNAWc6DlKdkAUxYGAmaS+oVLqD+aS/NmB5+Y1M
	 sSwi2fP5MxBgShweqdXTi9+S83yHXzIs3+hFxB6lfGBzZDpTMgWs8kgnNHhpx5uhI7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uOjIY0gG8UWWf3kqfJXJMnNGzPy+WfDT8ZDptEwBcTE=;
	b=OxKmv1Z2ChxDNc3eqX8nv4NraxtlchVucwOKu0mh6izQRziP1JWEHLAj9VjKKoz1aO/b
	 nYAkBPhPtWW6yHPrRSOF/M3NKgdvscl2pSAZymGWSm3Ef6XO4cFVECiNqkEweFXBpztle
	 6h+dYiqmOIXs+ChX5jtbgkghP+3LNffhKVTl8x5fkDk9XETanzVitgYfXD/V0HDiWJ6dl
	 9BQ+34gDp4iGHCOSiwrIVafVeeHqYKuM29SJen7+X7WQYNxAsb0wxfzRiRmoHZP2ZAxnO
	 QPpdaIQ0aMwVhPmk1lBblEWpMIvAGjKik9nWpTcyUbsGrElDR5r7yYxS7kOs4T4SMrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T9cS8QwD;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E160A2604
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816E160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T9cS8QwD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108758; x=1826644758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g8sdXrAV07YvlLl0g9W1RcY1rtSaCa7rxvAmDnZAo2Y=;
  b=T9cS8QwDpfTARNoDW84eohaJMLjOHtJP+wYDHeobdUIRwn3arMeBrzJq
   At/C7N9FhxP3nfB+doTWJ/y6gpp1GrB++5HFNMIfuzRYnTHjyMTXTlDWa
   PryN3k1+C+CyyUq9+8gCNLJQ/oZUDlDkjMjGguBBRcB9UxwgZRolrcq6W
   hxRHWlnoB+Kwtx9f9Tq5UVvwjdYfDE/2MXkNQ+DfMe870AQ39AbLUyUD2
   licVZd8AyvOpW1exnQxaIL/YyInNmU+YgcV395F8Fjqy1UwQrzMTEcbXp
   VX8g3kxreQfrYy90M4YoY0WFgZfcRK7yju172isF3ztxPjbTvOQ0/qPd7
   w==;
X-CSE-ConnectionGUID: GyJ+WK2fQSuhuPkeJ1N1gA==
X-CSE-MsgGUID: J0flXWoGS1ChNhe2eMUtNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3958999"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3958999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:39 -0800
X-CSE-ConnectionGUID: Zl+v7EhVTeCsRuoCpcdDYg==
X-CSE-MsgGUID: 0eDO6HrNRqSu1RBbPYOzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381737"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2379EAC; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 13/18] thunderbolt: Always take domain lock when tb_tunnel_put() is called
Date: Thu, 19 Nov 2026 18:12:27 +0100
Message-ID: <20261119171232.1616316-14-mika.westerberg@linux.intel.com>
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

When tb_tunnel_put() is called with last reference it will call
tb_tunnel_destroy() to release the memory. In addition to this it also
touches adapter states (releasing the HopIDs and dma_credits). All other
users do this under the domain lock except tb_dp_dprx_work() which drops
the reference without it. Fix that here.

We can drop tb_tunnel_lock too because all the existing users have a
valid reference already when they call kref_get()/put().

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tunnel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index c4e624c94bb0..af10c67997be 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -112,9 +112,6 @@ static const char * const tb_event_names[] = {
 	[TB_TUNNEL_NO_BANDWIDTH] = "insufficient bandwidth",
 };
 
-/* Synchronizes kref_get()/put() of struct tb_tunnel */
-static DEFINE_MUTEX(tb_tunnel_lock);
-
 static inline unsigned int tb_usable_credits(const struct tb_port *port)
 {
 	return port->total_credits - port->ctl_credits;
@@ -200,9 +197,7 @@ static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 
 static void tb_tunnel_get(struct tb_tunnel *tunnel)
 {
-	mutex_lock(&tb_tunnel_lock);
 	kref_get(&tunnel->kref);
-	mutex_unlock(&tb_tunnel_lock);
 }
 
 static void tb_tunnel_destroy(struct kref *kref)
@@ -221,11 +216,16 @@ static void tb_tunnel_destroy(struct kref *kref)
 	kfree(tunnel);
 }
 
+/**
+ * tb_tunnel_put() - Drop tunnel reference
+ * @tunnel: Tunnel to release
+ *
+ * Drops tunnel reference and if it is last one releases the object.
+ * Must be called with tb->lock held.
+ */
 void tb_tunnel_put(struct tb_tunnel *tunnel)
 {
-	mutex_lock(&tb_tunnel_lock);
 	kref_put(&tunnel->kref, tb_tunnel_destroy);
-	mutex_unlock(&tb_tunnel_lock);
 }
 
 /**
@@ -1134,9 +1134,9 @@ static void tb_dp_dprx_work(struct work_struct *work)
 			tb_tunnel_set_active(tunnel, true);
 	}
 	tunnel->callback(tunnel);
+	tb_tunnel_put(tunnel);
 	mutex_unlock(&tb->lock);
 
-	tb_tunnel_put(tunnel);
 	tb_domain_put(tb);
 }
 
-- 
2.50.1

