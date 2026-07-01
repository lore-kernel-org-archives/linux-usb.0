Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C64259CB9;
	Wed,  1 Jul 2026 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914538; cv=none; b=d55TXbmfJ/CotEL1p9g9ATWrF/ws53CS9Yf9LMVrZR8pJDGxn09k5wQYT0gxVk5Os0Ixrrg4dS2bZOf0Rlpke7BQ6RFe4kYW2zQTH3Fxh7eN3CDVQidkge6Aa1lgsWMSwK+TabY87JcJPZ1xvy/lNuLmjNTTfMyn0azA7Dx3R/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914538; c=relaxed/simple;
	bh=rLo0+MKCDUhQ2o4gkwhZuCCiZwUvHscqYcYzj971p1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m81s8Y2cZJe/N5D3X+jXWR22XnOTQyi8twuHku7LLHa85s405V7C8x9UCs7DXhqqoUldxMSq5GiBq2i/hBIgTbW4ed5Fxj3FCemI59mOHlgB6WsL95LTkHa9eRcRwnXP3APX4E5o0OBCeUgw7Q4apv50oZ9pZgkQJpb51RdyCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nA9q2MeL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nA9q2MeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6501F000E9;
	Wed,  1 Jul 2026 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782914537;
	bh=Vw8z2xa2mqlN/ZTtjrIIu9+BWOTzccAJAjLflenxRAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nA9q2MeL81TpY1Do1QuHzuT24eLoF/C9BZJX7H9oKfTCGIib2/EvSpqgfozqGo2rs
	 twteLmAueEnOz/AMWSiUKUGT+sm07AbmEqtxnVXv0TURtdMILOsKh9PZeo6amDoptZ
	 QMZicEqi/bi9I0JWPqGrMVAMvAuXHubvIlSt0HSd5tRLfCACpolJuNHCJgkv/QaALa
	 SLd53Egpz5oUivT0/Z8ZD36zPbMv/wbN12rVUx26r+AIgbcRQ++QpedYDNfeFnb4QK
	 Yaa15oKL2OlkOnibPKLgikr3AZaj4JUi9ELNReTAN0spczf0xN3QLf+jqjCsnbFgkc
	 0l4GL87h8zfkw==
Date: Wed, 1 Jul 2026 17:02:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: host: ohci-dbg: use kmalloc() for print
 buffer
Message-ID: <akUd4xYXowxLEd5s@kernel.org>
References: <20260701-b4-usb-v2-0-272807df4b64@kernel.org>
 <20260701-b4-usb-v2-1-272807df4b64@kernel.org>
 <4aa114fd-ec0e-4e7c-ab9c-6e9a327b3cfa@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aa114fd-ec0e-4e7c-ab9c-6e9a327b3cfa@rowland.harvard.edu>

On Wed, Jul 01, 2026 at 09:52:42AM -0400, Alan Stern wrote:
> On Wed, Jul 01, 2026 at 12:41:50PM +0300, Mike Rapoport (Microsoft) wrote:
> > ochi-dbg allocates buffers for formatting of various dump outputs.
> > 
> > These buffers can be allocated with kmalloc() as there's nothing special
> > about them to go directly to the page allocator.
> > 
> > kmalloc() provides a better API that does not require ugly casts and
> > kfree() does not need to know the size of the freed object.
> > 
> > Performance difference between kmalloc() and __get_free_pages() is not
> > measurable as both allocators take an object/page from a per-CPU list for
> > fast path allocations.
> > 
> > For the slow path the performance is anyway determined by the amount of
> > reclaim involved rather than by what allocator is used.
> > 
> > Replace use of get_zeroed_page() with kzalloc() and free_page() with
> > kfree().
> > 
> > While on it, drop the NULL checks in debug_close(). buf is never NULL
> > here because all the open handlers return -ENOMEM when alloc_buffer()
> > fails, and kfree() can handle a NULL buf->page.
> > 
> > Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> 
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Thanks!
 
> Incidentally, I filtered it out of my reply this time, but on this and 
> previous submissions you have a CC: entry that says <rpppt@kernel.org>, 
> which is an invalid address (three 'p's instead of two).  Is there a 
> typo in one of your scripts or settings?  It's a little surprising that 
> you aren't constantly getting email error messages every time you send 
> something out.

I'm gradually switching to b4 send and this looks like off-by-one in my
manual editing of the addresses.
 
> Alan Stern

-- 
Sincerely yours,
Mike.
