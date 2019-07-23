Return-Path: <SRS0=hX+d=VU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56DEC41517
	for <linux-usb@archiver.kernel.org>; Tue, 23 Jul 2019 15:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96D15217D4
	for <linux-usb@archiver.kernel.org>; Tue, 23 Jul 2019 15:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbfGWPjb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Jul 2019 11:39:31 -0400
Received: from verein.lst.de ([213.95.11.211]:42788 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbfGWPja (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 11:39:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C0CA768B02; Tue, 23 Jul 2019 17:39:29 +0200 (CEST)
Date:   Tue, 23 Jul 2019 17:39:29 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org, hch@lst.de,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190723153929.GF720@lst.de>
References: <1563793105-20597-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563793105-20597-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
