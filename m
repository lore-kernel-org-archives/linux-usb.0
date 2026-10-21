Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607181;
	b=grEuqSPrz2bOwUGsBlMnwrTn/Qz7jbPtGpd5r80PEfhz+jPRTrSweT74aWnxQDon2X1D
	 adl0XmzCGVcRcmwS9JI7pYNR9IYgsVOlWTTZ7C2JGh1R0SeAbiRAMdg1F1cg8x9tNAE6Q
	 FrRCfwrTkeDBgNxDhRPdC7hSSN1pSuJVTafvq/ehMayXJNL3PWJd5sSUA0WfyLK4rcCXW
	 qkpYS6FgpTw81jfs0u/uOD0dSTs7dZMuT101DKRAi3E8cpvBw3pExbQ+5kEGSqTchDChu
	 l1frCmGYz6ovHYkYFbjwUhX4Er8P31/0BHWxHVW2aMsSIfOAjTblwmlIDEWel+jogHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607181;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xiaRUTE0hkAKS4647zdvqKZw10zxKRk62kBAFhu7ETI=;
	b=xR1DLW9geywTewDf58qRadztj5sey7mrpcOz1akDsM+RhWrF5S4cYOBivqL+tJp8+JKh
	 JOfKxbHjMKBKwyRH65zyL/jjIuYPVLIbWjSfMLR/wQiVhLqfFGVWWnMJH9zxKcF/6soxT
	 7nmqbnBy902dPv+k/ximo9KiusEwZ7fXurfNkfgysyRDTOhJjqEocPGgS4/LbnQYmnhub
	 y9vytzd2J9xblbpt/9aPkLgXq9LZxWIZH0MnLZklibFeSgs0n1xeZnRBiOxvHkoHGMooV
	 yvZMsb3xgVGmLmpk5GaVYase/Utt8VGW/e+x6UAymoXlgonHOPmpY5vQRPENlO6GFrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BqIQA72T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A7606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BqIQA72T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240C31F000C5;
	Wed, 21 Oct 2026 18:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792607180;
	bh=xiaRUTE0hkAKS4647zdvqKZw10zxKRk62kBAFhu7ETI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BqIQA72TC27Um+qtsKCAHcBA1Lc7ELGyMcoW3VwVXnNCMuXgwXx4f69JWW4dskHry
	 WJUs21rb2SNZvrgFUkGBTMeLx/XzUNbdufcneMpmN84TBj/iBFk81/BCIVQmtoBWXC
	 5W9Ezibq3dbvAh9VJRk7ILOvNZlgGif4bHhUCcEY=
Date: Wed, 21 Oct 2026 20:26:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Subject: Re: Linux USB threat-model document
Message-ID: <2026102125-guide-slam-e2be@gregkh>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
 <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
 <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
 <862abc70-18ce-422c-bdf2-f02b984193c0@rowland.harvard.edu>
 <2026022617-disengage-spinning-c6bd@gregkh>
 <7480e993-b873-4ea4-ac6e-45bd22975f8a@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7480e993-b873-4ea4-ac6e-45bd22975f8a@rowland.harvard.edu>

On Wed, Oct 21, 2026 at 12:53:03PM -0400, Alan Stern wrote:
> On Thu, Feb 26, 2026 at 08:29:45PM -0800, Greg KH wrote:
> > Given that I have to answer this type of question about every other week
> > these days given the fuzzing reports we get sent to the
> > security@kernel.org alias, I think I need to just write up a "here is
> > the Linux USB threat model that we currently support" document to
> > describe what the state is.
> > 
> > We can then work from there, either agreeing that we need to "move" the
> > level of interaction for which we trust / do not trust a device in the
> > lifecycle of a USB device, or just be happy with where it currently is.
> > 
> > That should work better with some groups that I know are working to do
> > stuff to "harden" the USB device stack for some specific use cases,
> > hopefully just using the existing user api that we have today that
> > USBGuard uses, or possibly adding to that to handle some missing areas
> > that we have not previously considered.
> 
> Did you ever make any progress on writing up this document?

No, been swamped by the exponental increase in stable and CVE work :(

> Have these outside groups gotten anywhere, or identified anything that 
> the kernel should do differently?

Yes, there was a presentation at the Plumbers conference in the Android
track about this and what the Android people would like to see be done
differently in order to make this into a more secure type of a system.
The slides for that should be online somewhere and the developers there
said they would be sending patches to the list for review "sometime" in
the future.  Right now I think they have a long way to go before that
happens, but at least they are thinking about it.

thanks,

greg k-h
