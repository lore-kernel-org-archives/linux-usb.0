Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A33C3C09;
	Tue, 12 May 2026 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564413; cv=none; b=HkUFIyhJ0fT8fSiLW0kWLLU/o24HbtgOOwdkEF7925fxw7WernjQzeFFB/qOygXv4bgCsPM3dA0vOl7puqstIoJ6DoBmG+6wP1xFh1/b5sUH9jS1zB2ZtU47aohGbKoNurRaL2wmsfP9IDD+oyRlYD92Rs+4hu0Hq19dTRq8RKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564413; c=relaxed/simple;
	bh=8+nL88ol+kwVA5O3awrXyArO+2iuZBZJgK+mYR7e22M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAjtemjWhZaeDFOJEfOI4+b4j+qogn0dNiNVx7qwoEmqjuyOSBwVdbKHAVne10DSqAISwUNAIZ9wYMHcdTU+c8dgyg6S60Yvvcoj3kVgsy8T0Ydxkv/KGXUjtxdCXcCZesOBR4Ntn8HYsHov2e32l0Lh6KnU9cT8Y1AY2gDrDpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tJU8aKB6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tJU8aKB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7180AC2BCB0;
	Tue, 12 May 2026 05:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778564412;
	bh=8+nL88ol+kwVA5O3awrXyArO+2iuZBZJgK+mYR7e22M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tJU8aKB6LkU4EKc6fWI+wZgUrgdiYe4X84YIUrrfDwKklT9n6KroFOfg7eiXKMo8W
	 80Dyg3i3y3BIuVe5d16VOw5iAdct+LAK29VpiwBQoawPiUqEEpw89rpc+vQ6/WWGVr
	 0M28SRweTjuoekXF7Y5kcjQJsYjbSgBcGEim8U5s=
Date: Tue, 12 May 2026 07:39:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeremy Erazo <mendozayt13@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: composite: fix integer underflow in WebUSB
 GET_URL handling
Message-ID: <2026051221-glory-macaroni-dce6@gregkh>
References: <20260512014343.3770664-1-mendozayt13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512014343.3770664-1-mendozayt13@gmail.com>

On Tue, May 12, 2026 at 01:43:43AM +0000, Jeremy Erazo wrote:
> The WebUSB GET_URL handler in composite_setup() narrows
> landing_page_length to fit the host-supplied wLength using
> 
> 	landing_page_length = w_length
> 		- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;
> 
> If wLength is smaller than WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH the
> unsigned subtraction wraps, and the subsequent
> 
> 	memcpy(url_descriptor->URL,
> 	       cdev->landing_page + landing_page_offset,
> 	       landing_page_length - landing_page_offset);
> 
> ends up copying close to UINT_MAX bytes from cdev->landing_page into
> cdev->req->buf.  KASAN reports a slab-out-of-bounds in composite_setup
> on the kmalloc-2k gadget_info allocation, and FORTIFY_SOURCE traps the
> memcpy as a 4294967293-byte field-spanning write into
> url_descriptor->URL (size 252).
> 
> A USB host can reach this from a single SETUP packet against any
> gadget that has webusb/use=1 and a landingPage configured.
> 
> Handle the small-wLength case before the math: when the host requested
> fewer bytes than the URL descriptor header, only the header is
> meaningful and no URL bytes need to be copied.  Setting
> landing_page_length to landing_page_offset makes the existing memcpy a
> no-op and leaves the descriptor returned to the host unchanged for all
> larger wLength values.
> 
> Reported-by: Jeremy Erazo <mendozayt13@gmail.com>
> Signed-off-by: Jeremy Erazo <mendozayt13@gmail.com>

You don't need a reported-by when you are the author and sign off on
something.

What commit id does this fix?  Why not backport it to stable kernels?

thanks,

greg k-h
