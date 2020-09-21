Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA0BC43466
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 17:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08FFE2085B
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 17:17:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="T183/UDp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgIURRz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 13:17:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:44528 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgIURRz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 13:17:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600708674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qnECYDTj8/UFrdme2rOC8ACavXmryD9m8CjLBQ8+HE8=;
        b=T183/UDpGj9QIyPeKoVEw7lsCHtgdYt8krzTZAhH4lcrjxXeQO714hKwYviyK49JF4Jfk6
        lOYnQisOmUb+TRVoWx6S6vJ9530Ptz14o6uPV/WxREvYdz1FZwHiRro9CVEUld0xGD/Aij
        8tx50OOm1QAgBXuxU04XjXXB3YQZNcs=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3DA71B01E;
        Mon, 21 Sep 2020 17:18:30 +0000 (UTC)
Message-ID: <1600708657.2942.2.camel@suse.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Mon, 21 Sep 2020 19:17:37 +0200
In-Reply-To: <20200921151605.GY24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
         <20200921135951.24045-5-johan@kernel.org>
         <1600697816.2424.102.camel@suse.com> <20200921142806.GX24441@localhost>
         <1600700674.2424.105.camel@suse.com> <20200921151605.GY24441@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 17:16 +0200 schrieb Johan Hovold:
> > > interface? By hardcoding the data-interface number to be the one and
> > > only interface, you'd end up probing for a "combined" interface also
> > > with a broken call-management descriptor.
> > 
> > Well, by the changelog assuming a combined interface caused an oops.
> > Thence I am forced to conclude that the davices _has_ a separate
> > data interface, but no union descriptor.
> 
> No, the oops was probably due to the missing sanity check later added by
> 403dff4e2c94 ("USB: cdc-acm: check for valid interfaces").
> 
> With a broken call-management descriptor pointing to a non-existent
> interface we'd oops before that commit.

Hi,

maybe I am dense, but a patch that comes after a patch that is said to
fix something? Furthermore that patch would not come it work,
it would merely make probe() fail cleanly. If I read the changelog
correctly, the change makes the device work.

	Regards
		Oliver

