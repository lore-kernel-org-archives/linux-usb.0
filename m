Return-Path: <SRS0=tQHF=DS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AD9C433DF
	for <linux-usb@archiver.kernel.org>; Sun, 11 Oct 2020 18:09:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 814422222E
	for <linux-usb@archiver.kernel.org>; Sun, 11 Oct 2020 18:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgJKSJf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 11 Oct 2020 14:09:35 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59120 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgJKSJe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Oct 2020 14:09:34 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A43B68030867;
        Sun, 11 Oct 2020 18:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UEeARWP9OoXE; Sun, 11 Oct 2020 21:09:32 +0300 (MSK)
Date:   Sun, 11 Oct 2020 21:09:30 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/18] dt-bindings: usb: dwc3: Add interrupt-names
 property support
Message-ID: <20201011180930.d6sk6kfmaotcnyml@mobilestation>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-12-Sergey.Semin@baikalelectronics.ru>
 <a2850dee-6c6b-2ae9-eed4-a13b3f8e532f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a2850dee-6c6b-2ae9-eed4-a13b3f8e532f@gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 11, 2020 at 11:53:07AM +0300, Sergei Shtylyov wrote:
> On 11.10.2020 1:41, Serge Semin wrote:
> 
> > The controller driver supports two types of DWC USB3 devices: with a
> > common interrupt lane and with individual interrupts for each mode. Add
> > both of these cases support to the DWC USB3 DT schema.
> 

>    Add support for both these cases?

Ok. Thanks.

-Sergey

> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> [...]
> 
> MBR, Sergei
