Return-Path: <SRS0=9a5V=CZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB39C43461
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 08:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AD50206F7
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 08:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgIPILb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Sep 2020 04:11:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:56524 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbgIPILb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:11:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7010CAF5A;
        Wed, 16 Sep 2020 08:11:45 +0000 (UTC)
Message-ID: <1600243885.2424.10.camel@suse.com>
Subject: Re: [PATCH 2/2] UAS: fix disconnect by unplugging a hub
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <gregKH@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 16 Sep 2020 10:11:25 +0200
In-Reply-To: <20200915140058.GA914700@kroah.com>
References: <20200915134501.13947-1-oneukum@suse.com>
         <20200915134501.13947-3-oneukum@suse.com>
         <20200915140058.GA914700@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 15.09.2020, 16:00 +0200 schrieb Greg KH:
> On Tue, Sep 15, 2020 at 03:45:01PM +0200, Oliver Neukum wrote:
> > The SCSI layer can go into an ugly loop if you ignore that a device
> > is gone. You need to report an error in the command rather than
> > in the return value of the queue method.
> > We need to specifically check for ENODEV..
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > ---
> >  drivers/usb/storage/uas.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> Should this one go to the stable kernels?

Hi,

in theory yes, but it depends on the previous patch.
Should I submit a separate patch?

	Regards
		Oliver

