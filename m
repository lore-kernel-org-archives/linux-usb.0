Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5409475
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 00:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531534; cv=none; b=o98koYBrQisK2XU4sgRVGuxxG/lWWUApQHp0VdZkJZLKLlm/JFKa+5Jj49Y5P/8fmxw58XAdrSZXiZyI2ymHMrV4mpPrS9j02PtT2EbS8OdsAzjoa0WcdOLYc6NdCxE4twg3GHmBOo/AVUkMyjhw2EK11GC7+PjOes2uVsICxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531534; c=relaxed/simple;
	bh=V+7X6K0EWfGP1OaaMzGRkn2sDJ3/GqsZnttFbtGDh1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hjifw5YLVoboepKSDgEi1dHiqM4+Vf+4sTM/4H6YB72rbaisRru3p3EmunH9wreEMhu+7TKBz79ks1IiuL46HDMYQjgnNPjNeJEQ2VdZgVk+OTbpyU9jh746EgQhtee4FaLe7+VC9PjfL/UDR8sL/RnRt0LeJa8PBQBdQtffvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3B38Y4/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3B38Y4/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2a68d01so695825ad.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 17:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780531532; x=1781136332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PzH5XPAUm5+yNxFX2t0GhWCb697L5HAOuPFzZQv/4/s=;
        b=L3B38Y4/cn4V9wpgdGwjwvnlMY1Zde8F0rLQ5Wk+Feb2VNJCEJvmvccDQKLnU4UDW6
         mVX6ZZK27LuGCXVjrrydd0mOswlt6qZyeJkJQoaq50FzrvxWnI+jmgCEkvUgzbX9Ut4b
         QJ5T/9zYUG4adxAHUfssAR+7ojQh6wNMVdjNp7nl9c81T5sDVgXsHgJz98LHGD72cRq3
         2dLR++SAoL8XT5Ny9ybE0ojue1ztEltl4BxllbD0y6nJho/B0WRuoTjrRtA0qOYZK5YM
         JQIUNTh7ikI/K5gXBSbllePeC24XHw+PIcvWFfUbdafvAu7sh16X0KgYkYcBfRmUefKc
         fprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531532; x=1781136332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzH5XPAUm5+yNxFX2t0GhWCb697L5HAOuPFzZQv/4/s=;
        b=UYuzv3dRM/BSwIE0wmJfV8qS3puj5FJcRrYRqQMYOxkXZiQw9u0GUNhvFxhHlPMhGM
         FJBVgNYpwBUCc1BHydqXAYfdgwnFwIFNBHRvdtNHUJ+6XxekEegXrKtsjaeLHqYTLoUE
         sRKjYx8DtFjsjEg1uC3eU4OepZClieyVhpQ3Qu2T3NP5NftOR1sZpm1MoLiZpSIo87E+
         H+jKBkR3sbD18/v1Du8bMQltvfMEdwKgYN44dmQ+PoAcNgmQxjEt3TBGPBB1/1Ca/qUI
         umDSkNdIVq5edCcKqDqYvGrIwfEj7ethvUDTzCVM0t9gfXHVrg+CYPj6OzmHxB1AFBsn
         YO+g==
X-Gm-Message-State: AOJu0YzNnqdi3JZxuGqmi12/3uO+IoTf0eql57saBTG5OY4QIB9OrfVu
	EvYRo5pqwOlG414HraazA3eoBCwrH+sHu2SqPGR35XspBuhWP5NMduf5DIbF5ut2
X-Gm-Gg: Acq92OHNfzJ7dWfIu9g7uMUyBAmR6sWrMKjIcbTOXHupe/CbyMJMEYptShSiLJW1AA/
	VDaeEGOupidsZuKd1Xmp1z8wfcun/warnsFZDurfAnWl9QOIolEtWvFd8BQ71SIYTbna7TLXUVZ
	xTeX2yhBXn2cESPIdj43G3ges6LcfOoi7UjL+cJvpZUH2ufioJqaiFolZkEtZkJqgDZXYwC1k8c
	8bYiXQtShYMFy7NLgnioIJ+0KxO4N2lx59yD9JAg44Fg/Nwi1KHN7awiqCllIm/TksDrhzphY1U
	F949kf2FkQYsAFygVZ1av1KHk1ZBDg/u4fMR57sLNDuNmGCTmUTtG5unfhsFEx69Z/ib/3t2a11
	7pY2I5AkvoOYRwFGvLbnQ3HLVpxNwoMBrqhUO9iJwgKXPOfIJhU1y+gFFzB1jZinEJlBAcNM7ou
	u5EmTDnm2YAxd48AdbBSd1UdfiTcOMZmM2lQhjeaUNPQ8/A6A0RalYqsjXjrOQbBuqK9Hd19sd7
	8zaPdl9yxy2XUYdic4iEqG7MEj+cMa9fB+gilz0AaMj86dmNL9DcXNo
X-Received: by 2002:a17:903:2410:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c163a257e8mr58290445ad.3.1780531532046;
        Wed, 03 Jun 2026 17:05:32 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d45csm51655835ad.14.2026.06.03.17.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:05:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: dwc2: add missing @remotewakeup kernel-doc parameter
Date: Wed,  3 Jun 2026 17:05:13 -0700
Message-ID: <20260604000513.15753-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the @remotewakeup kernel-doc parameter description to the
dwc2_wakeup_from_lpm_l1() function.

Fixes: 5d69a3b54e5a ("usb: dwc2: gadget: LPM flow fix")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/dwc2/core_intr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 7d3e641806f8..9565e6a52725 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -334,9 +334,8 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
 
 /**
  * dwc2_wakeup_from_lpm_l1 - Exit the device from LPM L1 state
- *
  * @hsotg: Programming view of DWC_otg controller
- *
+ * @remotewakeup: Whether this is a remote wakeup
  */
 void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
 {
-- 
2.54.0

