Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5071421CC58
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 17:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026661; cv=none; b=JRb1qt5foXauxqMruaZ/+c4ENfywHfeVm2Uy/OkY7zB+vW5zbfTR5ZyGEMrr89T8zh44pMBZNrKwcfu4T8IWGJF+cSF2SIIZ8bIC6pcd8cOCJwWtWjIP5rdd2IymFeuaCZrC7nVjTK+515cuBHYSywYLxEJSPgLmIDBQK3Smxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026661; c=relaxed/simple;
	bh=EckvKhmjVeVHeKuLaueJ9XcWcNUSJPFph3b+GaRBVyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZzRPKOJeScOZmBiFt9NHvSRCItpQMx44OHgQtFQl6SmkT1fGavnvTRGSU6nubL/6KXzYXDs8FUZUoi/kfheMQoN3seLTgZzRAMKreIUjw+qqQbmRQXioRjpbgVY48FeqAf+ePP7mPQJy339nTyHgCikXbR1XzYGNphWknsQZ8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uBzXtOiH; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uBzXtOiH"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cce87d7995so66201776d6.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2026 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1781026659; x=1781631459; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UAYB8i4GZkPqZXfleSx39JYzUNE5fFVjAEfH75o5w8=;
        b=uBzXtOiHKF+DxkIDNa5Cn2z+tN7W6DWVdHkoufEgU798vlx6aY7cmdf5U+lXR1M/xJ
         a6j+cc0AffIyQaZR4YBscU8T6VyoS3ROOt9scJlb/BikZZyX1gh0x+sN4aBSob9vPzpa
         t/1n7f4Z/x/gOIRIOCbwLanvQc7ycu4kQzM9lZ3z2YVJ0uYroNJAstc2SsUNCD3p1VIT
         kRlwfb7FIm/I5hlxniguF3Szaeds04t1nEukujkDcVXnqVL548wdbBEZnzshyjqKzN5l
         fXIZ5iwzb80503ayvjPFEcRIA3P5T9BSHWW4LTm+hgXPYsW/NFOVsKucFjK8Cx/SdFtZ
         JWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026659; x=1781631459;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UAYB8i4GZkPqZXfleSx39JYzUNE5fFVjAEfH75o5w8=;
        b=Mfy8BQKMJ4IUR62kuZ6lIy3GBCbUeTy5KfDQ4e5//sRZIhd8eYF+B5lrpL6ZSNUijS
         zxyAzpXpqWBgXBbAiAUV9cuY1pJ+C9eTQlStZg3PHqUC2BP90YlxwYk+QEI1a5NKFtrT
         3X95vWSKgdpLayZh7NyX5wnGetq+DR+SRk8JLNjLwPP9/FYrQx0tdOGNvCAvInbVbt/b
         ik0Pmxqj3St/jUet3aWfVe2jAH03JO3peTGl46LnRKby9uA/lXgWUkct+NETYzhQ9+p0
         VUIaWw5K5NxjRwHml65RFE0m7uSufD/b55zW25Uvx1pzqFAoeNM0uj3NmnZ1qOGHIMT8
         uYjg==
X-Forwarded-Encrypted: i=1; AFNElJ/jSaaSsMZd2NUOSOb9m8YXaSfuyGV+Ogx6fegLGl20JjO79PEY6O2eRxBLPtwln9q7pVQL6dNb/Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2+sgiRFlw9dTiUuSE8HeRwOVud3irODORe17CCgG0xjVzMER
	qrfDRBlJz7li2o1AfJCG6iGE0Ss//BPBjCxbSZHoHaDdy5J1goHgJWhyJ3VvNmSoPaY7Q84pPEM
	ac2c=
