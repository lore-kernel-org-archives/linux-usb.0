Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B848EC43465
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 15:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74C0B207C3
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 15:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dCKFH1UU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgIUPEv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 11:04:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:41714 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgIUPEv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 11:04:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600700690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nLkecd6xnTnpNhHCpBmUPI8EDJF6pLFpCtGPZmWJnfM=;
        b=dCKFH1UU6/bKiUe8JwUxHUcjJASXsgaFVb0o3oaSLudzKDhMc0L8j1J13sEzjmAQgL33FL
        /dn67cZeNKx4OUpoPDxXbnmBgaTNYQbpBYHU1m8owhmzXAphCH4zUAvSvTFL+AdOYF78vm
        YOeimMU5PpNxyq6XQbOJNKDB5iY2S28=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AAA62AC4C;
        Mon, 21 Sep 2020 15:05:26 +0000 (UTC)
Message-ID: <1600700674.2424.105.camel@suse.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Mon, 21 Sep 2020 17:04:34 +0200
In-Reply-To: <20200921142806.GX24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
         <20200921135951.24045-5-johan@kernel.org>
         <1600697816.2424.102.camel@suse.com> <20200921142806.GX24441@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 16:28 +0200 schrieb Johan Hovold:
> On Mon, Sep 21, 2020 at 04:16:56PM +0200, Oliver Neukum wrote:
> > Am Montag, den 21.09.2020, 15:59 +0200 schrieb Johan Hovold:
> > > For interfaces that lack a union descriptor, probe for a
> > > "combined-interface" before falling back to the call-management
> > > descriptor instead of the other way round.
> > 
> > Hi,

Hi,

> > 
> > the more I look at this the more it seems to me like the
> > device that has the quirk does NOT have a collapsed interface
> > but two interfaces and just a lack of a union descriptor.
> 
> But then why name the quirk NO_DATA_INTERFACE if it has a data

In hindsight that seems not the best name.

> interface? By hardcoding the data-interface number to be the one and
> only interface, you'd end up probing for a "combined" interface also
> with a broken call-management descriptor.

Well, by the changelog assuming a combined interface caused an oops.
Thence I am forced to conclude that the davices _has_ a separate
data interface, but no union descriptor.

> Side note: I really think we should start mandating lsusb output to go
> along with any patch for quirky devices.

Good idea. Convince Greg.

	Regards
		Oliver

