Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8752DC433B4
	for <linux-usb@archiver.kernel.org>; Wed, 21 Apr 2021 02:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 414EA61406
	for <linux-usb@archiver.kernel.org>; Wed, 21 Apr 2021 02:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbhDUCIF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:08:05 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:60468 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233824AbhDUCIE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Apr 2021 22:08:04 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R401e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UWFcIKt_1618970849;
Received: from 30.13.161.100(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UWFcIKt_1618970849)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 21 Apr 2021 10:07:30 +0800
From:   =?UTF-8?B?56eN5ZiJ6bmP?= <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] usb: gadget: aspeed: Remove unnecessary version.h
 includes
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <1617681598-28165-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <YGvxAmHIgnRMcyuq@kroah.com>
Message-ID: <971ce789-9633-1799-6c55-50b79f2f179e@linux.alibaba.com>
Date:   Wed, 21 Apr 2021 10:06:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YGvxAmHIgnRMcyuq@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/4/6 13:26, Greg KH wrote:
> On Tue, Apr 06, 2021 at 11:59:58AM +0800, Jiapeng Chong wrote:
>> "make versioncheck" shows:
>>
>> ./drivers/usb/gadget/udc/aspeed-vhub/hub.c: 33 linux/version.h not
>> needed.
> 
> Then you need to fix the tool, and always test-build patches before you
> send them out, as this is obviously wrong :(
> 
Sorry for the noise. We'll do more test-build towards patches next time.

