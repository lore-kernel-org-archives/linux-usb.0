Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C04C433ED
	for <linux-usb@archiver.kernel.org>; Mon, 12 Apr 2021 10:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2740561350
	for <linux-usb@archiver.kernel.org>; Mon, 12 Apr 2021 10:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238912AbhDLLAE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Apr 2021 07:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:51634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239822AbhDLLAA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 07:00:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AF9F61288;
        Mon, 12 Apr 2021 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618225182;
        bh=IjgFy/yFRm/giGB3M3k6QEH9uBbJbvDo/dJ9N2eLSb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T0o6q+q47gCVQL/7iXhq2fQ2jwHyud42qQhr+y07z0mScQTSmYFW1hwppQNsyc/s3
         eL13/dLv866Cn0gsi+DKUbuDZIoFK5lYb3SBLkv0gJ3YfHck4pgAX0gaIp6Abs3CJQ
         iMjPS9WwrcBktTrVPuZiZ2rE+YHBV/OSVsdFEhk0=
Date:   Mon, 12 Apr 2021 12:59:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/10] USB: serial: clean up the ti drivers
Message-ID: <YHQoHCp6/BUoyxDh@kroah.com>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 11:47:28AM +0200, Johan Hovold wrote:
> The io_ti and ti_usb_3410_5052 drivers are drivers for devices based on
> the same TI chips and one appears to have been based on the other
> judging from the code similarities.

All I had to work off of was a vendor-driver for the ti_usb_3410_5052
codebase and trying to figure out what was common and what wasn't was
pretty hard at the time.  Thanks for working on this cleanup now.

> 
> This series clean up their implementations a bit by introducing
> port-command helpers and fixing up some related style inconsistencies.
> 
> This is based on top of the recently posted closing-wait series.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
