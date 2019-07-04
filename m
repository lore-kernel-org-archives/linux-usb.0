Return-Path: <SRS0=EamD=VB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6A7C0651F
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jul 2019 13:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A7BD218BC
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jul 2019 13:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="eRbHHTAO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfGDNmj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Jul 2019 09:42:39 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3696 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNmj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 09:42:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1e02520000>; Thu, 04 Jul 2019 06:42:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 04 Jul 2019 06:42:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 04 Jul 2019 06:42:38 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jul
 2019 13:42:36 +0000
Subject: Re: [PATCH 5/8] soc/tegra: pmc: support T210 USB 2.0 Sleepwalk
To:     JC Kuo <jckuo@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1d76ccee-4ae8-9aa1-93c5-5efabcf60e89@nvidia.com>
Date:   Thu, 4 Jul 2019 14:42:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190614074824.22023-1-jckuo@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562247762; bh=7zTMoqbepZoj7GRANEXGMZzQ0+Rj3S650+g1wXZ5W3U=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=eRbHHTAOpagIUzeoSbQmugUwgoxveWy6h4BqF7q2MWWTRXDSzSlPpJw07gM3lnoWl
         vZg4NrkrDmIPgptKhpMQqCELXR/3Fj6UcQn0YqRfV3yfayFM1F8bizg8JP+A6Dcsc2
         FdjD5TNpyecgFGDYmce+hJ0qgosbX283GfTXz800DDe/RcU0sOZbLiBUwQMz/j7aLQ
         B187l8em6mIJtlb6bg32o+uOBR9kIQHfd6Jlgr6s2+qz152UdW9/PoohR/1aoVCQ5k
         TFzrOCck1FTAFtmDReoILC7snrjhB3zGles3pK4SG2Y8ZY6SRbTug3OH9l+0z9h/RX
         2TRLIpgAo7l+A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 14/06/2019 08:48, JC Kuo wrote:
> This commit implements Tegra210 PMC USB 2.0 (UTMI and HSIC) Sleepwalk
> programming sequence. With Sleepwalk enabled, XUSB host controller
> can be put into ELPG (Engine Level PowerGate) state when controller
> is idle to save power. The Sleepwalk logic is in charge of wake event
> detection and maintain resume signal accordingly till XUSB host
> controller is bring out of ELPG.

Ok, so these new global APIs will be called directly by the Tegra XUSB
driver? Could this be implemented as (another) pinctrl driver for the
PMC that the XUSB driver could reference from DT?

Cheers
Jon

-- 
nvpublic
