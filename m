Return-Path: <SRS0=TW+4=EF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E317BC4741F
	for <linux-usb@archiver.kernel.org>; Fri, 30 Oct 2020 15:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 957552087E
	for <linux-usb@archiver.kernel.org>; Fri, 30 Oct 2020 15:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgJ3P4k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Oct 2020 11:56:40 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36591 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgJ3P4k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 11:56:40 -0400
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A3A8AE000C;
        Fri, 30 Oct 2020 15:56:37 +0000 (UTC)
Message-ID: <0145bd8636cb9f384e5e9b7149a7d9a90bc56825.camel@hadess.net>
Subject: Re: [PATCH] USB: apple-mfi-fastcharge: fix reference leak in
 apple_mfi_fc_set_property
From:   Bastien Nocera <hadess@hadess.net>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Date:   Fri, 30 Oct 2020 16:56:36 +0100
In-Reply-To: <20201030154534.98294-1-zhangqilong3@huawei.com>
References: <20201030154534.98294-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2020-10-30 at 23:45 +0800, Zhang Qilong wrote:
> pm_runtime_get_sync() will increment pm usage counter even
> it failed. Forgetting to call pm_runtime_put_noidle will
> result in reference leak in apple_mfi_fc_set_property, so
> we should fix it.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

It looks correct, but I don't know whether it's necessary.
There's a boatload of users of that API that don't even check for the
get_sync() retval, and loads more where it's checked but never acted
upon.

Do you intend to fix all those as well?

> ---
>  drivers/usb/misc/apple-mfi-fastcharge.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c
> b/drivers/usb/misc/apple-mfi-fastcharge.c
> index b403094a6b3a..9e1ad4536e36 100644
> --- a/drivers/usb/misc/apple-mfi-fastcharge.c
> +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
> @@ -120,8 +120,10 @@ static int apple_mfi_fc_set_property(struct
> power_supply *psy,
>         dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
>  
>         ret = pm_runtime_get_sync(&mfi->udev->dev);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(&mfi->udev->dev);
>                 return ret;
> +       }
>  
>         switch (psp) {
>         case POWER_SUPPLY_PROP_CHARGE_TYPE:


