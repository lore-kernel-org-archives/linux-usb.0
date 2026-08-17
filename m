Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ADA282F29
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979190; cv=none; b=klbYhJtNTXIyqgy8qI2V3FsVuWuZG/5B9Goj1AmzhV5NBZCOgHMDFBqePIXjFJzlFDzWYaidMDNWrb8KdkStmAobCeBwyDFfBR65igof9FXl6pkj2wBgZjIY2O86ZFZ1c6HVMqF99l6TENqrezkePlDwsZEwAtil460h90zY1Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979190; c=relaxed/simple;
	bh=lzswtHsrQEl+LTgnxw2mfd3OsVRpN29jkH6rNHyGzc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqILg4IO22UlfmKZDSkPdB1vBnuWZ7GxR45ar9PwzQAtF4xECIUcXVnkVeC1pbeOK9lwf6ZzL+6f3NgC5IeSrhRXBAdCSVREZjb2B2t8SQ5uXbE5pldb6Sf1BI8svLYRWkDwjH+haNjdsF9jxZHRUmned0jYsWbXfFqXVUDIt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iPuVfQPX; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iPuVfQPX"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-936ea476db3so143379985a.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786979188; x=1787583988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/V3k2+VTRCLX7oq3npgTgER/osmnRebYVR7TKEEakg=;
        b=iPuVfQPXRYPmvUNXVJr8UYu2a70PzEjXqDVPrAjPjSyCLuBRe/ouEMr7cTbNteQrew
         hTXJd0wEg3IjXqMdZ/D3zGSOgK+pl/GS6wRYZsUZIchJzmSGVwMcE3XaH3xeOXc2RBrz
         x6FlulsKJ6W7a3AUY+qqtJ63JTKbgX6Rt+RVrlZWFZ/8gH5B3J9B7EiXi1BkPdl+AA4q
         mFSVS8eVERpoObTuxiz6m8oQvGoxaPDMASOsFkE1meBNJyNnenPU7tPMMEYYlonzEp35
         0tUoBjNTyBh9/94lZVFLDKVQtT37AwoDJ8xoaPqjc1Jjx2dNgcgY2UmXupptlOZnTcQs
         JG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979188; x=1787583988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/V3k2+VTRCLX7oq3npgTgER/osmnRebYVR7TKEEakg=;
        b=GFjcmPW3QIN5RPKu9JZmNVc4NtekFzcrolhYwUAjGFi03EHbADs+LP7Jvf6UhJfTul
         GjbI2+oAjkOPLTNUh4uG6fO7JZLHIkYVYlM7oMIrSHF6EI89PmHoInyu6EU8o+pEhzWr
         epmpMSTwNXSRwZ0xpHRxhVX8rP6K2cJZhZZhyJNSNmgs6IjVGpniX2uoBUzGE34z6THk
         pw7bdi5DjFRNukmEpiNCQ9O6S84CVGivzgIj/slzIDpcwrmgng4MtG41UVLcarEXE2mU
         m136coBm/wURgqfzcjma15CUzGtCX/RLkZ2CorI0ITA3h0h0y8HgPRcLmDhP8q49l40Y
         lfNw==
X-Forwarded-Encrypted: i=1; AHgh+RrfH0ksDn+Pe4z/4bMMWpcXPlnrSqS2MeHZADQnWp8KMWZwIuSL+UI9WR+z3UpPtuksQ6ihn+lr5ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjVY6IGs1UlYf6i8XZK0HW4vsPnD49rLqgCFgPuGRHEw/60Sat
	fKS4h7upIsL5hLBjwvUSwhd/7Al53EbRV8D+VWLu0tzaX2wR6a0GjtldvssPurqzQQ==
