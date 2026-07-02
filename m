Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2692D63E5;
	Thu,  2 Jul 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981846; cv=none; b=QJdTmkyKq3oVBv2oTjIPIrQa20Fii1a0WHLVBTWFB49AbC+zQjQuM7TE82ay2u0SJr8v8mzS2FXdp2Iq2oAvIwL4zdM2gJ9R/6txv05z+N+mqNij53DNTfGIqse86zFYq+UqGaBsS7PGQ8Q4QkpP0F3jqwXXoZ15glo4hIW/kTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981846; c=relaxed/simple;
	bh=14RBW8/yPCk/o2gEVZiPjRnmJgg/F9+K4MTUYB3kZ0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SP/c4jwHkeXtWwGt2hkZB1uPCR3pO9SjeU0XYvQISiK8DSPeANdLnhvAIq9jmQxcn0JK3WFy/PEkqOVEw4o9bIYPxvbZtJo9BpD6+kb5Ty8f+MAAHiDq9taO0V9FDzx0rpZGvrKE6OETSdD0oRz6uejZakNKO9tGmI15wY2zpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xdcMoAZQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xdcMoAZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0D71F000E9;
	Thu,  2 Jul 2026 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782981845;
	bh=dIgPXpzZod6oGiMN7QycB15PSODxpO90zhSh9YZNJKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xdcMoAZQwatGmyngmHq6MZIlYhkWh5hHh+YD+h/8OxeM/g0kGQYO/yyEpwzEG48HA
	 z6glwxQ5+8hpc+byTXe+UeLyxEyTdb3rE1tIWpsLvwjVmibu3W3op6af2bIjcnxoMq
	 KqSDl7OLWYLr1iUGyNoD5920l6BskGW8uDxPcC9A=
Date: Thu, 2 Jul 2026 10:38:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] usbip: vudc: fix NULL pointer dereference in
 vep_dequeue()
Message-ID: <2026070215-parted-cloak-7fb0@gregkh>
References: <2B1E59F5E4C6B935+20260702081232.2477777-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2B1E59F5E4C6B935+20260702081232.2477777-1-raoxu@uniontech.com>

On Thu, Jul 02, 2026 at 04:12:32PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> vep_alloc_request() zero-initializes struct vrequest but never assigns
> vrequest::udc. vep_dequeue() then reads that field and dereferences it
> while checking udc->driver. Consequently, any usb_ep_dequeue() call that
> reaches the vUDC dequeue operation can crash the kernel.
> 
> The endpoint passed to ->dequeue() identifies both the request queue
> being searched and the owning vUDC. Derive the controller from that
> endpoint with ep_to_vudc(), as the other endpoint operations do.
> 
> After this change, vrequest::udc has no users. Remove the redundant
> controller backpointer.
> 
> Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/usb/usbip/vudc.h     | 1 -
>  drivers/usb/usbip/vudc_dev.c | 4 +---
>  2 files changed, 1 insertion(+), 4 deletions(-)

Why is this a RESEND?

