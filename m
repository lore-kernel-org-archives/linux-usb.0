Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2141EC001DE
	for <linux-usb@archiver.kernel.org>; Tue, 25 Jul 2023 20:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjGYUyd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Jul 2023 16:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjGYUyc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 16:54:32 -0400
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4560B99
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 13:54:31 -0700 (PDT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a3b8b73cbfso12497532b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 13:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690318470; x=1690923270;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ejXN8AprGfR9AKwncAkWUXzG2HufstQa8B4GIZTWak=;
        b=WUsieKnhI+a+8jFXWR5MFYTa3nW/mrlVqc8iKUJE5ECKDwk2dwACAoCdthzm8Wyp26
         oGFMbI+na5kGF3LqGKXPAWkLFVbhMvq1JZqh2T9gQXDRNONO/272sadGzsFFX/4bP/Mx
         Gl+AuxJAFzKwoIa/24WfwURHKCogXl3C3GWYxamTRc7t/1hV/QY8urIBO/w6nM+C8WA1
         HlADnGgX6HDXOYci46wog6gAtlHtdAXk/yo4NTko699da4p8LuxZm3W11VjiAvWJb1Ib
         uwXHB1AEy1uFE0znL4zuf3v9K4rT5actQh2tvgmWc7ximbFnvXYVWRs0CceBrGKDTVyI
         u9kg==
X-Gm-Message-State: ABy/qLYC4pehlCIwNPMSa8Bpzfam9k+WzNgItE5Dlij/LOdlnylHs2ER
        pqi+Y0RtnPXEHByRk0e3wOMjNtrsr3E+ziLUGl1l0L/fzlLk
X-Google-Smtp-Source: APBJJlEAhGZsDAw1eV8ttcoRM6LfzdrAit9J+xnGqJEmT0WVX486CF3ugoLM5oopuezFNBGg4HpgycFZVy3v4L2h6DDPN1vlcyrd
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1818:b0:3a2:6d0f:5b27 with SMTP id
 bh24-20020a056808181800b003a26d0f5b27mr90950oib.2.1690318470652; Tue, 25 Jul
 2023 13:54:30 -0700 (PDT)
Date:   Tue, 25 Jul 2023 13:54:30 -0700
In-Reply-To: <c9bb72e0-8e02-4568-bd43-6897f9c94d12@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000000276a060155f0a5@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in
 read_descriptors (3)
From:   syzbot <syzbot+18996170f8096c6174d0@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, khazhy@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+18996170f8096c6174d0@syzkaller.appspotmail.com

Tested on:

commit:         6eaae198 Linux 6.5-rc3
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.5-rc3
console output: https://syzkaller.appspot.com/x/log.txt?x=13d77b76a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c7b1aac4a6659b6d
dashboard link: https://syzkaller.appspot.com/bug?extid=18996170f8096c6174d0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1339684aa80000

Note: testing is done by a robot and is best-effort only.
