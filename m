Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17787C43461
	for <linux-usb@archiver.kernel.org>; Wed, 12 May 2021 15:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D28ED619D4
	for <linux-usb@archiver.kernel.org>; Wed, 12 May 2021 15:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhELPMB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 12 May 2021 11:12:01 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39553 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233625AbhELPJ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 11:09:56 -0400
Received: (qmail 935639 invoked by uid 1000); 12 May 2021 11:08:47 -0400
Date:   Wed, 12 May 2021 11:08:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] USB: EHCI: ehci-mv: add missing MODULE_DEVICE_TABLE
Message-ID: <20210512150847.GB934575@rowland.harvard.edu>
References: <1620801369-18642-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620801369-18642-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 12, 2021 at 02:36:09PM +0800, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/usb/host/ehci-mv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
> index cffdc8d..beb478c 100644
> --- a/drivers/usb/host/ehci-mv.c
> +++ b/drivers/usb/host/ehci-mv.c
> @@ -266,6 +266,7 @@ static const struct platform_device_id ehci_id_table[] = {
>  	{"pxa-sph", 0},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(platform, ehci_id_table);
>  
>  static void mv_ehci_shutdown(struct platform_device *pdev)
>  {

This is a bit odd.  Nothing wrong with it, of course, but it leads one 
to wonder how the driver ever worked.  Maybe the platforms that can use 
it never build the driver as a loadable module.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
