Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90712C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 29 Mar 2021 06:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DB8A6191F
	for <linux-usb@archiver.kernel.org>; Mon, 29 Mar 2021 06:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhC2GDi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 29 Mar 2021 02:03:38 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14940 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhC2GD3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 02:03:29 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F825k0cqczkgPx;
        Mon, 29 Mar 2021 14:01:46 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Mar 2021
 14:03:19 +0800
Subject: Re: [PATCH] usb: dwc2: add parenthess and space around *
To:     Greg KH <greg@kroah.com>, Tian Tao <tiantao6@hisilicon.com>
CC:     <hminas@synopsys.com>, <linux-usb@vger.kernel.org>
References: <1616988705-27062-1-git-send-email-tiantao6@hisilicon.com>
 <YGFgWBh4J7qwQzRi@kroah.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <0af7faf5-186e-cca1-049b-4a4a9110d5f6@huawei.com>
Date:   Mon, 29 Mar 2021 14:03:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YGFgWBh4J7qwQzRi@kroah.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


ÔÚ 2021/3/29 13:06, Greg KH Ð´µÀ:
> On Mon, Mar 29, 2021 at 11:31:45AM +0800, Tian Tao wrote:
>> Just fix the following checkpatch error:
>> ERROR: Macros with complex values should be enclosed in parentheses.`
> Why the trailing ` character here?

thanks for review£¬This is mistake£¬I will send v2 to fix it.

>
> thanks,
>
> greg k-h
> .
>

