Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84332C433FE
	for <linux-usb@archiver.kernel.org>; Mon, 17 Oct 2022 00:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJQAmE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 16 Oct 2022 20:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiJQAmA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 20:42:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE4C360B9;
        Sun, 16 Oct 2022 17:42:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE3AB60EB0;
        Mon, 17 Oct 2022 00:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB883C433C1;
        Mon, 17 Oct 2022 00:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665967319;
        bh=+6/iX7ck2Oohq9Zjb0OiVQciCXoiHsAIcWt5IlbTcY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R5Fxx1CuFWN2O2/LMRi+LN5bWu8nhXkqQzjWypQZgJUPQeJyR6hOnk7wJt5jvXev2
         4Tn/C+OGDb4SyLYR2a1M2jDOOROcO4Dfd5uAsLe+zdbbuC/7lOP7ELeuzk8ZweAz8e
         TE9Zz4wufl69OtWvdi7v87IzzboNOVCYV8GOq75zP+R0cwkMb8JdBIetqbgshxMLzs
         KF0qzB9tTxpSpOqyloah575XJggksD4u2Op4rCnDywbZtLA/+uJwDSIMUKfpkl/yJm
         X4Lyz5JFvH124203WQMnGJICefcwMrq8VMJl9kpBFjBFOK8emOXAH1n7nVc8pnw9bG
         P5UQgqVC27dEg==
Date:   Mon, 17 Oct 2022 08:41:53 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>, Xu Yang <xu.yang_2@nxp.com>,
        Li Jun <jun.li@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/6] usb: chipidea: Export more phy tuning parameters to
 device tree
Message-ID: <20221017004153.GC12701@nchen-desktop>
References: <20221011082924.884123-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011082924.884123-1-s.hauer@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-10-11 10:29:18, Sascha Hauer wrote:
> This series exports more phy tuning settings to device tree. There are
> some values already exported and I follow that example in this series.
> 
> Patches 1 and 2 contain two small bugfixes for issues I stumbled upon
> along the way. Patches 3 and 4 are cleanups. These patches could be
> applied without the remaining two patches.
> 
> The binding patch is based on
> https://lore.kernel.org/linux-arm-kernel/20221010101816.298334-3-peng.fan@oss.nxp.com/t/,
> so this will need a rebase once this series settles.

I have left NXP, maybe Jun Li or Yang Xu could have a review.

Peter
> 
> Sascha
> 
> Sascha Hauer (6):
>   usb: chipidea: usbmisc_imx: Fix i.MX53 clock sel masks
>   usb: chipidea: usbmisc_imx: Fix setting i.MX6SX wakeup source
>   usb: chipidea: usbmisc_imx: Use GENMASK/FIELD_PREP for bitfields
>   usb: chipidea: usbmisc_imx: Add prefix to register defines
>   usb: chipidea: usbmisc_imx: Add device tree properties for i.MX7 phy
>     tuning
>   dt-bindings: usb: ci-hdrc-usb2: Add more phy tuning properties
> 
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  79 ++++++++
>  drivers/usb/chipidea/ci_hdrc_imx.c            |  14 ++
>  drivers/usb/chipidea/ci_hdrc_imx.h            |   7 +
>  drivers/usb/chipidea/usbmisc_imx.c            | 186 ++++++++++++------
>  4 files changed, 230 insertions(+), 56 deletions(-)
> 
> -- 
> 2.30.2
> 

-- 

Thanks,
Peter Chen
