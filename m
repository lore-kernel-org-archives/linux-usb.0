Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7E266581;
	Fri, 14 Aug 2026 01:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670803; cv=none; b=hzh8pbS/7uq97DiV6ZWQ4+05wwMexwum7+zBSLJ5Ok6ARI9sEK4gtqMlzU3+L0BZ4//X1eO+0t/cSYnRK14BJpi8QExKXWV/lN9kMSNFzod7/ek7ixHu4E1N0GYgbKV0nuDOz4T6c9lgcwBo/Jj5/lCw6xxBYx9s8bdLgjD3CC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670803; c=relaxed/simple;
	bh=q2jdYGcoLNOq+hYSRCYyY8xlkysN8gSYKSRcrT50uPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbXbEsLuS9EHE0MU/w1asM+nQ6j+wPYyHHH9cvT262eBLLyQY65hoZb5jC2/dYnEYRQdKqUKhcA/qyEnzrgRYwrWNJGYB4n+mIqxuwNIFsRE8J0OVsHzkfDEbOpbPxVXOmiQxEljkV3Dt+xFTQZyHEenmIWsvgsk2S0FZOWlSjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p2BPGNbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p2BPGNbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E338C1F000E9;
	Fri, 14 Aug 2026 01:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786670802;
	bh=xTB1A1dTED0ERBwxbhq0RXVIzEwA+Pdl7j/ikJ/4qMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p2BPGNbxf8PFgA3nDCbJpV777L/89GYY/JQ+yoHOklhDMboCxZpSsO3VooQolNzZY
	 jhNOBbYc532M4SLA6JM8egUyCCuLuy6MZuHArb49xR/QoBLRI7Vk73ZklWf8QyZRHE
	 RFKLrJRRjbqCjY579oOxrDR3Q9xCcIRCtwH79tMI=
Date: Fri, 14 Aug 2026 10:25:08 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.2-rc7
Message-ID: <2026081451-otter-reset-7f8a@gregkh>
References: <anXxYgop3crgWa9F@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXxYgop3crgWa9F@hovoldconsulting.com>

On Fri, Aug 07, 2026 at 04:53:22PM +0200, Johan Hovold wrote:
> The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:
> 
>   Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc7
> 

Sorry for the delay, this will have to go to -rc1, so I've taken it in
my -next branch.

greg k-h
