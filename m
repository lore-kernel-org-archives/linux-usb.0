Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231F8EB64DA
	for <linux-usb@archiver.kernel.org>; Fri, 14 Jul 2023 06:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbjGNGzq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 14 Jul 2023 02:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbjGNGzo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jul 2023 02:55:44 -0400
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23A41FD4
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 23:55:42 -0700 (PDT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1b743cee7faso2481456fac.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 23:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317742; x=1691909742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRxM1ic75/5PISaRQM3Zs6NAL5LM0bTj1rOpZijgN4Y=;
        b=ImksWrIwouXa/+SW5cqCsqQnTBoYCxdyNQ5lKoN33zbzd7XuDsvK2Z0cDwa7X5LQSV
         Iq7Z1VWULF2OZ6f7G8J3g/5JW5R7wdkXvjRihgzVTuFgbBOx5MRhxQ3mu8Z839uoSXXh
         pzI1JonJI8cLkWyim9Zhruud9iVFZ1ZFWhLwCtcU53+I88AhaD7/hxs5r8h/9/urozwl
         0szMo+gbjGikGNHlOHUnh3bPlwJ8Vj8wkWUFe5OMaUn9AQIND9tAuTTlh6NamC/IdCAK
         HsgMr5u13Rm6I3/Gnx2f/Xee/TeQk7CYCNTRpWlNg5AQT9g8R3QuZGXReWLlBHjTkRHf
         TMhw==
X-Gm-Message-State: ABy/qLZ/JVRFn0CqMsFHvB9elHYQNmSoCAd8IoEhAZhpD7FMwtaEQXeB
        hsG4NtrrNxtisgjazHv0UMSNZ52+Rxt9sab0/EvexgoyOEIu
X-Google-Smtp-Source: APBJJlGSZXo0hUPRjLJVOTelbgDqRovbf4jU5qkU76ZsEms/mBxYXaATIacI3TIKgtacnPBlsB3jRLOCNWk1+Mu5sZAkXl2NDoCz
MIME-Version: 1.0
X-Received: by 2002:a05:6870:8c1a:b0:1aa:22cd:8ad1 with SMTP id
 ec26-20020a0568708c1a00b001aa22cd8ad1mr3530441oab.11.1689317742266; Thu, 13
 Jul 2023 23:55:42 -0700 (PDT)
Date:   Thu, 13 Jul 2023 23:55:42 -0700
In-Reply-To: <CALm+0cWBh+4GMzfRKR6rE4H4JR5aRW_m1KVdTLZLJuQyE_smRg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0ce0206006cef79@google.com>
Subject: Re: [syzbot] [usb?] memory leak in raw_open
From:   syzbot <syzbot+feb045d335c1fdde5bf7@syzkaller.appspotmail.com>
To:     andreyknvl@gmail.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        qiang.zhang1211@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/usb/gadget/legacy/raw_gadget.c
patch: **** unexpected end of file in patch



Tested on:

commit:         7c2878be Add linux-next specific files for 20230714
git tree:       linux-next
dashboard link: https://syzkaller.appspot.com/bug?extid=feb045d335c1fdde5bf7
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14266bcca80000

