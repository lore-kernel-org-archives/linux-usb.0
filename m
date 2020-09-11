Return-Path: <SRS0=9hDM=CU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74A9C433E2
	for <linux-usb@archiver.kernel.org>; Fri, 11 Sep 2020 16:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80588221EB
	for <linux-usb@archiver.kernel.org>; Fri, 11 Sep 2020 16:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIKQdV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:33:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37739 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726458AbgIKPRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Sep 2020 11:17:38 -0400
Received: (qmail 884626 invoked by uid 1000); 11 Sep 2020 11:17:34 -0400
Date:   Fri, 11 Sep 2020 11:17:34 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: ohci: Make distrust_firmware param default
 to false
Message-ID: <20200911151734.GB884518@rowland.harvard.edu>
References: <20200910212512.16670-1-hamish.martin@alliedtelesis.co.nz>
 <20200910212512.16670-2-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910212512.16670-2-hamish.martin@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 11, 2020 at 09:25:12AM +1200, Hamish Martin wrote:
> The 'distrust_firmware' module parameter dates from 2004 and the USB
> subsystem is a lot more mature and reliable now than it was then.
> Alter the default to false now.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
> ---
>  drivers/usb/host/ohci-hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index 2845ea328a06..73e13e7c2b46 100644
> --- a/drivers/usb/host/ohci-hcd.c
> +++ b/drivers/usb/host/ohci-hcd.c
> @@ -102,7 +102,7 @@ static void io_watchdog_func(struct timer_list *t);
>  
>  
>  /* Some boards misreport power switching/overcurrent */
> -static bool distrust_firmware = true;
> +static bool distrust_firmware;
>  module_param (distrust_firmware, bool, 0);
>  MODULE_PARM_DESC (distrust_firmware,
>  	"true to distrust firmware power/overcurrent setup");
> -- 
> 2.28.0

Acked-by: Alan Stern <stern@rowland.harvard.edu>
