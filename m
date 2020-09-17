Return-Path: <SRS0=L0ZS=C2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE97CC43461
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 12:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 876F321974
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 12:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=suse.com header.i=@suse.com header.b="bMSir+X5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgIQMEZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:04:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:40862 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgIQMET (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 08:04:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600344199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zDzV/nOSl/rS5jbmDaez+Qr68vBztihPQiMXXHVSE2Y=;
        b=bMSir+X5D7RFyyr0TKaRzPJyoA8qBnAbHLhIfX+r1LZo03IEy0mGYGbu8qa/rkD68AN3W4
        LUfNE9llgOnyNLh5nOkc4/ZSFYkuWhhiTj7WdaF3snHBZRHCV0lCgXcp5BgZA6FUFq4C7t
        hMkvnrs0aKC14oyCQClTuuxC+3CJukGIQLMkxhS7z7NKUqL5TQUDtywlV5p8/KXaDpb/kL
        bjZpqIStygy5wRiTqu0rYG7n9dh2ospUpvveLDG5lk+louQQJfJYYdYA59yiQ25WHwfXkr
        9SFi+neL/wVW9xb7oVP8DAXBDqfNeTH6ldYzBh1NIo1H8ciPInJy6+TIz1Tlqg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7CA87AF33;
        Thu, 17 Sep 2020 12:03:53 +0000 (UTC)
Message-ID: <1600344191.2424.44.camel@suse.com>
Subject: Re: [PATCH] usblp: fix race between disconnect() and read()
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <gregKH@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 17 Sep 2020 14:03:11 +0200
In-Reply-To: <20200917114347.GA3436799@kroah.com>
References: <20200917103427.15740-1-oneukum@suse.com>
         <20200917114347.GA3436799@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 17.09.2020, 13:43 +0200 schrieb Greg KH:
> On Thu, Sep 17, 2020 at 12:34:27PM +0200, Oliver Neukum wrote:
> > read() needs to check whether the device has been
> > disconnected before it tries to talk to the device.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > Reported-by: syzbot+be5b5f86a162a6c281e6@syzkaller.appspotmail.com
> > ---
> >  drivers/usb/class/usblp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> > index 084c48c5848f..67cbd42421be 100644
> > --- a/drivers/usb/class/usblp.c
> > +++ b/drivers/usb/class/usblp.c
> > @@ -827,6 +827,11 @@ static ssize_t usblp_read(struct file *file, char __user *buffer, size_t len, lo
> >  	if (rv < 0)
> >  		return rv;
> >  
> > +	if (!usblp->present) {
> > +		count = -ENODEV;
> > +		goto done;
> > +	}
> > +
> 
> What prevents ->present from not being changed right after this test?

Hi,

the mutex taken in

rv = usblp_rwait_and_lock(usblp, !!(file->f_flags & O_NONBLOCK));

right above it. Yes, this driver is a mess. But short of adding
a ton of comments or rewriting the whole thing I have no idea
what to do about that.

	Regards
		Oliver

