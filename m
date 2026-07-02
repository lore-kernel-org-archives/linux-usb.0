Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C28390CB2;
	Thu,  2 Jul 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981856; cv=none; b=Pxn1PIQ1uUMGgSVQSeSKdswYZKlcgPcSCIKIcSwFSu/pMZonfDLLoGQ2swFt8D80XsM8/QAZFsREEcnm24+PxpqG3IkvMcSMSAWTvg2CUwNFrcRCKkLn9kJ9F7fPzKi84VuwrVeFOgGReuzr1mPZpMqoOHKt++8UfKB/NSqFL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981856; c=relaxed/simple;
	bh=SE1C9WnXfq1yGqFsuERXBWiAsH6wb/L1v/aobyb+D2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLoVN6aTmziCztvH+nuRtQZjz/nczAWWZ+sApNcx0cl5w2XX0YE8jQwWTUYP8lx++8Gaez7pi+xhWTSMjHcyW6xKGmnA+6B6+0nk5QZdKtSTFH7HVW0B1fp9MNg2f3R6MIGmExZTNXSUfnsZTrDEl7hHp2BexM7uqXZSSi7beL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=skjYoUQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="skjYoUQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F398F1F00A3A;
	Thu,  2 Jul 2026 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782981855;
	bh=bgVkVZ5Jc3vRTS62e8pc8LUw20X3T2TnPqQwY+9Idko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=skjYoUQlhSa1B8y+JYoYf3bmaqKrY1eSjJSNzBQemA6gBn7kCfmMVsugfbGOKJIeJ
	 r/5xpxLeOaPR10+yacQ1J4PVG0fpL3dE3nq4BU1QuBWJBjoVMoOlelXZaqQX2ns1Ai
	 RgL/LTnEI+9dlfC79H7gFuhgZSwGzG5uZrXvh72E=
Date: Thu, 2 Jul 2026 10:39:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com,
	michal.pecio@gmail.com, johannes.bruederl@gmail.com,
	kees@kernel.org, dengjie03@kylinos.cn, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] usb: core: config: fix SS companion log for
 interrupt endpoints
Message-ID: <2026070248-fleshy-activity-1a33@gregkh>
References: <E4E3CED70BF44FF8+20260702081104.2476004-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E4E3CED70BF44FF8+20260702081104.2476004-1-raoxu@uniontech.com>

On Thu, Jul 02, 2026 at 04:11:04PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> usb_parse_ss_endpoint_companion() clears bmAttributes when it is
> non-zero for control or interrupt endpoints.
> 
> The diagnostic message reports Control for control endpoints and Bulk
> for the other branch. However, the other branch can only be an
> interrupt endpoint because bulk endpoints are handled by the following
> else-if branch.
> 
> Report the endpoint type as Interrupt instead of Bulk to avoid
> misleading descriptor diagnostics.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/usb/core/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Why is this RESEND?  Always say so below the --- line.

thanks,

greg k-h
