Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14666C43464
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 10:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3E042073A
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 10:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KGivzs7T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgIUK3e (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 06:29:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:42348 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726503AbgIUK3d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 06:29:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600684171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yzB41WBnwBWCybCFi4TQGY72z6PQ9k+AJNXZUogzzw4=;
        b=KGivzs7T70Upc9VnB2gsNJ4jSVC1zo3c4X3uTd9lyg86fOZ1r1guhd1IhbQwjxAf6/TdNt
        1yKTWAMwA5XJeLWbZt0/656FhbuYc7jiZVGZIKrCkZKM6JZiVcJvhf7IFfZ77FkhvIrVxp
        iBNQCumNL4hEndXgcjfD1d6xwEwB2jQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C5C07AD71;
        Mon, 21 Sep 2020 10:30:07 +0000 (UTC)
Message-ID: <1600684156.2424.65.camel@suse.com>
Subject: Re: [PATCH v2] USB: cdc-acm: add Whistler radio scanners TRX series
 support
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        stable@vger.kernel.org
Date:   Mon, 21 Sep 2020 12:29:16 +0200
In-Reply-To: <20200921093145.GS24441@localhost>
References: <20200921081022.6881-1-johan@kernel.org>
         <1600677792.2424.61.camel@suse.com> <20200921093145.GS24441@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 11:31 +0200 schrieb Johan Hovold:
> On Mon, Sep 21, 2020 at 10:43:12AM +0200, Oliver Neukum wrote:
> > Am Montag, den 21.09.2020, 10:10 +0200 schrieb Johan Hovold:
> > > Add support for Whistler radio scanners TRX series, which have a union
> > > descriptor that designates a mass-storage interface as master. Handle
> > > that by generalising the NO_DATA_INTERFACE quirk to allow us to fall
> > > back to using the combined-interface detection.
> > 
> > Hi,

Hi,

> > 
> > it amazes me what solutions people can come up with. Yet in this case
> > using a quirk looks like an inferior solution. If your master
> > is a storage interface, you will have a condition on the device you
> > can test for without the need for a quirk.
> 
> Sure, and I mentioned that as an alternative, another would be checking
> for a control interface with three endpoints directly.

These tests are not mutually exclusive. You can check for both
conditions being met. In fact you have to, it seems to me.

> My fear is that any change in this direction risk introducing regression
> if there are devices out there with broken descriptors that we currently
> happen to support by chance. Then again, probably better to try to
> handle any such breakage if/when reported.

Well, I guess the chance that we break devices which claim to be
storage devices we will simply have to take. Those devices are
quite broken in any case.

Thank you for redoing this.

	Regards
		Oliver

