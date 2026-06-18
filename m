Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E433EB0EA
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779018; cv=none; b=ilYWhMRrGM9HYjH+DyAwIR9LL1vuHwAwufEn45jUnsS4v2u/6kwanJ7XK7hG1XV/CAUchWlFwpzrAM2VGyhrbj7i3IxqCyQMn/23Y4hFtzcFGVRtthqTiT/KQvrYaCM8vzLGHkMt912xhzHLbz4NTv0kTrYGVma3z7TERJ1BAE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779018; c=relaxed/simple;
	bh=x7X0+e8xTQLe+2vrMOp+iFv6PPg18mMwZ19h/oShKVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GkjIaXEVhwSecyyNScZ0LZyYfKFsEgeL4FKTBY0XS0e/HE58nJ5fFkAb/AtK1wElpuLmoDPJLcRz4zQjMDAm73HAViEuOv8kAh7F9sJkU4IXAJVr0TvgJvqmBlZRNNPHH01wLwk4Yc//y2WX/4bEvh9nBdi7n3Fnjstt0XAahng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+StLUuG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+StLUuG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso916097a91.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779017; x=1782383817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNlDsHP6DW0IVc0BnkhaYECG0YWdHyDwASk939p8MWc=;
        b=D+StLUuG6e8oWec6+Ppsy03DnVPehL/IEe9F0v5aV8A0fHZpTQQ/lYEMgAiCce3/lY
         0qzzMjEpV7GDRzp3lSWSf61wFa4F71RjzPHinXPNyMxePo2jEKajpXLLzuCvowOkrimx
         cJEXQqu48R/LqoKjvB9McanJAzwCPWBWg1c92mL/6NO6YpFYs4DlKut9Mx82IEKEKxbH
         GnyVtIKfziymAZvhDsSxCdODTnoMSYWKoCFpvQe4JEeT4gwD5nCUFJgqN+V1zeORPOzN
         TQwnTn8u/venpEmDOHdSOhtnTt6CaaYLJXXcJadDD0zkmbd25tIfALomAl8Dl3HjUYyX
         gkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779017; x=1782383817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNlDsHP6DW0IVc0BnkhaYECG0YWdHyDwASk939p8MWc=;
        b=T/ALkQMbEx+iIceya32RUGRpnQMYDa71NhizZiPCZ1eID5xv07lLyvqn++oyhSvhco
         q1M7gpOEWFNHHC86Y9vhqi0yg9P8FDQzRvnbpsvstzkysvDR/nzQNWqYPmv9szj7/hNa
         bjfXnME/0ybAOYtl8tKTxBLOxMZyty7DxW1qpQG4Xk9mNg4GNqKfTmeqkes8gPjMCylv
         FCR/BIHgVNMpckwCkEurnQgqoK4tPSMu1NMAUL/jv+mP9qAOuH39Tk+ezd8R4eKl+SYE
         XDZ9mK5TqvGNasTxuYUBTWZ31+u7bIgtnVi56elXBcDhzc3OvAPRh73wGi6khDpmw5l7
         GksQ==
X-Gm-Message-State: AOJu0Yysn9x/C+l4O9jCZZ60uYotXXrI41n7cxrrBMPikvYV39k083sZ
	291V0csRyy9aWL8ZkFDbLFgfOxhsnDEe9x3n16nv/TMnd4agVDilfgC0
X-Gm-Gg: AfdE7cky72lDdh8B/pDO65NluICY4IHeNMuCxMEjKQVG3m3PDQZxiI21DVY9i6diIAx
	x/Le/ArKCBxJUCFSf6bAwnPxm3Xysoq9yJ3Yr6cLZqwFc+2H1xUGptZzh39EX5bozPGtz8K2vm5
	R/HECqnQzb3tU73qN3wi9YeSxutH9C+thbzKgHy4DhdWSNmGcG4ZbfCA72ZQdB4Hkf1E07IeYgE
	n6WTXKayJHixizFLYAluC2mDyh4Bwf9vw7yWaubry5WRnF2oSUluRosfvw/pz9czIhGi2hXdCUI
	Ci2qleRSrn9unH5fbixO+IU+Uo1ikqHFP/6BEg01IThe03Bl+Hyf86DPOxGiTwgZ5NgqG/IE3Bo
	h1h5XziMxVedocuDTTYRUWdC22Yb1iMzGoELi1ntAaBTcsxFXnszTi+TDDnZJYYSUyKbgTJroe+
	ySr35OqFA=
X-Received: by 2002:a17:90b:164e:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-37c9ecff3aemr8600507a91.22.1781779016641;
        Thu, 18 Jun 2026 03:36:56 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521aa164sm9317620a91.1.2026.06.18.03.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:36:56 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Duncan Sands <duncan.sands@free.fr>
