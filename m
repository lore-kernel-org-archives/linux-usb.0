Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15A3B8D69;
	Thu, 22 Jan 2026 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078139; cv=none; b=fqym3AZIf1dyuSIjwZo/V3T6vZQgzCaPucAMQeJD/2d1iipakc/WFsTZqcuDkIS+1acTStD+jo0kHaZ/2bRV2PRssuIGX+D0j5obnpuE/Tc5+PLzpUd0TnfRlYbdGKwLsd1YPikO7NhGUW9i0jGsMKQGFZIPjrNvkDXrhRD5wfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078139; c=relaxed/simple;
	bh=A758AVlFg4HoaBhHF9x/Ei6m1eq62w0NOsNe93v+TOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNe/SCo9a4OBIeM6BTEOaRFBuMh7kV3WrLiRybQ+mfuucnZOhJo0HGKevRqtYTEM+/ataIQOD1pk32K+mQn+YLP2985sCG/w2gTNxo+VKglKpxi+rNa9xtXOKKvI0DeEhwVAiKvDrYozK/7BbPMQjWRNUCnubyZl9NJmHPLpA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gpko2fCx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gpko2fCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61D3C19423;
	Thu, 22 Jan 2026 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769078139;
	bh=A758AVlFg4HoaBhHF9x/Ei6m1eq62w0NOsNe93v+TOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gpko2fCxo1L1TnUMDqSncHlOCV/G2uohl9AyMtOnfrMSQ1O5zSZQ1ybciqCGOeMN/
	 4Sjh6fw3J9zFeTW1WrxHonMAUgDQnwtSLYCIoXtdjmSSjVHn3x/avIGk7Iq0anlZwh
	 t3VUCCR+peJzaY3wuEQIZjFsjKWs2x7cE4jtkaeU=
Date: Thu, 22 Jan 2026 11:35:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kery Qi <qikeyu2017@gmail.com>
Cc: balbi@kernel.org, jaswinder.singh@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: validate endpoint index for max3420 udc
Message-ID: <2026012222-unroasted-willing-6add@gregkh>
References: <20260121203944.1898-2-qikeyu2017@gmail.com>
 <2026012246-yeast-attempt-1ca1@gregkh>
 <CALEuBanDC_8YfPsbh6P-S4aBwih3WqofOg+3oN6PwF+noeyRdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALEuBanDC_8YfPsbh6P-S4aBwih3WqofOg+3oN6PwF+noeyRdg@mail.gmail.com>

On Thu, Jan 22, 2026 at 06:16:08PM +0800, Kery Qi wrote:
> Hi greg k-h,
> 
> Thank you for your response.

Please do not top-post, you have lost the context in this message :(

> I'd like to clarify that I found this issue by performing variant analysis
> based on commit 7f14c7227f342d9932f9b918893c8814f86d2a0d ("USB: gadget:
> validate endpoint index for xilinx udc"). That commit fixed the missing
> endpoint index validation in udc-xilinx.c before accessing the endpoint
> array, and was accepted into the kernel. I searched for similar patterns
> in other UDC drivers and found that max3420_udc.c has the same issue -
> MAX3420_MAX_EPS is only 4 while USB_ENDPOINT_NUMBER_MASK allows values
> 0-15, so both max3420_getstatus() and max3420_set_clear_feature() can
> access udc->ep[] out of bounds without validation.

But can that ever actually happen?  Remember, we trust the hardware
here.  if you wish to change the model where we do not trust the
hardware of this device, then there is a lot more work that needs to be
done than just attempting to add this single check.

How was this tested?

> If there was a previous discussion about this specific driver that I
> missed, I would appreciate a pointer to that thread.

I think the archives have them for this type of change, a simple search
brings up this thread:
	https://lore.kernel.org/all/20250629201324.30726-4-eeodqql09@gmail.com/

It was rejected back then, please work with your teammates on
coordinating this type of thing and do not send duplicate patches.

Also, you forgot to document the tools that you used to "find" this
issue, as is required.  For that reason alone this patch would not be
acceptable, sorry.

thanks,

greg k-h
