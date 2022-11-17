Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5B2C43219
	for <linux-usb@archiver.kernel.org>; Thu, 17 Nov 2022 12:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbiKQMvS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Nov 2022 07:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238685AbiKQMvB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 07:51:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155A756D5C;
        Thu, 17 Nov 2022 04:51:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B62E61B9D;
        Thu, 17 Nov 2022 12:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E753C433C1;
        Thu, 17 Nov 2022 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1668689460;
        bh=YJ/6UE8ehowwFXAY+Yco2xh0i5799hsaxa+jOvXK6Uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H8hN9AB9LcTG66prL8pTtM+doeoakXQDPwETNy/6FWTQhdyRosTqw4Aavoxqym8RC
         OIAJCp5MBUdYe+WlfjS71iUFk0t3yovuU5Lx22G5KZrZwu8CqPydQUxqYoEWtycOPO
         HSwN6QGlzo8yK4kT5bU/wBIBbbP1ilPNyS6PnxP4=
Date:   Thu, 17 Nov 2022 13:50:55 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lee Jones <lee@kernel.org>
Cc:     balbi@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: gadget: f_hid: Conduct proper refcounting on
 shared f_hidg pointer
Message-ID: <Y3YuL8rSE9pNfIZN@kroah.com>
References: <20221117120813.1257583-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117120813.1257583-1-lee@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 17, 2022 at 12:08:13PM +0000, Lee Jones wrote:
> +static inline bool f_hidg_is_open(struct f_hidg *hidg)
> +{
> +	return !!kref_read(&hidg->cdev.kobj.kref);
> +}

Ick, sorry, no, that's not going to work and is not allowed at all.
That's some major layering violations there, AND it can change after you
get the value as well.

greg k-h
