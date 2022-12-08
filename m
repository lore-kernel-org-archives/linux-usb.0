Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3628C4332F
	for <linux-usb@archiver.kernel.org>; Thu,  8 Dec 2022 15:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiLHP01 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiLHP00 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 10:26:26 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5974C5F77
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 07:26:25 -0800 (PST)
Received: (qmail 729470 invoked by uid 1000); 8 Dec 2022 10:26:24 -0500
Date:   Thu, 8 Dec 2022 10:26:24 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: Add check for kcalloc
Message-ID: <Y5ICIG0z93TwcjQ9@rowland.harvard.edu>
References: <20221208110058.12983-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208110058.12983-1-jiasheng@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 08, 2022 at 07:00:58PM +0800, Jiasheng Jiang wrote:
> As kcalloc may return NULL pointer, the return value should
> be checked and return error if fails as same as the ones in
> alauda_read_map.
> 
> Fixes: e80b0fade09e ("[PATCH] USB Storage: add alauda support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/alauda.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
> index 747be69e5e69..5e912dd29b4c 100644
> --- a/drivers/usb/storage/alauda.c
> +++ b/drivers/usb/storage/alauda.c
> @@ -438,6 +438,8 @@ static int alauda_init_media(struct us_data *us)
>  		+ MEDIA_INFO(us).blockshift + MEDIA_INFO(us).pageshift);
>  	MEDIA_INFO(us).pba_to_lba = kcalloc(num_zones, sizeof(u16*), GFP_NOIO);
>  	MEDIA_INFO(us).lba_to_pba = kcalloc(num_zones, sizeof(u16*), GFP_NOIO);
> +	if (MEDIA_INFO(us).pba_to_lba == NULL || MEDIA_INFO(us).lba_to_pba == NULL)
> +		return USB_STOR_TRANSPORT_ERROR;
>  
>  	if (alauda_reset_media(us) != USB_STOR_XFER_GOOD)
>  		return USB_STOR_TRANSPORT_ERROR;
> -- 
> 2.25.1
> 
