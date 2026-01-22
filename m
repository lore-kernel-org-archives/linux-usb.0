Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5B333438;
	Thu, 22 Jan 2026 05:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769059947; cv=none; b=F5Abgjko8jps3D4Geh6AT1unF0EklCBh9IJGeTpS33D/1PVbtQfIH6w2JZrFHUL06MRlGzfLLFUtA8abtqNZVxfRTRtIjJMVyJw3KBzhpoAvDr7MgIEaSBwXBXfMcxv1DvV4w2BcHFj79yi6UEnSFvi+4oA5aOZ/e5helyLfopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769059947; c=relaxed/simple;
	bh=JJZ1hhR177TqAiQGoQAo/DWAI+VEIJe7K8r3P8msrp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TayzNLk7AZLTMXiFROAQniOJRa4dEIi3KIwCTBxIf18Cj+D30BVsHzvKw5tD1UaGuah4guLiXmPscr9XqWbFRQuWEA3NcEqTKKgATbAnJ7PHXSkFBOEsjy1qFJmp8McoCHqtpWGpbiPruHt82qiPdo13eDQThySfnsZDlao1W1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YC+SUf6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YC+SUf6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF92C116C6;
	Thu, 22 Jan 2026 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769059946;
	bh=JJZ1hhR177TqAiQGoQAo/DWAI+VEIJe7K8r3P8msrp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YC+SUf6Jz5XRwMmQOceq7bTMBI8rHU0nTkufBxiTTjEl1hQ3OUFr95C40CKLTHNCC
	 IBHEoryMgW12ZvndJGdpE42gnIU/17vUDfAln9YIV7yR4aMp+4T2xAJi5BZbCRPylQ
	 Fzr7Pk3Qht1ltg4PPQoC1m/BMJHSdwLBebmMu1rg=
Date: Thu, 22 Jan 2026 06:32:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kery Qi <qikeyu2017@gmail.com>
Cc: balbi@kernel.org, jaswinder.singh@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: validate endpoint index for max3420 udc
Message-ID: <2026012246-yeast-attempt-1ca1@gregkh>
References: <20260121203944.1898-2-qikeyu2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121203944.1898-2-qikeyu2017@gmail.com>

On Thu, Jan 22, 2026 at 04:39:45AM +0800, Kery Qi wrote:
> The max3420_getstatus() and max3420_set_clear_feature() functions use
> the endpoint index from USB setup packet's wIndex field to access the
> endpoint array. The index is masked with USB_ENDPOINT_NUMBER_MASK (0x0f),
> which allows values 0-15, but the endpoint array (udc->ep) only has
> MAX3420_MAX_EPS (4) elements.
> 
> A malicious USB host can send a specially crafted control request with
> an invalid endpoint index (>= 4) to trigger an out-of-bounds array access,
> potentially leading to information disclosure or kernel memory corruption.
> 
> Add validation to ensure the endpoint index is within bounds before
> accessing the endpoint array.

We've been through this before, please read the archives for the last
time this was attempted to be submitted, and go and fix the tool you are
using to find these.

thanks,

greg k-h
