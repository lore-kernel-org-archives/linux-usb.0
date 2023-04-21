Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F65C7618E
	for <linux-usb@archiver.kernel.org>; Fri, 21 Apr 2023 08:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjDUIUD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 Apr 2023 04:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjDUIUC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Apr 2023 04:20:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD99524B;
        Fri, 21 Apr 2023 01:20:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B5DB64E38;
        Fri, 21 Apr 2023 08:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3706C433D2;
        Fri, 21 Apr 2023 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1682065200;
        bh=WA3xrg142/hkPVe+A6GFv5GD7hvKC88OslgXgbkmlhk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jc50rMcRLMk5vIJzlaOApFgPwBDRiRTOXdk+51a2JPlVCa8LnXyU5PagUN1rWqxA4
         lltrAI8JEOeS0avJaRUFxryAtYWFDVlT8Md8JjKZOcHW941nSxY5yyIW6ZDytTFl8c
         Kdw4h/05lR1XFBR2d4uLp1XLGv/enVlM84UK/D4E=
Date:   Fri, 21 Apr 2023 10:19:57 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stanley Chang <stanley_chang@realtek.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Douglas Anderson <dianders@chromium.org>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Bhuvanesh Surachari <Bhuvanesh_Surachari@mentor.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Ray Chi <raychi@google.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: phy: add usb phy notify port status API
Message-ID: <ZEJHLR27pVwVI3_J@kroah.com>
References: <20230421080333.18681-1-stanley_chang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421080333.18681-1-stanley_chang@realtek.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 21, 2023 at 04:03:31PM +0800, Stanley Chang wrote:
> In Realtek SoC, the parameter of usb phy is designed to can dynamic
> tuning base on port status. Therefore, add a notify callback of phy
> driver when usb port status change.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---
>  drivers/usb/core/hub.c  | 13 +++++++++++++
>  include/linux/usb/phy.h | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)

We can not add callbacks in the kernel that are not actually used,
otherwise they will just be instantly removed.

Please submit any drivers that need this change at the same time so that
we can verify that the callback is actually correct and needed,
otherwise we can not take this change.

thanks,

greg k-h
