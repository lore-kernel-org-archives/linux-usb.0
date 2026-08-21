Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AF445AFE
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303442; cv=none; b=P/luMSoAJseZj1h5FpRsCJrYXKhrXPs6/MXVXzhqaH6OQnHW21CTtYg5q8FIeI3XKSZJ+tEWF/rUvEDNsAIboCXiRgHfwG5x0PNOrHosY570gSq3sPVewyqnCPT2ZNbfGMIzilzFyut9leK4AbTctE3N8eESpdTft2zPeESJ6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303442; c=relaxed/simple;
	bh=oE2u3HpbUlbC0+UlILy0Q+VTDZ5DfS0LKdixS4S/j7Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ayGUBb3K0wWZkNXC1/dZDs8VK1G6xOGinlZWK9pAyqp3B9arsdZ7dXiYw/0wkdDdp63bNhn68L6UjEXW5WCZPV5ovViss3PTSJqB9IIYn7YXejMdMUp9pnsWDL9pKvqShXjvdUXr9S++W7uPs6ncTcJaerLlxRuJEmkflS/xsbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-451e22b4773so269293fac.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 02:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303431; x=1787908231;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbW8uGNP9FBKbapA4t9liASzGNQrb7YYyuo/w603oGg=;
        b=rgiOtxegMPAdLbTUtx1XqYln4bnGvA3khgN5ZSs9GNO/qev1MFE6prQi068JvBzzx9
         hn8gyfvjn/jz5S9w74VJB77P3X6JFYkpCMRFQuiGxn8QhiPwM77ysaHHm6au7UjHZSKg
         kcrh08cgC/NgBMFZwtcaa0xtAyo4LoSgbgzo8PydynCRA4/2/fxgDdtDIhpvChsOP34T
         vDiFnWBe/cxXZ4BAsP4alxbUYxWjomdaspK91YhF1OrneBnsNdy8p94xT9fnbpwU4gej
         7bOBrpO6Z0lEygJIv2LmRpNmPqmnmWIVp0PmOykj4OrHJbZOQIjfPiekjdroMGaMp2kM
         VUtA==
X-Forwarded-Encrypted: i=1; AHgh+RoJlwAoCzCXw0WKMlErOU3vKdnVSK++/if+fKKZHAwbqP/KVr4h3S25YUNnQGWzlqk9tmQEFfdVJbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4sa4aROykPG4P6xItnwrAOXVXhmrae+Bdgfrs35MMD2UqWB5
	4LkZ8Eo+AEs8IFdGhT2F8fEyRpd4RMCQWg5P/DPH3FP8sy3Z0KUfM6nitRITt5mTTbebVTVsaYJ
	YJ6IyGkeoI3Y8GE+dtzVQ8YTm1Pge2S3dZWovQmPOvqxW1P8kdnAnncIP9T8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1a0e:b0:6a3:92f8:96ab with SMTP id
 006d021491bc7-6b159199691mr5109074eaf.1.1787303431057; Fri, 21 Aug 2026
 02:10:31 -0700 (PDT)
Date: Fri, 21 Aug 2026 02:10:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a881607.dbb3a75c.13dd47.000d.GAE@google.com>
Subject: [syzbot] [usb?] INFO: trying to register non-static key in u_audio_get_playback_srate
From: syzbot <syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    dcb68831eac7 Merge tag 'block-7.2-20260815' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10eed6c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c9eb8e593cf8c5c
dashboard link: https://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1174a1aaa938/disk-dcb68831.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c14ec1120394/vmlinux-dcb68831.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5971a3555672/bzImage-dcb68831.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 29 Comm: ktimers/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1299
 __lock_acquire+0xab/0x2ce0 kernel/locking/lockdep.c:5112
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 u_audio_get_playback_srate+0x50/0xd0 drivers/usb/gadget/function/u_audio.c:579
 in_rq_cur drivers/usb/gadget/function/f_uac2.c:1537 [inline]
 ac_rq_in drivers/usb/gadget/function/f_uac2.c:1696 [inline]
 setup_rq_inf drivers/usb/gadget/function/f_uac2.c:1824 [inline]
 afunc_setup+0x591/0x2100 drivers/usb/gadget/function/f_uac2.c:1845
 configfs_composite_setup+0xbd/0x100 drivers/usb/gadget/configfs.c:1877
 v_timer+0xd8b/0x2520 drivers/usb/usbip/vudc_transfer.c:378
 call_timer_fn+0x192/0x5e0 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers kernel/time/timer.c:2374 [inline]
 __run_timer_base+0x67b/0x9b0 kernel/time/timer.c:2386
 run_timer_base kernel/time/timer.c:2395 [inline]
 run_timer_softirq+0xb7/0x170 kernel/time/timer.c:2405
 handle_softirqs+0x1d9/0x6c0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 run_ktimerd+0x69/0x100 kernel/softirq.c:1151
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
dummy_hcd dummy_hcd.0: timer fired with no URBs pending?


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
