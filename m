Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FFFC433F5
	for <linux-usb@archiver.kernel.org>; Sun, 19 Sep 2021 08:09:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAA5261074
	for <linux-usb@archiver.kernel.org>; Sun, 19 Sep 2021 08:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhISILQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 19 Sep 2021 04:11:16 -0400
Received: from mail.v3.sk ([167.172.186.51]:53056 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231346AbhISILQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Sep 2021 04:11:16 -0400
X-Greylist: delayed 327 seconds by postgrey-1.27 at vger.kernel.org; Sun, 19 Sep 2021 04:11:15 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id D1957DF899;
        Sun, 19 Sep 2021 07:55:34 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id bfo8kFGkd-8V; Sun, 19 Sep 2021 07:55:34 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id BE704E1BF5;
        Sun, 19 Sep 2021 07:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vjVf6D2RSTGF; Sun, 19 Sep 2021 07:55:33 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 84BECDF899;
        Sun, 19 Sep 2021 07:55:33 +0000 (UTC)
Date:   Sun, 19 Sep 2021 10:04:14 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-mv: drop duplicated MODULE_ALIAS
Message-ID: <YUbu/skzkdvw5VCN@demiurge.local>
References: <20210916170531.138335-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916170531.138335-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 16, 2021 at 07:05:31PM +0200, Krzysztof Kozlowski wrote:
> There is one MODULE_ALIAS already.
> 
> Fixes: 0440fa3d1b4e ("USB: EHCI: make ehci-mv a separate driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thanks,

Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>

> ---
>  drivers/usb/host/ehci-mv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
> index 8fd27249ad25..fa46d217dd10 100644
> --- a/drivers/usb/host/ehci-mv.c
> +++ b/drivers/usb/host/ehci-mv.c
> @@ -258,8 +258,6 @@ static int mv_ehci_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -MODULE_ALIAS("mv-ehci");
> -
>  static const struct platform_device_id ehci_id_table[] = {
>  	{"pxa-u2oehci", 0},
>  	{"pxa-sph", 0},
> -- 
> 2.30.2
> 
