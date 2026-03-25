Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278839D6D2
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431831; cv=none; b=OJvS0Y0mDIwH2q9l0ExQ0B5tunt6ms10igL2zvrhbuXv24drgJnsvKOLix67j8sUlxjeZU10dVYyySHP0RUUn2kmwvS392bAL+OAuNahAqrKcfZSOwFrZGq2OCNFbC/Y+h28FzwwIzbkN0ZERQpA9wrDV7Noc7VegNQxwLr5PmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431831; c=relaxed/simple;
	bh=ONv4lq9kpb9l0YJM1VyzMhMqAEoEjD6m2f6MgfgOR7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6Dgf9cZ6PUyD73fmb7qv/srXputXjh9A1KS+/x1KUnCyAH74UAr2op6eSyzMA/Y7ZJC4ASwU6lmQvV1nXo9xWDuGY7rIOYxRjpe768hjgJlELZFxXSgcVHBkNcFShEvfPJK4j/TmyxjsHlTf8Ah3MA0CssD2JY2GPOz0QPnx+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IlWjo6NE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IlWjo6NE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06896C4CEF7;
	Wed, 25 Mar 2026 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774431831;
	bh=ONv4lq9kpb9l0YJM1VyzMhMqAEoEjD6m2f6MgfgOR7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlWjo6NEGtXTI1vuaszGZY4eukSzuI8ilg79/aUGP0+vwmf1pmeLL3oKibevtxXvL
	 KG4pRFIB85e09/X/N5n+4iAgtw13Ry2IoCrApqzAkXEFdXh1ENO63UMfc2cdIs7afR
	 z7puHHNp951LeZiX1Ud5z4oc96cZPfpPmlE7vp/U=
Date: Wed, 25 Mar 2026 10:43:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kelvin Mbogo <addcontent08@gmail.com>
Cc: linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	security@kernel.org
Subject: Re: [PATCH 3/3] usb: usbip: fix OOB read/write in usbip_pad_iso()
Message-ID: <2026032519-zealous-backed-461c@gregkh>
References: <20260325092606.7474-1-addcontent08@gmail.com>
 <20260325092606.7474-3-addcontent08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325092606.7474-3-addcontent08@gmail.com>

On Wed, Mar 25, 2026 at 12:26:06PM +0300, Kelvin Mbogo wrote:
> usbip_pad_iso() repositions ISO frame data within the transfer buffer
> via memmove().  Neither the source offset (actualoffset, derived by
> subtracting wire-supplied actual_length values) nor the destination
> offset (iso_frame_desc[i].offset, taken directly from the wire) is
> bounds-checked.
> 
> If a crafted actual_length wraps actualoffset negative through the
> subtraction (see patch 2/3 for the root cause), the memmove source
> points before the allocation - slab OOB read, data returned to
> userspace.
> 
> Independently, iso_frame_desc[i].offset is never validated against
> transfer_buffer_length.  Setting offset past the end of the buffer
> gives a fully controlled OOB write into whatever sits next in the
> slab - confirmed with offset=400 on a 392-byte buffer, 64-byte write.
> 
> Add bounds checks for both the source and destination ranges before
> each memmove call.  Use unsigned comparisons after the sign check on
> actualoffset to avoid signed/unsigned conversion surprises.
> 
> Reported-by: Kelvin Mbogo <addcontent08@gmail.com>
> Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
> ---
>  drivers/usb/usbip/usbip_common.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> index c79a90f..e95e63f 100644
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -769,6 +769,36 @@ void usbip_pad_iso(struct usbip_device *ud, struct urb *urb)
>  	 */
>  	for (i = np-1; i > 0; i--) {
>  		actualoffset -= urb->iso_frame_desc[i].actual_length;
> +
> +		/* source: actualoffset can go negative via crafted
> +		 * actual_length - catch that plus any overshoot */
> +		if (actualoffset < 0 ||
> +		    (unsigned int)actualoffset > (unsigned int)urb->transfer_buffer_length ||
> +		    urb->iso_frame_desc[i].actual_length >
> +				(unsigned int)urb->transfer_buffer_length -
> +				(unsigned int)actualoffset) {


That's soem rough indentation, didn't checkpatch complain about it?

> +			dev_err(&urb->dev->dev,
> +				"pad_iso: bad src off=%d len=%u bufsz=%d\n",
> +				actualoffset,
> +				urb->iso_frame_desc[i].actual_length,
> +				urb->transfer_buffer_length);
> +			return;
> +		}
> +
> +		/* dest: offset comes straight from the wire, never checked */

as you are checking it here, why not say that?

> +		if (urb->iso_frame_desc[i].offset >
> +				(unsigned int)urb->transfer_buffer_length ||
> +		    urb->iso_frame_desc[i].actual_length >
> +				(unsigned int)urb->transfer_buffer_length -
> +				urb->iso_frame_desc[i].offset) {

Again, odd indentation.

thanks,

greg k-h
