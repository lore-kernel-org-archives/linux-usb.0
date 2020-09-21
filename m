Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E53C43463
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 12:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 925DF20EDD
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 12:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ZH0ZQw0R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgIUMpf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:45:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:57288 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgIUMpf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 08:45:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600692334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bqn34meecDvZDEJxHRUx1vPpxYKHN7TRkTg3l4zsI10=;
        b=ZH0ZQw0RHyItdFk8C5/e34TBv+PyWGC+OaHR69poNbc/YtndFEwYjWiv323SKyD4BLsze5
        C9eVzYBlN0jfj88pQFOEczbgCdKof3NWMZ+HKo/0Ik+oxmOWXO+rdEZVUuF+OU+/VJnO85
        BvjJMyrKN0r6FayLTT3ZrmG5Y3e35Hs=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 97F9CAD68;
        Mon, 21 Sep 2020 12:46:10 +0000 (UTC)
Message-ID: <1600692319.2424.88.camel@suse.com>
Subject: Re: [RFC 4/4] USB: cdc-acm: clean up handling of quirky devices
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Mon, 21 Sep 2020 14:45:19 +0200
In-Reply-To: <20200921121525.GV24441@localhost>
References: <20200921113525.32187-1-johan@kernel.org>
         <20200921113525.32187-5-johan@kernel.org>
         <1600689232.2424.78.camel@suse.com> <20200921121525.GV24441@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 14:15 +0200 schrieb Johan Hovold:
> On Mon, Sep 21, 2020 at 01:53:52PM +0200, Oliver Neukum wrote:
> > Am Montag, den 21.09.2020, 13:35 +0200 schrieb Johan Hovold:
> > > Instead of falling back to "combined-interface" probing when detecting
> > > broken union and call-management descriptors, assume all interfaces with
> > > three endpoints are of "combined-interface" type.
> > 
> > Hi,
> > 
> > this just ignores a union header. I am afraid that is not correct.
> > Could you move it into the !union_header clause?
> 
> And probe for a combined interface before falling back to the management
> descriptor then? Along the lines of


Yes, exactly.

	Regards
		Oliver

