Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35280C282CE
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 19:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 093972084B
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 19:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfDIT5Q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 15:57:16 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46950 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726496AbfDIT5Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 15:57:16 -0400
Received: (qmail 7117 invoked by uid 2102); 9 Apr 2019 15:57:15 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Apr 2019 15:57:15 -0400
Date:   Tue, 9 Apr 2019 15:57:15 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <6FA377F5-595C-4197-850C-5DD8C1B172D5@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904091552331.1599-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 9 Apr 2019, Bollinger, Seth wrote:

> > Seth, you can try adding:
> >
> >  blk_queue_virt_boundary(sdev->request_queue, 1024 - 1)
> >
> > in drivers/usb/storage/scsiglue.c:slave_alloc(), just after the call to
> > blk_queue_update_dma_alignment().  Perhaps that will help
> >
> 
> I will do that as a test.  However, I’m concerned that we’re solving only a specific case.  Won’t it fail in a similar way if a different subsystem does the same thing (USB modem or video drivers, etc.)?

Those other drivers don't use the block device interface, as far as I 
know.  So they would have to use other methods for addressing the 
potential problems in any case.  usb-storage is perhaps distinct in 
that it doesn't generate the scatter-gather lists that it uses, but 
instead has to work with whatever the block layer provides.

Alan Stern

