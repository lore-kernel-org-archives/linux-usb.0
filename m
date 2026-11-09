Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240339;
	b=lpAFsb/9h6/RK4Ws2Qy7YJwH9rEM+7KKcClub74XM7Fh6MUQR9lbNqgf9YVd1vV09vxb
	 xTocaPDW35N26D3mDaRz3nfR12sYJFabaKieBlztjT0075/GFD+2wSM0TG0e5f3Cpix0q
	 7dqQwloYAVnTJDb+JCQoD9PWYX3VxuuoNl3t7VpXSvGyayYBkti0z8KLIqELm8q7USDTn
	 PKOf+jbtGxlgwIPLZWk8Gjw7hqMFJZTfbr0a8/Pdg2Dt9i7ACyccQCF46xtLq2o5dXsYL
	 qyeotJla8KMdygJgn5L8C7zsSvSG0/crX5E6Z72lq9XUZXu8I7kK0u8ZUKUwMnVrceA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LYVRQAtFLjHuxWJpTC5BWZlDIFuYh9qn66gBupwgfMM=;
	b=d4DHExe1z4efdfnAqQNUNjLyWqTWnWrriEGLwDjQUY/wBoRTwL8Fm3M/FmeZjzyFWLpR
	 OfG8H7q9R58TXGRGLUqZralgNs2014bCE47JaysTSlC9eiqAMTTeEGFdIxBrcSy4XaCs6
	 p5qD446Yaftsc81p9udhxJyuMLiBdepxDQM9t0nJe7PUep2s31tUcEs0t5xIirtU0x/DU
	 rgKKdYZPClAhTOA2kqwHYDnL+wzpoycRAVhSPgGMywTL+dUb6e8/1QhmHQ4uaY4qPsYfH
	 +BwyVUKuuWNDFnKRNd3I8zVYvhOa2iArvTp9qwCLI2XI0WCWM/0sj9rFfIqmh10nR2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="quZUOiS/";
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7096606A331
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 16:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7096606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=quZUOiS/
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e515769d3so102235985a.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 08:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794240338; x=1794845138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYVRQAtFLjHuxWJpTC5BWZlDIFuYh9qn66gBupwgfMM=;
        b=quZUOiS/45XOhrcf2A8zebaDNso7Ajy8i+ydu7kRxHPFU/SNOet5JU2UtdacDV2sLo
         +OoX2IbLYca18HAYpQpGDVeFsjAC2jzA9rzhJbO/DYs+4RwLZdzdnJjBdBrC9nOzJe9b
         uQPD5HXZF/1/cyL63PiOw9aXg6Hua+eN9XHjnfzoaHowl+1BdGom6goYYuMpp5VcpWTT
         LrRhVjzFG4RjUzxTEirRFUP5R/wmpi3vZxuZKhyQOWHsXa/rTRQDq9/+3l4oM++2VdN8
         YKSGO4zYRusztntG3nmmLmMgHnC9xbD4nCUX5FzRiWly3s8SwrK5Z2dnFe9SjlTBHjsR
         LrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240338; x=1794845138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYVRQAtFLjHuxWJpTC5BWZlDIFuYh9qn66gBupwgfMM=;
        b=XmSrI+ugkxejhZHAzrKlGs0Fv1Y7bAbtM06StTz4Rrbj65Bce81Vsyb2eTo02kPNxi
         R4FSVgMDB3dq00O3amXoMxSy/9LuJvP4vjQnJ4WPq8Ax+T6AirAh/r7IldkVksjgFISQ
         e+ECf+5KURJdv/+Xoal3Wjk+yO2baFmdHforh1+ppU5oVDNZC1zdwp+0fq7XOHZTGA6E
         RqiyiO6/7KuNFwG6lBXHpvMKp42JKjywuAadWGP5VNs41yb2qRGM0tNSchR7ueY1Dl/R
         y/sOqXi0cFZH+hox4Qp1hrAngvjQGSe6RmQaEERkuiAC0azae/BfJbTA3DXTy9REWC3u
         2Dyw==
