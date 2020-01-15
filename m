Return-Path: <SRS0=3jNv=3E=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE53AC33CB2
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 11:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FAB72467A
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 11:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730120AbgAOLam (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 Jan 2020 06:30:42 -0500
Received: from bmailout2.hostsharing.net ([83.223.78.240]:52881 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729758AbgAOLal (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 06:30:41 -0500
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 60A6B280043B8;
        Wed, 15 Jan 2020 12:30:39 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 3349440D5F; Wed, 15 Jan 2020 12:30:39 +0100 (CET)
Date:   Wed, 15 Jan 2020 12:30:39 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Message-ID: <20200115113039.lmz6kzwqspq2vugc@wunner.de>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
 <20200109123617.5ovxwkfnmf7ou4z4@wunner.de>
 <87h80x6qog.fsf@kernel.org>
 <788fc4ab-28f4-f4de-66b3-8c39ab841c3e@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <788fc4ab-28f4-f4de-66b3-8c39ab841c3e@synopsys.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 15, 2020 at 09:25:30AM +0000, Minas Harutyunyan wrote:
> On 1/15/2020 12:59 PM, Felipe Balbi wrote:
> > Lukas Wunner <lukas@wunner.de> writes:
> > > just a gentle ping:  The below patch was submitted more than 8 weeks ago
> > > and I'm neither seeing it on one of your branches nor have there been
> > > any comments on the list.  Are there objections to this patch?
> > 
> > I don't see an Acked-by Minas, so I can't take the patch, sorry.
> 
> But I didn't find original patch email in my inbox. I just got this ping.

You were cc'ed on the patch and I didn't receive a bounce message.
So it must have been accepted by Synopsys' mail server.

I've just forwarded the e-mail to you once more.  Additionally you can
review the patch in the mailing list archive and, if there are no
objections, provide an Acked-by in reply to the present e-mail:

https://lore.kernel.org/linux-usb/77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de/

Thanks,

Lukas
