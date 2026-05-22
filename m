Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C9B34A3BF
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439296; cv=none; b=I1kYitHa1Lo/zCmqAzalLpUYJCEqhhLI87Hx6RuMEhNuL2QZwYJbdIkFP+f1O6Cfrlt0lWJvVZcB/gmlQZNZVdTTsbDs1EpLLbGfiZZWjB5JCFPY24tPH3uOVbFU9dPEhUDc6xNlPYdvfcsv6qtcaSxaHmJXmsNamiIg+BmVZuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439296; c=relaxed/simple;
	bh=hCzaohIPZggWH0Hqg/Rw6WGoz4U+Z+tLIcswmyLjBQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5T9NNTvwypsQAaEDaqZbesMIyWdJhVR5Qq8WWbDfV9tODK7VDnvv1PhQqNMXRSnczHaZ3RaoVtYY8ifb3N8wE+ukHu7tGj95xYHh3mbFKKkCBbXDtJlEiNIFxMBLkVEJy698/iKetZD8AzIrTTWme2iWvl6/zzzzNJ5OPprXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GtfQ9y/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GtfQ9y/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B261F000E9;
	Fri, 22 May 2026 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779439295;
	bh=cT9bqcX4l3vvjiMudlUTtnydASIccww1z+GIm/7H1KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GtfQ9y/7I+bLo/UJjLel2m8kVPOLyjKDProDhnAU9eVAylXJU4ZJ1bCl37sTC9LCy
	 4aid65xtSX/ux/F9sopuCydHSyfx9v4+K4xeD+Z5PEHhfZM4ZqjofTwnE2ZjLKbxa4
	 /Xvg38rFgK8MQXxtQRCb9uXDB8lp+wbfpQpQQ/+k=
Date: Fri, 22 May 2026 10:41:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Carey <carvsdriver@gmail.com>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com, guanwentao@uniontech.com
Subject: Re: [PATCH] USB: cdc-acm: start bulk-IN polling when
 ALWAYS_POLL_CTRL is set
Message-ID: <2026052259-cricket-vertigo-329f@gregkh>
References: <20260515130432.714861-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515130432.714861-1-carvsdriver@gmail.com>

On Fri, May 15, 2026 at 09:04:32AM -0400, Dave Carey wrote:
> The INGENIC 17EF:6161 touchscreen composite device has a ~55-second
> watchdog that resets the USB device if the bulk-IN endpoint on the CDC
> data interface goes unread.  The existing ALWAYS_POLL_CTRL quirk keeps
> the notification endpoint (ctrlurb / EP 0x82) polling continuously, but
> that alone is insufficient: the firmware monitors bulk-IN activity, not
> just notification-endpoint activity.
> 
> Add acm_submit_read_urbs() calls to the two ALWAYS_POLL_CTRL paths that
> already restart the ctrlurb:
> 
>   1. acm_probe(): start bulk reads at probe time alongside the ctrlurb,
>      so the watchdog is satisfied from first bind without requiring a
>      userspace process to open /dev/ttyACMn.
> 
>   2. acm_port_shutdown(): restart bulk reads after port close alongside
>      the ctrlurb restart, so the watchdog keeps running when the last
>      TTY user closes the port.
> 
> acm_read_bulk_callback() already resubmits each URB unconditionally on
> normal completion, so once submitted the reads remain active until an
> explicit kill (disconnect, suspend).  acm_submit_read_urb() is a no-op
> for URBs that are already in flight (read_urbs_free bit clear), so the
> existing acm_port_activate() call remains correct and races are avoided.
> 
> Tested on Lenovo Yoga Book 9 14IAH10 (83KJ): without this patch the
> device resets every ~55 s when no TTY is open; with it the device
> remains stable indefinitely.
> 
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> Tested-by: Dave Carey <carvsdriver@gmail.com>

It's implied when you sign off that you had tested, so no need to have
the tested-by.

