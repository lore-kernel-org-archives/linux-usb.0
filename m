Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B33215F7D
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431663; cv=none; b=eU+ytmQZzK6HZMMCVqVrHpR2YWyPxky5oUEXNwbMrOUFEgbk8kGSUAtgCdv+JxfdJp49a7ym5Y4/AowT4HLXSv4x0PCAHtq0KPlkxkF+iQmLUs4gBbb345AwOsz7LlKnw5ONmwpkAeWJVUFcsJLPyUqQsuD3NnuX1X/b4VYXwJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431663; c=relaxed/simple;
	bh=chPjWLxYMSEfPcEu7zRYQkZsc5iYRY+a+EiuudUFGvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcULMrBApfEkpn1xUyHxtAGE/IYvpMZP5yyEAyyS8t+XENrJFDIJwuVUVq744KN7PnOS+LPgN+f50d4AMlhXQyKVdXUsyT0aJp3kKoRfpuH83jXzAVdLdQZxMY9IKt2oBF+gYy8gXiz68rLve+2InsL2jR22rGjCxhYADKWOdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=maOmoH4Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="maOmoH4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47432C4CEF7;
	Wed, 25 Mar 2026 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774431662;
	bh=chPjWLxYMSEfPcEu7zRYQkZsc5iYRY+a+EiuudUFGvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=maOmoH4YO5xlbPvD4ODx7fgnHPbOB9eMuR64zX8K7BmZkyXgKb9n+FmKRmbSA9OM5
	 ytQhJA0x/5DmhaWs7ktqKSjbDIl3kcEzSNKw6+s/ed38uSI3WWfnKy2k0s5Yh9NsQh
	 k96UQ7DBqHkNDThgnJzcjatpUHO4qMe/L/EAJNvU=
Date: Wed, 25 Mar 2026 10:40:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kelvin Mbogo <addcontent08@gmail.com>
Cc: linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	security@kernel.org
Subject: Re: [PATCH 1/3] usb: usbip: fix integer overflow in usbip_recv_iso()
Message-ID: <2026032513-manila-dividend-f9e2@gregkh>
References: <20260325092606.7474-1-addcontent08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325092606.7474-1-addcontent08@gmail.com>

On Wed, Mar 25, 2026 at 12:26:04PM +0300, Kelvin Mbogo wrote:
> usbip_recv_iso() computes the iso descriptor buffer size as:
> 
>     int size = np * sizeof(*iso);
> 
> where np comes straight from the wire (urb->number_of_packets, set by
> usbip_pack_ret_submit() before we get here).  With np = 0x10000001 and
> sizeof(*iso) == 16 the product is 0x100000010 which truncates to 16 on
> a 32-bit int.  kzalloc(16) succeeds but the following receive loop
> writes np * 16 bytes into it - game over.
> 
> USBIP_MAX_ISO_PACKETS (1024) already exists in usbip_common.h for the
> submit path but was never enforced on the receive side.
> 
> Clamp np to [1, USBIP_MAX_ISO_PACKETS] and switch to kmalloc_array()
> so the allocator itself can catch overflows in the future.
> 
> One subtlety: usbip_pack_ret_submit() already copied the bogus np into
> urb->number_of_packets before we run, so just returning -EPROTO isn't
> enough - processcompl() in the HCD will still iterate that many
> iso_frame_desc entries when it completes the failed URB.  Zero out
> urb->number_of_packets before bailing to prevent that secondary crash
> (confirmed on 6.12.0, processcompl+0x63 with CR2 in unmapped slab).
> 
> Reported-by: Kelvin Mbogo <addcontent08@gmail.com>
> Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>

Nit, no need to have reported-by when you author and sign off on a
patch.

and as this is public, no need to cc: security@k.o anymore either.

> ---
>  drivers/usb/usbip/usbip_common.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> index a2b2da1..549e34b 100644
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -662,7 +662,6 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
>  	void *buff;
>  	struct usbip_iso_packet_descriptor *iso;
>  	int np = urb->number_of_packets;
> -	int size = np * sizeof(*iso);
>  	int i;
>  	int ret;
>  	int total_length = 0;
> @@ -674,12 +673,22 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
>  	if (np == 0)
>  		return 0;
>  
> -	buff = kzalloc(size, GFP_KERNEL);
> +	if (np < 0 || np > USBIP_MAX_ISO_PACKETS) {
> +		dev_err(&urb->dev->dev,
> +			"recv iso: invalid number_of_packets %d\n", np);
> +		/* usbip_pack_ret_submit() already set urb->number_of_packets
> +		 * from the wire - zero it so processcompl() does not iterate
> +		 * OOB descriptors on the way out. */
> +		urb->number_of_packets = 0;
> +		return -EPROTO;
> +	}

Why not just make the np == 0 do the same here and just silently eat the
message?  Do we have to report an error?

Also, nit, the comment style you used here is for network drivers, not
USB drivers :)


> +
> +	buff = kmalloc_array(np, sizeof(*iso), GFP_KERNEL);

Not kzalloc_objs()?


>  	if (!buff)
>  		return -ENOMEM;
>  
> -	ret = usbip_recv(ud->tcp_socket, buff, size);
> -	if (ret != size) {
> +	ret = usbip_recv(ud->tcp_socket, buff, np * sizeof(*iso));
> +	if (ret != np * (int)sizeof(*iso)) {

is the cast needed?  Or is there a compiler warning without it?

And as you are calculating "np * sizeof(*iso)" multiple times here, why
not just keep the "size" variable at the top here?  Then that would be
one less line changed here.

thanks,

greg k-h
