Return-Path: <SRS0=HzBI=SQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F231C10F13
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 19:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00AF42073F
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 19:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfDNTqZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 14 Apr 2019 15:46:25 -0400
Received: from bmailout1.hostsharing.net ([83.223.95.100]:41115 "EHLO
        bmailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfDNTqZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Apr 2019 15:46:25 -0400
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id 0B3B43000034F;
        Sun, 14 Apr 2019 21:46:24 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id A0564DFE0F; Sun, 14 Apr 2019 21:46:23 +0200 (CEST)
Date:   Sun, 14 Apr 2019 21:46:23 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Minas Harutyunyan <minas.harutyunyan@synopsys.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: lan78xx: About 8000 usb interrupts per second when idle
Message-ID: <20190414194623.afp3fanjuq72ctln@wunner.de>
References: <20190408143443.335f7e93@xhacker.debian>
 <002929b7-9a0d-6d92-4e03-18a6748c6708@i2se.com>
 <20190408160551.03911b27@xhacker.debian>
 <20190409144655.753d3bd9@xhacker.debian>
 <3cda1098-e0ad-42ac-af96-c85eba480556@i2se.com>
 <BN6PR1201MB008219D0CF1CB7CF7F802008A72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR1201MB008219D0CF1CB7CF7F802008A72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 09, 2019 at 09:28:16AM +0000, Minas Harutyunyan wrote:
> Am 09.04.19 um 08:54 schrieb Jisheng Zhang:
> > The second one: 8000 usb interrupts per second when idle.
> > This is abnormal. any idea? Is it due to the lan78xx?
> 
> dwc2 in host mode enable SOF interrupts if any periodic EP are in use.
> So, 8000 interrupts per second is expectant behavior.

The dwc_otg driver patched into the Raspberry Pi Foundation's
kernel seems to make do with much fewer interrupts and much
lower CPU load.  How does it do that and how could dwc2 be
made to do the same?  Would it be possible for you to provide
me with documentation on the chip?  The Synopsis website
requires registration for downloads and registration requires
a Synopsis customer ID.

It seems the Foundation's dwc_otg driver was forked from code
that later begat dwc2.

Thanks,

Lukas
