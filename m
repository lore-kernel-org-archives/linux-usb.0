Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC528C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 13:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C889221924
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 13:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfDPNon (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 09:44:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:21483 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfDPNon (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 09:44:43 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Apr 2019 06:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,357,1549958400"; 
   d="scan'208";a="165211341"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 16 Apr 2019 06:44:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 16 Apr 2019 16:44:39 +0300
Date:   Tue, 16 Apr 2019 16:44:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/8] usb: typec: fusb302: Make fusb302_set_cc_polarity
 also set pull ups / downs
Message-ID: <20190416134439.GD1747@kuha.fi.intel.com>
References: <20190222141205.7621-1-hdegoede@redhat.com>
 <20190416101953.GA4243@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190416101953.GA4243@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416134439.s0zCJ0D_jVDma_y3NZztvHqfZowW6oQ2HBGiW8I_1qQ@z>

On Tue, Apr 16, 2019 at 12:19:53PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Feb 22, 2019 at 03:11:58PM +0100, Hans de Goede wrote:
> > The 2 callers of fusb302_set_cc_polarity both call fusb302_set_cc_pull
> > directly before calling fusb302_set_cc_polarity, this is not ideal for
> > 2 reasons:
> > 
> > 1) fusb302_set_cc_pull uses the cached polarity when applying pull-ups,
> > which maybe changed immediately afterwards, to fix this set_cc_polarity
> > already does the pull-up setting.
> > 
> > 2) Both touch the SWITCHES0 register in a r-w-modify cycle, this leads to
> > read reg, write reg, read reg, write reg. If we fold the setting of
> > the pull-downs into fusb302_set_cc_polarity then not only can we avoid
> > doing the reads / writes twice, at this point we set all bits, so we
> > can skip the read, turning 4 (slowish) i2c-transfers into 1.
> > 
> > Doing this also avoids the need to cache the pull_up state in
> > struct fusb302_chip.
> > 
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/usb/typec/tcpm/fusb302.c | 48 +++++++++++---------------------
> >  1 file changed, 16 insertions(+), 32 deletions(-)
> 
> It would be nice to get some people to review/ack this series before I
> take it (hint...)

Hans send second and third version of these. These are already in.

thanks,

-- 
heikki
