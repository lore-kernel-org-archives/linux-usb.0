Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA033229B18;
	Fri, 10 Jul 2026 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691483; cv=none; b=runKn5hvU9fNSEBJ17gdpYVzDdf21eCWKfAq+c/kf7gCX0cGeOl1lMyZQv9Qs+pU57muZDHIlrKMWcWuInS4bM988YFxG0K66iG0vuC5oIRxPi/POKJaRJkAk/DDgU5TRW6hxg3mDjg6Cuo5CRkn7l5TXrcLPkC4a7/uBSc2uTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691483; c=relaxed/simple;
	bh=d++Xk8WXhA+q2t11ET3Q72Tk0cWXyYHuvjqZTINX+Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoHrcNq/wk+5YX2+fr5R6qIkUY6R7Y3bQelh+kmHcrPnR/hWTvMMZ2GXuPPBlGIptkQd53Xvv9LVz3ADXovCns7ijrDU8zBLRKkkTnGJrLYfDxzNB78DMOluZEOlzE6IaeYKT35O9ViaG7MYw2O9jzKkCiVnIfgU3qb+xCThigw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pUKJEMIe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pUKJEMIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E781F000E9;
	Fri, 10 Jul 2026 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783691481;
	bh=roiTUopqrJf0ApWp66KUKcQY6AsuzSVqRySXGhL2Abg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pUKJEMIe7SO/kOj1+0B5yTtauQO3zvkMy4gk5hZXKBDey9V+yV9GSwSSl1tOLPlVh
	 PwVVPlCKhieBTV/eR1YQ45AXPWCgUouHiiAF/+bU2mwVhF9JWoJqSjRm69q3GjFINJ
	 3UVWZNAfWJHs1KBtB7CLmnsTR9eSX8fpCGMnojn4=
Date: Fri, 10 Jul 2026 15:51:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Rao <raoxu@uniontech.com>
Cc: mathias.nyman@linux.intel.com, niklas.neronin@linux.intel.com,
	stern@rowland.harvard.edu, michal.pecio@gmail.com,
	ukaszb@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: sideband: fix ring sg table pages leak
Message-ID: <2026071028-sacrament-paradox-ea01@gregkh>
References: <53B0BFAB966BDF11+20260602034327.2780520-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53B0BFAB966BDF11+20260602034327.2780520-1-raoxu@uniontech.com>

On Tue, Jun 02, 2026 at 11:43:27AM +0800, Xu Rao wrote:
> xhci_ring_to_sgtable() allocates a temporary pages array and
> uses it to build the returned sg_table with
> sg_alloc_table_from_pages().
> 
> The error paths free the pages array, but the success path
> returns the sg_table without freeing it. This leaks the temporary
> array every time a sideband client gets an endpoint or event ring
> buffer.
> 
> Free the pages array after sg_alloc_table_from_pages() succeeds.
> The returned sg_table has its own scatterlist entries and does not
> depend on the temporary array after construction.
> 
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/usb/host/xhci-sideband.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index 23153e136d4b..a5deeee4d5dc 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -58,6 +58,8 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
>  	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
>  		goto err;
> 
> +	kvfree(pages);

This looks very odd, how was this tested?  If
sg_alloc_table_from_pages() succeeds, then the table has the pages in
it, you don't want to free them again, right?

And if this is such a major bug, why hasn't anyone noticed the leak yet?

thanks,

greg k-h
