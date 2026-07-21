Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5343553E;
	Tue, 21 Jul 2026 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621019; cv=none; b=T3oBdIAcmXWOdNTDtuFi0h8JSsZWHN6sdsJiQb9eEG1xJ/53eED6AmHEbJzPmD+zkcJMlFfDjfCYPgt0+E2EtuUJwrbZFF+PtUjXlXP6q+MX0Ebopg8FRFt3HKAq/gnSYwoTFSM3FwwbIb0Kp7w39YsIJ8njibiwG5LPatHfgnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621019; c=relaxed/simple;
	bh=RIA91nt9VWpvt5I2cVVz5LXty8Ng3GITexqKzE7p8Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fm2/fOv49+jb9IJCozO7em4P76OBRmgkzkW+TvA/0YLqM0piztuJF4WS785xqJofekFPhDfoaspDcVUR1OLl8isVdyK9GtMN6VEHa9um67JY/YrYMKQGbflqUc27ddH/+aIr1VEIg4j3Amar2V0wIN8RXIfdqD3RASWRF50cPiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjN1DPBL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjN1DPBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD461F000E9;
	Tue, 21 Jul 2026 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621018;
	bh=HUYs/Ob+ASc+HhkW0GMSvxRWsc8l0brHegTeCxiUikU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jjN1DPBLygNW48DKwbfHWlWbTNe+d+X0RU3/g8PsnFV7MASHyxK50WSooKHoC3rfY
	 G8G1/by1z9mPqctKyMNRAezDveFwoQXr3/mZRBkxiK7Bhe9uBO5t6IBJFK5gPjIfIj
	 hgqaTAU65/gZh4NYlhFHbjgSLGmauuI7UKY2mNOYa7PlgU5wuQoLsJwZp8j6BKne5k
	 CpewCIfc/s6ktCsMtFVfVFpVGI69M6RRjWSC5bA+Pier8uhpLpcosGVVcozWsCWvoW
	 briZtCeIaAwda9Be8hedl7fP+hl4+BXUwTvQFaYYqMcLAtSx7DWqodf/xegjchdJD7
	 Gc1NQpTXeQOhg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wm5Rv-00000008wCV-3ENz;
	Tue, 21 Jul 2026 10:03:35 +0200
Date: Tue, 21 Jul 2026 10:03:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: Re: [PATCH v3 2/2] USB: serial: ftdi_sio: make explicit
 latency_timer sysfs write authoritative
Message-ID: <al8n17rIPduwjphv@hovoldconsulting.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com>
 <cover.1782201674.git.naveen.reddy@ftdichip.com>
 <c1956d7641cd96f75cf2534b65fe9a83d0941e50.1782201674.git.naveen.reddy@ftdichip.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1956d7641cd96f75cf2534b65fe9a83d0941e50.1782201674.git.naveen.reddy@ftdichip.com>

On Tue, Jun 23, 2026 at 04:03:21PM +0800, Chinna Mopurigari Naveen Kumar Reddy wrote:
> write_latency_timer() clamps the value programmed into the FT chip's
> per-channel latency_timer register to 1 whenever ASYNC_LOW_LATENCY is
> set in priv->flags.  ASYNC_LOW_LATENCY is set by userspace via
> TIOCSSERIAL, used by setserial(8), libftdi and certain tcsetattr
> paths.  The interaction with the existing sysfs latency_timer
> attribute is surprising: once any of those tools has set the flag, a
> later write of "16" (or any other value) to
> /sys/bus/usb-serial/devices/ttyUSBx/latency_timer is silently
> clamped to 1 and never reaches the chip.
> 
> The store path is the most explicit way userspace can ask for a
> particular latency_timer value; treat it as authoritative.  On an
> explicit sysfs write, clear ASYNC_LOW_LATENCY before calling
> write_latency_timer() so the requested value is what the chip
> register actually receives.  The override is logged at debug level
> (dev_dbg) for diagnostics only.
> 
> Reads continue to honour ASYNC_LOW_LATENCY (returning "1") so any
> userspace that previously inspected the attribute to confirm
> low-latency mode keeps working until it does its own explicit write.

No, I don't think we should be changing this now.

The driver has behaved this way since 2009 and commit 557aaa7ffab6
("ft232: support the ASYNC_LOW_LATENCY flag") which explicitly let the
standard setserial interface override the "obscure chip specific"
interface.

Also note that the value written to sysfs does take effect once the
low-latency flag is cleared so we can't really return an error like
-EBUSY either.

I don't know how libftdi uses the flag, but it generally would not even
be set unless you explicitly set it using setserial.

Perhaps you can send a fix to libftdi so that it uses the sysfs
interface directly and leaves the flag alone if that's the library
that's causing the flag to unknowingly be left set.

Johan
