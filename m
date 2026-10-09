Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDDB4C2240
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543157; cv=none; b=eqcnlIWQPXD5JWKi+tgPvXxFffB6Y+w4O8yWAY5+B08eRI8ykaqqwklveaNJuBrEay7pLoLZp2iQjnwbzJXwQ/CEJcXAaNWvA6z/x+dXsxhsFr4R6fqJ46qGgtWcKGqH8EPb2S1GaFvISkcbYrE+mLxVsQy58Ger/nBT6RtuaxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543157; c=relaxed/simple;
	bh=LMcD7qUndBbw0fNST1F+Pr/+tOF7VikM/D2rrubPiq0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8UghSNO4gkR1zm4phSIE2B3vTtxRF1t1GW9biS7VJeAZCG8+NZFAs/xX36ltT3PdwwIK2AM7gjZxE/1iH7QcIHqBK8GorVgzpYiXaQMdp9T7sHkqLOchVjVjUi7ioPORXIjW/i7PPiLKLl25SF8f2bjnJmGjqG4lfmxsmDnHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W+/5o+cC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W+/5o+cC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0AD1F000FF;
	Fri,  9 Oct 2026 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791543148;
	bh=eQ9FnWaEJjxO/pRLFt1KtBxdg91Ll1XOqZXLklpOKec=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=W+/5o+cCdxh2iq4u8bZtTvTBSiKuO/dy2f0ClaCxg6R4SUFK8BWURpV/JVvMSFqyP
	 A4g4Po7ZxabYK6E+0iKlk13XhthxtDDio790MEu5bLlB7NsUvb+KxVq4Yh97XTRwgq
	 c+FmFUQ7NPrcNihJRizH/J3FaCSVorq7Rgk7aoq8=
Date: Fri, 9 Oct 2026 12:52:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org, Sang-Hoon Choi <csh0052@gmail.com>,
	Changyul Lee <lcy8047@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 06/14] xhci: dbc: lock the minor IDR on registration
 failure
Message-ID: <2026100958-simple-evasion-4048@gregkh>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-7-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165207@kernel.org>
 <2026100949-scuttle-cradling-0371@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100949-scuttle-cradling-0371@gregkh>

Resending with the proper people in cc...

On Fri, Oct 09, 2026 at 12:51:41PM +0200, Greg KH wrote:
> On Fri, Oct 09, 2026 at 10:13:10AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] usb: xhci: dbc: UAF due to premature IDR exposure and missing TTY hangup on error path
> > --
> > 
> > commit 99c18a1b8449e8389ccac896ceadcc979dbd6a57
> > Author: Sang-Hoon Choi <csh0052@gmail.com>
> > 
> > xhci: dbc: lock the minor IDR on registration failure
> > 
> > This commit fixes a race condition during DbC TTY registration failure
> > by adding mutex protection around the removal of the minor IDR entry.
> > 
> > > diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
> > > index 3d51e8d82659d..2249cc16800cc 100644
> > > --- a/drivers/usb/host/xhci-dbgtty.c
> > > +++ b/drivers/usb/host/xhci-dbgtty.c
> > > @@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
> > >  err_free_fifo:
> > >  	kfifo_free(&port->port.xmit_fifo);
> > >  err_exit_port:
> > > +	mutex_lock(&dbc_tty_minors_lock);
> > >  	idr_remove(&dbc_tty_minors, port->minor);
> > > +	mutex_unlock(&dbc_tty_minors_lock);
> > >  err_idr:
> > >  	xhci_dbc_tty_exit_port(port);
> > 
> > [Severity: High]
> > Does this error path leave concurrent TTY sessions pointing to freed memory?
> > 
> > Earlier in xhci_dbc_tty_register_device(), the port is added to the globally
> > visible dbc_tty_minors IDR before internal structures are fully allocated:
> > 
> > 	mutex_lock(&dbc_tty_minors_lock);
> > 	port->minor = idr_alloc(&dbc_tty_minors, port, 0, 64, GFP_KERNEL);
> > 	mutex_unlock(&dbc_tty_minors_lock);
> > 
> > A concurrent open() on the device node routes to dbc_tty_install(), which
> > retrieves the port and installs the TTY without verifying port->registered:
> 
> I don't think we need to worry about "concurrent open()" for this as
> that's not a real use case that I know of and this _should_ be root only
> accessable, right?
> 
> Or can normal users open this device node?
> 
> thanks,
> 
> greg k-h
