Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCE2E06E4;
	Thu,  9 Jul 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783579767; cv=none; b=d40Bn2TbhXdM7EnlLtaQvdYG4hBcNpbA3k4v5xm1cKQ1vK+aR220KSV5ykbpevpqUlOBCgExYF1ixBI9Dj2ZUZx09jB04qv184RyRQCVU9rADfy5Zkaa/XmrsN16mbwrcF8+PHKNpZq1egM0J8X3uqiRs3XG6ClwC268irBKawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783579767; c=relaxed/simple;
	bh=at9/shSgdBf8hzILdzAo5zEXM3BoTRn5wlbKJSRqONE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8mY6NEBQFQzaQO2aCBPW69xrGm69xnvmGR22i7RdRQIVr0Nj6HmNkcoMXDVjNdA4HdlcQTbmVSquUSoQfPe8k2z60doPBa5tvvX86hWHXVkawvZzGtjkKAx5skycf5zYgJJU5JXLsBfeBRVUzDtZIHGEElYqugIk60/WyigaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CDHwiZFP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CDHwiZFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9873A1F00A3A;
	Thu,  9 Jul 2026 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783579766;
	bh=gz24RAb2Ky8Ms9aHh8FfwpjtlbIUrgQCwTmKz6Y91SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CDHwiZFPG4JimYMfO63m1YSPhUEbF68KAQ2Scb4IWBrMkaJGEGAS4DTFSXxcrYXct
	 pJpRCwHEX08BnT/Dpq3WTha/bKSKCFzXDeog0N7UIgBpkJ6eO7jlZg7GehBVCA72j4
	 gzJeGcLNj0jLAJdhLL0Bguzq/eX+1eBDt2eFpGFg=
Date: Thu, 9 Jul 2026 08:48:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
	hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <2026070908-semisweet-parabola-4a48@gregkh>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
 <2026070831-peso-aluminum-df0c@gregkh>
 <ak64635tgUj3MPEx@SMW015318>
 <2026070922-density-onto-3ce6@gregkh>
 <n7h2d72m2lqdnrtvlbztwrkfmmzsh2nbb77luwomxrcyrpimuk@fdlg44plusyw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n7h2d72m2lqdnrtvlbztwrkfmmzsh2nbb77luwomxrcyrpimuk@fdlg44plusyw>

On Thu, Jul 09, 2026 at 02:23:51PM +0800, Xu Yang wrote:
> On Thu, Jul 09, 2026 at 07:33:03AM +0200, Greg KH wrote:
> > On Wed, Jul 08, 2026 at 03:54:03PM -0500, Frank Li wrote:
> > > On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> > > > On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
> > > > > From: Xu Yang <xu.yang_2@nxp.com>
> > > > >
> > > > > kstrndup() returns NULL on allocation failure. The condition was
> > > > > checking 'if (tmp)' to detect failure, but this is inverted — it
> > > > > would treat a successful allocation as an error and return -ENOMEM
> > > > > while leaking the string, and proceed with a NULL pointer on failure.
> > > > >
> > > > > Fix by changing the condition to 'if (!tmp)'.
> > > > >
> > > > > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > > > > Cc: stable@vger.kernel.org
> > > > > Assisted-by: Claude:claude-sonnet-4-6
> > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > ---
> > > > >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > index 5d201a2e30e7..e9f2632ce785 100644
> > > > > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
> > > > >  		goto end;						\
> > > > >  									\
> > > > >  	tmp = kstrndup(page, len, GFP_KERNEL);				\
> > > > > -	if (tmp) {							\
> > > > > +	if (!tmp) {							\
> > > > >  		ret = -ENOMEM;						\
> > > > >  		goto end;						\
> > > > >  	}								\
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >
> > > >
> > > > So this has never worked?  How has no one ever noticed that in the
> > > > decade this has been in the kernel?  Does that mean that no one uses
> > > > this file/driver and we can just remove it?
> > > 
> > > I think just no one use sys interface to change name.
> > 
> > So it can just be removed?  Please submit a patch to do that instead.
> > 
> > Ideally this whole file can be removed, does anyone still use it?
> 
> This legacy driver is still built in kernel in multi_v7_defconfig: 
> 
> ~/work/usb$ grep -nr CONFIG_USB_CONFIGFS_F_UAC1_LEGACY arch/*/configs/
> arch/arm/configs/multi_v7_defconfig:939:CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y

defconfig doesn't mean much.  Perhaps look at some of the Android
configs?

> It seems we can't simply remove it. 

Why?

> BTW, do we have other ways to figure out if it can be removed?

Remove it and see who complains?  :)

thanks,

greg k-h
