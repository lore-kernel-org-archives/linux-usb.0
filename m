Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FE84307B4;
	Mon, 20 Jul 2026 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558406; cv=none; b=VwtgRaf/rlCRt/L2A7xR5REzMWKsNt/JHjHXPQAvHtSurE3pf3/RMn/7r8DIv039iaGd24VWhE4SIvTbRonz17tiQJVXfMtp9i0rqS4nL6Zfr213TIatiN1qqql/8AaANT0A7llztQxuEoGBqfWczsFv4iyI8S1nM2k1skfN1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558406; c=relaxed/simple;
	bh=SGNAvFqCcNCqI6mKiRn9b0yOISYHIbekDVps95pNCq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/lqE/9FO/ar4F5rBWzdykNdWcRmAK4RLD2vAvPpUIoIHHrc6yBFf5jadIryQgdnC4MCnO/c0aVRL+ZumnW/ZuEOenxn6Z31zd2iOJPx/ZMZsdiT1URhJktMSPrN+kd65yYxsIyNKmkebikAxstg90CJycYcp88X85h428mSNRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIaFr/wp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIaFr/wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AB61F00A3E;
	Mon, 20 Jul 2026 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558400;
	bh=+WBgBqgWFYYFrDT7WhkUjnZJCZj8qlhBqWficeKSJOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DIaFr/wpQe6uEJxGYcS2tXwwGZjHHUJEn+F21Jtk37DDFzNxRCJeicLX1YFDaWRwJ
	 /BJaDJQ/EQWmLi1KqyPvXZQzDbazafhoclHPCTNSvdSz8FblPRLpiqvhKR5UoFXbB9
	 +nH4i6pUSwi3KjkDsHjMi41I8h7O0oiGTaiXAFTBw9Nw2fqjscqEol62CoaRHOT7pm
	 W6gCRL34PUOAAKZ52W1Hf7k3HOE75OWzrGnopDetbYolf+ElCTyOKE8zm88W2ePMQK
	 EZbYEkyWAvvftilJ746ES8nS999vjL6DuauR7ROYGHow/Lu/CDcl9G6mtzq4Hja71P
	 K458eVFik9HxA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wlp9y-00000008q3K-1gYV;
	Mon, 20 Jul 2026 16:39:58 +0200
Date: Mon, 20 Jul 2026 16:39:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: io_ti: reject oversized boot-mode
 firmware
Message-ID: <al4zPrC0zxbkfWKW@hovoldconsulting.com>
References: <20260720114817.65531-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720114817.65531-1-pengpeng@iscas.ac.cn>

On Mon, Jul 20, 2026 at 07:48:17PM +0800, Pengpeng Hou wrote:
> do_boot_mode() copies the firmware payload, excluding its four-byte prefix,
> into a fixed 15.5 KiB staging buffer. check_fw_sanity() already proves that
> the image contains its seven-byte header and validates the declared image
> length and checksum, but it does not impose this boot-mode destination
> limit.
> 
> Reject images whose payload does not fit before allocating and filling the
> staging buffer.
> 
> Fixes: d12b219a228e ("edgeport-ti: use request_firmware()")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260701053535.39951-1-pengpeng@iscas.ac.cn/
> - drop the redundant short-image check already provided by check_fw_sanity()
> - state that the issue was found by source review
> - add the requested Fixes tag
> - rebase onto v7.2-rc4

Applied, thanks.

Johan
