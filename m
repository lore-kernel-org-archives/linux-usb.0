Return-Path: <SRS0=jKIj=D3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BE3C433E7
	for <linux-usb@archiver.kernel.org>; Tue, 20 Oct 2020 12:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D7DD222C8
	for <linux-usb@archiver.kernel.org>; Tue, 20 Oct 2020 12:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406476AbgJTMoM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Oct 2020 08:44:12 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53024 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406354AbgJTMoM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 08:44:12 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 711BF803071B;
        Tue, 20 Oct 2020 12:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iv3grK-qK-Jr; Tue, 20 Oct 2020 15:44:09 +0300 (MSK)
Date:   Tue, 20 Oct 2020 15:44:04 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 05/29] arm64: dts: amlogic: meson-g12: Set FL-adj
 property value
Message-ID: <20201020124404.by7skr6rvqrqwgbi@mobilestation.baikal.int>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
 <20201020123404.GC127386@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201020123404.GC127386@kozik-lap>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 02:34:04PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2020 at 02:59:35PM +0300, Serge Semin wrote:
> > In accordance with the DWC USB3 bindings the property is supposed to have
> > uint32 type. It's erroneous from the DT schema and driver points of view
> > to declare it as boolean.
> 

> I think the driver uses it as u32, so what do you mean by "declare" in
> context of a driver?

I meant that both the driver and DT schema expects it to be uint32, while the
dts has got the property as boolean, which is wrong. The same problem has
been fixed in the Amlogic Meson-g12 DT schema example:
https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/T/#m225585212162b9f5cccb1a7088850fab8792b7b3

-Sergey

> 
> Best regards,
> Krzysztof
