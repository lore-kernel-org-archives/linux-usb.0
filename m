Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E788C433B4
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 07:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A67C161057
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 07:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhDHHUZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Apr 2021 03:20:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15177 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbhDHHUX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 03:20:23 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGCJN74QYzpVX5;
        Thu,  8 Apr 2021 15:17:24 +0800 (CST)
Received: from [10.67.102.118] (10.67.102.118) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 15:20:06 +0800
Subject: Re: [PATCH] USB:ehci:fix ehci hardware problem
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <stern@rowland.harvard.edu>, <liudongdong3@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kong.kongxinwei@hisilicon.com>, <yisen.zhuang@huawei.com>
References: <1617865425-28782-1-git-send-email-liulongfang@huawei.com>
From:   liulongfang <liulongfang@huawei.com>
Message-ID: <177a1fbd-b6f0-2e67-2e5a-5b05d2015b3a@huawei.com>
Date:   Thu, 8 Apr 2021 15:19:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1617865425-28782-1-git-send-email-liulongfang@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/4/8 15:03, Longfang Liu wrote:
> When rebooting the EHCI driver, ehci_shutdown() will be called.
> if the sbrn flag is 0, ehci_shutdown() will return directly.
> 
> Our EHCI hardware does not define the SBRN register, which cause
> its value to default to 0. The sbrn flag being 0 will cause the
> EHCI interrupt signal to not be turned off after reboot. An interrupt
> that is not closed will cause an exception to the device sharing
> the interrupt.
> 
> Currently, our hardware has this problem. We hope to solve this
> problem by skipping reading the sbrn register value. On the next
> generation of hardware, we will define this SBRN register in accordance
> with the controller standard.
> 
> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
> ---
>  drivers/usb/host/ehci-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> index 3c3820a..5dc6821 100644
> --- a/drivers/usb/host/ehci-pci.c
> +++ b/drivers/usb/host/ehci-pci.c
> @@ -291,6 +291,8 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>  	if (pdev->vendor == PCI_VENDOR_ID_STMICRO
>  	    && pdev->device == PCI_DEVICE_ID_STMICRO_USB_HOST)
>  		;	/* ConneXT has no sbrn register */
> +	else if (pdev->vendor == PCI_VENDOR_ID_HUAWEI)
> +		;	/* sbrn register is undefined */
>  	else
>  		pci_read_config_byte(pdev, 0x60, &ehci->sbrn);
>  
> 
Sorry, please ignore this patch, I will resend it.
Thanks.
Longfang.