Cc: linux-usb@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] usb: atm: xusbatm: release claimed interface on set-interface failure
Date: Thu, 18 Jun 2026 18:36:50 +0800
Message-Id: <20260618103650.3380124-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xusbatm_capture_intf() claims a sibling interface before changing it to
the requested alternate setting. usb_driver_claim_interface() binds the
sibling interface and stores the usbatm instance as its intfdata.

If usb_set_interface() fails after that claim, xusbatm_bind() returns an
error and usbatm_usb_probe() frees the usbatm instance without calling
the mini-driver unbind callback. The sibling interface is left bound with
stale intfdata, so a later disconnect can call usbatm_usb_disconnect()
with a freed instance.

Release the just-claimed interface when usb_set_interface() fails. This
clears intfdata before dropping the claim, matching xusbatm's existing
release helper and leaving the caller's rollback to handle any previously
captured interface.

Validation reproduced this kernel report:
KASAN slab-use-after-free in __mutex_lock+0x12a/0x1980
Workqueue: usb_hub_wq hub_event
The buggy address is located 224 bytes inside of freed 2048-byte region
[ffff888114339000, ffff888114339800)
Read of size 8
Call trace:
  dump_stack_lvl+0x66/0xa0
  print_report+0xce/0x630
  __mutex_lock+0x12a/0x1980
  srso_alias_return_thunk+0x5/0xfbef5
  __virt_addr_valid+0x188/0x320
  kasan_report+0xe0/0x110
  usbatm_usb_disconnect+0x52/0x440
  __lock_acquire+0x466/0x2260
  rcu_is_watching+0x20/0x50
  rpm_resume+0x705/0xab0
  usb_unbind_interface+0xf3/0x400
  device_release_driver_internal+0x298/0x330
  kobject_put+0x47/0x2e0 (lib/kobject.c:730)
  bus_remove_device+0x1c6/0x2d0
  device_del+0x218/0x540
  kfree+0x2f9/0x530
  kobject_put+0xf4/0x2e0 (lib/kobject.c:730)
  usb_disable_device+0x180/0x3b0
  usb_set_configuration+0xab/0xf20
  blocking_notifier_call_chain+0x5f/0x70
  notifier_call_chain+0x60/0x1e0
  usb_unbind_device+0x40/0xe0
  __device_attach_driver+0xf1/0x1a0
  bus_for_each_drv+0xf9/0x160
  trace_hardirqs_on+0x18/0x130
  _raw_spin_unlock_irqrestore+0x44/0x60
  __device_attach+0x133/0x2a0
  do_raw_spin_unlock+0x9a/0x100
  device_add+0x9b9/0xc10
  add_device_randomness+0xb7/0xf0
  usb_new_device+0x492/0x870
  hub_event+0x1b10/0x29c0
  lock_acquire+0x187/0x300
  process_one_work+0x475/0xb90 (kernel/workqueue.c:3200)
  lock_release+0xc8/0x290
  process_one_work+0x4d7/0xb90 (kernel/workqueue.c:3200)
  __list_add_valid_or_report+0x37/0xf0
  worker_thread+0x2d8/0x570
  kthread+0x1ad/0x1f0
  ret_from_fork+0x3c9/0x540
  __switch_to+0x2e9/0x730

Fixes: 233c08e0ff30 ("[PATCH] USBATM: xusbatm rewrite")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 drivers/usb/atm/xusbatm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/atm/xusbatm.c b/drivers/usb/atm/xusbatm.c
index 0befbf63d1cc..a9e67aa136f3 100644
--- a/drivers/usb/atm/xusbatm.c
+++ b/drivers/usb/atm/xusbatm.c
@@ -35,6 +35,9 @@ static struct usbatm_driver xusbatm_drivers[XUSBATM_DRIVERS_MAX];
 static struct usb_device_id xusbatm_usb_ids[XUSBATM_DRIVERS_MAX + 1];
 static struct usb_driver xusbatm_usb_driver;
 
+static void xusbatm_release_intf(struct usb_device *usb_dev,
+				 struct usb_interface *intf, int claimed);
+
 static struct usb_interface *xusbatm_find_intf(struct usb_device *usb_dev, int altsetting, u8 ep)
 {
 	struct usb_host_interface *alt;
@@ -62,6 +65,7 @@ static int xusbatm_capture_intf(struct usbatm_data *usbatm, struct usb_device *u
 	ret = usb_set_interface(usb_dev, ifnum, altsetting);
 	if (ret) {
 		usb_err(usbatm, "%s: altsetting %2d for interface %2d failed (%d)!\n", __func__, altsetting, ifnum, ret);
+		xusbatm_release_intf(usb_dev, intf, claim);
 		return ret;
 	}
 	return 0;
-- 
2.43.0

