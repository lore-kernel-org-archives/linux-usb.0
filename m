Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C33793B0;
	Mon, 24 Aug 2026 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554062; cv=none; b=PjFK742bxqNxFRS+bIbrLcaAyR8lPKQ5gd7uprk+akfOCTkp68A7XkCWLWRgw+ykpTHBrldv0k6wsNLzbKLEtMzdvwFxyTx28LX31Dl/N14yXLDF5vZx/40WWTFjDyHzxgfXUUsBuX1JuE4cqAqrlM8+YW2Y5fzSQpq1t6QLLLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554062; c=relaxed/simple;
	bh=gG1RETO8tSEM6MEyfEfvl5fQu/gIuP0RAxuFB1+BWGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM8GpOvEEb22MrnuWTJky9EE1lC2Gu1zhq0Eeo6yZ+I11gT2LGEEYu4un7ilqU5W24ELP74bYHGHSkxSXaZJlMljaLwBfXn2TFvZkybNUYAhgX+tKBn4fk6dPBG1rySjaTgGSsZgVRl8swrUv2X7+srMU0eAqIRx4JvUSWXPvBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bG7jDdqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bG7jDdqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226181F000E9;
	Mon, 24 Aug 2026 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787554060;
	bh=WUo+RQrGhNzsNP740Tu3xwMD+OG36ADS3YnpVaO4b8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bG7jDdqyyJswidSfz+Gv4l3frU5z3FsFFzENIH3X7N/dQwr7UrPHJdkeYm714eyfn
	 F+JwTgodRbP7zWpKUI4kfsyzNNOkdAuPDPPjlzpadFlVOBQxc6DAX4rG2ey4bkgZMI
	 t0W+fJwR3jBU9DXsdVAIx4rNtdyhGbhGrddPCLOs=
Date: Mon, 24 Aug 2026 08:45:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: typec: stusb160x: add missing NULL check for
 i2c_get_match_data()
Message-ID: <2026082403-decathlon-produce-b31f@gregkh>
References: <20260806084301.1340-1-joshua.crofts1@gmail.com>
 <20260824084041.0000295f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824084041.0000295f@gmail.com>

On Mon, Aug 24, 2026 at 08:40:41AM +0200, Joshua Crofts wrote:
> On Thu,  6 Aug 2026 08:43:01 +0000
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > In stusb160x_probe(), the return value of i2c_get_match_data() is not
> > checked, causing a null pointer dereference later on if the device was
> > registered manually (without devicetree or ACPI).
> > 
> > Fix this by adding a NULL check for the return value of
> > i2c_get_match_data().
> > 
> > Reported-by: syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=6c7e68b141ebd3a2cadf
> > Fixes: 823754697556 ("usb: typec: stusb160x: Make use of i2c_get_match_data()")
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > ---
> >  drivers/usb/typec/stusb160x.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> > index 6d85b25b40bc..8f3435c669cd 100644
> > --- a/drivers/usb/typec/stusb160x.c
> > +++ b/drivers/usb/typec/stusb160x.c
> > @@ -645,6 +645,8 @@ static int stusb160x_probe(struct i2c_client *client)
> >  	i2c_set_clientdata(client, chip);
> >  
> >  	regmap_config = i2c_get_match_data(client);
> > +	if (!regmap_config)
> > +		return -ENODEV;
> >  
> >  	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
> >  	if (IS_ERR(chip->regmap)) {
> 
> Hi Greg and Heikki,
> 
> A (very) gentle ping on this patch. Do you need a v2 to include the

It's the middle of the merge window, we can't do anything until -rc1 is
out.

Also, this patch really isn't even needed, just don't attempt to bind
drivers to devices that are not the correct device.

thanks,

greg k-h
