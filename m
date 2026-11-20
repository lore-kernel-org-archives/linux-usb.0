Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178549;
	b=loIzyudH3n4MVlAvfPlGYGdtaBsF0dG/00HIp2WP84KhrG4wHe4YD8dVGVK7bDqDkk4W
	 XE0Kejc99xP10gxWIViOrqtntuJ0l4p/YSLQsYwNebNCRnsuToA8hYb4yGmGmTmCGHX+3
	 7hC+m8p/pngmcOThWNY4TwHppEV/7IL6H5S8MP1Jq6Nw/5wboy+Rc0kJAnfIH0sYO5kpb
	 yUxxnxQ/aF3YeR/yyWTTOBdYgKZ1hYgu9CEhECycuWVVPsToNrn9hO7ar2h1xuNJDet1+
	 LaLMOis8j1n9ATCcP5GJUyRZOkngWXsyp1oIEEis6ys7vDh84k3kRl3FWhl6Eyn0isw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178549;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=liIsbHhpfaQ5YabIQwU9w9ZbEKjgrp0NTlj9gLHjehg=;
	b=jWJz2ma4SUIBnqdkhzrEheFKRuFBB25SMtBQ3tVmZXGDKLY7FtWQcGqjbVDx46+Elm3n
	 gMTBE2PHLcpDgUUFu8UOc4oMpYrqlRttD0W/J6Mt+x5buVnsvmrz+NC23IzoRaY6PyR38
	 MEsI0iO8H6oKtgCfLlq4e/gAcFgYdfCqTWncth9DvJXNj9waB9Fy6bMLDen0vnOiRdA2A
	 meyFLUnI4PuaLziXcX0lf0xPPqgAiinBtZEZ6+OSY69eZ+2sD1wt3sIfpO2uh6e0yr2ZI
	 PgwxSIgQrMbeuKlGAaY5HQNvJAqKXigvVX+s7ATAfca7fItX8eMUKP0yVaU6T2iMMWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EAl9OESp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E465606A320;
	Fri, 20 Nov 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EAl9OESp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182EE1F000C0;
	Fri, 20 Nov 2026 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795178548;
	bh=liIsbHhpfaQ5YabIQwU9w9ZbEKjgrp0NTlj9gLHjehg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EAl9OESpezyW7gw+TSNraWKbfcI9DZ8uV/1kkvDhSYACuZEqkvcHLuqCEibMjgmwJ
	 tr6l3gsb7IJZIeWQCGX0pQFEj1DdBf8Dch25LVLxTLoWxuIIcqrAov6dQiEeMq7akG
	 ppVYF3ZNmaIVm/93uTFK59+/KRqKhbzEAPCFqmXY=
Date: Fri, 20 Nov 2026 13:42:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Boyan Liu <yymhvert@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	co+02480a85e1a0d4f5@bugs.sh
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()
Message-ID: <2026112019-mobster-coerce-8608@gregkh>
References: <20261015024508.3179-1-yymhvert@gmail.com>
 <20261106070914.3637-1-yymhvert@gmail.com>
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
In-Reply-To: <20261106070914.3637-1-yymhvert@gmail.com>

On Fri, Nov 06, 2026 at 03:09:14PM +0800, Boyan Liu wrote:
> Hi Greg,
> 
> I wanted to follow up on this fix. The use-after-free addressed by v1
> is independent of the two pre-existing issues raised by Sashiko.
> 
> For the skb2 leak in the same err: path, would you prefer that I fold
> 
> 	if (skb2)
> 		dev_kfree_skb_any(skb2);
> 
> into a v2 of this patch, or keep it as a separate follow-up? My plan
> for the independent ncm->netdev NULL-dereference race is to handle it
> separately.
> 
> Is the use-after-free fix otherwise acceptable, or are any other
> changes needed?

I see no context here at all.