X-Gm-Gg: Acq92OGiG20w6AgsvlCUh15eOiPnQeTAT20lRKDW2U+EkdJlqMNISwDmGyOeGF+CcGL
	d10yu7wteRs1KphtC5C7P6OH3rN6Om7M+ek32gxi+HYPCigyvnyBJ7DMQKnrqZ5ftZeWl2P4aGJ
	5fT7dqfXNzkdVOinQWhdOpPFYsnvIYjmeqMIoPo2IEz8tuvXcZBMGws1naaX/xdS5s9OrQN0kyn
	DsAYailxH/pyWaEy8bZT/pcxTGm/qj3OU5cPQ/+rbq3pycIBgvunRdoQZCbA0WQIwBbs8waQstm
	WOOTdvGR+QXOsjdwiCceUeTlbxk03dePzNLa0Ili/ayzDuWMtTL7wdHq5TwmZtuhDCihOCBDR7G
	NqdsIkBpRG0ieUgqgGHqwycrnHgaUDn4HI65pAgYNEaVbZZgRiOjBZULmMh+NyHaCAFfqQIlPkD
	rbxx9szLWfISSCZM2By5eCM0FaxJZR3CPCkbl0xgYlNY62an1t1tn7jhYS2W0uvJNZXxSIH6PKs
	Hz3l2WlFJMrZMhe
X-Received: by 2002:a05:6214:1cc7:b0:8bd:de6d:c331 with SMTP id 6a1803df08f44-8cf1b751bebmr57564376d6.17.1781026659070;
        Tue, 09 Jun 2026 10:37:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:459a:38a2:9e90:8c7e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd051d61sm208659916d6.29.2026.06.09.10.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:37:38 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:37:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Shuangpeng <shuangpeng.kernel@gmail.com>,
	Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	keithp@keithp.com, linux-usb@vger.kernel.org
Subject: [PATCH] USB: chaoskey: Fix slab-use-after-free in chaoskey_release()
Message-ID: <bb5b1dc6-eb59-43e1-8d26-51e658e88bbe@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The chaoskey driver has a use-after-free bug in its release routine.
If the user closes the device file after the USB device has been
unplugged, a debugging log statement will try to access the
usb_interface structure after it has been deallocated:

[ 2019.819081][T10106] BUG: KASAN: slab-use-after-free in dev_driver_string (drivers/base/core.c:2406)
[ 2019.820996][T10106] Read of size 8 at addr ffff888168e8a0b8 by task chaoskey_raw_re/10106
[ 2019.822432][T10106]
[ 2019.822899][T10106] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[ 2019.822904][T10106] Call Trace:
[ 2019.822910][T10106]  <TASK>
[ 2019.822915][T10106]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[ 2019.822932][T10106]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[ 2019.822984][T10106]  kasan_report (mm/kasan/report.c:595)
[ 2019.823015][T10106]  dev_driver_string (drivers/base/core.c:2406)
[ 2019.823021][T10106]  __dynamic_dev_dbg (lib/dynamic_debug.c:906)
[ 2019.823282][T10106]  chaoskey_release (drivers/usb/misc/chaoskey.c:323)
[ 2019.823290][T10106]  __fput (fs/file_table.c:510)
[ 2019.823298][T10106]  fput_close_sync (fs/file_table.c:615)
[ 2019.823320][T10106]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 fs/open.c:1492)
[ 2019.823327][T10106]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[ 2019.823337][T10106]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

The driver's last reference to the interface structure is dropped in
the chaoskey_free() routine, so the code must not use the interface --
even in a debugging statement -- after that routine returns.
(Exception: If we know that another reference is held by someone else,
such as the device core while the disconnect routine runs, there's no
problem.  Thanks to Johan Hovold for pointing this out.)

Since the bad access is part of an unimportant debugging statement,
we can fix the problem simply by removing the whole statement.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/linux-usb/20EC9664-054E-438B-B411-2145D347F97B@gmail.com/
Tested-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 66e3e591891d ("usb: Add driver for Altus Metrum ChaosKey device (v2)")
Cc: <stable@vger.kernel.org>

---

 drivers/usb/misc/chaoskey.c |    1 -
 1 file changed, 1 deletion(-)

Index: usb-devel/drivers/usb/misc/chaoskey.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/chaoskey.c
+++ usb-devel/drivers/usb/misc/chaoskey.c
@@ -320,7 +320,6 @@ bail:
 	mutex_unlock(&dev->lock);
 destruction:
 	mutex_unlock(&chaoskey_list_lock);
-	usb_dbg(interface, "release success");
 	return rv;
 }
 
