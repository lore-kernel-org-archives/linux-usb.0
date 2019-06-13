Return-Path: <SRS0=Xh9D=UM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0BEC31E4A
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jun 2019 17:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F9B82053B
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jun 2019 17:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfFMRVs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Jun 2019 13:21:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:60602 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726797AbfFMRVs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 13:21:48 -0400
Received: (qmail 4242 invoked by uid 2102); 13 Jun 2019 13:21:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Jun 2019 13:21:47 -0400
Date:   Thu, 13 Jun 2019 13:21:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Christoph Hellwig <hch@lst.de>
cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <usb-storage@lists.one-eyed-alien.net>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] usb-storage: Add a limitation for blk_queue_max_hw_sectors()
In-Reply-To: <20190613171112.GA22155@lst.de>
Message-ID: <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 13 Jun 2019, Christoph Hellwig wrote:

> On Thu, Jun 13, 2019 at 01:06:40PM -0400, Alan Stern wrote:
> > Hmmm.  Would it be easier instead to copy the DMA mapping parameters
> > from us->pusb_dev->bus->sysdev into the SCSI host's parent before
> > calling scsi_add_host()?  That way the correct values would be
> > available from the beginning, so the existing DMA setup would
> > automatically use the correct sizes.
> 
> It would in theory.  But at usb-storage has a special max_sectors quirk
> for tape devices, and as the device type is a per-LU property we'd
> still have to override it in ->slave_configure.

Not just for tape devices.  But that's okay; those max_sectors
overrides have been present for a long time and we can keep them.  
Getting rid of the virt_boundary_mask stuff would still be a big
improvement.

Alan Stern

