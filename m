Return-Path: <SRS0=M0dr=64=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988B4C433DF
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 01:32:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EC20205CB
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 01:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgENBcH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 13 May 2020 21:32:07 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41405 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725925AbgENBcG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 21:32:06 -0400
Received: (qmail 11072 invoked by uid 500); 13 May 2020 21:32:05 -0400
Date:   Wed, 13 May 2020 21:32:05 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200514013205.GA10515@rowland.harvard.edu>
References: <20200513213620.21541-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513213620.21541-1-b-liu@ti.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 04:36:20PM -0500, Bin Liu wrote:
> When a USB device attached to a hub got disconnected, MUSB controller
> generates RXCSR_RX_ERROR interrupt for the 3-strikes-out error.
> 
> Currently the MUSB host driver returns -EPROTO in current URB, then the
> USB device driver could immediately resubmit the URB which causes MUSB
> generate RXCSR_RX_ERROR interrupt again. This circle causes interrupt
> storm then the hub never got a chance to report the USB device detach.
> 
> To fix the interrupt storm, change the URB return code to -ESHUTDOWN for
> MUSB_RXCSR_H_ERROR interrupt, so that the USB device driver will not
> immediately resubmit the URB.
> 
> Signed-off-by: Bin Liu <b-liu@ti.com>

Strictly speaking, this is not the right thing to do.  It goes against 
the API described in error-codes.rst.  A better approach would be to fix 
the drivers that immediately resubmit an URB after getting a -EPROTO 
error.  After all, that is the wrong thing to do no matter what sort of 
host controller the device is attached to.

Alan Stern
