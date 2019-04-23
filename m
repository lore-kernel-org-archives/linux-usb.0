Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B97C10F03
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 16:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A40FB20811
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 16:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfDWQGB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 12:06:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:54322 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbfDWQGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Apr 2019 12:06:01 -0400
Received: by mail-io1-f71.google.com with SMTP id c17so13359869iom.21
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2019 09:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=oQ+5RDeXMVUx96sriKP1rnJUCvzHQET4JfCD0yTqnK4=;
        b=Q2z3czbkDGx5oB414fxupwchNqITonrIV946QveVWAofkOsukTVW9ZTi/ihk9KWOtm
         9yQf/aEKFDQSx1rD6yCqj+7oNUGyuy8wNLSpYCDF1G/wco9cYfb2ucKt8BvV0v3wxiwC
         1AbLap58hW6uTgaBR73oiY1V5Q1IK1cSxy4OiElzPTPiW6HmmMxRad+drRt3jh74KnzF
         pKM26dhnevrGsW3ZmPg3/FKBeW3c84djLXgQAnocLlcA2KjAlMkJs5kpNIsTAJbawb0D
         /OOv7w2VvYAjKgXHC3nnLd1FliKdgyGGas+5DWoQJpQyt2SYrRG2b5Q8AoHsWJlT6Lw+
         p61w==
X-Gm-Message-State: APjAAAWfG7wCbPchIyosprK99upe5xlOKICX6zLZ4n+JiBYFpnNxZcgy
        0R78KDHudNQntLo4fcMamXrVRsr3f5T8dRbDWJtuOEJqhVxz
X-Google-Smtp-Source: APXvYqyO1a8WQjH8I/ukNixhpBGC4KoWjNMgCAiNTPMHTKh/n7na1JXv/Ne2ae0IIThU+LyHskWfggdNwLOlse9EQTS9vIlh+E4o
MIME-Version: 1.0
X-Received: by 2002:a05:6602:9:: with SMTP id b9mr10562226ioa.133.1556035560840;
 Tue, 23 Apr 2019 09:06:00 -0700 (PDT)
Date:   Tue, 23 Apr 2019 09:06:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904231126500.1461-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dca2f3058734c255@google.com>
Subject: Re: general protection fault in __dev_printk
From:   syzbot <syzbot+2eb9121678bdb36e6d57@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dvyukov@google.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rafael@kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423160600.64S8VkuFZfBVt64Un39CBkp3pBseZ1syCvNbjbBBj-c@z>

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+2eb9121678bdb36e6d57@syzkaller.appspotmail.com

Tested on:

commit:         d34f9519 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan/tree/usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15909780a00000

Note: testing is done by a robot and is best-effort only.
