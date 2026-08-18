Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABA342CB0
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787021977; cv=none; b=uZpg0yDh7D39dz3O2bO5nUi9UNGq5e/sVK9L6FwvAVyhW0x76r88RF25VQ4jcmnjxfGTzWjnUuYA8Nbh7b52r/uIPQkiZkQsTvE1sQeD+qqLG2cUkIIOMGwIFBD5z2EjorozkMIsg4GuRDVcQowzPMrownhWKCwpWEMIyMAkIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787021977; c=relaxed/simple;
	bh=OFzNqmcZS4R4FV+pXkH5Cb8qCpxPZIA03eLKeqvWgUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDY+DgS99GlkD3ePocYJcv6WGG3GCJpQgH362X7VrLhvzCqdYdsX48YshcljOKBfn/iFbqz9cPOAlf8x6uCoHlYxtLIfjYZsXSv6fqRe2ApuEnMCz9D9GQaVno/hGxKktKz+rrxlgdc+wLQAHFt2rresvkf6iVhBuK8QOatlILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=W5oOFXVs; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="W5oOFXVs"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e6c4a867cso257338985a.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 19:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787021975; x=1787626775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpYS9nogSeC5YAWQyKVXdj3E5kPL+kfXuGGttfptnTE=;
        b=W5oOFXVsl7RcB+qjH5+yaIBHNytAtANpHR2EiiPMPx1/ozgVUp/6Tz7pHwLilL9e4i
         fFe3GNvOAORnsyR7KUwROC8gFfV8ohdmyeg0mGclcYvyYCaHdhzb9gA9kVtGayI5OB0S
         pfHqI6GCdyKScP48gx8Nb2IskCl+sfvC/q0QKtZZl07w4CL/tZ+8OKgEDnjpZpK33slo
         976/chq8IwHEKAhSq8zNq5xUxlfawtjQv9SlyVQuE2kYJuz6hSDb82TeTtAh4hniIjXP
         jmLQvC0xjtriMJWiE7k9P2dCOQw0X1cc8BzC+cq/x2G3yJ/grv0fD/szGpw6qGvAcyyG
         MiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021975; x=1787626775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpYS9nogSeC5YAWQyKVXdj3E5kPL+kfXuGGttfptnTE=;
        b=RO5/BSTghr8ZZV4YBbi906SDLaKhtNb3jWVrqsoRVRCEtAdTeKLNOXfqLQaaGXKckN
         5f+gn6BCKoiLvfzh8eWpuX26IuyCaQZIhECymtQXYwXGhONXyaGq/rrZh4CTqfZFIdH4
         cW1ZgWi7mCh5sGr8DhU5mReyhjSUou+A6Od8GpH/0424IMprMk0h7ayjn05JFiZ5vPiI
         93iohwcg89vZLVBWxYWtWUmygTR02hqibwT1OeoFSMlPh9g68f8P+eyDeTcq065tr/4M
         M60ISIl4LsWHJFaacp+4FALNlJWueWytskDBYylZbfC+cjBR/iQrWmMD09J3v8egbQan
         WsOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmvdKoK4CWlepJOHZKQXoIm9B6QyQBEOFD0njoEyND2pVHaVqAvjHHZWjNbUExCmEEckiOQY2/n7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMttYhscFWFxrtEqNGxPjeMpgNtn3Z9Co5GOkt+FCCKFS+1Vvw
	PYOkFRFVZa9/lCuokbv9t/J0PgWjQu5D/YQz+MGx/32LMQPyQjxDdi69oWOpYFZ0Gg==
X-Gm-Gg: AR+sD12tSZkrY7Vzk4aOtWSKvnE51V+z7PvdncQtqBSGfazgCadW5Aybp+8U0cKsiN4
	MZSNyNT0fGz+69VC3Go/gn3ooRj3fyza6oyTZqwXb80iEeKpTk+YUwIyXHkSuJmEQum0rdWWZcs
	/U8/huWusoK/amrU1k1whnW5EtMtvt2YxRykMlppMS4VRXiynAZiO8rV5UroYPQjPhryNjszqM6
	xiNifWvtD8kFeZclI3AyV7td47iyC/a6MydMYOeYGag6Ui4A5Uud1dOTf1IUsSVjmpVJ+Sokf7B
	k8seaUXq/vf/XsgO4gucHTdyUqHZ4SQIYBoZcGG55mU3CPcIIttRklqiqRvz0v3ld+uuY/9Vsad
	9HQsqxOjIiI9MohDLQ4FUP3/qzYW/sIGQmw7vr0M/ze8Dh2dKp2BwLU25a1bCg44A/zWVWV+H+g
	U5wpGJ5l+avXS8Qwq7amx4oUSCFQyBzol5uDCVKSxpjATKOlwnEgb34n9Nqe9LTg==
X-Received: by 2002:a05:620a:2683:b0:915:83fa:b3e0 with SMTP id af79cd13be357-936d1fdb95bmr2738326885a.5.1787021974874;
        Mon, 17 Aug 2026 19:59:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937033ceb9bsm191865685a.23.2026.08.17.19.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:59:34 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:59:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzbot+805630f1453e490427fa@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/slab: reject unsupported kmalloc sizes
Message-ID: <3ec57a22-3096-418f-b10f-b0993a352007@rowland.harvard.edu>
References: <20260817-limit_kmalloc_size-v1-1-5bef487701cc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-limit_kmalloc_size-v1-1-5bef487701cc@nvidia.com>

On Mon, Aug 17, 2026 at 04:40:18PM -0400, Zi Yan wrote:
> kmalloc is used to allocate physically contiguous memory for kernel
> allocations. For requests larger than KMALLOC_MAX_CACHE_SIZE, kmalloc uses
> the page allocator and can only support up to KMALLOC_MAX_SIZE. For request
> sizes bigger than KMALLOC_MAX_SIZE, the page allocator can emit a WARN
> because kmalloc allocates an order greater than MAX_PAGE_ORDER. Systems
> with panic_on_warn=1 crash because of this WARN. Fix it by rejecting any
> kmalloc size bigger than KMALLOC_MAX_SIZE.
> 
> Fixes: aadb4bc4a1f9 ("SLUB: direct pass through of page size or higher kmalloc requests")
> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com/
> Tested-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Cc: stable@vger.kernel.org
> ---
> It fixes a page allocator warning (order > MAX_PAGE_ORDER) when gadgetfs
> requests excessively large memory from kmalloc. Instead of adding
> __GFP_NOWARN to suppress the warning, as was done for usbfs[1], change
> kmalloc to return NULL without a warning for this specific issue.
> 
> [1] commit 4f2629ea67e72 ("USB: usbfs: Don't WARN about excessively large memory allocations")

Thanks for doing this.  If you like, I can write a follow-up patch to 
remove the __GFP_NOWARN added in 4f2629ea67e72, now that it isn't needed 
any more.

Alan Stern
