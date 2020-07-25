Return-Path: <SRS0=C/te=BE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC80C433E1
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 09:17:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E45D2064C
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 09:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgGYJRH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 25 Jul 2020 05:17:07 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54445 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGYJRH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 05:17:07 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 383F9C0005;
        Sat, 25 Jul 2020 09:17:04 +0000 (UTC)
Message-ID: <e1bb43d8bc0d532ac7b02dcaa4126d860f461de3.camel@hadess.net>
Subject: Re: [PATCH v4] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Sat, 25 Jul 2020 11:17:04 +0200
In-Reply-To: <5b5912d7584eff4229ddb7dc1b6c6eca5fa33146.camel@hadess.net>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
         <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
         <20200724152707.GB1388675@rowland.harvard.edu>
         <e46ee6070263cd6672a42050040dbe1503036702.camel@hadess.net>
         <20200724170814.GA1395815@rowland.harvard.edu>
         <5b5912d7584eff4229ddb7dc1b6c6eca5fa33146.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2020-07-24 at 19:14 +0200, Bastien Nocera wrote:
> 
<snip>
> It's compiling. Then I need to test it. I've also added a couple of
> fixes/cleanups I ran into while doing this.

And sent

