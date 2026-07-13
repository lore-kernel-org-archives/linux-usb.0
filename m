Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B80430215A
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936604; cv=none; b=fc0f66VI+00eJobSBrQNvNxEzH5qJKZTCjbRGxRC2MwUNtJLMkYvj/zD4brnJs8VSWmRIKPevKlDZWhrMlOv6BMUkBgYXpkOmevjaupUekpoPhcMFvDPRRkA74vyzgYbnjOJylBPpJ/675lIm48tkhCSDPzVKKSNdfdvaPhC4gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936604; c=relaxed/simple;
	bh=QcJUU/+h1lfxet8Z4KzrGHgHNT/sQq7f7iuqtXTCZF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNnjSn6v7HTpF4VBVedEkZKrPYCUFWQmBP6zfxU7+jVJW7C73mL7VCNKadGY7+Jd4BHYms9Zx+JV9z8Yf/4icjgKroEytZJKm7Xo+pMrEOzIjYXMiW90Vo8ThLmKdA1e/ln/LoDopQkNXVMzcpvfuhDjpXujCIf1Ev6UFtmRVAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHsd1UDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHsd1UDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325001F00A3A;
	Mon, 13 Jul 2026 09:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783936603;
	bh=wKHoId5oBoGmYEUyWh4m98Jz9Uf8pky/CIBisGGa94s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHsd1UDSfGrhtK/oQID02zFRaYfWKjFeAXChcb1e5WAvNGaOHiemkXmiqHoOtTnE2
	 KBEsAhcsSLS3vcpbYAr0WhHdDlwgJR4erG5LYxDkbR3qmFpFNKIvV7u2f0FFDhPZtp
	 jqvIuoJMMzDaVfaVJ5BEFVcJ2wsbgKpOnARSa13wwP8E46rpt/+WU+dtAKvT60DSlT
	 XsQcunjYDBzkL7ih8f04Q4iufgpMR7NFFub0uIk6tyuBElteTs7r3k3cakWE1Lfkar
	 QY1i/xGaQ/Rh5Bsq6MT9wfZfDjIML0ab4SjFmt6N/wut3Prighak4qGMWEW7Ieil24
	 rSpx4kb7fqp3w==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjDOy-00000004xse-3Xul;
	Mon, 13 Jul 2026 11:56:40 +0200
Date: Mon, 13 Jul 2026 11:56:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: fix slab out-of-bounds read in interrupt
 URB callback
Message-ID: <alS2WOB1L2bXDuYy@hovoldconsulting.com>
References: <20260712170012.3503601-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712170012.3503601-1-yaojiale02@163.com>

On Mon, Jul 13, 2026 at 01:00:12AM +0800, Jiale Yao wrote:
> The interrupt URB buffer is allocated in setup_port_interrupt_in() based
> on the endpoint's wMaxPacketSize:
> 
>     buffer_size = usb_endpoint_maxp(epd);
>     port->interrupt_in_buffer = kmalloc(buffer_size, GFP_KERNEL);
> 
> When a USB device declares wMaxPacketSize = 8 on its interrupt IN
> endpoint, the buffer is allocated from kmalloc-8 cache (exactly 8 bytes).
> 
> If the device sends a short packet (actual_length < wMaxPacketSize),
> the URB completes with status == 0 and the callback proceeds to read:
> 
>     data[sizeof(struct usb_ctrlrequest)]
> 
> which evaluates to data[8], accessing 1 byte beyond the allocated 8-byte
> buffer. This results in a slab out-of-bounds read.
> 
> Fix this by adding a bounds check before accessing data[8], ensuring that
> the actual length is sufficient to contain a full USB control request
> header.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

This looks correct, but how was this issue found and how was the patch
created?

If you used an LLM you need to document this in the commit message, see:

	Documentation/process/generated-content.rst
	Documentation/process/coding-assistants.rst

Johan
