Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0579242B731;
	Wed,  8 Jul 2026 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513895; cv=none; b=ALxXf59Pxf0+Yi4KcOcu9tA9eOS4iM6IqD9YinQ3TQf4N8jxA3dUYfeZH6OQll16pxSa3SNIBE2VvWOa4Q1sYTGzFjDc7D6Fkq9QYdwz8ZceNygdWGTAk6WpNkwDyLDW87ogX7tKefzsZEGj8kMNsmGwQhMz2wMCRuHjGLRWlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513895; c=relaxed/simple;
	bh=UlPvk90QVcpFdhgogM/aLjPtfKdOO0nheO89hp3m5wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwUcKtW8iqjI6EKZOQJ4IensMEu1b0lMUIrv6IqtW3Chk/j7LEMz7xnxgdr+7CGkhEBlolQPeJH1fkJo7yhEvgpFg+Pfsos4/Zd6ftOQA91b7bZC+ebkQZKYSNifo5zw7xMOk+QOlR1R+7KTATyr9jeAeE1mjArvk3rYFnqpzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g2YVLFV3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g2YVLFV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBAA1F000E9;
	Wed,  8 Jul 2026 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783513893;
	bh=VaUyrtBS5v3BjuBJgu1WRh8Ed/syGoAzR+MvI982N2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g2YVLFV3hMEyQk0Y7+nucRiVAb1I8zdIV7pY4BhIX/21ENNQKSpdDKCw2HvqIrdGt
	 KMUycY06k5G64LMUd+ElCBG4mAyze+JkxTkIR59V0zGhRAMnzwZ8Gyi6lruEZaFj+Z
	 sJoe4M6k1QJFyCDjzwPwH4rpsJHeYXr9Y32Gusqg=
Date: Wed, 8 Jul 2026 14:30:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: sakari.ailus@linux.intel.com, mathias.nyman@linux.intel.com,
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org,
	dengjie03@kylinos.cn, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: config: fix SS companion log for interrupt
 endpoints
Message-ID: <2026070808-bagpipe-clapped-a369@gregkh>
References: <85BCDBC1F65453B0+20260603062536.517734-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85BCDBC1F65453B0+20260603062536.517734-1-raoxu@uniontech.com>

On Wed, Jun 03, 2026 at 02:25:35PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> usb_parse_ss_endpoint_companion() clears bmAttributes when it is
> non-zero for control or interrupt endpoints.
> 
> The diagnostic message reports Control for control endpoints and Bulk
> for the other branch. However, the other branch can only be an
> interrupt endpoint because bulk endpoints are handled by the following
> else-if branch.
> 
> Report the endpoint type as Interrupt instead of Bulk to avoid
> misleading descriptor diagnostics.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/usb/core/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Does not apply to the usb-testing tree :(
