Return-Path: <SRS0=Cs7X=UE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7217CC28CC5
	for <linux-usb@archiver.kernel.org>; Wed,  5 Jun 2019 15:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E93820866
	for <linux-usb@archiver.kernel.org>; Wed,  5 Jun 2019 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559749379;
	bh=CzkKmQh09JF5u93IpABFTb8ZaS09PpwAmAHegRnHDqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VkvcYueNqeob3mvTug0O5OjX3OwmbUqvf7cavOhOLODkfdQuP4DulEUDd1FfgR5uY
	 5UrUyJ3jSu6m+SgYvC2/3X1kA3kEKEw3PMjC2wbQHAZR9m0gL3KuI+69JFzPd1OZaI
	 oSVp8jG0hLsorOqS7ZaRl55F5RMgjRLJTAZcrVrI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbfFEPm6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 Jun 2019 11:42:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:54370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbfFEPm6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 11:42:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EE222083E;
        Wed,  5 Jun 2019 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559749377;
        bh=CzkKmQh09JF5u93IpABFTb8ZaS09PpwAmAHegRnHDqs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hCrbNWyLeYWDpfeHuOW/kKxKnMvIwvqc/w+7A0gSTMAb4RU1P+/fnER7uDn0zhK1g
         yakR7VtPN54zozY5dkzn+aqio+2colAhD97OtgxPKyuwISdT8IgwdU+vxIEWnp62yP
         527OoU8wvwkmUA77zB0/qa2GObUWadIju26QIB4s=
Date:   Wed, 5 Jun 2019 17:42:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Peter Chen <Peter.Chen@nxp.com>, Johan Hovold <johan@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: chipidea: Use dev_err() instead of pr_err()
Message-ID: <20190605154255.GA11928@kroah.com>
References: <20190605130723.9184-1-festevam@gmail.com>
 <20190605142133.GB8803@kroah.com>
 <CAOMZO5BmbgcPYqJK47+mtjkMLPR9XjwdCQ4V+qjOnjg1g+nZrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BmbgcPYqJK47+mtjkMLPR9XjwdCQ4V+qjOnjg1g+nZrw@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 11:47:59AM -0300, Fabio Estevam wrote:
> Hi Greg,
> 
> On Wed, Jun 5, 2019 at 11:21 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > > index 27749ace2d93..92132b35b7fd 100644
> > > --- a/drivers/usb/chipidea/core.c
> > > +++ b/drivers/usb/chipidea/core.c
> > > @@ -523,8 +523,9 @@ int hw_device_reset(struct ci_hdrc *ci)
> > >       hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
> > >
> > >       if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
> > > -             pr_err("cannot enter in %s device mode", ci_role(ci)->name);
> > > -             pr_err("lpm = %i", ci->hw_bank.lpm);
> > > +             dev_err(ci->dev, "cannot enter in %s mode\n",
> >
> > You changed the string text, why?
> 
> I mentioned this string change in the commit log.
> 
> Originally we could have the following error message:
> 
> cannot enter in host device mode
> 
> This "host device" message looks strange, so that's why I removed the
> "device" string.

Why is it strange?  Please just leave it as-is unless you know this
change is ok.

> If you prefer, I can split it in three patches (add newline, remove
> 'device' string, change to dev_err).

No, just one is fine, to dev_err(), but do not change the string.

thanks,

greg k-h
