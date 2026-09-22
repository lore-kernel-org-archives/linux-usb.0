Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777C4D9F86
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060048; cv=none; b=Nh+W9wkRQlkQPRWPkDEuxvBDqS/vCHc7nBOHeKA2ZjcSB5iG5x9PmHY0+pm2IbssfB6nfQTJCJB7iDhaFBL+oJw7k7knVjhpZ6AQStN/3T6HOA8TDEZ1sE3h5xrpL6xoTQsJj6Irwye4VILXzICiAPcrzgEMParJXaLstD9EhQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060048; c=relaxed/simple;
	bh=oHqQP3+7NLVruPkJ0itGkQ8WwFpYBXYtrBmSWYS1tf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fD66qUzGB9PdtHn/nVr4qPOeYkW4hMiticiEgyKh9lBOTAguLaLAmZU20cvMT6K9rlofW0/bBpxPIpGSL0g9kXeA03ucf2wkpaDvZT15SWha7hxf0XwCJE4GOb/B/bzh0/DW4uo5jtTHzFwy7Mxg3Jw/KvRlo88EYUSmYpXc1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnvQD8x3; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnvQD8x3"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2719260a91.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790060043; x=1790664843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6SRMTHbeLZxqza3uo14NUUFifJ389pqstg6f4EPEW8=;
        b=lnvQD8x3IkL6qen1v7OXPFTRze6ggugqty6R6BldHATjXig/bdSx2ns5kp71KDWgct
         0eJhJJ8Q54GrDOdwWTD8PSs14rxw0pUgSHy8IeNVVFNTRIFLP9saWEpTnlvQapr0tRS0
         Eey63Ayv6ZMxWd5V12/y92Fdvns66omnJ3DJfNemouXXew64gQCL0Z+/Mg9ee0zwoE2R
         fl8r7VctXJ+dAbJcYys05sLLy/Xanlksawl6x7HDg/ae+Gd3r1wsRFpYp0sCflGUQ+0A
         JWhYh3kEqqjedH3Vg9DY+MZDqrUyPYwqI1ZueAgimbA462bKYBBBlFA2PpPq831xC7p9
         LvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060043; x=1790664843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6SRMTHbeLZxqza3uo14NUUFifJ389pqstg6f4EPEW8=;
        b=wBbZo9woFg85IzaiffD+X8h2ZjGoNrbVUvYgNYfEEAM0HhMc+98+lqJqsCj4TMwMJC
         vdBDjqsJvlra38WKlsbL3iMCRAt+HaNlVmjQJDTKG0f2OeErxqK1pHksmmcBbKsj5OgK
         LRYZDKv4tFsQcuURdV9WmUTwW7uoXhi4LMxLGvcQV3fJNn1GMaBEo1iPo1OM7NOnAa8X
         MftwnxtvwRatu43zr74/xxKyKOEMQrmdXsCis9GgB/14KO3+YJbEP3N8m2+U7L5dTXZk
         nVXg2ujp6gZlPG6ovrGDvztbpoVQhak2ROfxpBAkSMQs6KXDK2maaNbIyk+Al+s0bkQ9
         rynw==
X-Gm-Message-State: AFuF++kMHvN175vOfjTyyu4qRuw/1MqLFAbfCHljvgT/OnNQ6pUnfYNV
	rUfaUVeVhybXrVz7jNu6EqWisW5imsJLLYiP8lzKozQ5lN0el7xTPdc+TQw9ut5VQzs=
X-Gm-Gg: AYBFou3vrXV+vwSDoTfdE/5HgNF4Aj0aTv/a40niLvnE1nQmEDUE2YUvnr3KlEY+Cmj
	OvwQFkVJqZ6X+NC0iFaxL1XXoWVUuQsQAV/6WcSAgZg2Xc4kWBhN1H79p9MSgLckt9qU3aCgdnc
	c/66FHUcOpVExFdN1MtGzC1ULpwLN16/troHAZmTYIO1TBpq+nQfnbEcnQC5p1dWeHLqeXE4NMR
	Cn6TZjVIloWQM2pGeLvvKjgltsSK5KgLHY1w/Es5Fxxu0Se110omj0Y2B1shN8rATgwO1eoL6eu
	qjQEkhTvxQHeNByC5SyxKokxOBGM2K12gF3hTUlE0OkPkhSHdfnWigeIlMroXY7j0p7m0uxt/H4
	rjXcwFnmCuA6bTiOSz0osn2pLfHzQ0vASw7GwALvStDIw9vYRdLwAkSY/bxx2OH+16LV5yIEGkh
	5m5WTl9CocFJ5Ex9KoTGu18HvslwRb8PBXccQXCJOv+uqzdlPOxg3ixitiKOtawNV04DQZJSJn5
	YYOq1QfXoyTwv6PlqyhcCwIXnVv/Ul2OJ51O1IP0JCqTO6vrVBErnw=
X-Received: by 2002:a17:90b:17d2:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-3a0730d284dmr234403a91.13.1790060043143;
        Mon, 21 Sep 2026 23:54:03 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e26e70asm1952078a91.1.2026.09.21.23.54.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 23:54:02 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: lpc32xx_udc: Fix a race in lpc32xx_get_frame()
Date: Tue, 22 Sep 2026 14:53:57 +0800
Message-ID: <20260922065357.18103-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc32xx_get_frame() tests udc->clocked before it takes udc->lock, but
udc->clocked is cleared by udc_clk_set() with the lock held, for example from
lpc32xx_vbus_session() when the session is disconnected, which also gates the
UDC clock.

When the test passes on a stale value, udc_get_current_frame() then reads UDC
registers whose clock has already been turned off.  Check udc->clocked inside
the critical section so that the state can not change between the check and
the register access.

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2403,10 +2403,12 @@ static int lpc32xx_get_frame(struct usb_gadget *gadget
 	unsigned long flags;
 	struct lpc32xx_udc *udc = to_udc(gadget);
 
-	if (!udc->clocked)
-		return -EINVAL;
+	spin_lock_irqsave(&udc->lock, flags);
 
-	spin_lock_irqsave(&udc->lock, flags);
+	if (!udc->clocked) {
+		spin_unlock_irqrestore(&udc->lock, flags);
+		return -EINVAL;
+	}
 
 	frame = (int) udc_get_current_frame(udc);
 
-- 
2.43.0

