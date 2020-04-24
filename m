Return-Path: <SRS0=GD98=6I=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81141C54FCB
	for <linux-usb@archiver.kernel.org>; Fri, 24 Apr 2020 19:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3691A2075A
	for <linux-usb@archiver.kernel.org>; Fri, 24 Apr 2020 19:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgDXTcE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Apr 2020 15:32:04 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:38545 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDXTcE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 15:32:04 -0400
Received: by mail-il1-f199.google.com with SMTP id u11so11410200ilg.5
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 12:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=vA7Hj07TAr42CqeEpKdo2ArIABvLEDSOmjr35bxOqYk=;
        b=Qn59LZxQnExBysV8CAllSgRBw2NT5frVruKWc/qa4WvJSR9vbREcTVlFoYis/m/bpv
         yZQ7y55MhEzm3d8TZ/46jTAG7GGa1osL7Mofo8dzJ9uJbs7lW97GwlkQo99vU4GW5ZiD
         vJohdadVokbjXlKn7kOiIQ1b6hSsnXveVyyqb8dXKEqxkceA/zRWsSC54iQOIOnh+Fby
         5NRsdh0X0N6GH3FsB/E4ROkhGgDE1zrR/QhtnAcbN+1oHeKPRPPx7I0EhbEdQpVBO6jc
         fxbc/f0lVRuWozhg3zezPcALq2KiDiHsKEElKXAkxZUeeC/dOGFL9Qw8JFIcGxxG3LAB
         EmVw==
X-Gm-Message-State: AGi0Pubvrkpf56LDgwNLv3jVF9/hhHnLX2LT9on9t36Tl7y+5BfbcF/Z
        CkfFUlfyztHCWWWeqOmtTluqdgaM3upNWdMXIE3P5XWVzjys
X-Google-Smtp-Source: APiQypIjA6RvuhP8WE5NS5VHcMG7z2cPwvLAODZjpQt6NcmRh+vcAX3PNIes9BadXSxMx0IyZf4f8vwRvOzENlSCONhfZNGzZl0S
MIME-Version: 1.0
X-Received: by 2002:a05:6638:f92:: with SMTP id h18mr10148653jal.115.1587756722804;
 Fri, 24 Apr 2020 12:32:02 -0700 (PDT)
Date:   Fri, 24 Apr 2020 12:32:02 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004241456070.17162-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073e03705a40e6b38@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
From:   syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17d37144100000

Note: testing is done by a robot and is best-effort only.
