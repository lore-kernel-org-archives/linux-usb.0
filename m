Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939CDC61DA4
	for <linux-usb@archiver.kernel.org>; Thu, 16 Feb 2023 16:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjBPQ4n (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 16 Feb 2023 11:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjBPQ4n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 11:56:43 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D704ECD4;
        Thu, 16 Feb 2023 08:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=jaAEH683Yfqq6kBb6xAXCH8vWfBS0iqo6Lvi6ljOKac=; b=yRwFv3y9KT+F0l/0AHu7NEL51R
        r0KMH45jNueVHFnLIEW+c08PqHIm4Rab8kS9jRadtuW1NSCYETnpRuz5omEDLjZcPjmB6d+J8rUzP
        WC5LxPN2w0srzbfgGAc7XqHBMHoTSm1ziPTdo1lqSvzKgFeSXf/UooQRjyRrjVJajEvA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pShYZ-005Ciw-9Y; Thu, 16 Feb 2023 17:56:27 +0100
Date:   Thu, 16 Feb 2023 17:56:27 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Yuiko.Oshino@microchip.com
Cc:     enguerrand.de-ribaucourt@savoirfairelinux.com,
        Woojung.Huh@microchip.com, hkallweit1@gmail.com,
        netdev@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
        UNGLinuxDriver@microchip.com, linux@armlinux.org.uk,
        edumazet@google.com, linux-usb@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH net 1/2] net:usb:lan78xx: fix accessing the LAN7800's
 internal phy specific registers from the MAC driver
Message-ID: <Y+5gOxDuyK3csyre@lunn.ch>
References: <cover.1676490952.git.yuiko.oshino@microchip.com>
 <b317787e1e55f9c59c55a3cf5f9f02d477dd5a59.1676490952.git.yuiko.oshino@microchip.com>
 <Y+5G/yc7UB+ahylb@lunn.ch>
 <CH0PR11MB556166DDD69AD4D5FDCDB2F08EA09@CH0PR11MB5561.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB556166DDD69AD4D5FDCDB2F08EA09@CH0PR11MB5561.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Hi Andrew,
> 
> Enguerrand reported the below on 20 Dec 2022, therefore, submitting to net.
> 
> " Some operations during the cable switch workaround modify the register
> LAN88XX_INT_MASK of the PHY. However, this register is specific to the
> LAN8835 PHY. For instance, if a DP8322I PHY is connected to the LAN7801,
> that register (0x19), corresponds to the LED and MAC address
> configuration, resulting in unapropriate behavior."

O.K.

So please include in the commit message this information. Then it
becomes clear it really is a fix.

Also, you did not add a fixes: tag to the second patch. There is a
danger the first patch gets back ported, but not the second. Since you
are just moving code around, i suggest you have just have one patch.

    Andrew
