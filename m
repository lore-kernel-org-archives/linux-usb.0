Return-Path: <SRS0=Xh9D=UM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D52C31E4B
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jun 2019 16:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E635420644
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jun 2019 16:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbfFMQg1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Jun 2019 12:36:27 -0400
Received: from verein.lst.de ([213.95.11.211]:36365 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730689AbfFMHeR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Jun 2019 03:34:17 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 21C4E68B02; Thu, 13 Jun 2019 09:33:47 +0200 (CEST)
Date:   Thu, 13 Jun 2019 09:33:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org, hch@lst.de,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190613073346.GB12093@lst.de>
References: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> +	if (max_sectors > 0) {
> +		struct device *dev = us->pusb_dev->bus->sysdev;
> +		size_t max_dma_sectors = dma_max_mapping_size(dev) >>
> +					 SECTOR_SHIFT;
> +
> +		max_sectors = min_t(size_t, max_sectors, max_dma_sectors);
> +		blk_queue_max_hw_sectors(sdev->request_queue, max_sectors);

I think we need to do this unconditionally for the rare (or maybe even
theoretical case) of a dma max mapping size smaller than the default
max_sectos.

So something like this:

	blk_queue_max_hw_sectors(sdev->request_queue,
		min_t(unsigned long,
			queue_max_hw_sectors(sdev->request_queue),
			dma_max_mapping_size(dev) >> SECTOR_SHIFT));

