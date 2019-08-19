Return-Path: <SRS0=aDjS=WP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F033EC3A59D
	for <linux-usb@archiver.kernel.org>; Mon, 19 Aug 2019 10:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C69DE2085A
	for <linux-usb@archiver.kernel.org>; Mon, 19 Aug 2019 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566211269;
	bh=JbhdIu6KJjHyR/YSqfufSsfhK7qchZaWTxjc1sA/Log=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xJye/PnetT6Ez9YJfL+JGh5o8dwExqg/6AZLPDeiY6EpWUurBj6+vmT2ey51594ue
	 2PyiqTOnqoGFOT1CtHqancLgQz3MDlzK2T92r6vmf18rwY5KHPGoLqdgoSgn0qSpQH
	 3PdCdsrBivLrte345YZNEUWaFh2YQOSuLE96rjFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfHSKlJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 19 Aug 2019 06:41:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbfHSKlJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 06:41:09 -0400
Received: from localhost (unknown [89.205.137.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38AF520578;
        Mon, 19 Aug 2019 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566211268;
        bh=JbhdIu6KJjHyR/YSqfufSsfhK7qchZaWTxjc1sA/Log=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YLypHQXwI018PgcsxgqlysA7ujxQBSQO8sNdQsEsXNt2UHtQGm+lWqKWXwSgEZwef
         nGYxlP1Ra81gk96E3qTGpWmSve56EDy82s5zUx5ZFzrUFwKgwlQQ3Psf6dZAB9S4c5
         cjhORzowPOxb5l14Ty51c83heSOiYp8jOH5wzf/w=
Date:   Mon, 19 Aug 2019 12:41:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: usb251xb: drop some unused defines
Message-ID: <20190819104104.GA6530@kroah.com>
References: <20190819100211.26791-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190819100211.26791-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 19, 2019 at 12:02:11PM +0200, Uwe Kleine-König wrote:
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/misc/usb251xb.c | 5 -----
>  1 file changed, 5 deletions(-)

I can't take a patch without any changelog text.

And you forgot to cc: the usb maintainer, so there's no way this was
going to get merged :)

thanks,

greg k-h
