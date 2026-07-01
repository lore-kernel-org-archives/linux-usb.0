Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0D53932C2;
	Wed,  1 Jul 2026 05:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884434; cv=none; b=PDTFkqiGpWJ3q737wnvFCfOUEJA5HUdPa9eK92jiUg7PLubOaPRGy4o+E4NebVWEpSRxRPJsZfbkyHzwIGS9g3OmJvkFfxjvx1MtYFm8ANk85Rd7K3DmKB8OfAZ4DoKyfTFKbpV17DfaFALEG3yeEvwk4/0UrxHyNSIjww6mW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884434; c=relaxed/simple;
	bh=q8EkUYZii2xqjX9iUwcRexOQw6d5FoUItNdnYLfzm48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2D9ROzvjl5aZ2kAzoD15RqUOMDg9sBHWR3fQ4ZsQWJ1ERxCvmGNfKoQl6rVXOIn5GamVtTXeRcQm1px/ktqb9wGBOfJNmgu5XU+7ol8aRio1h2t2roFKaMe55uUxaHcjWBW0FLWjjHMbFROInNC1JxzfUa8qkYEROQtY+0zVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GzRgowjD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GzRgowjD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EA51F000E9;
	Wed,  1 Jul 2026 05:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782884427;
	bh=QeOA0L2Ape+se6HTo5r0akcglRRZUwCVBMY9MzLoGvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GzRgowjDNDhteLcpcPuGuUKFw1OB3ZmZkmDErNJotQQXQ698GqCx2MChzDBGXsnN0
	 wHFzu9A9sqO5r1CPJL1KdcgNfn1yuUxFc5qLj304hEssvyCZTFgBIUsjTb02/WFGx9
	 pqJ+8Pc0iCYixtIWZjMISt8jiGVaKRQ3It434rh4=
Date: Wed, 1 Jul 2026 07:40:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Prostitis <prostitisgabriel@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] USB: gadget: fix mm lifetime use-after-free in
 async read paths
Message-ID: <2026070126-lullaby-pueblo-d72e@gregkh>
References: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
 <20260630150245.2730992-1-prostitisgabriel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630150245.2730992-1-prostitisgabriel@gmail.com>

On Tue, Jun 30, 2026 at 05:02:45PM +0200, Gabriel Prostitis wrote:
> Hi,
> 
> Just a gentle ping on this series.

I have no context here :(

> I noticed that it has not shown up in -next yet, so I wanted to check
> whether there is anything else I should address.

The merge window happened which kept things from being able to be merged
for 2 weeks.  Now I have 3000+ patches to dig through and review.
Please help out by reviewing other patches sent to the list so that
yours can move up faster.

thanks,

greg k-h
