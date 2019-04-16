Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A50C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE44220821
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555411145;
	bh=c+Yb/xVJGsZRccPkH831u+xy/X9rjUSB67blQnAASuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NODHCchO0N83gFQmRCm37nW/1L0DoqF/PORNZB0C5GTz6HF5yQkg6+DGEbD0ZL08v
	 LOswrpmksv/dOFukBds0Zm8PFFsU9NsxZBx4LQMqbYcPUeGMm4ZDLqxGIbSECNSD0U
	 BHGrWKVcMHvgauvc8d8ikGPx65kWURmO5I/XW9EU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbfDPKjF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 06:39:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727950AbfDPKjF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 06:39:05 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1254120693;
        Tue, 16 Apr 2019 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555411144;
        bh=c+Yb/xVJGsZRccPkH831u+xy/X9rjUSB67blQnAASuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UbjOq/Wm5i2xQ+5G/PaRFe+o2OTO8nrn1e5EPRlgcM6zHUiWNlASjKym+yEQUG8qi
         UNsY+tKawVd+Ela+YSHNUOR9vyp/4jmOYn+ttofE/qKaVjz7Dh0oubqARD6/RNxoZO
         ir+WKzhz7he0DTQTMt/aWUsvfn+mR4re3/ZTMMQw=
Date:   Tue, 16 Apr 2019 12:19:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/8] usb: typec: fusb302: Make fusb302_set_cc_polarity
 also set pull ups / downs
Message-ID: <20190416101953.GA4243@kroah.com>
References: <20190222141205.7621-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190222141205.7621-1-hdegoede@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416101953.j2FfUI_ZhqmvqkyOrSxtNF7XwDgVcblsrgkpc5k6xhE@z>

On Fri, Feb 22, 2019 at 03:11:58PM +0100, Hans de Goede wrote:
> The 2 callers of fusb302_set_cc_polarity both call fusb302_set_cc_pull
> directly before calling fusb302_set_cc_polarity, this is not ideal for
> 2 reasons:
> 
> 1) fusb302_set_cc_pull uses the cached polarity when applying pull-ups,
> which maybe changed immediately afterwards, to fix this set_cc_polarity
> already does the pull-up setting.
> 
> 2) Both touch the SWITCHES0 register in a r-w-modify cycle, this leads to
> read reg, write reg, read reg, write reg. If we fold the setting of
> the pull-downs into fusb302_set_cc_polarity then not only can we avoid
> doing the reads / writes twice, at this point we set all bits, so we
> can skip the read, turning 4 (slowish) i2c-transfers into 1.
> 
> Doing this also avoids the need to cache the pull_up state in
> struct fusb302_chip.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 48 +++++++++++---------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)

It would be nice to get some people to review/ack this series before I
take it (hint...)

thanks,

greg k-h
