Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613BC34B1A3
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785091044; cv=none; b=DaOIPTusjILV3++rtehcvtJHQ0z10eYHhhNvT6U7k5T3VmD+tyw5FhE2AH2S3WO/OfEDOV6pob1W9/OQdOtor/J0NyCdyS8U0QtxOJUPrcsKyOFS/eFnU6h/6csWgjUGd1JczhY/lz5EWRS4+P6R6Ae9k7E3cQDywrPvcR5BAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785091044; c=relaxed/simple;
	bh=UGow6Mxr4lCbcCcYozEyT3rJjUrTrnFzQgyCNbauWNw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9k1Es2nHvBMLq1MJ57voQ7qhEhLQyKyUVsKKZ2UB2F8c2bHPbPuF1SPJul+6r8EsaVDYlEqzN6K2N20smLPuf6EipptDESTAt6Hxg8w+E0R+V14/EYe9U/V1J+qi5j4BwR+pJWNwc25ykpiX3RJ0GS1EFZKIa1wBIU+fH6q2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwM0oYIh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwM0oYIh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954afac04bso23305695e9.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785091041; x=1785695841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2hRFecvaBHBsTPl+ynKanvt7gxlT6GQwtr3nIanUTJw=;
        b=VwM0oYIhs+OMytdABkahhwnMEkFt5lcDKiPEN1jKBRNsvF3uggyo6ayjIcB9Ubw0Xe
         U1I5eGzw17zLWeHcQ5dOz9LIFKK4II4CyUQuQluOcrAaHp5nPf7kSau/unQQByptfBCq
         RhZDQPrYyOtKuLCEaVmap9C6gyfLIunW1UYYInhLC7OHiwvguzOfdosJ9M6LgMwd2huT
         j9KJjFxrM4tjPvWq3SvE3dydNu3yr5nRw5cSmWfxqC9AAxtTpiIYxRiCDD5hUstsp1sN
         PnNS9L6xYXLlxcXXXHZPEwBRTKz1jiGj9Iq1zDD62628WU9WRKawhUwEJnG02f3W3d+q
         nxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785091041; x=1785695841;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hRFecvaBHBsTPl+ynKanvt7gxlT6GQwtr3nIanUTJw=;
        b=YHS0qJkewK0BirbXIqd2RzhTDQ/cetKo/usatrDFObFBcc+/eZRDP/KN7UhJQq44SI
         GAAN5U83tfzKt2GkJqiuWpaDkC/x6EGcOvevQvcdDeaNzmKeTrIHAgY+pjbpZzg6HohT
         Q4pGSyg0TF7pDOt5F4oMqJesiBGDJuR5W6RO15p4buKgJrtouDLU8t+K2mH37Bx+XEsM
         16zgiNVNN6Gc/lVUJW7Lgzn8ZryXQLB0P2KgzhrI9iRKvJ4MmemTrVacymjjCHZCDXiY
         pX2OibCuumvjstLeCIBz/+++t1OAsIq9hDkPDO65Kpp+XgmB+yyRVirJMoE6zf7ua/Bg
         wyVw==
X-Forwarded-Encrypted: i=1; AHgh+RoO4L8477N3WMN1Q3R2jgjkrGAQzMNwPEX4wHvQb+9yzEkOFLEW8xpEVUPAN0SWB6uVY7hSU8guocA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZHxam+mEUV35ZVgBpVRdusbUbxfedfkRNPtvYStu7Z63LFms
	kW8YUx2cQ8mGEr7de0YcoZXg2qBi+G9QnEDNobu7qax6aAA0eXIyKhQW
X-Gm-Gg: AR+sD10kVtsQKyGlLisyU0AfjirOSNly1HxyUEtmYqtvw19z4gmf80JHGco/i3vxRnZ
	+9SfMI61e/Qm4Eay9vuN759e/ChNJCL+S9Kht1KcynWL9YcJL7ajgnhEIBM8R2EtvCNLNPjtsnZ
	VnkMP35DZ2mYcjet3pgn7cIji0EK3/+XVWD1JlMHj5EfzT0Kk2/FHxL2XfqEcoZLHtAxgAGrbmq
	AFd2FHncdbgs+/zeO5H1kW/hm+2tE5Pys2GIS415SesH/kjy+ufLxh8glOmHZCTcVSy2wQNfcr2
	XJ1wuYBVWWT4boqn349x2cxrHLBu7M7SbWSOIcuvEhoGom4LYtVUDpOQjCwePI5f9PdOOojAArh
	nGxUIFaQgyDZD1HqFadL+0I1gwU40NfFvWgTARc9LyUpR9uVIakfbpTiCM2ymHbpM194jBcvN4e
	HGuCSzuBNjk5Q=
