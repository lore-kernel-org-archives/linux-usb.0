Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023B4279E4;
	Fri, 10 Jul 2026 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688288; cv=none; b=fywrYFHC+VhQvz2zQq12wBNpdKgXagrAwZuKDghaGFjDB5fSsgLiU7pWpJvC5tr3ovajnWAgWvny8lBmDNoGJGOnOEwCEPKzuGm5UuzPuVmklO95rsiqLepLqb6Ic/X4ELwKspEJbZDP6f/1U4ba7HsU0+3CZ6+Ly7LaKWXfYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688288; c=relaxed/simple;
	bh=lrkkoQAn3SzjQxs27pqXKcHV/Cx73M9esAvvS1J8F0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC6zS54LJ/ALrixwCJ0y+cbnHs/gqFwEwb6uh6s2Y4JQpsNpxb+clXwlYsmhWfcJdYGduyEonikwJZhVJ16Xne3UczVSF8aKJHm1TgW4BYZrbtSyto/jJR6HoSN9zi63wWFa06qxJNPQNug8MzJQu+qGa6QhSal86L0L+8H0qes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NgmVy2cV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NgmVy2cV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E8B1F000E9;
	Fri, 10 Jul 2026 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783688286;
	bh=CtGVFGGmzdxDyBQbWhj0761znkhrhApCkJzSpjQnaCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NgmVy2cV93CaRJ6YwwStzTzAPPoR7WMvDiCxPehOkp5lC61Q9Cpl/3l29QYgR5/z9
	 +/a1BkimCGgEm1fbTs5GCNQmU84GxVvIRc60DRfYU5rVz+o/im/TOklbvkG88ceuER
	 v/C9+gfYfdTazGA1J9V2Y7MzcODLcLa9jpBqLupo=
Date: Fri, 10 Jul 2026 14:58:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
	hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <2026071019-parkway-captivate-086f@gregkh>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
 <2026070831-peso-aluminum-df0c@gregkh>
 <ak64635tgUj3MPEx@SMW015318>
 <2026070922-density-onto-3ce6@gregkh>
 <n7h2d72m2lqdnrtvlbztwrkfmmzsh2nbb77luwomxrcyrpimuk@fdlg44plusyw>
 <2026070908-semisweet-parabola-4a48@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026070908-semisweet-parabola-4a48@gregkh>

On Thu, Jul 09, 2026 at 08:48:08AM +0200, Greg KH wrote:
> On Thu, Jul 09, 2026 at 02:23:51PM +0800, Xu Yang wrote:
> > On Thu, Jul 09, 2026 at 07:33:03AM +0200, Greg KH wrote:
> > > On Wed, Jul 08, 2026 at 03:54:03PM -0500, Frank Li wrote:
> > > > On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> > > > > On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
> > > > > > From: Xu Yang <xu.yang_2@nxp.com>
> > > > > >
> > > > > > kstrndup() returns NULL on allocation failure. The condition was
> > > > > > checking 'if (tmp)' to detect failure, but this is inverted — it
> > > > > > would treat a successful allocation as an error and return -ENOMEM
> > > > > > while leaking the string, and proceed with a NULL pointer on failure.
> > > > > >
> > > > > > Fix by changing the condition to 'if (!tmp)'.
> > > > > >
> > > > > > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Assisted-by: Claude:claude-sonnet-4-6
> > > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > > ---
> > > > > >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > > index 5d201a2e30e7..e9f2632ce785 100644
> > > > > > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
> > > > > >  		goto end;						\
> > > > > >  									\
> > > > > >  	tmp = kstrndup(page, len, GFP_KERNEL);				\
> > > > > > -	if (tmp) {							\
> > > > > > +	if (!tmp) {							\
> > > > > >  		ret = -ENOMEM;						\
> > > > > >  		goto end;						\
> > > > > >  	}								\
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > > >
> > > > >
> > > > > So this has never worked?  How has no one ever noticed that in the
> > > > > decade this has been in the kernel?  Does that mean that no one uses
> > > > > this file/driver and we can just remove it?
> > > > 
> > > > I think just no one use sys interface to change name.
> > > 
> > > So it can just be removed?  Please submit a patch to do that instead.
> > > 
> > > Ideally this whole file can be removed, does anyone still use it?
> > 
> > This legacy driver is still built in kernel in multi_v7_defconfig: 
> > 
> > ~/work/usb$ grep -nr CONFIG_USB_CONFIGFS_F_UAC1_LEGACY arch/*/configs/
> > arch/arm/configs/multi_v7_defconfig:939:CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
> 
> defconfig doesn't mean much.  Perhaps look at some of the Android
> configs?
> 
> > It seems we can't simply remove it. 
> 
> Why?
> 
> > BTW, do we have other ways to figure out if it can be removed?
> 
> Remove it and see who complains?  :)

Seriously, let's remove the ability to set the name as that has never
worked.  If anyone wants it to work, they can make a new patch to add
that feature as a new one.

thanks,

greg k-h
