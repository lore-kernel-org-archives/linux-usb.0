Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744D33F5A2
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835021; cv=none; b=TM9RAkSx2X0L0I7ufocte9zkszaZP2GfxYX3elM2WI9cn9dK37ufcKmee1cohiA2vlY92BnnCa9f2/1a4mE3145QrjLglUbaNA2HJJcGSM3PlR939pRh1r0Lz5HyVyfUIwRykBf+wCFc0alLIQvxsmkBXlo782npxJs3fk2aXbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835021; c=relaxed/simple;
	bh=vDxXNdeCyxRW9RH1kxdz8EefcvkrP/3R35t+X6au1+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKGjM+ne8AzfQFEUT3GIXcEOU/QQstraVS51JDdrcYUiGKawsYglYiQxdgvU+bihcL3tCz6B03vXq1MOOG847yrVw2sktr7ExIk4u0wWUz57j+fYJ1pPeMhJYrOHg9ssRUMCf2+sZsqzhaIqvCaVhzPgoemhLtDQUfy4qBInZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=G7hSxSdo; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="G7hSxSdo"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ee88fce572so32092286d6.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782835017; x=1783439817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ag7vyYZ1qPpEzK4WsJQkIt1kiT2/2vAc0yWyVzCS7E=;
        b=G7hSxSdo1J0wKODWbB+Ae7aKbgSwfAMjVHsboRRoG++vkA+JlhSXG8TmmM7NgV7oYX
         LPfu3A21FLhPveGS+dGkg4f3R7IUUd9w03ohrURpH1NNoET2vQaWtqlEHIsVmHH9+Se0
         v+4QdNOCXM0X0iMjpSTlrvgty/JD8BquLn7U+ZvDRFprXxT9MPeTksQdra6kRQFoXYDM
         wqpWuuARMHXyrNI9uJzWnbde8REXcPtS6OE1vYuAo3YdIcvFNtkCMFYyw0HsepsMVsdy
         j63lokya5OWbweOvpTKJUmr2aE+DmRtiQhnRG9GXtQZMS3Dx72CD0pl7lXwEjb/5LLim
         1HwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835017; x=1783439817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ag7vyYZ1qPpEzK4WsJQkIt1kiT2/2vAc0yWyVzCS7E=;
        b=A2KMYXhTrxzEvKDAFWw3h3DaBEyKJUjpQ1Uzk/xeOuMU7WpX1GlEcb7Dp7LL2tXtW+
         UftB8jSjR5SCIZSRbTk3XoVVPeVrF6V0vsZtO1JhyrDWSB9fTTALgO8eUXnIG0hRASe5
         s2LtQV/HRw3LKzcQP+Tb/LLV+PP+hpRfDTPPATGrI0KOujXaiQOKxVhDFieUcT8+bnud
         81Z/70L+by+ibvgTN1Ns5Z1OoF0iTGU+ooCoqPyAXvgYysX9Z+vhUu01s1R/5MG2qxaI
         yD+L23339PuV7xX8Hni9H3YEnT8C8RchgUwnvYO2fohCHuLeEghGlbuC+3t6LGcQIOVk
         7yIg==
X-Forwarded-Encrypted: i=1; AFNElJ/+StizkQnVRyZ0Yz2mM9NhuQe720vEhPRHbWPvqXsRgi9Rr4EqR7gSv2Wt1U0e3pnAaebSoZVyOPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXyWMolWFQ5C8WCsUYMQhIfnBoV0OkozIOCFU7AF72dpzO9F6
	GjMBPgo4ucxRkORYArgbIjcRsGUU4J5GM+HG25LN3tsfgIAUSxr4Kzpk9tPJZ+EVMw==
