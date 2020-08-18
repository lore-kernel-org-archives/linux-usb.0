Return-Path: <SRS0=A6ac=B4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE2BC433DF
	for <linux-usb@archiver.kernel.org>; Tue, 18 Aug 2020 14:46:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 536C6207DE
	for <linux-usb@archiver.kernel.org>; Tue, 18 Aug 2020 14:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgHROq5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Aug 2020 10:46:57 -0400
Received: from netrider.rowland.org ([192.131.102.5]:36107 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726698AbgHROq4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 10:46:56 -0400
Received: (qmail 146088 invoked by uid 1000); 18 Aug 2020 10:46:55 -0400
Date:   Tue, 18 Aug 2020 10:46:55 -0400
From:   "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Message-ID: <20200818144655.GA144306@rowland.harvard.edu>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200810022510.6516-7-peter.chen@nxp.com>
 <20200818093305.GA34785@kroah.com>
 <AM7PR04MB7157182367D7EEE2BDAD53318B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7157182367D7EEE2BDAD53318B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 10:05:51AM +0000, Peter Chen wrote:
>  
> > >
> > > diff --git a/drivers/usb/gadget/udc/core.c
> > > b/drivers/usb/gadget/udc/core.c index 473e74088b1f..43351b0af569
> > > 100644
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -1386,7 +1386,6 @@ void usb_del_gadget_udc(struct usb_gadget
> > > *gadget)  {
> > >  	usb_del_gadget(gadget);
> > >  	usb_put_gadget(gadget);
> > > -	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
> > 
> > Shouldn't you do this patch earlier in the series, as the
> > usb_put_gadget() call could have freed the memory that is being cleared here?
> > 
> 
> If I did it earlier, it would cause dwc3 break if people do 'git bisect', dwc3 issue is
> fixed at patch 5.

If you use the patch I posted earlier:

	https://marc.info/?l=linux-usb&m=159605415210351&w=2

instead of this one then dwc3 would continue to work correctly during 
the intermediate stages of the series.

Alan Stern
