Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27CC395AF2;
	Tue,  4 Aug 2026 07:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829991; cv=none; b=qDdzNyIvpx0kRdgblT7Q+SAY53jJCFq68eWYomo6dZqsjWuv4LjYqWcMO8lzlhAdyq8TPF7yZPJky7b0V0TxDt61I/x0XuGGD7cNkG+GU+QlGBQ5GvMGI9dk1Ba/1oHhQRTYiINsPEiUoKysEb3lKwRFmdzj9FFBaJGCGOq/seI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829991; c=relaxed/simple;
	bh=nbe8NLIdku1F87f86Rlteq2imjQONvL/2Fqkp3V/5D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TC19EGl88rlvj6+8sSm5ysuINIRafNBfdTlTXlsrJgOXy0ljx+MAVeAc5Y6Dw2/QBV6x2pMk4aATSqi3Jj6o21872J1QKvjnV3LHTKGVce3EaI81EPNvWv+9e2seqwekDYC5BIKbb08lH9nTJhNQuVSVWhu4Ap1nfDuezOrsjlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aUQPSrdb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aUQPSrdb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12921F000E9;
	Tue,  4 Aug 2026 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785829990;
	bh=llhTySycapYDnP9sroaWfyUe20YpY9sf2TW2dee3DyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aUQPSrdb81VzqMhtBzry5mvoMPSjChZFhLTcOzxwdYjLewMCCk/DBUyifoYA8FYQU
	 VVm346fPOIUqFmHn0LJbfHy3g5NPPdlij3ELKdnJetDhjdgSCvWiSqpK6Op7Ihf90n
	 vtnI6tasV2zbrNhzA7j3CUMdSxlz4tlanpZM/WiA=
Date: Tue, 4 Aug 2026 09:52:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: f_phonet: fix use-after-free in pn_bind
Message-ID: <2026080420-grudge-version-8bf2@gregkh>
References: <2026080431-paragraph-caloric-0aae@gregkh>
 <20260804074432.2906951-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804074432.2906951-1-khiemtranzo532001@gmail.com>

On Tue, Aug 04, 2026 at 03:44:32PM +0800, Nguyen Quang Le Kien wrote:
> pn_bind() and phonet_free_inst() race on opts->bound and opts->net.
> If configfs removes the function instance while pn_bind() is between
> the !bound check and setting bound = true, free_inst() frees opts->net
> and pn_bind() then writes to net->dev.parent via gphonet_set_gadget().
> 
> The existing "no race condition" comment was wrong: configfs_rmdir()
> can run independently of the composite bind sequence.
> 
> Add a mutex to f_phonet_opts and use scoped_guard(mutex) in both
> pn_bind() and phonet_free_inst() to serialize access to ->bound and
> ->net. Add a kernel-doc comment describing what the lock protects,
> and destroy the mutex before freeing opts.
> 
> Fixes: 00a2430ff07d ("usb: gadget: Gadget directory cleanup - group usb functions")
> Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3

Did this new version properly run through syzbot and it reported it
succeeded?



> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
> ---
> v2:
>  - use scoped_guard(mutex) instead of open-coded lock/unlock
>  - add kernel-doc comment on struct f_phonet_opts describing what
>    @lock protects
>  - add explicit #include <linux/mutex.h>
>  - call mutex_destroy() before kfree(opts)
>  - remove stale "no race condition" comment; explain why it was wrong
>    in the commit message
> ---
>  drivers/usb/gadget/function/f_phonet.c | 34 +++++++++++++-------------
>  drivers/usb/gadget/function/u_phonet.h | 10 ++++++++
>  2 files changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
> index b1ee9a7c2..350579747 100644
> --- a/drivers/usb/gadget/function/f_phonet.c
> +++ b/drivers/usb/gadget/function/f_phonet.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> +#include <linux/mutex.h>

This isn't needed as you added it to the .h file, right?

And you didn't answer my question about LLM use.

thanks,

greg k-h
