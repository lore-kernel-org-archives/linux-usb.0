Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898A5C433ED
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 09:14:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C3A96113A
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 09:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhDHJOZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Apr 2021 05:14:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16404 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhDHJOY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 05:14:24 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGFs50Df6zkjNH;
        Thu,  8 Apr 2021 17:12:25 +0800 (CST)
Received: from [10.67.102.118] (10.67.102.118) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 17:14:03 +0800
Subject: Re: [PATCH 0/2] USB:ehci:fix the no SRBN register problem
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <stern@rowland.harvard.edu>, <liudongdong3@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kong.kongxinwei@hisilicon.com>, <yisen.zhuang@huawei.com>
References: <1617872985-42735-1-git-send-email-liulongfang@huawei.com>
From:   liulongfang <liulongfang@huawei.com>
Message-ID: <47c02142-cb36-cec0-e3b7-cb1383010578@huawei.com>
Date:   Thu, 8 Apr 2021 17:14:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1617872985-42735-1-git-send-email-liulongfang@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/4/8 17:09, Longfang Liu wrote:
> (1) Add a whitelist for EHCI devices without SBRN registers.
> (2) Add Kunpeng920's EHCI device to the whitelist.
> 
> Longfang Liu (2):
>   USB:ehci:Add a whitelist for EHCI controllers
>   USB:ehci:fix Kunpeng920 ehci hardware problem
> 
>  drivers/usb/host/ehci-pci.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
Sorry, please ignore this patch.
Thanks.
Longfang.
