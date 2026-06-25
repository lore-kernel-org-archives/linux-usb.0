Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C5E299A84;
	Thu, 25 Jun 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400263; cv=none; b=KnNjhRcU4AcP3V1lgvA9KRBKnl0+1kl7V6Bq6N3BXVdDornfTSBYKFa6uJw61fCGOXXHAfSF9mwjQgro+6ru4EA2ez2PDcUSV79SVOGPdtZgkg/S5j2sSE/Xc7pDgGpAJiphK4riZnsthZxBQoqAb12oC/fAti0J6ikahi/W+4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400263; c=relaxed/simple;
	bh=MLoG4NQgN/G1+MEH9Wkp0ebO0i7gPjd7GnHWoc97fEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJk8ZHa9wKzvsVWDvWFT5ImFdolzS3LeQX9XDyPL+ZUoD8zTZ4pQHSR5k/15X/cDKoGmSATzrnfMDSZWhr3noUc7McMykpYQ/+rtem83x4V4XgCuuL4TY7zwprnLoWyHoc+PcQyisIEtz3Jhc9bd9JhMqsRWifpe0AB5yWHpd10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ki7MirlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ki7MirlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4EC1F000E9;
	Thu, 25 Jun 2026 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782400262;
	bh=Lk8p8F5K9rAyf5vJuABvwEpohwuUPJEwpE1QH09YvBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ki7MirlEbyQKVbiKm9AlZx7QYWm6EaUBfumUTOhc3QnFRUXL9fWfp845hae/z4xU6
	 nDxcfCGXWaECtzD0F49lJV4XL0xbd9B1YCgr23n7eAUHLjjQ43uVMjn5JcnuiGVZty
	 CLjJQH0pFsT+4ZEA81g4HwfogWNl/Wg93gC4WVBQ=
Date: Thu, 25 Jun 2026 16:09:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbip: tools: support SuperSpeed Plus devices
Message-ID: <2026062527-unmoral-drop-down-9ade@gregkh>
References: <1B3C4D10DA532DC9+20260622100802.377751-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1B3C4D10DA532DC9+20260622100802.377751-1-raoxu@uniontech.com>

On Mon, Jun 22, 2026 at 06:08:02PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> USB/IP reads a remote device's speed from the server-side sysfs
> "speed" attribute. read_attr_speed() converts the string to
> enum usb_device_speed before the value is sent to the client.
> 
> The conversion table only recognizes 5000 Mbps. Devices reporting
> 10000 or 20000 Mbps are therefore sent as USB_SPEED_UNKNOWN. The
> client then selects a USB 2.0 VHCI port, and the kernel rejects the
> attach request because USB_SPEED_UNKNOWN is not a supported speed.
> 
> Map both SuperSpeed Plus sysfs values to USB_SPEED_SUPER_PLUS and
> select the SuperSpeed VHCI hub for that speed.
> 
> The issue was reproduced with the following server hardware:
> 
>   xHCI controller: Intel 8086:a0ed, revision 20
>   Subsystem:       Lenovo 17aa:382a
>   USB device:      Silicon Motion 090c:2320 mass storage
>   sysfs speed:     10000 Mbps
> 
> Before the change:
> 
>   $ usbip attach -r 10.20.12.170 -b 2-2
>   usbip: error: import device
> 
> After the change, the device attaches and uses usb-storage:
> 
>   $ usbip port
>   Port 08: <Port in Use> at Super Speed(5000Mbps)
>     8-1 -> usbip://10.20.12.170:3240/2-2
> 
> VHCI currently exposes the imported device as SuperSpeed, so the
> client reports 5000 Mbps instead of 10000 Mbps. This is a separate
> speed-reporting limitation and does not prevent attachment or I/O.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  tools/usb/usbip/libsrc/usbip_common.c | 2 ++
>  tools/usb/usbip/libsrc/vhci_driver.c  | 1 +
>  2 files changed, 3 insertions(+)

Isn't this covered by this change:
	https://lore.kernel.org/r/00C828F338E43447+20260617020613.199086-1-chenyichong@uniontech.com

?

thanks,

greg k-h
