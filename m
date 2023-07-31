Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9A3C001DC
	for <linux-usb@archiver.kernel.org>; Mon, 31 Jul 2023 08:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjGaIYO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 31 Jul 2023 04:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjGaIXx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 04:23:53 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08E2213B;
        Mon, 31 Jul 2023 01:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=a2UzXH65pU6D+5RxuoqV0mU4KwvxcFu8nPejcDojQSQ=; b=UwJDP8wVdnTMyuNZaLfOYX61sN
        dhXQOsNgIco1viC7mimNkQcfg6W1vDs94hfOOH/qxl2ENaMo5QQKKk59gydjyj9Gy0flLYqZAsXKd
        Jk8tjhjkF6UMKvSl6RmcTxeSN2H2/uYtQ+SbE3X8io8N2TtSSBjizQetXpEUS5BaasUs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qQOB0-002hKr-N2; Mon, 31 Jul 2023 10:22:50 +0200
Date:   Mon, 31 Jul 2023 10:22:50 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Ross Maynard <bids.7405@bigpond.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v2] USB: zaurus: Add ID for A-300/B-500/C-700
Message-ID: <556dcedc-b727-49b6-886f-5d485cf02713@lunn.ch>
References: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 31, 2023 at 03:42:04PM +1000, Ross Maynard wrote:
> The SL-A300, B500/5600, and C700 devices no longer auto-load because of
> "usbnet: Remove over-broad module alias from zaurus."
> This patch adds IDs for those 3 devices.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217632
> Fixes: 16adf5d07987 ("usbnet: Remove over-broad module alias from zaurus.")
> Signed-off-by: Ross Maynard <bids.7405@bigpond.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
