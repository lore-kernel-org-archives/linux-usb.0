Return-Path: <SRS0=Xh9D=UM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7DDC31E49
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jun 2019 15:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F26320851
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jun 2019 15:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388444AbfFMPzb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:55:31 -0400
Received: from verein.lst.de ([213.95.11.211]:36706 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731539AbfFMIvu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Jun 2019 04:51:50 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id AC80D68B02; Thu, 13 Jun 2019 10:51:21 +0200 (CEST)
Date:   Thu, 13 Jun 2019 10:51:21 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190613085121.GA13442@lst.de>
References: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190613073346.GB12093@lst.de> <OSAPR01MB30899FBDA010F0465599437AD8EF0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSAPR01MB30899FBDA010F0465599437AD8EF0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 13, 2019 at 08:46:00AM +0000, Yoshihiro Shimoda wrote:
> I believe this patch I sent has already covered it. What do you think?
> 
> For examples (all value units are "sectors"):
> 	default	mapping size	max_sectors
> case 1	240	MAX		2048		--> we use 2048
> case 2	240	512		2048		--> we use 512
> case 3	240	128		2048		--> we use 128
> case 4	240	128		64		--> we use 64

Yes, I guess your version is fine after all:

Reviewed-by: Christoph Hellwig <hch@lst.de>

although I think it might be simpler to just read the value back
from the queue in the end.
