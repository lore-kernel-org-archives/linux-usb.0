Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B6DCCA47E
	for <linux-usb@archiver.kernel.org>; Fri, 10 Jun 2022 09:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347046AbiFJJvd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 10 Jun 2022 05:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344417AbiFJJvb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 05:51:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E11AE468
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 02:51:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D55A6B8330A
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 09:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB236C34114;
        Fri, 10 Jun 2022 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1654854686;
        bh=87qPzc1yipccUPMyhKmYzkEhBK/E7rZg3AQl/TiFFk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qzzc+leUoGzYrlLcbKkjK811DO1/JI31T1Qwn9LYBfldlQZeEeVi9A7bP6PGuQLDN
         aCOY9+Qqqdp6hlGI9F5hKMo33to9oLhrJqhgn/dOlZ7zeDCYbCeOTAiXqkwg311NOM
         lJS/IpXwdcD5uluKkfbU30l3Fi/O4zLvKHAh8WBE=
Date:   Fri, 10 Jun 2022 11:51:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/3] usb: gadget: uvc: fixes and improvements
Message-ID: <YqMUG0u1V7FEVwXO@kroah.com>
References: <20220529223848.105914-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220529223848.105914-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 30, 2022 at 12:38:45AM +0200, Michael Grzeschik wrote:
> This series includes several patches to improve the overall usb uvc
> gadget code. It includes some style changes and some serious fixes.
> 
> Michael Grzeschik (3):
>   usb: gadget: uvc: calculate the number of request depending on
>     framesize
>   usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
>   usb: gadget: uvc: call uvc uvcg_warn on completed status instead of
>     uvcg_info
> 
>  drivers/usb/gadget/function/f_uvc.c     |  4 ++++
>  drivers/usb/gadget/function/uvc.h       |  1 +
>  drivers/usb/gadget/function/uvc_queue.c | 17 ++++++++++++-----
>  drivers/usb/gadget/function/uvc_v4l2.c  |  2 +-
>  drivers/usb/gadget/function/uvc_video.c | 11 ++++++++---
>  5 files changed, 26 insertions(+), 9 deletions(-)

This patch series fails to apply to my tree, can you please rebase and
resend?

thanks,

greg k-h
