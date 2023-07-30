Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA0AC001DE
	for <linux-usb@archiver.kernel.org>; Sun, 30 Jul 2023 11:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjG3LV5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 30 Jul 2023 07:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjG3LVz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Jul 2023 07:21:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EE3198C
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 04:21:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C842A60C07
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 11:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF83CC433C7;
        Sun, 30 Jul 2023 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690716114;
        bh=d5cXKEa98CkccFbX7z5Yy+edmhGp37e3Sz0j4bKvfC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lz3cEeZ7EtauT9PvCC/G+SkMGuM4DcbIhr8Jm2U2e/zogzF5eqqRRTu0koLCaAXCt
         L7jh1DbJh1Sd8frpqEM+Otl7aewuS9v4K3QSFMA4ilf7acjp4lzAhRGuclb6gzIYTe
         RUrbfjxTycpJhNC0KgesXVhE6bfQB/t5nqQkGtFg=
Date:   Sun, 30 Jul 2023 13:21:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ross Maynard <bids.7405@bigpond.com>
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, kuba@kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] USB: zaurus: Add ID for A-300/B-500/C-700
Message-ID: <2023073011-happening-caption-59d7@gregkh>
References: <8b15ff2c-baaa-eb73-5fc9-b77ba6482bd5@bigpond.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b15ff2c-baaa-eb73-5fc9-b77ba6482bd5@bigpond.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 27, 2023 at 07:46:44PM +1000, Ross Maynard wrote:
> The SL-A300, B500/5600, and C700 devices no longer auto-load because of
> "usbnet: Remove over-broad module alias from zaurus."
> This patch adds IDs for those 3 devices.
> 
> Reported-by: Ross Maynard <bids.7405@bigpond.com>

No need for a reported-by if you also are fixing the issue :)

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217632
> Fixes: 16adf5d07987 ("usbnet: Remove over-broad module alias from zaurus.")
> Signed-off-by: Ross Maynard <bids.7405@bigpond.com>

Please also add a cc: stable@vger.kernel.org entry as per:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

thanks,

greg k-h
