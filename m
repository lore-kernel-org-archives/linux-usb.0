Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6742222C5;
	Tue,  4 Aug 2026 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825132; cv=none; b=O7mRJYbMtcRYc7MekFgznWp7kZxrqYiYyZHdvMa+xySLlDboqoC1EPslgmd6QNWNO+lrPBtZbxpidav7ZnHEKFHtoyruKYkBXPk/VK+ZS3QCEIAVeTu1HO0SWF0Ye0bUmqqXAW2tjGC6FZ9XpHzeDZn2GY7/WNbBYYRtPwD6Ke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825132; c=relaxed/simple;
	bh=+OHhvv68SFY1qokxevv79KOcM4f6hTSS8hpyzo8zVdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8dIFaus6z12SiPxquhDiEdovDHqTOxpcX6NKTeuiOyjWEmMVEZ6nimmHma1CI2M5QkYweMySSIH6lV1a6FSTObd30yjRgX+7ak0BMhBzd2k2ohmv34vHgP26qGa1fX3w46ukEYe+RAL40m8ObJB91aFF3Fog3emRf5gSqd/Cl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e0x657dj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e0x657dj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAE61F000E9;
	Tue,  4 Aug 2026 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785825131;
	bh=ISaL/AyCBAFDZPe6bt66VJWp0K35XIs752U0Xyuc/KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e0x657djKj7S/c6SLoA6IgpdGeW4ZWiRxxUUUG8iIjM2QskVm+8mWVI4n1jLOeRvZ
	 IBIpiMizonhbMd+AcLc+rb7sEwhL9a02Ux8SdEXTtyKQfIgNEdqwpcSYMLL8mNFeje
	 2f9xY5sX7p79mwpzb+Nxrf/a+TMvDhA8a1hNOa2Y=
Date: Tue, 4 Aug 2026 08:30:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_phonet: fix use-after-free in pn_bind
Message-ID: <2026080431-paragraph-caloric-0aae@gregkh>
References: <20260804033341.2784711-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804033341.2784711-1-khiemtranzo532001@gmail.com>

On Tue, Aug 04, 2026 at 11:33:41AM +0800, Nguyen Quang Le Kien wrote:
> phonet_free_inst() checks opts->bound to decide whether to call
> gphonet_cleanup() or free_netdev(). If opts->bound is false,
> free_netdev(opts->net) is called immediately.
> 
> However, pn_bind() can race with phonet_free_inst() when a configfs
> entry is removed while binding is in progress. pn_bind() reads
> opts->bound and calls gphonet_set_gadget(opts->net, ...) before
> setting opts->bound = true. If phonet_free_inst() runs concurrently
> after the !opts->bound check in pn_bind() but before opts->bound is
> set, it will free opts->net, causing a use-after-free when pn_bind()
> subsequently writes to net->dev.parent via gphonet_set_gadget().
> 
> Fix this by adding a mutex to f_phonet_opts and holding it in both
> pn_bind() and phonet_free_inst() when accessing opts->bound and
> opts->net. This is consistent with how other gadget functions such
> as f_eem protect their opts->bound flag.
> 
> Fixes: 00a2430ff07d ("usb: gadget: Gadget directory cleanup - group usb functions")
> Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
> ---
>  drivers/usb/gadget/function/f_phonet.c | 16 ++++++++--------
>  drivers/usb/gadget/function/u_phonet.h |  1 +
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
> index b1ee9a7c2..b7eae14e8 100644
> --- a/drivers/usb/gadget/function/f_phonet.c
> +++ b/drivers/usb/gadget/function/f_phonet.c
> @@ -499,20 +499,17 @@ static int pn_bind(struct usb_configuration *c, struct usb_function *f)
>  
>  	phonet_opts = container_of(f->fi, struct f_phonet_opts, func_inst);
>  
> -	/*
> -	 * in drivers/usb/gadget/configfs.c:configfs_composite_bind()
> -	 * configurations are bound in sequence with list_for_each_entry,
> -	 * in each configuration its functions are bound in sequence
> -	 * with list_for_each_entry, so we assume no race condition
> -	 * with regard to phonet_opts->bound access
> -	 */
> +	mutex_lock(&phonet_opts->lock);

So the coomment lied?

And why not use guard()?  Was an LLM used to generate this changelog and
code change?


>  	if (!phonet_opts->bound) {
>  		gphonet_set_gadget(phonet_opts->net, gadget);
>  		status = gphonet_register_netdev(phonet_opts->net);
> -		if (status)
> +		if (status) {
> +			mutex_unlock(&phonet_opts->lock);
>  			return status;
> +		}
>  		phonet_opts->bound = true;
>  	}
> +	mutex_unlock(&phonet_opts->lock);
>  
>  	/* Reserve interface IDs */
>  	status = usb_interface_id(c, f);
> @@ -621,10 +618,12 @@ static void phonet_free_inst(struct usb_function_instance *f)
>  	struct f_phonet_opts *opts;
>  
>  	opts = container_of(f, struct f_phonet_opts, func_inst);
> +	mutex_lock(&opts->lock);
>  	if (opts->bound)
>  		gphonet_cleanup(opts->net);
>  	else
>  		free_netdev(opts->net);
> +	mutex_unlock(&opts->lock);
>  	kfree(opts);
>  }
>  
> @@ -636,6 +635,7 @@ static struct usb_function_instance *phonet_alloc_inst(void)
>  	if (!opts)
>  		return ERR_PTR(-ENOMEM);
>  
> +	mutex_init(&opts->lock);
>  	opts->func_inst.free_func_inst = phonet_free_inst;
>  	opts->net = gphonet_setup_default();
>  	if (IS_ERR(opts->net)) {
> diff --git a/drivers/usb/gadget/function/u_phonet.h b/drivers/usb/gadget/function/u_phonet.h
> index ff62ca22c..4666413fc 100644
> --- a/drivers/usb/gadget/function/u_phonet.h
> +++ b/drivers/usb/gadget/function/u_phonet.h
> @@ -13,6 +13,7 @@
>  
>  struct f_phonet_opts {
>  	struct usb_function_instance func_inst;
> +	struct mutex lock;

No comment as to what this lock protects?

thanks,

greg k-h
