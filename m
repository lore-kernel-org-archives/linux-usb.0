Return-Path: <SRS0=aDjS=WP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25CBC3A5A0
	for <linux-usb@archiver.kernel.org>; Mon, 19 Aug 2019 12:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95EB62085A
	for <linux-usb@archiver.kernel.org>; Mon, 19 Aug 2019 12:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfHSMhw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 19 Aug 2019 08:37:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:38034 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726594AbfHSMhw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 08:37:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C6021AB9B;
        Mon, 19 Aug 2019 12:37:50 +0000 (UTC)
Message-ID: <1566218263.5663.22.camel@suse.com>
Subject: Re: divide error in usbtmc_generic_read
From:   Oliver Neukum <oneukum@suse.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        steve_bayless@keysight.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com,
        syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Mon, 19 Aug 2019 14:37:43 +0200
In-Reply-To: <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com>
References: <000000000000a59094059013dd63@google.com>
         <1565875886.5780.7.camel@suse.com>
         <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 19.08.2019, 14:17 +0200 schrieb Andrey Konovalov:
> On Thu, Aug 15, 2019 at 3:31 PM Oliver Neukum <oneukum@suse.com> wrote:
> > 
> > Am Mittwoch, den 14.08.2019, 06:38 -0700 schrieb syzbot:
> > > syzbot has tested the proposed patch but the reproducer still triggered
> > > crash:
> > > KASAN: use-after-free Read in usbtmc_disconnect
> > 
> > I am afraid that is a difficiency in KASAN that should be fixed.
> > Is the class of the error compared if I leave in more of the
> > original bug report? Actually the ID is still there, so it really
> > should return an inconclusive in these cases.
> 
> I don't get this, what kind of deficiency do you mean?

The original error was a divide by zero. The first fix fixed that
but still another error showed up. If I propose a fix there are
other possibilities besides it working.

I could have no effect on the original bug or my fix breaks
something else and KASAN is making no difference between
those cases.

	Regards
		Oliver

