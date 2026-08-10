Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B253AD531
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370065; cv=none; b=TH5F+0Qi2Cniz/hZOk5wLXEE2ZfZVL81gqoPGwjF5RJLv6bYYfHwp1c/fxbvfwMVXxNd5m70YbD1TRQzXAEgO0dMh7iieuiP2Rn2n3E/qMs/IOyt63XJP0uENHz+rdSSs2gC0/12HpDI2iw1CxtD51HwcnAr6zEl+88iUSwZO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370065; c=relaxed/simple;
	bh=K20w2hkA1GeB59OfT9MrgKeGGaCroV6c8F6TUCcrpUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ4ukiRhs6YX6DbesunlUSVJUVNqvkQALqsw5/pPTL+gN9e62fLHjRszKN5xGo7ue9iaZvfJRITYpxvumD4nXfeIRS6hqaP1OiTHINtoCUqwpU/o64TEWGcoOMmaWW8uYAvPQhTqmmlOZ1nNNKenNNLq4dCZ8E5rq+nYjVJ1+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nDux75Fp; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nDux75Fp"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5218927884fso18438911cf.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786370062; x=1786974862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Gjj3Ar8GXNl6474TVXHlm3Nbb0dLaiQhJwp56fbo9Q=;
        b=nDux75Fpk0oyVuG4maz8LzOeQijjT92NzLwmdD+1PB97Yqaw2KbY8PJMaAHNr2Wgst
         YL+Flv6lhJCif2DdZQYQqHMuvCphJkNjA5r7tln2rZ2zMcqtfFc42k2IacjrFdCaP1d6
         +53hW6zn4VIrBevd/nGAkawS6EUpAiUCvS7VqruaI+1kR9MLqpvG4ZuJG/pvmPJVH7d5
         EyBdBRu+XrAsWOp36/GWcAS68M8Gf7zS97i0G2/TO3Np+75amc/m8f1hw2EWuFVpagt8
         M3euXDilBjHKTbrG7xBoxZZZR6pUXH5iG4VjGSWsFMQZ2uo8hEmT5YYvB8MmKwzTzxDk
         kojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370062; x=1786974862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Gjj3Ar8GXNl6474TVXHlm3Nbb0dLaiQhJwp56fbo9Q=;
        b=CO/CONPI55tT9lx9tVe/dn8ScYMsZNRlnvn9FUvHh6ZmcsXQd0L36DHo2jJEQEI4Vx
         E/XOlLTHN/IxeGU7ZJ0VhZmh11o3K+uXOTPsB3+wtU6brc3e4E0HQcW1cbQk1VDXlPFT
         fIZzii+HfdPq2FxHOBWKicQg8KaYHOMe7Bv/xh11rFpTEbyPdICs+fxTq+l7fFq4ypRg
         N5vdp3xD0JLJbztaoA2wOli6hpRj29p71qTpL897i2Se4pv9CC1IgWHv4z4FTnYs2uT2
         kosUNfIh8x6XLq7KZFEj1H6YaimjBVue+noae864sjpd2+ZjV+ZApMb7m+14QugegLjX
         N+Lg==
X-Gm-Message-State: AOJu0YyUSyaMw46qW8Af1VBZ7+WRBNYcJCriRR/bYviprblt9T8PQyhR
	rv/MrseOjhhsKk/NbLWE8njAZ9eIkJZsDNI7VF5umt2bba6ZOSdps1MCwMe7DzZ69cBa6bNLSxU
	6D7qV5g==
X-Gm-Gg: AR+sD12Ojy1ZPwygMZbNz2aq/6RK3yjKOna75VsMDhR8n7x4vi+l0gut3uSYhuqHAMX
	2DBNoFDA1oYUz5bmWSUSjeNYHonzpt4O/BTNcik+KW/P0lZg0NDzos5aD4e5DG6bxpd9ZArj01V
	+jiwqMkD+R2RITJGffLEj5PkdIJjmauCB5/Em9q7T7gNt8EAR0KCRHi9eR4QUpmeaNpV2JcFkJD
	/Bt6UbPVBnmknIZe7u8/IZr5xLCH+Q/jI133LLG0En0HF91Qu4W1hlfztPdR56X4FZdKeTOL5er
	h939K0yWBY+cOxzJHFLFgKYVFoBNrnP9hSXOMQ56SMP8sHZ0kpumgyE8PtSgUVbvTDjuQgS5OTs
	Y1wnuz8J2+Wfcw9sN+/dpjHrMtibmB3L39jVodnrf5C7SJYTHN2wwnq6SfQHcTekAQp2JFck0nA
	cqYtdGGkXOS3QrA/iEXQZ31Lm0U2ErvHk25f2T6brtIkmgNHQ3eFGSJuWdSkAE9B1DIS/KV/wWH
	L6A740=
