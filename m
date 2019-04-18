Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062E6C10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 17:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D04C8214DA
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 17:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388301AbfDRRlC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 13:41:02 -0400
Received: from mail-it1-f197.google.com ([209.85.166.197]:43478 "EHLO
        mail-it1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733067AbfDRRlB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 13:41:01 -0400
Received: by mail-it1-f197.google.com with SMTP id m192so2920564ita.8
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 10:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=F/RWUlz3lTW5F5exa7+1XTzhDvYPRXHg2PvSS9/OQXk=;
        b=Q0OSJ1nGxhdnHEicenT31MQGk0OdJSRrzK0vsb3EWUEbk9kWdtWIOrqLQLDnFVM5Nm
         ivdII6AwvXJ0bq5FzEpk6luSGrsC/GIlwzl+G2YyB/c8g9mRk64/lUiqa2oCrPzHXJE3
         oThHl7sIUUP3ykfx7dl0kZ0QJvN5+IFHNxA/iBnyAXxTrwKmLk6EvAoq62zh7b25sBlQ
         rvBu6T9A3j4I7tW1iYrzADwOe9PoQOaRz55dszyvs+Q4vgVgKOaD+32MThycuNC881iv
         8UEH3ij/GXbxgpPPpLPM7C6EeyD1pLuo1byirGTkgUM3sXHNRduu42Z/VUyz2qkpSGon
         QdTg==
X-Gm-Message-State: APjAAAUDr7EP1c3+MVQVsFcfH1fSg3VupQf0OuXJzBl1kv7b0RaYqEnj
        2YHkTRs15YaXlRHhYNP/U90WjcQ08x8Krr1V4/SzWfxNVPZE
X-Google-Smtp-Source: APXvYqwj5MwR/p1oNOBXc48i27ivUxKQifwn0vppF9s6qZy2rz7Rc7YDN/qI2gi+JJotkN9jTm5dzXeTCXwTMEZX9SsvJ0ixu4Qu
MIME-Version: 1.0
X-Received: by 2002:a02:9a02:: with SMTP id b2mr5596858jal.120.1555609261012;
 Thu, 18 Apr 2019 10:41:01 -0700 (PDT)
Date:   Thu, 18 Apr 2019 10:41:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904181247380.1303-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000697b730586d18142@google.com>
Subject: Re: WARNING in usb_submit_urb (4)
From:   syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418174101.e_eNS46YCqvnfRaimhTwWKkwyaAKx2ktiLStsEiTIKw@z>

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
WARNING in usb_submit_urb

hub 3-0:1.0: 00000000b89ba4aa hub_resume
hub 3-0:1.0: 00000000b89ba4aa hub_activate type 1 discon 0
hub 3-0:1.0: 00000000b89ba4aa hub_activate type 4 discon 0
------------[ cut here ]------------
URB 0000000031fb463e submitted while active
WARNING: CPU: 0 PID: 2917 at drivers/usb/core/urb.c:363  
usb_submit_urb+0x1110/0x1400 drivers/usb/core/urb.c:363
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 2917 Comm: kworker/0:2 Not tainted 4.20.0-rc1+ #1
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
48 c7 c7 00 49 93 88 c6 05 43 1c 10 05 01 e8 d0 94 46 fc <0f> 0b e9 dc f5  
ff ff c7 45 c8 01 00 00 00 e9 94 f6 ff ff 41 be ed
RSP: 0018:ffff8881cb9cf820 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81656e66 RDI: 0000000000000005
RBP: ffff8881cb9cf880 R08: ffff8881cb9c2480 R09: ffffed103b5c5021
R10: ffffed103b5c5020 R11: ffff8881dae28107 R12: ffff8881cb9cf9a0
R13: ffff8881c43d9250 R14: 00000000fffffff0 R15: ffff8881d7718300
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
console output: https://syzkaller.appspot.com/x/log.txt?x=16a7f38f200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69667e62a5e247a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=112bbbbf200000

