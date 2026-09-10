Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F094488225
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043803; cv=none; b=HkB97++lGIqX/kN/0mpJwyBlqSCroMZP7UwtIGDcsDvP7MtQgz4PFOrL0wkRFwR3CBfbsYLTEfe1oE+cGh6WHtGN3rcYtL4kHGcxRv2G0U1TepY9In+5gwRHLWVRTEFr8ufz5P6SpLMjyK8DLcNg1oREmh2iMihlLNL0ITNAno8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043803; c=relaxed/simple;
	bh=ia5WadAeGs+Fgsm1EtAXHzBaYgzN/jFrV5NcMNsLoJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdkrecpbmeJlA8GeLtvW212BzkvDg6rqVn6Ii5iq7A8BXXvVPw3MY4gnOBd3qfDy6P5Yk8Paug17bd56/CUuJw6xnGSjrfWXGmqRIzhAQore4OVdHqVREVGhDiiKrF0OZYRVqr2d2JFfiBc97ZXq0yuN5e5davCDm+R8P5+6lU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2m3oEuU; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2m3oEuU"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7f4976d90so910300e0c.2
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043800; x=1789648600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIFd+cHrpIC9vdD/fyb3euSP0vDo2ewy3pezLbybQdg=;
        b=a2m3oEuUsVqDGvSPkCZTS8hlw81dfCdnuA6zrrplT5mvSXVGsBI30I/JzYfMSsbZBI
         eHkYkKM1/oxigBUkRb31iIpdyZDVuBLnQUy6aot/EHsDju5bj2PxxLyIOZKPBhd43xkc
         zQwnm19oBVeg9MDCdpAzDj3CO9qiE13hIDSGFhVQNKdMUkz+xva2bJ57WNBo5FwOmqb2
         xTaMiUg+DiX37sEsJtknJsbbWGDaXmZ4bo5W20Fv0/pCrekJsha55FzN3zxCgrcDyBl1
         zBLs3970/FvU35YYdsbPNQAtZpU2bfbd/AYreL+GN6pZTIdXwHT71ISSQdssD89sSfif
         83cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043800; x=1789648600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIFd+cHrpIC9vdD/fyb3euSP0vDo2ewy3pezLbybQdg=;
        b=CjjAm0kJc2Bb8jWezcjNJv9BYkN8JT9rI2HL0Z0hB5heqsb2RQTgrc1zIWo05ljT7i
         F5MPVry97lq0sL1mQe9yKB0wv+mp0ZuDKanpZ/APek3uHMtCD+U5Rp96DSm8jTsjRoM1
         9q9xeSH+R2EFf5yRYNAF5RYkA768EJaO7+9efF7HwMJvzm+Ry1R8QUQCdWl+rq2hkyOI
         /hYgTo72MxTv9JiHdc6o40h4ysS/58KIp0+Fdxys9KQ1n+fGXIQVS7Dr/U1QG4gZl2ia
         O9VnK4X5l2Polbr7xVobsO2UkpccDMKMi+y5N5MvObKsFHWG/RIBkKSZJQ301VTdE457
         nWnw==
X-Gm-Message-State: AFuF++lmUdVz4+TJBlTJRuuvxnvG9JQzBiZ5txjIDoBkQJntSfsaPVSX
	ufD+rBkfXrCyTBqKvX+P46qHiIAaZiLxp145dDj8VW6Y0yodnRe3KnTc
X-Gm-Gg: AYBFou3Wy7o0pd3nHAuasUzCBhHotv62gnG7e4/1aSxTVxTSDm6gIqmo50L7RPCogUI
	7oBu7xb+gJHcU8XZKrqoMbYimVGLKrE8BJyOc0/xP2udirf7KD3caev5BVZgHLJ9x+22XQfeJZX
	uma1UHAeNOnyk+eDDab8AWwlzyMUkbZLx0uDTOPW+YmSXFszzCj+l8Ileo5aRtnA/0Jr9B5l7MP
	wiYMETTMu+CYYhSA3DHL2gceBTe3N39cjAFEhT+rAqdmb+Lo4hfxKYUm82nQvqwFuW2Y5cf0jZo
	kZDiPCovqwSaMjnE9zLaoofCW45JXAqGqaudwWyM9CXi1+hJaNiIg+H4obdEU47m+nKNFK9/rRt
	LRqqorSGaX+YEurHOfhE4bglShUlqB4K5FKUkoBgS8b/lzUmLcWOUGfvm2Su3hCEpLY7hODEGn9
	1xPgxSPcAobbFk1NrqsgCyzBpDEyCN1rqL7SCzEk4bJTo5lf11iHQ9AmIbJg8ugL11vkktzAX++
	yUcYCrHGWZr
X-Received: by 2002:a05:6122:21a8:b0:5c7:fb4e:2cee with SMTP id 71dfb90a1353d-5c83343f7d2mr4230105e0c.1.1789043799981;
        Thu, 10 Sep 2026 05:36:39 -0700 (PDT)
Received: from adriano.lan ([2803:9810:3d22:1608:a801:3f8c:3321:84a0])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm14836547e0c.10.2026.09.10.05.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:36:39 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH] xhci: ring: use get_unaligned_le32() for setup packet
Date: Thu, 10 Sep 2026 09:36:29 -0300
Message-ID: <20260910123629.345114-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The setup packet maps directly onto the two little-endian data words,
so read it with get_unaligned_le32() instead of manipulating
bRequestType/bRequest/wValue/wIndex/wLength by hand. No functional
change.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..e428d3794717 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -58,6 +58,7 @@
 #include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
 #include <linux/bitfield.h>
+#include <linux/unaligned.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -3837,7 +3838,6 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_cycle = ep_ring->cycle_state;
 
 	/* Queue setup TRB - see section 6.4.1.2.1 */
-	/* FIXME better way to translate setup_packet into two u32 fields? */
 	setup = (struct usb_ctrlrequest *) urb->setup_packet;
 	field = 0;
 	field |= TRB_IDT | TRB_TYPE(TRB_SETUP);
@@ -3855,8 +3855,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	}
 
 	queue_trb(xhci, ep_ring, true,
-		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
-		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
+		  get_unaligned_le32(setup),
+		  get_unaligned_le32((u8 *)setup + sizeof(u32)),
 		  TRB_LEN(8) | TRB_INTR_TARGET(0),
 		  /* Immediate data in pointer */
 		  field);
-- 
2.51.0

