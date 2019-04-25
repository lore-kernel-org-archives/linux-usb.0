Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CD7C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 23:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9381320717
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556233787;
	bh=tXW1dtPwQ9IRjFrqML0Gp0o4kasQlCaLawM4Vnx/buY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=jYt8jn/yJ6SAkvUIHkOLVxcycOoeHDhbI1T4BSK9WikdNp2Gc1wHQ8gimdIyKFgyt
	 rChPpRKAcTjp8PVkLE1QWj3QTCLvIJeBV4uQBOaxKHvFBfYbrl26yn7pQXe0BDNzAO
	 fckz34T0fO+xZv31uu5FS2vsHx4+p8N6+5TkSOU4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfDYXJp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 19:09:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:44034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbfDYXJp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 19:09:45 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE94B20717;
        Thu, 25 Apr 2019 23:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556233785;
        bh=tXW1dtPwQ9IRjFrqML0Gp0o4kasQlCaLawM4Vnx/buY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fOuVEvhQ9+8vBFBW78ep4ymnzSLLDpNO9HldgCI0IBIlSob95ABWGgIPqlg8ahcLM
         FrWaXIsa/wqQziQZ1iTSY353SZ1poY2PSwPFoOGwbNr41gpp3uf7GDKA0VmfJkFvfx
         TVlVkCUe0K66OdLPupltsPXtJP0uKWJkz+46IP+E=
Subject: Re: [PATCH] usbip: stub_rx: tidy the indenting in is_clear_halt_cmd()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Valentina Manea <valentina.manea.m@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20190424095414.GB16664@mwanda>
From:   shuah <shuah@kernel.org>
Message-ID: <e13158e8-296f-bcef-eb03-0ef0ef735a1d@kernel.org>
Date:   Thu, 25 Apr 2019 17:09:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424095414.GB16664@mwanda>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425230943.gafC5oRjpXT2fw3UWk1Z53hdat_MfJpJfRYp2suRcTk@z>

On 4/24/19 3:54 AM, Dan Carpenter wrote:
> There is an extra space character before the return statement.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 97b09a42a10c..f3230bed18af 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -17,9 +17,9 @@ static int is_clear_halt_cmd(struct urb *urb)
>   
>   	req = (struct usb_ctrlrequest *) urb->setup_packet;
>   
> -	 return (req->bRequest == USB_REQ_CLEAR_FEATURE) &&
> -		 (req->bRequestType == USB_RECIP_ENDPOINT) &&
> -		 (req->wValue == USB_ENDPOINT_HALT);
> +	return (req->bRequest == USB_REQ_CLEAR_FEATURE) &&
> +	       (req->bRequestType == USB_RECIP_ENDPOINT) &&
> +	       (req->wValue == USB_ENDPOINT_HALT);
>   }
>   
>   static int is_set_interface_cmd(struct urb *urb)
> 

Thanks for the patch.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
