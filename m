Return-Path: <SRS0=Ha91=ZH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABFDC432C3
	for <linux-usb@archiver.kernel.org>; Fri, 15 Nov 2019 07:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 993702072D
	for <linux-usb@archiver.kernel.org>; Fri, 15 Nov 2019 07:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfKOHQC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 15 Nov 2019 02:16:02 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:54800 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfKOHQC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 02:16:02 -0500
Received: by mail-il1-f197.google.com with SMTP id t67so8102768ill.21
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2019 23:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=H6KZH6ReRCeo81QQ/gV0mVJ1PcfVuetQ7C4r7dOiHMc=;
        b=OJGC9VeR+QFoBqPp/pRbRcvQnuKuu511/KUD04MmaLeEvZZ6gbanpL9ycmshhffSHu
         eFCb25eXVV7VxQH1bCf74/BmC/BNb/81EyQtZwrrF3paEjlkRDri3n5xFV2s1+vIeW0u
         IKHzvf9LmC0/7U+DQYosuu3REP6CTMkp/7Lcdig9UeU7cJfqhu5o2KrwHDo4l7zagYrM
         /PdpSdXzv+OqbvyZXm0ciz5q3ulejFjacGpRcJ+6tUS1nwKmYUZOf+JoNydzWNUWJuw7
         NSVEjecoBxp0vi4l/900CZwdtY1obXp6z5QWXxBH+n7BEoCXRO5h0rttuyT4xcYk1zTK
         hxFw==
X-Gm-Message-State: APjAAAWfH/rR8nnK6SqbsnUpMokE+EEfD8qxCUVZDAYdqDj0gKr7jSLx
        pMGGon7ZdA0C95UY8MvHbFQQV/iWWHaNLM/EDiUvsifnwGw9
X-Google-Smtp-Source: APXvYqxEFgRrGmZN5G1itaTNv92D1H3tBWtZLApFkC5r1LaLaePjg0oe/UMjPdYY3bktn2CSL/7Ek0Or6H4gQTrEenIjpPECTrWI
MIME-Version: 1.0
X-Received: by 2002:a92:dd8f:: with SMTP id g15mr14045121iln.145.1573802160251;
 Thu, 14 Nov 2019 23:16:00 -0800 (PST)
Date:   Thu, 14 Nov 2019 23:16:00 -0800
In-Reply-To: <1573726121.17351.3.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b56e8b05975d5e11@google.com>
Subject: Re: WARNING: ODEBUG bug in input_ff_destroy
From:   syzbot <syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com

Tested on:

commit:         3183c037 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=b6c55daa701fc389e286
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c2e254e00000

Note: testing is done by a robot and is best-effort only.
