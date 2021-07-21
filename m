Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E00C12002
	for <linux-usb@archiver.kernel.org>; Wed, 21 Jul 2021 16:49:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3476C61222
	for <linux-usb@archiver.kernel.org>; Wed, 21 Jul 2021 16:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhGUQI2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 21 Jul 2021 12:08:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:34908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229750AbhGUQI1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Jul 2021 12:08:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD1246109F;
        Wed, 21 Jul 2021 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626886143;
        bh=s+F7hwqvx1Im40EqlbcvxgltsvKjKASH0j59Wu8mKFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QbGho/J4vtDTKRnidPu6sgmzcYap3tWvi+kGGi+L4x6EfZ2p4egoci4aI3CSc1D5F
         sacRxGKsf7dh7UZETpsOyY6b9SI6pHxpGuATmsGUlH7C9t9zWGdVjjNWaVADBqriaN
         WWizV5cPWXRPVdqae7bhQZHA+DOirFoW40+F6p2vSLw3G78rK/QNqWWHre9wdQ3uO5
         gIylL/Op8v2XCILDf9Rpgkr2V0Qtw7tcvDtPKrL26MPzh3tD5Gn+Up/oqZ8CNQ4jlm
         Eug04Agnyvfiic9d0bQtkS7KPPVPWGBZ+lmxD0nA+nrZRrg4gHjSWk3x+WyGCxZEEe
         1X+0BHBcK1ybg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m6FOh-0003tF-QY; Wed, 21 Jul 2021 18:48:40 +0200
Date:   Wed, 21 Jul 2021 18:48:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee
 stick
Message-ID: <YPhP56ZpNa7EDc8H@hovoldconsulting.com>
References: <20210721161745.2101328-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721161745.2101328-1-john@metanate.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 05:17:45PM +0100, John Keeping wrote:
> Add the USB serial device ID for the CEL ZigBee EM3588 radio stick.
> 
> Signed-off-by: John Keeping <john@metanate.com>

Applied, thanks.

Johan
