Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAA9C4167B
	for <linux-usb@archiver.kernel.org>; Tue,  8 Feb 2022 22:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387485AbiBHWYS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Feb 2022 17:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386406AbiBHU1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 15:27:43 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3808C0613CB
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 12:27:41 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 675B920AD270
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: core: devices: drop unreachable code in
 usb_dump_endpoint_descriptor()
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
References: <dac675d4-2dbd-e16d-622a-0471f31f2aca@omp.ru>
 <7a352b9b-0073-ad61-cbbf-256ec90e3ba3@omp.ru>
Organization: Open Mobile Platform
Message-ID: <629dc5c9-1ed9-2591-04c5-601beb7aedaa@omp.ru>
Date:   Tue, 8 Feb 2022 23:27:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7a352b9b-0073-ad61-cbbf-256ec90e3ba3@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/8/22 11:01 PM, Sergey Shtylyov wrote:

>> The *switch* statement in usb_dump_endpoint_descriptor() does handle all
>> possible endpoint types expilictly, so the *defaut* label is unreachable.
> 
>    It's *default*. :-) Please fix when/if merging! 

  Oh, and it's expilicitly! :-/

>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> [...]

MBR, Sergey
