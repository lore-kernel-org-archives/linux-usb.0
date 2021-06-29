Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E22BC11F66
	for <linux-usb@archiver.kernel.org>; Tue, 29 Jun 2021 14:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22E6461DC2
	for <linux-usb@archiver.kernel.org>; Tue, 29 Jun 2021 14:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbhF2OfV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 29 Jun 2021 10:35:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47809 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231194AbhF2OfT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 10:35:19 -0400
Received: (qmail 699680 invoked by uid 1000); 29 Jun 2021 10:32:51 -0400
Date:   Tue, 29 Jun 2021 10:32:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linyu Yuan <linyyuan@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v2] usb: dwc3: avoid NULL access of usb_gadget_driver
Message-ID: <20210629143251.GA699290@rowland.harvard.edu>
References: <20210629015118.7944-1-linyyuan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629015118.7944-1-linyyuan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 29, 2021 at 09:51:18AM +0800, Linyu Yuan wrote:
> we found crash in dwc3_disconnect_gadget(),
> it is because dwc->gadget_driver become NULL before async access.
> 7dc0c55e9f30 ('USB: UDC core: Add udc_async_callbacks gadget op')
> suggest a common way to avoid such kind of issue.
> 
> this change implment the callback in dwc3 and
> change related functions which have callback to usb gadget driver.
> 
> Signed-off-by: Linyu Yuan <linyyuan@codeaurora.org>
> ---
> 
> v2: add missing check in dwc3_reset_gadget(), found by Alan Stern.

This is better.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

