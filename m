Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967B2C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 18 Feb 2021 16:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EE7964EAD
	for <linux-usb@archiver.kernel.org>; Thu, 18 Feb 2021 16:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhBRQca (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Feb 2021 11:32:30 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:52464 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbhBRPaH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Feb 2021 10:30:07 -0500
Date:   Thu, 18 Feb 2021 18:29:04 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] usb: dwc3: qcom: Add missing DWC3 OF node
 refcount decrement
Message-ID: <20210218152904.75bg2v6uh5ool5h3@mobilestation>
References: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bjorn, Greg, Felippe, Andy,
Any comments on this series? Bjorn, Greg you asked me to resend the
patches related with the DW USB3 node name change. I did as you said,
but no news since then. I'd be glad to have this patch accepted in
some -next repo and forget about it.

-Sergey

On Fri, Feb 12, 2021 at 11:55:19PM +0300, Serge Semin wrote:
> of_get_child_by_name() increments the reference counter of the OF node it
> managed to find. So after the code is done using the device node, the
> refcount must be decremented. Add missing of_node_put() invocation then
> to the dwc3_qcom_of_register_core() method, since DWC3 OF node is being
> used only there.
> 
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Note the patch will get cleanly applied on the commit 2bc02355f8ba ("usb:
> dwc3: qcom: Add support for booting with ACPI"), while the bug has been
> there since the Qualcomm DWC3 glue driver was submitted.
> 
> Changelog v7:
> - This is a new patch. Please drop it If I missed something and the OF
>   node refcount decrement wasn't supposed to be there.
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c703d552bbcf..3564d00cdce3 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -639,16 +639,19 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	ret = of_platform_populate(np, NULL, NULL, dev);
>  	if (ret) {
>  		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
> -		return ret;
> +		goto node_put;
>  	}
>  
>  	qcom->dwc3 = of_find_device_by_node(dwc3_np);
>  	if (!qcom->dwc3) {
> +		ret = -ENODEV;
>  		dev_err(dev, "failed to get dwc3 platform device\n");
> -		return -ENODEV;
>  	}
>  
> -	return 0;
> +node_put:
> +	of_node_put(dwc3_np);
> +
> +	return ret;
>  }
>  
>  static int dwc3_qcom_probe(struct platform_device *pdev)
> -- 
> 2.30.0
> 
