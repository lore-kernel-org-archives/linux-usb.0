Return-Path: <SRS0=PkR+=S6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A67C43219
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 17:07:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47B4520675
	for <linux-usb@archiver.kernel.org>; Sun, 28 Apr 2019 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556471274;
	bh=tMBABMwMn1Tklu43CLV59X9dr8+SqG8/ovrp/vPOJWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B/xWzkuo1I7N5XTzRCQdr3T/CqBZBJPm+xtGIcmLYusaOvryWIGmS19YGPZndmec1
	 rJzTHaR8+2fGKAwk8u5L7OMTUi+cqawOukQFpMG8ie23M6lgHhQKLTlsNEwByZpsLv
	 xFLEnP1i815MY52OygKB/e5cSTAhaE6v0HZxHb44=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbfD1RHs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 28 Apr 2019 13:07:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726674AbfD1RHs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Apr 2019 13:07:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34EAA20656;
        Sun, 28 Apr 2019 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556471267;
        bh=tMBABMwMn1Tklu43CLV59X9dr8+SqG8/ovrp/vPOJWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fPzbzuBE/Xj5GlFuS1dVy5Oyga5G0Rwee0mwgYdmr8Gwls2n2U1I8SK4mQGzzMyKw
         3EEZK7DaREtShiEGJIuEP6/vYrEIWzS1GoaPNxbf3VBcLiKh3cIjTG73LuF0RWj0vg
         w/pi8CO4y4ZeILcjZTU4kWkCLsv8zriwKQw/BC8o=
Date:   Sun, 28 Apr 2019 19:07:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] sound: USB: line6: use dynamic buffers
Message-ID: <20190428170745.GA19070@kroah.com>
References: <20190428160411.GA12815@kroah.com>
 <s5hmukakrod.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <s5hmukakrod.wl-tiwai@suse.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190428170745.Q8_nXMWT9A418lueTNorHPIT04yF37q2CdqO4NjICxY@z>

On Sun, Apr 28, 2019 at 06:42:10PM +0200, Takashi Iwai wrote:
> On Sun, 28 Apr 2019 18:04:11 +0200,
> Greg Kroah-Hartman wrote:
> > 
> > --- a/sound/usb/line6/toneport.c
> > +++ b/sound/usb/line6/toneport.c
> > @@ -365,16 +365,21 @@ static bool toneport_has_source_select(s
> >  /*
> >  	Setup Toneport device.
> >  */
> > -static void toneport_setup(struct usb_line6_toneport *toneport)
> > +static int toneport_setup(struct usb_line6_toneport *toneport)
> >  {
> > -	u32 ticks;
> > +	u32 *ticks;
> >  	struct usb_line6 *line6 = &toneport->line6;
> >  	struct usb_device *usbdev = line6->usbdev;
> >  
> > +	ticks = kmalloc(sizeof(*ticks), GFP_KERNEL);
> > +	if (!ticks)
> > +		return -ENOMEM;
> > +
> >  	/* sync time on device with host: */
> >  	/* note: 32-bit timestamps overflow in year 2106 */
> > -	ticks = (u32)ktime_get_real_seconds();
> > -	line6_write_data(line6, 0x80c6, &ticks, 4);
> > +	*ticks = (u32)ktime_get_real_seconds();
> > +	line6_write_data(line6, 0x80c6, ticks, 4);
> > +	kfree(ticks);
> >  
> >  	/* enable device: */
> >  	toneport_send_cmd(usbdev, 0x0301, 0x0000);
> 
> This function misses the "return 0" at the end, so I fixed it up
> manually and applied now.

Ugh, sorry about that.  Odd I didn't get a build error, my fault.

thanks for the quick response.

greg k-h
