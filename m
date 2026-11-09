Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240508;
	b=C2FRxD+YUlmTBaC0ICJbkROcY/HzT8wsl/iMNJ7BCm/g0eui90qqhGqEWOomEJHEr8fS
	 Y5cXm280NZAcbejgIyMUEQSaqifVoso5ZC7IhNQtGfVm3EovnGYd5UoO4pfHxLucTn0V2
	 Mv5C2hHcbTHK7NyEz5lbvQqXHORFMXZBVB3bRg2bpnYL2DX7wKuS4w+dxH//fDVujp+Vi
	 M/sVDzXDtvgWhZa+LNwvJMr76LFpYq7Fsq2QDSQN25Eu7wexQuQEK6LFrrGKvFbF+3ljb
	 ED2hruyVguiqsrg4R5fY/kMvNvp7JHY0NC/227x2tl9HC/NvcWqp8tahvivKU9ykj3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4SBBPsSc3/Ep6nC8xR1PMHfDpiIh8UItfXg1xvFovQw=;
	b=DQYNnVSu1clXkm732M/KGliqqmhvlgs9rnEiiq7aWklBopyCcef3VjmStYDujxHsaQa2
	 zbNvoq8G2X4o9RyIS7OyOhFhTbHVXSo7weDxb83NPWaGGGB/yuR1vBgSaEcnJnALA9/UG
	 k7IdcgBo0erdW4Gid/ygqlOhGZ5/nQHvAalSf+Nq4/q0hy5QKbnC7Jf7CYziEF3pY3FQt
	 uYnQkyy0jlWmDLUpBwP5294V61oRP6MWoK5OCMOCZG02PUBjKkeIujH2lYAdVKCaB3qZY
	 Yy04QJqxh1/05XFIrZ30GMxVOXesr8MhO0mCKqP2Im7Y/jihUHZCw2Qp7K/m7F3Xacg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=jJd+VzFL;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B977606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 16:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B977606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=jJd+VzFL
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f269e335eso116163885a.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794240507; x=1794845307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4SBBPsSc3/Ep6nC8xR1PMHfDpiIh8UItfXg1xvFovQw=;
        b=jJd+VzFLTL+ZpWFvm5Dym8sZpj1ikUvXlM0hb+Wyi3zxnNynzqBQeftpgrryufVtVJ
         y7chtGrXlZK2cVsDP5jFyj3gm1d5fXI8qtPPjKDodBkgyqIGTrGXm+P57mpFD0QriSYy
         iMHR26EC7QiNg1whxqC+RBFvOJ0VhK63ynrmf+ke50xcCvgvx8AqtMqf1/yLO3FNseZ5
         +fBWxztt94xZ4EToQBgtXfui+tFJ5cLhr6Z689dshtk6mC5Y5f0KqKoVwYMVnIlzQQGm
         6F+QLFbpspUK7AY/+08fIQ4H8eoW3ePVC6xrn80uov5Zai+rCx6Jp2Z4AIfh6WXDMgWz
         GiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240507; x=1794845307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SBBPsSc3/Ep6nC8xR1PMHfDpiIh8UItfXg1xvFovQw=;
        b=icGRti4JAHquouLCyiewaTRiT+G9SH3mKAwFGc+TYOLCCpV9LUiPhn1diuexTxeSZf
         WMWWzgkRDUQz9gOWwf6rjbn0BhGJamJ2Pb8Sfw/rA4TFgZHaNXLXXjU8PCJVfP11E2A1
         hwH2Dmf6Lwrx+n1YSqmJMvS2xbt/GbFrr59J6Hvu0+ZPud/0LiiZpY3Vm79JXsayWBOx
         uKySbsI1kYprpTiqPRw+CA4Jdp/vPdsA9Tml/+V9Y0TFaOS2WBdEUG5XYV8kpUQSnmqT
         tdHju1WKhx3Rwl4xnbpu502EfDxahv3s6xbV7PlljoLf4x/ULp0vOqET8RSrcYBdB1Xm
         uVxQ==
X-Forwarded-Encrypted: i=1; AL+hErFlrhfS7w1QlZvKxqGhX2j0f/PnCm0ZcOF+DZ0QqolfOxy6z3K7fQyzcWoYovXfcXluJhb+wHDzib0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MaJ9pC6T+cDh2PNc8t3SzQFmRtsonuPnSWnnXDeRys+mnxwEU
	G4bXmrUGOldQbK3vE+BXO7zcqHw+EC5gFYy/rkCf4lULNPILK4OjOwUYNTOy51qTIw==
