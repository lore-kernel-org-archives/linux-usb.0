Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92C9C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 19:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8DE720663
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 19:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730335AbfDPTDD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 15:03:03 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:40141 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbfDPTDC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 15:03:02 -0400
Received: by mail-io1-f69.google.com with SMTP id e72so17375445iof.7
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 12:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=lxKut/HU+wkC7ZEcirpdmi7wbjnE0Dg75ohOiteV7/k=;
        b=Nnlk8kKvXdzeh+ofEY+8waXhSaQOOMuFDhYMQ/iczjpnur0KGCidEoLY4Kz9HrMd3D
         3yyx/lpU5XCICZz9uNcw5d20DYgXpuze2Kui3G4YugQ0fGc/uWGGZ46ofSoYMh4d3Kn+
         jm8+rS9j/o/1rSfc6RBQyA1/xUI1a2Gpr8Udev1CiPqWEfQNiOjAi1g/QZRnLWfmbdSG
         JXNMlfcz6ItNCLkaVdALg+eol/2FWXRiD8nyMSIYJDsPxJW7h7x8aZKsv0guHApgfGjJ
         uCwWl08NG7cxSjUUBBeOJDBarTeYkiO2sNUnSB+gDrwpHiQv/LYpo/rQCR3jpQL8ckCX
         yIfw==
X-Gm-Message-State: APjAAAU8Y5FpIkqcNZ+OY7mAIfj2FFQfK83Qo0RvUQhYXr21+2/P5vF4
        eWTm04tNH2aQoDQHpCjJGbS17GiQSo2w3aaXYtZJrt6pO+lO
X-Google-Smtp-Source: APXvYqxmLSv9mlCqd+l3cODicH/ctwi7Jnt4DCPyBOuMEvnCs9BLM4IIRMQMv/CSQyGywGduJYrKc1IGflO5nHdEvBpDDxM3Flnn
MIME-Version: 1.0
X-Received: by 2002:a6b:c885:: with SMTP id y127mr6200078iof.2.1555441380972;
 Tue, 16 Apr 2019 12:03:00 -0700 (PDT)
Date:   Tue, 16 Apr 2019 12:03:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904161421530.1605-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb61d40586aa6a1e@google.com>
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
Message-ID: <20190416190300.yBzYeK5_A12sRr20ZJUQG5EOB5jeKTfEX0IxuwnqqDI@z>

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d919b0f29d7b5a4994b9@syzkaller.appspotmail.com

Tested on:

commit:         9a33b369 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan/tree/usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1260cccb200000

Note: testing is done by a robot and is best-effort only.
