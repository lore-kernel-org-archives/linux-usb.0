Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7865C433ED
	for <linux-usb@archiver.kernel.org>; Fri, 23 Apr 2021 14:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76C256141C
	for <linux-usb@archiver.kernel.org>; Fri, 23 Apr 2021 14:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhDWOth (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 23 Apr 2021 10:49:37 -0400
Received: from mail.solidxs.nl ([176.9.52.130]:38544 "EHLO mail.solidxs.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhDWOth (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 10:49:37 -0400
X-Greylist: delayed 532 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Apr 2021 10:49:37 EDT
Received: by mail.solidxs.nl (Postfix, from userid 1000)
        id 46CA94C80C46; Fri, 23 Apr 2021 16:40:08 +0200 (CEST)
Date:   Fri, 23 Apr 2021 16:40:08 +0200
To:     Marcel Hamer <marcel@solidxs.se>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add missing link states in dwc3 gadget wakeup
Message-ID: <20210423144008.GA1420322@solidxs.nl>
References: <20210423132314.361822-1-marcel@solidxs.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423132314.361822-1-marcel@solidxs.se>
From:   Marcel Hamer <marcel@solidxs.nl>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I would like to add that I do not have the dwc3 documentation myself,
given it is not publically available. I deduced the patch from active 
debugging on my system.

Please let me know if DWC3_LINK_STATE_U1 and DWC3_LINK_STATE_U2 should
either be removed from the 'needs_wakeup =' line instead. Or if
something else is off with the proposed patch.

Kind regards,

Marcel

On Fri, Apr 23, 2021 at 03:23:14PM +0200, Marcel Hamer wrote:
> In dwc3_send_gadget_ep_cmd() a check is performed if the gadget needs
> waking up. The following condition is checked before calling the
> __dwc3_gadget_wakeup() function:
> 
> 	needs_wakeup = (dwc->link_state == DWC3_LINK_STATE_U1 ||
>         		dwc->link_state == DWC3_LINK_STATE_U2 ||
>                         dwc->link_state == DWC3_LINK_STATE_U3);
> 
> Inside __dwc3_gadget_wakeup() only link_state DWC3_LINK_STATE_U3 is checked
> and link state DWC3_LINK_STATE_U1 and DWC3_LINK_STATE_U2 are considered
> invalid and generate a warning becaus of the call to:
> 
> dev_WARN_ONCE(dwc->dev, ret, "wakeup failed --> %d\n", ret);
> 
> because of ret being -EINVAL.
> 
> Signed-off-by: Marcel Hamer <marcel@solidxs.se>
> ---
>  drivers/usb/dwc3/gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index c7ef218e7a8c..d05a7d630410 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1972,6 +1972,8 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>  	switch (link_state) {
>  	case DWC3_LINK_STATE_RESET:
>  	case DWC3_LINK_STATE_RX_DET:	/* in HS, means Early Suspend */
> +	case DWC3_LINK_STATE_U1:
> +	case DWC3_LINK_STATE_U2:
>  	case DWC3_LINK_STATE_U3:	/* in HS, means SUSPEND */
>  	case DWC3_LINK_STATE_RESUME:
>  		break;
> -- 
> 2.25.1
> 
