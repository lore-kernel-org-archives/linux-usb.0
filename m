Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7237E489863;
	Mon,  3 Aug 2026 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740899; cv=none; b=p+XV6IrE325TK81jWagZLU2GouVidSByI7gfhM+MmFP6bJu+K/0xakhw453hoRJEFzrwa+6TjLI/K8XsyT3+kDlEzAGnA5qi2wdpeXS4163ox3NV1+gch9Q8bemJPhSZE7bI5hEjcXLSAGigbZPd7Ac4hilqV5+H1dyysyK4Vqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740899; c=relaxed/simple;
	bh=xfOTwQzUOk1y0PjmF6qGYqhtcBXYmMhoSLqgyBeXBgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUb768DTl/6ZLMv99x1iBAf715nFDnnWapyhbY6ZY4Jqfz4wyg5RVIl1DldRn3E33fSidrQbYfLlT5KKs570XKiaPiryJbqZBurYAJ+fI7YsaS1UMFYlZ4Ms2XZdKsnbfa0JnzOfjpsJAFqNPqhcjxXDJXXi+Ww1SN9PwxJP21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BF/Y2+5g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF/Y2+5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA0F1F000E9;
	Mon,  3 Aug 2026 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785740898;
	bh=8OPSDNc/bFRZ/lT/2QyR2+t6L9d6Yxm6WsG0rKsT17A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BF/Y2+5gs74dqTjPOclWh8rmvY9JYinHX5EHgSgLwgL8iWZj41FBhul0fJ+LDb4KH
	 ODy5RPSGquDGTi0zysNCclv9vbHcf7Rw7msbhbcOh3Xrn/noosMseeGvXqgSePT7hX
	 QdmQwhUUQS5W4ZpJHV+L0HYi58NaZiYfzMF4C0aUGCBFFLRCVa4AAw6kGJsRNDp2fU
	 c3TMQRLAV1mH26nzD1yGy8YU3wIKNx34e5LS+LYOwRZSsVpc9jMlOKErkjhCXWwjfF
	 dvkZM/VKAs9rnCvV6c5mKIDe2UMVu+ZHcp6NVAv5Gb5x7O23bytzCDqvhcS9INGZJw
	 WJ6ISeOoLcCUA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wqmmV-00000002aJU-37Mw;
	Mon, 03 Aug 2026 09:08:15 +0200
Date: Mon, 3 Aug 2026 09:08:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 2/4] USB: serial: mxuport: add MUX50U-based device
 support
Message-ID: <anA-X-QE79_hMR4I@hovoldconsulting.com>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-4-crescentcy.hsieh@moxa.com>
 <al-JOStaDglCBoL1@hovoldconsulting.com>
 <amcyri8fi8YPrEW4@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcyri8fi8YPrEW4@moxa-ThinkCentre-M90t>

On Mon, Jul 27, 2026 at 06:27:58PM +0800, Crescent Hsieh wrote:
> On Tue, Jul 21, 2026 at 04:59:05PM +0200, Johan Hovold wrote:
> > On Tue, Jun 23, 2026 at 04:01:37PM +0800, Crescent Hsieh wrote:

> > >  /* Table of devices that work with this driver */
> > >  static const struct usb_device_id mxuport_idtable[] = {
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1250_PID),
> > > -	  .driver_info = MX_PORTS(2) },
> > > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1251_PID),
> > > -	  .driver_info = MX_PORTS(2) },
> > > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1410_PID),
> > > -	  .driver_info = MX_PORTS(4) },
> > > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1450_PID),
> > > -	  .driver_info = MX_PORTS(4) },
> > > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1451_PID),
> > > -	  .driver_info = MX_PORTS(4) },
> > > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1618_PID),
> > > -	  .driver_info = MX_PORTS(8) },
> > > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1658_PID),
> > > -	  .driver_info = MX_PORTS(8) },
> > > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1613_PID),
> > > -	  .driver_info = MX_PORTS(16) },
> > > +	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
> > >  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1653_PID),
> > > -	  .driver_info = MX_PORTS(16) },
> > 
> > My initial reaction was that it would be better to just leave the gen1
> > entries alone (with family implicitly set to MX_FW_UPORT_G1), but I
> > guess this is fine too.
> > 
> > > +	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1252_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1253_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1411_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1452_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1453_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1619_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1659_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165A_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165B_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU250U_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_PLATFORM_UART) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU450U_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_PLATFORM_UART) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_PLATFORM_UART) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_6PORT_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(6, MX_FW_PLATFORM_UART) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MUX50U_3PORT_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(3, MX_FW_PLATFORM_UART) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_5PORT_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(5, MX_FW_PLATFORM_UART) },
> > > +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_7PORT_PID),
> > > +	  .driver_info = MX_DEVICE_INFO(7, MX_FW_PLATFORM_UART) },
> > >  	{}			/* Terminating entry */
> > >  };
> > 
> > Perhaps the family defines can be shortened to make this a bit more
> > readable, for example:
> > 
> > 	MX_FW_UP_G1
> > 	MX_FW_UP_G2
> > 	MX_FW_PF
> > 
> > or even
> > 
> > 	MX_UP_G1
> > 	MX_UP_G2
> > 	MX_PF
> > 
> > I didn't try and see what the result looks like. Perhaps the more
> > verbose names are preferred.
> 
> I used the verbose names to keep the firmware-family naming explicit,
> but I agree that readability is important as well.
> 
> Listing each device-table entry on a single line would make the table
> easier to read, but doing so directly would result in overly long lines.
> Another option would be to introduce a small helper macro:
> 
> #define MX_DEVICE(pid, ports, fw)			\
> 	{ USB_DEVICE(MX_USBSERIAL_VID, pid),		\
> 	  .driver_info = MX_DEVICE_INFO(ports, fw) }
> 
> The ID table could then be written as:
> 
> MX_DEVICE(MX_UPORT1250_PID,  2, MX_FW_UPORT_G1),
> MX_DEVICE(MX_UPORT1250I_PID, 2, MX_FW_UPORT_G1),
> ...
> MX_DEVICE(MX_UPORT1250_G2_PID,   2, MX_FW_UPORT_G2),
> MX_DEVICE(MX_UPORT12150I_G2_PID, 2, MX_FW_UPORT_G2),
> ...
> MX_DEVICE(MX_MU850U,           8, MX_FW_PLATFORM_UART),
> MX_DEVICE(MX_MUX50U_6PORT_PID, 6, MX_FW_PLATFORM_UART),
> 
> This would allow the firmware-family names to remain explicit while
> keeping each device entry on a single line.

That sounds like a good solution.

Johan
