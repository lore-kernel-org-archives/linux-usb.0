Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AE3C352A1
	for <linux-usb@archiver.kernel.org>; Wed, 30 Nov 2022 11:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbiK3LJ7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 30 Nov 2022 06:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbiK3LJz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 06:09:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260B474CCE;
        Wed, 30 Nov 2022 03:09:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ABDDD61B23;
        Wed, 30 Nov 2022 11:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF78AC433D6;
        Wed, 30 Nov 2022 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669806594;
        bh=VrGx7vva0UE6iHhAKgadVFwkUCKa9rYDmB273vEMUaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ExopNyTSR3VYIlbunrbIkaALgSVsLjYtV5vaCK5f2yX7qUu7d6raatNpeMK+Ks8bm
         ZLgsNcFYY9EXk5yZYBbbysRz4K3RE40U6LNP8yX/Z4vUlbYbRz4Kol7gV8oFQjkGQ+
         LdP5mdZvYdFfGTG2OYtIBm6obZUr2SlBfgNDekxg=
Date:   Wed, 30 Nov 2022 12:09:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: xr: avoid requesting zero DTE rate
Message-ID: <Y4c5/lUf4OAECuV9@kroah.com>
References: <20221129141857.15363-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129141857.15363-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 29, 2022 at 03:18:57PM +0100, Johan Hovold wrote:
> When the requested line speed is B0 (hangup) there is no need to use the
> current speed in the line-coding request. This specifically avoids
> requesting a zero DTE rate when the current speed is B0, which could
> potentially confuse buggy firmware.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
