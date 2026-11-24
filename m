Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505726;
	b=y4yX3ocGw3hhc3+n1Ftw24KnO7suPyVcidWoy0HSXajGDWUc/mXTUKek3RGbfbRIDq5f
	 sT1lX1bD4Qa3WtQI4gvKQhej1RAbwQXiZfZI2rMW8ISQ69bkLOk4U3Otv3uegzCNXGj+/
	 NH1s+xmrji9jrAt3xvsjhNERE5VaDMpFGK6pxh+RoX2RUxgEKCaIPsNjeg0eGY9V/VBCR
	 ouhH6SH4p7tnxOQCOAVQK0xz7F8HxPCjxe+zEQ1w5YuFrNqDmTR2+qSiNdXPzKkRcVjWL
	 6/9Z4pCFz5m2E6eKBoHltYr1JpmE/G8lACgBlfVGebfniC35Y6PZKR3ctbdHG+QkEGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505726;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L9uQm68N2MumtmyGdiKYm4qHaZgtccsGuIlqfQfaCII=;
	b=vTOeG3py+ZVVqxPWFfN5LxPiz04Tx8mYtM2AjxBxy4CIp/uYONOlw98FRRccmScXNv8d
	 9saDfzSE0cApe3W76A5WL8kyLESoQxMRZtvPvxNaIc+LPo1fyl+LDZ4Ls2SrXCR54GHtS
	 87glWkD35b8zwUdaMvkc03bMvfUsAa3/cPOCPUFy6W3msW2yLazL08XIr4QUYcL/i4jSV
	 5l9rUrhYWHpl6Q5Wb7mk17GHQJS4c0avCbcRya/ryndsyy+F1w41AQexcwgQpJdFOMOx5
	 84hVy+4JiD+6+5xi7m2WCUwcrSu8vGfOvkQyaz4HgqRWzP0JCq6G0hem41Nok3UUgBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bie7x1rM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F359606A327
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bie7x1rM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB981F000CF;
	Tue, 24 Nov 2026 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795505725;
	bh=L9uQm68N2MumtmyGdiKYm4qHaZgtccsGuIlqfQfaCII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bie7x1rMOyw03hEqwggwdvU2xMNwuVJqBh7MKJCnNiQx2LekOEA3H1DdZRvLRzkgA
	 kocnMPyLxm03xqTtO3AN2RKnlf9dqymespIAP6Ffv0deksn4tNTjkZrmB/n61BYxbF
	 N97D4Y9r4WuVCwWT7nxP6WQi1VYU0VcsYWOmvKug=
Date: Tue, 24 Nov 2026 08:35:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <westeri@kernel.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v7.4-rc5
Message-ID: <2026112408-nest-tackling-6cf9@gregkh>
References: <20261124065057.GA953598@thinkpad>
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
In-Reply-To: <20261124065057.GA953598@thinkpad>

On Tue, Nov 24, 2026 at 08:50:57AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.4-rc5

Pulled and pushed out, thanks.

greg k-h
