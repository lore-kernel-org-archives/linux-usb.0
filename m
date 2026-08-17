Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425363C3F69;
	Mon, 17 Aug 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964569; cv=none; b=XG09ZFxhuAS/HA7nioNgf5AB6GjsxA+iuB3tXWAFIQF2U59Xwh/sbKXX19eMs1U9n7nrlWIZPClNyZuOW1s19l1Mc7FxL3BmQnz0U6Bf3A+qMQ5QEynHZZdTwwP8ZnhJO+ojpq7/Gg20GSTB/LmEWbCe597DDJVWZEYdsYey3lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964569; c=relaxed/simple;
	bh=xDFX6tXp1AehQdpgrogqB5y+xQwTWnvrR8hIONTE1oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzltaWYXFSm6Us5Di4MEBXj/jfuIIYpRUyH9Bv2zh+PLaAULE3p/5c8eIJPHxgZXJjewIelspZRKf2Vps0vtepeGIbU2ImIVkLSVN9rpTx1PsxQ1cCFFlHev1UsfSenMfVTAiB2/JQQtHyVh/FgVeFxwaK3RZga+rvQ1k18G19A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jOZczy8O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jOZczy8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590771F000E9;
	Mon, 17 Aug 2026 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786964567;
	bh=G+ZKZnhztV3rQqlCT+7lElgjiAGoSKxPLwotbD7o28Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jOZczy8OZiNK98hBDeRjjUlh0siIdzF4kbauevRHWFD0c9tXavepZYSr8avRn+rqX
	 OQr+PjjOH2V89QGM3EnqsTp+b5fqN998k0xOxF61HdkaPYAFQjG1jF8AX9payVuNJb
	 IvUYjV9ComVl+voNHJR17u3TkMum4vksnn7IJ8+c=
Date: Mon, 17 Aug 2026 13:01:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: cdns3: Handle ZLP request allocation failure
Message-ID: <2026081757-fog-lunacy-2df9@gregkh>
References: <20260817075929.899795-1-triet.hoang.dev@gmail.com>
 <20260817090321.955841-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817090321.955841-1-triet.hoang.dev@gmail.com>

On Mon, Aug 17, 2026 at 04:03:20PM +0700, Triet Hoang wrote:
> Check the return value of cdns3_gadget_ep_alloc_request() before
> dereferencing the returned request.
> 
> Changes in v2:
> - Allocate the ZLP request before queuing the primary request.
> - Free the allocated ZLP request when the primary request queueing fails.

The "changes" go below the --- line, right?

thanks,

greg k-h
