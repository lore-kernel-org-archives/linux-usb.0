Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DF2C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 16:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E12722C7E
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 16:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406788AbhARQcE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Jan 2021 11:32:04 -0500
Received: from netrider.rowland.org ([192.131.102.5]:48107 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2406782AbhARQcA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 11:32:00 -0500
Received: (qmail 142797 invoked by uid 1000); 18 Jan 2021 11:31:17 -0500
Date:   Mon, 18 Jan 2021 11:31:17 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pete Zaitcev <zaitcev@redhat.com>
Cc:     Jeremy Figgins <kernel@jeremyfiggins.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210118163117.GA142198@rowland.harvard.edu>
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210117234416.49d59761@suzdal.zaitcev.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 17, 2021 at 11:44:16PM -0600, Pete Zaitcev wrote:
> On Sun, 17 Jan 2021 15:36:39 -0600
> Jeremy Figgins <kernel@jeremyfiggins.com> wrote:
> 
> > The naming is designed to mirror the existing
> > USB_QUIRK_NO_SET_INTF flag, but that flag is
> > not sufficient to make these devices work.
> > +	{ 0x0416, 0x5011, USBLP_QUIRK_NO_SET_INTF }, /* Winbond Electronics Corp. Virtual Com Port */
> 
> Jeremy, thanks for the patch. It looks mostly fine code-wise (quirk is
> out of numerical order), but I have a question: did you consider keying
> off usblp->dev->quirks instead?
> 
> How about this:
> 
> diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> index 37062130a03c..0c4a98f00797 100644
> --- a/drivers/usb/class/usblp.c
> +++ b/drivers/usb/class/usblp.c
> @@ -1315,7 +1315,11 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
>  	alts = usblp->protocol[protocol].alt_setting;
>  	if (alts < 0)
>  		return -EINVAL;
> -	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
> +	if (usblp->dev->quirks & USB_QUIRK_NO_SET_INTF) {
> +		r = 0;
> +	} else {
> +		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
> +	}
>  	if (r < 0) {
>  		printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
>  			alts, usblp->ifnum);

Would it be practical simply to skip the usb_set_interface() call 
whenever alts is 0?  After all, devices use altsetting 0 by default; it 
shouldn't be necessary to tell them to do so.

Alan Stern
