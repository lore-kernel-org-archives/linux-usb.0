Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15F373BF2
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162459; cv=none; b=pgkGJtWxGr942VeaQq30FkfdNXt77Csr7n9xEF5fYQS8rDaw0GzCS1bpwai+Pmuoe/i9bVVbbHB7w4+FMRGzsYzkXpiAjoRomrh8xaFcG9ZHA2n3psW945SJh5Rr3Cua4CDKOf9xDr17in8XmmaJqD9H3fgG1w0oht4BKOOlAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162459; c=relaxed/simple;
	bh=45R27qSll9uQAxq3WpC3E2LSC3xsoasowjrZqMrmlDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYnOhvERihjJSzauADewujBrmOFjrLsvxyvqQ1yLj+KyXmr5H5//SbbgFihv7tftDHgW2/K65VsyHLpBeVX3wZTPiubky4U0eOI99a4bx4PuZAsvjKENaV07ztSLe1ZaqiFi1FgAGJTMooKdQkWV4xBsoUedR1t7/gcjcDxOy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XRyWj2Wa; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XRyWj2Wa"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e602d2c0fso302726385a.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785162456; x=1785767256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rElzCHqZ9M5M53Xy+ydRNO4DA9FXxqHVU/hb2MJlhBM=;
        b=XRyWj2Wa1IhzWcVoByhgwxZV8BhSndqHquX5TYLx1sQ3pjxxOEVWC7Y6cDDcrCJxL9
         MEEazd7JhikXWTU4e+PceVPmUmXhSyVAdy5YXTPbKGjjMiAC2DK6z4Mv3BctBwFn4zoH
         rdzWdMXo/DFd6aY6cgcT1uMHsmnE4WqnDvdtVO4hRf1ck/tCNdBBpvB840+1NSzXKuuc
         Ibij7Pttde+nDZ3bXCml6avfYQOsyNw+HkXLgh1QrmdB730wtRQt/f4QdZ9eEYrMOhAt
         9RvHte+7WEn9avffrpg/LThc7Fk/kZr0xEqcTlz1y2a9A0PFrJV3BrHsrMq8p+lrz70+
         M2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162456; x=1785767256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rElzCHqZ9M5M53Xy+ydRNO4DA9FXxqHVU/hb2MJlhBM=;
        b=ILUavGJEGlFyKEUUZZF/8RLFuuCYwOlGzdaH/AxQrguFI3W7kCFNIZwuR5qUh8evax
         BSz2B/rUtKT7++FTEOCuTWys2V7xtFvoZQP7D4UaUJopk18bt2GS6/TJfW/OA23OY1gU
         A60WLH/JjjbfbGZ0MQue2XLJd+m+85qoizXD6sluPb2YtiJFtI+W9DVpGhzNKsI/FppY
         g8wT7CldiDZaQX79ifMyovPOw3zqTG4jVohXgo8HQGD0hNj9clNLAzwwwtEhvk9pEhL3
         ezbNi3KK7NOx2G3q90z+eNt//BZXW26PfxMXdAxNQy9vu+rAAGmD2XIucrA09NQZsOpv
         e8Kg==
X-Forwarded-Encrypted: i=1; AHgh+RrEGynL6V4Mg6YqzZJodj6N6C72XTjh8uwC5o3CVRyotPQmV3gQgBDEtr8Xg7upkTTIR0zT27dY9Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YztNCfr7oxfz/OKmz7Pk1vWN/Ui0Ibpll9iDzw8VhRbIM2NYdHB
	t7VzEEGGGVJIeomPJZUUxu7HrM/5BVUmpf/kKWoutKql4ZV08UuLwWVHkZdNta19PQ==
