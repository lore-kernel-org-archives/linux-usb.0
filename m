Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3A9C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 11 Jan 2021 21:30:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F87D22CB2
	for <linux-usb@archiver.kernel.org>; Mon, 11 Jan 2021 21:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbhAKVag (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 11 Jan 2021 16:30:36 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44181 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726473AbhAKVag (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 16:30:36 -0500
Received: (qmail 1212501 invoked by uid 1000); 11 Jan 2021 16:29:55 -0500
Date:   Mon, 11 Jan 2021 16:29:55 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: udc: core: Introduce started state
Message-ID: <20210111212955.GA1209265@rowland.harvard.edu>
References: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 11, 2021 at 12:38:05PM -0800, Thinh Nguyen wrote:
> For some UDCs, the initialization sequence by udc_start() should not be
> repeated until it is properly cleaned up with udc_stop() and vise versa.
> We may run into some cleanup failure as seen with the DWC3 driver during
> the irq cleanup. This issue can occur when the user triggers
> soft-connect/soft-disconnect from the soft_connect sysfs. To avoid
> adding checks to every UDC driver, at the UDC framework, introduce a
> "started" state to track and prevent the UDC from repeating the
> udc_start() and udc_stop() if it had already started/stopped.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Is the new "started" field subject to races?  What happens if there are 
concurrent requests to start and stop the UDC?

Alan Stern
