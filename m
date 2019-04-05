Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4189AC4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 08:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1699C206C0
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 08:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730024AbfDEIjC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 04:39:02 -0400
Received: from smtp.hosts.co.uk ([85.233.160.19]:52742 "EHLO smtp.hosts.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfDEIjB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Apr 2019 04:39:01 -0400
Received: from [86.25.85.124] (helo=[192.168.0.20])
        by smtp.ukservers.net with esmtpa (Exim)
        (envelope-from <john@travell.uk.net>)
        id 1hCKNH-0004yc-CX; Fri, 05 Apr 2019 09:39:00 +0100
Subject: Re: USB keyboard and mouse non responsive at login
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <a8c6d4e9-29c5-73cc-ca9d-8c973a5876ac@travell.uk.net>
 <20190405044904.GA553@kroah.com>
From:   John Travell <john@travell.uk.net>
Message-ID: <0b9b2877-dd50-a9bc-afa1-17a081ded46e@travell.uk.net>
Date:   Fri, 5 Apr 2019 09:38:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190405044904.GA553@kroah.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg,
While I fully appreciate that the origins of 3.13 are steeped in 
history, the three versions mentioned were released this year.
All came from the ubuntu repositories, not via any paid support.

I have this one machine still on Linux Mint 17.3, with an old AMD 
graphics card that is not supported in amdgpu for kernel 4.*.
When last I tried them, the open source drivers in Mint 18.* did not 
correctly support a dual head display. I am not yet sure that LM19 is 
any better.
Because LM17.3 is going EOL I am having to update, but that is a work in 
progress.

John Travell

On 05/04/2019 05:49, Greg KH wrote:
> On Thu, Apr 04, 2019 at 10:16:36PM +0100, John Travell wrote:
>> Summary: USB keyboard and mouse non responsive at login
>> Product: Drivers
>> Version: 2.5
>> Kernel Version: 3.13.0-166-generic
>> Kernel Version: 3.13.0-167-generic
>> Kernel Version: 3.13.0-168-generic
> 
> 3.13 was released back in January of 2014, if you are stuck on this old,
> obsolete kernel version, please contact the company you are paying for
> support for this, as they are the only ones that can provide this (and
> you are paying for it, so use that!)
> 
> good luck,
> 
> greg k-h
> 
