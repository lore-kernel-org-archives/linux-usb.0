Return-Path: <SRS0=Zul1=4A=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4304CC352A4
	for <linux-usb@archiver.kernel.org>; Wed, 12 Feb 2020 23:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07CC920848
	for <linux-usb@archiver.kernel.org>; Wed, 12 Feb 2020 23:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgBLXYw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 12 Feb 2020 18:24:52 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48001 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgBLXYw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Feb 2020 18:24:52 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C94DDC0007;
        Wed, 12 Feb 2020 23:24:49 +0000 (UTC)
Message-ID: <4c9cd6981a45db47200c94c0ad373eb8cf5d62c2.camel@hadess.net>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 13 Feb 2020 00:24:49 +0100
In-Reply-To: <20200212231759.GA2491995@kroah.com>
References: <20191016093933.693-1-hadess@hadess.net>
         <20200212190621.GA1970508@kroah.com>
         <9a3f2a266b53ab24b613a04b38e668338d43117e.camel@hadess.net>
         <20200212231759.GA2491995@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-02-12 at 15:17 -0800, Greg Kroah-Hartman wrote:
> On Thu, Feb 13, 2020 at 12:05:13AM +0100, Bastien Nocera wrote:
> > On Wed, 2020-02-12 at 11:06 -0800, Greg Kroah-Hartman wrote:
> > > On Wed, Oct 16, 2019 at 11:39:27AM +0200, Bastien Nocera wrote:
> > > > This is version 3 of the patch set.
> > > > 
> > > > Changes in v3:
> > > > - Add Alan's ack
> > > > - don't export usb_device_match_id()
> > > > 
> > > > Changes in v2:
> > > > - checkpatch.pl is now quiet
> > > > - fallback to the generic driver when driver ->probe() fails
> > > 
> > > Sorry for the long response to this, my fault.
> > > 
> > > At first, I really don't like the idea of using the usb device
> > > driver
> > > interface, but I don't think there's a better way.  And, you did
> > > the
> > > work to make it so that it works cleanly, which is always
> > > appreciated.
> > 
> > I'm hoping that a few user-space drivers end up upstream in the
> > kernel
> > for hardware that needs it.
> 
> And here I am wanting to move more USB drivers to userspace :)
> 
> What ones do you see that are currently in userspace that should be
> in
> the kernel?  The power control one here makes sense, are there others
> like this?

Well, I don't know yet. I would expect them to be of similar ilk, and
fit in with the type of devices the kernel already handles but would
use interfaces for on other devices.

As I mentioned at the beginning of the discussion, I'm not trying to
bring in user-space drivers that don't fit in an existing subsystem,
but rather those that are badly designed ;)

> > I plan on making some more changes to the USB subsystem in the
> > (near)
> > future, so it's to get my feet wet with this.
> 
> That was a serious modification to "start" with, nice work.

I think what I want to work on, revoke support for USB devices, might
be more complicated/racy/full of security problems.

