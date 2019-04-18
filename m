Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039BAC10F14
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 23:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8A14214DA
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 23:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfDRXfq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 19:35:46 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:47856 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfDRXfq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 19:35:46 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 80995108BD2A7;
        Thu, 18 Apr 2019 16:35:45 -0700 (PDT)
Date:   Thu, 18 Apr 2019 16:35:44 -0700 (PDT)
Message-Id: <20190418.163544.2153438649838575906.davem@davemloft.net>
To:     Jan.Kloetzke@preh.de
Cc:     oneukum@suse.com, netdev@vger.kernel.org, jan@kloetzke.net,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbnet: fix kernel crash after disconnect
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1555574578.4173.215.camel@preh.de>
References: <20190417091849.7475-1-Jan.Kloetzke@preh.de>
        <1555569464.7835.4.camel@suse.com>
        <1555574578.4173.215.camel@preh.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 18 Apr 2019 16:35:45 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418233544.q2BzrlSupXMQkXttL5yw0GfSq8AnD7sb8Pb896OjB2c@z>

From: Kloetzke Jan <Jan.Kloetzke@preh.de>
Date: Thu, 18 Apr 2019 08:02:59 +0000

> I think this assumption is not correct. As far as I understand the
> networking code it is still possible that the ndo_start_xmit callback
> is called while ndo_stop is running and even after ndo_stop has
> returned. You can only be sure after unregister_netdev() has returned.
> Maybe some networking folks can comment on that.

The kernel loops over the devices being unregistered, and first it clears
the __LINK_STATE_START on all of them, then it invokes ->ndo_stop() on
all of them.

__LINK_STATE_START controls what netif_running() returns.

All calls to ->ndo_start_xmit() are guarded by netif_running() checks.

So when ndo_stop is invoked you should get no more ndo_start_xmit
invocations on that device.  Otherwise how could you shut down DMA
resources and turn off the TX engine properly?
