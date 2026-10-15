Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA7D3DDB10
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032332; cv=none; b=qnmuafO06y5hN1TXdqoplERJ6TQjKOttXg/FeYjRRxw8ljhomKROuqYWVF8dFM6toaZdeJyHFrq6smKXINuQNXeZYsxYhjgI+1rIYOgb0cw2CLjsuTDoPBsRQ5mOZsG0bKbuDAVcZHbSd/7Ds6Qsa0et853lGh9D5qfYJhvvUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032332; c=relaxed/simple;
	bh=CEllbMAyUh67mx9yvzDI34nz5d1ihwHNqICRZK7Ly8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wt3JOHyTByW82GsUch14gvE3p5bYFqezumaOH7mmM2nXRB0JKABrWQmRdjfDI79Y6GJ8pGD+vug95EhFxX98EIeTKmMLGFcO/8Tkj7Zm9lyglRhN+7g76ggW66lvn8QU1BhSFjZmx2QVoPaL1TOvmixctmpvHN0lW4AIS7WjS9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgWOz76J; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgWOz76J"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so2095635a91.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 19:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032327; x=1792637127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NL3C3h3ouQDJm0DgBtu/xXmXeKbd5Qh0OWlBa3GyWA=;
        b=AgWOz76JfXNoem8IXymToN5bRRODBRerZuNHgTFZli+WRkwceFWc1Wn7RXvbBT64ef
         40VB0k/+0WHdelFNPFFP7K4Aj7Zu2Cks0azcuJ4NH4oicavYHUIPF6HuX6F4XKxsVaXA
         7v5skfJRQdti3nRImj6vti/K6R17Ce9V6AeoHXT08xA0kgDhqaDj29ojyUI7rrLvMwON
         aP43Xl3zbxxAr7IsrFp3FVeMecbjwwd9hqmFvOcgaUHlbRML4qQT9fpZGRKFtKRwjsKx
         wmdOrjU+bT1vPaHvmnM2w7RJwLeh5ijoEybXpLk1s3FfeIsNqQUIv9KeMQY20OKlN+51
         G/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032327; x=1792637127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NL3C3h3ouQDJm0DgBtu/xXmXeKbd5Qh0OWlBa3GyWA=;
        b=j7uoOntRb4d+QsPDA89hDOWXU+E6nARpX72R6AxqjDOY8/+YitvffvtA7e3HpCAzbS
         N0aSXhrMrpLeJmo+Zs9qgNpEKIn0KcnyF8haaVhHtuz3zsMmOUimZgzX/4fGdDrFRJ1g
         JhJJ3hV6yGE1KyvpjSX8fwD3DRywEidnEd/LRTEgAXGQc9iu0gAg8p4nHRpjaMP+65yb
         eFX7kVSEiXlzOo8jOqFh2CTw5D3rWE/Yrr37b/SEN/VDvT1d7I0GLltuD9kclsSNZAcz
         BcQ7tUkSgtmxJcglipObXw1I7+Pl+6FEMZx/MpDdOuyriPYF7FsUsNWn2GlNPezzzpVg
         wVeA==
X-Gm-Message-State: AFq9FYKARD6IAjb0OKy/2qkkE25wM5L6KafVTNDvjQLC3+/PnnIFflZx
	eAtDaTmi1VVpSWjjIcCdZ5VVOQyaDy2rVj1VaggGdQ+AYVAEDJlaFQv9
X-Gm-Gg: AYBFou3fg35hvxPSLIkxmdLtwqrD5N1WfGlrHDnDEpeB49o6X8Z3ZhkQm/dfu7FzUyK
	mtrxf84DlQb5WIyJoFwyNeX6gGabIHnUSeBxOJ9OLe7t7u0QyyzexGiykWbibSA+Wx11HbtWhrY
	GGJZH0kCpgxRnqL711W5Qi9a3vyKbEx2HF79OMPsjJd18nhrji0P2la93I8952+av2eq39dRhWD
	fDUAZXDMcybi+fe5cykF5IGeMrbkp2pUCPYnKQcXgP6pxs5pIBPcZyppzlyoHHDkBjuGckB3vqM
	UK599tCHAfzbIlfonJMz4BkaZZo28vEPAo+1PjvvVlFO4kDM4LKTsb6P690sjPY8C0ujK7Me+Ce
	Gc1aGKMmQH0wLrrbPErkfOxtzCYMicqMGcLWzJJi5WTYBU3kQWGe62NVBtfzZ5czIiy8KUJuSYe
	ZFkfGlTLmfL++KQfkdyMNyBU9dzAXXF7oqklIiNdPNatXnl3CZte08XIH1dNQhH62sNJJ0sSGq0
	QzTSJOtt68OOwTeQpo=
X-Received: by 2002:a05:6a20:a10a:b0:3e0:d032:31c5 with SMTP id adf61e73a8af0-3e16bdf0d43mr14039255637.25.1792032326841;
        Wed, 14 Oct 2026 19:45:26 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.221.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802a459asm1710303b3a.14.2026.10.14.19.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:45:26 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+02480a85e1a0d4f5@bugs.sh,
	Boyan Liu <yymhvert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()
Date: Thu, 15 Oct 2026 10:45:08 +0800
Message-ID: <20261015024508.3179-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The err: path of ncm_wrap_ntb() frees ncm->skb_tx_data and
ncm->skb_tx_ndp but never clears the pointers. The rest of the
file treats NULL as "no aggregation in progress", and the other
release site, package_for_tx(), clears them after freeing.

When the NTH skb allocation succeeds but the NDP skb allocation
fails -- both GFP_ATOMIC, so this happens under memory pressure
-- the err: path frees both skbs and leaves stale pointers.
The next transmit passes the guard on the freed skb_tx_data,
reads ->len from the freed skb, and package_for_tx() may then
write the NTB header through the freed skb's ->data:

    BUG: KASAN: slab-use-after-free in ncm_wrap_ntb (drivers/usb/gadget/function/f_ncm.c:1044)
    Read of size 4 at addr ffff888108582930 by task kworker/1:2/1623
    Call Trace:
     ncm_wrap_ntb (drivers/usb/gadget/function/f_ncm.c:1044)
     eth_start_xmit (drivers/usb/gadget/function/u_ether.c:543)
     __dev_queue_xmit (net/core/dev.c:4884)
    Freed by task 4999:
     napi_skb_cache_put (net/core/skbuff.c:1471)	/* deferred dev_kfree_skb_any() from err: */
     net_tx_action (net/core/dev.c:5854)
    The buggy address belongs to the object at ffff8881085828c0
     which belongs to the cache skbuff_head_cache of size 240

Clear both pointers after freeing so the next transmit
re-enters the allocation branch on a clean state instead of
dereferencing freed skbs.

Fixes: 6d3865f9d41f ("usb: gadget: NCM: Add transmit multi-frame.")
Cc: stable@vger.kernel.org
Reported-by: co+02480a85e1a0d4f5@bugs.sh
Signed-off-by: Boyan Liu <yymhvert@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78b..be1c2fa36350 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1132,10 +1132,14 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
 
 	if (skb)
 		dev_kfree_skb_any(skb);
-	if (ncm->skb_tx_data)
+	if (ncm->skb_tx_data) {
 		dev_kfree_skb_any(ncm->skb_tx_data);
-	if (ncm->skb_tx_ndp)
+		ncm->skb_tx_data = NULL;
+	}
+	if (ncm->skb_tx_ndp) {
 		dev_kfree_skb_any(ncm->skb_tx_ndp);
+		ncm->skb_tx_ndp = NULL;
+	}
 
 	return NULL;
 }
-- 
2.43.0