X-Gm-Gg: AR+sD11Y+musALQoSbs0M8kDTvjaHPd7hfWZKqcMrY2uWxsHXbnCPnKLovTkup7Ia8c
	2KwvkZMCbQLlL7/7WyJhH46JU2GpWHV3Wd/Xtd52vXiZ4b2mESiKOaKtHfBQ/Y9R8QFiaoQ5DPI
	TPKfk291gI4L/pxMY8QQ9fi/xVGbGT+AIdvIWLV74ToB9S43tB+roGzmAaQos/V+K8e8/JHNQs4
	4vLKFnvTDdedVdo2xlyCX70VmoF1PtKN/YneShlnSjG1EkQTuMqs8/z5WUHaqDZRot5QYxNQAEC
	afA1GxspyBZ0ih7mY7nkpEasHg06Mugop4TJyfoJtdaHz+J3yiyzAlBZykMF5Z3OErswgyla/fJ
	0RbyRIMu/FOtQHPpez1rg1oWPVEBtjUPBsFhZ3ISGVubESvxLdRAOoqRzW6qPY01fgULPfNeVja
	lkA6AOyS8u18MbG9j/SRKEJjszsqfIdfP/hyPWP5ytl62o+w8OgC4jY0ZAKBGMl34HQjQUlHL5b
	EqoC3GujN2+5ciDghMdViUGTogRqLCe
X-Received: by 2002:a05:620a:4787:b0:936:a749:5e5f with SMTP id af79cd13be357-936d2331748mr2194911785a.24.1786979187765;
        Mon, 17 Aug 2026 08:06:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937033fb9d9sm65331385a.38.2026.08.17.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:06:27 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:06:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
	apopple@nvidia.com, byungchul@sk.com, david@kernel.org,
	gourry@gourry.net, joshua.hahnjy@gmail.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	matthew.brost@intel.com, rakie.kim@sk.com,
	syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-ID: <7deabd9c-04d5-4a45-8b8a-39929c046152@rowland.harvard.edu>
References: <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
 <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
 <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
 <EECC6FB3-7559-4D22-B9DA-33E30E5EC181@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EECC6FB3-7559-4D22-B9DA-33E30E5EC181@nvidia.com>

On Mon, Aug 17, 2026 at 10:37:29AM -0400, Zi Yan wrote:
> On 17 Aug 2026, at 10:34, Zi Yan wrote:
> > But the warning here is when kernel user wants buddy allocator to give
> > what it cannot allocate, a page order > MAX_PAGE_ORDER. The warning
> > tells that kernel user please ask for a reasonably sized memory.

That's fine, but it doesn't have to be done in a way that will crash 
many systems.

> > The issue here is that the inode.c code passes the user input len without
> > checking to page allocator code. Capping that is a minimal requirement
> > to prevent untrusted userspace input getting into trusted kernel space code
> > easily.

I disagree.  If the memory allocators are so fragile that userspace can 
break into the kernel just by asking for too much memory, the allocators 
should be fixed.

Furthermore, it's generally recognized that library routines such as 
kmalloc() should check their own inputs rather than relying on their 
callers to do this work for them.

> >>> Why are we emitting a WARN if an allocation fails, given that this will
> >>> often panic the kernel?  Should we on the core MM side dial that back
> >>> to a pr_warn() and a helpful backtrace?
> >>
> >> I think that would be a very good idea.  Only the caller knows whether
> >> an allocation failure will leave the system in an unstable state; the
> >> library routine shouldn't try to make this decision on its own.
> >
> > In this case, the WARN is emitted not because of an allocation failure,
> > but an invalid input to buddy allocator (order > MAX_PAGE_ORDER). The
> > WARN is for kernel developers, telling them their code is asking too much
> > free memory and core MM cannot handle it. Suppressing that means
> > code outside MM can abuse page allocator. Code like doing
> > alloc_pages(MAX_PAGE_ORDER + 1, __GFP_NOFAIL | __GFP_NOWARN) should not
> > exist, instead of just getting pr_warn() and failures.

Again, I disagree with some of the details of this argument in this 
context.  For instance, if all kernel developers are supposed to know 
that they shouldn't ask kmalloc() for more than MAX_PAGE_ORDER at the 
risk of provoking a WARN, if this is such an important restriction, then 
shouldn't this requirement be mentioned in the kerneldoc for kmalloc()?

Regardless, if it is important to let kernel developers know that their 
code is doing something wrong, why not make the WARN conditional on 
CONFIG_EXPERT or something similar?  In other words, prevent it from 
crashing production systems.

Alan Stern