X-Gm-Gg: AfdE7clJjbDgL3id/dphGZYb3mOYEdq4WmJLyrvXWT8kjK3e4/y82HUKmNLrXqSJIxK
	jxKe1+/F23wtJfeHjShSqTjL6HBJ3GTXkXJgi/cUhc0nnHRgS+uk7+Fu+I5m+vCSjYKnFUUkM9l
	kCly84sCooAYIf+6ZqfGhCCJKnXtGHh7JUroQ+TPQpNpn8en4hp96WUoexZzqnZ74vyFs7Gt0sg
	lCJHbnq2FHXGCjXOI4hjcw1ItSoxf59VAg4PDIyNHu/L/oSf6BVbaG1lurnL9kBpbpZPEZKaRZj
	LHgQGqV1cic3koURuVKmKjsqrhRaFVOxooEJDiWdbZ+Ujbu9E/KSLtMU+j5Ar65zqv2ITNDp9hM
	NaRiePhn0XlqGA+0HV00kO3sNR3YjEeXkpE3xufHPwKgCD5YbGyB8E4IOj3V0CcKcQVQ4Jg0FQ6
	IULc5ckR/q20BSzA==
X-Received: by 2002:a05:620a:4546:b0:92d:44b:db99 with SMTP id af79cd13be357-92e624e78d8mr671180985a.20.1782835017027;
        Tue, 30 Jun 2026 08:56:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62371ba1sm271366685a.42.2026.06.30.08.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:56:56 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:56:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: host: ohci-dbg: use kmalloc() for print buffer
Message-ID: <dfff8910-c325-4b48-bb40-eb8852b115c5@rowland.harvard.edu>
References: <20260630-b4-usb-v1-0-8d547235c374@kernel.org>
 <20260630-b4-usb-v1-1-8d547235c374@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-b4-usb-v1-1-8d547235c374@kernel.org>

On Tue, Jun 30, 2026 at 01:27:08PM +0300, Mike Rapoport (Microsoft) wrote:
> ochi-dbg allocates buffers for formatting of various dump outputs.
> 
> These buffers can be allocated with kmalloc() as there's nothing special
> about them to go directly to the page allocator.
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
> Replace use of get_zeroed_page() with kzalloc() and free_page() with
> kfree().
> 
> While on it, make kfree() calls unconditional since kfree() can be passed a
> NULL pointer.

That is not a good way of describing the last change.  The 
"kfree(buf->page)" call may indeed pass a NULL pointer, but the fact 
that it doesn't dereference a NULL pointer (i.e., buf) is not obvious.

> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  drivers/usb/host/ohci-dbg.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-dbg.c b/drivers/usb/host/ohci-dbg.c
> index 9e0e06bbc570..0a648a7d9136 100644
> --- a/drivers/usb/host/ohci-dbg.c
> +++ b/drivers/usb/host/ohci-dbg.c
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-1.0+
> +#include <linux/slab.h>

Thanks to the odd way in which ohci-hcd is built, this line is 
completely unnecessary.  It should not be part of the patch.

Alan Stern

>  /*
>   * OHCI HCD (Host Controller Driver) for USB.
>   *
> @@ -683,7 +684,7 @@ static int fill_buffer(struct debug_buffer *buf)
>  	int ret;
>  
>  	if (!buf->page)
> -		buf->page = (char *)get_zeroed_page(GFP_KERNEL);
> +		buf->page = kzalloc(PAGE_SIZE, GFP_KERNEL);
>  
>  	if (!buf->page) {
>  		ret = -ENOMEM;
> @@ -729,11 +730,8 @@ static int debug_close(struct inode *inode, struct file *file)
>  {
>  	struct debug_buffer *buf = file->private_data;
>  
> -	if (buf) {
> -		if (buf->page)
> -			free_page((unsigned long)buf->page);
> -		kfree(buf);
> -	}
> +	kfree(buf->page);
> +	kfree(buf);
>  
>  	return 0;
>  }
> @@ -782,4 +780,3 @@ static inline void remove_debug_files (struct ohci_hcd *ohci)
>  }
>  
>  /*-------------------------------------------------------------------------*/
> -
> 
> -- 
> 2.53.0
> 
