Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E81C4332F
	for <linux-usb@archiver.kernel.org>; Mon,  7 Nov 2022 15:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbiKGPFN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 7 Nov 2022 10:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbiKGPFM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 10:05:12 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 49410643F
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 07:05:11 -0800 (PST)
Received: (qmail 436479 invoked by uid 1000); 7 Nov 2022 10:05:09 -0500
Date:   Mon, 7 Nov 2022 10:05:09 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ray Chi <raychi@google.com>
Cc:     gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de,
        albertccwang@google.com, pumahsu@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [Patch v5] usb: core: stop USB enumeration if too many retries
Message-ID: <Y2kepYpgenoFOVnH@rowland.harvard.edu>
References: <20221107072754.3336357-1-raychi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107072754.3336357-1-raychi@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 07, 2022 at 03:27:54PM +0800, Ray Chi wrote:
> When a broken USB accessory connects to a USB host, usbcore might
> keep doing enumeration retries. If the host has a watchdog mechanism,
> the kernel panic will happen on the host.
> 
> This patch provides an attribute early_stop to limit the numbers of retries
> for each port of a hub. If a port was marked with early_stop attribute,
> unsuccessful connection attempts will fail quickly. In addition, if an
> early_stop port has failed to initialize, it will ignore all future
> connection events until early_stop attribute is clear.
> 
> Signed-off-by: Ray Chi <raychi@google.com>
> ---

This looks good.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
