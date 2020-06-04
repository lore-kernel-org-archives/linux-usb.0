Return-Path: <SRS0=00yl=7R=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1880FC433DF
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jun 2020 14:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF47B206E6
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jun 2020 14:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgFDO0J (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Jun 2020 10:26:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55721 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728663AbgFDO0J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jun 2020 10:26:09 -0400
Received: (qmail 27143 invoked by uid 1000); 4 Jun 2020 10:26:08 -0400
Date:   Thu, 4 Jun 2020 10:26:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Longfang Liu <liulongfang@huawei.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        kong.kongxinwei@hisilicon.com, huangdaode@huawei.com,
        yisen.zhuang@huawei.com
Subject: Re: [PATCH v2] USB: ehci: reopen solution for Synopsys HC bug
Message-ID: <20200604142608.GB26797@rowland.harvard.edu>
References: <1591236678-36009-1-git-send-email-liulongfang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591236678-36009-1-git-send-email-liulongfang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 04, 2020 at 10:11:18AM +0800, Longfang Liu wrote:
> A Synopsys USB2.0 core used in Huawei Kunpeng920 SoC has a bug which
> might cause the host controller not issuing ping.
> 
> Bug description:
> After indicating an Interrupt on Async Advance, the software uses the
> doorbell mechanism to delete the Next Link queue head of the last
> executed queue head. At this time, the host controller still references
> the removed queue head(the queue head is NULL). NULL reference causes
> the host controller to lose the USB device.
> 
> Solution:
> After deleting the Next Link queue head, the software can write one of the
> valid queue head addresses to the ASYNCLISTADDR register to allow
> the host controller to get the valid queue head.
> 
> There are detailed instructions and solutions in this patch:
> commit 2f7ac6c19997 ("USB: ehci: add workaround for Synopsys HC bug")
> 
> Signed-off-by: Longfang Liu <liulongfang@huawei.com>

This is a very bad patch description.  Do you understand why?  Because 
it doesn't describe what the patch actually does!

The description talks about the original bug -- what it was and how it 
was fixed.  But this patch doesn't contain the bug fix.  Instead, all 
this patch does is set a quirk flag for the Huawei Kunpeng920.  The 
patch description should explain why the quirk flag needs to be set; it 
doesn't have to explain the original bug.

Alan Stern

> ---
> 
> Changes in V2:
> - updated comment message
> 
>  drivers/usb/host/ehci-pci.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> index 1a48ab1..7ff2cbd 100644
> --- a/drivers/usb/host/ehci-pci.c
> +++ b/drivers/usb/host/ehci-pci.c
> @@ -216,6 +216,13 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>  		ehci_info(ehci, "applying MosChip frame-index workaround\n");
>  		ehci->frame_index_bug = 1;
>  		break;
> +	case PCI_VENDOR_ID_HUAWEI:
> +		/* Synopsys HC bug */
> +		if (pdev->device == 0xa239) {
> +			ehci_info(ehci, "applying Synopsys HC workaround\n");
> +			ehci->has_synopsys_hc_bug = 1;
> +		}
> +		break;
>  	}
>  
>  	/* optional debug port, normally in the first BAR */
> -- 
> 2.8.1
> 
