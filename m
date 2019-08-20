Return-Path: <SRS0=RNjJ=WQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345D0C3A589
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 14:00:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B2D722CF7
	for <linux-usb@archiver.kernel.org>; Tue, 20 Aug 2019 14:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730206AbfHTOAB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Aug 2019 10:00:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:48224 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729992AbfHTOAB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 10:00:01 -0400
Received: by mail-io1-f71.google.com with SMTP id 67so8004833iob.15
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2019 07:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ASDXW2E7KXMpMKDYt2/KtjplUC1Y+GtjxBVSliflfMc=;
        b=fdrf2iWuHPEn7xlWnzp4vHdHh1/tSmLQZ+6lLOtMo/Q6ERdy7OZKiuIN3sC5lFbj77
         0x+dgFnLDdOO4ZeddhKpg3VIa7s8+QDpZm2JFXnn6Qyvz+QixWcWfNeqhZS/MP3FRur2
         O06Ww4cTw9lIKUMMyzOD4Bz/oCbqEPOWrl60ADBkKNc0HEuhpBrrcilnqUjdn3J63X5I
         vtCGTOk/dkqJIBW1sHhoy0k/Wb3HLt42bfnOHzefzHwrnaeVlMWyuLmHASlvqblXe577
         qsAG8EEy8f2dg7pGT+0sUJ8wjn1giWFLngDgwOoHifhQ9BPoQ8nr5uGbGyn829WrJtv/
         SW/A==
X-Gm-Message-State: APjAAAVkbd8a+BxXC1UD1ZaitfiS182gA6/N1tyWNPEFJC/Q5AspMc9n
        viDKh2sPKOFMciGTICsTh9g5P0iC5EMXdOZL81yzXl2WFDTL
X-Google-Smtp-Source: APXvYqzCAomdF+cu9howSNeP4SWjf9rPBRLWb1WQl9Waj1HmLgBZk6aILrJFdwE+y/tSODYhJiCoDMsV5/EYsHupSKFw+7tYvNkV
MIME-Version: 1.0
X-Received: by 2002:a5d:9c12:: with SMTP id 18mr32292118ioe.48.1566309600404;
 Tue, 20 Aug 2019 07:00:00 -0700 (PDT)
Date:   Tue, 20 Aug 2019 07:00:00 -0700
In-Reply-To: <1566308508.11678.19.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000572f4505908cdff6@google.com>
Subject: Re: WARNING in wdm_write/usb_submit_urb
From:   syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bjorn@mork.no, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com

Tested on:

commit:         e06ce4da usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=142198bc600000

Note: testing is done by a robot and is best-effort only.
