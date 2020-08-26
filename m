Return-Path: <SRS0=EJeS=CE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D6BC433E1
	for <linux-usb@archiver.kernel.org>; Wed, 26 Aug 2020 16:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E100F206FA
	for <linux-usb@archiver.kernel.org>; Wed, 26 Aug 2020 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598458576;
	bh=YnC0T6YHps9t//zybcn9H28Fjm7tLDjaqQrBrZhupuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2f3vxYjnMM9Dxd9rydTa+ATn6SfrjDLhsmo5+l4EtoYWZw+aOJ9Dl7AP3f+fBqM1o
	 Kcg16p4piL5v9tXvraNy0i7MhqzeOw2PquH34oUNN2jFTYtX5zdVMaNeMVOl2tiRei
	 +8ZkDyPOE1HsmMGGd8Wk3oKf38RpM5AV2Oa1gTG8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgHZQQE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 26 Aug 2020 12:16:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbgHZQPy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 12:15:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05D45206FA;
        Wed, 26 Aug 2020 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598458553;
        bh=YnC0T6YHps9t//zybcn9H28Fjm7tLDjaqQrBrZhupuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B3Xa4WrU/FL0+quHw+v0L1nG+bsFcR/3UdvpLzzRlJ/6+8XnjTA/FjFCSM8A6aBZk
         /XGMm9tBf9QRDKpkm5IFEdihP99p3hdUmqkI14JKSOR6Q4BJbg3YuvygpRxLGwj6OC
         KeVgXhfw/6LNV4qHepWb6zNScRcYRbblHc88v12o=
Date:   Wed, 26 Aug 2020 18:16:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Brooke Basile <brookebasile@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Ilja Van Sprundel <ivansprundel@ioactive.com>,
        Kees Cook <keescook@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [GIT PULL] USB fixes for 5.9-rc3
Message-ID: <20200826161608.GA1684@kroah.com>
References: <20200826134315.GA3882506@kroah.com>
 <CGME20200826150239eucas1p24c59716cc31edfeb2eece84d97936b93@eucas1p2.samsung.com>
 <1425ab4f-ef7e-97d9-238f-0328ab51eb35@samsung.com>
 <20200826153347.GB4187816@kroah.com>
 <CAHp75VepkugjZ4pvdNgxzT4T83ewL1AFtSZZtVq6aL+7=sqskA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VepkugjZ4pvdNgxzT4T83ewL1AFtSZZtVq6aL+7=sqskA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 06:53:02PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 6:36 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Aug 26, 2020 at 05:02:38PM +0200, Marek Szyprowski wrote:
> > > On 26.08.2020 15:43, Greg KH wrote:
> 
> > > > Brooke Basile (2):
> > > >        USB: gadget: u_f: add overflow checks to VLA macros
> > >
> > > Sorry, but the above patch breaks USB Ethernet Gadget operation. It also
> > > didn't get the proper testing in linux-next (next-20200826 is the first
> > > one with this patch).
> > >
> > > This is how it explodes on Samsung Exynos (ARM 32bit) based board with
> > > g_ether module loaded:
> 
> > Odd, for a "normal" descriptor, the logic should have remained the same
> > as without this patch.
> 
> > Brooke, any ideas?
> 
> I have an idea.
> 
> Does below fix this?
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

> diff --git a/drivers/usb/gadget/u_f.h b/drivers/usb/gadget/u_f.h
> index df4e1dcb357d..0b5c5f0dd073 100644
> --- a/drivers/usb/gadget/u_f.h
> +++ b/drivers/usb/gadget/u_f.h
> @@ -25,8 +25,8 @@
>  		size_t offset = 0;					       \
>  		if (groupname##__next != SIZE_MAX) {			       \
>  			size_t align_mask = __alignof__(type) - 1;	       \
> -			size_t offset = (groupname##__next + align_mask)       \
> -					 & ~align_mask;			       \
> +			offset = (groupname##__next + align_mask) &	       \
> +				  ~align_mask;				       \
>  			size_t size = array_size(n, sizeof(type));	       \
>  			if (check_add_overflow(offset, size,		       \
>  					       &groupname##__next)) {          \
> @@ -43,8 +43,8 @@
>  		size_t offset = 0;						\
>  		if (groupname##__next != SIZE_MAX) {				\
>  			size_t align_mask = __alignof__(type) - 1;		\
> -			size_t offset = (groupname##__next + align_mask)	\
> -					 & ~align_mask;				\
> +			offset = (groupname##__next + align_mask) &		\
> +				  ~align_mask;					\
>  			if (check_add_overflow(offset, groupname##_##name##__sz,\
>  							&groupname##__next)) {	\
>  				groupname##__next = SIZE_MAX;			\

Oh wow, yeah, that should fix the problem, but would be good to get
confirmation...

thanks,

greg k-h
