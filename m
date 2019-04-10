Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13096C282CE
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 08:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCD3920818
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 08:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfDJICU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 04:02:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:48150 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727212AbfDJICU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Apr 2019 04:02:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 189A8B02B;
        Wed, 10 Apr 2019 08:02:19 +0000 (UTC)
Message-ID: <1554883329.21725.1.camel@suse.com>
Subject: Re: Bug: VHCI + USB 3.0
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Seth Bollinger <Seth.Bollinger@digi.com>
Cc:     Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Date:   Wed, 10 Apr 2019 10:02:09 +0200
In-Reply-To: <Pine.LNX.4.44L0.1904091552331.1599-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1904091552331.1599-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Di, 2019-04-09 at 15:57 -0400, Alan Stern wrote:
> On Tue, 9 Apr 2019, Bollinger, Seth wrote:
> 
> > I will do that as a test.  However, I’m concerned that we’re solving only a specific case.  Won’t it fail in a similar way if a different subsystem does the same thing (USB modem or video drivers, etc.)?
> 
> Those other drivers don't use the block device interface, as far as I 
> know.  So they would have to use other methods for addressing the 
> potential problems in any case.  usb-storage is perhaps distinct in 
> that it doesn't generate the scatter-gather lists that it uses, but 
> instead has to work with whatever the block layer provides.

UAS, too. But I can pick up the corresponding fix.
Are you sure about sound though?

	Regards
		Oliver

