Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B922F7EF5;
	Tue, 19 May 2026 23:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779234415; cv=none; b=uyt4zIVEU2OuQXO6VYXdQcVjxA/0tcxTEomSapgTHXORj2otb03OsjFGijWb2lYPklZ9f4buBQ+J7LT+wWdIeYz7HUPihVfeZiMOMddWAKILhBEQMut4Ut3wsoxwR/aY+G170ibXn6nQpfyIuvvtQzF9xraTNt+4jhslu/PZ6aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779234415; c=relaxed/simple;
	bh=XsiuPtPRwaxzvTGyySPehnZ7QMSsYVa8uYL2zCuRdho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DR6lynPHfMndk1zYPYf4qHLnofQ7HZKHcoyjJalBBbpfgHueBLygxmUeQ4089gsA3C+NaPfk9mCMok1AmjEv3N1owvLlkgV2Bxuu5+ntwqnCNsv1/ZRXugm0+IDZosDM0sDZgJNgNKRVpGTp3QofTsme7E9XgGdI7FIxvn25xPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpW1JRH9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpW1JRH9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288041F000E9;
	Tue, 19 May 2026 23:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779234414;
	bh=jaku3RCnOdF0UujNxO7bB0eea0+IwxoW3ela6XHDfDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gpW1JRH9gcNnrqiDj5tbvjuwDEpXHQxj1UrGnYqvRcvt95e9tpM1blt1mSZw+QRRI
	 Tji/jI1tUKy4/6gpT5rSvjyiRCeBeFuIPDDF3HrhW4I84K0+QkrqrMLfSjXKjE65Z/
	 1hF36d2729Ie0kyKeTMBk8WXUjpzsqgYTRe4ryopmHvLY5k9z3aRg4Dcp7+CisV4PC
	 vda0FAxK9WKz+MwhK6I8MDw3WTh3IC3diaqbRSzyiZUMvTWb6ajn6+xhHRBEFhCA8Z
	 J2GrtmLbvdzs5QoPROLfOLSA9qbvmbQeAowuF35Ji6oQFkCFTZBwOFZAK9gYTn160N
	 VAlKEpZHK+2dg==
Date: Wed, 20 May 2026 07:27:45 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: remove useless check of !chan
Message-ID: <agzx8caQJEduwvS4@xhacker>
References: <20260519060001.13199-1-jszhang@kernel.org>
 <2026051917-deceiver-monthly-cb22@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026051917-deceiver-monthly-cb22@gregkh>

On Tue, May 19, 2026 at 11:27:55AM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 19, 2026 at 02:00:01PM +0800, Jisheng Zhang wrote:
> > It looks a bit strange we check !chan after dereference of this pointer
> > with "if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL)".
> > 
> > In fact, when entering the dwc2_hcd_save_data_toggle(), the chan won't
> > be NULL, because its caller or indirect caller has ensured this,
> > specifically, it's checked with below line in dwc2_hc_n_intr()
> > 
> > if (!chan) {
> >     dev_err(hsotg->dev, "## hc_ptr_array for channel is NULL ##\n");
> >     return;
> > }
> > 
> > This addresses the following issue reported by klocwork tool:
> >   - Suspicious dereference of pointer 'chan' before NULL check at
> >     line 518
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/usb/dwc2/hcd_intr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
> > index 5c7538d498dd..397c63393c7f 100644
> > --- a/drivers/usb/dwc2/hcd_intr.c
> > +++ b/drivers/usb/dwc2/hcd_intr.c
> > @@ -515,7 +515,7 @@ void dwc2_hcd_save_data_toggle(struct dwc2_hsotg *hsotg,
> >  	u32 pid = (hctsiz & TSIZ_SC_MC_PID_MASK) >> TSIZ_SC_MC_PID_SHIFT;
> >  
> >  	if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL) {
> > -		if (WARN(!chan || !chan->qh,
> > +		if (WARN(!chan->qh,
> >  			 "chan->qh must be specified for non-control eps\n"))
> >  			return;
> 
> Can this ever actually happen?  If so, the machine just rebooted as
> almost all devices with this hardware in it run with panic-on-warn
> enabled.  If not, can you fix this up to properly handle the error and
> return correctly and not crash?

Good question! The WARN was introduced by below commit
62943b7dfa35 ("usb: dwc2: host: fix the data toggle error in full speed
descriptor dma"
IMHO, it can't actually happen. And indeed, WARN() usage isn't
suggested in drivers, let me remove the WARN usage in v2

Thanks for the kind review
