Return-Path: <SRS0=VqZY=AC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DDAC433E0
	for <linux-usb@archiver.kernel.org>; Sun, 21 Jun 2020 14:09:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 614412491C
	for <linux-usb@archiver.kernel.org>; Sun, 21 Jun 2020 14:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730080AbgFUOJS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Jun 2020 10:09:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38403 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730022AbgFUOJR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 10:09:17 -0400
Received: (qmail 107959 invoked by uid 1000); 21 Jun 2020 10:09:16 -0400
Date:   Sun, 21 Jun 2020 10:09:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sid Spry <sid@aeam.us>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to Use Isochronous Behavior w/ Isoc Endpoint in FunctionFC
Message-ID: <20200621140916.GB107361@rowland.harvard.edu>
References: <dc61359f-2a04-4590-9ac9-81b4f6e8d3b8@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc61359f-2a04-4590-9ac9-81b4f6e8d3b8@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 20, 2020 at 10:38:33PM -0500, Sid Spry wrote:

> When I was using a repurposed audio device I had to set an alternate mode. Is
> that related to the issue here? The alternate mode seems to be a relic of the
> descriptor layout before I dropped the device class and substituted my own
> driver. The current descriptors specify no alternate modes.

I don't know much about FunctionFS, so I can't help with your main 
question about isochronous packets not being dropped.  But I can explain 
this.

In the USB-2.0 spec, at the end of section 5.6.3 the text says:

	All device default interface settings must not include any 
	isochronous endpoints with non-zero data payload sizes (specified 
	via wMaxPacketSize in the endpoint descriptor). Alternate 
	interface settings may specify non-zero data payload sizes for 
	isochronous endpoints.

That's why you had to select an alternate setting before transferring 
any isochronous data.  Any isochronous endpoint in altsetting 0 must have 
its maxpacket size set to 0.

Alan Stern
