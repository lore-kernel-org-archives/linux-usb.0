Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411700;
	b=YZ9NyAwmGjl2Kr5KsnHKm2ALAHn8oCcSkPcI8LP13t+4wSDMF8hPlfo6KOrZCsHbdLzD
	 Tqju2iEF+PuWMuOJOfCq9GKFR1yrjdfKl3pxAYNP52RNK7UVUNs9dFzQxMFcvf8P1jMXM
	 SOhJ8sPIypZ0WlM4MMv3C2LyS/QJbB0V05GIJKg+LMI0B/E7Lcgv7AeM1P5fESPaTH7Ee
	 O+2EYTEihQuK2jem5UROEZCmML1rpychsRUu97NSsZ2X/waQiDS484TsR17/nbM2bYIqB
	 a3EcKyHO911tan0Byjf5GvUTCSmVYUCFUkuvFqCBLfkuiy+Sh65+jNyE/Bnn1FzXGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411700;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p8O7x28T/uZEw+uczNpPStDjP/IONqrHmgKaqB1A2Sg=;
	b=nGosZeZ6ruJrJL1tdHOy3vKvw2RXBHC1BQNFecLuEGKg4kFaXFXbzVxrm9yKuwWSNAHm
	 TuuV2kv00PizFT2nQxmXAkHHt7GspYEEidXd0AnnEKQ9ahS5nHJpC51G3N/+v6F5ujMdl
	 Hl/2Da0i6r4CO+F6c1r8rolwRhuKW0U3qRxwY6UYKS5poZo5fz1lWANGZo6ZlbVsSnjlW
	 g5KCtEZz5a1hJPZEYfFIrO+b7tlyurYexe2gUf5ePrfABZkmbxDxgYcjO09i+F7YrsCoa
	 rp1gnliUcYzgrM8AbJMHNgmyNHez2GwhVJfTfk42TpXnu7SpyA3fvHIGEw/b86tfTDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Emxf81ys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF03606A31A;
	Mon, 23 Nov 2026 05:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Emxf81ys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466811F000C0;
	Mon, 23 Nov 2026 05:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795411699;
	bh=p8O7x28T/uZEw+uczNpPStDjP/IONqrHmgKaqB1A2Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Emxf81ysLKfTtDsCRKg6SvZtqrsZ0dKBRiPfP34VHUefeGJNQ0t5lI6B7IKDCDNla
	 3zZZJkVpDrP5Odon2+Uq8hpco1FyKASIQROpNpFzQmbJk/fteSzsSYyq91dw/PbdqW
	 OMQ14BJwWT139T7b51jb00BpK+AHtnTKl2PTNQII=
Date: Mon, 23 Nov 2026 06:28:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: xhci-pci: Add Power handling for Card readers on
 Apple systems
Message-ID: <2026112342-engorge-polymer-0717@gregkh>
References: <20261123051459.9581-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20261123051459.9581-1-atharvatiwarilinuxdev@gmail.com>

On Mon, Nov 23, 2026 at 12:14:58AM -0500, Atharva Tiwari wrote:
> Add Power handling for Card readers on Apple systems using SPWR
> ACPI method, SPWR(1) turns on the card reader, SPWR(0) turns off
> the card reader, on newer systems SPWR just writes a variable in EC.
> On previous systems it writes to GPIO pins.
> 
> Its also used by the macOS driver with the function
> AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.
> 
> (This should fix https://bugzilla.kernel.org/show_bug.cgi?id=111201
>  But thats not confirmed)
> 
> (Tested on iMac20,1)
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
> Changes in v3:
> - Added changes at correct location
> - Removed accidental usb-acpi code.
> 
> Changes in v2:
> - Fixed grammatical errors.
> - Added CONFIG_ACPI check
> - Checked for xhci_suspend success before turning off power
> 
> Link to v2:
> https://lore.kernel.org/all/20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com/
> 
> Link to v1:
> https://lore.kernel.org/all/20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com/
> 
>  drivers/usb/host/xhci-pci.c | 25 ++++++++++++++++++++++++-
>  drivers/usb/host/xhci.h     |  1 +
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index e278db940..31961de97 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -15,6 +15,7 @@
>  #include <linux/reset.h>
>  #include <linux/suspend.h>
>  #include <linux/bitfield.h>
> +#include <linux/platform_data/x86/apple.h>

That feels very wrong for all non-x86 systems to be forced to include.

>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -517,6 +518,18 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	if (xhci->hci_version >= 0x120)
>  		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
>  
> +#ifdef CONFIG_ACPI
> +	/* On Apple Machine with Card readers, we have to use SPWR(0/1) to turn
> +	 * off/on the card reader, And on boot the card reader is off, so we turn
> +	 * it on.
> +	 */

Wrong comment style :(

And why an #ifdef in this file?

> +	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&

So what happens on arm64 systems with ACPI?  Riscv systems?  Does this
just break the build?

> +			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
> +		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
> +		xhci->quirks |= XHCI_APPLE_CARD_READER_POWER;
> +	}
> +#endif /* CONFIG_ACPI */
> +
>  	if (xhci->quirks & XHCI_RESET_ON_RESUME)
>  		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
>  				"QUIRK: Resetting on resume");
> @@ -562,10 +575,14 @@ static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device
>  		}
>  	}
>  }
> -
> +static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on)
> +{
> +	acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", on);
> +}

You removed the blank line?

and this still feels very platform specific, why must it be in generic
xhci code?

and what about all of the sashiko review comments that were made on
this?  Are they all wrong?

thanks,

greg k-h
