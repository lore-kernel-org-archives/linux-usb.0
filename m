Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E15C4332F
	for <linux-usb@archiver.kernel.org>; Wed, 21 Dec 2022 20:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234837AbiLUU1X (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 21 Dec 2022 15:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbiLUU1W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 15:27:22 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9045224F1D
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 12:27:21 -0800 (PST)
Received: (qmail 100059 invoked by uid 1000); 21 Dec 2022 15:27:20 -0500
Date:   Wed, 21 Dec 2022 15:27:20 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] USB: Improve usb_fill_* documentation
Message-ID: <Y6NsKH2VurBlufst@rowland.harvard.edu>
References: <20221220-usb-dmadoc-v4-0-74a045bf14f4@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220-usb-dmadoc-v4-0-74a045bf14f4@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 21, 2022 at 08:34:51PM +0100, Ricardo Ribalda wrote:
> Document the transfer buffer requirement. That is, the buffer must be
> DMAble - otherwise data corruption might occur.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> USB: Improve usb_fill_* documentation
> 
> After trying to "cleanup" the uvc code, I was patiently explained about
> the requirements of the urb transfer buffers.
> 
> Lets make this explicit, so other developers do not make the same mistake.
> 
> To: Bagas Sanjaya <bagasdotme@gmail.com>
> To: Randy Dunlap <rdunlap@infradead.org>
> To: Alan Stern <stern@rowland.harvard.edu>
> To: Christoph Hellwig <hch@lst.de>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
