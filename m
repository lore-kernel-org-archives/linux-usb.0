Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416323;
	b=vnUr1QkzZsRdIe3D73NyQPCQCkfCzQPDsb3X9pJmuIFvZingqW1ZHU3wl+RHICHFplbX
	 4upn40/ogMRN/M1xyLSYQrpm7b/JbT/DpQ9BofCxJo0C+qJgnZG94A548RnZwoWiExWU7
	 HwqR/2EHoFeQxvNx6sv4q09g4wjB5vAtgnVqqmMfzYDUlT9kpSPe/aHvuPt5yy7C/MuTx
	 QjOB2HEYZRrKlsmcJPIBJBPtdDs9vQqRRcFsh4Tja4Jt9s/6DR/aR1x9N4/ZmTDDJKmSw
	 G2tGwMvs+aj93+EpMBh0jGu/+ydbRweYufOTFQQj/7j3P22JjYEgnMb6R8h7EYFQT6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416323;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BMU4EDw6pJQb772LvkzyUwJnDMh4aSw2olKoc9XUwmc=;
	b=ewDB/8IV3VgYty3TPzxledk81xwEpCHkb+r4CVuygzeKQjSYIxbCQa8ZJb1XOffqqbTa
	 xtwxZyHx/lrHYDepabfIOObhzSeu/si/3NVknX8mIw5kwvsHbm1PhHdIgXZd9uvPaeG+Q
	 fvq8TGTdcFDyvg4HNmSidlvqdlt6lNfiWpEircD+qVzEa+8vEvJ8elnHnfkI9Qjy5ufaf
	 reoKDzyEZMdt/IAAqmBOphj2b1psduBaDorTCx6S76w8bsM0vYZijx6CLISMWPvtYX2iI
	 g6oIHtlkwXIoGYoT145a/MVlxyjkXum5mF2uuc+Pw25kmWZBF/8DKkteB1MxYgLiIyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oTOH8vWh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F361D606A31E;
	Mon, 23 Nov 2026 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oTOH8vWh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919891F000CF;
	Mon, 23 Nov 2026 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795416322;
	bh=BMU4EDw6pJQb772LvkzyUwJnDMh4aSw2olKoc9XUwmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTOH8vWhkrOhS++jlBccPCCW6BTYvbuF/Gbm01v+J60lyQLEDAIAEwrMGUJuXS0lL
	 6PQGiKSZTO/79FvQ7tkHEPDL43JkGxj7Zo3a/DfvzfGluyUJGARgYcMA6AFSQulKb7
	 QKcwJ5P7cVBM86UGpZ/6OZmbBoM8dtX+wRKR75zA=
Date: Mon, 23 Nov 2026 07:45:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: acpi: Get correct location data for Apple macs
Message-ID: <2026112344-jaybird-glancing-b56a@gregkh>
References: <20261123062519.11531-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20261123062519.11531-1-atharvatiwarilinuxdev@gmail.com>

On Mon, Nov 23, 2026 at 01:25:17AM -0500, Atharva Tiwari wrote:
> In All macs, the _PLD values in ACPI is just garbage values
> and provide no real data, and that may cause errors like:
> 
> usb: port power management may be unreliable
> 
> On Internal controllers, with multiple USB2.0 and USB3.0.
> 
> To fix this we use Apple's own location methods called SSP
> for USB2.0, and they use _ADR for USB3.0.
> 
> With this patch we get proper location and peering:
> 
> [    0.280281] usb usb2-port2: peered to usb1-port10
> [    0.280298] usb usb2-port3: peered to usb1-port3
> [    0.280311] usb usb2-port4: peered to usb1-port14
> [    0.280325] usb usb2-port5: peered to usb1-port8
> [    0.280354] usb usb2-port9: peered to usb1-port9
> 
> NOTE: All USB controller has bad _PLD values but SSP is only available
>       on internal USB controller, and even only new intel macs has SSP
>       method, so we check for SSP and XHC1 before using apple's methods.
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
> Changes in v2:
> - Nulled location provided by _PLD in apple_get_location
> - Fixed typos.
> 
> Link to v1:
> https://lore.kernel.org/all/20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com/

Please slow down, there is no rush.  One patch per 24 hours max.

> 
>  drivers/usb/core/usb-acpi.c | 74 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 489dbdc96..403c2ff44 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -12,6 +12,7 @@
>  #include <linux/acpi.h>
>  #include <linux/pci.h>
>  #include <linux/usb/hcd.h>
> +#include <linux/platform_data/x86/apple.h>
>  
>  #include "hub.h"
>  
> @@ -199,6 +200,69 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>   */
>  #define USB_ACPI_LOCATION_VALID (1 << 31)
>  
> +/*
> + * Set at registration time on x86 Apple Macs whose internal XHC1 controller
> + * has ports exposing an SSP object. Apple reports the port location through
> + * SSP (USB 2.0) and _ADR (USB 3.x) instead of _PLD.
> + */
> +static bool is_apple_location;

Again, why is this needed and not just calculated at the one place you
actually use it?

thanks,

greg k-h
