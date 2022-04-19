Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEA6C433EF
	for <linux-usb@archiver.kernel.org>; Tue, 19 Apr 2022 20:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346528AbiDSUth (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 19 Apr 2022 16:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357721AbiDSUtf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 16:49:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8E64131D
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 13:46:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-145-nat.elisa-mobile.fi [85.76.5.145])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAF3125B;
        Tue, 19 Apr 2022 22:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650401210;
        bh=BzxNdveBM9OgGYtx46hoxaGKB/I5Faglz7RKXvfCKUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NEkdTGBDTI+Sa8dFEwPGsgnUDvg2Xz6sbo98gwNWC5FRptktaVAWmLqmFOQBLXZdl
         wCGq2nsaowzlufRMWnH98vOkuXO3aPvn8f2ii+E0mx4urAUmYi8GtpT6dknq4+hZuK
         BBOh00I63WCRogEo0haZpUzL8LGebWxmY1bXKaZk=
Date:   Tue, 19 Apr 2022 23:46:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/5] usb: gadget: uvc: calculate the number of request
 depending on framesize
Message-ID: <Yl8ftLtM4hOIVf/s@pendragon.ideasonboard.com>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220402233914.3625405-3-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Sun, Apr 03, 2022 at 01:39:11AM +0200, Michael Grzeschik wrote:
> The current limitation of possible number of requests being handled is
> dependent on the gadget speed. It makes more sense to depend on the
> typical frame size when calculating the number of requests. This patch
> is changing this and is using the previous limits as boundaries for
> reasonable minimum and maximum number of requests.

What are typical values you get for the number of requests in your use
cases with this change ? Could you mention them in the commit message ?

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_queue.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index cfa0ac4adb04d5..2a091cf07981e1 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -44,7 +44,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>  	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> -	struct usb_composite_dev *cdev = video->uvc->func.config->cdev;
> +	unsigned int req_size;
> +	unsigned int nreq;
>  
>  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
>  		*nbuffers = UVC_MAX_VIDEO_BUFFERS;
> @@ -53,10 +54,14 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = video->imagesize;
>  
> -	if (cdev->gadget->speed < USB_SPEED_SUPER)
> -		video->uvc_num_requests = 4;
> -	else
> -		video->uvc_num_requests = 64;
> +	req_size = video->ep->maxpacket
> +		 * max_t(unsigned int, video->ep->maxburst, 1)
> +		 * (video->ep->mult);
> +
> +	nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);

Where does the division by 2 come from ?

> +	nreq = min_t(unsigned int, nreq, 64);
> +	nreq = max_t(unsigned int, nreq, 4);

You can use clamp():

	video->uvc_num_requests = clamp(nreq, 4U, 64U);

> +	video->uvc_num_requests = nreq;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
