Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBE3B4E8F;
	Wed, 22 Jul 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712402; cv=none; b=aOvLDc9Hd7uLqAKPpO9RXX3y4bbiBJnC//DzF5F9pm1HDywxxiLsDB1upeSHjbzbDC9XyugiL2ZdpOlUyye5IApXBw9TTWYnixxTC8jX6uCIR+JXPJkQNkSbsdhTXkagyvB4O/94ZpQmjATOBEIOdMa1c3opxdz2Q2rNycjOPwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712402; c=relaxed/simple;
	bh=oD5Bh5UpqGqKL+jO6l11fQs5R4tQGm9SCKV2vx8REqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3N8naKc5wnKQRYbwk/rcpifk4dhVTuzk1pKC0H6UsRaFDRqAn/hd0MtTyfbEiZ2GBjLhuJUbLJs6k/UhzKtR4cfUCdeJmno/xBNNAgCaN5rP21VohigJG5YE83KE6plsr5ERTs5GNc5hSsfDA3eYZ5KeWvHh9nZ95f2LJH2/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcgOVCVO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcgOVCVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898B81F000E9;
	Wed, 22 Jul 2026 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784712400;
	bh=3Q4AjQQCXmgUL22/Zl1BeWrtcKwX+v24hbDsRNOXUMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mcgOVCVOJxo9gVEOmuHlaXIWJ3nqYZ/FoAtvz61vAGXeWhOi24uKAiAFlc7XGgYja
	 5devDcctECYdZXZsuwyCJOyOJjpegOu5baXpcrMnosYG+2xzt6T/NfUryA2LJm5PXf
	 QVHt1lxewpKxF65NLM9GvzBmxo1IFJPtzrgt7/Wyhcpx7ABqJ6jE05SbBuoTUM4XQ8
	 1xRCRv5KRgxGQ7VfYBn8k55bGo0x8GZb5JGszX4RpXUvp3lU7x25ovrh1eSpL4UTuC
	 5gCsX77PO3Rw5ELUvwDVUoh6MrQu8uwfj4Vhq2fn+qZdxHErIJhxuQwrUvNHPJHJAl
	 PdctNWoMz4z/Q==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wmTDq-00000009FqW-0krB;
	Wed, 22 Jul 2026 11:26:38 +0200
Date: Wed, 22 Jul 2026 11:26:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Sunho Park <shpark061104@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: io_edgeport: cap received transmit
 credits
Message-ID: <amCMzp6QAXDDczVU@hovoldconsulting.com>
References: <20260714104230.893968-1-shpark061104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104230.893968-1-shpark061104@gmail.com>

On Tue, Jul 14, 2026 at 07:42:30PM +0900, Sunho Park wrote:
> The interrupt-status packet reports transmit credits returned by the
> device. edge_interrupt_callback() adds the 16-bit value to txCredits
> without checking maxTxCredits.
> 
> edge_write() uses txCredits minus the software FIFO count as the amount
> of data that fits. Since the FIFO is allocated with maxTxCredits bytes,
> txCredits exceeding maxTxCredits can cause OOB write in ring buffer.
> 
> Cap accumulated credits at maxTxCredits. Conforming devices should never
> hit the cap.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Sunho Park <shpark061104@gmail.com>
> ---
> V2 -> V3: Added missing revision history (no code changes)
> V1 -> V2: Replaced min_t() with min() 
> 
> v2: https://lore.kernel.org/linux-usb/20260714101316.823942-1-shpark061104@gmail.com/
> v1: https://lore.kernel.org/linux-usb/20260714093424.737303-1-shpark061104@gmail.com/

Applied, thanks.

Johan
