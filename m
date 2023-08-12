Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20344C001B0
	for <linux-usb@archiver.kernel.org>; Sat, 12 Aug 2023 09:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236699AbjHLJv2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 12 Aug 2023 05:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbjHLJv1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Aug 2023 05:51:27 -0400
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44121E7
        for <linux-usb@vger.kernel.org>; Sat, 12 Aug 2023 02:51:31 -0700 (PDT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-268099fd4f5so3002799a91.1
        for <linux-usb@vger.kernel.org>; Sat, 12 Aug 2023 02:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691833891; x=1692438691;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QR7Jc1vXxo0aDPQdMwxp89Yuch6sITXUZ93/IQ44yYs=;
        b=hdE1mC6kinP3t5bj47XxME93Fqxnac7HNCOUXl3kiRsoM6Eg911RVZmMwp4UO+8Cna
         zkSMcMkLGb01jpKZ7uu5/zpjTDLXEk9ifG5feyXRXR9MxW8gaWlhfBdfP4weObyMMBIp
         vWR/X0ZlLLXPnJWWRSMyTIKZqgcrJSOxuOMBdq3cmS94FqoD1r26QGCMGaIihOGzJ0YN
         EIfaLfpr5BKJn9hN2fI25C0Cb1DgETN7Tx2uEyx3XvUWXqiCKfd6Pn56ETSPmccMwmuu
         ck2OMWv4Qtya0iX8WaQxmr2Qea1JyEbOnz14GrjMUJyGYsSfmLmozQHdKCGNsIC5NnxP
         3w3w==
X-Gm-Message-State: AOJu0YxOQa8/X+ArOBdP7lVYcmpawHS+YJ62fn19z/VxC9GhLHy9Emyp
        XITyJat1hPoqjNPo0HXypqg8B7bbfQGKDbyIl/DvyHIQiCXA
X-Google-Smtp-Source: AGHT+IHALHpoCwhShDFEGgDOt2ZbFeaOEdtaxOTMKph4e5BOl1uedD/sil3YuojOjSpfvCPW6fWCTC9sNw3JkwTgnRhMhksgWyTb
MIME-Version: 1.0
X-Received: by 2002:a17:90a:f0c4:b0:268:5919:a271 with SMTP id
 fa4-20020a17090af0c400b002685919a271mr936991pjb.8.1691833890791; Sat, 12 Aug
 2023 02:51:30 -0700 (PDT)
Date:   Sat, 12 Aug 2023 02:51:30 -0700
In-Reply-To: <0000000000007c27e105faa4aa99@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000014678c0602b6c643@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_anchor_suspend_wakeups
From:   syzbot <syzbot+d6b0b0ea0781c14b2ecf@syzkaller.appspotmail.com>
To:     arnd@arndb.de, christian.brauner@ubuntu.com,
        gregkh@linuxfoundation.org, hdanton@sina.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mpe@ellerman.id.au, oleg@redhat.com,
        syzkaller-bugs@googlegroups.com, web@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this issue to:

commit 9b4feb630e8e9801603f3cab3a36369e3c1cf88d
Author: Christian Brauner <christian.brauner@ubuntu.com>
Date:   Fri May 24 09:31:44 2019 +0000

    arch: wire-up close_range()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1323329ba80000
start commit:   89d77f71f493 Merge tag 'riscv-for-linus-6.4-mw1' of git://..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10a3329ba80000
console output: https://syzkaller.appspot.com/x/log.txt?x=1723329ba80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d963e7536cbe545e
dashboard link: https://syzkaller.appspot.com/bug?extid=d6b0b0ea0781c14b2ecf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11471b84280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10b98e2c280000

Reported-by: syzbot+d6b0b0ea0781c14b2ecf@syzkaller.appspotmail.com
Fixes: 9b4feb630e8e ("arch: wire-up close_range()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
