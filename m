Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5662ECAAD4
	for <linux-usb@archiver.kernel.org>; Wed, 31 Aug 2022 14:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiHaOd7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 31 Aug 2022 10:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbiHaOdr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 10:33:47 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 903B6A3D0A
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 07:33:46 -0700 (PDT)
Received: (qmail 191927 invoked by uid 1000); 31 Aug 2022 10:33:45 -0400
Date:   Wed, 31 Aug 2022 10:33:45 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     zenghongling <zhongling0719@126.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <Yw9xSSAse3ATVRtk@rowland.harvard.edu>
References: <1661930031-21908-1-git-send-email-zhongling0719@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661930031-21908-1-git-send-email-zhongling0719@126.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 31, 2022 at 03:13:51PM +0800, zenghongling wrote:
> The UAS mode of Thinkplus and Hiksemi is reported to fail to work on
> several platforms with the following error message:
> 
> [   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled endpoint or incorrect stream ring
> [   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000 1b000000 05038000
> 
> And when running iozone will disconnect from the USB controller, then after re-connecting the device
> will be offlined and not working at all.

Are you sure these failures are caused by bugs in the devices and not 
by bugs in the xHCI controller or its driver?

What happens if you plug one of these drives into a computer running 
Windows or Mac OSX?  Do those operating systems avoid using the UAS 
protocol with the drive?

Alan Stern
