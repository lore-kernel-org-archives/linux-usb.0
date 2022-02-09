Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D30C433EF
	for <linux-usb@archiver.kernel.org>; Wed,  9 Feb 2022 15:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbiBIPU5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Feb 2022 10:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235732AbiBIPUy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 10:20:54 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25220C06157B
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 07:20:52 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 7C3FE208D0A6
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2] usb: host: xhci: drop redundant checks
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <4faac4cb-7940-9133-6255-ff9df13bf87d@omp.ru>
 <31067327-08fd-1de6-c011-9e17aec40fa8@linux.intel.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <4655f83d-04e4-ed12-9ec5-1b969876752c@omp.ru>
Date:   Wed, 9 Feb 2022 18:20:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <31067327-08fd-1de6-c011-9e17aec40fa8@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/9/22 3:40 PM, Mathias Nyman wrote:

>> In xhci_endpoint_{disable|reset}() the expression '&vdev->eps[ep_index]'
>> just cannot be NULL, so the checks have no sense at all...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> True, adding this

   At least SVACE was good for smething. :-)

> Thanks
> -Mathias

MBR, Sergey