X-Received: by 2002:a05:622a:4c8d:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-52d4bba4201mr21459221cf.17.1786370062364;
        Mon, 10 Aug 2026 06:54:22 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d16380af8sm71864891cf.11.2026.08.10.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:54:21 -0700 (PDT)
Date: Mon, 10 Aug 2026 09:54:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Miguel =?iso-8859-1?Q?Pe=F1aranda?= <mig.penaranda07@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: usbfs: fix use-after-free of usb_device in
 usbdev_release()
Message-ID: <949c706d-ac9e-4d66-b1cb-c92164f1fdb7@rowland.harvard.edu>
References: <20260810121209.795089-1-mig.penaranda07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810121209.795089-1-mig.penaranda07@gmail.com>

On Mon, Aug 10, 2026 at 02:12:09PM +0200, Miguel Peñaranda wrote:
> usbdev_release() drops its reference to the struct usb_device before
> draining the list of completed async URBs, but that drain path reads back
> through the same object: free_async() calls dec_usb_memory_use_count()
> for any URB whose buffer came from the usbfs mmap() region, and its first
> statement is bus_to_hcd(ps->dev->bus).
> 
> After a disconnect the usbfs reference can be the last one, in which case
> usb_put_dev() frees the device and the subsequent loop reads offset 80 of
> freed memory and uses the result as a struct usb_hcd *, which
> hcd_buffer_free_pages() then dereferences.
> 
> This is reachable by an unprivileged process that has read/write access to
> a /dev/bus/usb node: mmap() the fd, submit one URB with a buffer inside the
> mapping, wait for the device to be unplugged, then munmap() and close().
> It reproduces on every attempt rather than being a race, because a live
> MAP_SHARED vma holds a reference on the struct file, so usbdev_release()
> cannot run until the last vma is gone and the freeing branch of
> dec_usb_memory_use_count() is always taken.
> 
>   BUG: KASAN: slab-use-after-free in dec_usb_memory_use_count+0x3ae/0x410
>   Read of size 8 at addr ffff8880122ee050 by task poc/769
>   CPU: 1 UID: 1000 PID: 769 Comm: poc Tainted: G    B    6.12.94 #3
> 
>   Call Trace:
>    dec_usb_memory_use_count+0x3ae/0x410
>    free_async+0x2aa/0x4f0
>    usbdev_release+0x375/0x460
>    __fput+0x3ea/0xb50
>    __x64_sys_close+0x86/0x100
> 
>   Allocated by task 11:
>    usb_alloc_dev+0x55/0xd90
>    hub_event+0x2524/0x43d0
> 
>   Freed by task 769:
>    kfree+0x121/0x360
>    device_release+0xd2/0x280
>    usb_put_dev+0x23/0x30
>    usbdev_release+0x2d8/0x460
> 
> Release the device reference after the drain loop instead. Nothing between
> the two points requires it to have been dropped.
> 
> Fixes: f7d34b445abc ("USB: Add support for usbfs zerocopy.")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Miguel Peñaranda <mig.penaranda07@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/devio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index e191934..486ced7 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1113,7 +1113,6 @@ static int usbdev_release(struct inode *inode, struct file *file)
>  	if (!ps->suspend_allowed)
>  		usb_autosuspend_device(dev);
>  	usb_unlock_device(dev);
> -	usb_put_dev(dev);
>  	put_pid(ps->disc_pid);
>  	put_cred(ps->cred);
>  
> @@ -1122,6 +1121,7 @@ static int usbdev_release(struct inode *inode, struct file *file)
>  		free_async(as);
>  		as = async_getcompleted(ps);
>  	}
> +	usb_put_dev(dev);
>  
>  	kfree(ps);
>  	return 0;
> -- 
> 2.53.0
> 
> 
