Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440273;
	b=yZBQ4WTuf2qX36Bt9UTsIWEWTG6Wkc/L7j2L8QxHi3VVeHAGiMMt6Js0Rx4GKpqVe+Xy
	 yUB6Gl50JdIBl3ECazO2d1v9qoYqAmYrEi9vRpTBv+Ndphmt+DuUxmLujXog1SkjFHpoW
	 gCZVXzUuZWJ5SHsTVsY/Zplu+eIzntr3/e+SMOCyMqauGhEuyAa+QlWeNGbJMPPpr5dwO
	 fK9iZrXSMzc7yqDfU01X6NsoYr85Yom4pcxqtul8H1bANO/cgfYDCYXArMdYPqOzKPBk8
	 KCFRGn3P3t87QR/EarIEML/iSI9dczG4dpQahdIX7WYAhTt9ks2gAKY/uGBqx3uxSyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440273;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=oDfINcFbuQrHtezeW26KtgRUuzHaaOUFoMxP5VuL0xM=;
	b=27jfu/S8g47icuCc8BqYW0B2uB/soZkM4pdkbiKLyFRdORXFHPnJHrTfHTKMSEP+mKWH
	 z7iIRH6l4fTYuQFEGvhKkeHMdTcFdAuzoJl8r+ggkqEJ3t9LwI/mvZpszOOqOP2Fcd9/l
	 2PAAWl136wdpSZ7FEN3iDZqbYkQxl0wKdpK5+/LEJAkrPyc7EW3XPVNKhEsplaCm7YSpl
	 X2ha9YOdSgRKc0VudOK5Ng6zzCzuzxQIt8hqtY3nGMtMnAnB2/Jy50Ll9LNSML62SHUJs
	 3RpAshh0jhD9Ur/vNKDETZnAAhMP6RwRNvsnWF0aTG9KuIH2lEDdsrD3DO8Sk3bXDbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38118606A319
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 20:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38118606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso4231086b6e.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 13:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440272; x=1793045072;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDfINcFbuQrHtezeW26KtgRUuzHaaOUFoMxP5VuL0xM=;
        b=PNRgKBB4waXX4Q2dRdrtorxf/kaPqpOBJg4j9vNwcfUAaKgvOOKOwg+t6W65RzINMU
         fi1UCcMW9iIGYdUi9QyC6ExwflhOiIMYc39aYlxYU6qabiRlyGNnvFBuI+k/5Ft/V9cP
         sqk7tH0ZmLr8hUGYUqoxv2eS1zojzscbsgT8vBDFloi8K+LJdyrvRIfEhy4uAUNVRcMC
         n5Vdfqohr8J/PwpKMlu/M6h7RP0F5WKbuBA9dvfJNY5EN/u+CU6zK1uufNoyWuxE9Ygr
         zqH7VvFHSerlHbUCM1s/k3iKzKdkVresNsoL/umgBzbdd7KY0A8kt6yGzOhDijdvLymP
         iMeA==
X-Forwarded-Encrypted: i=1; AKwUvByH8iCLC+qhoN2AhrKFaftyXeVwGP3+Nmz7I6UXsptPkpLrM2Q4UoXEaCZCF3YkAIFlJYHaOE/pMDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPwFRLSKDhnENlQjQ1K6M+o3E7oIUKfmnDztX2wku0PHC21ALn
	3yFZCqtMu+TFCJu/iutzA2QqtsJqQfUwTUsrfhi1u6sOCbhlH6bo+ZyALS4XLJlZPo+ich0Ib0X
	8U66QX8UFizmbBXwx0PW8hqmKknyQg3lioj0WQjIWud7jJIfg4y28KmfUdkU=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1645:b0:4d6:308d:4ca7 with SMTP id
 5614622812f47-53cced20326mr7361172b6e.24.1792440272158; Mon, 19 Oct 2026
 13:04:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:04:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad677d0.a20cb897.960b0.0048.GAE@google.com>
Subject: [syzbot] [sound?] [usb?] BUG: scheduling while atomic in wait_clear_urbs
From: syzbot <syzbot+4b408ec271028c02705a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b810335a0699 Add linux-next specific files for 20261015
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=167bffd1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b8bbfb3c8b8bab9
dashboard link: https://syzkaller.appspot.com/bug?extid=4b408ec271028c02705a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117bffd1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=129b3e8e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d857324ce96e/disk-b810335a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c678b2144185/vmlinux-b810335a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a48079386c10/bzImage-b810335a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4b408ec271028c02705a@syzkaller.appspotmail.com

