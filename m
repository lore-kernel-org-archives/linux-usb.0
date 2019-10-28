Return-Path: <SRS0=C12n=YV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7AFCA9EC0
	for <linux-usb@archiver.kernel.org>; Mon, 28 Oct 2019 18:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56334204FD
	for <linux-usb@archiver.kernel.org>; Mon, 28 Oct 2019 18:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfJ1Sl7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Oct 2019 14:41:59 -0400
Received: from foss.arm.com ([217.140.110.172]:44050 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726822AbfJ1Sl7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Oct 2019 14:41:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA031F1;
        Mon, 28 Oct 2019 11:41:58 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C8383F71F;
        Mon, 28 Oct 2019 11:41:58 -0700 (PDT)
Subject: Re: [PATCH 0/5] add rk3328 usb3 phy driver
To:     Peter Geis <pgwipeout@gmail.com>, heiko@sntech.de, kishon@ti.com
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net
References: <20191028182254.30739-1-pgwipeout@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <5230f80c-9684-72e0-8f96-602428a9e655@arm.com>
Date:   Mon, 28 Oct 2019 18:41:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191028182254.30739-1-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/10/2019 18:22, Peter Geis wrote:
> It took a lot more effort than originally anticipated, but here it is.
> This is the driver from [0], updated to work with the current kernel.
> I've tested it on the rk3328-roc-cc board, both usb 2.0 and usb 3.0
> devices detect on hotplug.

Thanks Peter, I'll try to give this a go on my box for confirmation.

One quick comment is that it might be worth importing the version from 
Rockchip's own kernel tree, as that includes this additional patch which 
looks like a welcome improvement:

https://github.com/rockchip-linux/kernel/commit/12efa9acad65b4c3256683c1ccd769687be3ca56#diff-b6317b3425ac054be551abdcda910b68

Also, as it's a new phy driver, we should keep Kishon (+cc) in the loop 
as the subsystem maintainer.

Robin.

> [0] https://github.com/FireflyTeam/kernel/commits/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> 
> Peter Geis (5):
>    phy: rockchip: add inno-usb3 phy driver
>    dt-bindings: clean up rockchip grf binding document
>    Documentation: bindings: add dt documentation for rockchip usb3 phy
>    arm64: dts: rockchip: add usb3 to rk3328 devicetree
>    arm64: dts: rockchip: enable usb3 on rk3328-roc-cc
> 
>   .../bindings/phy/phy-rockchip-inno-usb3.yaml  |  157 +++
>   .../devicetree/bindings/soc/rockchip/grf.txt  |    8 +-
>   .../devicetree/bindings/usb/rockchip,dwc3.txt |    9 +-
>   .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts |   21 +
>   arch/arm64/boot/dts/rockchip/rk3328.dtsi      |   72 ++
>   drivers/phy/rockchip/Kconfig                  |    9 +
>   drivers/phy/rockchip/Makefile                 |    1 +
>   drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 1107 +++++++++++++++++
>   8 files changed, 1378 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb3.yaml
>   create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> 
