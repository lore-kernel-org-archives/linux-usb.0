Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1D2C433DB
	for <linux-usb@archiver.kernel.org>; Mon, 11 Jan 2021 17:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ED3822AAD
	for <linux-usb@archiver.kernel.org>; Mon, 11 Jan 2021 17:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389200AbhAKRHp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 11 Jan 2021 12:07:45 -0500
Received: from netrider.rowland.org ([192.131.102.5]:43871 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2389195AbhAKRHo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 12:07:44 -0500
Received: (qmail 1201009 invoked by uid 1000); 11 Jan 2021 12:07:03 -0500
Date:   Mon, 11 Jan 2021 12:07:03 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Longfang Liu <liulongfang@huawei.com>
Cc:     gregkh@linuxfoundation.org, yisen.zhuang@huawei.com,
        kong.kongxinwei@hisilicon.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB:ehci:fix an interrupt calltrace error
Message-ID: <20210111170703.GD1196682@rowland.harvard.edu>
References: <1610364577-11617-1-git-send-email-liulongfang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610364577-11617-1-git-send-email-liulongfang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 11, 2021 at 07:29:37PM +0800, Longfang Liu wrote:
> The system that use Synopsys USB host controllers goes to suspend
> when using USB audio player. This causes the USB host controller
> continuous send interrupt signal to system, When the number of
> interrupts exceeds 100000, the system will forcibly close the
> interrupts and output a calltrace error.
> 
> When the system goes to suspend, the last interrupt is reported to
> the driver. At this time, the system has set the state to suspend.
> This causes the last interrupt to not be processed by the system and
> not clear the interrupt flag. This uncleared interrupt flag constantly
> triggers new interrupt event. This causing the driver to receive more
> than 100,000 interrupts, which causes the system to forcibly close the
> interrupt report and report the calltrace error.
> 
> so, when the driver goes to sleep and changes the system state to
> suspend, the interrupt flag needs to be cleared.
> 
> Signed-off-by: Longfang Liu <liulongfang@huawei.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> 
> Changes in v2:
> - updated cleared registers
> 
>  drivers/usb/host/ehci-hub.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
> index ce0eaf7..a99c1ac 100644
> --- a/drivers/usb/host/ehci-hub.c
> +++ b/drivers/usb/host/ehci-hub.c
> @@ -346,8 +346,12 @@ static int ehci_bus_suspend (struct usb_hcd *hcd)
>  
>  	unlink_empty_async_suspended(ehci);
>  
> +	/* Some Synopsys controllers mistakenly leave IAA turned on */
> +	ehci_writel(ehci, STS_IAA, &ehci->regs->status);
> +
>  	/* Any IAA cycle that started before the suspend is now invalid */
>  	end_iaa_cycle(ehci);
> +
>  	ehci_handle_start_intr_unlinks(ehci);
>  	ehci_handle_intr_unlinks(ehci);
>  	end_free_itds(ehci);
> -- 
> 2.8.1
> 
