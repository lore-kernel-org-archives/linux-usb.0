Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4293E47B;
	Thu,  9 Jul 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783575188; cv=none; b=EAIIIV/sMLNel7C9wv61OuxR3x6mnxjnwfcfKRs7z35NIS5R4hK/zAWUxemY96Xip6quFgIaFKqtUgt6ohYCogpKdQqN4APMI3QeXuMQllSoKIri4GQeVLyALHbxWeo6KCYACwEROIG9e/I9pVHwU8o5cCFldyBAU788oL9oDEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783575188; c=relaxed/simple;
	bh=dEB7NpNEAwaFV11hKPo9q1Kuk2WAIFjuldgYRvwUPl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfkUDtLvqwurvYERcxGFd6JFV4dJfJ/TQV5Y3cvIUe9/ElfbIr/p3Ux0b2SwS79iCBG16Nb+AScfs7OfzrwDl33NtsqQZcISmawYVYs/s+RzpYx0v39RfNymIxfYxuyPq0f7bp6xosJSLSNmTHCwY8xXgTyLmfky3ZhnfrBMNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IBMm959g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IBMm959g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992801F000E9;
	Thu,  9 Jul 2026 05:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783575187;
	bh=xeP49zf1w0gTwqolkCaocObyBkxqCco+Hzh4w8rsnOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IBMm959gelwhn17rIU12/wczRgh8z1kWb0FWJiN/BALc86TuiOhjvYO3YiumpzfU5
	 4gTWjMYxe88acDiv+XYCcRSbyTGaG7Gx8LvgJ6zVj72H4KrcvQqxPoCfn9/qthzqM0
	 i3G6yFYi1P2wlRf9a8WHEcXJIyIwZzaCPoWQP0F0=
Date: Thu, 9 Jul 2026 07:33:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
	hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <2026070922-density-onto-3ce6@gregkh>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
 <2026070831-peso-aluminum-df0c@gregkh>
 <ak64635tgUj3MPEx@SMW015318>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak64635tgUj3MPEx@SMW015318>

On Wed, Jul 08, 2026 at 03:54:03PM -0500, Frank Li wrote:
> On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> > On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
> > > From: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > kstrndup() returns NULL on allocation failure. The condition was
> > > checking 'if (tmp)' to detect failure, but this is inverted — it
> > > would treat a successful allocation as an error and return -ENOMEM
> > > while leaking the string, and proceed with a NULL pointer on failure.
> > >
> > > Fix by changing the condition to 'if (!tmp)'.
> > >
> > > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: Claude:claude-sonnet-4-6
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > index 5d201a2e30e7..e9f2632ce785 100644
> > > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
> > >  		goto end;						\
> > >  									\
> > >  	tmp = kstrndup(page, len, GFP_KERNEL);				\
> > > -	if (tmp) {							\
> > > +	if (!tmp) {							\
> > >  		ret = -ENOMEM;						\
> > >  		goto end;						\
> > >  	}								\
> > > --
> > > 2.34.1
> > >
> > >
> >
> > So this has never worked?  How has no one ever noticed that in the
> > decade this has been in the kernel?  Does that mean that no one uses
> > this file/driver and we can just remove it?
> 
> I think just no one use sys interface to change name.

So it can just be removed?  Please submit a patch to do that instead.

Ideally this whole file can be removed, does anyone still use it?

thanks,

greg k-h
