Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64834C64E7B
	for <linux-usb@archiver.kernel.org>; Thu,  3 Dec 2020 09:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1460F20C56
	for <linux-usb@archiver.kernel.org>; Thu,  3 Dec 2020 09:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388396AbgLCJYg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 3 Dec 2020 04:24:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:52112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728664AbgLCJYf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Dec 2020 04:24:35 -0500
Date:   Thu, 3 Dec 2020 10:25:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606987435;
        bh=OPHa3hpYhOVHFQT+rzppZmmCVL1HYAlnF8Zna8/OOtA=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=1lrp3FF4JUivmboIzQdFfxeGJWg/wy83LxzThplEB5pQoqhoGZs5FzJm67wJB2/0Y
         2C7G5yISp81XE5QpgZSxDDEPd9Xh1dQnaTejufYwVBaIQ5akdjMJs8H4GjYk3/u27N
         ARUeOkU5lEDtFcBPTaouKFnviKk3hklBkor3sUns=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: sort device-id entries
Message-ID: <X8iu7y5GjmhmeWdH@kroah.com>
References: <20201203091159.12896-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203091159.12896-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 03, 2020 at 10:11:59AM +0100, Johan Hovold wrote:
> Keep the device-id entries sorted to make it easier to add new ones in
> the right spot.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
