Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C0EEB64D7
	for <linux-usb@archiver.kernel.org>; Fri, 23 Jun 2023 13:32:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjFWNcZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 23 Jun 2023 09:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjFWNcY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jun 2023 09:32:24 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C94910F6
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 06:32:23 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-76998d984b0so40934939f.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 06:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687527142; x=1690119142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPlj0ePe9xQ/WGGxyQBMmpisE5qo9ZSTCQrilqsvigQ=;
        b=kRO3jEBFYyIqLkTncQud4CQnpTZI4CoSn61BBFKizSgUrqCm3/UosSMNLlCk+yQgLu
         0KweeDq/1rMbp0z826iuYjt17gA0cQzUJhdhtigNOBtJv7TFo5TDn9NbgSUeUOe6d1Hb
         QwHBVZhWVl68sKTilbKTk1kgmTmnLmIPrNmdFjKqfclB6vcEbPq+iUViIKJhkf154due
         y3wSxcoohctq5QlNqa7uGpbCLP2b6/8yvRSmWrfQTay3TiJPYUxpWj5Z1XWc1VoUlVwA
         +wyR62LpHsXBLCw2JHHC38vDdEplWp0uOJXGeWXDxMenBe2f/o9y+T7tOMEXF+ZYktnf
         +QSg==
X-Gm-Message-State: AC+VfDx058oRL74X3qLZgU8Ukik3qACW1vizZp8UGbA+bL57mCs/qRnw
        +pbG5OGTf+Xbe+XB5b961K6QtlhPQxitdlleBXMjApifzru7
X-Google-Smtp-Source: ACHHUZ7es2/0OYCgP9Xe9+U9nOMkBNUXSJs2+g2Sx3i1cyfAId1btZVYLtMzAKFe6WLIK1k38RkxmhHr4PLlb5Wssps8Nws/9xja
MIME-Version: 1.0
X-Received: by 2002:a02:848f:0:b0:423:219d:81ce with SMTP id
 f15-20020a02848f000000b00423219d81cemr7555030jai.2.1687527142625; Fri, 23 Jun
 2023 06:32:22 -0700 (PDT)
Date:   Fri, 23 Jun 2023 06:32:22 -0700
In-Reply-To: <000000000000a56e9105d0cec021@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e298cd05fecc07d4@google.com>
Subject: Re: [syzbot] [usb?] WARNING in usbnet_start_xmit/usb_submit_urb
From:   syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, davem@davemloft.net, dvyukov@google.com,
        edumazet@google.com, gregkh@linuxfoundation.org,
        kbuild-all@lists.01.org, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lkp@intel.com, netdev@vger.kernel.org, nogikh@google.com,
        oneukum@suse.com, pabeni@redhat.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, troels@connectedcars.dk
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this issue to:

commit 45bf39f8df7f05efb83b302c65ae3b9bc92b7065
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Tue Jan 31 20:49:04 2023 +0000

    USB: core: Don't hold device lock while reading the "descriptors" sysfs file

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=124b5877280000
start commit:   692b7dc87ca6 Merge tag 'hyperv-fixes-signed-20230619' of g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=114b5877280000
console output: https://syzkaller.appspot.com/x/log.txt?x=164b5877280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cbd298d0aff1140
dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1760094b280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1359cdf3280000

Reported-by: syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com
Fixes: 45bf39f8df7f ("USB: core: Don't hold device lock while reading the "descriptors" sysfs file")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
