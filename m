Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115939BFEE;
	Wed,  1 Apr 2026 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032842; cv=none; b=iJFMCzBYndWD+0FvIjVABYwO/XXgewx/5EdmhtkhSyvD6+EPRbhvkiTghv88lziKtFTgfyoPrYhcguWn7/0DBNTXz9uoSfdeh0xVREU3UkAK6xpcedT0YUpftM3pSO0Up3K5rR4GE8roY2uyBnJaQ8WUdZ1ZbgpDwlXDxNTMAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032842; c=relaxed/simple;
	bh=jDlbVBCfE5k01UpqjhoBFIFggczkzcBZhwNqotL5JFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HamkvTygoeDDyrrboyfN21+wAoryT6M2To65keunx4ydRSSU3/HCGwYyeQHFpF4YohrchzZIMRrSbQA2G3awg9IPKbM9SL7Kc4ZJU81r9MyP2VzNVnPpEhuc6NleuD2mXi4W9ruM/VXQrNz2Dvk/bpruKJ0Er7AB1Wp0NVflHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xh/3s9J7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xh/3s9J7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573CBC4CEF7;
	Wed,  1 Apr 2026 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775032841;
	bh=jDlbVBCfE5k01UpqjhoBFIFggczkzcBZhwNqotL5JFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xh/3s9J77+KioC9prZck+U8rvOwhBPbkV0YABV3QRZmc3mvYCZbmjsXt77IndcD+A
	 unwMkmTcaSU9VVXAkiqpbb0CtlG2ScnNMJ7RImcUohPdvGjJcAQK5QCrHSgBl1Rg7U
	 WaIQl0+lynq5NnnIW/QkegKrjaG6weg4LBQjsy9x9eNXOJVxEPpT5jkDwdgxT6eZzK
	 69a8iP0/zBeatNOcgJuCsCTXkjZ3pwbUi/cVNWNO0AqSolyWmGcQJy30cc4IfAmyNM
	 yGJJwyBOjRov84BTBCTL0lssTqCLTGpw0x3FNIUyPSlaoP5Yv7+w79t9jjHK40GdG/
	 1WMMIJjrGGP6g==
Message-ID: <c457cffd-ae11-42b3-9843-5a19402bbff1@kernel.org>
Date: Wed, 1 Apr 2026 10:40:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: usbio: Fix URB memory leak on submit
 failure
To: Felix Gu <ustc.gu@gmail.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-usbio-v2-1-d8c48dad9463@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260331-usbio-v2-1-d8c48dad9463@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Mar-26 14:05, Felix Gu wrote:
> When usb_submit_urb() fails in usbio_probe(), the previously allocated
> URB is never freed, causing a memory leak.
> 
> Fix this by jumping to err_free_urb label to properly release the URB
> on the error path.
> 
> Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Fix Oliver's comment.
> - Link to v1: https://lore.kernel.org/lkml/20260330-usbio-v1-1-7141b6dc612a@gmail.com

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/usb/misc/usbio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
> index 2e68d48a2cc0..02d1e0760f0c 100644
> --- a/drivers/usb/misc/usbio.c
> +++ b/drivers/usb/misc/usbio.c
> @@ -614,8 +614,10 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
>  	usb_fill_bulk_urb(usbio->urb, udev, usbio->rx_pipe, usbio->rxbuf,
>  			  usbio->rxbuf_len, usbio_bulk_recv, usbio);
>  	ret = usb_submit_urb(usbio->urb, GFP_KERNEL);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Submitting usb urb\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Submitting usb urb\n");
> +		goto err_free_urb;
> +	}
>  
>  	mutex_lock(&usbio->ctrl_mutex);
>  
> @@ -663,6 +665,7 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
>  err_unlock:
>  	mutex_unlock(&usbio->ctrl_mutex);
>  	usb_kill_urb(usbio->urb);
> +err_free_urb:
>  	usb_free_urb(usbio->urb);
>  
>  	return ret;
> 
> ---
> base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
> change-id: 20260330-usbio-d70e15c97a7a
> 
> Best regards,

