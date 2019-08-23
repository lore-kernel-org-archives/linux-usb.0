Return-Path: <SRS0=IKu2=WT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C6DC3A5A2
	for <linux-usb@archiver.kernel.org>; Fri, 23 Aug 2019 09:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C94E22CE3
	for <linux-usb@archiver.kernel.org>; Fri, 23 Aug 2019 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566552576;
	bh=XenzbbR3aGpSz8r7B1SXYn9xAm7cNzeX0FUnGdLYkqs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=d+bzfGZiU1GUrlMgDoU+wipQp8BvnyhTGiEOEmvPks+6im+t+TH3xDLVRYbJb663b
	 I1ak7wTQHcW5rOjjtjMIzRIoXFw4AJr+ID9GOFYllUma7U6kTmPme8ZXqJQ4m18XLR
	 O+kKsAka5rSLTAEcN+iqHb7Rg/p4maMVjTgJK4Bs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732034AbfHWJ3f (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 23 Aug 2019 05:29:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731961AbfHWJ3f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Aug 2019 05:29:35 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C76EA21726;
        Fri, 23 Aug 2019 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566552574;
        bh=XenzbbR3aGpSz8r7B1SXYn9xAm7cNzeX0FUnGdLYkqs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=FdDx7TANHjCBSkoMzhQhlztLcWAU6ALKr5+4yX6EwqKKmAX7B3Cu8bw9rnc7yIN4A
         Y3DZuYRfoAUmOX+GuCoOIWkEp2NZ6kD1PKVakdTdfU5JFHjJHpFDmd8KGQW7fkMMNI
         RieqpzgBzkAAA5T/vR1PdBCo+oDbifRDGjHZcY1Q=
Date:   Fri, 23 Aug 2019 11:29:22 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     Andrey Konovalov <andreyknvl@google.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hillf Danton <hdanton@sina.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Logitech
 driver
In-Reply-To: <Pine.LNX.4.44L0.1908221619370.1311-100000@iolanthe.rowland.org>
Message-ID: <nycvar.YFH.7.76.1908231128260.27147@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.1908221619370.1311-100000@iolanthe.rowland.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 22 Aug 2019, Alan Stern wrote:

> > > > I've ran the fuzzer with your patches applied overnight and noticed
> > > > another fallout of similar bugs. I think they are caused by a similar
> > > > issue in the sony HID driver. There's no hid_hw_stop() call in the "if
> > > > (!(hdev->claimed & HID_CLAIMED_INPUT))" case in sony_probe(). Does it
> > > > look like a bug to you?
> > >
> > > It looks like the relevant hid_hw_stop() call is the one at the end of
> > > sony_configure_input().  But I can't tell if doing that way is valid or
> > > not -- in practice the code would end up calling hid_disconnect() while
> > > hid_connect() was still running, which doesn't seem like a good idea.
> > >
> > > There's a comment about this near the end of sony_probe().  I suspect
> > > it would be better to call hid_hw_stop() in the conditional code
> > > following that comment rather than in sony_configure_input().
> > >
> > > Either way, these are all things Jiri should know about or check up on.
> > >
> > > Have you gotten any test results from syzbot exercising these pathways?
> > > You ought to be able to tell which HID driver is involved by looking
> > > through the console output.
> > 
> > Yes, a typical crash is below, that's why I thought it's the sony
> > driver. Adding hid_hw_stop() in sony_probe() stops the issue from
> > happening, but I don't know whether it's the right fix.
> 
> Probably you have to add hid_hw_stop() in sony_probe() and remove it 
> from sony_configure_input().  But like I said above, Jiri should look 
> into this.

It almost certainly is, thanks.

Adding Roderick to CC ... Roderick, will you be able to test and submit 
a patch fixing that?

-- 
Jiri Kosina
SUSE Labs