X-Gm-Gg: AYBFou1a/3GByD+fmEwj4fPmXxKgMKLiChVwe05yQpw/DM/eINAvcrCg5OKD2DcWKsL
	PimYhR8DXtrZLxmOOuEUwRGWnZEX9v79eZyERhr9SKNCdYO8nBa3mIN3IQvIHd6foERDtQCtuoU
	X2jnCpzIGr8cZDuxFd5F7kGss03FZRZl5xil01rnL0hxZOLHglDVuIzexyAoLM0RGDMuhy7Wgbg
	/Hg4h6IAOrRbrhL8LaF04erkTkx/Y66FBl9SG7jDR2Nz4z7Hm1dToWHpM0PczD4YtkYTWZd1WiC
	Vws9F7LP1v+jxyHNQcqJgJgIZGo5HgKGa+mHGHFk+znx/CC3qznIBs4DgtsOJCm3ZA0H8+qnZLk
	O8QpYaXkW88w+9TESEJCTHe+TNStChKvYj5bVwxhA2BWwE14jreDzPKWwg6cQJEWeyJ8+7kG8cZ
	nv3fFskN4LSl0IdmbIFcdHH7FSZQwRswXzvet3ZR0r4GF+jlxuyfx7InUmzXKL1SSNgPGeAka4d
	wh/HN8URsw+LvKmtt7ReWRN3+HqsMCrmCqhfQG7Q8wMJ18m8LBZq0u2YduPf5J8TS2NkdNm11OC
	ZVrGhS8SlwDnvZjRQ28TrpvJ+Che
X-Received: by 2002:a05:620a:440f:b0:93e:d5c1:da49 with SMTP id af79cd13be357-947842cc78cmr674785385a.82.1794240506826;
        Mon, 09 Nov 2026 08:08:26 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61c333sm7310285a.3.2026.11.09.08.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:08:24 -0800 (PST)
Date: Mon, 9 Nov 2026 11:08:22 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-usb@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: usbfs: replace __get_free_page() with kmalloc()
Message-ID: <b39fd45c-657c-46dd-94e5-af7d633d297d@rowland.harvard.edu>
References: <20261108-usb-v2-1-c9209d527559@kernel.org>
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
In-Reply-To: <20261108-usb-v2-1-c9209d527559@kernel.org>

On Sun, Nov 08, 2026 at 10:39:34AM +0200, Mike Rapoport (Microsoft) wrote:
> do_proc_control() allocates a temporary buffer for the data stage of a
> control transfer issued from userspace.
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
> Replace use of __get_free_page() with kmalloc() and free_page() with
> kfree().
> 
> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
> This is essentially a resend of the "USB: usbfs: replace __get_free_page()
> with kmalloc()" patch that fell between the cracks.
> 
> Alan and Vlastimil agreed on v1 that the kmalloc() overhead does not matter
> for usbfs memory accounting:
> 
> https://lore.kernel.org/all/8cbe558e-7f53-4ce4-be8e-52fdba9105d4@rowland.harvard.edu
> ---
> v2 changes:
> * drop already merged patches
> 
> v1: https://patch.msgid.link/20260830-usb-v1-0-aa349c302246@kernel.org
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/devio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb94254809..9a7cc7cdf00be 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1190,7 +1190,7 @@ static int do_proc_control(struct usb_dev_state *ps,
>  		return ret;
>  
>  	ret = -ENOMEM;
> -	tbuf = (unsigned char *)__get_free_page(GFP_KERNEL);
> +	tbuf = kmalloc(PAGE_SIZE, GFP_KERNEL);
>  	if (!tbuf)
>  		goto done;
>  	urb = usb_alloc_urb(0, GFP_NOIO);
> @@ -1265,7 +1265,7 @@ static int do_proc_control(struct usb_dev_state *ps,
>   done:
>  	kfree(dr);
>  	usb_free_urb(urb);
> -	free_page((unsigned long) tbuf);
> +	kfree(tbuf);
>  	usbfs_decrease_memory_usage(PAGE_SIZE + sizeof(struct urb) +
>  			sizeof(struct usb_ctrlrequest));
>  	return ret;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20260829-usb-ad052ea1ffad
> 
> --
> Sincerely yours,
> Mike.
