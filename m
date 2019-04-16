Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501FAC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 14:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2211C2240F
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555424427;
	bh=1LRwYzmIh7Vk1/bAzcBAXgq5Dq53ytJcXkFyOciQrZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bZK5BBBcuxmdH4PJSXNryelDxV50xnr9B2toCZW62FIHO6IDN5PyeGjKYj9z+G4VC
	 aXB0I0tpVZ6PTtisB91TwmSQ2tf5WbBYlEi05wscdvpKpVFP4Ta5fZUs5NYQxszWcY
	 e7q3G7zw05MnH1mmL5gwEHOcjUohPoPywkt11SYY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbfDPOU0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 10:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729103AbfDPOU0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 10:20:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE94E22408;
        Tue, 16 Apr 2019 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555424425;
        bh=1LRwYzmIh7Vk1/bAzcBAXgq5Dq53ytJcXkFyOciQrZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cfb/RvW5m5LzRMrHWHz9DJtAs5WVv2EsKGjJ59xZuJHvAV/ORkWWBq89XGmmq22hI
         PiTB8w07jrRFdn0HZTVJscK8Wa/aoSS/wOgVFmZp8vfl0w7pHUIraAKNSEHgaQMchZ
         a0OZ+3TVX6EI/kaOsWVhhvs9TXn1Xs8w0FBSTf9g=
Date:   Tue, 16 Apr 2019 16:19:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/8] usb: typec: fusb302: Make fusb302_set_cc_polarity
 also set pull ups / downs
Message-ID: <20190416141945.GB31628@kroah.com>
References: <20190222141205.7621-1-hdegoede@redhat.com>
 <20190416101953.GA4243@kroah.com>
 <20190416134439.GD1747@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190416134439.GD1747@kuha.fi.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416141945.tTos4LRmcVxKOcnKGRO0I2yyn6yKYUT5insiXwK8H8Q@z>

On Tue, Apr 16, 2019 at 04:44:39PM +0300, Heikki Krogerus wrote:
> On Tue, Apr 16, 2019 at 12:19:53PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Feb 22, 2019 at 03:11:58PM +0100, Hans de Goede wrote:
> > > The 2 callers of fusb302_set_cc_polarity both call fusb302_set_cc_pull
> > > directly before calling fusb302_set_cc_polarity, this is not ideal for
> > > 2 reasons:
> > > 
> > > 1) fusb302_set_cc_pull uses the cached polarity when applying pull-ups,
> > > which maybe changed immediately afterwards, to fix this set_cc_polarity
> > > already does the pull-up setting.
> > > 
> > > 2) Both touch the SWITCHES0 register in a r-w-modify cycle, this leads to
> > > read reg, write reg, read reg, write reg. If we fold the setting of
> > > the pull-downs into fusb302_set_cc_polarity then not only can we avoid
> > > doing the reads / writes twice, at this point we set all bits, so we
> > > can skip the read, turning 4 (slowish) i2c-transfers into 1.
> > > 
> > > Doing this also avoids the need to cache the pull_up state in
> > > struct fusb302_chip.
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/usb/typec/tcpm/fusb302.c | 48 +++++++++++---------------------
> > >  1 file changed, 16 insertions(+), 32 deletions(-)
> > 
> > It would be nice to get some people to review/ack this series before I
> > take it (hint...)
> 
> Hans send second and third version of these. These are already in.

Ah, nevermind then, now dropped :)

greg k-h
