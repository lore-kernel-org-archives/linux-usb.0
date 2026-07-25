Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FA739099A
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 05:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956986; cv=none; b=NQW/9myFvkHbF++ORdSb4l8xulFfy2r6iEpP+V9poYZFxU0NH1/mA5LppQNTdriU7qdr1MaxrsALXUez9C6+83IcSqwMyY9JMlgreRjJ+yN97tLetbUXzjy/rV1vffB6/xgXavwxrxUn/iDf+ZY/f2P+Ex1zxKxJwlMNZdd/y94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956986; c=relaxed/simple;
	bh=uEKvXOar/1nhRct47KPgxzBAh4DxFxlxvG/NtG73CoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTVZJIRZbmZXLU2kLWwV95Ygi7WHV22k/533ANchib/ZCzlBUqi1xiU4AVbCvx4DeTRhcthJ8taabyPvCNiYOCZ3KURtVF3/uuH+0X8KNLsA30jGyDHbjOfuoKC6g1SjFwORZeY4qlVIEydAupVI4VLKI06m3E/LTO3MD79p/2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=avTRafPP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="avTRafPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685C81F000E9;
	Sat, 25 Jul 2026 05:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784956984;
	bh=WcukXXZW7m6QUjsVurGxz8prS3GhgGqp0O7apovVlG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=avTRafPP3ojoxRAq+CrqvIwvR59gHRI6gqOmb5PhocRrGazF5YnkX+glPJpa3klR4
	 cLHwtE2exeLrKqjhoJV0TQ/mhVpC6wPif5WOuj8D+Achwcgnjc7k6rIT9uTdb6iZO3
	 cpLz77Hlf60k5IBcZT76bMvYEMZDT7U2v4Pmbk94=
Date: Sat, 25 Jul 2026 07:22:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Cc: nikhilsolanke5@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: quirks: Add 255-bytes initial config read
 quirk
Message-ID: <2026072535-uncork-gonad-4187@gregkh>
References: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>

On Sat, Jul 25, 2026 at 10:35:47AM +0530, Ishaan Dandekar wrote:
> Hi Nikhil,
> 
> Thank you for this patch. I can confirm this exact 255-byte config
> read issue also affects the ShanWan Wireless Gamepad (dongle ID
> 2563:0575). Standard enumeration causes a -71 EPROTO crash and drops
> it into a generic Android mode.
> 
> Your logic prevents the firmware crash.
> 
> Tested-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> 
> Could you please fold the following device ID into your quirks list for v2?
> 
> /* ShanWan Wireless Gamepad */
> { USB_DEVICE(0x2563, 0x0575), .driver_info =
> USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },

Just send a follow-on patch for this device so you can get credit for
the change?

thanks,

greg k-h
