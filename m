Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7388372062
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920394; cv=none; b=NoJN3svlUWufeylDBLDVfm4+rSNy3/sbSwkw7pXqSvzKWxs8S+O99CKckBe3M9HKdUn/5JxdJUs5RLXtMeHWwalnKjYBumMAgJ6aXNacSoJk11x2odEscWHlJv/19j5PUshKvGHlS/jYAhXkGd4LIIyZ16Mit1nQIQ8azcconbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920394; c=relaxed/simple;
	bh=jyc6huVJaU5WB7QvUZ905/hrFXZAFwCsJ4eQL2XHHr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9uNmKQiIiTcZV/gB1ZeyrytyN8t0s7zM2NTnWuSg36FWn/lg0WZcIMmbCxAjbV0dFEcC1WLe+dfukdQx7ogAvAeabQEOQZKaH784XccnFtHaj6uoDdAnNrBsjofTLPO+9gMU2RKaRsKBJkrX3pTsLbJxtlJ4YevWhq1xuw26oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIZxZN4E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIZxZN4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8D11F00893;
	Mon,  8 Jun 2026 12:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920393;
	bh=/8N2vPebXi2HL4F++GQ4X+RvUQLnAiGRCw5XRUeBPqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FIZxZN4EDj7C6JitaPm6MIaB+efZwhQnm21+RNf5i+q/UGXIXPJ/YKBcuF7xIhFV0
	 oAWoqqT+e+PtFgW8KuLTYNYXJ2HE7uHXNCmJDLdam3QeVHF/i1001g7azzscos033N
	 5WMj9LS/677AQ+830YohTp02QxvfUO/aePH+dyKb5hQOtFezpVZpBhHg7IDL5Bsy4I
	 5ujasuT1OS+Qjt6/ucN5yUx+7upzVEEnHize9dE1HJrCRD7QoVx4xC7erePz5Q9oY0
	 7+YU0yaJbz2CZVjcMp8ArN35XWFEHYas7ta3tvoyFYgeo6EUIpRApvGkiE+5Kk+B4T
	 SDMtSogj0aA0A==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wWYkR-00000002MSs-0jle;
	Mon, 08 Jun 2026 14:06:31 +0200
Date: Mon, 8 Jun 2026 14:06:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw
Subject: Re: [PATCH v2] USB: serial: pl2303: add new PID to support PL256X
 (TYPE_MP)
Message-ID: <aiawR-8K5HMhMTXN@hovoldconsulting.com>
References: <20260326123023.1711-1-charlesyeh522@gmail.com>
 <ah7j_HxoAQA-vZrr@hovoldconsulting.com>
 <CAAZvQQ6O4p35Xs2hVYaoJxD4D7U0YonsdweuPh6W8RQVhvoUNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ6O4p35Xs2hVYaoJxD4D7U0YonsdweuPh6W8RQVhvoUNw@mail.gmail.com>

On Mon, Jun 08, 2026 at 06:18:19PM +0800, Charles Yeh wrote:

> > > --- a/drivers/usb/serial/pl2303.c
> > > +++ b/drivers/usb/serial/pl2303.c
> > > @@ -54,6 +54,7 @@ static const struct usb_device_id id_table[] = {
> > >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
> > >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
> > >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
> > > +     { USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_4P) },
> >
> > Which devices is this? PL2533 (0x2533)?
> >
> > What about the other variants you mention above (PL2543, PL2565)? Do
> > they use separate PIDs?
> 
> PL256X_PRODUCT_ID_4P is for the PL2533 device, which uses PID 0x2533.

Shouldn't you name the define accordingly? That is something like

	PL2303_PRODUCT_ID_PL2533

with a common (driver) prefix and a product name. "4P" sounds too
generic to me.

[ The older ones where all variants of PL2303 so there was no need to
repeat "PL2303" as part of the product name. ]

> > Can you please post the output of usb-devices (or lsusb -v) for this
> > device?
> 
> Bus 002 Device 007: ID 067b:2533 Prolific Technology, Inc. PL2543
> USB2.0 HS Serial Port
> Couldn't open device, some information will be missing
> Negotiated speed: High Speed (480Mbps)
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0 [unknown]
>   bDeviceSubClass         0 [unknown]
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x067b Prolific Technology, Inc.
>   idProduct          0x2533 PL2543 USB2.0 HS Serial Port

Did you mean to say "PL2543" above (i.e. not "PL2533")?

Or is the string product string not correct here?

>   bcdDevice           33.04
>   iManufacturer           1 Prolific Technology Inc.
>   iProduct                2 PL2543 USB2.0 HS Serial Port
>   iSerial                 3 C00000000C0001
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0081
>     bNumInterfaces          4
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xa0
>       (Bus Powered)
>       Remote Wakeup
>     MaxPower              100mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0 [unknown]
>       bInterfaceProtocol      0

So they are vendor class. Thanks for the details.

> > > +#define PL256X_FLOWCTRL_MASK         0x43
> >
> > > +#define PL256X_FLOWCTRL_XON_XOFF     0x40
> > > +#define PL256X_FLOWCTRL_RTS_CTS              0x03
> >
> > Does the device support having hardware and software flow control
> > enabled at the same time?
> 
> Yes, the device supports enabling both hardware flow control (RTS/CTS)
> and software flow control (XON/XOFF) simultaneously.

Thanks, perhaps we can add support for that at some point.

> > > @@ -461,6 +510,14 @@ static int pl2303_detect_type(struct usb_serial *serial)
> > >               case 0x905:     /* GT-2AB */
> > >               case 0x1005:    /* GC-Q20 */
> > >                       return TYPE_HXN;
> > > +             case 0x3302:
> > > +             case 0x3304:
> > > +             case 0x4302:
> > > +             case 0x4304:
> > > +             case 0x6502:
> > > +             case 0x6504:
> > > +             case 0x6506:
> >
> > Can you add a comment here after each number so we know which device
> > type they map to?
> 
> Got it. I will add comments after each bcdDevice case to explicitly map
> them to their corresponding device types
> (e.g., PL2533-2P (SSOP),  PL2533-2P (QFN), etc.) in the v3 patch.

Thanks.

> > > -     if (type != TYPE_HXN) {
> > > +     if (type == TYPE_MP)
> > > +             pl2303_vendor_write(serial, spriv->flowctrl_reg, PL256X_FLOWCTRL_NONE);
> >
> > Why you need to disable flow control here? The setting should be updated
> > per termios when the device is later opened.
> 
> This is used to program the hardware default state during startup.

But my point is that it should not be needed as this is done when
opening the port (the call to set_termios() in pl2303_open()).

You may need to change the logic a little (e.g. type != HXN && type !=
MP), but that should be all that is needed here.

Johan
