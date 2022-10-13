Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E37EC4332F
	for <linux-usb@archiver.kernel.org>; Thu, 13 Oct 2022 10:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJMKO2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Oct 2022 06:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiJMKOY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 06:14:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CABB42E6D
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 03:14:23 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oivEC-0004MS-Vg; Thu, 13 Oct 2022 12:14:12 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oivEC-0008EZ-EU; Thu, 13 Oct 2022 12:14:12 +0200
Date:   Thu, 13 Oct 2022 12:14:12 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: usb: ci-hdrc-usb2: Add more phy tuning
 properties
Message-ID: <20221013101412.GI6702@pengutronix.de>
References: <20221011082924.884123-1-s.hauer@pengutronix.de>
 <20221011082924.884123-7-s.hauer@pengutronix.de>
 <20221012160806.GA2189350-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012160806.GA2189350-robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 12, 2022 at 11:08:06AM -0500, Rob Herring wrote:
> On Tue, Oct 11, 2022 at 10:29:24AM +0200, Sascha Hauer wrote:
> > Following the example of samsung,picophy-dc-vol-level-adjust more
> > phy tuning properties are added for configuring the remaining bitfields
> > in the USBNC_n_PHY_CFG1 register.
> 
> All these properties really doesn't scale. These properties should go 
> in the phy node as they are properties or the phy. There's no rule that 
> you can only read properties from the driver's device node.

I understand and agree.

On i.MX8M we currently use the usb-nop-xceiv. I guess it's not an option
to just add these properties there, so we'll need a phy node with a new
compatible like fsl,imx8mm-usbphy. The driver would basically just
register a usb-nop-xceiv and the node would be a container for the new
property. Does this sound sane?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
