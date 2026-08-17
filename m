Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE12C21F1;
	Mon, 17 Aug 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956468; cv=none; b=lijqNTBxSivv1b1kMYqXuWR2Qj4An/gF5bRw83Wo0yLeWi8BO0zQJh6h5wyU5BwilyXoRTsLIG5XTtDzsi7e9bYWFWpDx2jx84P0tQXJGep0QInIKRd332m5PcWXEpjAZTpmmMpIjXmGzDdvGr4Jz3OdvnNsZhbGBpu/OxRaJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956468; c=relaxed/simple;
	bh=VJn15JZWQrmXOCDilzAPq/tVC7PbMlXYycfSTaP0hpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U78/hnOhLbw+4N7d2jkLnU9D1WEzjHm/npYh/ZlFLBHBLUoDTDWH6+QOCA53GxApYFAUXeWMREZgMNUy6lk4SF/6A8JxLudNTBDf2Wp04BTVuFuh9X9154EFQ1o9LeMy+smf7DSEbM0u749hmhA11k0pGXUX0zqTFjlEvXRFl6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQxf+Wq1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQxf+Wq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAE71F000E9;
	Mon, 17 Aug 2026 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956467;
	bh=JsjN7wry2L+BxKw1hvzHdA20Y6Mnxgsk58Bqd/nTLQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YQxf+Wq1b9s9s2hbNhAkQlyN7MlRF4YR/WbMJBAGgkzPb6m/8DCX6tRrtRDiO/tfs
	 r+Y6SxmScbMs4neF4gvn8fEvpyQUVoiSZr5LrlXcEwG9UykHyVCiOtW4ubyOcxEEth
	 W+h96hj1A9WeDYonumR5xU2xIfIgv5xLeHVGkUpz3xeM8MzC8y6OcO0LrtZpdCkiTT
	 BbeE2Lj0gTvmUOZyoE3fdkMktfv4gxNL/nKKb50AmfHxzJ40GCYC7RBHpR1SuSCkE0
	 cRny4NpW9sMHmdF7Yb8FmlvrTWWVNMNZa9jrpjABEA3Ezqq0Y1tli2QXq70w/+lY3+
	 cGFSFLg9USmnQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wvt0S-00000000cAN-2fMU;
	Mon, 17 Aug 2026 10:47:44 +0200
Date: Mon, 17 Aug 2026 10:47:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	leStoppe <lestoppe@gmail.com>, Craig Hesling <craig@hesling.com>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking
 VDS1022
Message-ID: <aoLKsDMGD3NXT19-@hovoldconsulting.com>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810091322.2201740-1-huangwei@kylinos.cn>

[ +CC: Craig ]

On Mon, Aug 10, 2026 at 05:13:22PM +0800, Huang Wei wrote:
> Commit 4cc01410e1c1 ("USB: serial: simple: add OWON HDS200 series
> oscilloscope support") added a USB_DEVICE() match on VID:PID
> 0x5345:0x1234. OWON uses this same VID:PID across multiple device
> families (HDS, VDS, SDS, PDS), so the overly broad match causes the
> owon driver to also bind to devices like the VDS1022, which previously
> worked fine with the generic usbserial driver.

If it worked fine with the generic usbserial driver then it works fine
with the owon "simple" driver as it's effectively currently just an
alias for the generic driver but with automatic binding.

But based on the rest of the thread, it seems that you perhaps wanted to
say that it worked fine with a libusb based userspace driver?

> Narrow the match to use USB_DEVICE_AND_INTERFACE_INFO() with the
> Physical Interface Device class (bInterfaceClass=0x05,
> bInterfaceSubClass=0x00, bInterfaceProtocol=0x00) as reported in the
> HDS200 USB descriptor. Devices that use a different interface class
> (e.g. vendor-specific 0xff) will no longer be claimed by the owon
> driver and will fall back to the generic driver as before.

There is no fallback to any generic driver if you narrow the match.

And how do you know that won't cause regressions for users that have
started relying on the new driver?

For completeness, could you post the usb-devices (or lsusb -v) output
for the VDS1022?

Doesn't that device also support the SCPI protocol and should generally
work with the owon driver?

> Reported-by: leStoppe <lestoppe@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220193
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>
> ---
>  drivers/usb/serial/usb-serial-simple.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
> index a0afaf254d12..82509669347e 100644
> --- a/drivers/usb/serial/usb-serial-simple.c
> +++ b/drivers/usb/serial/usb-serial-simple.c
> @@ -100,9 +100,15 @@ DEVICE(nokia, NOKIA_IDS);
>  	{ USB_DEVICE(0x09d7, 0x0100) }	/* NovAtel FlexPack GPS */
>  DEVICE_N(novatel_gps, NOVATEL_IDS, 3);
>  
> -/* OWON electronic test and measurement equipment driver */
> +/* OWON electronic test and measurement equipment driver.
> + * OWON uses the same VID:PID (0x5345:0x1234) for multiple device families
> + * (HDS, VDS, SDS, PDS). Match on the Physical Interface Device class (0x05)
> + * used by the HDS200 series to avoid binding devices that use a different
> + * interface class (e.g. vendor-specific 0xff) and may require different
> + * handling.
> + */

Multi-line comments should start with /* on its own line.

>  #define OWON_IDS()			\
> -	{ USB_DEVICE(0x5345, 0x1234) } /* HDS200 oscilloscopes and others */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x5345, 0x1234, 0x05, 0x00, 0x00) }

And this should be USB_DEVICE_INTERFACE_CLASS().

>  DEVICE(owon, OWON_IDS);
>  
>  /* Siemens USB/MPI adapter */

Johan
