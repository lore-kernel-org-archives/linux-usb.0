Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABD8239E60
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913974; cv=none; b=siLE1cEZ4lL7VpTIJJVKzf03CfTvpqVSiWtRlsOCgW4g0ITwFATD+SWABwScZ+Vuhd/lbKTWss843EqfSru4VKBmK8hMbwB+pW7A8Hrl73WZhRszf1mfjB9q7zzzKsrW3E73mGZfcEHmaBjTFqX+VND01gwF4R0mtL4uHh0wpvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913974; c=relaxed/simple;
	bh=VVSXIIR3px1e2hDyjuXFnL21E3+wgrQQQJP7zM5p0Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoDdahzvFRLqGup/u30vAdoJ/zl86BSwcIMpvFVRmv5SteQ5/7589EUR20qadK9n11RY9wOgBBFacw0LAsIk3LESEPq3hJEfp8cEd4gQ93BeW4E8Nr1e8gIZU/NXWUsr3NbKN+YSxL8dS7eMoPWNTXUG1ymFs5x1u69laC787Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QD/Ot8H8; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QD/Ot8H8"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ee88fce476so6017666d6.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782913972; x=1783518772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9jTQNUhONnvzwaACiiAR+1wKZIRO/byslWAp9/FPB8=;
        b=QD/Ot8H8b+J1nzR23ZB6mSmefh/5lUC/lIMBBWF3/8OUP5cx66iqRiKbIMRDpHAxNW
         mBJJm9n77X3ulIYno/6ycLbu+2KfTg9mylwVzQ3PgXH6bYQLOr+AdjT92SSub84dsA0q
         rIDmG7+E9IaPZUlp5hHsHEWNNV8U5pKu6Iqu626bJCNhXVMw2wA2hbn8teuVKR5Xv9vz
         qlr4JMhatlQ++8H7x3S+AbzBPT3ySzkzhVsXtqknaajDx+MOWeiw5iypx8zUSCmaEflP
         RU5+3IotssNlsI+vCHiWgl9EqD9seRV6jiK6SvqEwa/Dy6Md7/Xjh15DPCuoRljEVtvM
         Dw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913972; x=1783518772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9jTQNUhONnvzwaACiiAR+1wKZIRO/byslWAp9/FPB8=;
        b=hL83/6aHwJ4XuJnRs1d7AU3pQGN2rMAG9yaKOEfl/qeiwHL0F/+k+uf5sk3Ruunfqd
         vgl2xauYzsFfACQ6X8qIaB6iEYPNuCpyT/KPHkycc5rlrYC52nr0sDwRgDpL20Aaotbv
         8voJMrVa66rKYvLmz8+t7qW6+BTfmNPAp0QdIT0jtxAOH0VMXdP/MZLX0iw2i5FS4rMX
         xI83umQ3y22h3ms1CQW4E+9kGGEItwYEDjZufWKtpBoPVkMKCsBEe3JHaQLEhlQONX+L
         ClC62SkNyJn5o1JaSlXTvndldiXWjcOZHmnnBcfeQSvZGkwUogMjEP82f91mX5PJzWB4
         Q+Eg==
X-Forwarded-Encrypted: i=1; AHgh+RpghGAtE4pOm+taEiulIpl2YuO1E9yA2KhnPZW6q+3oK/p3in8OdN9v4/JRAIhoJd7kToSfxaX27N4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VJmdc650i7H4Mvzo8oSDzlVFV3WzWVUnLZk2pEiVddSYUS3a
	Og6YdsR18VPOBerTua+2JrMr+LSk8OBbwXO/NBdsaLmOCO4iMEdMmH0AwvqztpSMKQ==
X-Gm-Gg: AfdE7cn1KcWmFumZUyf6IlxRZD2vGbg+TpNiYVN9pV4ANe6YC+ZS8CxS9p/O4d2TOWJ
	70j6/tfDkek3gknc1RWqymKePxLDVnSWoZ18EeFZoCZaG7CwWLr0qFca2PtPhOnQC8tbnjq+v8D
	kxlJ8GSGA+66Ff6Q+ak/8/sGpi1tLCtCSkQsEvRh+8QuE2yl9BPOrpFEkiFugvm5dDC8XRw2y44
	R5fDn5/RMCGdZ9sPG6ANL5muRmmR7Zg5c6LHzfQ6w/A5BVkxz3Xad+ybjqp8MGVDTyrXixt52dI
	xp1lfK4ZA/5iP8I7upyxZoQkvLm50Cfl/LhaKGBw3iW/GAxW3Ayv9nLXttWdUqJAZ9DykTy+oYQ
	dKNXNha1pTtdITYBFbldUulTy4oWdBrlkxhCgyEpjLOgTsVfSopfuHa3QdoSjyBXgTt7U19PAJi
	VmazZv2a10npInnCCaSqlvkQ0fF+xHZH8=
X-Received: by 2002:a05:6214:18f:b0:8f1:8737:d794 with SMTP id 6a1803df08f44-8f3c6dc8a06mr15433756d6.16.1782913965137;
        Wed, 01 Jul 2026 06:52:45 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f35e88a4bfsm22400436d6.8.2026.07.01.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:52:44 -0700 (PDT)
Date: Wed, 1 Jul 2026 09:52:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: host: ohci-dbg: use kmalloc() for print
 buffer
Message-ID: <4aa114fd-ec0e-4e7c-ab9c-6e9a327b3cfa@rowland.harvard.edu>
References: <20260701-b4-usb-v2-0-272807df4b64@kernel.org>
 <20260701-b4-usb-v2-1-272807df4b64@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-b4-usb-v2-1-272807df4b64@kernel.org>

On Wed, Jul 01, 2026 at 12:41:50PM +0300, Mike Rapoport (Microsoft) wrote:
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
> While on it, drop the NULL checks in debug_close(). buf is never NULL
> here because all the open handlers return -ENOMEM when alloc_buffer()
> fails, and kfree() can handle a NULL buf->page.
> 
> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Incidentally, I filtered it out of my reply this time, but on this and 
previous submissions you have a CC: entry that says <rpppt@kernel.org>, 
which is an invalid address (three 'p's instead of two).  Is there a 
typo in one of your scripts or settings?  It's a little surprising that 
you aren't constantly getting email error messages every time you send 
something out.

Alan Stern

>  drivers/usb/host/ohci-dbg.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-dbg.c b/drivers/usb/host/ohci-dbg.c
> index 9e0e06bbc570..23dc9eddc06c 100644
> --- a/drivers/usb/host/ohci-dbg.c
> +++ b/drivers/usb/host/ohci-dbg.c
> @@ -683,7 +683,7 @@ static int fill_buffer(struct debug_buffer *buf)
>  	int ret;
>  
>  	if (!buf->page)
> -		buf->page = (char *)get_zeroed_page(GFP_KERNEL);
> +		buf->page = kzalloc(PAGE_SIZE, GFP_KERNEL);
>  
>  	if (!buf->page) {
>  		ret = -ENOMEM;
> @@ -729,11 +729,8 @@ static int debug_close(struct inode *inode, struct file *file)
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
> 
> -- 
> 2.53.0
> 
