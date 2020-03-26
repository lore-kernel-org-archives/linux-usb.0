Return-Path: <SRS0=73Qb=5L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F69C43331
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 02:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D62A72073E
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 02:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCZCnD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 25 Mar 2020 22:43:03 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:55756 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbgCZCnD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 22:43:03 -0400
Received: by mail-il1-f197.google.com with SMTP id h10so3961446ilq.22
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2020 19:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=aNKbH0C5nhaSvaxnuPHvbScDrpBtg5wAIeotQ1aTojQ=;
        b=VzXFFf/jC2ulZ6dhOHv2yCPcdrrglJ95s1pK9QVSMuFKwbSq6SeLAVBpMfJjVhJ6Ql
         SyGG3VmmjwVRUNrXjCYttPU41JNQwLFK3ysFvBp9PowAs3xZbSPT0gCpyp7jDBgHzWT/
         H+F6UoaOEmmr4jAsgTMWof/V7YsBEEobK6O9VUReWUp/arfJDFTsSQgndPjBg7qScmLp
         WzanUXFZtzED7u3DsAp5XZyLitI4i3v6AdSgqwjvH2LQgcx55jy4lgiSvpm5goi4YN6K
         27TngeFISQEAjVvfQtAXzP8nprJ1OPm1wspJByJuR6kWWLjTRPNFMUWwajhb9uZwr3ri
         Nzzw==
X-Gm-Message-State: ANhLgQ1t4ZnjlsWPKjCVje5DMq30r8D5nieswFr4eGjZ+0vcDC1+PUd1
        8QuOmtthFrCwnl0sIEfQnvbpuRW+8gnMUvdMZPT1/RLPWcaq
X-Google-Smtp-Source: ADFU+vsyJo5aW8olRQsuP2lZBL8G2f0aIdWmmHouPiIHprsbNVwb6QosdWSqAkw/ANNEu5ryjz7fKFC1xIL+0vYyBOsRmfaXCFbu
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:be7:: with SMTP id d7mr6759283ilu.238.1585190582522;
 Wed, 25 Mar 2020 19:43:02 -0700 (PDT)
Date:   Wed, 25 Mar 2020 19:43:02 -0700
In-Reply-To: <CADG63jDu3Q=OmjaJRKV_drF9vcJt_OhwJoYiKfQ=e0rJif-pOg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000929bf405a1b8f162@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hfa384x_usbin_callback
From:   syzbot <syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, anenbupt@gmail.com,
        devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        hdanton@sina.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, nishkadg.linux@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com

Tested on:

commit:         e17994d1 usb: core: kcov: collect coverage from usb comple..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
dashboard link: https://syzkaller.appspot.com/bug?extid=7d42d68643a35f71ac8a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1406d1d3e00000

Note: testing is done by a robot and is best-effort only.
