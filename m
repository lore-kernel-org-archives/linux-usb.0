Return-Path: <SRS0=//eN=BB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61240C433E5
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jul 2020 15:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F4482071A
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jul 2020 15:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732648AbgGVP0l (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 22 Jul 2020 11:26:41 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57153 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728812AbgGVP0l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 11:26:41 -0400
Received: (qmail 1315600 invoked by uid 1000); 22 Jul 2020 11:26:40 -0400
Date:   Wed, 22 Jul 2020 11:26:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
Message-ID: <20200722152640.GC1310843@rowland.harvard.edu>
References: <20200722094628.4236-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722094628.4236-1-hadess@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 11:46:27AM +0200, Bastien Nocera wrote:
> When a new device with a specialised device driver is plugged in, the
> new driver will be modprobe()'d but the driver core will attach the
> "generic" driver to the device.
> 
> After that, nothing will trigger a reprobe when the modprobe()'d device
> driver has finished initialising, as the device has the "generic"
> driver attached to it.
> 
> Trigger a reprobe ourselves when new specialised drivers get registered.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/usb/core/driver.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f81606c6a35b..a6187dd2186c 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -905,6 +905,30 @@ static int usb_uevent(struct device *dev, struct kobj_uevent_env *env)
>  	return 0;
>  }
>  
> +static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
> +{
> +	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
> +	struct usb_device *udev = to_usb_device(dev);
> +
> +	if (udriver == &usb_generic_driver &&
> +	    !udev->use_generic_driver)
> +		return device_reprobe(dev);
> +
> +	return 0;
> +}
> +
> +static int __usb_device_driver_added(struct device_driver *drv, void *data)
> +{
> +	struct usb_device_driver *udrv = to_usb_device_driver(drv);
> +
> +	if (udrv->match) {
> +		bus_for_each_dev(&usb_bus_type, NULL, udrv,
> +				 __usb_bus_reprobe_drivers);

What does udrv get used for here?

> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * usb_register_device_driver - register a USB device (not interface) driver
>   * @new_udriver: USB operations for the device driver
> @@ -934,13 +958,16 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
>  
>  	retval = driver_register(&new_udriver->drvwrap.driver);
>  
> -	if (!retval)
> +	if (!retval) {
> +		bus_for_each_drv(&usb_bus_type, NULL, NULL,
> +				 __usb_device_driver_added);

This looks funny.  You're calling both bus_for_each_drv() and 
bus_for_each_dev().  Can't you skip this iterator and just call 
bus_for_each_dev() directly?

Alan Stern
