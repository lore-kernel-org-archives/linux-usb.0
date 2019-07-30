Return-Path: <SRS0=izAS=V3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68758C0650F
	for <linux-usb@archiver.kernel.org>; Tue, 30 Jul 2019 08:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F3F2206E0
	for <linux-usb@archiver.kernel.org>; Tue, 30 Jul 2019 08:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730661AbfG3IaB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 30 Jul 2019 04:30:01 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:55632 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730649AbfG3IaB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jul 2019 04:30:01 -0400
Received: by mail-io1-f72.google.com with SMTP id f22so70631308ioh.22
        for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2019 01:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=RFgSTCfcESdk+wudtp7BymcAVpIjxQ2mPwsiS44G8Uw=;
        b=k3yDvTd+gn5P6G6ZTW10CDvhBiPkHhVSJlHyZKdSzPmsgUyX4OxTA2WrjpZyI2e7Xg
         XKWeT2SmTAFG5eVj6n9kvE7vF8zajn99Elo1TYC8mURc+ejq472letVrSbbnRog8bbOz
         n23sCcv2PbGmaToEBbDoSi4f9LmaGuo+wbO75/K45z9vka5PJ25J7eS9IfIMHz+KWyTL
         tXecWz+sCj41O5Qdjef3sDIKvvNtSjoyVyN1VhPbGxs+PVP37eD0OWj49djzhYh7FJkF
         LOVUvpjFISaJBv371mYygUzBZy+Pry53qjlcwozi8FawfGr1VYeAJDf4n0cpj5Pbojdc
         AVpA==
X-Gm-Message-State: APjAAAUjiuWX1F+8DP7t0F9q1nVKg6alwbpT/oeGY9PvMmJcVbcqtWKP
        /FfhaliXd9VHR4EFQvVjlTjnJatGodkUPKwVpQ/PL7BX1Owz
X-Google-Smtp-Source: APXvYqw7fepiZjUizcBLP5VnhleGqr3AULHdUUS/YFdJOaywH95yk0+F/Mwtou+Z+8O67IaVpqQRRGb+Ue7Nrgf7+87oN4YKEacX
MIME-Version: 1.0
X-Received: by 2002:a5d:9957:: with SMTP id v23mr29208723ios.117.1564475400495;
 Tue, 30 Jul 2019 01:30:00 -0700 (PDT)
Date:   Tue, 30 Jul 2019 01:30:00 -0700
In-Reply-To: <1564472907.25582.16.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000081a9c1058ee1d06a@google.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
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
syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com

Tested on:

commit:         9a33b369 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1226c2d8600000

Note: testing is done by a robot and is best-effort only.
