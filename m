Return-Path: <SRS0=ZvjM=TF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEB4C46470
	for <linux-usb@archiver.kernel.org>; Sun,  5 May 2019 07:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D5A52082F
	for <linux-usb@archiver.kernel.org>; Sun,  5 May 2019 07:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfEEHp5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 5 May 2019 03:45:57 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:46422 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727492AbfEEHp5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 May 2019 03:45:57 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id A5DCF14C043F5;
        Sun,  5 May 2019 00:45:56 -0700 (PDT)
Date:   Sun, 05 May 2019 00:45:56 -0700 (PDT)
Message-Id: <20190505.004556.492323065607253635.davem@davemloft.net>
To:     Jan.Kloetzke@preh.de
Cc:     oneukum@suse.com, jan@kloetzke.net, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usbnet: fix kernel crash after disconnect
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190430141440.9469-1-Jan.Kloetzke@preh.de>
References: <1556563688.20085.31.camel@suse.com>
        <20190430141440.9469-1-Jan.Kloetzke@preh.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 05 May 2019 00:45:56 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190505074556.gPD7sBsVgUSaumsb5Uep3O4wNQ2pWtO-uK7qfmgmCRE@z>

From: Kloetzke Jan <Jan.Kloetzke@preh.de>
Date: Tue, 30 Apr 2019 14:15:07 +0000

> @@ -1431,6 +1432,11 @@ netdev_tx_t usbnet_start_xmit (struct sk_buff *skb,
>  		spin_unlock_irqrestore(&dev->txq.lock, flags);
>  		goto drop;
>  	}
> +	if (WARN_ON(netif_queue_stopped(net))) {
> +		usb_autopm_put_interface_async(dev->intf);
> +		spin_unlock_irqrestore(&dev->txq.lock, flags);
> +		goto drop;
> +	}

If this is known to happen and is expected, then we should not warn.
