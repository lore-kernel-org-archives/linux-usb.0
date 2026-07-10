Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064418BC3D;
	Fri, 10 Jul 2026 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689291; cv=none; b=pTVTBj7DI/UlBudCmyUnU8y1Mt7aAOwcSCu0FVKQcNxGEctEtp3855nShK1wKbcRwfj4NsBPA0J9mxbKJifk03snf08D1SJKg6+J2DjNw1YbHhGEtytOAsv8ibmnp7DAjXeQ5fNPXSlkmQNc+mYIsQFyHeV3+KRHAdDK2ZAEioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689291; c=relaxed/simple;
	bh=JSMefaIfMUJ7HVrawrapmakoXmHfhQ1xJkH3Ws2gZA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/37bwqC40leLSaM8H1B3opKJO4npkUkUMwvlEl3UwPtquzRA6Pptums2vkGuSd+IUpNocoIC1h/GYQaM/LzRZkuFjPrdAyseM6z7ERQE02BqreL+0ik16tfq+JEPs4hrlmk+qyXBTP039GtPZ1EZ0NpNIQGcHHGw1cgCLuBPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hlf1UVfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hlf1UVfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8564F1F000E9;
	Fri, 10 Jul 2026 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783689290;
	bh=0DsOIpyh8kLWmeuApqruth3xP1o6nZgSz1Q7gnrWhOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hlf1UVfFlknlgvfKCSx5+tZItgtAETy9SK5Q2p0LvhJunYwl3uaDBYsrmN1Ys+9KY
	 nVb8/6Rn8MZGV7TBcj8C2OMwPVUDl7MfpyQ9c9A6J7OCbgWA6GKCnajPKdP7X3bnSn
	 JwkTOfr62k23l5ybOu3bBruMXiMBawplfl1OobE4=
Date: Fri, 10 Jul 2026 15:14:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: devio: validate device and interface before
 buffer allocation
Message-ID: <2026071038-magma-joystick-dfef@gregkh>
References: <20260624023532.63009-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624023532.63009-1-andrem.33333@gmail.com>

On Tue, Jun 23, 2026 at 11:35:31PM -0300, André Moreira wrote:
> The proc_ioctl() function currently allocates a buffer using kmalloc()
> before checking the USB device state and resolving the interface number.
> If either validation fails, the function must free the buffer and return
> an error.
> 
> Move these checks to the top of the function to fail early. This avoids
> unnecessary memory allocation and deallocation on error paths, removes
> the nested 'else' structure, and eliminates redundant kfree() calls,
> making the code cleaner and easier to maintain.

Nice find and cleanup, thanks!

greg k-h
