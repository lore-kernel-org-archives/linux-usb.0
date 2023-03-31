Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682A3C77B60
	for <linux-usb@archiver.kernel.org>; Fri, 31 Mar 2023 16:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjCaQnn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbjCaQn0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Mar 2023 12:43:26 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 150F749D8
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 09:41:25 -0700 (PDT)
Received: (qmail 241997 invoked by uid 1000); 31 Mar 2023 12:41:24 -0400
Date:   Fri, 31 Mar 2023 12:41:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv1 0/2] generic-ohci: increase allowed clocks
Message-ID: <cc3a91de-c716-48de-b1b1-b3f242156c71@rowland.harvard.edu>
References: <20230331163148.5863-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331163148.5863-1-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 31, 2023 at 06:31:46PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> This increases the max. allowed clocks for generic-ohci from 3 to 4.
> On RK3588 a total of 4 clocks is required to access the OHCI registers.
> Note, that EHCI already supports 4 clocks.
> 
> -- Sebastian
> 
> Sebastian Reichel (2):
>   dt-bindings: usb: generic-ohci: increase allowed clocks
>   usb: host: ohci-platform: increase max clock number to 4
> 
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 +-
>  drivers/usb/host/ohci-platform.c                        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>
