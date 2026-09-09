Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F687352005
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943593; cv=none; b=oeW5EeDO916pOptg7r7K4v5QCaZhw8yBuspPoEG1847q6w00VMfARrj3pk4NxEBs1HBmo61W+a7E3KBY4d/FKBJJWuDnggMZLfRZWC4cZgWGUJk6KFpWVTk7SJtmEw59jaWgy0PkXF5iC07di7IRbclujvhTlYbX1FJGn4Z6yes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943593; c=relaxed/simple;
	bh=aBOVVFHQvWvqDtfflhw64C7pYTowb1x/iEeKBtXQcbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NY226gZXmJ0pqVDO1D2nypRU3sfJDFoj/7GPvi43M/exMDoiZQD9Che2A8pWja/CyPzwnxS5TEkwIqiaFobyqzFj2kS0noyaZxmEVmxqyAgt5jVASZGGMA91c9ZB9dG6sUwDZtuQzK48RzZFmNEmGBI0TNrpgrNerpNsELzuE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o+6niq73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o+6niq73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616D31F00A3A;
	Wed,  9 Sep 2026 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788943591;
	bh=J9vXl4jeHbWS0jYALXFwZSb1yujW7iAr0UJ89Xbneps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o+6niq732A2n9lI1yTBkiY1m58/Qd7JzoBjN3bLsecpEr7ArdwEi7s+Q544DMt0qM
	 qrAnyJ6ATh2lFix6D7MMx+GPrz+74FHt3d/78YIXw2EeXiBgKOXOI7iWGOr/b/af8g
	 dPfhkhfjdmLYq78nU4dj+7NTBaTGBkPdrz20MWgw=
Date: Wed, 9 Sep 2026 10:46:24 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Markus Mikonsaari <markus.mikonsaari@gofore.com>
Cc: "valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"i@zenithal.me" <i@zenithal.me>
Subject: Re: [PATCH] usbip: fix number_of_packets corruption for
 non-isochronous transfers
Message-ID: <2026090926-blunt-lushness-1012@gregkh>
References: <GV2PR05MB10593A82388157FCA3397879898B02@GV2PR05MB10593.eurprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR05MB10593A82388157FCA3397879898B02@GV2PR05MB10593.eurprd05.prod.outlook.com>

On Wed, Sep 09, 2026 at 08:09:48AM +0000, Markus Mikonsaari wrote:
> In the USB/IP protocol, number_of_packets is set to 0xffffffff (-1)
> by sender when the transfer is not isochronous.
> usbip_pack_pdu() copies this wire value into urb->number_of_packets
> unconditionally.
> 
> A host controller driver may compute the iso_frame_desc memory requirements
> directly from number_of_packets without independently validating it
> against the pipe type which produces an undersized allocation.

What driver does that?

> On dwc_otg, this manifests as a slab-out-of-bounds write in
> dwc_otg_hcd_urb_alloc() during a USB/IP attach involving a non-isochronous
> transfer.
> 
> Correct the number_of_packets to the value the urb was actually
> allocated for immediately after usbip_pack_pdu() overwrites it.
> 
> Signed-off-by: Markus Mikonsaari <markus.mikonsaari@gofore.com>

How was this found and tested?

And did you forget an Assisted-by: tag?

> ---
>  drivers/usb/usbip/stub_rx.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d..baf511024da2 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -567,6 +567,17 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>  		}
>  
>  		usbip_pack_pdu(pdu, priv->urbs[0], USBIP_CMD_SUBMIT, 0);
> +		/*
> +		 * number_of_packets is set to -1 by the sender when the transfer is
> +		 * not isochronous.
> +		 * usbip_pack_pdu() copies this wire value into urb->number_of_packets
> +		 * unconditionally, instead of using the correct value in np which was
> +		 * used to allocate the urb above. For a non-isochronous transfer this
> +		 * leaves number_of_packets at -1 which downstream consumers of this urb
> +		 * like host-controller drivers use to allocate iso_frame_desc storage.
> +		 * Restore it to what the urb was actually allocated for.
> +		 */
> +		priv->urbs[0]->number_of_packets = np;
>  	} else {
>  		for_each_sg(sgl, sg, nents, i) {
>  			priv->urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
> @@ -579,6 +590,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>  			usbip_pack_pdu(pdu, priv->urbs[i], USBIP_CMD_SUBMIT, 0);
>  			priv->urbs[i]->transfer_buffer = sg_virt(sg);
>  			priv->urbs[i]->transfer_buffer_length = sg->length;
> +			/* see comment about number_of_packets above */

What comment?  That's not the best way to do this...

thanks,

greg k-h
