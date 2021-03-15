Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3ACBC433E0
	for <linux-usb@archiver.kernel.org>; Mon, 15 Mar 2021 14:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ADB164EEB
	for <linux-usb@archiver.kernel.org>; Mon, 15 Mar 2021 14:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhCOOO2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Mar 2021 10:14:28 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39671 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231390AbhCOONl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Mar 2021 10:13:41 -0400
Received: (qmail 403655 invoked by uid 1000); 15 Mar 2021 10:13:35 -0400
Date:   Mon, 15 Mar 2021 10:13:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     taehyun cho <taehyun.cho@samsung.com>
Cc:     balbi@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: remove 'pm_runtime_set_active' in resume
 callback
Message-ID: <20210315141335.GA402778@rowland.harvard.edu>
References: <CGME20210315074223epcas2p11ddf190ec730f8629c1310117135f813@epcas2p1.samsung.com>
 <20210315074317.7736-1-taehyun.cho@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315074317.7736-1-taehyun.cho@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 15, 2021 at 04:43:17PM +0900, taehyun cho wrote:
> 'pm_runtime_set_active' sets a flag to describe rumtime status.
> This flag is automatically set in pm_runtime_get_sync/put_sync API.
> 'pm_runtime_set_active' checks the runtime status of parent device.
> As a result, the below error message is printed.
> dwc3 11110000.dwc3: runtime PM trying to activate child device
> 11110000.dwc3 but parent (11110000.usb) is not active.

This is very suspicious.  That error message indicates a real error is 
present; removing these pm_runtime_set_active calls won't fix the error.

You need to determine why the parent platform device 11110000.usb isn't 
active when the dwc3 probe and resume routines are called.  It seems 
likely that there is a bug in the platform device's driver.

Alan Stern

> Signed-off-by: taehyun cho <taehyun.cho@samsung.com>
> ---
>  drivers/usb/dwc3/core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 94fdbe502ce9..e7c0e390f885 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1553,7 +1553,6 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&dwc->lock);
>  
> -	pm_runtime_set_active(dev);
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_set_autosuspend_delay(dev, DWC3_DEFAULT_AUTOSUSPEND_DELAY);
>  	pm_runtime_enable(dev);
> @@ -1920,7 +1919,6 @@ static int dwc3_resume(struct device *dev)
>  		return ret;
>  
>  	pm_runtime_disable(dev);
> -	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -- 
> 2.26.0
