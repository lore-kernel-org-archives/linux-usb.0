Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0135200C
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545322; cv=none; b=V/fmUDbLRrFvQWr4Bv/n8cta+x/NpT+ZUhdCaUkLweUfMGQ6DFOEovByfiODA81jk5fFPWDRyVd39xbkZwNKaYD77TSbJco4TgG5tjDjayWnUB/xSeju6B0dL+nX5ROaiYnzyDl42iHnIDVQAf3FMJNVhbjn0vKh+LZhGsDuM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545322; c=relaxed/simple;
	bh=1WwGuiw4YSkVmXRjOn1e1Kl7E4j7l7zGwHlsSmeuIek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYzPhk1R/AhdsJlutwqh0f5CH0qnU6TWIrt0l8xYwsI6QSqSMmdIPYurX0TuSO2Zw9Sa/F8DMnS6iINHl9VUVqXCw9dt6Nz74QtGZ35bCYJpTyyuMh8LshXvy1d0r29SLNWHdaehZpcPC4lEygxGGKIMxMnfGvsVZVKJSEuHFc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AFDWjb+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AFDWjb+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC5D1F00898;
	Fri,  9 Oct 2026 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791545314;
	bh=Z/aEqgy2YA74qw1jEI499BwlWt63oRIEcqH4EUln6tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AFDWjb+4ki8g0QQpS1s44/xbjmlD6+DqREIzK7tQU17XbNGEnqAEjGKkTyCYE82/j
	 d4xIilQXpUO4/YZuUvdyMjHDcs1Keevs+L3hIMLER5u2lh+3vSbGkEhO+psgyDNcuh
	 CeqS2HWIhCSFhpWIK8Xz3u7H+9gblQ7k3n9HnvrA=
Date: Fri, 9 Oct 2026 13:28:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: composite: pass the validated interface
 index
Message-ID: <2026100902-collie-sadly-544e@gregkh>
References: <20260915040947.2829612-1-qwe.aldo@gmail.com>
 <20261009030246.3057189-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009030246.3057189-1-qwe.aldo@gmail.com>

On Fri, Oct 09, 2026 at 12:02:44AM -0300, Aldo Ariel Panzardo wrote:
> Hi Greg,
> 
> Friendly ping on these five USB gadget patches, all sent September 15:
> 
>   - usb: gadget: composite: pass the validated interface index
>   - usb: gadget: configfs: zero-terminate Unicode property data
>   - usb: gadget: f_printer: use the active RX list in soft reset
>   - usb: gadget: ncm: validate NDP length against the NTB
>   - [v2] usb: gadget: ncm: validate the NDP chain before parsing
>     (v2 incorporates the cyclic chain example from prior review)
> 
> Let me know if any of them need changes.

I am way behind on patches due to travel and the influx of all of these.
Please help out by reviewing other patches on the list to help reduce
the load so that your patches can be gotten to...

thanks,

greg k-h
