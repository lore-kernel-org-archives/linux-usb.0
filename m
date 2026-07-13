Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF34A3E5A39
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936940; cv=none; b=QtXJKfa2+N7jp5Fl2Ugj0ksEhXLSDpGtuoJlubyG8uu81mNvO5yN9+AGQz8BV3PY/x+V8O/d4pzoSi8au+Y5M0ac1vuv4P5ptKLZ8LUae2oojLTWtWaDjAQmvLe0SdcE25anLzpF6qMAu3Fz99oI4fBUf0WGfSSTsNh9wuBe/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936940; c=relaxed/simple;
	bh=aTDiNkhENYGj01SwpO0+l7TdXCIcvwTSpB/uEg+vDPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO0IWI0gfJGKRHUaaspBWISOigmCSzqmevaHaGTLCO6qaQun8t8PAYzows+b0hMcUSOxB9jNVf8vvormIkMszFkiEgSvY/KFP8wIX+pyURWXQHYXzOjLCuYaARR8gX2cjt5M375Sa/C5RufkAmFVrhB2zlrjqyQqAHOySLnznWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6EWXljG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6EWXljG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA511F000E9;
	Mon, 13 Jul 2026 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783936936;
	bh=HKqKDHbnfaGii4eJt86RC3edE9Tun4UeySmeR+kheLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6EWXljGdKEaxbKI8i63EKUkUb2UJW4aKshXNfwS1g2XgNd8wiRnE5N/tDBhPpG+R
	 7dGfUjt2PKnEchtlQAHsyWMl4mKxEFFYeY8Is0v8w0kEa6qF4LEx86LP90wkE4tQIu
	 moI/KF5rv6r1biNV40vYHOHWld6tIKAI5uBbV8X0ZjNDaxWAyszWQeLFQhHhK7jmBU
	 Ey/qTaye6TGoqyqdJ7wx/E1Za6HKNngl2tLO0Ot4rM874DKoJQ37eBvv06wqn70UO0
	 5kP4KH4wGieMJ6hxN90uURWBvUnRIyQ/njBlVJcc66yDEl5ug5IYiZvABy9vhTc90U
	 j32dZr3d+PwDQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjDUM-00000004xy2-0dj8;
	Mon, 13 Jul 2026 12:02:14 +0200
Date: Mon, 13 Jul 2026 12:02:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiale Yao <yaojiale02@163.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: fix slab out-of-bounds read in interrupt
 URB callback
Message-ID: <alS3pmrV-FwEsVvA@hovoldconsulting.com>
References: <20260712170012.3503601-1-yaojiale02@163.com>
 <2026071325-onward-sabotage-13e8@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026071325-onward-sabotage-13e8@gregkh>

On Mon, Jul 13, 2026 at 08:30:38AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 13, 2026 at 01:00:12AM +0800, Jiale Yao wrote:

> > @@ -2672,6 +2672,13 @@ static void option_instat_callback(struct urb *urb)
> >  			dev_dbg(dev, "%s: NULL req_pkt\n", __func__);
> >  			return;
> >  		}
> > +
> > +		if (urb->actual_length < sizeof(struct usb_ctrlrequest) + 1) {
> > +			dev_dbg(dev, "%s: short interrupt transfer: %d bytes\n",
> > +				__func__, urb->actual_length);
> > +			return;
> > +		}
> 
> Close, shouldn't this be rewritten to be:
> 
>                if (urb->actual_length < sizeof(*req_pkt) + 1) {
>                        dev_dbg(dev, "%s: short packet %u\n", __func__,
>                                urb->actual_length);
> 
> As that's the structure you need to care about instead?

The load uses sizeof(struct usb_ctrlrequest) currently so I think it's
fine to use that in the length check as well.

But looking at this again, the check should be split in two: one for the
struct usb_ctrlrequest header and one for the modem signal state (inside
the conditional).

Johan
