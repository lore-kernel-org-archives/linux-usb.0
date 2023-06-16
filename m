Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B301EB64D9
	for <linux-usb@archiver.kernel.org>; Fri, 16 Jun 2023 02:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239577AbjFPCAS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Jun 2023 22:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjFPCAP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 22:00:15 -0400
X-Greylist: delayed 711 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Jun 2023 19:00:06 PDT
Received: from mail-m11876.qiye.163.com (mail-m11876.qiye.163.com [115.236.118.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1F02D61;
        Thu, 15 Jun 2023 19:00:05 -0700 (PDT)
Received: from [172.16.12.33] (unknown [58.22.7.114])
        by mail-m11876.qiye.163.com (Hmail) with ESMTPA id AAFE03C02BE;
        Fri, 16 Jun 2023 09:48:00 +0800 (CST)
Message-ID: <2a833dc5-569b-d7e0-eb93-385f03af81b1@rock-chips.com>
Date:   Fri, 16 Jun 2023 09:48:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] usb: typec: tcpm: add get max power support
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     sebastian.reichel@collabora.com, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, heiko@sntech.de,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
        william.wu@rock-chips.com, jianwei.zheng@rock-chips.com,
        yubing.zhang@rock-chips.com, wmc@rock-chips.com
References: <20230322093120.8686-1-frank.wang@rock-chips.com>
 <2023061551-gumminess-clasp-6285@gregkh>
Content-Language: en-US
From:   Frank Wang <frank.wang@rock-chips.com>
In-Reply-To: <2023061551-gumminess-clasp-6285@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9MSFZLQk5DGR9CH0gZHUhVEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5MSUpJVUpLS1VKQl
        kG
X-HM-Tid: 0a88c1e3550e2eb2kusnaafe03c02be
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PEk6Fhw5Cz1OFBAeECwvFz5I
        FhdPCTNVSlVKTUNNQ0NLS0NKTUlDVTMWGhIXVR0JGhUQVQwaFRw7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0hNNwY+
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 2023/6/15 17:39, Greg KH wrote:
> On Wed, Mar 22, 2023 at 05:31:20PM +0800, Frank Wang wrote:
>> Traverse fixed pdos to calculate the maximum power that the charger
>> can provide, and it can be get by POWER_SUPPLY_PROP_INPUT_POWER_LIMIT
>> property.
>>
>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
> What ever happened to this patch?
>
> Frank, can you rebase it and resubmit?

Thanks for your reply, I shall resubmit it later.

BR.
Frank

> thanks,
>
> greg k-h

