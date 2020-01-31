Return-Path: <SRS0=NQ6k=3U=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6476DC33CB2
	for <linux-usb@archiver.kernel.org>; Fri, 31 Jan 2020 10:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39D5E20707
	for <linux-usb@archiver.kernel.org>; Fri, 31 Jan 2020 10:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="fBm/NK4x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="Xw43KvZF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgAaKaP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 31 Jan 2020 05:30:15 -0500
Received: from cable.insite.cz ([84.242.75.189]:40493 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728291AbgAaKaP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 05:30:15 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 19C50A1A40B06;
        Fri, 31 Jan 2020 11:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580466612; bh=WMM/hNyFGH0VhatdIpzlhIkjRY0jRU5k9/y3v1BLepU=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=fBm/NK4x8hgwRHhFjiSfhFyIxn48qvFF67Zsv8pgIm59sQCxu/lcD9jk77yJBiNu1
         66sidqS443JXY94vjr76YQYK/Zdv592VjrcXRRZ9KAiyo8ojVELXbq/ENJ9kFm12GQ
         SxrBSg5BipQ9QCF8vdU1yeKkqNfEPYVBRNphPGV4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id heLgFnI4yAbm; Fri, 31 Jan 2020 11:30:12 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id DD183A1A40B05;
        Fri, 31 Jan 2020 11:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1580466611; bh=WMM/hNyFGH0VhatdIpzlhIkjRY0jRU5k9/y3v1BLepU=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=Xw43KvZFrKWWmo1WGKC0iKaPEihVRL8OQEnfJRRwZ4SBHmleUyo0li5lGLla9+MTb
         Sp6y0ToJyLDbH4zqAYDqzE8d2Dlfs4E8XsUT4RAH4gRKZ55Trf6dQyrlW+jj0pUxjV
         eSxv0WusmJor2ZalzTETwfji/BMEJXJPrkDIsB0o=
Subject: Re: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
 <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
 <20200114200450.064cd521.john@metanate.com>
 <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
 <20200117104022.5bb769f2.john@metanate.com>
 <495ccd06-9059-2249-ce70-aa9647609319@ivitera.com>
 <9607a759-c08c-97bd-a0a7-f506ca64435f@ivitera.com>
Message-ID: <4588dcf7-7e2a-8bdd-48e5-e835f3503f5a@ivitera.com>
Date:   Fri, 31 Jan 2020 11:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9607a759-c08c-97bd-a0a7-f506ca64435f@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 24. 01. 20 v 13:16 Pavel Hofman napsal(a):
> 
> Dne 19. 01. 20 v 15:53 Pavel Hofman napsal(a):
>>
>> Dne 17. 01. 20 v 11:40 John Keeping napsal(a):
>>> On Thu, 16 Jan 2020 16:39:50 +0100
>>> Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>>
>>>>> I've taken a look at this and the patch below fixes it in my simple
>>>>> testing.  But note that this doesn't adjust the PCM's min_period_bytes
>>>>> which will be necessary if you want to minimize latency with an 
>>>>> adjusted
>>>>> high-speed bInterval setting.
>>>>
>>>> Please can I ask you to submit your patch? IMO your perhaps slightly
>>>> suboptimal solution is much better than the current broken version.
>>>
>>> Yes, the patch is definitely an improvement.  I thought it would be
>>> picked up from the earlier mail, but I think Patchwork requires the
>>> subject to match, so I'm including it again here.
>>>
>>> Are you able to provide a Tested-by for this change?
>>
>>
>> Testing looks OK, thanks a lot!
>>
>> Tested-by: Pavel Hofman  <pavel.hofman@ivitera.com>
>>
> 

I apologize for a basic question - please which official repository to 
check status of a gadget patch after being accepted? Thanks a lot for 
the information.

Best regards,

Pavel.
