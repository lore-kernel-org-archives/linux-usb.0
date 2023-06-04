Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28490C7EE23
	for <linux-usb@archiver.kernel.org>; Sun,  4 Jun 2023 23:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbjFDXSp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 4 Jun 2023 19:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjFDXSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 19:18:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F1FA9;
        Sun,  4 Jun 2023 16:18:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D72E601DA;
        Sun,  4 Jun 2023 23:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DBBC433EF;
        Sun,  4 Jun 2023 23:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685920721;
        bh=rzuhfw4wzgpQy0GTjTxMvrd2y7D1c09iZqWSEs5zQWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AVjjmq6UY/hh81nSi8XRyKs9xn4idclj8mBAU3xdzk+dH1sqBPsV73Y653pgwFOlJ
         YLKWWwzmNiPHbKKgyF0Wy/oVKeDldxx3bpigsvy3MOKysmHn/hAfKqJP+x2mpL48eZ
         c0faK4yTOYdM/EoNyxzQeMcpQyJoFjxhtqNOErfUqVd+auf+VD9k8yY6kIqj4WHkmL
         EpPhmWHBUETv+loJvClDjKoykkeXHMdpf2RmgV9aLchkFCcv8ms2+Zjv9OQU3GEaZF
         48Ota50DxFtaHSdOZy+t+LzWYybnAHyFa9kymEgMmq7sChBWZNhZU/1vlge8/VpwOy
         pPBWhNB/UI6Ng==
Date:   Mon, 5 Jun 2023 07:18:30 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, peng.fan@nxp.com
Subject: Re: [PATCH 2/2] usb: chipidea: imx: don't request QoS for imx8ulp
Message-ID: <20230604231830.GE258497@nchen-desktop>
References: <20230530104007.1294702-1-xu.yang_2@nxp.com>
 <20230530104007.1294702-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530104007.1294702-2-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-05-30 18:40:07, Xu Yang wrote:
> Use dedicated imx8ulp usb compatible to remove QoS request
> since imx8ulp has no such limitation of imx7ulp: DMA will
> not work if system enters idle.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 9f0f4ec701c5..336ef6dd8e7d 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -70,6 +70,10 @@ static const struct ci_hdrc_imx_platform_flag imx7ulp_usb_data = {
>  		CI_HDRC_PMQOS,
>  };
>  
> +static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
> +	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM,
> +};
> +
>  static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
>  	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
> @@ -80,6 +84,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx6ul-usb", .data = &imx6ul_usb_data},
>  	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
> +	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
> -- 
> 2.34.1
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen
