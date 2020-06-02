Return-Path: <SRS0=SarO=7P=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B65C433E0
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jun 2020 02:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6168D20678
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jun 2020 02:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgFBCcz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 1 Jun 2020 22:32:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45871 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725801AbgFBCcz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 22:32:55 -0400
Received: (qmail 16498 invoked by uid 1000); 1 Jun 2020 22:32:54 -0400
Date:   Mon, 1 Jun 2020 22:32:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Stuge <peter@stuge.se>
Cc:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
Message-ID: <20200602023254.GB15540@rowland.harvard.edu>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Description: it><enter-command> set editor=$my_editor
Content-Disposition: inline
In-Reply-To: <20200602001207.17171.qmail@stuge.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 02, 2020 at 12:12:07AM +0000, Peter Stuge wrote:

...

> The way I read composite_setup() after try_fun_setup: it calls f->setup()
> when available, and that can return < 0 to stall.
> 
> I expect that composite_setup() and thus f->setup() run when the
> SETUP packet has arrived, thus before the data packet arrives, and if
> composite_setup() stalls then the device/function should never see the
> data packet.
> 
> For an OUT transaction I think the host controller might still send
> the DATA packet, but the device controllers that I know don't make it
> visible to the application in that case.

...

Are you guys interested in comments from other people who know more
about the kernel and how it works with USB?  Your messages have been
far too long to go into in any detail, but I will address this one issue.

The USB protocol forbids a device from sending a STALL response to a
SETUP packet.  The only valid response is ACK.  Thus, there is no way
to prevent the host from sending its DATA packet for a control-OUT
transfer.

A gadget driver can STALL in response to a control-OUT data packet,
but only before it has seen the packet.  Once the driver knows what
the data packet contains, the gadget API doesn't provide any way to
STALL the status stage.  There has been a proposal to change the API
to make this possible, but so far it hasn't gone forward.

Alan Stern
