Return-Path: <SRS0=ob+s=WS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABB8C3A59D
	for <linux-usb@archiver.kernel.org>; Thu, 22 Aug 2019 10:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF3BB233FE
	for <linux-usb@archiver.kernel.org>; Thu, 22 Aug 2019 10:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="lswd9Wbv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731941AbfHVK2F (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Aug 2019 06:28:05 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14998 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfHVK2E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 06:28:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d5e6e340000>; Thu, 22 Aug 2019 03:28:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 22 Aug 2019 03:28:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 22 Aug 2019 03:28:04 -0700
Received: from [10.24.193.88] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Aug
 2019 10:28:01 +0000
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
To:     Felipe Balbi <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
 <87tvaqtuk9.fsf@gmail.com>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <a8f5fb17-559d-f3c3-915d-bca6632fe848@nvidia.com>
Date:   Thu, 22 Aug 2019 15:59:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87tvaqtuk9.fsf@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL109.nvidia.com (172.20.187.15) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1566469685; bh=joDdJIJMpJ7jsgBcg7DuODO1Vellt4oZED8n2K7bug4=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lswd9Wbv1pUY+DoTeRuEICLRJlaobj1FGZHUuOfMaoW3tAywsMvZm1Ok/aYS8vvOJ
         5JF/A4jnfzuE7sazBBHMbbSnqV5t6hlHJHi1LRqLERi3VyIGqTNwRcuVAvfzwFPeyp
         Qn94wsvKYDYjSZqE/rKDAaXv5spf6N+Codzi0Ix1n5fEqtj2NzjlkAofZFRvmGoZW7
         NEEGEa/VybpLnKif4Q52v1XJF+tQN5rvsg0hMGTwzZaZfYZWW6sSkU4TfT4d+VpRS/
         qfBFo595LW3UYEUFTFo6S5jMTnqtcQgTCVqdoOYJ7E/pMrNejkuk8kJeYBksEQhgrd
         6H8iBgQ0yGW1A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 09-08-2019 17:33, Felipe Balbi wrote:
> 
> Hi,
> 
> Nagarjuna Kristam <nkristam@nvidia.com> writes:
>> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
>> XUSB device mode controller supports SS, HS and FS modes
>>
>> Based on work by:
>>   Mark Kuo <mkuo@nvidia.com>
>>   Hui Fu <hfu@nvidia.com>
>>   Andrew Bresticker <abrestic@chromium.org>
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/usb/gadget/udc/Kconfig      |   11 +
>>  drivers/usb/gadget/udc/Makefile     |    1 +
>>  drivers/usb/gadget/udc/tegra_xudc.c | 3808 +++++++++++++++++++++++++++++++++++
>>  3 files changed, 3820 insertions(+)
>>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>>
>> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
>> index ef0259a..fe6028e 100644
>> --- a/drivers/usb/gadget/udc/Kconfig
>> +++ b/drivers/usb/gadget/udc/Kconfig
>> @@ -440,6 +440,17 @@ config USB_GADGET_XILINX
>>  	  dynamically linked module called "udc-xilinx" and force all
>>  	  gadget drivers to also be dynamically linked.
>>  
>> +config USB_TEGRA_XUDC
>> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
>> +	depends on ARCH_TEGRA
> 
> I need at least a COMPILE_TEST here.
> 
Sure will add the same in next series.

-Nagarjuna
