Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DD3ECAAD1
	for <linux-usb@archiver.kernel.org>; Thu,  1 Sep 2022 13:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233915AbiIANKp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 1 Sep 2022 09:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbiIANKQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 09:10:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0F49C8F4
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 06:04:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 808F161EAE
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 13:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BF0C433C1;
        Thu,  1 Sep 2022 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662037452;
        bh=1XzddilIVlLnoxd66tgUN9YJTunQDvFS4SNnwGjBX/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=URojpcAP7q1kwj9ZADwBUSnVwIDmAU/VySxdTifNMHkrRiJw7/N2sY8PPnZVBi0UK
         ps2JAVbElYrufoEEjaIMyhn9nPM1zfpnQcbjLbUhC6WhkqdWoXETC5Af6aCN45iwFd
         /DSBqyZgb6CWMntsenshqCCzmQ3DAYWPdVef4Z80=
Date:   Thu, 1 Sep 2022 15:04:08 +0200
From:   gregkh <gregkh@linuxfoundation.org>
To:     "zhongling0719@126.com" <zhongling0719@126.com>
Cc:     zenghongling <zenghongling@kylinos.cn>,
        stern <stern@rowland.harvard.edu>,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <YxCtyOUkRlIqcC4d@kroah.com>
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>
 <YxBvNEn0jEEd0lXV@kroah.com>
 <2022090120371974113815@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2022090120371974113815@126.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 01, 2022 at 08:38:21PM +0800, zhongling0719@126.com wrote:
> Hi:
>    Sorry again, The last email was wrong, fixed my email to not send html email and respond again. 
>    The drivers manufacturers advertised high speed support platform is Windows,MacOSX, not include linux 4.9 , this bug will affect the users 
> normal use, run iozone is just one of the behaviors that trigger UAS crash ,We will handle that slow issue.

I do not understand, sorry.

What is special about Linux that causes these drives to break with the
UAS protocol?  What is it doing different that OSX and Windows does not
do?

We should fix that bug, not degrade the performance of these devices to
extremely slow levels for no good reason.

thanks,

greg k-h
