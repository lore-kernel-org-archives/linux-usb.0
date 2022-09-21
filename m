Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AFBECAAD8
	for <linux-usb@archiver.kernel.org>; Wed, 21 Sep 2022 15:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiIUPpO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 21 Sep 2022 11:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiIUPpN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 11:45:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78D44AD62;
        Wed, 21 Sep 2022 08:45:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 422AA630B2;
        Wed, 21 Sep 2022 15:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCC0C433D6;
        Wed, 21 Sep 2022 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663775111;
        bh=3QYR/yTtcrHpZIQrVevMrGLjGuHAXv67b3GogCBLetA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HLsUggvJkk6bMwnga7K3OG191onm40HSuoCawaY0pOzzpLVJtvKPn5/3fXC7HUYDu
         iqJQRxi8DgmpHUJ0Y0qD8+FeLIEoDzqEao14VPmOVFk4BgaMoWCDkcAIlcAZyI+BSy
         M4YIwmx5EY3sOhKnOLCxAHF8+yVQKOQ2Ck5+pcnI=
Date:   Wed, 21 Sep 2022 17:45:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>, sanju.mehta@amd.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix some hotplug event issues
Message-ID: <YysxhSh73nwMC1Kb@kroah.com>
References: <20220921145434.21659-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921145434.21659-1-mario.limonciello@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 21, 2022 at 09:54:31AM -0500, Mario Limonciello wrote:
> On AMD Pink Sardine it's been observed that if another CM has run before
> the Linux CM that some registers may not match expectations which leads
> to a non-functional hotplug for PCIe devices.
> 
> Explicitly set these registers that have been observed to cause problems
> with hotplug to the defaults of the USB4 spec.
> 
> Mario Limonciello (2):
>   thunderbolt: Explicitly reset plug events delay back to USB4 spec
>     value
>   thunderbolt: Explicitly enable lane adapter hotplug events at startup
> 
>  drivers/thunderbolt/switch.c  |  5 +++++
>  drivers/thunderbolt/tb.h      |  1 +
>  drivers/thunderbolt/tb_regs.h |  1 +
>  drivers/thunderbolt/usb4.c    | 19 +++++++++++++++++++
>  4 files changed, 26 insertions(+)

Any specific reason these were not tagged for stable backports?

thanks,

greg k-h
