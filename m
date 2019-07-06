Return-Path: <SRS0=/GjO=VD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D516C0650E
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 12:35:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DADE7213F2
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 12:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfGFMfA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 6 Jul 2019 08:35:00 -0400
Received: from gate.crashing.org ([63.228.1.57]:59548 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbfGFMfA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Jul 2019 08:35:00 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x66CYim7005303;
        Sat, 6 Jul 2019 07:34:45 -0500
Message-ID: <2748681b2967d3fe99a83606432ae63e1cd8ee52.camel@kernel.crashing.org>
Subject: Re: [PATCH 02/10] usb: gadget: aspeed: Cleanup EP0 state on port
 reset
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Sat, 06 Jul 2019 22:34:43 +1000
In-Reply-To: <6e554955-6a4f-06b1-82b3-982e5e299d19@cogentembedded.com>
References: <20190706005345.18131-1-benh@kernel.crashing.org>
         <20190706005345.18131-3-benh@kernel.crashing.org>
         <6e554955-6a4f-06b1-82b3-982e5e299d19@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2019-07-06 at 11:11 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 06.07.2019 3:53, Benjamin Herrenschmidt wrote:
> 
> > Otherwise, we can have a stale state after a disconnect and
> > reconnect
> > causing errors on the first SETUP packet to the device.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> [...]
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> > b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> > index e2927fb083cf..5054c6343ead 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> > @@ -459,6 +459,15 @@ static const struct usb_ep_ops
> > ast_vhub_ep0_ops = {
> >   	.free_request	= ast_vhub_free_request,
> >   };
> >   
> > +void ast_vhub_reset_ep0(struct ast_vhub_dev *dev)
> > +{
> > +	struct ast_vhub_ep *ep = &dev->ep0;
> > +
> > +	ast_vhub_nuke(ep, -EIO);
> > +        ep->ep0.state = ep0_state_token;
> 
>     This line is indented with spaces, previous with a tab.

Thanks, will clean up.

Cheers,
Ben.
> 
> > +}
> > +
> > +
> >   void ast_vhub_init_ep0(struct ast_vhub *vhub, struct ast_vhub_ep
> > *ep,
> >   		       struct ast_vhub_dev *dev)
> >   {
> 
> [...]
> 
> MBR, Sergei

