Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE347278C
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835437; cv=none; b=LuiBFmokwloWL6exKHSDsaJ18qVrOlfCtrUbQFyUwFpW/T4LagUHBYyMpObT4trr1b/nvNCF7u1OyaaSHSLf6qH1Wxgb0ta1/zTJQSS69ARJV081tQLtmGPSm01MXZBsE+G+1CAy5rLt/6v/F+P7GkarB5+L52HWmrtt+AYFE00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835437; c=relaxed/simple;
	bh=nk7aB4VSCqB70Ii0XyAhmoZgos4OL3BL6H2UGERSHbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNd6GZrbUQaNFDG42YAe8NkPr8LPR+HeeRCEPxsM/fDGLMvEBOgW6jjBDz2Fd8C7eXJFsGhHTCuzWK429onL9z9lMLdfMBUQHEOwl32d26z9H/1gFeHVheJJ1PATLPxZkSDJ1v1WfVbyEzvIw+ggVfcH2JtCliDl551LmUOAmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SiV+PhGY; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SiV+PhGY"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so33996396d6.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782835431; x=1783440231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7epFnLjvPec3b1jHkzlheknH4OwwUcUE0lsvvL6dYlY=;
        b=SiV+PhGYm5y4B2BM834L4D2iUfxO0IAAral04yfkRGtyWzNUHIAJ1l+ubOhv+MNvFk
         JeToYmQY+TWmW90KvCeUVff4Yg6+sPZxqqXhrJ7a7e+UfceNfM8k8QH6mN8hLtsSEoeX
         dV/u/tZkrAR8bPaC10mjBx2eOy8IkPO1XNVugq0H0dHvYiZ98DOXVPgwuTerwV8j1+3V
         +/01+VtyuTfVivKdnVbiprlGred76AOoWksUN0vwCKm9f6UfEIEHWMG+EvBfdutDPaE7
         GxpxYrPrcn++1JiK1EJ8iKY/mGTOy9vLi5nEyua+315qVZKxqMgZKJaCPhwrYW0ytZx7
         fIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835431; x=1783440231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7epFnLjvPec3b1jHkzlheknH4OwwUcUE0lsvvL6dYlY=;
        b=WIpYUEULxPJCi0WOu2vdRCWxkOlUEqFNKod1tphKFT5V45A+ld6G0tCY51pKgCXZXb
         h+9iCUKwIQplVzYhl+0MI8MYOMbeQ4i/NEt4JUrkQmRp/p3Xh6tLIjVrBZnMqOxu2iLt
         Q5Gy06nTsRd2dsu5ZApa2nAsGaYGfUx+vrsWwHfq7oJu8qu2pICQqbIj1Xy4ABZhXWaa
         NpKMJIP8vw87ZVMNJsuc02wDIrZUEClAKgB5e5TFvoSj86aJfUbo4KNvdfTRduMBS5I9
         RVm7GfcK/QpI9bC34TIZFRYm4Khef/skIbiAdBWRlwZoob0IrUjWoQbFrpXnKNEul0Wn
         Mgqw==
X-Forwarded-Encrypted: i=1; AFNElJ+P1OIDEEP6uiwih8dYmSXoxX/u8XpkRAU5JnVISC9t4fji4JnDLA0dAqsYyR1PjIgczjrzqwttqZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2h3QkkGbVxswfVOPf1PsM4xvvrmnSNgGc73a4DejeDQaT9HMq
	T57vsDDuGKi7nbuhDOkp1cMHz09RSDrWppELuqoFAqwMCmTOZBFyukSMpYLIdL0IzA==