raw-gadget.0 gadget.0: fail, usb_ep_enable returned -22
usb 1-1: BOGUS urb xfer, pipe 0 != type 3
BUG: scheduling while atomic: syz-executor208/5624/0x00000002
locks held by syz-executor208/5624: 2, on CPU#1:
 #0: ffff8880375782c8 (&pcm->open_mutex){+.+.}-{4:4}, at: snd_pcm_oss_release+0x110/0x250 sound/core/oss/pcm_oss.c:2589
 #1: ffff88807bbb7910 (&group->lock#2){..-.}-{3:3}, at: spin_lock_irq include/linux/spinlock.h:377 [inline]
 #1: ffff88807bbb7910 (&group->lock#2){..-.}-{3:3}, at: snd_pcm_group_lock_irq sound/core/pcm_native.c:103 [inline]
 #1: ffff88807bbb7910 (&group->lock#2){..-.}-{3:3}, at: snd_pcm_stream_lock_irq sound/core/pcm_native.c:142 [inline]
 #1: ffff88807bbb7910 (&group->lock#2){..-.}-{3:3}, at: class_pcm_stream_lock_irq_constructor include/sound/pcm.h:678 [inline]
 #1: ffff88807bbb7910 (&group->lock#2){..-.}-{3:3}, at: snd_pcm_drop+0xcc/0x780 sound/core/pcm_native.c:2323
Modules linked in:
irq event stamp: 62624
hardirqs last  enabled at (62623): [<ffffffff8c0b3e43>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:219 [inline]
hardirqs last  enabled at (62623): [<ffffffff8c0b3e43>] _raw_spin_unlock_irq+0x23/0x50 kernel/locking/spinlock.c:229
hardirqs last disabled at (62624): [<ffffffff8c0b3b17>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:163 [inline]
hardirqs last disabled at (62624): [<ffffffff8c0b3b17>] _raw_spin_lock_irq+0x17/0x50 kernel/locking/spinlock.c:189
softirqs last  enabled at (62310): [<ffffffff81895e3b>] __do_softirq kernel/softirq.c:679 [inline]
softirqs last  enabled at (62310): [<ffffffff81895e3b>] invoke_softirq kernel/softirq.c:519 [inline]
softirqs last  enabled at (62310): [<ffffffff81895e3b>] __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:758
softirqs last disabled at (62299): [<ffffffff81895e3b>] __do_softirq kernel/softirq.c:679 [inline]
softirqs last disabled at (62299): [<ffffffff81895e3b>] invoke_softirq kernel/softirq.c:519 [inline]
softirqs last disabled at (62299): [<ffffffff81895e3b>] __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:758
Preemption disabled at:
[<0000000000000000>] 0x0
Kernel panic - not syncing: scheduling while atomic: panic_on_warn set ...
CPU: 1 UID: 0 PID: 5624 Comm: syz-executor208 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 vpanic+0x26f/0x710 kernel/panic.c:661
 panic+0xc5/0xd0 kernel/panic.c:787
 check_panic_on_warn+0x89/0xb0 kernel/panic.c:533
 __schedule_bug+0xf1/0x150 kernel/sched/core.c:6143
 schedule_debug kernel/sched/core.c:6172 [inline]
 __schedule+0x18b7/0x5820 kernel/sched/core.c:7232
 __schedule_loop kernel/sched/core.c:7462 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7477
 schedule_timeout+0x152/0x2c0 kernel/time/sleep_timeout.c:99
 wait_clear_urbs+0x134/0x390 sound/usb/endpoint.c:1010
 sync_pending_stops sound/usb/pcm.c:317 [inline]
 snd_usb_pcm_sync_stop+0x9c/0xb0 sound/usb/pcm.c:325
 snd_pcm_sync_stop sound/core/pcm_native.c:648 [inline]
 snd_pcm_drop+0x57d/0x780 sound/core/pcm_native.c:2335
 snd_pcm_release_substream+0x75/0x4a0 sound/core/pcm_native.c:2836
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2413 [inline]
 snd_pcm_oss_release+0x144/0x250 sound/core/oss/pcm_oss.c:2590
 __fput+0x408/0xa40 fs/file_table.c:513
 fput_close_sync+0x11f/0x240 fs/file_table.c:619
 filp_close_sync+0x6e/0xa0 fs/open.c:1897
 close_files fs/file.c:572 [inline]
 put_files_struct+0x230/0x3c0 fs/file.c:584
 do_exit+0x6f0/0x2360 kernel/exit.c:977
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1123
 get_signal+0x1216/0x12c0 kernel/signal.c:3112
 arch_do_signal_or_restart+0xbb/0x860 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x10e/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f41afbcdcc9
Code: Unable to access opcode bytes at 0x7f41afbcdc9f.
RSP: 002b:00007ffc3a104688 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: 00000000002828c9 RBX: 0000000000000000 RCX: 00007f41afbcdcc9
RDX: 00000000fffffcd9 RSI: 0000200000002200 RDI: 0000000000000006
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000006
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc3a1047f8
R13: 431bde82d7b634db R14: 00007f41afc60c40 R15: 0000000000000002
 </TASK>
Shutting down cpus with NMI
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
