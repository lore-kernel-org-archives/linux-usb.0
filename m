Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A78C47095
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 08:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E3F0610E6
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 08:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhFII6j (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Jun 2021 04:58:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:47846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233595AbhFII6i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 04:58:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17C6361040;
        Wed,  9 Jun 2021 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623229004;
        bh=y+rZC8ET704ZyS2De756e+uIOdbE3GgO+5jsgP/wVHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cZ978C9G3XwZmTJTDMir+CoiQtR2oyMeMSKp9wMx/JlLPdrT3x39jvc351tPpe9SM
         0mzvQskwYMhzSRJD1ohOGpKYvsh7rrImM9laSRwHvz1U8lW1m7kWo4VdeZIUIcUUTM
         8wO0ND0g6XtGJ1xfP4q5C0zrUtt40e9TqtMojvbI=
Date:   Wed, 9 Jun 2021 10:56:42 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] usb: typec: wcove: Use LE to CPU conversion when
 accessing msg->header
Message-ID: <YMCCSiNnvc9oh7P+@kroah.com>
References: <20210519085534.48732-1-andriy.shevchenko@linux.intel.com>
 <YKYrQXXk/X72iI+0@kuha.fi.intel.com>
 <YL47Ny7hXZmgH/dx@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL47Ny7hXZmgH/dx@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 06:28:55PM +0300, Andy Shevchenko wrote:
> On Thu, May 20, 2021 at 12:26:25PM +0300, Heikki Krogerus wrote:
> > On Wed, May 19, 2021 at 11:55:34AM +0300, Andy Shevchenko wrote:
> > > As LKP noticed the Sparse is not happy about strict type handling:
> > >    .../typec/tcpm/wcove.c:380:50: sparse:     expected unsigned short [usertype] header
> > >    .../typec/tcpm/wcove.c:380:50: sparse:     got restricted __le16 const [usertype] header
> > > 
> > > Fix this by switching to use pd_header_cnt_le() instead of pd_header_cnt()
> > > in the affected code.
> > > 
> > > Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thanks!
> 
> Greg, should I amend or resend this?

Both please.

thanks,

greg k-h
