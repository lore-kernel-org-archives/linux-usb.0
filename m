Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED574C4167B
	for <linux-usb@archiver.kernel.org>; Fri,  4 Dec 2020 16:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4B5B22838
	for <linux-usb@archiver.kernel.org>; Fri,  4 Dec 2020 16:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387750AbgLDQNb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Dec 2020 11:13:31 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44693 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727970AbgLDQNb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 11:13:31 -0500
Received: (qmail 1143058 invoked by uid 1000); 4 Dec 2020 11:12:49 -0500
Date:   Fri, 4 Dec 2020 11:12:49 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bui Quang Minh <minhquangbui99@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Jules Irenge <jbi.octave@gmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: dummy-hcd: Fix uninitialized array use in init()
Message-ID: <20201204161249.GA1141609@rowland.harvard.edu>
References: <1607063090-3426-1-git-send-email-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607063090-3426-1-git-send-email-minhquangbui99@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 06:24:49AM +0000, Bui Quang Minh wrote:
> This error path
> 
> 	err_add_pdata:
> 		for (i = 0; i < mod_data.num; i++)
> 			kfree(dum[i]);
> 
> can be triggered when not all dum's elements are initialized.
> 
> Fix this by initializing all dum's elements to NULL.
> 
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 0eeaead..a2cf009 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -2734,7 +2734,7 @@ static int __init init(void)
>  {
>  	int	retval = -ENOMEM;
>  	int	i;
> -	struct	dummy *dum[MAX_NUM_UDC];
> +	struct	dummy *dum[MAX_NUM_UDC] = {};
>  
>  	if (usb_disabled())
>  		return -ENODEV;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Does this initialization end up using less memory than an explicit 
memset() call?

Alan Stern
