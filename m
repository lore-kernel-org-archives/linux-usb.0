Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49D9C11F64
	for <linux-usb@archiver.kernel.org>; Tue, 29 Jun 2021 01:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A55D661CA5
	for <linux-usb@archiver.kernel.org>; Tue, 29 Jun 2021 01:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhF2Bio (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Jun 2021 21:38:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43431 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231964AbhF2Bio (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 21:38:44 -0400
Received: (qmail 680473 invoked by uid 1000); 28 Jun 2021 21:36:17 -0400
Date:   Mon, 28 Jun 2021 21:36:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linyu Yuan <linyyuan@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: avoid NULL access of usb_gadget_driver
Message-ID: <20210629013617.GA680339@rowland.harvard.edu>
References: <20210629002029.6295-1-linyyuan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629002029.6295-1-linyyuan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 29, 2021 at 08:20:28AM +0800, Linyu Yuan wrote:
> we found crash in dwc3_disconnect_gadget(),
> it is because dwc->gadget_driver become NULL before async access.
> 7dc0c55e9f30 ('USB: UDC core: Add udc_async_callbacks gadget op')
> suggest a common way to avoid such kind of issue.
> 
> this change implment the callback in dwc3 and
> change related functions which have callback to UDC core.
> 
> Signed-off-by: Linyu Yuan <linyyuan@codeaurora.org>
> ---

In general this looks very good, all nice and simple.  But it doesn't 
cover the reset callback (dwc3_reset_gadget).

Alan Stern
