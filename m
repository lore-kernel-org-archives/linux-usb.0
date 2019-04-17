Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDD3C282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 21:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76F7A2183E
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 21:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfDQVMB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 17:12:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:34996 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfDQVMB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 17:12:01 -0400
Received: by mail-io1-f69.google.com with SMTP id k2so260504ioj.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 14:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=/XJvhzB5HLqpHH4j2Ksycpi4RDf/wPlFfUMqlq4it3Y=;
        b=RWTnEYGtOrf0gkYqtW6QWgPQcSSq+2iqoqb4EyrC6cgUbzVgveEJan+Gr4usxtYbG+
         TV8uywVPgv/uyrSIM8ZHrhj/WJFYPZnUppg3YQ8lOqAnHel1Q7L8uRp21PLIi2FVfDgf
         PmhyYsAvHqDM3eHQFtt29PupWZAjbDV/lyVvyoCwd6SqtHCM1wz3jHimF4BaNPxisMsY
         aBcXKmecyJyFYiDREg61yj/jPHSbfGZXgmZ5Kt7DDISjHVMd4LGb+Qt8MAKU3tYE7jgs
         BP2dHvbzYgzi4Sakgsgx/igm9dxyOv0gO1jrhgp03KThp/HmqTMvZKaoVCWeUbONyuAY
         83mw==
X-Gm-Message-State: APjAAAVvSdXJjw9xUn2GgmOThY5M8K1nrSbugZ8dJk4HoSGmzaMTafA1
        s04cN0xQS7HKbMzMn7+mcFeCkeuyqgOss35QsPPctm6ELgcE
X-Google-Smtp-Source: APXvYqy9+BcqG60VVl+KT706QvptnNA0w1cNNtyvGqjeq95t1iFMfTiU7B9t5TCnpH9c4hGYfW/OWrXD//oi3VB2juTi5W+EvXWi
MIME-Version: 1.0
X-Received: by 2002:a24:8c:: with SMTP id 134mr602677ita.24.1555535520557;
 Wed, 17 Apr 2019 14:12:00 -0700 (PDT)
Date:   Wed, 17 Apr 2019 14:12:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904171657370.1320-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000023718f0586c0566a@google.com>
Subject: Re: WARNING in usb_submit_urb (4)
From:   syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417211200.IuBxKoljq60iJDQl3dFyMOjSwboOpR7LDG2H6unhwXU@z>

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
WARNING in usb_submit_urb

hub 3-0:1.0: 00000000e9b0f156 hub_resume
hub 3-0:1.0: 00000000e9b0f156 hub_activate type 4 discon 0
hub 3-0:1.0: 00000000e9b0f156 hub_activate type 1 discon 0
------------[ cut here ]------------
URB 0000000098fd290c submitted while active
WARNING: CPU: 0 PID: 12 at drivers/usb/core/urb.c:363  
usb_submit_urb+0x1110/0x1400 drivers/usb/core/urb.c:363
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 4.20.0-rc1+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events_power_efficient hub_init_func2
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x253/0x3bb lib/dump_stack.c:113
  panic+0x2cb/0x586 kernel/panic.c:188
  __warn.cold+0x20/0x4e kernel/panic.c:540
  report_bug+0x263/0x2b0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:178 [inline]
  fixup_bug arch/x86/kernel/traps.c:173 [inline]
  do_error_trap+0x11b/0x200 arch/x86/kernel/traps.c:271
  do_invalid_op+0x37/0x50 arch/x86/kernel/traps.c:290
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:969
RIP: 0010:usb_submit_urb+0x1110/0x1400 drivers/usb/core/urb.c:363
Code: 89 de e8 43 21 7d fc 84 db 0f 85 fe f5 ff ff e8 f6 1f 7d fc 4c 89 fe  
48 c7 c7 00 49 93 88 c6 05 43 1b 10 05 01 e8 d0 94 46 fc <0f> 0b e9 dc f5  
ff ff c7 45 c8 01 00 00 00 e9 94 f6 ff ff 41 be ed
RSP: 0018:ffff8881d9b1f820 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81656e66 RDI: 0000000000000005
RBP: ffff8881d9b1f880 R08: ffff8881d9b12300 R09: ffffed103b5c3ef9
R10: ffffed103b5c3ef8 R11: ffff8881dae1f7c7 R12: ffff8881d9b1f9a0
R13: ffff8881c49b9210 R14: 00000000fffffff0 R15: ffff8881c990dd00
  hub_activate+0xcc2/0x19c0 drivers/usb/core/hub.c:1218
  hub_init_func2+0x1e/0x30 drivers/usb/core/hub.c:1243
  process_one_work+0xd0c/0x1ce0 kernel/workqueue.c:2153
  worker_thread+0x143/0x14a0 kernel/workqueue.c:2296
  kthread+0x357/0x430 kernel/kthread.c:246
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         e12e00e3 Merge tag 'kbuild-fixes-v4.20' of git://git.kerne..
git tree:        
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16cacd2d200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69667e62a5e247a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17b94d8f200000

