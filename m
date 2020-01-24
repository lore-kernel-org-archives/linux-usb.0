Return-Path: <SRS0=idDB=3N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AFBC2D0CE
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 08:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD4F82071A
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 08:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579855250;
	bh=I3en2y2CGIo3aUdNKhO2C5ohx4tSyU0R6Gp4OqTlAr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=H8ByKivdA7d9PittF60Qybw6f5AfQFSppPs/RMCS06OIR54Jv7lpYHtebYtoBA6NI
	 09oebnPqWVdGvEdw5wJbZuxAQs79Y9LWvTlcvhH0nYs4jHh5OeIVbcgxI/Kmo7Wnbw
	 C0/wyJeofLrRsHDgOufV5v16N8E0dGHTNOOu37Q0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgAXIku (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Jan 2020 03:40:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:60766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgAXIku (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jan 2020 03:40:50 -0500
Received: from localhost (unknown [145.15.244.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FC812070A;
        Fri, 24 Jan 2020 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579855249;
        bh=I3en2y2CGIo3aUdNKhO2C5ohx4tSyU0R6Gp4OqTlAr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vreTIov7JzazptosyUuCMqB6IbVgo7ZL8RbiHt6MI89/a4NdwkxAuE0jrKHQQ6rTj
         6O6gkaqcXFw1qKMzFSwTqA4Ob2qnBzhIeKbKEnrsJmNN1KPC1fq6nrQHPySZcJ/mrL
         fYG0z3nzt0+FqvU3wYctsvCruD/zPp8RGYLerN8M=
Date:   Fri, 24 Jan 2020 09:40:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        jun.li@nxp.com
Subject: Re: [PATCH v4 1/2] usb: phy: show USB charger type for user
Message-ID: <20200124084039.GB2923791@kroah.com>
References: <1579145333-1657-1-git-send-email-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579145333-1657-1-git-send-email-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 16, 2020 at 11:28:52AM +0800, Peter Chen wrote:
> Current USB charger framework only shows charger state for user, but the
> user may also need charger type for further use, add support for it.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v4:
> - No changes.
> 
>  drivers/usb/phy/phy.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 0277f62739a2..ad2554630889 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -34,6 +34,14 @@ struct phy_devm {
>  	struct notifier_block *nb;
>  };
>  
> +static const char *const usb_chger_type[] = {
> +	[UNKNOWN_TYPE]			= "USB_CHARGER_UNKNOWN_TYPE",
> +	[SDP_TYPE]			= "USB_CHARGER_SDP_TYPE",
> +	[CDP_TYPE]			= "USB_CHARGER_CDP_TYPE",
> +	[DCP_TYPE]			= "USB_CHARGER_DCP_TYPE",
> +	[ACA_TYPE]			= "USB_CHARGER_ACA_TYPE",
> +};

As these are exported values (CDP_TYPE and friends), they really need to
have explicit values on the .h file, otherwise it might not work
properly on all systems.

But that's kind of independant of this series, sorry, I just noticed it.

greg k-h
