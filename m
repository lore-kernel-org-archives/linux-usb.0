Return-Path: <SRS0=b8rD=DL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2A1C46466
	for <linux-usb@archiver.kernel.org>; Sun,  4 Oct 2020 00:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A5F0206CD
	for <linux-usb@archiver.kernel.org>; Sun,  4 Oct 2020 00:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgJDAAp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 3 Oct 2020 20:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgJDAAp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Oct 2020 20:00:45 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E207C0613D0;
        Sat,  3 Oct 2020 17:00:45 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6A4DE11E3E4CA;
        Sat,  3 Oct 2020 16:43:56 -0700 (PDT)
Date:   Sat, 03 Oct 2020 17:00:42 -0700 (PDT)
Message-Id: <20201003.170042.489590204097552946.davem@davemloft.net>
To:     gregkh@linuxfoundation.org
Cc:     netdev@vger.kernel.org, tuba@ece.ufl.edu, kuba@kernel.org,
        oneukum@suse.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] net: hso: do not call unregister if not registered
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20201002114323.GA3296553@kroah.com>
References: <20201002114323.GA3296553@kroah.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Sat, 03 Oct 2020 16:43:56 -0700 (PDT)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 2 Oct 2020 13:43:23 +0200

> @@ -2366,7 +2366,8 @@ static void hso_free_net_device(struct hso_device *hso_dev, bool bailout)
>  
>  	remove_net_device(hso_net->parent);
>  
> -	if (hso_net->net)
> +	if (hso_net->net &&
> +	    hso_net->net->reg_state == NETREG_REGISTERED)
>  		unregister_netdev(hso_net->net);
>  
>  	/* start freeing */

I really want to get out of the habit of drivers testing the internal
netdev registration state to make decisions.

Instead, please track this internally.  You know if you registered the
device or not, therefore use that to control whether you try to
unregister it or not.

Thank you.
