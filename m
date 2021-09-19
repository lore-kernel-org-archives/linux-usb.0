Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B4AC433FE
	for <linux-usb@archiver.kernel.org>; Sun, 19 Sep 2021 12:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E08E461074
	for <linux-usb@archiver.kernel.org>; Sun, 19 Sep 2021 12:12:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhISMNg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 19 Sep 2021 08:13:36 -0400
Received: from rosenzweig.io ([138.197.143.207]:46684 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229662AbhISMNe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Sep 2021 08:13:34 -0400
Date:   Sun, 19 Sep 2021 07:33:58 -0400
From:   Alyssa Rosenzweig <alyssa@rosenzweig.io>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alexander Graf <graf@amazon.com>
Subject: Re: [RFT PATCH 9/9] usb: typec: tipd: Remove FIXME about testing
 with I2C_FUNC_I2C
Message-ID: <YUcgJlaw+9yrB+tZ@sunset>
References: <20210918120934.28252-1-sven@svenpeter.dev>
 <20210918120934.28252-10-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210918120934.28252-10-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

On Sat , Sep 18, 2021 at 02:09:34PM +0200, Sven Peter wrote:
> The Apple i2c bus uses I2C_FUNC_I2C and I've tested this quite
> extensivly in the past days. Remove the FIXME about that testing :-)
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/usb/typec/tipd/core.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 26807c050662..3b6878e22ce9 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -673,9 +673,6 @@ static int tps6598x_probe(struct i2c_client *client)
>  	/*
>  	 * Checking can the adapter handle SMBus protocol. If it can not, the
>  	 * driver needs to take care of block reads separately.
> -	 *
> -	 * FIXME: Testing with I2C_FUNC_I2C. regmap-i2c uses I2C protocol
> -	 * unconditionally if the adapter has I2C_FUNC_I2C set.
>  	 */
>  	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
>  		tps->i2c_protocol = true;
> -- 
> 2.25.1
> 
