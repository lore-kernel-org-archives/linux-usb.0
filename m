Return-Path: <SRS0=Q74q=EK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77645C388F7
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 14:19:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13CDE221F8
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604499592;
	bh=drHiAZU+rbEeq0MVf5Tfst/CWZt0lKO0NS8hiMArGzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cMWhGyj1AQSqZP7+c8SPZsPk4oKxl5Y3xu9TO1HNLBi84Snc+vSruhl2EXtvd87cx
	 C8KN7D/jBXMJuL/AmNHEp0Qf//hB8GrvS36MSzb12leP2Wa+xA6F8C5O7IaAJ0IZkX
	 hyLOTjQ5SvM4dFg5j0vYcuUsdiBRyV5DHhfdBLlo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKDOTt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:19:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:40472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgKDOTs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Nov 2020 09:19:48 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C123221E2;
        Wed,  4 Nov 2020 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604499588;
        bh=drHiAZU+rbEeq0MVf5Tfst/CWZt0lKO0NS8hiMArGzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I3qQq/okPvGS2aXMWpH9jpKmTckMoUxaofjT0GBeJkwlkN1keLjdGKXZ1Up6HWOJK
         /BviFiV88JrwvO5wah1a6ptpRalGK3KTMnN3+yF9iz+vqymNo5SFbbNvxHIaTmxYaq
         xU8w8IGCIcQNnoNbW6KcQOPxBkxhdcyBQkYlJsOU=
Date:   Wed, 4 Nov 2020 15:20:38 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Subject: Re: [PATCH 06/10] thunderbolt: Create debugfs directory
 automatically for services
Message-ID: <20201104142038.GA2201525@kroah.com>
References: <20201104140030.6853-1-mika.westerberg@linux.intel.com>
 <20201104140030.6853-7-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104140030.6853-7-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 04, 2020 at 05:00:26PM +0300, Mika Westerberg wrote:
> This allows service drivers to use it as parent directory if they need
> to add their own debugfs entries.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/debugfs.c | 24 ++++++++++++++++++++++++
>  drivers/thunderbolt/tb.h      |  4 ++++
>  drivers/thunderbolt/xdomain.c |  3 +++
>  include/linux/thunderbolt.h   |  4 ++++
>  4 files changed, 35 insertions(+)
> 
> diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> index ed65d2b13964..a80278fc50af 100644
> --- a/drivers/thunderbolt/debugfs.c
> +++ b/drivers/thunderbolt/debugfs.c
> @@ -691,6 +691,30 @@ void tb_switch_debugfs_remove(struct tb_switch *sw)
>  	debugfs_remove_recursive(sw->debugfs_dir);
>  }
>  
> +/**
> + * tb_service_debugfs_init() - Add debugfs directory for service
> + * @svc: Thunderbolt service pointer
> + *
> + * Adds debugfs directory for service.
> + */
> +void tb_service_debugfs_init(struct tb_service *svc)
> +{
> +	svc->debugfs_dir = debugfs_create_dir(dev_name(&svc->dev),
> +					      tb_debugfs_root);
> +}
> +
> +/**
> + * tb_service_debugfs_remove() - Remove service debugfs directory
> + * @svc: Thunderbolt service pointer
> + *
> + * Removes the previously created debugfs directory for @svc.
> + */
> +void tb_service_debugfs_remove(struct tb_service *svc)
> +{
> +	debugfs_remove(svc->debugfs_dir);

debugfs_remove_recursive() just to be safe that you really did clean
everything up?  As you aren't "owning" this directory here, you don't
know what will get added by some other patch :)

Other than that tiny nit, this series looks good to me, nice work.

thanks,

greg k-h
