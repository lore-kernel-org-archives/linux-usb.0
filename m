Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E32BC433B4
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 14:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40FDE613CB
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 14:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhEMOEl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 May 2021 10:04:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:38500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234380AbhEMOER (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 May 2021 10:04:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A79CA6127A;
        Thu, 13 May 2021 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620914587;
        bh=nDxUJTP3nD11n530MzLu+yrq9mhuvITYnY7YOEh3cMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kxLwBchVtkWe/bGBZbiryEXDs33/WtIcmlXaZZtLSj5Ue2gEkcSgSd942DRWqXhV1
         tJ0wM6AoE04H9hHgFRNqw0JWT1rP9mpnbaJRtGzKBtS4y0PT1nNKy0RMk6gZeTtt4X
         dxOiMo7M/0JWMH3XVXFz7I8F9WvDYCGZOW3e7J3w=
Date:   Thu, 13 May 2021 16:03:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     stern@rowland.harvard.edu, mathias.nyman@intel.com,
        peter.chen@kernel.org, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v4 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE
 Test for USB2
Message-ID: <YJ0xmT8papys4ho+@kroah.com>
References: <1620452039-11694-1-git-send-email-jun.li@nxp.com>
 <1620452039-11694-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620452039-11694-2-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 08, 2021 at 01:33:58PM +0800, Li Jun wrote:
> From: Peter Chen <peter.chen@nxp.com>
> 
> This function is similar with EHCI's, but implemented using XHCI.
> The USB2 host needs to send SETUP packet first, then wait 15
> seconds before DATA (IN) + STATUS stage.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> No change since v1.

I've applied patches 1 and 3 here, and am waiting for Mathias to review
this before accepting patch 2.

thanks,

greg k-h
