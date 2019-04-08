Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A5AC282CE
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 06:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE69C20870
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 06:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfDHGqX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 02:46:23 -0400
Received: from mail.lolchat.de ([212.58.75.196]:37891 "EHLO mail.lolchat.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfDHGqX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Apr 2019 02:46:23 -0400
Received: from [192.168.255.180] (mini [192.168.255.180])
        (authenticated bits=0)
        by mail.lolchat.de (8.15.2/8.15.2/Debian-12) with ESMTPSA id x386kHdn020041
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
        Mon, 8 Apr 2019 08:46:17 +0200
Subject: Re: Problem with USB2 devices connected to a hub
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <ccf69384-7aa2-883f-beb0-6bac8e9364e8@chini.tk>
 <352717b6-d467-92e6-640f-469c0682a91d@linux.intel.com>
 <9dc271d6-67c4-4e06-5bcb-d5dd3a480927@chini.tk>
 <c3e9e38f-28dd-3154-afcd-3922a23fbde0@linux.intel.com>
 <dea4e484-c4d3-a56b-6beb-1acf05c1ac8d@chini.tk>
 <dca924bf-dbb0-297c-cb39-d7cea474a144@chini.tk>
 <f413aeb9-08c5-2cff-f238-4766df35401d@chini.tk>
 <6e528087-923a-bc00-7db6-04c1c86845f2@linux.intel.com>
 <6ff355d4-5fc5-6c80-d3ee-d279c40c5ab3@chini.tk>
 <457f1aeb-aa48-b3ec-caaf-951de8744cb4@chini.tk>
 <0d3f6759-e7f8-8fd5-d164-dad4c08a49d4@linux.intel.com>
 <1f127b03-f009-f7ec-4c99-e859416565a1@linux.intel.com>
From:   Georg Chini <georg@chini.tk>
Message-ID: <cbf6294c-93d5-27c1-f94e-92d04bd7d931@chini.tk>
Date:   Mon, 8 Apr 2019 08:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1f127b03-f009-f7ec-4c99-e859416565a1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02.04.19 16:52, Mathias Nyman wrote:
> On 28.3.2019 15.41, Mathias Nyman wrote:
>>
>>>> The issue happens when only a single hub and a single device is 
>>>> connected to the
>>>> USB subsystem. On my previous board, I had two USB dongles and two 
>>>> sound
>>>> devices connected to the same hub and it worked without issues. So 
>>>> I guess it
>>>> is not a real bandwidth limit. Somehow the hub seems to eat the 
>>>> bandwidth.
>>>
>>>
>>> Can/will you investigate this problem further or do I have to live 
>>> with it? Or is there
>>> anything more I can do?
>>>
>>
>> This is one of the items I'm looking at.
>>
>> xHC hw calculates bandwidth usage when endpoints are added based on 
>> values in endpoint context.
>> The traces unfortunately didn't support this, so new tracing support 
>> was needed, added here to my
>> bandwith-debug branch:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git 
>> bandwidth-debug
>>
>> xHC hw can also report available bandwidth, but we don't yet have 
>> driver support.
>> I was planning on adding a hack that checks the available bandwidth 
>> after every endpoint change
>> and add it to the testbranch, but that part is not yet finished.
>>
>> New traces using the bandwidth-debug testbranch could be useful, even 
>> without the "available bandwidth"
>> support
>>
>
> available bandwidth tracking added to bandwidth-debug branch, any 
> chance you could take new traces?
>
> -Mathias

Sorry, only just read the mail, will do so in the next days.

