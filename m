Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F16C10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 20:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A73220869
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 20:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388345AbfDRUYB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:24:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:50662 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728508AbfDRUYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 16:24:01 -0400
Received: by mail-io1-f71.google.com with SMTP id b26so1954549ioa.17
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 13:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ZracRX8tHCAe7N4jOCfzAMhbSCUrKkQKgMx7CreVTxo=;
        b=Pr0FLitx5jA7jFcU2Nqorwkpg5JfS25LuTz5kAs9JRaSN9RmbUDY2FR18zcjZI7GBj
         KI/lUjzVYvNM48VOUKM+WcFfpLdGqBXS0uP3Fxpw3ZoUEzoMV2ljxV8HPmCR4GzaRK9R
         BcQscfKmw7kWgPdVmsUm0eoGoIRvu5PAZh+F8ndF1KNQbSpCieDj4q7jHgpqmVRX+08x
         +PcMmfeBTNRE2wR+MbGqNaAk16znvgwODi//9KsWNuL5VMkMsENbT/gbWwbGeO07egkw
         /SmfN69l8QmLXjak+OPCnh3wffpF5DkFDw9yAin0MyCAjHfjhAOpfQdBPRANw90F6YFb
         10kA==
X-Gm-Message-State: APjAAAVw61qkjYZOOQKsVAf7jub++yHEdS5UbePwIxlS4cv2c/IbxcW5
        C8JhY2C1batIzp1lpgJcPSNESmNxd1ZjRrlrYGQrQ5QDBLNp
X-Google-Smtp-Source: APXvYqw/uxI19+t0jzklI5shyQTAckuSmI+8Oe/V9QytsAbWMA5wT9tL9KcxJH0FMsvM5h5t1qJk1Iy7gb+BETxw1dxKDiE9a19l
MIME-Version: 1.0
X-Received: by 2002:a24:254c:: with SMTP id g73mr4904277itg.77.1555619041064;
 Thu, 18 Apr 2019 13:24:01 -0700 (PDT)
Date:   Thu, 18 Apr 2019 13:24:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1904181600330.1303-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000593cac0586d3c801@google.com>
Subject: Re: WARNING in usb_submit_urb (4)
From:   syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418202401.d4B4M2aqjXXUIgy5BZldnidGsPXtp1Bnj0IBfc1RTHw@z>

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com

Tested on:

commit:         e12e00e3 Merge tag 'kbuild-fixes-v4.20' of git://git.kerne..
git tree:        
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=69667e62a5e247a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12231967200000

Note: testing is done by a robot and is best-effort only.
