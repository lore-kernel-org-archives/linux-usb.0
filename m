Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE32C282E1
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:17:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14C0B20821
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfDSURB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:17:01 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:43385 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfDSURB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:17:01 -0400
Received: by mail-it1-f200.google.com with SMTP id m192so6486347ita.8
        for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2019 13:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=My6TLiUyIB4RpVyrnFfTz4dPloCToKlSYn2hrxlbJP8=;
        b=nMbryPHZD6dr7wR6j98gszciT6Qyce+fv08ejvdOdoZMNmQOHsmxenxrbyQKd88IZj
         hCH21oKWJzKLIytwzdXJ7nZILlcfxEOqo8JRBrZQqdmV82WErTQwr4rs/khAXHGi2v/S
         nymzOXOT2H1QN2r9TXNkyZqD/eZeOkHzDIDL1uUfAMff1aF0rmphTsJWD3g05z0Xw+SA
         LDclYgtXxAS1Um2z0nlMDMTb2cbqcyNiyesDQUv9hUDSOIf2f0YIh1N/y/+rAe++sIPs
         jIL/FotFmawbebD7da7RDDYLxNIB5WZ1HnN0ITXpTbXA9cWoEC1WWMgs9emZK3hdKh0n
         W4Ww==
X-Gm-Message-State: APjAAAVsMwKtyvYDYsK4JCxLLTBeFacoARdKI9H1DKUm+lEB/5RVEdOe
        QDHod/mPHSx4vUXDNCldMmzyv9w2gCfBwn+dLhd70jOVzrF3
X-Google-Smtp-Source: APXvYqx8KuFa/vJu6es15l/7LDOmqu5Y8zPXTq0Us9V+5WFGcfbA3aMs5K1XJlogv/KQMl9ZqOG+zSoyf9Vx2+2VuLiNenb/2R0q
MIME-Version: 1.0
X-Received: by 2002:a24:46cc:: with SMTP id j195mr4418112itb.161.1555705020776;
 Fri, 19 Apr 2019 13:17:00 -0700 (PDT)
Date:   Fri, 19 Apr 2019 13:17:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904191536310.1406-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002385b50586e7cddb@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in ds_probe
From:   syzbot <syzbot+d65f673b847a1a96cdba@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, florian.harbecke@fau.de,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, passt@h-hofmeier.de,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        zbr@ioremap.net
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419201700.8WCb_l37VawWOxP8oGLXzXOUv514SShakJHSsANLyHo@z>

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d65f673b847a1a96cdba@syzkaller.appspotmail.com

Tested on:

commit:         d34f9519 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan/tree/usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1588b96b200000

Note: testing is done by a robot and is best-effort only.
