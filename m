Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC60BC433EF
	for <linux-usb@archiver.kernel.org>; Fri, 25 Feb 2022 08:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238671AbiBYI7Z (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 25 Feb 2022 03:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbiBYI7Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Feb 2022 03:59:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E517320E781
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 00:58:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 868F5B82BAF
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 08:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEF3C340E7;
        Fri, 25 Feb 2022 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645779530;
        bh=sw5tDBlxWJXbCoGAwOiCDSj1VB62c4bkXCqy7O/uzrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W5Xd3Jcv9mixpFloV3zOL+wMrtLhcud6/HWv+OuZvMPpC7kVMSJ3Zd2CS+8VXGVGa
         9iF/N/vml8izrn1Xy0o9wHY7Y32bIeXlNN714sbgeCcnvAiO+/GPn/wYuzciKM4k9F
         wWdLpSC5Zy+xxouNBln0CFJixk7sYSkepJ5ym4szMFd/4j1zOIZow96Fzu2baz7Iol
         rlN7yNrZ94n0sb6YWnN9u70nXryKMSqysXvg8KJXsKd87P/WQCKztixIkHDN3gSjn4
         sfhtsiusWUY5H0unsyeDZPF1/H7CL/wsJMBJX7GlZJqGqYeobvoh+pASAnvL5I/xfK
         XQxzBBla8WBmg==
Date:   Fri, 25 Feb 2022 14:28:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/9] usb/dwc3 / phy/tusb1210: Add TUSB1211 charger
 detection
Message-ID: <YhiaRUvW1AutIrCy@matsya>
References: <20220213130524.18748-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213130524.18748-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13-02-22, 14:05, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of the patchs-series to add support for USB charger-type
> (SDP/DCP) detection using a tusb1210 phy connected to a dwc3 controller.
> 
> Changes in v2:
> [PATCH v2 9/9] phy: ti: tusb1210: Add charger detection:
> - Add an online attribute to the registered power_supply class device,
>   otherwise upower thinks it is an extra system battery
> - Add tusb1210_remove_charger_detect() function to properly unregister
>   the tusb->psy_nb notifier and to cancel tusb->chg_det_work
> 
> v1 cover-letter:
> 
> Some Android x86 tablets with a Bay Trail (BYT) SoC (with DWC3 UDC)
> and a Crystal Cove PMIC, which does not support charger-detection,
> rely on a TUSB1211 phy for charger-detection.
> 
> This series adds support for this, it starts with some dwc3 bug-fixes
> for issues hit while developing this, as well as adding support to
> the dwc3 code to set a special property checked by the tusb1210 driver
> to signal that it needs to enable charger-detection.
> 
> The 2nd half of the series does some refactoring / fixes to the
> tusb1210 driver and adds the charger-detection support.

Applied phy patches to phy-next, thanks

-- 
~Vinod
