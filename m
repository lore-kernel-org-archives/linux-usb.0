Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2773C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 11:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B3F52171F
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 11:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbfDLLqN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 07:46:13 -0400
Received: from mail-it1-f199.google.com ([209.85.166.199]:40322 "EHLO
        mail-it1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfDLLqM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 07:46:12 -0400
Received: by mail-it1-f199.google.com with SMTP id j8so8397450ita.5
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 04:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HwCE7LPaiVCxQVhg3bBIAPZUT7It159Z1je9DXoVpAE=;
        b=YelNU3WZW8TZsdwCFvxJ1jRx1TDhjJJAJtpI2+0RalsQTBwVJb4C/PJ5ehsP7z5GCv
         6n7PjaOfv/AJQhD2rq1CdUXwqmSt9l4wsuHP3HVilM3tTztU9y8fW1dLgOy8iZ3u/Hwh
         EDn9dTLgQzSiOCxoe6WUryUJS6GA+vIlxWtFnzXJSx9mPk586ehD/2AdTLjpMSUIPgQJ
         aBUkFng3Vlh+jftNm8VooJsAclVcZFnQBhzR1SMbB65CG24lF2KySpFRnK8gJhNzWUs9
         pH45bZynZFvthSyeJ4eXQMERXzWOjQ+0zGCKrB8iyFGbiUgJ5W4Mh5BpD2irLR9ulXs2
         fV4A==
X-Gm-Message-State: APjAAAXzN+Q6UVN2C3RAWviM8AUTFhlqk33/YXjWl11DaCFYUcy1QAyg
        yt6+dY9NPofOal7xypFzC086s/ay+cIPAFMNByRsPON1wbjH
X-Google-Smtp-Source: APXvYqyU5W6sqpRNueTN5DA30JoFFSSeLOCZ0GGD18mAwMgNQm9Uc0ySNkpUAe0ZgiULMy75TAL5xG5sqcM+qNOvnH40puU/HUbU
MIME-Version: 1.0
X-Received: by 2002:a24:70c1:: with SMTP id f184mr3481952itc.28.1555069571891;
 Fri, 12 Apr 2019 04:46:11 -0700 (PDT)
Date:   Fri, 12 Apr 2019 04:46:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006f1596058653d991@google.com>
Subject: INFO: task hung in usb_kill_urb
From:   syzbot <syzbot+d919b0f29d7b5a4994b9@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan/tree/usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14c4c1af200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
dashboard link: https://syzkaller.appspot.com/bug?extid=d919b0f29d7b5a4994b9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14410dbb200000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f0acd3200000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d919b0f29d7b5a4994b9@syzkaller.appspotmail.com

usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
INFO: task kworker/0:2:532 blocked for more than 143 seconds.
       Not tainted 5.1.0-rc4-319354-g9a33b36 #3
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/0:2     D26656   532      2 0x80000000
Workqueue: usb_hub_wq hub_event
Call Trace:
  schedule+0x8f/0x180 kernel/sched/core.c:3562
  usb_kill_urb drivers/usb/core/urb.c:695 [inline]
  usb_kill_urb+0x22a/0x2c0 drivers/usb/core/urb.c:687
  usb_start_wait_urb+0x257/0x4d0 drivers/usb/core/message.c:63
  usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
  usb_control_msg+0x321/0x4a0 drivers/usb/core/message.c:152
usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
  hub_port_init+0x81d/0x2d30 drivers/usb/core/hub.c:4655
  hub_port_connect drivers/usb/core/hub.c:5021 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x11b8/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

Showing all locks held in the system:
1 lock held by khungtaskd/23:
  #0: 00000000e5b75d53 (rcu_read_lock){....}, at:  
debug_show_all_locks+0x53/0x269 kernel/locking/lockdep.c:5059
5 locks held by kworker/0:2/532:
  #0: 0000000071ab50a3 ((wq_completion)usb_hub_wq){+.+.}, at:  
__write_once_size include/linux/compiler.h:220 [inline]
  #0: 0000000071ab50a3 ((wq_completion)usb_hub_wq){+.+.}, at:  
arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
  #0: 0000000071ab50a3 ((wq_completion)usb_hub_wq){+.+.}, at: atomic64_set  
include/asm-generic/atomic-instrumented.h:855 [inline]
  #0: 0000000071ab50a3 ((wq_completion)usb_hub_wq){+.+.}, at:  
atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
  #0: 0000000071ab50a3 ((wq_completion)usb_hub_wq){+.+.}, at: set_work_data  
kernel/workqueue.c:619 [inline]
  #0: 0000000071ab50a3 ((wq_completion)usb_hub_wq){+.+.}, at:  
set_work_pool_and_clear_pending kernel/workqueue.c:646 [inline]
  #0: 0000000071ab50a3 ((wq_completion)usb_hub_wq){+.+.}, at:  
process_one_work+0x81f/0x1580 kernel/workqueue.c:2240
  #1: 000000004253e0f6 ((work_completion)(&hub->events)){+.+.}, at:  
process_one_work+0x853/0x1580 kernel/workqueue.c:2244
  #2: 00000000eeaa16eb (&dev->mutex){....}, at: device_lock  
include/linux/device.h:1207 [inline]
  #2: 00000000eeaa16eb (&dev->mutex){....}, at: hub_event+0x18a/0x3b00  
drivers/usb/core/hub.c:5378
  #3: 000000004f32b3e5 (&port_dev->status_lock){+.+.}, at: usb_lock_port  
drivers/usb/core/hub.c:2994 [inline]
  #3: 000000004f32b3e5 (&port_dev->status_lock){+.+.}, at: hub_port_connect  
drivers/usb/core/hub.c:5020 [inline]
  #3: 000000004f32b3e5 (&port_dev->status_lock){+.+.}, at:  
hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  #3: 000000004f32b3e5 (&port_dev->status_lock){+.+.}, at: port_event  
drivers/usb/core/hub.c:5350 [inline]
  #3: 000000004f32b3e5 (&port_dev->status_lock){+.+.}, at:  
hub_event+0x11a3/0x3b00 drivers/usb/core/hub.c:5432
  #4: 00000000bd3d99c8 (hcd->address0_mutex){+.+.}, at:  
hub_port_init+0x1bb/0x2d30 drivers/usb/core/hub.c:4529
1 lock held by rsyslogd/5433:
  #0: 00000000977dfa25 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xe8/0x100  
fs/file.c:801
2 locks held by getty/5523:
  #0: 0000000040ff7945 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x27/0x80 drivers/tty/tty_ldisc.c:272
  #1: 000000006c00c4a7 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x21c/0x1a60 drivers/tty/n_tty.c:2156
2 locks held by getty/5524:
  #0: 00000000cc012e5a (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x27/0x80 drivers/tty/tty_ldisc.c:272
  #1: 000000001fd3230f (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x21c/0x1a60 drivers/tty/n_tty.c:2156
2 locks held by getty/5525:
  #0: 00000000c53cd960 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x27/0x80 drivers/tty/tty_ldisc.c:272
  #1: 00000000e779c4bc (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x21c/0x1a60 drivers/tty/n_tty.c:2156
2 locks held by getty/5526:
  #0: 00000000a6b003b0 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x27/0x80 drivers/tty/tty_ldisc.c:272
  #1: 00000000bd516627 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x21c/0x1a60 drivers/tty/n_tty.c:2156
usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
2 locks held by getty/5527:
  #0: 00000000970614b6 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x27/0x80 drivers/tty/tty_ldisc.c:272
  #1: 000000004a83542c (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x21c/0x1a60 drivers/tty/n_tty.c:2156
2 locks held by getty/5528:
  #0: 00000000c9f52a2b (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x27/0x80 drivers/tty/tty_ldisc.c:272
  #1: 0000000068927d8f (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x21c/0x1a60 drivers/tty/n_tty.c:2156
2 locks held by getty/5529:
  #0: 00000000b02ccb7f (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x27/0x80 drivers/tty/tty_ldisc.c:272
  #1: 000000001e46199a (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x21c/0x1a60 drivers/tty/n_tty.c:2156

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 23 Comm: khungtaskd Not tainted 5.1.0-rc4-319354-g9a33b36 #3
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xe8/0x16e lib/dump_stack.c:113
  nmi_cpu_backtrace.cold+0x48/0x87 lib/nmi_backtrace.c:101
  nmi_trigger_cpumask_backtrace+0x1a6/0x1bd lib/nmi_backtrace.c:62
  trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
  check_hung_uninterruptible_tasks kernel/hung_task.c:204 [inline]
  watchdog+0x98e/0xe20 kernel/hung_task.c:288
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0 skipped: idling at native_safe_halt+0x2/0x10  
arch/x86/include/asm/irqflags.h:57


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
