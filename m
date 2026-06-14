Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8A11922FD;
	Sun, 14 Jun 2026 03:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781409458; cv=none; b=PzFoqDkuVhlL1QOAVuRH9HPIgurJytQ+yLslVVQyDxiI6UqVah24cSdECZuDw0hwMXENz+1dIuC/fAxQNYazKmAmmVF7vyTGX5up5vKV0tDjpVDp44CoF38oyHuEMA3oNICERJYG7MJZkG8RfyD8aJV7MPDcl3rPNOpwk6n70so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781409458; c=relaxed/simple;
	bh=r7yjRADq505QBXvHImIaO3glyuNwyccao+Ec/SZ3poI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGVJ9WMk8kL51QxnhlPN5G1+4QotBxKxIraYxhBHggGWvqb8WR3ZER7kDkP69PUIm13oX6IjvLZ4F/fQLTQZ3BlX+wCRQ4k17S2fPPa2tIXN+gFMEzwHDec4VajIeDKFzvuEXKjbR0MkgmJs02y/HAmh+cfvTQwhbM8mz0faOnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z2hjc3Rs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z2hjc3Rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395E21F000E9;
	Sun, 14 Jun 2026 03:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781409456;
	bh=w3m7lUqtndr2AnM49PR0WDEvlMBUvG2JdJA7OyDGWkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z2hjc3Rsh8+FZMu5MhzcXeimfm+paVWIZlYtE/CCl/mIlPm4VhE7qpfg6ML32Loq4
	 X5MpP6VwuBXSltXWNStq09q/kaImf6tDTBnpO2acPP8G0zYon3KFnYbCl31ADuEvUI
	 N15yrjd8SrPwvTns8HfzqcnkF8B9AFvwVHA5y0N0=
Date: Sun, 14 Jun 2026 05:56:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: apple-mfi-fastcharge: Convert to devm resources
Message-ID: <2026061448-gab-platter-199a@gregkh>
References: <20260613201851.63191-1-rosenp@gmail.com>
 <2026061403-lion-pregnant-b6e3@gregkh>
 <CAKxU2N9BLP+H6-Xvu1gX6_Z8jhowAbn60=odyssUhio6XQHmvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9BLP+H6-Xvu1gX6_Z8jhowAbn60=odyssUhio6XQHmvQ@mail.gmail.com>

On Sat, Jun 13, 2026 at 08:45:02PM -0700, Rosen Penev wrote:
> On Sat, Jun 13, 2026 at 8:41 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Jun 13, 2026 at 01:18:51PM -0700, Rosen Penev wrote:
> > > Use devm_kzalloc(), devm_kasprintf(), and devm_power_supply_register()
> > > to let the driver core handle resource cleanup. This allows removing
> > > the mfi_fc_disconnect() function and the error labels in probe.
> >
> > Please don't do this on old drivers unless you have the hardware to test
> > that the change worked properly.
> iPhones? I have those. I also have a USB power meter.

And did you test this change out with all of that?  If you do, please
say so.

But again, there is no need to change existing code to use devm_* calls
unless it fixes a bug.  devm can be tricky and is not always a good
idea.

thanks,

greg k-h
