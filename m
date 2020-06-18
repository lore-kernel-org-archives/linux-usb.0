Return-Path: <SRS0=wl2X=77=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368E3C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 17:41:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BF0920706
	for <linux-usb@archiver.kernel.org>; Thu, 18 Jun 2020 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592502107;
	bh=V3/8KDcL+ix6Np43ENGawP52NUg+DxdaW3kXs1ViTT0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=HNgvmTl30D5OZfj83VAXREDS9OzZmoj8cMOX3wPb27p8RhrX0PSq1VlZk5+yZNiEH
	 wy+fPpNwCjZYC83UhharGJzjJ/X5ReZK24WO2DEbaBJpBWKfhA/WESYOYp7DgN8yIQ
	 8NGEwik97UVOv+A09RXPGgcmYl7ciXiA9H/jRj3A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731439AbgFRRlq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Jun 2020 13:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729612AbgFRRlp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 13:41:45 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8F7C06174E
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 10:41:44 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 97so5207793otg.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lj1OUnCiEL7PTb7sWZrbfYeYh4fsbN5F5NZdzahAeVM=;
        b=iS7A+R/PQVXP2W8n9q0y8fisfHp/ivhVnFUztyN4rIj6i5bAhxr1cZJ+/Tnxlsxv60
         O02SAY/YLf/uzvA20YQjycidu3BQ5drQVc0SAv2+dCZ0td/W9IGVTG1jJdLbWr3AZuQt
         o0uUHNLNnJ3sTZKmqXCuwQhzIZfvUcD3XL9gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lj1OUnCiEL7PTb7sWZrbfYeYh4fsbN5F5NZdzahAeVM=;
        b=RL9SC7Ga7qKCTGPvkdRIjkpKLxZnQlTqN1Z0wpx5/ryq15vc85lgCf+Yl3REMya3lj
         ZC0RHdg8qeLY4bHfoJblYYDE2UpLe5nrFe3fAmlmwzQKzD1Zut6y7Y+WwhJVz8a7bpbw
         BpVUTYHC9qWhhuum4rS1kcBUo3LcZw0myJPRhDYyw714ZvSK+nw5eOyMGErGPZBIcFbc
         j6f57ZNQW8hW1dMrHVzoSkDGhOchtkLArgaolnNF5KjVyq7D9SX0pmlFaXRku/EdzPap
         bD/1NSd0Fr1FeUP6hHxuLL0qp9CvQpGmdn6B0KA+70mc9y3KLzTPSRu1hPcWd4z9xVg9
         EywA==
X-Gm-Message-State: AOAM533JVJqksAum02TCDqe8gbrWO/oTVqIAxj9RS2FVkSH+JPbGHMo2
        1PIkBiml4ZRIr3guZCN98IENHk2k47A=
X-Google-Smtp-Source: ABdhPJx6zbH9zK6AjJTN6l6B0AqjYjqOqKk0tGRiB1y9/wvjnCM0jZ5TyMFv576NhAvH9MJgpjDVbQ==
X-Received: by 2002:a9d:6e03:: with SMTP id e3mr4281845otr.71.1592502103915;
        Thu, 18 Jun 2020 10:41:43 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f7sm832299otl.60.2020.06.18.10.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 10:41:43 -0700 (PDT)
Subject: Re: [PATCH] usbip: tools: fix module name in man page
To:     Antonio Borneo <borneo.antonio@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, matt mooney <mfm@muteddisk.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org
References: <20200618000818.1048203-1-borneo.antonio@gmail.com>
 <7902323e-fd72-8301-9a11-e6b912b61890@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <038c9454-9598-8b86-e63b-3b04e88a8cd5@linuxfoundation.org>
Date:   Thu, 18 Jun 2020 11:41:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7902323e-fd72-8301-9a11-e6b912b61890@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/18/20 10:56 AM, Shuah Khan wrote:
> On 6/17/20 6:08 PM, Antonio Borneo wrote:
>> Commit 64e62426f40d ("staging: usbip: edit Kconfig and rename
>> CONFIG options") renamed the module usbip as usbip-host, but the
>> example in the man page still reports the old module name.
>>
>> Fix the module name in usbipd.8
>>
>> Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
>> Fixes: 64e62426f40d ("staging: usbip: edit Kconfig and rename CONFIG 
>> options")
>> ---
>>   tools/usb/usbip/doc/usbipd.8 | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/usb/usbip/doc/usbipd.8 b/tools/usb/usbip/doc/usbipd.8
>> index ac4635db3f03..fb62a756893b 100644
>> --- a/tools/usb/usbip/doc/usbipd.8
>> +++ b/tools/usb/usbip/doc/usbipd.8
>> @@ -73,7 +73,7 @@ USB/IP client can connect and use exported devices.
>>   .SH EXAMPLES
>> -    server:# modprobe usbip
>> +    server:# modprobe usbip-host
>>       server:# usbipd -D
>>           - Start usbip daemon.
>>
>> base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
>>
> 
> Looks good. Thanks for fixing this.
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> 

+ Adding Greg

Odd. Looks like get_maintainers gave a very old address
for Greg Kroah-Hartman <gregkh@suse.de>.


thanks,
-- Shuah
