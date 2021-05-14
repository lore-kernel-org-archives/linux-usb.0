Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FBBC433ED
	for <linux-usb@archiver.kernel.org>; Fri, 14 May 2021 15:33:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C491A613C4
	for <linux-usb@archiver.kernel.org>; Fri, 14 May 2021 15:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbhENPeT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 14 May 2021 11:34:19 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57987 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234863AbhENPeG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 May 2021 11:34:06 -0400
Received: (qmail 1009388 invoked by uid 1000); 14 May 2021 11:32:53 -0400
Date:   Fri, 14 May 2021 11:32:53 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+95afd23673f5dd295c57@syzkaller.appspotmail.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
        nic_swsd <nic_swsd@realtek.com>
Subject: Re: [syzbot] WARNING in rtl8152_probe
Message-ID: <20210514153253.GA1007561@rowland.harvard.edu>
References: <0000000000009df1b605c21ecca8@google.com>
 <7de0296584334229917504da50a0ac38@realtek.com>
 <20210513142552.GA967812@rowland.harvard.edu>
 <bde8fc1229ec41e99ec77f112cc5ee01@realtek.com>
 <YJ4dU3yCwd2wMq5f@kroah.com>
 <bddf302301f5420db0fa049c895c9b14@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bddf302301f5420db0fa049c895c9b14@realtek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 14, 2021 at 07:50:19AM +0000, Hayes Wang wrote:
> Greg KH <greg@kroah.com>
> > Sent: Friday, May 14, 2021 2:49 PM
> [...]
> > Because people can create "bad" devices and plug them into a system
> > which causes the driver to load and then potentially crash the system or
> > do other bad things.
> > 
> > USB drivers now need to be able to handle "malicious" devices, it's been
> > that way for many years now.
> 
> My question is that even I check whole the USB descriptor, the malicious
> devices could duplicate it easily to pass my checks. That is, I could add a
> lot of checks, but it still doesn't prevent malicious devices. Is this meaningful?

The real motivation here, which nobody has mentioned explicitly yet, is 
that the driver needs to be careful enough that it won't crash no matter 
what bizarre, malfunctioning, or malicious device is attached.

Even if a device isn't malicious, if it is buggy, broken, or 
malfunctioning in some way then it can present input that a normal 
device would never generate.  If the driver isn't prepared to handle 
this unusual input, it may crash.  That is specifically what we want to 
avoid.

So if a peculiar emulated device created by syzbot is capable of 
crashing the driver, then somewhere there is a bug which needs to be 
fixed.  It's true that fixing all these bugs might not protect against a 
malicious device which deliberately behaves in an apparently reasonable 
manner.  But it does reduce the attack surface.

Alan Stern
