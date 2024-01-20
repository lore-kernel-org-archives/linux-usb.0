Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 578F2DDD4
	for <linux-usb@vger.kernel.org>; Sat, 20 Jan 2024 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705762823; cv=none; b=T3kfbtJiWH9WCQbuo73eVtz/g3oTp1tNftWPSVw806NGCvMcbJlwhR1FyqEoKUCV/aAKXlpd94w7z3BgUHbZVg5+5Q/a1vL+wuUhqY3hkKOsppXYZMNN9YXqPD4yksmGjj4J9y3EOGXcvcZHj1tZakTihgfghw6L6/C32VW0W/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705762823; c=relaxed/simple;
	bh=mau390h+a9/rzDtz9ER9kcOnwSwoj5M/IdcDcizi1qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt49cV4ClypA3ha39RoLNOZnNX1SB8zo7R+i6MXivVjz9VFX5PUDnA6hfti7qzH9ketV6ljYGXlQoEiMe8/GDfRyXcIzamse8GVIF5OAOGBxWnwCsnOGP8WizCMvNMj6m7lV56AI3QSaV9AFX1QOT44pFpRre1AdSrCGHkZ3gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 75572 invoked by uid 1000); 20 Jan 2024 10:00:18 -0500
Date: Sat, 20 Jan 2024 10:00:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: yuan linyu <yuanlinyu@hihonor.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
Message-ID: <41dc2889-c087-4179-88a5-9af80064aa2b@rowland.harvard.edu>
References: <20240119054813.2851201-1-yuanlinyu@hihonor.com>
 <9a483f40-83ef-4476-b94c-21506d94653a@rowland.harvard.edu>
 <20240120011149.fbrbunf4l7deckek@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240120011149.fbrbunf4l7deckek@synopsys.com>

On Sat, Jan 20, 2024 at 01:12:04AM +0000, Thinh Nguyen wrote:
> On Fri, Jan 19, 2024, Alan Stern wrote:
> > On Fri, Jan 19, 2024 at 01:48:13PM +0800, yuan linyu wrote:
> > > When write UDC to empty and unbind gadget driver from gadget device, it is
> > > possible that there are many queue failures for mass storage function.
> 
> That's expected right?

Certainly.  And not just for mass storage; for other gadget drivers too.

> > > The root cause is on platform like dwc3, if pull down called first, the
> > > queue operation from mass storage main thread will fail as it is belong to
> > > another thread context and always try to receive a command from host.
> > > 
> > > In order to fix it, call gadget driver disconnect callback first, mass
> > > storage function driver will disable endpoints and clear running flag,
> > > so there will be no request queue to UDC.
> > > 
> > > One note is when call disconnect callback first, it mean function will
> > > disable endpoints before stop UDC controller.
> > 
> > Exactly.  So instead of getting a bunch of errors on the gadget, now 
> > you'll get a bunch of errors on the host.  I don't think that's any 
> > better.
> > 
> > Why don't you change the dwc3 driver instead?  If it allowed ep_queue 
> > operations to succeed while the pull-up is off then this problem would 
> > go away.
> > 
> 
> I don't think we should do that either. When pullup off occurs, the
> device is disconnected for dwc3. usb_ep_queue() doc noted that we
> should return error on disconnection.

Oh yes, so it does.  Okay, forget that idea.

>  Beside, it will add unnecessary
> complication to dwc3 handling this.

How about instead just reducing the visibility of these error messages 
to make them less annoying?  They aren't very important, after all -- 
they don't indicate that anything has gone seriously wrong.

Alan Stern
