Return-Path: <SRS0=gdTw=7J=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E02C433DF
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 08:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C2692084C
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590567932;
	bh=q5lx3vUOaYX3vIna+8GrZocFpvjqv6brp6j0I0imdjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ns6JV29/3U0aWH7+7Z5PsaKQPgPkQfQWik7MyJeif6SCbABqRGpb7kyMJphem0S/7
	 nDbp9zopakrjY2bjH4ieN6BV+kZi+L8iI/0NLritCgTx6KsPC+wl1LLv6VWZw+2G6P
	 7LOM6TiooL47J3+H7XqqcPhwxmRPUjEeQUc6avMY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729420AbgE0IZb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 May 2020 04:25:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729367AbgE0IZb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 04:25:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6D112078B;
        Wed, 27 May 2020 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590567931;
        bh=q5lx3vUOaYX3vIna+8GrZocFpvjqv6brp6j0I0imdjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OPHD6JdFzcL0srsKKv0JOdI4HtYlX8VOpOuo0azpZtfqwtU/AjXz0S9PccJxlqmQV
         a4GFO9hR2KAeeH2u+Hr9akeIkWp/crZ7oGHIiBXQX14ESD7qiDXdv/KjTjtAKSgkps
         wM3pZDIpraVnVDo4cbnu/QpcL6u/jAUiRo7cmQFw=
Date:   Wed, 27 May 2020 10:25:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] CDC-ACM: heed quirk also in error handling
Message-ID: <20200527082528.GA150074@kroah.com>
References: <20200526124420.22160-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526124420.22160-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 26, 2020 at 02:44:20PM +0200, Oliver Neukum wrote:
> If buffers are iterated over in the error case, the lower limits
> for quirky devices must be heeded.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
> Fixes: a4e7279cd1d19 ("cdc-acm: introduce a cool down")
> Cc: stable <stable@vger.kernel.org>
> ---
>  drivers/usb/class/cdc-acm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 7678ae4afd53..be4543569822 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -585,7 +585,7 @@ static void acm_softint(struct work_struct *work)
>  	}
>  
>  	if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
> -		for (i = 0; i < ACM_NR; i++) 
> +		for (i = 0; i < acm->rx_buflimit; i++) 

Trailing whitespace :(

I'll go fix it up by hand...

greg k-h
