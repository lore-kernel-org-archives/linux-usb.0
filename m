Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0ECC282DC
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 19:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0AC0205C9
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 19:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbfDQT4C (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 15:56:02 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:57272 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbfDQT4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 15:56:01 -0400
Received: by mail-it1-f200.google.com with SMTP id s21so3598334ite.6
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 12:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=4EnWXPRDU1/SXQUQsehK72eVw6iHGNpMYvY1Rbcgl/I=;
        b=d+9GhrtFKzTGYZkU1Bp86sXRENH1jC0E8Y+qEqj0Rpp1wIyrSiYbOFwdxRFzGHYSWr
         umebYn9PFbk4b8YN6P/iNzYxwmcghOX0os6QItDRkW5gim/aCUCTaLGdtKE7xD2wZGQo
         nYbYEz9n8Di4VOot3AEN8gQH2ZHOex6jG9EsB/K64Uz2PpGgTl3zM8erubxXZmKHiziS
         eRC/RBYYp2/tBLq/EFgTlTPDM0NC6C0BkbXYXxy/ZKKIGGIKdaMHfMkjYnWLFJFTg7+h
         pQrssQ7mllnklt6NMnONyqrqJba3wdRqfR5DqTHXW69xAGy6qAkwRiDehIVlfpjjNuOy
         vWIQ==
X-Gm-Message-State: APjAAAU/IHDIHE4QjeNDe5imHtlGExXnYubIULA/NEkwHPK+6lRbr/6u
        SaIeHp9mq40K5w/48BzJv2XwJC1roMQBYZx64WKXay/hQrsq
X-Google-Smtp-Source: APXvYqyXfphPPaOIWtxONYOTAnUuTpGkklcans3tSg21nOoaUgTrlyKYQUlUQ1d/fpsKgqbNYFkWsiNxx6yvQr7CC50zY83Ju4/k
MIME-Version: 1.0
X-Received: by 2002:a24:7b4f:: with SMTP id q76mr315710itc.142.1555530960395;
 Wed, 17 Apr 2019 12:56:00 -0700 (PDT)
Date:   Wed, 17 Apr 2019 12:56:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904171503410.1400-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000054e5e70586bf46cc@google.com>
Subject: Re: INFO: task hung in usb_kill_urb
From:   syzbot <syzbot+d919b0f29d7b5a4994b9@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417195600.OIzf1njsgxYDT72Tv0dG1hc6fjbT8jZE7VfwfZL5xIs@z>

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d919b0f29d7b5a4994b9@syzkaller.appspotmail.com

Tested on:

commit:         d34f9519 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan/tree/usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12a17dfd200000

Note: testing is done by a robot and is best-effort only.
