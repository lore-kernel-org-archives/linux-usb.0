Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E28A221D89;
	Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324833; cv=none; b=nMusxSlBhxJtl/nkYDS2IsNf8Ez5NRcWP0UIHy+l0xmSV8sc3jCzFsnhCGgIlcunqPfsmiHnkUl5bDZ06Ao+4g6kXXDis7kMVY/pA3pKn3VwVlJUQvkzw8jFY4YhTZ5xzOgjWVWDz2fGEXuSqOpoyn8FLbYA6nZUpQqtTfYySAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324833; c=relaxed/simple;
	bh=/iGGS/3JXkQd6nRPNLHFiJYdPDHWTb5ro+/T4OpvDZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVA9Yzn59UbkkqGme5aP66b0z/V+SvSbJkLoBbi69BcvceFsIC9/QbL5tXJf3y3kEfiJSZ4IcH1M2yBS9JX1EnhcDJ3RJQqrZ2Vzs0WlHe3ALFNKnkm25Up3LStcZr3sNu0UQu4ii57eDxHlLHwaMUw8gyWbJ9zbP0J/+42cToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=chTqXtgx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="chTqXtgx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3BE1F000E9;
	Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787324831;
	bh=Ymc2UGDnEUpLMLPYm6nBfDMYMV1PDKhcC8+04XbZD2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=chTqXtgxD0Xi96xVapkB8ONXUwSm5cMOd+AMUcFGA89UBUZmlg9Sod6iXZNEX1Qqu
	 0bhLBl0jZkrj41SwtVyC+qrGsSN5xOOmLVuEFjmBBVVoIleec/1gv3EZ1vy5e7SFy9
	 cy/NuNLWrQvqljTXGJA3fckvL16tf7QJ4u5yExc0=
Date: Fri, 21 Aug 2026 17:07:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: kees@kernel.org, stern@rowland.harvard.edu, lgs201920130244@gmail.com,
	balbi@ti.com, ribalda@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: net2280: fix NULL pointer deref in
 usb_reinit_338x()
Message-ID: <2026082117-audience-earplugs-ded0@gregkh>
References: <20260821121220.13006-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821121220.13006-1-kartikey406@gmail.com>

On Fri, Aug 21, 2026 at 05:42:20PM +0530, Deepanshu Kartikey wrote:
> net2280_probe() only maps dev->llregs when the PLX_PCIE quirk bit is
> set. usb_reinit() dispatches to usb_reinit_338x() for any device that
> doesn't have PLX_LEGACY set, assuming such a device must have
> PLX_PCIE set (and thus llregs mapped). That assumption holds for
> every entry in the driver's pci_device_id table, but a forced driver
> bind (e.g. via sysfs bind/driver_override) can invoke probe() with
> quirks that have neither bit set, leaving llregs NULL and crashing
> in usb_reinit_338x() on the first readl().

What is it with the forced bind patches coming out of the woodwork?  Did
syzbot just decide to go crazy here?

Again, no, this isn't a real issue.  If you try to do a bind to a random
driver, you will get random results, including crashes.  This is a
debugging-only feature for people who want to break their kernels :)

thanks,

greg k-h
