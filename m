Return-Path: <SRS0=u9El=7K=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960A4C433DF
	for <linux-usb@archiver.kernel.org>; Thu, 28 May 2020 16:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71F5A20814
	for <linux-usb@archiver.kernel.org>; Thu, 28 May 2020 16:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="l1XCxit8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405038AbgE1Qbg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 28 May 2020 12:31:36 -0400
Received: from mail.codeweavers.com ([50.203.203.244]:46660 "EHLO
        mail.codeweavers.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405029AbgE1Qbf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 12:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ahu6+Mn2WcqXKjq6TEMeyI6/lC8WbVgAQDCpTQfP0vA=; b=l1XCxit8BlwHtClDZ9JQxxJAbL
        rPGRnBWydnSnpgUvAUuquploPtV4l4xTPpj9IQiRHoRr6G1i4Sa3QT742dY+PSk88S4a83c4H5wW3
        nSAIfK42GccyxLGv9YK0k6dA+NfRbfNc9Hg69V0gYE4YdXaD4GiKTO34Qz8LUsYM5pjc=;
Received: from [64.191.7.9] (helo=[192.168.1.115])
        by mail.codeweavers.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <zfigura@codeweavers.com>)
        id 1jeLRL-0003AS-0X; Thu, 28 May 2020 11:31:33 -0500
Subject: Re: Bug 207877: ASMedia drive (174c:55aa) hangs in ioctl
 CDROM_DRIVE_STATUS when mounting a DVD
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
References: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
 <20200528075440.GA2881385@kroah.com>
 <465eaae3-fa60-f37e-1d62-c52236720798@codeweavers.com>
 <20200528160420.GA14188@rowland.harvard.edu>
From:   Zebediah Figura <zfigura@codeweavers.com>
Message-ID: <232b68f8-9a5c-89fd-2e12-bf63f49dbe38@codeweavers.com>
Date:   Thu, 28 May 2020 11:21:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528160420.GA14188@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/28/20 11:04 AM, Alan Stern wrote:
> On Thu, May 28, 2020 at 10:02:07AM -0500, Zebediah Figura wrote:
>> On 5/28/20 2:54 AM, Greg KH wrote:
>>> On Wed, May 27, 2020 at 11:23:13PM -0500, Zebediah Figura wrote:
>>>> Hello all,
>>>>
>>>> I was asked to report this bug here. There's more details in the bug report,
>>>> but it's been proposed that there's a deadlock between device_reset() in
>>>> scsiglue.c and usb_stor_control_thread().
>>>
>>> What bug report where?  Can you provide a link and the details here in
>>> the email?
>>
>> Oops, meant to link it and forgot. Sorry about that.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=207877
> 
> This doesn't look like a deadlock to me, at least, not a deadlock
> involving the device reset code.
> 
> Your next step should be to collect a usbmon trace showing what happens
> when the problem occurs.  See the instructions in
> Documentation/usb/usbmon.rst.

Thanks, I've attached a usbmon trace to the bug. It seems the kernel 
submits a bulk input transfer that never receives a response. I hope my 
drive isn't broken...