X-Received: by 2002:a05:600c:310d:b0:495:7b1b:f387 with SMTP id 5b1f17b1804b1-496b56f141dmr76731525e9.24.1785091040480;
        Sun, 26 Jul 2026 11:37:20 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b842691sm195252855e9.1.2026.07.26.11.37.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 26 Jul 2026 11:37:20 -0700 (PDT)
Date: Sun, 26 Jul 2026 20:41:14 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Cc: pawell@cadence.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: xhci: Add support for eUSB2v2 1024-byte bulk
 packet size
Message-ID: <20260726204114.37723cef.michal.pecio@gmail.com>
In-Reply-To: <20260717-eusb2v2-packet-size-v1-1-67c611bd0c5b@cadence.com>
References: <20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com>
	<20260717-eusb2v2-packet-size-v1-1-67c611bd0c5b@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 12:44:14 +0200, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
> 
> The eUSB2 v2 specification (bcdUSB 0x0230) introduces support for
> 1024-byte maximum packet sizes for Bulk endpoints in High-Speed mode.
> However, an eUSB2v2 peripheral will revert its internal maximum packet
> size back to 512 bytes after events like a bus reset, disconnect, or
> deconfiguration.
> 
> To support 1024-byte bulk transfers on capable hosts, add a new
> is_eusb2v2 flag to the usb_bus structure, populated via the HCCPARAMS2
> E2V2C capability bit in the xHCI driver.
> 
> When an eUSB2v2 host configures an eUSB2v2 device, issue a specific
> SET_FEATURE (USB_DEVICE_BULK_MAX_PACKET_UPDATE) request during device
> configuration to switch the peripheral to 1024-byte packet mode, and
> allow the xHCI endpoint initialization to accept up to 1024 bytes for
> HS bulk endpoints.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/core/config.c   |  4 ++-
>  drivers/usb/core/message.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/usb/host/xhci-mem.c | 18 ++++++++++---
>  drivers/usb/host/xhci.c     |  3 +++
>  include/linux/usb.h         |  4 +++
>  5 files changed, 89 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 45e20c6d76c0..0c7ab3f44cd9 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -491,7 +491,9 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  	 * be able to handle that particular bug, so let's warn...
>  	 */
>  	if (udev->speed == USB_SPEED_HIGH && usb_endpoint_xfer_bulk(d)) {
> -		if (maxp != 512)
> +		struct usb_hcd *hcd =  bus_to_hcd(udev->bus);
> +
> +		if (maxp != 512 && (bcdUSB != 0x230 || !hcd->self.is_eusb2v2))
>  			dev_notice(ddev, "config %d interface %d altsetting %d "
>  				"bulk endpoint 0x%X has invalid maxpacket %d\n",
>  				cfgno, inum, asnum, d->bEndpointAddress,

AFAIU the spec (5.2), every bulk endpoint supports 1024 byte packets
and no bulk endpoint advertises 1024 wMaxPacketSize in its descriptor.

So no change should be needed here for conformant devices.

Neither xhci-hcd nor your code has any clever solution for devices with
illegal wMaxPacketSize, so it may be prudent to retain this warning.

> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 75e2bfd744a9..3b4f7aedd381 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2007,6 +2007,65 @@ int usb_set_wireless_status(struct usb_interface *iface,
>  }
>  EXPORT_SYMBOL_GPL(usb_set_wireless_status);
>  
> +/*
> + * eusb_update_max_packet - set or restore max packet size
> + * @udev: target device
> + * @cp: if NULL restore MPS to 512 else set 1024
> + *
> + * This request is specific to eUSB2v2.
> + * An eUSB2v2 peripheral will revert the maximum packet size to 512
> + * for bulk endpoints after bus reset, disconnect and deconfiguration.
> + * This function allows updating the max packet size for BULK endpoints
> + * to 1024 after above events.
> + */
> +static void eusb_update_max_packet(struct usb_device *udev, struct usb_host_config *cp)
> +{
> +	struct usb_host_config *config = cp ? cp : udev->actconfig;
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct usb_interface_cache *intfc;
> +	struct usb_host_interface *alt;
> +	struct usb_host_endpoint *ep;
> +	u16 mps = 512;
> +	int i, j, a;
> +	int ret;
> +
> +	if (le16_to_cpu(udev->descriptor.bcdUSB) != 0x0230 ||
> +	    !hcd->self.is_eusb2v2)
> +		return;
> +
> +	if (cp) {
> +		ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +				      USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
> +				      USB_DEVICE_BULK_MAX_PACKET_UPDATE, 0, NULL, 0,
> +				      USB_CTRL_SET_TIMEOUT);
> +		if (ret < 0) {
> +			dev_warn(&udev->dev, "eUSB2v2 1KB update failed: %d\n", ret);
> +			return;

In theory, a nonconformant device may have 1024 in its descriptor.
Then xhci-hcd will think that the update succeeded.

Not sure if anyone cares.

> +		}
> +
> +		mps = 1024;
> +	} else if (!udev->actconfig)
> +		return;
> +
> +	for (i = 0; i < config->desc.bNumInterfaces; i++) {
> +		intfc = config->intf_cache[i];
> +
> +		if (!intfc)
> +			continue;
> +
> +		for (a = 0; a < intfc->num_altsetting; a++) {
> +			alt = &intfc->altsetting[a];
> +
> +			for (j = 0; j < alt->desc.bNumEndpoints; j++) {
> +				ep = &alt->endpoint[j];
> +
> +				if (usb_endpoint_xfer_bulk(&ep->desc))
> +					ep->desc.wMaxPacketSize = cpu_to_le16(mps);
> +			}
> +		}
> +	}
> +}
> +
>  /*
>   * usb_set_configuration - Makes a particular device setting be current
>   * @dev: the device whose configuration is being updated
> @@ -2120,8 +2179,12 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  	/* if it's already configured, clear out old state first.
>  	 * getting rid of old interfaces means unbinding their drivers.
>  	 */
> -	if (dev->state != USB_STATE_ADDRESS)
> +	if (dev->state != USB_STATE_ADDRESS) {
> +		eusb_update_max_packet(dev, NULL);
>  		usb_disable_device(dev, 1);	/* Skip ep0 */
> +	}
> +
> +	eusb_update_max_packet(dev, cp);
>  
>  	/* Get rid of pending async Set-Config requests for this device */
>  	cancel_async_set_config(dev);
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 997fe90f54e5..a4d3e03f9e14 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1479,10 +1479,22 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>  	/* Allow 3 retries for everything but isoc, set CErr = 3 */
>  	if (!usb_endpoint_xfer_isoc(&ep->desc))
>  		err_count = 3;
> -	/* HS bulk max packet should be 512, FS bulk supports 8, 16, 32 or 64 */
> +
> +	/*
> +	 * HS bulk max packet should be 512 (or 1024 for eUSB2v2),
> +	 * FS bulk supports 8, 16, 32 or 64.
> +	 */
>  	if (usb_endpoint_xfer_bulk(&ep->desc)) {
> -		if (udev->speed == USB_SPEED_HIGH)
> -			max_packet = 512;
> +		if (udev->speed == USB_SPEED_HIGH) {
> +			if (le16_to_cpu(udev->descriptor.bcdUSB) == 0x0230 &&
> +			    xhci->hcc_params2 & HCC2_E2V2C) {
> +				max_packet = rounddown_pow_of_two(max_packet);
> +				max_packet = clamp_val(max_packet, 512, 1024);

Isn't this equivalent to
				if (max_packet != 1024)
					max_packet = 512;

except for the case of rounddown_pow_of_two(0) being "undefined"?
 
> +			} else {
> +				max_packet = 512;
> +			}
> +		}
> +
>  		if (udev->speed == USB_SPEED_FULL) {
>  			max_packet = rounddown_pow_of_two(max_packet);
>  			max_packet = clamp_val(max_packet, 8, 64);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a54f5b57f205..254638dc1e18 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -5548,6 +5548,9 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  	else
>  		xhci_hcd_init_usb2_data(xhci, hcd);
>  
> +	if (xhci->hcc_params2 & HCC2_E2V2C)
> +		hcd->self.is_eusb2v2 = 1;
> +

May be better to put this in xhci_hcd_init_usb2_data(), so that it
doesn't apply to USB3 buses in dual-speed HCs, if any such HCs have
or will have E2V2C capability. That would be just confusing.

>  	xhci_info(xhci, "hcc params 0x%08x hci version 0x%x quirks 0x%016llx\n",
>  		  xhci->hcc_params, xhci->hci_version, xhci->quirks);
>  
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 25a203ac7a7e..790c2295aec6 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -464,6 +464,10 @@ struct usb_bus {
>  					 * the ep queue on a short transfer
>  					 * with the URB_SHORT_NOT_OK flag set.
>  					 */
> +	unsigned is_eusb2v2:1;		/*
> +					 * true when HC controller supports
> +					 * eusb2v2
> +					 */
>  	unsigned no_sg_constraint:1;	/* no sg constraint */
>  	unsigned sg_tablesize;		/* 0 or largest number of sg list entries */
>  
> 
> -- 
> 2.43.0
> 
> 
