Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4BBC6FA86
	for <linux-usb@archiver.kernel.org>; Thu, 22 Sep 2022 13:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbiIVNsU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbiIVNr4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:47:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29ACF3933;
        Thu, 22 Sep 2022 06:47:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 014E8B836EC;
        Thu, 22 Sep 2022 13:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0624C433D6;
        Thu, 22 Sep 2022 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663854430;
        bh=GHdswNwa2l6I7a9Y1aPqdGywYJbHnh4/1zLSt2sJKZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i+GJonRlXcgtZo99D8zxZCnqgRyctr7FVQfHZzpnKMgBzpoiZ2MRFrzxBRfn1ufhz
         IWUdzwMAHWUO3Zty4tNp7/a5R3D0NDGp8DweWGpCZEuAw2A3SnZ0xZ0SPbkS4vv7Tp
         F8TUNynX+wDwbK8QwfmSgKCJgM0BukGcs377BI1w=
Date:   Thu, 22 Sep 2022 15:47:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Re: [PATCH v2 4/4] arm64: dts: tqma8mpql: add support for 2nd
 USB (host) interface
Message-ID: <YyxnVicN/W/M2/ir@kroah.com>
References: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
 <20220915062855.751881-5-alexander.stein@ew.tq-group.com>
 <YyxgUtT1gtyMIHeY@kroah.com>
 <5606023.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5606023.DvuYhMxLoT@steina-w>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 22, 2022 at 03:39:01PM +0200, Alexander Stein wrote:
> Hi Greg,
> 
> Am Donnerstag, 22. September 2022, 15:17:06 CEST schrieb Greg Kroah-Hartman:
> > On Thu, Sep 15, 2022 at 08:28:55AM +0200, Alexander Stein wrote:
> > > The on-board USB hub has a single reset line which needs to be enabled.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > 
> > >  .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 41 +++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > 
> > This patch failed to apply, please rebase and resend.
> 
> If I rebase this one to usb-testing (or usb-next) this will conflict with 
> additional patches for this file already in linux-next later on, especially 
> fb4f0b69565e ("arm64: dts: tqma8mpql: add USB DR support"). So IMHO this might 
> not the best idea.
> How to proceed here? Maybe Shawn can take this one once the other 3 patches 
> hit linux-next.

Yeah, or just wait for 6.1-rc1 to come out?

Your call,

greg k-h
