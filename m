Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597397;
	b=kkxyAr0mx5M4TJXnTOwQ/JKRrc2sfO0ALzVhfmaV/Mxz5So7zmbnio/2N87fL2DM+Emu
	 YSNGDoAcP7FXsOE+hh32534v9mzOVtf1BhU1Ex3aA54+9H/28bSA/kVNUtR23D7g7bkE0
	 CSDjIjbGlTjl0yCjaOqDCoo0j+NQ4A1gmbElMwnB7Qc0NQZBbmTzOuvsPFAqi4Y0tJhn3
	 LjoGgSFePksQjjHhG+ukpkRhzOvImklwzyHJpcQSg8GNjBCWtu38Si4L9sWA1/LXxDX5c
	 inLk50ix6nOA2P2nmMxqzhP1tWSbfDC63jkqifxRZuY/6EymSPzexX3lRyM6D3S3c8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597397;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eBqVI8yN0IiCs/E5hXnOFRIzZG0pYyjeORxR57mR5Yo=;
	b=fN1D0pRLLpVl+mi8rmjIc7bQS5SNnpx59UrJdpa6KZIpBs9z7b8+pqd8zg0YY8eJs+g6
	 I4RjFXgqz/G0q2QIee/JN4hOAfubPCTwLzfH3W2b69rkGR+BRCFnyfa2K5GFLMTUngbhJ
	 7KdBIOU88nrZxml6UvmGhwOA9KL8GHEcISPWEuEBVBV5VGP2fI7EKK2ZCJqBHtprdP4Oi
	 Q+xp+hpwPpvTCdaVi7TvXnwq90U8N/YK9G7DHmx80dWhQQDbuc4Dgl+W+8+xL3/7T2iRg
	 ZFgEtMv484u6/2gm9Q887pubgI6Axl4NtrsGW9d666qXvfYOkEJcgIGURj1JRekh/dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P14C/EtG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817E6606A328;
	Wed, 21 Oct 2026 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P14C/EtG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4960F1F000D2;
	Wed, 21 Oct 2026 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792597397;
	bh=eBqVI8yN0IiCs/E5hXnOFRIzZG0pYyjeORxR57mR5Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P14C/EtGerP306Fa5dEgyQaeopyf+QIFk9F1Oz9lRtunut6RuFkIioAEvWgW3VKUt
	 FTpYirRXNvdufVtxowWpZ1+JiU4BpaR5g2oMnJhGYxr9D1qndbkjLs0WK4Mvp8HchY
	 AyIoo6D2ldNC+C3W4IdV4MpHcqE+fbfMkSkmFyNf7b4Isc0bsTC8IuqoBzvElEx81N
	 ceGfhFTGUrlBau5Krz+eEzu2qWG9Wrb3xRESr0ScqkZkv0bn3vwhLRAo7LJcTwsQ8e
	 062IEYp0MQIzVtELbATwTC3Fn7Yl4dZvRNsZ0mgiCjiQWzjqPldaoYD8dJI3iVmXsK
	 8txxg5+OvIxDg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJYTD-00000009mBb-13MP;
	Wed, 21 Oct 2026 17:43:15 +0200
Date: Wed, 21 Oct 2026 17:43:15 +0200
From: Johan Hovold <johan@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 11/11] USB: serial: io_edgeport: switch to synchronous
 commands
Message-ID: <atjdk0UfX0S5TKyp@hovoldconsulting.com>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-12-johan@kernel.org>
 <sashiko-outbox-180361@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-180361@kernel.org>

On Wed, Oct 21, 2026 at 02:23:15PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] usb: serial: io_edgeport: command buffer leak in write_cmd_usb() callers
> - [Medium] usb: serial: io_edgeport: jiffies timeout passed to usb_bulk_msg()

This one clearly wasn't ready...

Johan
