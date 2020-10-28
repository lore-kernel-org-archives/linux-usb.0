Return-Path: <SRS0=RaDd=EE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A44AC4363A
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 00:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D89C9207BC
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 00:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933121;
	bh=Cr3GbSvPVi9CvgpYlsf2eGVsINRQhY8Kv9mUdRAm0g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u2cQFtNhWM54d81Q3aj/URZYPudnznRsZq4CjXqo6/icZLVKmtNhHbsBeZzLM6frj
	 rREJvz/NbgzaooZ/2b+NXHdsCqP9tzC65/TOCFnL+YLSWfJcvfyATYRnuHOyfzYSL7
	 Vpwyqr7jIeURHyCzyKdsr68QpUi6M1zTO4QeIJUQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403936AbgJ2A61 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:58:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731581AbgJ1WRc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:32 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFA7024196;
        Wed, 28 Oct 2020 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603877845;
        bh=Cr3GbSvPVi9CvgpYlsf2eGVsINRQhY8Kv9mUdRAm0g0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tN83QuDr0H93aAqm3OXtncbpaQuxzmbwV96lXiSB3mn73YDX0/VAP1GEcW8UGSuwZ
         ua5o6WA2SKtqOa4orRM6W0Sd2CzOmkA3/0ehOaGQpMtM4fQdYaBk6574RHv/SGUvAF
         pbdPgqFRkURjNRxXo/ebyKMeGa1U26jHSTNfIUbs=
Date:   Wed, 28 Oct 2020 10:38:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: digi_acceleport: fix write-wakeup deadlocks
Message-ID: <20201028093818.GB1953863@kroah.com>
References: <20201026104306.29576-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026104306.29576-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 26, 2020 at 11:43:06AM +0100, Johan Hovold wrote:
> The driver must not call tty_wakeup() while holding its private lock as
> line disciplines are allowed to call back into write() from
> write_wakeup(), leading to a deadlock.
> 
> Also remove the unneeded work struct that was used to defer wakeup in
> order to work around a possible race in ancient times (see comment about
> n_tty write_chan() in commit 14b54e39b412 ("USB: serial: remove
> changelogs and old todo entries")).
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/digi_acceleport.c | 45 ++++++++--------------------
>  1 file changed, 13 insertions(+), 32 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
