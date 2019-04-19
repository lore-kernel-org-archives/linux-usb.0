Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B495C282E2
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5568120663
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 20:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbfDSUNy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:13:54 -0400
Received: from wp210.webpack.hosteurope.de ([80.237.132.217]:48396 "EHLO
        wp210.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726331AbfDSUNx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 16:13:53 -0400
X-Greylist: delayed 6037 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Apr 2019 16:13:52 EDT
Received: from port-92-193-190-131.dynamic.qsc.de ([92.193.190.131] helo=localhost); authenticated
        by wp210.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1hHNmT-0005yE-Ds; Fri, 19 Apr 2019 09:17:53 +0200
Date:   Fri, 19 Apr 2019 09:17:52 +0200
From:   Jan =?iso-8859-1?Q?Kl=F6tzke?= <jan@kloetzke.net>
To:     David Miller <davem@davemloft.net>
Cc:     Jan.Kloetzke@preh.de, oneukum@suse.com, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbnet: fix kernel crash after disconnect
Message-ID: <20190419071752.GG1084@tuxedo>
References: <20190417091849.7475-1-Jan.Kloetzke@preh.de>
 <1555569464.7835.4.camel@suse.com>
 <1555574578.4173.215.camel@preh.de>
 <20190418.163544.2153438649838575906.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190418.163544.2153438649838575906.davem@davemloft.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-bounce-key: webpack.hosteurope.de;jan@kloetzke.net;1555704833;5f5e3d6b;
X-HE-SMSGID: 1hHNmT-0005yE-Ds
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419071752.rs_MLy3mndZ54XyEiGzNl_3KZYwXm93hZKe7wIouGrA@z>

Hi David,

On Thu, Apr 18, 2019 at 04:35:44PM -0700, David Miller wrote:
> From: Kloetzke Jan <Jan.Kloetzke@preh.de>
> Date: Thu, 18 Apr 2019 08:02:59 +0000
> 
> > I think this assumption is not correct. As far as I understand the
> > networking code it is still possible that the ndo_start_xmit callback
> > is called while ndo_stop is running and even after ndo_stop has
> > returned. You can only be sure after unregister_netdev() has returned.
> > Maybe some networking folks can comment on that.
> 
> The kernel loops over the devices being unregistered, and first it clears
> the __LINK_STATE_START on all of them, then it invokes ->ndo_stop() on
> all of them.
> 
> __LINK_STATE_START controls what netif_running() returns.
> 
> All calls to ->ndo_start_xmit() are guarded by netif_running() checks.
> 
> So when ndo_stop is invoked you should get no more ndo_start_xmit
> invocations on that device.  Otherwise how could you shut down DMA
> resources and turn off the TX engine properly?

But you could still race with another CPU that is past the
netif_running() check, can you? So the driver has to make sure that it
gracefully handles concurrent ->ndo_start_xmit() and ->ndo_stop() calls.

Or are there any locks/barriers involved that make sure all
->ndo_start_xmit() calls have returned before invoking ->ndo_stop()?

Regards,
Jan
