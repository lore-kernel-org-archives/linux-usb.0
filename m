Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162239;
	b=uyjFbBSHF7N9Vs/AuT954tAVX4CrEHJsYcVBb8lJPg77YrsGf4A6ezvYvQQOgtuTvb/X
	 IXTLaHPiC2Y6tE2ZGHV1YofjLHdvAHsUDmN7B2xzAEIRZrX+510UIXV1irHxqDF6k107b
	 ml7GeauCp9ziKVEi0+15YZ/4QZ1gVxHf48SEl2URPlEHN0+g2JCZop4n6q2O80+bDWF7O
	 PCKFBW2fUlG0pdhe89NdwTeC8aiCOSt+FLFdTb4Pql+3ngg0Zz9Q6WCTYZ5FjppG8PTns
	 BWsnNlFRjfme7qHrtpatMDomrQr+FDOK+fuq9ekthCwuX4ao9JKzfZwgD4HAXODgLuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162239;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qHNIvMirhw5Yqe/45BmdtZSfkV5uagyM/kyIoGo2xWY=;
	b=YOXFaWGga5Cmh0Q7vxgB0w56sd/wmdfDXYrzlbOObTf/uCq/b1wjdgLpThdp3mkr1BhO
	 ZUlrVOuuqgdOu4FtY0foeg/L69UrKlEhtH15d53/WRHXOiDBqgxxSgrqeGXXO5UyMeaQB
	 RiA33c1O0HDBkqL5NrgYNCsZqLO5vFVYJlCv+3gKpHhZjEk0gDiIdf/KyaGotk97PHjIx
	 jMXExm1LxyOFCj7B71atG8V2stB5IeZpzSkcmAboKrumZMznls6jlr2XONrzjFg733Ehu
	 07N/NW6yJxvHgXjGqDD3cFDeeu9NRv/L8yNUEzH2kElgyERi0qUfuei4+oARMPW2ySg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Pnv19gEa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB33606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Pnv19gEa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322AC1F000C4;
	Fri, 20 Nov 2026 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795162238;
	bh=qHNIvMirhw5Yqe/45BmdtZSfkV5uagyM/kyIoGo2xWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pnv19gEa+Lm3xaZ6wiuEzeHEfGhdYLhIWd84YAMzvEGinHNgXIei0BH+8OLdl9+Z4
	 7INLXo+7XCCu9YxTilRiDtw2uJgRdqwzfrH3i8RTO3Up4ToecNUt7sqcuFrOeeSa3X
	 kHyp5pE+AlcqhRptGqmELrr92nXdUpuVMFewbgls=
Date: Fri, 20 Nov 2026 09:10:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haoli Zhang <26031212468@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_midi2: disable endpoints before freeing
 descriptors
Message-ID: <2026112002-agony-calibrate-ce07@gregkh>
References: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>

On Fri, Nov 20, 2026 at 12:26:07PM +0800, Haoli Zhang wrote:
> The dummy_hcd driver keeps a pointer to an endpoint descriptor while the
> endpoint is enabled, and its timer dereferences that pointer in
> find_endpoint(). However, f_midi2_unbind() frees the function descriptors,
> while f_midi2_disable() currently only resets operation_mode. When the
> function is removed, an endpoint can therefore remain enabled while its
> descriptor storage is released.
> 
> Disable the MIDI 1.0 endpoints and all MIDI 2.0 endpoints from
> f_midi2_disable() before the unbind callback releases the descriptors.
> Keep f_midi2_stop_eps() unchanged so altsetting transitions retain their
> existing request cleanup behavior.
> 
> Reported-by: syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=599d4e8994a656eafe15
> Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
> ---
>  drivers/usb/gadget/function/f_midi2.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
> --- a/drivers/usb/gadget/function/f_midi2.c
> +++ b/drivers/usb/gadget/function/f_midi2.c
> @@ -1167,6 +1167,13 @@
>  	f_midi2_free_ep_reqs(ep_out);
>  }
> 
> +/* Disable an EP before its descriptors are released. */

That's not a good description of this function at all :(

> +static void f_midi2_disable_ep(struct f_midi2_usb_ep *usb_ep)
> +{
> +	if (usb_ep->usb_ep)
> +		usb_ep_disable(usb_ep->usb_ep);
> +}
> +
>  /* start/queue both IN and OUT EPs */
>  static int f_midi2_start_eps(struct f_midi2_usb_ep *ep_in,
>  			     struct f_midi2_usb_ep *ep_out,
> @@ -1343,8 +1350,17 @@
>  static void f_midi2_disable(struct usb_function *fn)
>  {
>  	struct f_midi2 *midi2 = func_to_midi2(fn);
> +	struct f_midi2_ep *ep;
> +	int i;
> 
>  	midi2->operation_mode = MIDI_OP_MODE_UNSET;
> +	f_midi2_disable_ep(&midi2->midi1_ep_in);
> +	f_midi2_disable_ep(&midi2->midi1_ep_out);
> +	for (i = 0; i < midi2->num_eps; i++) {
> +		ep = &midi2->midi2_eps[i];
> +		f_midi2_disable_ep(&ep->ep_in);
> +		f_midi2_disable_ep(&ep->ep_out);

Please just open-code the function you tried to write above, it will
make more sense here.

thanks,

greg k-h
