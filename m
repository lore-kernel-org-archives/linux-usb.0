Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5F3E5EFE;
	Fri, 17 Jul 2026 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281736; cv=none; b=o+yMFi/fHbIZvWUHDvJMKPkpsP9zJJU+gGFOPAEz2EnLPoqFQQhVO0lbQmZJKpvbTPDiUVteHuvyvSXTmFyZBl4q7iA0MxM11SWLcmgyz/vMB2Wtw2JUH92m3lWM4R5ymXkEKDNjjI9M5Km1ZccUrfOIdkz6RWZjpDUCXcIadd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281736; c=relaxed/simple;
	bh=iqpwM0vKXNxtX2iX2L4J+wT058uiUWYX/hFd7MUbD0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3F3xKGvYwpwtgyN9r7DfnQy1bYqo3taZQJhUUYgDhE+y5dofNFxrcK9iOHjfpRWVwYkatpWYYq8RWqwzguPfrfRdMq5bCH2TQi1gsd+T6kmW3UoPTM/TjkFC6bmfmjSTaXHluADTaUYUE9P0p5RaqJVDMmJ6O0AlH0Tioumz6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a2mOb6O6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a2mOb6O6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49BF1F000E9;
	Fri, 17 Jul 2026 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784281734;
	bh=4cqu0rkeLeh6LKa9vAmpoU7rjBhCPn8cvqECvRDDhTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a2mOb6O6L11bHXYBU3nbfWYvAuIzy0v/FgGEEWBvktzHHxw1XyteG3ZgCkvmJtwmn
	 Y6E2CLsj8LcrvUWRf4ZH36/g/NENRUr+nOCRFLN1D46InNz/Pp0E8aLlOfi/07xE8U
	 aZmMdaE6JaiNF2PSSC95L/fGtSxDC25i2+fDyvvo=
Date: Fri, 17 Jul 2026 11:48:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Strengthen error handling in hub_hub_status()
Message-ID: <2026071717-richness-opossum-b855@gregkh>
References: <20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com>
 <f66a5507-5e83-424f-9c11-15b1882be499@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f66a5507-5e83-424f-9c11-15b1882be499@rowland.harvard.edu>

On Tue, Jul 14, 2026 at 12:32:06PM -0400, Alan Stern wrote:
> On Tue, Jul 14, 2026 at 11:04:33AM +0200, Griffin Kroah-Hartman wrote:
> > Add additional error handling after the call to get_hub_status() in
> > hub_hub_status().
> > 
> > get_hub_status() uses usb_control_msg() which does not verify that the
> > message is the correct length, substituting it for
> > usb_control_msg_recv() would also solve this issue but increase memory
> > allocations.
> > 
> > Instead, error handling is copied from the method used in
> > hub_ext_port_status(), which shares the same flow of logic as
> > hub_hub_status().
> > 
> > Assisted-by: gkh_clanker_t1000
> > Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> > ---
> >  drivers/usb/core/hub.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 5262e11c12cd..0d2166b8923a 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
> >  
> >  	mutex_lock(&hub->status_mutex);
> >  	ret = get_hub_status(hub->hdev, &hub->status->hub);
> > -	if (ret < 0) {
> > +	if (ret < sizeof(hub->status->hub)) {
> >  		if (ret != -ENODEV)
> >  			dev_err(hub->intfdev,
> >  				"%s failed (err = %d)\n", __func__, ret);
> > +		if (ret >= 0)
> > +			ret = -EIO;
> 
> It would be better to put these two lines above the preceding test.  
> That way it won't print confusing things like "hub_hub_status failed 
> (err = 2)".

It is confusing, but it matches the other check for this same error in
hub_ext_port_status() as it's the same error condition.  How about this
patch happens first int he series, which "unifies" them, and then fix up
both of the patterns at the same time to be more clear in a later patch
in the series?

thanks,

greg k-h
