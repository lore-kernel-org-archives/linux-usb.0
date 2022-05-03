Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DF8C433F5
	for <linux-usb@archiver.kernel.org>; Tue,  3 May 2022 15:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238982AbiECPy4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 May 2022 11:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238946AbiECPyt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 11:54:49 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B589331DF3
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 08:51:16 -0700 (PDT)
Received: (qmail 1090150 invoked by uid 1000); 3 May 2022 11:51:15 -0400
Date:   Tue, 3 May 2022 11:51:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <YnFPc9kWw+Jrxo8D@rowland.harvard.edu>
References: <20220503153057.105128-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503153057.105128-1-jtornosm@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 03, 2022 at 05:30:57PM +0200, Jose Ignacio Tornos Martinez wrote:
> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> Trust) hang when they are unbound from 'unbind' sysfs entry and
> can not be bound again.
> 
> The reason is CSR chip hangs when usb configuration command with
> index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command for CSR chip, so a new quirk has been created.
> 
> Athough device is not unconfigured, it is better to avoid device
> hanging to be able to operate. Even bluetooth can be previously
> turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---

This all looks okay except for one thing...

> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index d3c14b5ed4a1..7d42fdc7404c 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
>  			case 'o':
>  				flags |= USB_QUIRK_HUB_SLOW_RESET;
>  				break;
> +			case 'p':
> +				flags |= USB_QUIRK_SKIP_UNCONFIGURE;
> +				break;
>  			/* Ignore unrecognized flag characters */
>  			}
>  		}
> @@ -510,6 +513,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* INTEL VALUE SSD */
>  	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>  
> +	/* CSR Bluetooth */
> +	{ USB_DEVICE(0x0a12, 0x0001), .driver_info = USB_QUIRK_SKIP_UNCONFIGURE },

These entries are supposed to be in numerical order according to the 
vendor ID and product ID.  Since 0x0a12 comes before 0x8086, your new 
entry does not belong at the end of the list.

Alan Stern
