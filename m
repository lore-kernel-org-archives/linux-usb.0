Return-Path: <SRS0=OAmk=TX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C5CC282DD
	for <linux-usb@archiver.kernel.org>; Thu, 23 May 2019 15:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 746AB206BA
	for <linux-usb@archiver.kernel.org>; Thu, 23 May 2019 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558625207;
	bh=wbuG5hMULTWGrwz1NyKGulpNuSAvCh5J6iYybJjNgDM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=PLeuMLhZgU4PazBuwG0RbQLl2PILtxCqqBjLqocfvAI/3T9Wk/zc/O8zWTQ0cmxWM
	 aOs5kKzECbw9oh11OvqJWc16GVdMo22x9byheQsiQx4pVICEhHvoATu2Q0x+jt2GlC
	 INrjHUHxzirYGuNritSbI6IhIdbd956guZPniGg8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730867AbfEWP0q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 23 May 2019 11:26:46 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:37807 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730804AbfEWP0q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 11:26:46 -0400
Received: by mail-it1-f194.google.com with SMTP id m140so9130911itg.2
        for <linux-usb@vger.kernel.org>; Thu, 23 May 2019 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uFg0UTRdakpnwdWnNL4OUoN9u3XbAEwElp9Hoskpuy8=;
        b=iWKAiRmGRAD2AHVijZQwxOrGkQyu4poB02LaySvLKT3snEJ4Qz6SXLfnZYOpsumCpE
         QoU8rYY50CupRiDkvWniRcIFdLdTMrJDCI64WOJy4nCWZf+YHa2M9OSyaLfpsZOC8Bsi
         5JRqlcryaBCnbD6gi3xV7jnWodbitSJhj2nA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uFg0UTRdakpnwdWnNL4OUoN9u3XbAEwElp9Hoskpuy8=;
        b=cZ5l+zZtRFl0fBI60tozrCwEJut+Nv6ZDxGiGiKflxNmlmAarQ8zl/XmjDo3I8SPqk
         bCueJb8XVuWjDd4qqyM7jerRXLtkzGnbQMKtNMUgltO5axJzDPyTPQqjyjaLFoPQXO0s
         sQYq/OCj2fVsypfGk047HXwj78+aGh4TAURHGWvAXxvKyqc/RZNzEm+JVld9l/EB0wHr
         4Yt6x7vFQFvXcQdUXC1o+A4Rv+sCJlf1mHxH66k6XwDqjjpTzK/iaUtYbOxSKZagLnDb
         fh/IG5N//3LgGP057yre1SqkCaDFS7kh66CSdg9zahqwW9MDP3eBSKbumUVob+qXDBgK
         /oXA==
X-Gm-Message-State: APjAAAVGUsHZPtyBGRb5w62sNvWtCUrbb2OpgxKwRq9iDnjIoH4bqLtY
        gPmfU9DJHW0LWLhC7NrT6RhEGg==
X-Google-Smtp-Source: APXvYqyBKIoZ2SVTkePdplyUiBMQhMeFxlQEf3W43tC2JRuz7xh1qAfOhGHZiyKGb+k5jOT1trnAdw==
X-Received: by 2002:a24:ac58:: with SMTP id m24mr14973546iti.65.1558625205824;
        Thu, 23 May 2019 08:26:45 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f23sm6042344ioc.39.2019.05.23.08.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:26:45 -0700 (PDT)
Subject: Re: [usb:usb-linus] BUILD REGRESSION
 c1a145a3ed9a40f3b6145feb97789e8eb49c5566
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kbuild test robot <lkp@intel.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <5ce58da9.6t2VRua3tVrRG+g+%lkp@intel.com>
 <20190523071339.GE24064@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f79aa2c6-aabf-694f-3005-f8349690151e@linuxfoundation.org>
Date:   Thu, 23 May 2019 09:26:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523071339.GE24064@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/23/19 1:13 AM, Greg Kroah-Hartman wrote:
> On Thu, May 23, 2019 at 01:58:01AM +0800, kbuild test robot wrote:
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
>> branch HEAD: c1a145a3ed9a40f3b6145feb97789e8eb49c5566  xhci: Use %zu for printing size_t type
>>
>> Regressions in current branch:
>>
>> drivers/usb/usbip/stub_dev.c:399:9: sparse: sparse: context imbalance in 'stub_probe' - different lock contexts for basic block
>> drivers/usb/usbip/stub_dev.c:418:13: sparse: sparse: context imbalance in 'stub_disconnect' - different lock contexts for basic block
>> drivers/usb/usbip/stub_dev.c:464:1-10: second lock on line 476
>>
>> Error ids grouped by kconfigs:
>>
>> recent_errors
>> ├── i386-allmodconfig
>> │   └── drivers-usb-usbip-stub_dev.c:second-lock-on-line
>> ├── x86_64-allmodconfig
>> │   ├── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_disconnect-different-lock-contexts-for-basic-block
>> │   └── drivers-usb-usbip-stub_dev.c:sparse:sparse:context-imbalance-in-stub_probe-different-lock-contexts-for-basic-block
>> └── x86_64-allyesconfig
>>      └── drivers-usb-usbip-stub_dev.c:second-lock-on-line
> 
> 
> Shuah, I just got this new report from 0-day about your commit
> 0c9e8b3cad65 ("usbip: usbip_host: fix BUG: sleeping function called from
> invalid context") that got added to my tree recently.  Can you look into
> this to see if it is a real error caused by this commit, or just
> something that has always been there?
> 

Thanks Greg. I think this is a new problem introduced in my patch. I 
will send the fix.

thanks,
-- Shuah
