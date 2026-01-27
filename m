Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D537326982C
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499233; cv=none; b=ILHUnwn17SaDX2OnFv8LuiAEFDvLFUHS1j3nQx3hNkHvhIfb85rLrpgQaMmgbGf5RS6ALEYPQPq6MpTTHVGvDsnwZUREbhv4yDwaEXBvPFc3MGVOqe18v0TbUll6YirFnTTGgCoqpuK8mmQjUqz9wqWTu8R0n7e9Fo7EmqWtbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499233; c=relaxed/simple;
	bh=0LbkmqhMNDZClu374agjjQ1QgQBrcUcyX98VtBqcqDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPhOPro7aeNuDuqJyZ+2GvlTrnO4SG8oeQFGh+71b76y6Wjf1CaJZwIbr3W89jYDCnukpjxKLmC9GaaeXY6Nv7sImI4suvFhZfxcZKtiP75ivJ4HuxQFOw/ezrsYwZMLgnYRp8IOa1xHnwJbz2xLLyctL3a+dQJ5BNXxQq9IS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZMuMmsh0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZMuMmsh0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EAFC116C6;
	Tue, 27 Jan 2026 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769499233;
	bh=0LbkmqhMNDZClu374agjjQ1QgQBrcUcyX98VtBqcqDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMuMmsh0h/QtIjoVw9flUBG2SrZ1+7IBOGwATGlBwzVLCDD3uod3KsZllNFOl1efs
	 s4iidY/dzXnfIwaSL/XI/L9BI8K18qFRFgSOl2bl92/Toe/3RJIzMGpB8Zc8l8Nx5t
	 o+4n6FgvfiVnJT+RtcIWSa2OJOTt+0FRBq7qwkts=
Date: Tue, 27 Jan 2026 08:33:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
	michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
	zhanjun@uniontech.com, kenny@panix.com
Subject: Re: [PATCH v11 0/2] usb: xhci: route device to secondary interrupters
Message-ID: <2026012726-splendid-unshaken-e6fc@gregkh>
References: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>

On Tue, Jan 27, 2026 at 10:34:46AM +0800, raoxu wrote:
> v10 -> v11:
>   - Fix build warnings:-Wsometimes-uninitialized.
>     Closes: https://lore.kernel.org/oe-kbuild-all/202601262208.UybEjc9X-lkp@intel.com/

didn't you also change the changelog text?  If not, why not, if so, why
was this not mentioned?

thanks,

greg k-h
