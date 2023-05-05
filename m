Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7A9C7EE22
	for <linux-usb@archiver.kernel.org>; Fri,  5 May 2023 11:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjEELAn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 May 2023 07:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbjEELAi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 07:00:38 -0400
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28BB1A49E;
        Fri,  5 May 2023 04:00:29 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        by mail11.truemail.it (Postfix) with ESMTPA id 75BE8222DE;
        Fri,  5 May 2023 13:00:27 +0200 (CEST)
Date:   Fri, 5 May 2023 13:00:26 +0200
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>, Jun Li <jun.li@nxp.com>
Cc:     Francesco Dolcini <francesco@dolcini.it>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "peter.chen@nxp.com" <peter.chen@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2 2/3] usb: chipidea: imx: support disabling runtime-pm
Message-ID: <ZFThyn/D/dDK9nk3@francesco-nb.int.toradex.com>
References: <23672d66d229d3be4cc854ddf1462c3507f1c2fc.camel@toradex.com>
 <20230504162312.1506763-1-luca.ceresoli@bootlin.com>
 <ZFPiRvoF5l8uGzzZ@francesco-nb.int.toradex.com>
 <PA4PR04MB96403377F5E37C12AD8C25B389729@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <20230505120618.2f4cf22c@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505120618.2f4cf22c@booty>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 05, 2023 at 12:06:18PM +0200, Luca Ceresoli wrote:
> On Fri, 5 May 2023 09:49:16 +0000
> Jun Li <jun.li@nxp.com> wrote:
> > Is your board design similar like Francesco's as below?
> 
> Possibly, but I'm afraid I can't say: I am using the Toradex Colibri
> i.MX6ULL SoM, whose schematics are not public.

I can confirm that it's the same.

Francesco