X-Gm-Gg: AR+sD1031ocvKaSBImg9vj1X/kI0hKOMqUAoqam1rDjnwYCecjtkkpcM+vdRF6p24tu
	8cNbSRY5BZz8cjY5c6D1pOQpUmd4LJC1AnDEGBQULCK4yRZ7aMVTm2k7AaGm3yoy0WQocVgM9pZ
	txGmF7/vKFY83GrOs83W+AWt6AQguuB+DQs0gd+wvw662aqNzUvrUBVVTXVN469iaoRxd5QXJVk
	8GlZQpdOU7jA4HlgN1w8/g2y8RbD+7TlKWc7CDOCwB5BPAbgvAIFYAXkf+n7w9s5isWHH3trzyg
	1THlFIcFkon5IeTCpkd7ovWlsM/Z9AyiG3M2YAA9Ak/ENO7z+VDYBUdbZ7UvVNFE57EPbqclCY1
	HPUY6z0hDourl1h6EuZyIT7TVaaZbatzRoa7hwF4/Z4q3g5zH9wPu1giUjx5j4fw165S+NDNnRk
	a5qZfTXUR7ZXJBfRdUmBUg
X-Received: by 2002:a05:620a:25ca:b0:92e:f2cf:56f9 with SMTP id af79cd13be357-932deeefeeemr879002485a.9.1785162456436;
        Mon, 27 Jul 2026 07:27:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de53febasm624218485a.14.2026.07.27.07.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:27:35 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:27:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	edwin_rong <edwin_rong@realsil.com.cn>,
	Ijae Kim <ae878000@gmail.com>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: storage: realtek_cr: fix use-after-free on
 disconnect
Message-ID: <9261901f-3397-4403-b6b9-e8652ceba65a@rowland.harvard.edu>
References: <20260727123414.44700-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727123414.44700-1-mhun512@gmail.com>

On Mon, Jul 27, 2026 at 09:34:14PM +0900, Myeonghun Pak wrote:
> realtek_cr_destructor() calls timer_delete() before the chip containing
> the timer is freed. The timer callback may still be running and can
> rearm itself, resulting in a use-after-free.
> 
> Use timer_shutdown_sync() to wait for the callback and prevent further
> rearming. Do this unconditionally because ss_en may be changed after
> the timer is armed.
> 
> Move timer_setup() into init_realtek_cr() so the timer is initialized
> before any failure path can invoke the destructor.
> 
> Found by static analysis.
> 
> Fixes: e931830bb877 ("Realtek cr: Add autosuspend function.")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---

This is fine as far as it goes, but the real question is why realtek_cr 
uses this elaborate suspend machinery instead of just relying on normal 
runtime PM.

This material was added in commit e931830bb877e2aa ("Realtek cr: Add 
autosuspend function.") with no explanation about why it was so 
complicated.  Can anyone say why all this complication shouldn't be 
removed?

Alan Stern

>  drivers/usb/storage/realtek_cr.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
> index af038b897c6b..c4b28744693b 100644
> --- a/drivers/usb/storage/realtek_cr.c
> +++ b/drivers/usb/storage/realtek_cr.c
> @@ -916,7 +916,6 @@ static int realtek_cr_autosuspend_setup(struct us_data *us)
>  	us->proto_handler = rts51x_invoke_transport;
>  
>  	chip->timer_expires = 0;
> -	timer_setup(&chip->rts51x_suspend_timer, rts51x_suspend_timer_fn, 0);
>  	fw5895_init(us);
>  
>  	/* enable autosuspend function of the usb device */
> @@ -934,10 +933,7 @@ static void realtek_cr_destructor(void *extra)
>  		return;
>  
>  #ifdef CONFIG_REALTEK_AUTOPM
> -	if (ss_en) {
> -		timer_delete(&chip->rts51x_suspend_timer);
> -		chip->timer_expires = 0;
> -	}
> +	timer_shutdown_sync(&chip->rts51x_suspend_timer);
>  #endif
>  	kfree(chip->status);
>  }
> @@ -982,6 +978,9 @@ static int init_realtek_cr(struct us_data *us)
>  
>  	us->extra = chip;
>  	us->extra_destructor = realtek_cr_destructor;
> +#ifdef CONFIG_REALTEK_AUTOPM
> +	timer_setup(&chip->rts51x_suspend_timer, rts51x_suspend_timer_fn, 0);
> +#endif
>  	us->max_lun = chip->max_lun = rts51x_get_max_lun(us);
>  	chip->us = us;
>  
> -- 
> 2.47.1
> 
