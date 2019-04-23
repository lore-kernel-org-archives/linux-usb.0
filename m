Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2190C10F03
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 17:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C89E20835
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 17:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbfDWRYB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 13:24:01 -0400
Received: from mail-it1-f199.google.com ([209.85.166.199]:50908 "EHLO
        mail-it1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729111AbfDWRYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Apr 2019 13:24:01 -0400
Received: by mail-it1-f199.google.com with SMTP id k8so671226itd.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2019 10:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=VkO5Vfxw4veeWkeJxoQ/C7OfI5b7RDTFdrBLqvxB0XQ=;
        b=SNixXdZhHK6a6QhY7C5AGNAWaMTn4CEdOO2gYGTdqMrjVcKdiXbjoL0uB5MbkTI/+j
         HDb5MdlSoq6uMNHg2ShqiorEj0Ht2MRFBF8l82Qdg45vvFmUNJ6izRBtvig7xWowXSKH
         kW2ofYK8CWjaNqCTIZ/YA3BkUUPoPH58IAzCWisdKiOrGaX5tXwJOcWhwUadOZPg9Twl
         O7StSD8vlp9WGvmGM4XQNHmPUZdQW/t/QMw1+pG7KYON8gviS37RKQeL6zjlv5zg0ngL
         ZhEwasbLQ6QE7DhS4GbygJxRrErcLtxo80gqQfBU1LUwr8SBnOmSIvQtN+7xZydsGuHf
         xqag==
X-Gm-Message-State: APjAAAVQ03e7U4sP0MbQnP8GDKqPic1OCfsT4rOPeWMpLnUgcGteeZZ1
        sz6F4qFJxSUvP3B1SL/3p9vo7li3N+9kk5W35s8IrqZRedNg
X-Google-Smtp-Source: APXvYqwcG4FqIkJ2PZJZE6YG9HqGfLHkD4/caAtEYA3OSAL+nUPhgkWSA6UhReP81D1s8O+pQ8lYSaDNP2wtMA+Bokrbku+3CzlK
MIME-Version: 1.0
X-Received: by 2002:a24:9197:: with SMTP id i145mr2970973ite.117.1556040240602;
 Tue, 23 Apr 2019 10:24:00 -0700 (PDT)
Date:   Tue, 23 Apr 2019 10:24:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904231240270.1461-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cc2582058735d960@google.com>
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
Message-ID: <20190423172400.1_TqRmfejrEUbeqekyPmtoSbO2joWXyfhW6iZzwoNB8@z>

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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13448547200000

Note: testing is done by a robot and is best-effort only.
