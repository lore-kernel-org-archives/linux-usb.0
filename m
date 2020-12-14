Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1C6C2BB9A
	for <linux-usb@archiver.kernel.org>; Mon, 14 Dec 2020 20:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52E1E207A2
	for <linux-usb@archiver.kernel.org>; Mon, 14 Dec 2020 20:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502889AbgLNUPN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 14 Dec 2020 15:15:13 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:39672 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503094AbgLNUMo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Dec 2020 15:12:44 -0500
Received: by mail-il1-f198.google.com with SMTP id f2so14539117ils.6
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 12:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=qwOdLt+7OtBCq8ntrHqjxb5zguAuKgGyZJXiIAiKLL8=;
        b=PzNpdSibYZbqiNIyo3yIKUc9dMap+DmS3XDdAY0LJc9ALeWjFbyxOu+9mAutZApjO1
         Q+RekFa56HDwgUr4prnjBFv5w+U+15WYEc9pI0gsoFkOTKczETgtVMnWJUEJW/pjUHNB
         VMv5/yA2CJEjZFUOhTOgvCpCxf0frdH8aH7dlUHRelkQE2F4Q0pARdmc98EV2CmGStEU
         KLhtko4CbvMGZyYxjCYKQZeEma/qPb5XhQuKwD61WzwYnkiPZN66s8pg3jEgD9E4Kfaf
         Y9xtY3LeS2SuyYBr90/GfF4bR2r0auM930GNpDZjmzyWtIU12ZMHmmrzaQZ1aw5DtM8o
         c2fw==
X-Gm-Message-State: AOAM531run2Gc3KlcyDqRIY6YXTZ0b3xBU7jXlzuC4qIxu/245GgY1kX
        qlY4IwGRxqoHUTNQ6sJIrfqYFEwbkBtAKQ0N9+/tTEEpIv6F
X-Google-Smtp-Source: ABdhPJxGk6qAN5y8QjwxmUH3VlUQvFFxBo49Eb4LJWyrkVn0YnMAjOK56iPxkABY0ATpU1RkoIaq5zvsHOalHb71CYGDQ0WV6ub+
MIME-Version: 1.0
X-Received: by 2002:a92:9a58:: with SMTP id t85mr38019496ili.172.1607976723542;
 Mon, 14 Dec 2020 12:12:03 -0800 (PST)
Date:   Mon, 14 Dec 2020 12:12:03 -0800
In-Reply-To: <X9eB5ZZMq6q5j4eW@localhost>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000069fb4f05b6724198@google.com>
Subject: Re: WARNING in yurex_write/usb_submit_urb
From:   syzbot <syzbot+e87ebe0f7913f71f2ea5@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        johan@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stable@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+e87ebe0f7913f71f2ea5@syzkaller.appspotmail.com

Tested on:

commit:         a256e240 usb: phy: convert comma to semicolon
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
kernel config:  https://syzkaller.appspot.com/x/.config?x=4536e7f93c2bc8e9
dashboard link: https://syzkaller.appspot.com/bug?extid=e87ebe0f7913f71f2ea5
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11a9f703500000

Note: testing is done by a robot and is best-effort only.
