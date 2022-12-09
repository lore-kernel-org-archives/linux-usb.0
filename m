Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E536C04FDE
	for <linux-usb@archiver.kernel.org>; Fri,  9 Dec 2022 16:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiLIQQi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiLIQQc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Dec 2022 11:16:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2C181392;
        Fri,  9 Dec 2022 08:16:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 84D10B828B2;
        Fri,  9 Dec 2022 16:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04C8C433EF;
        Fri,  9 Dec 2022 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670602589;
        bh=Bq5L+G8kRRTcTufTTfJDkD0jNB5vDsWYTD3cnlkRmzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ObcMg65CXKB96PBUo4w9O3RkEexpJZyX7NOzISTsdIKW2YVuA/zJQFEQpbZbypQpM
         achqLp1s/F0LwSoIxG3FeXdrjyVAwMR64vsHLJOF1wfTiBc17ala9JC4/VRsVknMSA
         2ZT0YA3nos4GIh/dfdBQnwR7FmwvFoN6+9ewOpyU=
Date:   Fri, 9 Dec 2022 17:16:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: typec: hd3ss3220: Sort header files
Message-ID: <Y5NfWiqhoPhkGGjG@kroah.com>
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
 <20221209155623.29147-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209155623.29147-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 09, 2022 at 03:56:22PM +0000, Biju Das wrote:
> This patch sorts the header files alphabetically.

This says what you are doing, but not why.

Why is this needed?  What does this fix?  This is no requirement of USB
code that I know of.

thanks,

greg k-h
