Return-Path: <SRS0=zrGg=3G=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293EAC33CB1
	for <linux-usb@archiver.kernel.org>; Fri, 17 Jan 2020 16:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1F2A2083E
	for <linux-usb@archiver.kernel.org>; Fri, 17 Jan 2020 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579277347;
	bh=zM7Llr0Ybv2NV7XS1fzQowbRhxIU/xrvp3yvY+l6Erk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=XSQjzz/stBMjESOIPLB6pHei1qdRaMXo/u32NmXTkCU213l/JyWu+8MACMazN2/x6
	 PQDXjRpPdtDxpyyp8KjHPY6gEtYvLLLpXUAAHmHcHAByEM47xaELkpuZcbcdIoqUX4
	 tN2vyiZWhg8YqX1l5YIltwBt8JuwyWHIyRlmTuA0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgAQQJG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 17 Jan 2020 11:09:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:49882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728831AbgAQQJG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jan 2020 11:09:06 -0500
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 878592072E;
        Fri, 17 Jan 2020 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579277345;
        bh=zM7Llr0Ybv2NV7XS1fzQowbRhxIU/xrvp3yvY+l6Erk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vbuxXGLWPluk5YCVPhDkWRo5XPQLNBRVfOMIe3hSDGVuczud7I489KFUt1miYYuSZ
         hRNApBi4YonHOYBMDjYLNHvtO/fMiThlLTvuXwNpsOUowN9fRfdJ4GdZW8hQgq/UV1
         e6Yua+srqL+7SSLZ5sRXanD0jlWZ19zVeSAt7LtU=
Subject: Re: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
To:     Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
Cc:     linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>,
        shuah <shuah@kernel.org>
References: <5176009.64u6Zm7RkX@gverdu.qindel.com>
 <86e6dfbf-cf51-1467-3a78-fd72377385b7@kernel.org>
 <783453790.2802069.1579078360600.JavaMail.zimbra@qindel.com>
From:   shuah <shuah@kernel.org>
Message-ID: <32891b05-7120-81b8-9466-ac54cda39d6f@kernel.org>
Date:   Fri, 17 Jan 2020 09:09:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <783453790.2802069.1579078360600.JavaMail.zimbra@qindel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/15/20 1:52 AM, Vadim Troshchinskiy wrote:
> 
> 
> ----- Mensaje original -----
>> De: "shuah" <shuah@kernel.org>
>> Para: "Vadim Troshchinskiy" <vtroshchinskiy@qindel.com>, linux-usb@vger.kernel.org
>> CC: "Valentina Manea" <valentina.manea.m@gmail.com>, "shuah" <shuah@kernel.org>
>> Enviados: Jueves, 2 de Enero 2020 1:01:24
>> Asunto: Re: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
>>
>> Hi Vadim,
>>
> 
> 
> Hello! Sorry for the late reply, I was on vacation.
> 
> 

No worries. I fixed it with a simpler approach.

thanks,
-- Shuah


