Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A08C433E6
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 15:24:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C74E364F64
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 15:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235278AbhBBPYp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Feb 2021 10:24:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:39392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235360AbhBBPQz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 10:16:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5415464FB0;
        Tue,  2 Feb 2021 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612278556;
        bh=z4vRuafJma6tBlWmFdXpNiK/YoirUh+ynvyhL94wl/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sb8aP7yC14wg86+f3FSLnhUyAKJ4Iy62J43RREJl+Uwbj0sCVahjPIpgr4oZ+tzHn
         I+t4nUbMn0Q8bx/9GvlRO81jiblgiR407iMFAgIvaIgDBIpIYAyyGJ661l8VEBwVue
         ANp7EU04mu3IVTcItgvF+snpl6Adlw6Y31OhMdKk=
Date:   Tue, 2 Feb 2021 16:09:13 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benson Leung <bleung@google.com>
Cc:     Kyle Tso <kyletso@google.com>, heikki.krogerus@linux.intel.com,
        bleung@chromium.org, badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Return void in typec_partner_set_pd_revision
Message-ID: <YBlrGTaJQp/pCeJK@kroah.com>
References: <20210202095512.761214-1-kyletso@google.com>
 <YBlpnMKzGBcP5Ybi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBlpnMKzGBcP5Ybi@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 02, 2021 at 07:02:52AM -0800, Benson Leung wrote:
> Hi Kyle,
> 
> On Tue, Feb 02, 2021 at 05:55:12PM +0800, Kyle Tso wrote:
> > typec_partner_set_pd_revision doesn't need any return value.
> > 
> > Fixes: 29b01295a829 ("usb: typec: Add typec_partner_set_pd_revision")
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> 
> Review tags for <bleung@chromium.org>

What does that mean?

Please respond with a line that I can use...

thanks,

greg k-h
