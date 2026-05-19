Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E23F660B;
	Tue, 19 May 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182922; cv=none; b=s/ALmuek1VXoIQzc5MWayEFYgla6g//+sjSvP7sofg2/MFxqIumxv2wNrIuU9tWVc5jnr9/wdhaVG8Lz+DwM1expXrAtEGeNb69nkQcRj3stvoDkAFgSEhD2E11wwGvwAw/W8GBNdsAa+4pZ18EJKfoQNHBFyaZ70a42dOfCO2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182922; c=relaxed/simple;
	bh=HreBOLBr2BK8msoCaOe/6XdPiH290bha56C4u1CbNIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ziid4GPUKroSYrNZO26mqasyjxVxa2j00kF9yQ8RvscCIOy8G1tkT0Er4dHg6M09utnppPQOIHrxbohaexyH6iw3UOfKIh3gjiw8npFXBmzjFHkJDSTQp2Ap9Y/y+W4wZp5/xaKihh7KK61tPrjiXVslEdPPZMVLN6IU3KsCS/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cS4Nu5jU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cS4Nu5jU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C04C2BCB3;
	Tue, 19 May 2026 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779182921;
	bh=HreBOLBr2BK8msoCaOe/6XdPiH290bha56C4u1CbNIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cS4Nu5jUwscHJ6OS/XBAA/BPBvJhyMmJFRTtdv7GVZvDkfj7uYj2pw6a0peNLK/4G
	 0fGZL2yLaQ20EzsgspETjz9yollwvKJIYjNnLkWw4gwqP5cAo3tBhCGR1AH0L2Wa6Z
	 /nWF/k2wjzmmHZTWKQI3DBoAubmssjtA/4AgZfVM=
Date: Tue, 19 May 2026 11:27:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: remove useless check of !chan
Message-ID: <2026051917-deceiver-monthly-cb22@gregkh>
References: <20260519060001.13199-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519060001.13199-1-jszhang@kernel.org>

On Tue, May 19, 2026 at 02:00:01PM +0800, Jisheng Zhang wrote:
> It looks a bit strange we check !chan after dereference of this pointer
> with "if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL)".
> 
> In fact, when entering the dwc2_hcd_save_data_toggle(), the chan won't
> be NULL, because its caller or indirect caller has ensured this,
> specifically, it's checked with below line in dwc2_hc_n_intr()
> 
> if (!chan) {
>     dev_err(hsotg->dev, "## hc_ptr_array for channel is NULL ##\n");
>     return;
> }
> 
> This addresses the following issue reported by klocwork tool:
>   - Suspicious dereference of pointer 'chan' before NULL check at
>     line 518
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/usb/dwc2/hcd_intr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
> index 5c7538d498dd..397c63393c7f 100644
> --- a/drivers/usb/dwc2/hcd_intr.c
> +++ b/drivers/usb/dwc2/hcd_intr.c
> @@ -515,7 +515,7 @@ void dwc2_hcd_save_data_toggle(struct dwc2_hsotg *hsotg,
>  	u32 pid = (hctsiz & TSIZ_SC_MC_PID_MASK) >> TSIZ_SC_MC_PID_SHIFT;
>  
>  	if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL) {
> -		if (WARN(!chan || !chan->qh,
> +		if (WARN(!chan->qh,
>  			 "chan->qh must be specified for non-control eps\n"))
>  			return;

Can this ever actually happen?  If so, the machine just rebooted as
almost all devices with this hardware in it run with panic-on-warn
enabled.  If not, can you fix this up to properly handle the error and
return correctly and not crash?

thanks,

greg k-h
