Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E4FC433F5
	for <linux-usb@archiver.kernel.org>; Thu, 17 Feb 2022 09:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238518AbiBQJUs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Feb 2022 04:20:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbiBQJUr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 04:20:47 -0500
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED94827DF30
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 01:20:30 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru BCFED2297C33
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] usb: host: ehci-q: make qtd_fill() return 'u16'
To:     David Laight <David.Laight@ACULAB.COM>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <7f2e3194-c897-7ffd-756e-8a9c93d652cd@omp.ru>
 <db41f36420cc4d8585665bf586c1e26e@AcuMS.aculab.com>
Organization: Open Mobile Platform
Message-ID: <bc3af329-85cf-4104-acd7-15d527db6810@omp.ru>
Date:   Thu, 17 Feb 2022 12:20:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <db41f36420cc4d8585665bf586c1e26e@AcuMS.aculab.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 2/17/22 1:33 AM, David Laight wrote:

>> At the end of qtd_fill(), we assign the 'int count' variable to the 'size_t
>> length' field of 'struct ehci_qtd'.  In order not to mix the *signed* and
>> *unsigned* values let's make that variable and the function's result 'u16'
>> as qTD's maximum length is a 15-bit quantity anyway...
> 
> Except that you really don't want to be doing arithmetic on sub-register
> sized values.

    So using/returning *unsigned int* instead should be fine?

> On everything except x86 the compiler will have to add instructions
> to mask the value to 16 bits (unless its logic can detect that overflow
> can never happen).

   Yeah, I've only looked at the code produced by x86 gcc, should have tried
e.g. an ARM toolchain as well...

> There is a similar problem with parameters and return values.
> They need masking one side of the call (or maybe both).
> 
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
> 
> Which clearly doesn't understand the implications of its reports.

   The reports are most probably correct (SVACE actually complains about assigning
an *int* variable to 'size_t' field), it's my interpretation which might be
at fault here... :-)

> 	David

MBR, Sergey
