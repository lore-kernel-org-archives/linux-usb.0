Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B5D3F84A45
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712857000; cv=none; b=NEUlBZYUHHAbFEgGjpdERhtTosSb7BmOVfYftlTF34KZ5GShxzqxW96c3yx+oN+lR4r++FopL/vDglXMmT5l2WtT8UnyQPnSdW+8VMFhlEyLH3tBDXHNQDnrwwgB3KWaLp76a/z/fiZ2wD7ZrvK1KM2vgWScLz5VJHazqFU9gWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712857000; c=relaxed/simple;
	bh=4nPq1J2OZpncP95+u16MxaN1Cq3sf992Yj0ysHslu2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryITtAaEyePH5CwlJBbujCpV8ucjtFZ4v3fpHXOb7T19SOXLpl3aii4P6Gnl1ic8roa2pW9xmMF8Kn9N5havdo1IxTfAK3dyM3ifNfB7NCOFIBsonciLspvtLcSVTGYkvznc9ZZJQlc/xAIzc24k5OyvLFJWpc2yO63SwICcjzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 253031 invoked by uid 1000); 11 Apr 2024 13:36:36 -0400
Date: Thu, 11 Apr 2024 13:36:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 2/6] usb: avoid overrunning a buffer in usb_parse_interface
Message-ID: <556d3e81-2d4c-4c55-9536-56a8a2ccf3e7@rowland.harvard.edu>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-3-oneukum@suse.com>
 <05af3e08-362f-424c-96e1-2965c55b7212@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05af3e08-362f-424c-96e1-2965c55b7212@rowland.harvard.edu>

On Thu, Apr 11, 2024 at 11:39:01AM -0400, Alan Stern wrote:
> On Thu, Apr 11, 2024 at 02:43:00PM +0200, Oliver Neukum wrote:
> > We must not touch bDescriptorType if it is not within our buffer.
> > To guarantee that we have to be sure the first two bytes of the
> > descriptor are within the buffer.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > ---
> >  drivers/usb/core/config.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> > index c7056b123d46..5891652b6202 100644
> > --- a/drivers/usb/core/config.c
> > +++ b/drivers/usb/core/config.c
> > @@ -575,7 +575,7 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
> >  
> >  	/* Parse all the endpoint descriptors */
> >  	n = 0;
> > -	while (size > 0) {
> > +	while (size >= sizeof(struct usb_descriptor_header)) { /* minimum length to get bDescriptorType */
> >  		if (((struct usb_descriptor_header *) buffer)->bDescriptorType
> >  		     == USB_DT_INTERFACE)
> >  			break;
> 
> I would omit the comment (the point seems pretty obvious even though I 
> never noticed it before), but there's nothing wrong with having it.
> 
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

I take this back.  The checks performed by usb_parse_configuration() 
make this unnecessary.

Alan Stern