X-Gm-Gg: AfdE7cn/RrB4iwdaVx9E0yKY7Kt9te8rXFeYP2RKh072yVKwjgJNR8i02dIJZTVn9nh
	gJtZDcuGvqcDpkFN/99XQ2VY6ggFUQSGbjd8xOXEULj3jhboIRztMzX2RcyaioamD4Q0Yi6TPZu
	TdzxnDVj80+iKrYRGxPSjjG5OSu/XvvAUzvyc8rIkTdahOduIFTsbDwSYFdWXTLzElMHM47xehW
	4Ij72tMjmKnxyx5F5/fXpJlJ9tqtvX31JLl+CVA/klRvJiZTkSFdtSlw+H2zdC7onqMJ/AbJ1z2
	3dV6UScgMCWV1zo/50wznYm9tQICY2FIPogY1h1wwRnkoR+VOWwFz3PpO55+4+wpXi51nNTL0ro
	Ktl+t9mBXQwPq82ysnmoPdKTMxNgcuD736V3Ny1aUydf8VoPYigeU3NRaxhgBI9xP0I+UHFWOr2
	x81WMV/fQ4I047n8hS1st7Z7Qc
X-Received: by 2002:a05:620a:c55:b0:92d:6961:9519 with SMTP id af79cd13be357-92e6249fe27mr694745885a.8.1782835431154;
        Tue, 30 Jun 2026 09:03:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e622e87a7sm281331385a.28.2026.06.30.09.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:03:50 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:03:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: core: devices: use kmalloc() to allocate dump
 buffer
Message-ID: <fb38dac8-7832-49df-a4d7-5488f210f83d@rowland.harvard.edu>
References: <20260630-b4-usb-v1-0-8d547235c374@kernel.org>
 <20260630-b4-usb-v1-2-8d547235c374@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-b4-usb-v1-2-8d547235c374@kernel.org>

On Tue, Jun 30, 2026 at 01:27:09PM +0300, Mike Rapoport (Microsoft) wrote:
> usb_device_dump() allocates a buffer for formatting
> /proc/bus/usb/devices output text.

You mean /sys/kernel/debug/usb/devices.  There is no /proc/bus/usb/ 
directory.

Aside from that mistake:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> 
> This buffer can be allocated with kmalloc() as there's nothing special
> about it to go directly to the page allocator.
> 
> kmalloc() provides a better API that does not require ugly casts and
> kfree() does not need to know the size of the freed object.
> 
> Performance difference between kmalloc() and __get_free_pages() is not
> measurable as both allocators take an object/page from a per-CPU list for
> fast path allocations.
> 
> For the slow path the performance is anyway determined by the amount of
> reclaim involved rather than by what allocator is used.
> 
> Replace use of __get_free_pages() with kmalloc() and free_pages() with
> kfree().
> 
> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  drivers/usb/core/devices.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/devices.c b/drivers/usb/core/devices.c
> index a247da73f34d..6f0354aba38b 100644
> --- a/drivers/usb/core/devices.c
> +++ b/drivers/usb/core/devices.c
> @@ -37,6 +37,7 @@
>   */
>  
>  #include <linux/fs.h>
> +#include <linux/slab.h>
>  #include <linux/mm.h>
>  #include <linux/gfp.h>
>  #include <linux/usb.h>
> @@ -408,7 +409,7 @@ static ssize_t usb_device_dump(char __user **buffer, size_t *nbytes,
>  		return 0;
>  	/* allocate 2^1 pages = 8K (on i386);
>  	 * should be more than enough for one device */
> -	pages_start = (char *)__get_free_pages(GFP_NOIO, 1);
> +	pages_start = kmalloc(PAGE_SIZE << 1, GFP_NOIO);
>  	if (!pages_start)
>  		return -ENOMEM;
>  
> @@ -479,7 +480,7 @@ static ssize_t usb_device_dump(char __user **buffer, size_t *nbytes,
>  		if (length > *nbytes)
>  			length = *nbytes;
>  		if (copy_to_user(*buffer, pages_start + *skip_bytes, length)) {
> -			free_pages((unsigned long)pages_start, 1);
> +			kfree(pages_start);
>  			return -EFAULT;
>  		}
>  		*nbytes -= length;
> @@ -490,7 +491,7 @@ static ssize_t usb_device_dump(char __user **buffer, size_t *nbytes,
>  	} else
>  		*skip_bytes -= length;
>  
> -	free_pages((unsigned long)pages_start, 1);
> +	kfree(pages_start);
>  
>  	/* Now look at all of this device's children. */
>  	usb_hub_for_each_child(usbdev, chix, childdev) {
> 
> -- 
> 2.53.0
> 
