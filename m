Return-Path: <SRS0=phTe=YI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64250C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 15 Oct 2019 19:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4188F20663
	for <linux-usb@archiver.kernel.org>; Tue, 15 Oct 2019 19:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389263AbfJOTFt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Oct 2019 15:05:49 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:41818 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729457AbfJOTFt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 15:05:49 -0400
Received: (qmail 7250 invoked by uid 2102); 15 Oct 2019 15:05:48 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Oct 2019 15:05:48 -0400
Date:   Tue, 15 Oct 2019 15:05:48 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2 3/6] USB: Implement usb_device_match_id()
In-Reply-To: <20191015143132.8099-4-hadess@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1910151503290.1462-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 15 Oct 2019, Bastien Nocera wrote:

> Match a usb_device with a table of IDs.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/usb/core/driver.c | 15 +++++++++++++++
>  include/linux/usb.h       |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d3787d084937..cc3ca62111b4 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -800,6 +800,21 @@ const struct usb_device_id *usb_match_id(struct usb_interface *interface,
>  }
>  EXPORT_SYMBOL_GPL(usb_match_id);
>  
> +const struct usb_device_id *usb_device_match_id(struct usb_device *udev,
> +				const struct usb_device_id *id)
> +{
> +	if (!id)
> +		return NULL;
> +
> +	for (; id->idVendor || id->idProduct ; id++) {
> +		if (usb_match_device(udev, id))
> +			return id;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(usb_device_match_id);

This function doesn't need to be EXPORT'ed.

Aside from that, the whole series looks okay to me.  Feel free to 
submit an updated version to Greg KH with my:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

