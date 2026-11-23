Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412680;
	b=3yWqaiGIb+yL5DmFSWArj9ATl6LGAKhZmf1JTtmXLHauxi5hVzTdbRycieWlRr5QMLBm
	 dXxIy+hUD4bjOygYmUGbnUWk1ILnZlNY15g/JHaP8gOJy+nuJ0wAj3PzH9VSNGY7uSjJd
	 PxemrSxmTafef7z+FgHqNor9uPTgi+1q4yHEY/AveSTnquhGZjmgsLZcM54ISKVK5zhpD
	 R+OFUaJLI31lUMinYQorW+TRY6jQT1r5U2UhViH5O6cp23jByzjoHcuynezp1C0b5jttl
	 V9TJn8rc8JWjzeH6GY7oFTw1pORZhlrrLAaPOTyhKbebby2IPHUgWFmBWacHOkid/ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412680;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7exd/wTOWyyzYXp+z23vuvnAT8xZdFoMULFgheoa9wQ=;
	b=VWFF7Za0fJvgK8MUP7/WMSO5GH40LZKp/8tlimXdoLv5eVlglba8or/YRnMty+Sq6YtH
	 KmhnG12oha6gFXr6n3OH7OkgsrzqQ+VhUbih7IphN1OgLazh1ShQV+0j7hXrCJ8mmNoVP
	 RWgtKpTJn5Ev/aaNvW0w9iwmlCxmX9kHJMDDxci4uDDkwkeo4rXdAhTNBV6Zjaw+8DVGs
	 PFJ3GAJoHEvI515bI/H/wegS7apl8NCLOm+jbYykEIsyzxdG5ssCIQu5jFcgllL15BoQh
	 FRNNPRm5yqnS1gXG4xLGUGxBt5gwaLFrFexzugu320J8CfA/IwdE1Hyjvh9xOGW+tsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QcfWMjJZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B1F606A31A;
	Mon, 23 Nov 2026 05:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QcfWMjJZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B141F000C0;
	Mon, 23 Nov 2026 05:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795412680;
	bh=7exd/wTOWyyzYXp+z23vuvnAT8xZdFoMULFgheoa9wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QcfWMjJZuPDNp3GgdnevDhp6jTOfTUCr4wPEANLbRzkujr+Et/bsQiTaHZEQfy3lJ
	 IypDj/0p23JEuaOUGWXMgmDexeqtkVYrBasBf5YPEEV59jFoaS4vx6VJzBbCITWLJt
	 TClt7w79T46qcMVQ6j9mX/FivvI4AZqxQeqbuWK4=
Date: Mon, 23 Nov 2026 06:44:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: acpi: Get correct location data for Apple macs
Message-ID: <2026112338-pummel-hyperlink-2957@gregkh>
References: <20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com>

On Mon, Nov 23, 2026 at 12:39:09AM -0500, Atharva Tiwari wrote:
> In All macs, the _PLD values in ACPI is just garbage values
> and provide no real data, and that may cause errors like:
> 
> usb: port power management may be unreliable
> 
> On Internal controllers, with multiple USB2.0 and USB3.0.
> 
> To fix this we use Apple's own location methods called SSD
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
> NOTE: All USB controller has bad _PLD values but SSD is only available
>       on internal USB controller, and even only new intel macs has SSD
>       method, so we check for SSD and XHC1 before using apple's methods.
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  drivers/usb/core/usb-acpi.c | 71 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 489dbdc96..b5c61a2ea 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -12,6 +12,7 @@
>  #include <linux/acpi.h>
>  #include <linux/pci.h>
>  #include <linux/usb/hcd.h>
> +#include <linux/platform_data/x86/apple.h>

Again, platform specific files for a generic .c file?

>  
>  #include "hub.h"
>  
> @@ -199,6 +200,66 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>   */
>  #define USB_ACPI_LOCATION_VALID (1 << 31)
>  
> +/*
> + * Set at registration time on x86 Apple Macs whose internal XHC1 controller
> + * has ports exposing an SSP object. Apple reports the port location through
> + * SSP (USB 2.0) and _ADR (USB 3.x) instead of _PLD.
> + */
> +static bool is_apple_location;

Local static variables are usually not a good idea.  Why is this needed
as it's only referenced once?

thanks,

greg k-h
