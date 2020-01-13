Return-Path: <SRS0=0jAJ=3C=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBE5C33CA9
	for <linux-usb@archiver.kernel.org>; Mon, 13 Jan 2020 18:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D03F2075B
	for <linux-usb@archiver.kernel.org>; Mon, 13 Jan 2020 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578939934;
	bh=aBbHhUNRiQDMnbQ2e4XrfC/QMJlUi/70W+HfpdEG7PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=avGyDiIaDKDQ9iPTt4pyYXX1UFtCwyUpV1PjNhCYDSaiSi1SiuQ+Aeggi2PnK72ma
	 +ZATN3ye3NGc2tEt8LrSmyHBhzscVISzdb2wfr0oeG4n1uDXpM+gonj5dFCb9sl32q
	 9x3zsa292FOq0/pCrXCGtgyCKWd8Tqs+pZzkRCwE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgAMSZ3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 13 Jan 2020 13:25:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:48300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgAMSZ3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 13:25:29 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D86702075B;
        Mon, 13 Jan 2020 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578939928;
        bh=aBbHhUNRiQDMnbQ2e4XrfC/QMJlUi/70W+HfpdEG7PE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G8rzqXcIzgy5Gc5cWNXLuxCMf/CmySdQgn7Bbacu/x/BTUgaZj2V3arGxnIRV5JrH
         fAJqUaXAM9A3wYWttIv3kkCv8G8sNe058HbF4ktGiyBJ2bXiNm4twlW3aRy23cWf8M
         fmt0/bHrDPG4kxeGEXYT0caO90yareo7zvBtF+tU=
Date:   Mon, 13 Jan 2020 19:25:25 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: Re: [PATCH] NFC: pn533: fix bulk-message timeout
Message-ID: <20200113182525.GE411698@kroah.com>
References: <20200113172358.30973-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113172358.30973-1-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 13, 2020 at 06:23:58PM +0100, Johan Hovold wrote:
> The driver was doing a synchronous uninterruptible bulk-transfer without
> using a timeout. This could lead to the driver hanging on probe due to a
> malfunctioning (or malicious) device until the device is physically
> disconnected. While sleeping in probe the driver prevents other devices
> connected to the same hub from being added to (or removed from) the bus.
> 
> An arbitrary limit of five seconds should be more than enough.
> 
> Fixes: dbafc28955fa ("NFC: pn533: don't send USB data off of the stack")
> Cc: stable <stable@vger.kernel.org>     # 4.18
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/nfc/pn533/usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
