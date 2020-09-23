Return-Path: <SRS0=WBK0=DA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E9AC2D0A8
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 14:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF0F121D92
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 14:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Th4XZjSP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgIWOVU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Sep 2020 10:21:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:56154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgIWOVU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 10:21:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600870879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tZWkBOW6OkyhpRIUicvESlEm1fQJupW4N/xDOD1gvLc=;
        b=Th4XZjSPlywXH6zCrM7dRqvtQDp/fjEjNRk//qQhxhFDqdpwg8cWymJ+mAtRzt5503Jpwl
        oqI/f5UQ1RzPm60+DU2G6I4H8HG/3tzW8mykBylZ2wrfIGGbT94h3014agaNVmMh+TVh+b
        G8SR8D939WpImyI4CKO44vvds1G44Ok=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6FBEAB29E;
        Wed, 23 Sep 2020 14:21:56 +0000 (UTC)
Message-ID: <1600870858.25088.1.camel@suse.com>
Subject: Re: [PATCH 3/4] net: usb: rtl8150: use usb_control_msg_recv() and
 usb_control_msg_send()
From:   Oliver Neukum <oneukum@suse.com>
To:     Himadri Pandya <himadrispandya@gmail.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        pankaj.laxminarayan.bharadiya@intel.com,
        Kees Cook <keescook@chromium.org>, yuehaibing@huawei.com,
        petkan@nucleusys.com, ogiannou@gmail.com,
        USB list <linux-usb@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Greg KH <gregkh@linuxfoundation.org>
Date:   Wed, 23 Sep 2020 16:20:58 +0200
In-Reply-To: <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
         <20200923090519.361-4-himadrispandya@gmail.com>
         <1600856557.26851.6.camel@suse.com>
         <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 23.09.2020, 19:36 +0530 schrieb Himadri Pandya:
> On Wed, Sep 23, 2020 at 3:52 PM Oliver Neukum <oneukum@suse.com> wrote:
> > 
> > Am Mittwoch, den 23.09.2020, 14:35 +0530 schrieb Himadri Pandya:

> > GFP_NOIO is used here for a reason. You need to use this helper
> > while in contexts of error recovery and runtime PM.
> > 
> 
> Understood. Apologies for proposing such a stupid change.

Hi,

sorry if you concluded that the patch was stupid. That was not my
intent. It was the best the API allowed for. If an API makes it
easy to make a mistake, the problem is with the API, not the developer.

	Regards
		Oliver

