Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793567687;
	b=Xb2bihFE5zV0zjssGPdS8PUYIAjtVHOa8UawMrqtIw5lNjGnVABsSeubDj/ksZ/MiFU7
	 999+ozUYLyTHLJ1pKJ7YheBKaK7iouG2078KaHk9db1v41smPL8kJmHPG/aS69ebkC9Iy
	 021SFisw3VTQk24w7jRZSCbNrXuSWCKFRSudmgxko+b/VjrkHO+21rb/2gp98pipBSEVz
	 3xoxp6uA0s43hddHYhn4r2QJtGpirMCNj2IaqG5bFl6NS6Q8MgXyAWtUWWgqU2qhAImsW
	 GK7/okWYXqMURcBeaSJJYeQaFWx8UMvhnqjogFj2mtIp9byDbKAssyBIwF6G8D+MaFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793567687;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=AvHAhlRhkPgLrmgjNSyRuNLh9GxQ9LIIjKdvXbwFnMA=;
	b=t56IkCd8CI21GJaBF0rvjn1NMDnE08TOsIFmx9eFgxAUPhTG1squLLNciTm/IWsW9LKa
	 fGuKT2NF7UPqVvQEvuC2kpDs5YGuiw9Wy1257VuiKH/ZwjqHibXgW2befCQjOzwYEekOp
	 VawsQv3q/+XwbaXhcphbu4zJ2/F7deLf/mUB4dnGkT+qQXYa+7hPiu2QRuJ2HNdfDxnob
	 rcb+M2AHEp6os/AqWbefhkQGgyzkLmM1C2eIZNjb+5LtTIqJRLk9VbJu3Tll4OlaE7ycI
	 oSez1cMq+zwH8rVitIWXZ6Q2NGj9TTRFVNPTFYUe3NSL5m2YCs0kitM5UAEp4VXF94g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E823A606A327
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 21:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E823A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5640a2d9708so3388693b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 13:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793567686; x=1794172486;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AvHAhlRhkPgLrmgjNSyRuNLh9GxQ9LIIjKdvXbwFnMA=;
        b=UeL1zMrCV5zUZWKolb2b6panFV2WNLhIgjuMLs4cB1W/E4q8bXySpo4olS5HitDVBa
         bh56RmoJxVtGSBX7y+4RCrkvd9MaJV4eVoageuMjp309uyqiuDJ9+BLNFGojCBIXqK/h
         nR7g497zYUlgAdilDTKZ4ZAE7zQlOygo7QV4f/XwmbX8Ftqx/oV6CZa8R+qj8Fwkz/iX
         7V7xt1RO3KDfiiGqyc/sYlyWi7wEQAeVdrZS+ZLpgqumQymyc0Ac0qLXXot14jqCahTu
         OrN/2S0vK/9EveXh9/FDpDk7v4Cus8Hr5hc04edznsHeIyCYgooqQ0vueBM7UJfCDVhV
         g97w==
X-Forwarded-Encrypted: i=1; AKwUvBxfkJL7ocTOxV2WL74c7RvyKKoUNOtBDt95y0R6m6gbUQsr1isDmY/rJRk+hYt2HbwJsTR2aokUa3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNi2CcHCrQ4lOT9hwBGTqK7RhD8sntsdvmc67+r10Ze5MByZay
	4aOpm3FK3YbzqDRV4AGlH8pc5iYg0lZ6up7T/aDXoEzroI7T/2KuoVUmTL+D63idPyIfZDOLes1
	qOFodCA+t1IIO3YdiMlowe54qW0bQYMyhRXOwbtzJw19bIt7lHz77iiqjIMA=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11cb:b0:55b:f88d:6ebb with SMTP id
 5614622812f47-5640df0a2eemr5490383b6e.54.1793567685852; Sun, 01 Nov 2026
 13:14:45 -0800 (PST)
Date: Sun, 01 Nov 2026 13:14:45 -0800
In-Reply-To: <20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7abc5.64e51036.15cf6a.001d.GAE@google.com>
Subject: [syzbot ci] Re: media: em28xx: fix v4l2 use-after-free after failed init
From: syzbot ci <syzbot+ci612f2c3be50482a3@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, hverkuil@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, stable@vger.kernel.org, 
	syzbot@syzkaller.appspotmail.com
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot ci has tested the following series

