Return-Path: <SRS0=QQLj=Y7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36981C5DF60
	for <linux-usb@archiver.kernel.org>; Thu,  7 Nov 2019 13:43:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D1B4207FA
	for <linux-usb@archiver.kernel.org>; Thu,  7 Nov 2019 13:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389566AbfKGNnn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 7 Nov 2019 08:43:43 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:35657 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388974AbfKGNmG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:42:06 -0500
Received: by mail-io1-f69.google.com with SMTP id n16so1869599iom.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=3/xSqB0zH6bltKSKwelvmk7da+xMY4V8SAPC5pNZohE=;
        b=c11NH/tGnQJ1lVQNCG3xpfYGrSpmgrRCRT9a1aq85fqtLUsBtkpnw3BxmDgcpgKcGI
         hhBHiyRx+SvW6KUP7I46AQvzFfABr4rt5/84OEFnAJ0nGZghOknoxSTKQvAyhHZ2YQtu
         f0DcP9vzEX6NaZvCsNgxlnnACxpY66SuSiQsdjnTl0XKhQ0W/u3vX3X7pDwiK4oxb06K
         11EXPXG9t+6X5kNItfoXrCLeQu/QFtYzLSuN+DDL1C9JgadrkPXnVvFILvlct7dBqbhA
         wanN5G64arzlp1MbMjHIi/RuDSTuIHT4OfezfdkYEjLyP2A/oLMJowmQVbz6vi7qTeFD
         vAzA==
X-Gm-Message-State: APjAAAUlStCYv0K4S7yLqGEiBzY2aYdR/iTUBHmSK2kUgvH/AoeojLfb
        1HgE13v9m5w5imouTxa+VH8mo2d6wzljYgtxjdXDL9zm8JrN
X-Google-Smtp-Source: APXvYqzonUEMbV+hU0AEcPcfvumPPjz/o2sJc+Gcuj9N/CKQCOvzx0Ocr0vqAToOGHZRJPi5y9KSv7V9Lxhz3CjGGUmi6G93H8En
MIME-Version: 1.0
X-Received: by 2002:a6b:204:: with SMTP id 4mr3534207ioc.303.1573134126045;
 Thu, 07 Nov 2019 05:42:06 -0800 (PST)
Date:   Thu, 07 Nov 2019 05:42:06 -0800
In-Reply-To: <00000000000075c8d70574f40fbc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c460630596c1d40d@google.com>
Subject: Re: KASAN: use-after-free Read in vhci_hub_control
From:   syzbot <syzbot+600b03e0cf1b73bb23c4@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, shuah@kernel.org,
        stable@vger.kernel.org, sudipm.mukherjee@gmail.com,
        syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit 81f7567c51ad97668d1c3a48e8ecc482e64d4161
Author: Shuah Khan (Samsung OSG) <shuah@kernel.org>
Date:   Fri Oct 5 22:17:44 2018 +0000

     usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in vhci_hub_control()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14046c2c600000
start commit:   420f51f4 Merge tag 'arm64-fixes' of git://git.kernel.org/p..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=531a917630d2a492
dashboard link: https://syzkaller.appspot.com/bug?extid=600b03e0cf1b73bb23c4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1116710a400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=119be4ea400000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in  
vhci_hub_control()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
