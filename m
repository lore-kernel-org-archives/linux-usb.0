Return-Path: <SRS0=zbhO=3I=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E07C33CB1
	for <linux-usb@archiver.kernel.org>; Sun, 19 Jan 2020 12:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E1CD2072B
	for <linux-usb@archiver.kernel.org>; Sun, 19 Jan 2020 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579438399;
	bh=YYGqywEnY5WDFDQGNzUwphpxztQVko996pg5bfjxtzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sR8VdpzHxapVqdwsdUIX/25WcoRtUFba6YK1RXfBLcy7vaZmrISln9b4EBsiVzrhL
	 2gexItlTfyWzCytb/Fcz6vz1CZiKmqeWzYm/k7S7c4cYM4H1XCMTjo3/Z8Cvlxkh8N
	 YIfJr7MFpJ6c8m4GxlqCK/WOb5QdAEEyckmvhuJU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgASMxS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 19 Jan 2020 07:53:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:36040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726778AbgASMxS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jan 2020 07:53:18 -0500
Received: from localhost (lns-bzn-36-82-251-23-53.adsl.proxad.net [82.251.23.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F37820679;
        Sun, 19 Jan 2020 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579438397;
        bh=YYGqywEnY5WDFDQGNzUwphpxztQVko996pg5bfjxtzA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=08Rt8On84+1oJYePM7pPeVVyilNXc5GwrUor4LuxC+K7OivHvdm4/fCegXLkpcJBP
         CVg5Ny8dIheLryoj18evv7OPjClKqQI83H0CZrSP+NQwife962lSJiXq7t04ZJocPZ
         E+mlgXIYEFHjCw0W4ht11GN/Gk+vgW7AyPUd4+oA=
Date:   Sun, 19 Jan 2020 13:53:15 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: fix implicit declaration error
Message-ID: <20200119125315.GA149506@kroah.com>
References: <20200118235828.14131-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200118235828.14131-1-ansuelsmth@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 19, 2020 at 12:58:28AM +0100, Ansuel Smith wrote:
> If USB_PCI is not enabled, this error is triggered.
> drivers/usb/host/ehci-pci.c:152:7:
> error: implicit declaration of function 'usb_amd_quirk_pll_check';
>   152 |   if (usb_amd_quirk_pll_check())
>       |       ^~~~~~~~~~~~~~~~~~~~~~~
>       |       usb_amd_quirk_pll_enable
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Is this a new issue?  What commit caused this problem?

thanks,

greg k-h
