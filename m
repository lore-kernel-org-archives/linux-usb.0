Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F53C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 21:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E12C82073F
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 21:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbfDPVKB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 17:10:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:35728 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbfDPVKB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 17:10:01 -0400
Received: by mail-io1-f69.google.com with SMTP id k2so17819812ioj.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 14:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=RENTCdeJtuY8tOOtPKuGvAhgmgLt4eMqXpkUh2Doe0k=;
        b=Cbst1cm7641VBhiBgBm+mn5sf8J4vZ4ZeVI8KFBYY6sJ/XnNhp/W5jwec8Nu+yQUNz
         PxGADcdXLSaZ7l15qd9SqzQVQIwxiTHESPn8cne/ZeCZQte9Jxcj4Lb0Yt5aK5YtDOSA
         ikd6HQ54HJkqRTjIFbaYDH0Rah8xBlikXFsDwXCdIaIcupbroDJHtjFJ2MGIZZyggUer
         /qRAMAviX8TtSgLQ921rYXnah02D1ZtXKjYCN4tr2t1GbxiC7Wq5djlvAJdrmwYJgQI1
         TffY9iF4Xhl6oRg+ptzJMvNX34V1F6ASV07uvnYENeefc+T4IMhTM1ERhsZJDy5Qt8dh
         sivQ==
X-Gm-Message-State: APjAAAUSSVxNzB2JERmONVkuoGqriDPldXG41g+CwQdpnv7vWDU8iA2a
        NzhI51I/FGZkVmjays8o30qm6Q4m85QL7CMMbACqB7ufQDIf
X-Google-Smtp-Source: APXvYqzcEYYP08dH0cxOhZT7m1Rs+XEv7po9sfMshJc1/hiqsZKp3n9z76REOUhj8nF0N0+xCTMNo/4ObQLIicpNxDokDVHMZRdn
MIME-Version: 1.0
X-Received: by 2002:a6b:c3c6:: with SMTP id t189mr1187243iof.0.1555449000307;
 Tue, 16 Apr 2019 14:10:00 -0700 (PDT)
Date:   Tue, 16 Apr 2019 14:10:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904161614160.1605-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000021301c0586ac31f4@google.com>
Subject: Re: WARNING in usb_submit_urb (4)
From:   syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416211000.43oq1WdVClMrAghOVdDMqSPT8xKAk6BGlnzc2GDKZ1c@z>

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
WARNING in usb_submit_urb

hub 3-0:1.0: 0000000090da6a2e hub_activate type 4 discon 0
hub 3-0:1.0: 0000000090da6a2e Submitting status URB
hub 3-0:1.0: 0000000090da6a2e Submitting status URB
------------[ cut here ]------------
URB 000000000612b84f submitted while active
WARNING: CPU: 1 PID: 3403 at drivers/usb/core/urb.c:363  
usb_submit_urb+0x1110/0x1400 drivers/usb/core/urb.c:363
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 3403 Comm: kworker/1:2 Not tainted 4.20.0-rc1+ #1
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
Code: 89 de e8 73 20 7d fc 84 db 0f 85 fe f5 ff ff e8 26 1f 7d fc 4c 89 fe  
48 c7 c7 60 49 93 88 c6 05 b3 1a 10 05 01 e8 00 94 46 fc <0f> 0b e9 dc f5  
ff ff c7 45 c8 01 00 00 00 e9 94 f6 ff ff 41 be ed
RSP: 0018:ffff8881c64d7820 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81656e66 RDI: 0000000000000005
RBP: ffff8881c64d7880 R08: ffff8881c64fe2c0 R09: ffff8881c64feb88
R10: ffff8881c64fe2c0 R11: 0000000000000000 R12: ffff8881c64d79a0
R13: ffff8881ba64f690 R14: 00000000fffffff0 R15: ffff8881cc9bd200
  hub_activate+0xcef/0x19f0 drivers/usb/core/hub.c:1219
  hub_init_func2+0x1e/0x30 drivers/usb/core/hub.c:1244
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
console output: https://syzkaller.appspot.com/x/log.txt?x=154bbb87200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69667e62a5e247a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1721f267200000

