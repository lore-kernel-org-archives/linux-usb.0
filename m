Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05B2C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:42:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D7522482
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727712AbgLWOmm (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Dec 2020 09:42:42 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9920 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbgLWOmm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Dec 2020 09:42:42 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1G9Q608Sz7K9m;
        Wed, 23 Dec 2020 22:41:14 +0800 (CST)
Received: from [10.174.178.154] (10.174.178.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 23 Dec
 2020 22:41:54 +0800
Subject: Re: [RESEND] usb: dwc3: meson-g12a: disable clk on error handling
 path in probe
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <balbi@kernel.org>, <khilman@baylibre.com>,
        <narmstrong@baylibre.com>, <jbrunet@baylibre.com>,
        <martin.blumenstingl@googlemail.com>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20201215025459.91794-1-zhengzengkai@huawei.com>
 <c069b566-224d-f938-089c-6a69d1ec9d55@huawei.com>
 <X+L7usyEWYXzxQWD@kroah.com>
From:   Zheng Zengkai <zhengzengkai@huawei.com>
Message-ID: <7df00fa7-df62-e963-6fb8-5e66fc47383d@huawei.com>
Date:   Wed, 23 Dec 2020 22:41:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X+L7usyEWYXzxQWD@kroah.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.154]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> On Wed, Dec 23, 2020 at 10:13:03AM +0800, Zheng Zengkai wrote:
>> Hi everyone,
>>
>> Friendly ping:
>>
>> Just want to know why this patch was ignored,
> Right now it is the merge window and we can't do anything with any
> patches until 5.11-rc1 is out.  After that happens, I'll work on
> catching up on older patches like this.
>
> thanks,
>
> greg k-h
> .

Thank you very much for your reply and information!

Best Regards,

Zheng Zengkai

