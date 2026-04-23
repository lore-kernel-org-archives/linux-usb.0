Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBE21F8AC5;
	Thu, 23 Apr 2026 05:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776922664; cv=none; b=GklJvAx2r14Z7J0ssUJDY6/qDnoCp/TFcZEAU618YCsVz+ie+SCHaS1whfM4FCVL7kaoTcEDPUVLJNp5lRHmqyaClJpBjFgzmM17cQuarCQ+AzK5ZSZGmGd6Vsi/hc09tzTICuCUp/rsSIJYcrHhl6TL1BibTPnQtH6/tjXVN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776922664; c=relaxed/simple;
	bh=RLaxu+jzommh9hxoAa0X08by/eNE2hioT5krWwYB6WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTI1VWN91KgpyaJvWDYWQMVA9MXLNPKvKxBDMmdznQGLzh6HORDzrL0ANr4qhxKijyYMAOW75ZNbR4JNmnpxz0QEp0LlupNO6Vt5MhLWlQbU4D9hpx1qFHlqPXjE5aRLe56H4Al6RKXKBhN5qtACIJ7x8CCaKaHn7JH9QB//xSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wxMot4BB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wxMot4BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17C0C2BCAF;
	Thu, 23 Apr 2026 05:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776922664;
	bh=RLaxu+jzommh9hxoAa0X08by/eNE2hioT5krWwYB6WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wxMot4BBlMQOtks2VWe326WZZ4aRwVM1Lb4rVG4Ta9tN2uEk1yHFYFEgAvuleBsS8
	 vN6kZnT56L9pBhLsRJ00zSCUmjXYDDkwCr2qS15iBsb+Pyw9w9l1t1bCcHokCqm/Bi
	 MUCQYtI4YCS5sbl+GW16vMJrxPtRlfFmc4BoElgg=
Date: Thu, 23 Apr 2026 07:37:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Heitor Alves de Siqueira <halves@igalia.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
	syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com,
	stable@kernel.org
Subject: Re: [PATCH] usb: usbtmc: Allocate enough space for interrupt-IN
 buffer
Message-ID: <2026042305-automated-unaudited-ef5c@gregkh>
References: <20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com>
 <20260423073307.2b81543c.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423073307.2b81543c.michal.pecio@gmail.com>

On Thu, Apr 23, 2026 at 07:33:07AM +0200, Michal Pecio wrote:
> On Wed, 22 Apr 2026 19:22:09 -0300, Heitor Alves de Siqueira wrote:
> > The USBTMC driver allocates the Interrupt-IN buffer according to the
> > wMaxPacketSize value obtained from the USB endpoint. If a USB device
> > advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
> > or an endpoint constructed by syzbot), the buffer will not have enough
> > space for the mandatory headers and will trigger an out-of-bounds read.
> > 
> > Fix by ensuring the driver will allocate at least enough space to fit
> > the headers for Interrupt-IN packets (bNotify1 and bNotify2).
> > 
> > Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
> > Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2
> > Cc: stable@kernel.org
> > Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
> > ---
> >  drivers/usb/class/usbtmc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
> > index bd9347804dec..22efa74008f8 100644
> > --- a/drivers/usb/class/usbtmc.c
> > +++ b/drivers/usb/class/usbtmc.c
> > @@ -2452,7 +2452,7 @@ static int usbtmc_probe(struct usb_interface *intf,
> >  		kref_get(&data->kref);
> >  
> >  		/* allocate buffer for interrupt in */
> > -		data->iin_buffer = kmalloc(data->iin_wMaxPacketSize,
> > +		data->iin_buffer = kmalloc(max(2, data->iin_wMaxPacketSize),
> >  					GFP_KERNEL);
> 
> This changes OOB read into uninitialized memory read, which syzbot
> may complain about again next week.
> 
> More reliable fix would be to reject such devices if they are illegal,

That's the best thing to do.

thanks,

greg k-h
