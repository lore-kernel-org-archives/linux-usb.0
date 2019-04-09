Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EC5C10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:26:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B197420651
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfDIH0i convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 03:26:38 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:42243 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfDIH0i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 03:26:38 -0400
X-Originating-IP: 90.88.30.125
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8F714C0007;
        Tue,  9 Apr 2019 07:26:35 +0000 (UTC)
Date:   Tue, 9 Apr 2019 09:26:34 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-usb@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: Question about regulators
Message-ID: <20190409092634.222919dd@xps13>
In-Reply-To: <20190403101343.718c156d@xps13>
References: <20190403101343.718c156d@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Adding Greg & Hans just in case they have an idea, or someone else to
ping in mind.

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 3 Apr 2019
10:13:43 +0200:

> Hello,
> 
> I am reading the document named "xHCI interoperability testing v0.94"
> available on usb.org. There is this paragraph:
> 
>         Devices operating at Enhanced SuperSpeed GenX are allowed to
>         draw a maximum configured current of 900mA and unconfigured
>         current of 150mA. Devices operating at High-Speed or below may
>         draw a maximum configured current of 500mA and unconfigured
>         current of 100mA*. Devices must report their maximum configured
>         current draw and their power configuration as self or bus
>         powered to the host and must operate within the regions
>         reported. Additionally any device that is in the suspended
>         state may draw no more than 2.5 mA.
> 
> My understanding is that the current limitation on Vbus should be tuned
> dynamically between 100, 150, 500 and 900mA depending on the type of
> device and if has been configured or not.
> 
> Despite some researches in the USB core I can't find any mechanism
> handling this in Linux implementation.
> 
> Behind this remark, I actually have boards (Armada 7040/8040 DB) with a
> regulator on Vbus to limit the current to either 500 or 900mA. I
> checked the xhci-platform driver which is used with these SoCs and I
> don't find any mean to tweak this value depending on the inserted
> device.
> 
> Should I actually care? Is it enough to limit to 900mA whenever the
> xHCI driver is probed?
> 
> Thanks for your guidance,
> Miquèl


Thanks,
Miquèl
