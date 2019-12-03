Return-Path: <SRS0=Zn27=ZZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028FEC432C0
	for <linux-usb@archiver.kernel.org>; Tue,  3 Dec 2019 17:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4A4F2068E
	for <linux-usb@archiver.kernel.org>; Tue,  3 Dec 2019 17:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfLCRBl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 Dec 2019 12:01:41 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:40714 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRBl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 12:01:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CE9074879E;
        Tue,  3 Dec 2019 17:55:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dSolNp1q9L3i; Tue,  3 Dec 2019 17:55:24 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3A5E64879C;
        Tue,  3 Dec 2019 17:55:24 +0100 (CET)
Date:   Tue, 3 Dec 2019 17:55:23 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: Fix incorrect DMA allocations for local memory pool
 drivers
Message-ID: <20191203165523.GB4230@sx9>
References: <20191130165055.GA46622@sx9>
 <20191203081206.GD10631@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203081206.GD10631@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

> > Fixes: 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of guestimating DMA capabilities") where local memory USB drivers
> 
> Looks like you copied a bit too much text here for the fixes tag.

Indeed, thanks for noticing!

Fredrik