[v1] media: em28xx: fix v4l2 use-after-free after failed init
https://lore.kernel.org/all/20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com
* [PATCH] media: em28xx: fix v4l2 use-after-free after failed init

and found the following issue:
possible deadlock in em28xx_release_resources

Full report is available here:
https://ci.syzbot.org/series/92e27f7a-9ca9-4693-ad76-730262f6efd0

***

possible deadlock in em28xx_release_resources

tree:      torvalds
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
base:      cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
arch:      amd64
compiler:  Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
config:    https://ci.syzbot.org/builds/5e867cfe-3c44-46f3-be9a-3394e10312c7/config
syz repro: https://ci.syzbot.org/findings/de514af7-755a-455f-9075-91732cf09a76/syz_repro

em28xx 1-1:1.0: Closing video extension
em28xx 1-1:1.0: Closing input extension
============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
kworker/0:3/5059 is trying to acquire lock:
ffff88801cd25cf0 (&dev->lock#3){+.+.}-{4:4}, at: em28xx_release_resources+0x75/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3796

but task is already holding lock:
ffff88801cd25cf0 (&dev->lock#3){+.+.}-{4:4}, at: em28xx_v4l2_fini+0xb7/0x3f0 drivers/media/usb/em28xx/em28xx-video.c:2431

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&dev->lock#3);
  lock(&dev->lock#3);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by kworker/0:3/5059: 6, last CPU#0:
 #0: ffff8881032cb948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8881032cb948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8881032cb948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3460 [inline]
 #0: ffff8881032cb948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3578
 #1: ffffc900036cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900036cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900036cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3460 [inline]
 #1: ffffc900036cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3578
 #2: ffff88816eeb71d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1109 [inline]
 #2: ffff88816eeb71d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5917
 #3: ffff88801cdfc1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1109 [inline]
 #3: ffff88801cdfc1d8 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xfc/0x9a0 drivers/usb/core/hub.c:2346
 #4: ffff88801ce5a1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1109 [inline]
 #4: ffff88801ce5a1a0 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1046 [inline]
 #4: ffff88801ce5a1a0 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xa9/0x7d0 drivers/base/dd.c:1377
 #5: ffff88801cd25cf0 (&dev->lock#3){+.+.}-{4:4}, at: em28xx_v4l2_fini+0xb7/0x3f0 drivers/media/usb/em28xx/em28xx-video.c:2431

stack backtrace:
CPU: 0 UID: 0 PID: 5059 Comm: kworker/0:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_deadlock_bug+0x27a/0x290 kernel/locking/lockdep.c:3085
 check_deadlock kernel/locking/lockdep.c:3137 [inline]
 validate_chain kernel/locking/lockdep.c:3939 [inline]
 __lock_acquire+0x25db/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
 em28xx_release_resources+0x75/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3796
 em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4493
 usb_unbind_interface+0x295/0x9c0 drivers/usb/core/driver.c:460
 device_remove drivers/base/dd.c:619 [inline]
 __device_release_driver drivers/base/dd.c:1357 [inline]
 device_release_driver_internal+0x48d/0x7d0 drivers/base/dd.c:1380
 bus_remove_device+0x444/0x560 drivers/base/bus.c:678
 device_del+0x524/0x8f0 drivers/base/core.c:3967
 usb_disable_device+0x3d4/0x8d0 drivers/usb/core/message.c:1484
 usb_disconnect+0x346/0x9a0 drivers/usb/core/hub.c:2355
 hub_port_connect drivers/usb/core/hub.c:5425 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x1bbb/0x4d30 drivers/usb/core/hub.c:5971
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

To test a fix for this bug, please reply with `#syz test`
(on a separate line) and attach the patch to the email.

Notes:
- The patch will be applied on top of the tested series (as an
  incremental fix).
- To test a new version of the whole series, please send it directly
  to syzbot@lists.linux.dev.
- Arguments like custom git repos and branches are not supported.
