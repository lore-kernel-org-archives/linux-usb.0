Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE44CC26C
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545001; cv=none; b=ikBfBanfCdjYgBk+TqyWBDNgt/W8WAVzSTuW8FnWzYANHCbSCfaccWLbNm07FMl+fGANaznTZB9AcMagFiCMYCHUUGhOSMpRIR24IIFMEA1DXH2mVE59TYnHWjpv4JYDHKAn2yKjxv6nx5bxTzrTBvs3wnV33Nm1X5dOKu1gwCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545001; c=relaxed/simple;
	bh=lI8Uvy3dlPBAkNFMpdOtBIS83cT+krO+RKbFhJ0kuA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oERxEj2jDfuLhKEkT6vWfX2z3+AEr2mjkfJ9fw0bwVYPfgYXa8sM9VDpAYvNhS7W7tFaN4nsHQXGy2xu0eway7++tiD5JGhlogmSZ27CHX24rIDyut5L4duEBYp07HkFCVlk97d7CgSCwXaPq1SybHXcs/OVF7ldOp1kN3bWz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eQKroPYq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eQKroPYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143C71F000FF;
	Fri,  9 Oct 2026 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791544993;
	bh=n13pBVK+G/5Aoi0dUhNaNs576EPNIdAMeQDrQz/Xeqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQKroPYqRD9Xfja6Oqdbjv7RDQqyhiZ67H3nojf9lI6p7t16Pz++EmygdiNpv4Ru7
	 IcszVPw4XZ/hsr/pzdTaZ0/ZCUaK4YvJHIbYT+NObHS/eveWhE/nvnmJShpEha75qC
	 /9ize2mn/YCsZgA9JrNOFi+O1rVufG4NPb/ntO4Y=
Date: Fri, 9 Oct 2026 13:23:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Sang-Hoon Choi <csh0052@gmail.com>,
	Changyul Lee <lcy8047@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 06/14] xhci: dbc: lock the minor IDR on registration
 failure
Message-ID: <2026100955-unclothed-subplot-626b@gregkh>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-7-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165207@kernel.org>
 <2026100949-scuttle-cradling-0371@gregkh>
 <2026100958-simple-evasion-4048@gregkh>
 <85fc10ab-d718-4a94-bf46-fb60ac2dfbbe@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85fc10ab-d718-4a94-bf46-fb60ac2dfbbe@linux.intel.com>

On Fri, Oct 09, 2026 at 02:16:44PM +0300, Mathias Nyman wrote:
> On 10/9/26 13:52, Greg KH wrote:
> > Resending with the proper people in cc...
> > 
> > On Fri, Oct 09, 2026 at 12:51:41PM +0200, Greg KH wrote:
> > > On Fri, Oct 09, 2026 at 10:13:10AM +0000, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > - [High] usb: xhci: dbc: UAF due to premature IDR exposure and missing TTY hangup on error path
> > > > --
> > > > 
> > > > commit 99c18a1b8449e8389ccac896ceadcc979dbd6a57
> > > > Author: Sang-Hoon Choi <csh0052@gmail.com>
> > > > 
> > > > xhci: dbc: lock the minor IDR on registration failure
> > > > 
> > > > This commit fixes a race condition during DbC TTY registration failure
> > > > by adding mutex protection around the removal of the minor IDR entry.
> > > > 
> > > > > diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
> > > > > index 3d51e8d82659d..2249cc16800cc 100644
> > > > > --- a/drivers/usb/host/xhci-dbgtty.c
> > > > > +++ b/drivers/usb/host/xhci-dbgtty.c
> > > > > @@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
> > > > >   err_free_fifo:
> > > > >   	kfifo_free(&port->port.xmit_fifo);
> > > > >   err_exit_port:
> > > > > +	mutex_lock(&dbc_tty_minors_lock);
> > > > >   	idr_remove(&dbc_tty_minors, port->minor);
> > > > > +	mutex_unlock(&dbc_tty_minors_lock);
> > > > >   err_idr:
> > > > >   	xhci_dbc_tty_exit_port(port);
> > > > 
> > > > [Severity: High]
> > > > Does this error path leave concurrent TTY sessions pointing to freed memory?
> > > > 
> > > > Earlier in xhci_dbc_tty_register_device(), the port is added to the globally
> > > > visible dbc_tty_minors IDR before internal structures are fully allocated:
> > > > 
> > > > 	mutex_lock(&dbc_tty_minors_lock);
> > > > 	port->minor = idr_alloc(&dbc_tty_minors, port, 0, 64, GFP_KERNEL);
> > > > 	mutex_unlock(&dbc_tty_minors_lock);
> > > > 
> > > > A concurrent open() on the device node routes to dbc_tty_install(), which
> > > > retrieves the port and installs the TTY without verifying port->registered:
> > > 
> > > I don't think we need to worry about "concurrent open()" for this as
> > > that's not a real use case that I know of and this _should_ be root only
> > > accessable, right?
> > > 
> > > Or can normal users open this device node?
> > > 
> No risk of concurrent open as the tty device node is not yet created in this error
> path.
> 
> This error path is taken if tty_port_register_device() fails, of some other failure
> before it

Ah, yeah, no need to worry about this "issue" then.

thanks,

greg k-h
