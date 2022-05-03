Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA75DC433F5
	for <linux-usb@archiver.kernel.org>; Tue,  3 May 2022 14:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237158AbiECOlb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 May 2022 10:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236366AbiECOl3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 10:41:29 -0400
X-Greylist: delayed 657 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 03 May 2022 07:37:57 PDT
Received: from radex-web.radex.nl (smtp.radex.nl [178.250.146.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C99B3467F;
        Tue,  3 May 2022 07:37:57 -0700 (PDT)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl [178.250.146.69])
        by radex-web.radex.nl (Postfix) with ESMTPS id AB2AA24071;
        Tue,  3 May 2022 16:26:58 +0200 (CEST)
Message-ID: <2a436486-a54d-a9b3-d839-232a38653af3@gmail.com>
Date:   Tue, 3 May 2022 16:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next 0/7] Polling be gone on LAN95xx
Content-Language: en-US
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Steve Glendinning <steve.glendinning@shawell.net>,
        UNGLinuxDriver@microchip.com, Oliver Neukum <oneukum@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, Andre Edich <andre.edich@microchip.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Gabriel Hojda <ghojda@yo2urs.ro>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>
References: <cover.1651037513.git.lukas@wunner.de>
 <a9fcc952-a55f-1eae-c584-d58644bae00d@gmail.com>
 <20220503082612.GA21515@wunner.de>
From:   Ferry Toth <fntoth@gmail.com>
In-Reply-To: <20220503082612.GA21515@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 03-05-2022 10:26, Lukas Wunner wrote:
> On Mon, May 02, 2022 at 10:33:06PM +0200, Ferry Toth wrote:
>> Op 27-04-2022 om 07:48 schreef Lukas Wunner:
>>> Do away with link status polling on LAN95XX USB Ethernet
>>> and rely on interrupts instead, thereby reducing bus traffic,
>>> CPU overhead and improving interface bringup latency.
>> Tested-by: Ferry Toth <fntoth@gmail.com> (Intel Edison-Arduino)
> Thank you!
>
>> While testing I noted another problem. I have "DMA-API: debugging enabled by
>> kernel config" and this (I guess) shows me before and after the patches:
>>
>> ------------[ cut here ]------------
>> DMA-API: xhci-hcd xhci-hcd.1.auto: cacheline tracking EEXIST, overlapping
>> mappings aren't supported
> That is under investigation here:
> https://bugzilla.kernel.org/show_bug.cgi?id=215740
>
> It's apparently a long-standing bug in the USB core which was exposed
> by a new WARN() check introduced in 5.14.

I'm not sure this is correct. The issue happens for me only when 
connecting the SMSC9414.

Other usb devices I have (memory sticks, wifi, bluetooth) do not trigger 
this.

I think we need to consider it might be a valid warning. It seems to be 
originating from the same "Workqueue: usb_hub_wq hub_event" though.

> Thanks,
>
> Lukas
