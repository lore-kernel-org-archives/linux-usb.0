Return-Path: <SRS0=Mi6m=3F=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0083C33CB1
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jan 2020 15:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 782312075B
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jan 2020 15:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="SksXVRr6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="Mux+SQyX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgAPPkI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 16 Jan 2020 10:40:08 -0500
Received: from cable.insite.cz ([84.242.75.189]:36358 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726688AbgAPPkH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Jan 2020 10:40:07 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8E999A1A40B0D;
        Thu, 16 Jan 2020 16:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579189204; bh=rvzyrCiMv6lgD7dPCQWlJ/o5/d+lUvxinug4OuTj45U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SksXVRr6ysRYNJKvdnXPehflE46pgOJoE3OoeQvro7zcyzut6IEqL/i/nc3vp0gVV
         VdE5rpGDwzwLMHk/4C5TZ4jgS8neFNOK26TOlLWr/Me2MMjCRl5LSeVy4G6HNnF6pB
         T2lcdf8BoCqq7ilq+XEmmd/cNC1K2JZBy4zXQLdA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0eSDeHaXCQUg; Thu, 16 Jan 2020 16:39:59 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 91663A1A40B07;
        Thu, 16 Jan 2020 16:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579189198; bh=rvzyrCiMv6lgD7dPCQWlJ/o5/d+lUvxinug4OuTj45U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Mux+SQyXQ2Esy/xgX30byh74PodivIz9/lLnmJgYDIrY08D7eiZvazQ4yzAf5R7+R
         +7Adfv64QL/Hds3hjn3phZsr36t+4aOHtvXQmlVfrt0/VrAPWdF6DLrCXI1u92+VXN
         J+yoGVv9MUkanINSI+i9FFyR5GOmpyOFXSWbj6C8=
Subject: Re: USB:UAC2: Incorrect req->length > maxpacket*mc - cause likely
 found
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
 <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
 <20200114200450.064cd521.john@metanate.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
Date:   Thu, 16 Jan 2020 16:39:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200114200450.064cd521.john@metanate.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

> I've taken a look at this and the patch below fixes it in my simple
> testing.  But note that this doesn't adjust the PCM's min_period_bytes
> which will be necessary if you want to minimize latency with an adjusted
> high-speed bInterval setting.
> 

Please can I ask you to submit your patch? IMO your perhaps slightly 
suboptimal solution is much better than the current broken version.

Thanks a lot,

Pavel.
