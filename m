Return-Path: <SRS0=zgiO=TA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D87DC43219
	for <linux-usb@archiver.kernel.org>; Tue, 30 Apr 2019 14:47:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6444F2147A
	for <linux-usb@archiver.kernel.org>; Tue, 30 Apr 2019 14:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfD3Or1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 30 Apr 2019 10:47:27 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35592 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726053AbfD3Or1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:47:27 -0400
Received: (qmail 3188 invoked by uid 2102); 30 Apr 2019 10:47:26 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Apr 2019 10:47:26 -0400
Date:   Tue, 30 Apr 2019 10:47:26 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     gregKH@linuxfoundation.org, <miquel@df.uba.ar>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3] rio500: refuse more than one device at a time
In-Reply-To: <20190430142326.25815-1-oneukum@suse.com>
Message-ID: <Pine.LNX.4.44L0.1904301045260.1465-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190430144726.D9CCrys3nget0TVVwM71cCc9nzuK_8oMstigujRzvV8@z>

On Tue, 30 Apr 2019, Oliver Neukum wrote:

> This driver is using a global variable. It cannot handle more than
> one device at a time. The issue has been exisying since the dawn

s/exisying/existing/

> of the driver.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: syzbot+35f04d136fc975a70da4@syzkaller.appspotmail.com
> ---
>  drivers/usb/misc/rio500.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/rio500.c b/drivers/usb/misc/rio500.c
> index 13e4889bc34f..a4b6fbea975f 100644
> --- a/drivers/usb/misc/rio500.c
> +++ b/drivers/usb/misc/rio500.c
> @@ -449,7 +449,12 @@ static int probe_rio(struct usb_interface *intf,
>  	struct rio_usb_data *rio = &rio_instance;
>  	int retval;
>  
> -	dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
> +	if (rio->present) {
> +		dev_info(&intf->dev, "Second USB Rio at address %d refused\n", dev->devnum);
> +		return -EBUSY;
> +	} else {
> +		dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
> +	}

This will race if more than one Rio is probed at the same time.  You 
should hold the rio500_mutex throughout this routine.

Alan Stern

