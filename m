Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23233A718;
	Fri, 17 Jul 2026 04:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784263470; cv=none; b=enlijaaelcSiPwxDxf0T6ANCYvs+tYaoXKGE/2BIlulYQZLJl1QWlx8fcEVnCdpmqZ4+x0NrhNJMFFzSm/9e/008yLyrDSFwIYMzyz3ThopIp+KgWxyjsX9F3C5gZmIW+ZFzITS3PEIfMVLqfaMWu5Avf3UTMh2Ajq0FYF6SG8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784263470; c=relaxed/simple;
	bh=AYqg4RTcBwXDcdiY6Iv9kVeVGzCV5X8M1qVUoUtGDjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gedJDxPkx/+roB82W3j4DbPk+QW9mswHu7pp8kQDUzNbs9JYrH5jZz7mEY+or071IyYvnNiXkwY5z+0ybmWZ9vFMcwKfcmGhCa33I+LYzhgrm8dl72GVUXiSPorWNnpyCcVLQ9L50PQsqcdFssDTNjLRLgpJzH7kqgAy9nqGoYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RfbbNnYj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RfbbNnYj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BDA1F000E9;
	Fri, 17 Jul 2026 04:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784263469;
	bh=msjRuyQO1NfEglt6HuHCV3RaALtlI/yXmzydyEBb0oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RfbbNnYj2XWjqbIuI0ww/d61Jg45Ra8wajyLs9WIVncLXZ8NvEsMxdDc6pszEfow+
	 9n6AXVw8ywyQUj1XO3n/t3v6THwSExI/V6Tiv94b5sWB9Kurb5X5gL6nKH2Yfzvajz
	 WobWjyfQKK0T1UuCv2oy1ZA4SNST+bpJyCYL0ylk=
Date: Fri, 17 Jul 2026 06:43:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Cusimano <david@cusimano.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: make ndecimals unsigned in
 parse_delay_str()
Message-ID: <2026071745-unheated-sediment-c9df@gregkh>
References: <!&!AAAAAAAAAAAYAAAAAAAAAEFiSgvv3ohCnt1JqVKYCoXCgAAAEAAAAJls7O2uSQ9AogvVUySzVk4BAAAAAA==@cusimano.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAEFiSgvv3ohCnt1JqVKYCoXCgAAAEAAAAJls7O2uSQ9AogvVUySzVk4BAAAAAA==@cusimano.com>

On Thu, Jul 16, 2026 at 03:04:00PM -0400, David Cusimano wrote:
> >From 73039aaf92449baf12dd4f774164cab4b9987a5c Mon Sep 17 00:00:00 2001
> From: David Cusimano <david@cusimano.com>
> Date: Thu, 16 Jul 2026 14:04:29 -0400
> Subject: [PATCH] usb: storage: make ndecimals unsigned in parse_delay_str()

Something went really wrong with your email system, this shouldn't be
here, and your patch is corrupted :(

> 
> The ndecimals parameter controls how many decimal places are added when the
> expected suffix is missing. It is never used as a signed quantity, so make
> it
> unsigned to better reflect its intended semantics.

While nice, is this needed?  Are you going to do this for all usages in
this file of the same thing?

We use "int" a lot in the kernel, so be aware that this is going to be
an interesting task, if not kind of pointless?

thanks,

greg k-h
