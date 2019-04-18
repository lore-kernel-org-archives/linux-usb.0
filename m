Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE8CC10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 18:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7288A217D7
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 18:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391021AbfDRS3B (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 14:29:01 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:35352 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390215AbfDRS3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 14:29:01 -0400
Received: by mail-io1-f72.google.com with SMTP id k2so2697300ioj.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 11:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=BU1SsEMdAzv7X0W9Kg2IG+F4HPH+CSCzZboTZS2QsC8=;
        b=dPVeix6z3FuCoQEEtma+zi2UyjhieIrxr1dLEpGs4HcnEDl925+MYITEj+UoHRMKtM
         PRF8okQcDl/GDezy6Ofst7q7VC9dKpTzV48UAajMK6clNx5KZ9nhscr+5WXxNh2DXaqB
         mV+STLfZswMtJ6JaXw+Hf3iCVz8SxZLimXp1M7pzn+0ZKPG6hnVwTdHrUb3W+P06D8+g
         WDWbnTym+FvfDGUJUBK8AFexeJtW59kySvjO8uO03RvkGnFZcF/QK+FER+2c/oxS5EgP
         sXZ8bFGSU/91QjYnFRco4Nl8tTdXERBKDtMMddZRpOurzgojecCM9JvKLklqCnSX18Oz
         i58g==
X-Gm-Message-State: APjAAAV+Ien83CGN6fGzcodzk5f7gUh/fCVcepY6GokAYMiKIQ3aQTmP
        4qTlxg84DbHgvLz92P/rRgO9COukkHbdBfHgrdfAp3C8nVAs
X-Google-Smtp-Source: APXvYqwvfJD0b5aBWpD2uzjmdB2PCMFSp2fj8NKFHC4vFo/eQp2KHqL/G2dLDERJVHgxCJb+YK1P+qo2gu9YUNnpleDwoZcN+Pu4
MIME-Version: 1.0
X-Received: by 2002:a24:7bcb:: with SMTP id q194mr4514267itc.173.1555612140806;
 Thu, 18 Apr 2019 11:29:00 -0700 (PDT)
Date:   Thu, 18 Apr 2019 11:29:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904181405430.1303-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000fa8360586d22dd5@google.com>
Subject: Re: WARNING in usb_submit_urb (4)
From:   syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418182900.xYf91C2MPx3waONCw1w4Enjt9V_KMupf4g5SSqLXdFw@z>

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com

Tested on:

commit:         e12e00e3 Merge tag 'kbuild-fixes-v4.20' of git://git.kerne..
git tree:        
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=69667e62a5e247a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17a7eaa0a00000

Note: testing is done by a robot and is best-effort only.