X-Forwarded-Encrypted: i=1; AL+hErFErTde9xKgOPcCdqeYrjRi5wkuuhmdvcze+4X0qpqAeOIACua6YmzXPGXHzTn8QRW/yj3O1Qy6w6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wZrKWNrgx62xUNui4Nklg2ByEGrO3420GpuW2W1WaKOf+8rZt
	3L98au4JW5NBF8VApb8Yg1xOqTbW/ljD2Nv2zKyMgW4kGbauVkDKw7AwKsZq+bK0muvboENrmsb
	tFV844P/U
X-Gm-Gg: AYBFou0Gq4wYjjxLXCRP2S9Gfyza0TDLzF7ifCSZN80CnkBF+LHOXHjnBULSunqLwqH
	xMrHQYJnrzGCkcMiNid80bz5gEGaq3fqtiBbpcE+Dgphtook0xojdDfkspoe2Rq5f6XM5rVKZ99
	afovpeO623qDCRgl8R6W5p7zpiyNcZeaGNnCR+8fP8d366SioPWL0U4nUi4yhCyxgd1IYgOxD6J
	mYxPg2Xoe2dW3jvPHw+hrAew8aae7otm1ixbIYJWjZF1tIidwKcndwY4n885a1/QH5ibsK4zCo1
	pRzaqYK7z3uve431+fIMXSt3rAQDArPSwQCvW/KyRpA1EafUrxTAukPwupaI4DXtRcIMym/eo9d
	lyaqWgLrN7ugBiqRnccIr0MwwOoMSXT7xFllUFoQTeS/fKlyy9gRjOxoepnJ/vfESa9gC93iXkm
	vqlYfgeea7kdPqOL6djUJxA7C/+GUX3yjaUgTttmxf3bpWouis/xFhBIa+amURqB3W8MdCdV9gc
	S0DvFwWWG10ngwTBcUt0qEAdKbV8ZUtKdZC+rOQPYBFhO1RepD51T44G9B7h+2MBlk8B8YWGAlv
	AXfYmQevmJp7mn5rvcshsnbXsGV3
X-Received: by 2002:a05:620a:6cc3:b0:943:ff70:dbeb with SMTP id af79cd13be357-9478485e17dmr658497385a.17.1794240337529;
        Mon, 09 Nov 2026 08:05:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61b8f8sm7023385a.1.2026.11.09.08.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:05:35 -0800 (PST)
Date: Mon, 9 Nov 2026 11:05:30 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Pengfei Lv <lvpengfei20@huawei.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, xuhaiyang5@hisilicon.com,
	xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH v3] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Message-ID: <3daf18d4-4936-4ed7-8846-b67f1664be13@rowland.harvard.edu>
References: <20261106031625.1824732-1-lvpengfei20@huawei.com>
 <20261109093935.2634235-1-lvpengfei20@huawei.com>
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
In-Reply-To: <20261109093935.2634235-1-lvpengfei20@huawei.com>

