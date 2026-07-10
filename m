Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FF403AF2;
	Fri, 10 Jul 2026 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685190; cv=none; b=VbZp85181MG7CxtKMb7sVba1PED5D3B4Z4ZRgURHOZrqq6GU7rnOluENZ5GjaVN5ipF2G95G7+2ADAVoTcKZR0EEd5NWxy+2m+IKf5Zsh5vinMugoSJ0FK5EXhJXmz3+H4NTMO57qjkt3dTbFuTf2WzGMeIsOs42VxsrdPTf9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685190; c=relaxed/simple;
	bh=AyU1XPhrt2+TbwK67h1mE1eMlZaTaBhUB54MC/SEzxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVXScbyJk7DLXSenwHCAby3Xnsgy6bDG8ywCFgTcQHYf9wJ7X95Lcrb4H0VYdiduEbmzUV0WNdPFPZFdzVmijVc6IrEdKG1vlG317IwQQkOUUFRpPmPNA0GhLW6Bk2zlFqfy6xXx9MQmJJuiAVZg6LIMV8t05Z6IGuD2ExxT+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y+g7bqGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y+g7bqGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA36F1F000E9;
	Fri, 10 Jul 2026 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783685189;
	bh=0kgb1ZesGDJ1o3Sq2DUlll0Qcs7es78Z74VY7mMGHO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y+g7bqGHE4hrI+0xcHg9Dua0b7jcC0qZ7B/NmNsk2HE6qhsu5poSiMLliHUA48nlA
	 BF21Jxx7vobXV4qqrmeuuP/jx2jvbDbUSAEReG2Nu4A/U3c91tsL7G0iWqRWaWPuYJ
	 WtlgppNymbdyrKtS9Ft9rtQjAfQIToJmfngWl4kw=
Date: Fri, 10 Jul 2026 14:06:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Keshav Verma <iganschel@gmail.com>, johan@kernel.org, kees@kernel.org,
	o.bock@fh-wolfenbuettel.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: cypress_cy7c63: check control transfer status
Message-ID: <2026071038-gilled-autograph-f3b8@gregkh>
References: <20260618203053.4725-1-iganschel@gmail.com>
 <2026070835-thorn-doable-8c28@gregkh>
 <CAPE_3zK0Za9GQaCTX4ZJu4_8Qvq7=c49MXtPduUwHVzQpf1t_w@mail.gmail.com>
 <CAPE_3z+DKGJ6yKGD=E5_T+9HCMeUnFBpWdjnB12Mt8UpU4Kquw@mail.gmail.com>
 <58b55e55-652a-498a-8f36-145d9ad58e9e@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58b55e55-652a-498a-8f36-145d9ad58e9e@suse.com>

On Fri, Jul 10, 2026 at 11:53:31AM +0200, Oliver Neukum wrote:
> On 10.07.26 01:30, Keshav Verma wrote:
> > read_port() currently ignores errors from vendor_command() and always
> > returns the cached port value. This can report stale data when the USB
> > control transfer fails or returns a short response.
> > 
> > Convert vendor_command() to usb_control_msg_recv(), which returns 0 on
> > success and a negative errno on failure, and propagate transport errors
> > from read_port() instead of returning cached data.
> 
> Hi,
> 
> Thank you for making a patch for this issue.
> I am sorry, but this approach mixes issues that are real with something
> that is not a problem.
> > Fixes: 9189bfc2df0f ("[PATCH] USB: rename Cypress CY7C63xxx driver to
> > proper name and fix up some tiny things")
> > Signed-off-by: Keshav Verma <iganschel@gmail.com>
> > ---
> > v2:
> 
> > -       retval = usb_control_msg(dev->udev, pipe, request,
> > -                                USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_OTHER,
> > -                                address, data, iobuf, CYPRESS_MAX_REQSIZE,
> > -                                USB_CTRL_GET_TIMEOUT);
> 
> This does return errors.

Yes, but they are not checked properly, as your patch showed.

> > -       /* we must not process garbage */
> > -       if (retval < 2)
> > +       dev_dbg(&dev->udev->dev, "Sending usb_control_msg_recv (data:
> > %d)\n", data);
> > +
> > +       retval = usb_control_msg_recv(dev->udev, 0, request,
> 
> There is no point in this change. You just allocate yet another
> buffer for no gain.

That's not an issue, we should be moving all drivers away from
usb_control_msg() as it's used wrong so many times (like this one.)

So I think this is the correct thing to be doing here.

thanks,

greg k-h
