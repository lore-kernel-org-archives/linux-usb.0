Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06A2C10F13
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 09:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EABA217D4
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 09:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6hSnTeu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfDKJ0e (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 05:26:34 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:41741 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfDKJ0e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 05:26:34 -0400
Received: by mail-lj1-f177.google.com with SMTP id k8so4816887lja.8
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2019 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ev/hIYLBh1Z/UaS1y+fQpPnxlflNfIjEns0511ZyLQs=;
        b=j6hSnTeu1evQxpXw2vfj507hIaUFb+ZJa0DqENX3syO5L+kPD6SeAHIBGnp6SWT3pn
         GzA5y+Vuk/Gkag1BO/MAetj0UvlwKKCHN74ZbnaLmkSrNC1/ThHtGp2vmJlQsBqFEGQF
         0o5D8Zx1RJo9qxwLIHxf/KNchIeko5e2i73hqiVRN/DcV3IWwbPFIN9t8ppafFJElYzr
         p5l8UX5YwgwLv26zTAVX/ym8EY3sr5JsPViD9heSVxscA5nySVixdugdMfyrZ2s4jE77
         s4sHPt/yKh2Tzd77nWR7pYByPprdN1Klu0UpxRdS6THCnhwVo4ehUGu7+KaASzQv9VQg
         OAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ev/hIYLBh1Z/UaS1y+fQpPnxlflNfIjEns0511ZyLQs=;
        b=mGf/pIU76hCChVxaTaxyZq648fIRCi+EWMjstZimzdkyrFquRqQQFjVVZzlA/eKVJN
         NcpcCrmtBhXTUSYBuAx8s7kQBjDJ12SnU6ncybIkDoCAxyTH8+LweNlLB+p4vAAhrlRH
         I6oCHrL4ItLIvhbWijusyQDokelo0mgO8EU23eWPwdUH055Ou37iXp+rZ+X+0abHOIpU
         b1pV/2Y56qMXwcZmrkaeu07RdYxv0QD990o0CM+AdMxygS1Kt3r/I9SQyRKWd9FmxE8y
         SIWAbNK8icqlT3t36++8seM8bTNCIYGLqe88I/VVhaRF3wXIWy8aSkHFG7HEmwVxfkO9
         uVeg==
X-Gm-Message-State: APjAAAXTrZpsNTFLhBi/w6MIZQK2QCREKjY2G59mh72U5nl9pD5pENox
        o5Yj2lm5wHeltjTmQZ8eR7qE3EpBL1s=
X-Google-Smtp-Source: APXvYqx1JN6REla81iUoJv8Uk7f83pcfs3KO9F2uHPJb7ZuwAQuO0ytPn+VUJsMrR6Kslid3ede5sw==
X-Received: by 2002:a2e:128a:: with SMTP id 10mr25384959ljs.170.1554974792130;
        Thu, 11 Apr 2019 02:26:32 -0700 (PDT)
Received: from [192.168.0.140] (rev-10.ethnet.com.pl. [87.204.29.10])
        by smtp.gmail.com with ESMTPSA id a13sm1192927lfh.27.2019.04.11.02.26.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 02:26:30 -0700 (PDT)
Subject: Re: Why there is a refcnt check when we change configfs property
To:     Peter Chen <peter.chen@nxp.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <VI1PR04MB5327CD7017881B1F0D70730A8B560@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <87tvfghh5u.fsf@linux.intel.com>
 <VI1PR04MB5327F6BA759FD5B0FDADC71C8B500@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <fd8e99d9-4ce1-0e75-dea7-1af74b15a7a3@gmail.com>
 <VI1PR04MB53274AD6124C23E44E5E55478B2C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <17c2afd6-0390-d3e7-eae1-718234aeca6f@gmail.com>
Date:   Thu, 11 Apr 2019 11:26:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB53274AD6124C23E44E5E55478B2C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

W dniu 08.04.2019 o 09:00, Peter Chen pisze:
>   
>>>
>>> Andrzej, would you tell us why you introduce refcnt for driver's
>>> configfs opts? And why it is needed to judge for "store" operation?
>>>
>>
>> The reason is that a function can be linked to more than one configuration. Imagine
>> this sequence: you create a function, set its parameters and then create a
>> configuration. Then you declare "I want this function in my configuration". You can
>> decide that you want that particular function instance because you already know
>> how it is configured and are fine with that state. Think of it as a contract between
>> the function and the configuration.
>>
>> Now, suppose some other configuration is created and in that configuration a similar
>> function is needed. The creator of that other configuration might be tempted to
>> modify the existing and already used function (linked to a configuration), thus
>> breaking the contract between the function and the first configuration.
> 
> Thanks, Andrzej.
> 
> But we designed "store" entry for function drivers, we can't use it now.
> Is it possible let the parameters per function device instead of function driver?
> Or like module parameters, let the user change one time at least.
> 

Can you please describe your use case?

Andrzej