On Mon, Nov 09, 2026 at 05:39:35PM +0800, Pengfei Lv wrote:
> Per USB 2.0 spec section 5.5.3, the ep0 maxpacket size is fixed for
> all device speeds except full-speed devices, where it can be 8, 16,
> 32, or 64 bytes and can only be determined by reading the device
> descriptor.  During initial enumeration the USB core guesses 64 bytes
> for full-speed devices; after reading the descriptor, the real value
> is stored in udev->ep0.desc.wMaxPacketSize and applied to hardware by
> usb_ep0_reinit().
> 
> Commit ff33299ec8bb ("USB: core: Fix race by not overwriting
> udev->descriptor in hub_port_init()") guarded the ep0 maxpacket guess
> block with "if (initial)", so on the reset path the guess is skipped
> and the host keeps using the value from the previous enumeration.  If
> a buggy full-speed device responds with one 8-byte packet and NAKs
> all further polling, the HC doesn't recognize a short transfer but
> keeps polling for the rest of the descriptor till unlink, and the
> device cannot be re-enumerated.
> 
> This was observed in production on a 6.6 LTS kernel with a full-speed
> USB banking token (bMaxPacketSize0 = 8) in a virtual-machine USB
> passthrough scenario; the reset re-enumeration hangs 100% of the time
> after the VM issues USBDEVFS_RESET.  The device is not strictly
> compliant (it should continue answering IN tokens), but this class of
> USB banking token is widely deployed in enterprise environments, and
> the regression breaks a configuration that previously worked.
> 
> The 18-byte GET_DESCRIPTOR that runs after SET_ADDRESS (wLength=18)
> is unaffected: the device sends the full 18 bytes as 8 + 8 + 2, and
> the final 2-byte packet is always a short packet regardless of
> maxpacket.  This is why the device completes initial enumeration yet
> hangs on reset re-enumeration.
> 
> Fix this by removing the "if (initial)" guard so that the ep0
> maxpacket size is re-guessed on every reset, and by calling
> usb_ep0_reinit() before each device-descriptor read so that the
> re-guessed value is applied to hardware before the GET_DESCRIPTOR
> data stage.
> 
> Fixes: ff33299ec8bb ("USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pengfei Lv <lvpengfei20@huawei.com>
> 
> ---
> 
> v3: Per review by Alan Stern and Michal Pecio, drop the !initial guard
> and move the usb_ep0_reinit() calls from after the re-guess block to
> right before each get_bMaxPacketSize0() invocation, so that ep0 is
> re-initialised before every descriptor read.  The commit message is
> reworded to be HCD-agnostic.
> 
> v2: https://lore.kernel.org/linux-usb/20261106031625.1824732-1-lvpengfei20@huawei.com/
> ---

This is looking pretty good.  However...

>  drivers/usb/core/hub.c | 52 +++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a89..d86bbba1457c 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4969,31 +4969,29 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  	}
>  	oldspeed = udev->speed;
>  
> -	if (initial) {
> -		/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> -		 * it's fixed size except for full speed devices.
> +	/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> +	 * it's fixed size except for full speed devices.
> +	 */
> +	switch (udev->speed) {
> +	case USB_SPEED_SUPER_PLUS:
> +	case USB_SPEED_SUPER:
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> +		break;
> +	case USB_SPEED_HIGH:		/* fixed at 64 */
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> +		break;
> +	case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> +		/* to determine the ep0 maxpacket size, try to read
> +		 * the device descriptor to get bMaxPacketSize0 and
> +		 * then correct our initial guess.
>  		 */
> -		switch (udev->speed) {
> -		case USB_SPEED_SUPER_PLUS:
> -		case USB_SPEED_SUPER:
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> -			break;
> -		case USB_SPEED_HIGH:		/* fixed at 64 */
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> -			break;
> -		case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> -			/* to determine the ep0 maxpacket size, try to read
> -			 * the device descriptor to get bMaxPacketSize0 and
> -			 * then correct our initial guess.
> -			 */
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> -			break;
> -		case USB_SPEED_LOW:		/* fixed at 8 */
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> -			break;
> -		default:
> -			goto fail;
> -		}
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> +		break;
> +	case USB_SPEED_LOW:		/* fixed at 8 */
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> +		break;
> +	default:
> +		goto fail;
>  	}

The usb_ep0_reinit() call belongs here, right after 
udev->ep0.desc.wMaxPacketSize is set.

>  
>  	speed = usb_speed_string(udev->speed);
> @@ -5062,6 +5060,9 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  				goto fail;
>  			}
>  
> +			/* Sync the guessed ep0 maxpacket size to hardware if needed */
> +			usb_ep0_reinit(udev);

Not here.  And not inside the retry loop -- ep0_reinit should be called 
only once since the maxpacket value is changed only once.

> +
>  			maxp0 = get_bMaxPacketSize0(udev, buf,
>  					GET_DESCRIPTOR_BUFSIZE, retries == 0);
>  			if (maxp0 > 0 && !initial &&
> @@ -5127,6 +5128,9 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  		if (do_new_scheme)
>  			break;
>  
> +		/* Sync the guessed ep0 maxpacket size to hardware if needed */
> +		usb_ep0_reinit(udev);

And also not here.

> +
>  		maxp0 = get_bMaxPacketSize0(udev, buf, 8, retries == 0);
>  		if (maxp0 < 0) {
>  			retval = maxp0;
> -- 
> 2.34.1

Alan Stern
