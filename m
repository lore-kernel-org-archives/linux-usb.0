Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D52F12DA
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787482720; cv=none; b=k4WwgGBXjum7GUn0w7wFRKaqShFstqGTiEyMKdN4o+qGGOJTTdSz5mNOTHCm6h1sv/AHqduyXuf6XdsXBTHbrJJPb0gYlNbFu80nWwVm3pi3LcQPdPu+SsdW3DViS02MzbuBDGtdS1+vS9zpH241XIYSGJ7w7JgSZytcIp3J7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787482720; c=relaxed/simple;
	bh=wROncpKeUxbt0kKltNFOSI8a7i6wNo03M1Fvte12ukI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YjTdQtJCevI4JT8Fz6ryk8v6CplwRVcvpQJIYhIvCrLHPbKfK3APAGDsEV+889JRddFNMMQfSgZqqhTJqYVibLZ/OYlXVUuCtjoWk+RKTmh2Z5R957cHE/MN+0CDkDrEEbmSj7N/NVTZuWgZ3VhS/6EiY47TAdf7OyC62rafdYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4b37fjM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4b37fjM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1c26d7e951so361822966b.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787482717; x=1788087517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkQ2YRc2JCTGvLPDnIVnGeVN2/lZ1zXoH6QWVfIlt0A=;
        b=O4b37fjMYpkKjJuDLiN+fNT8FE9hWlZhy+4ERRHxoe9P3VdO3VWuu/AYc3PFYteMZw
         1tDbd4A0kHuaggOyQeXhAZt4xuHOEpxZyRo30fohLmvp0RDPLM+vbRt/BcCB7fVX9tEe
         1umZmsG+hSNlNQVHJaij1kgCPCbOP6x0GJnL/MEO8BPC+P7wwdthVV8PUHgHkDD8jHkA
         MOQjKdZemJXnpMVuhBobEn6NrAmPDlZpdAj5IlEXolRq1Jy3c8QkeaFCi4DQCLIwY637
         oSZJB07wniLkYwfxnTmvShrzLs5IQb6jZkucx01cDWPovf7u794QD2kIR6XkENjlxjnU
         Oj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787482717; x=1788087517;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TkQ2YRc2JCTGvLPDnIVnGeVN2/lZ1zXoH6QWVfIlt0A=;
        b=Ksuiwb3LWIF1ClFULhmm9qaFoQXp4Xs1XEe2wtxDuziCVRLTrI1WofZ/9KuoeaxeRe
         o5iaRNN6b490gZ5XhvPdJMCg4+qAUGv2XrHTefffw7RDh2iIxP+Mz0UdWpClir9DvUfl
         YOzkusVyDv28NZLMfD65Cy4aSYKHJvRm01qJnQ7JonR9Ho6+C6/GxLL1aTk/WGRuO718
         v6FLgbru0aRmVgOzTOFMxaI3fo+HGlbeZfmJqR8FQmRmJlw14XyiQmb6wdFoiNW417fJ
         yKv34m1zrQtcMCxxb1Dcnlwpd3VyfLswdiGCmXQVOrfrGgHt/5i44BJFCTYDX19EG6P8
         fiag==
X-Gm-Message-State: AFuF++mVkvwNXOWD64uKW54xYQ9kdKVxaPNwzN5B6MIZbf00mfhbMAue
	VcX3x9LsbG5FsL8YFAlq59MrlAt1AnwFRCho4igb73+i9zbXFbfJwV6i
X-Gm-Gg: AR+sD12YRZp+/wMD9Ze/JDuhwtCAmfjmfR7gf1rrLQvLe6tjenYmCwMfOAvNUKcfhSh
	zvVm1rMVKfekTTi8MFaizAor/m2rx1EN+OqVi9w6duDPHvPOW9YU2tV4ftC+d0M+jkdS5F2rCjv
	PVN0vWbE3Jelnvg78/jrau1HQJd51tFziMtTdNAQGHwZbyfawcOXcCIn+keuVduPu1WqHr2mGOj
	8nMlGWDC0KhAWcQ2BrY7t1yhdvabtgCBe4X1pmvFuiJYpavXiDb4Fer7hvN/VrowiIw28RBrMMI
	wlFIpx3Rc5iEtmFYIxj2opkAKS82bF0Ze2WSN89QOaKmF7hrmDaf3SUg8TM62YvsvHI+30tbrqr
	ncYY+3jcSgQZmpLgwhs4sNxTh+7u3nCwq9LKEvmzl2VQNxWkl8Tf0eQz/iYkzdbxTcioZXH5mig
	PZkCk02TrxNlOKJoCpY9axXy1kdHFYqPdzWmQ8ccQJf/T+j2NEhs6YrSavmPt+Pe94Vn8=
X-Received: by 2002:a17:907:9307:b0:c12:1651:17b2 with SMTP id a640c23a62f3a-c246a387ba6mr2264930866b.9.1787482716534;
        Sun, 23 Aug 2026 03:58:36 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm606357066b.57.2026.08.23.03.58.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 23 Aug 2026 03:58:36 -0700 (PDT)
Date: Sun, 23 Aug 2026 12:58:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>, Ming Lei
 <ming.lei@canonical.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: hcd: Cancel BH giveback works on removal
Message-ID: <20260823125831.6ea35650.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Turns out, we do actually need to flush them, because workers use the
'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
after all URBs are completed to track pending completions and possibly
reschedule themselves, see usb_giveback_urb_bh() implementation.

Flushing would suffice if the works don't reschedule themselves, but
cancel_work_sync() is more robust against stray completions.

Syzbot may have found the issue due to unlucky hard IRQ timing. It can
be reproduced by adding udelay(3000) in the work function, disabling RH
autosuspend to maintain the status URB and unbinding a real HC:

[10818.828029] ehci-pci 0000:00:12.0: USB bus 1 deregistered
[10818.828077] hcd_release freeing high_prio_bh ffff88814a950978
[10818.829211] usb_giveback_urb_bh still running on bh ffff88814a950978

Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
Fixes: 94dfd7edfd5c ("USB: HCD: support giveback of URB in tasklet context")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/core/hcd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index ee19628cd653..b17fd8a0a90a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -3053,14 +3053,12 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	mutex_unlock(&usb_bus_idr_lock);
 
 	/*
-	 * flush_work() isn't needed here because:
-	 * - driver's disconnect() called from usb_disconnect() should
-	 *   make sure its URBs are completed during the disconnect()
-	 *   callback
-	 *
-	 * - it is too late to run complete() here since driver may have
-	 *   been removed already now
+	 * Hopefully no complete() callbacks are running anymore; disconnect()
+	 * methods should have waited for them to prevent UAF of driver data.
+	 * However, we still must kill these works so they don't UAF the HCD.
 	 */
+	cancel_work_sync(&hcd->high_prio_bh.bh);
+	cancel_work_sync(&hcd->low_prio_bh.bh);
 
 	/* Prevent any more root-hub status calls from the timer.
 	 * The HCD might still restart the timer (if a port status change
-- 
2.48.1
