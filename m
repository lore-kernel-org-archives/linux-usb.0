Return-Path: <SRS0=ay4A=XN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04801C4CEC9
	for <linux-usb@archiver.kernel.org>; Wed, 18 Sep 2019 12:07:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D80ED21907
	for <linux-usb@archiver.kernel.org>; Wed, 18 Sep 2019 12:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbfIRMHC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 18 Sep 2019 08:07:02 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:51659 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbfIRMHC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 08:07:02 -0400
Received: by mail-io1-f69.google.com with SMTP id a13so10687518ioh.18
        for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2019 05:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=FSF2twrGv8C9R/LR+gpcvgwHJvITBl5yE80ajwcfqc8=;
        b=bSPVye6cgBJDxTX7tUeXoUqIu8MTO1DHjJ8/8U/rtArFmRrC6KxNCAISS0PMiYV0Ht
         8aiP15PmvAbyn6nKaGEmPyOKoauMZl09HTeg0tzPE9tdpR0TjPw2rdSVfeIgPDYTZC/I
         CtB4CksGi8Re4xbFAvQLV+Mh/8gkYISARxIyUQe670SIs9pMsgy8zfaBKJdtRjyKzpAh
         wMl8CEGkKzK4BhYUpFf77r4K3Spks8mpBxW8vv3bqNwt68GCxV/Nshsd0OZQ+2FeJhvG
         m8EPnRCCZdFJc/7EDYfaoIH1IXfQ8FQGXJiHH/vM0uhNS6Mbxg+d/U50IH/4TDjO7pY8
         Btrg==
X-Gm-Message-State: APjAAAUzDYCa9dtpAKy9uG0U1Uvcn4ZZayiUtlaXtRe7HIVZ3aLGdXkL
        X3YOmZl82dIzLYEnNKGFp5A4Dv7ODIUwp17yA0odFJ8O2tDz
X-Google-Smtp-Source: APXvYqzES4YyS8y/saMw3rpqBpSMCMeoqohImRV7AUnMLaeFyiNo0H/N/+OnqsOmNVhxdEBios6/bgoM8zTK3A3v+hOUj2vp5oOi
MIME-Version: 1.0
X-Received: by 2002:a5d:9dd4:: with SMTP id 20mr4838250ioo.1.1568808420767;
 Wed, 18 Sep 2019 05:07:00 -0700 (PDT)
Date:   Wed, 18 Sep 2019 05:07:00 -0700
In-Reply-To: <CAAeHK+xJgJoR9rODcRH74knaRKmEq+DDVarNNwDMT_Vtg+gV2Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a400c60592d2ac8f@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in ga_probe
From:   syzbot <syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com

Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=403741a091bf41d4ae79
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=131651c9600000

Note: testing is done by a robot and is best-effort only.
