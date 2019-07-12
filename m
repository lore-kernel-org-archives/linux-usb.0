Return-Path: <SRS0=G3IJ=VJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EB6C742D7
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 23:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55C00208E4
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 23:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbfGLXk7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Jul 2019 19:40:59 -0400
Received: from gate.crashing.org ([63.228.1.57]:48121 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbfGLXk7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Jul 2019 19:40:59 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6CNekas011289;
        Fri, 12 Jul 2019 18:40:47 -0500
Message-ID: <bac94289bf8fb79c495418b810e434bd18758c26.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 04/12] usb: gadget: aspeed: Improve debugging when
 nuking
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Sat, 13 Jul 2019 09:40:46 +1000
In-Reply-To: <bbda0e6e-1710-f4e9-3b15-1a450566e4d4@cogentembedded.com>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
         <20190712025348.21019-5-benh@kernel.crashing.org>
         <af1da9a4-0122-4fdb-9fe7-fb886c19f3c7@cogentembedded.com>
         <bbda0e6e-1710-f4e9-3b15-1a450566e4d4@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-12 at 12:06 +0300, Sergei Shtylyov wrote:
> On 12.07.2019 12:01, Sergei Shtylyov wrote:
> 
> > > When nuking requests, it's useful to display how many were
> > > actually nuked. It has proven handy when debugging issues
> > > where EP0 went in a wrong state.
> > > 
> > > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > ---
> > >   drivers/usb/gadget/udc/aspeed-vhub/core.c | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
> > > b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > index db3628be38c0..0c77cd488c48 100644
> > > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > @@ -65,13 +65,16 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct 
> > > ast_vhub_req *req,
> > >   void ast_vhub_nuke(struct ast_vhub_ep *ep, int status)
> > >   {
> > >       struct ast_vhub_req *req;
> > > -
> > > -    EPDBG(ep, "Nuking\n");
> > > +    int count = 0;
> > >       /* Beware, lock will be dropped & req-acquired by done() */
> > >       while (!list_empty(&ep->queue)) {
> > >           req = list_first_entry(&ep->queue, struct ast_vhub_req, queue);
> > >           ast_vhub_done(ep, req, status);
> > > +        count++;
> > > +    }
> > > +    if (count) {
> > > +        EPDBG(ep, "Nuked %d request(s)\n", count);
> > 
> >     CodingStyle says to avoid {} around a single statement.
> 
>     I somehow missed this in v1 posting, sorry about that.

Yeah well ... there used to be more in there, forgot to remove the {}
when I stripped it down. I'm not going to respin for something so
trivial unless something else shows up.

Felipe, what's your situation with getting those patches ? I haven't
heard for you in a couple of weeks...

Cheers,
Ben.


