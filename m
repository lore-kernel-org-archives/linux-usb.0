Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CA3C432BE
	for <linux-usb@archiver.kernel.org>; Wed, 28 Jul 2021 06:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B8C960EB2
	for <linux-usb@archiver.kernel.org>; Wed, 28 Jul 2021 06:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbhG1Gl5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Jul 2021 02:41:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:36988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232798AbhG1Gl4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Jul 2021 02:41:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CA4E60C41;
        Wed, 28 Jul 2021 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627454515;
        bh=qL5t703Mf1hPIHikLEKWuENxZ+pm60uKcC89JnlnnGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EdBFl8xE5Jh+359Gi0XwIi4m2Vgkvmd5d/btAC48b9gG+YY4LRATfT87aLA+x5yMO
         GoJzseUiP7dolweKhN2pTNzyVSMNSWjWw85eYhy6FjHyzRMJPKijw1SvTdqRAikJfK
         /tUv2clQWaTXn8EWdPr8p+YufhLasp3W5Ji2bbCQ=
Date:   Wed, 28 Jul 2021 08:41:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Maxim Devaev <mdevaev@gmail.com>, sandeen@redhat.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: idle uses the highest byte for
 duration
Message-ID: <YQD8MfEZxPHYhnrz@kroah.com>
References: <20210727185800.43796-1-mdevaev@gmail.com>
 <87mtq7t0ex.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtq7t0ex.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 28, 2021 at 09:31:02AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Maxim Devaev <mdevaev@gmail.com> writes:
> 
> > SET_IDLE value must be shifted 8 bits to the right to get duration.
> > This confirmed by USBCV test.
> >
> > Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
> 
> with Greg's Fixes addition:
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>

Argh, just missed me committing this.  Thanks for the review, sorry it
missed getting added to the final commit :(

greg k-h
