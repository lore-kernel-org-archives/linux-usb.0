Return-Path: <SRS0=zRYX=EC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7CAC55178
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 14:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1320A207BB
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 14:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757099AbgJ0OV0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Oct 2020 10:21:26 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38805 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2509472AbgJ0OVY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 10:21:24 -0400
Received: (qmail 1234573 invoked by uid 1000); 27 Oct 2020 10:21:23 -0400
Date:   Tue, 27 Oct 2020 10:21:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/3] usb: cdns3: gadget: suspicious implicit sign
 extension
Message-ID: <20201027142123.GA1233346@rowland.harvard.edu>
References: <20201016101659.29482-1-peter.chen@nxp.com>
 <20201016101659.29482-2-peter.chen@nxp.com>
 <871rhkdori.fsf@kernel.org>
 <20201027094825.GA5940@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027094825.GA5940@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 27, 2020 at 09:48:54AM +0000, Peter Chen wrote:
> If you compile the code:
> 
> unsigned int k = 0x80 << 24 + 0x81;
> 
> It will report build warning:
> warning: left shift count >= width of type [-Wshift-count-overflow]

That's a separate issue.  I believe (but haven't checked) that the << 
operator has lower precedence than +, so the compiler interprets the 
expression as:

unsigned int k = 0x80 << (24 + 0x81);

and it's pretty obvious why this causes an error.  Instead, try 
compiling:

unsigned int k = (0x80 << 24) + 0x81;

You may get an error message about signed-integer overflow, but not 
about shift-count overflow.

Alan Stern
