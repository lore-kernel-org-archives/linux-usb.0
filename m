Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2901C433DB
	for <linux-usb@archiver.kernel.org>; Tue,  9 Mar 2021 11:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F33D65253
	for <linux-usb@archiver.kernel.org>; Tue,  9 Mar 2021 11:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhCILFQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Mar 2021 06:05:16 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:53126 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhCILFA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 06:05:00 -0500
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 129B4r0C042703;
        Tue, 9 Mar 2021 20:04:53 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Tue, 09 Mar 2021 20:04:53 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 129B4r9G042700
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 9 Mar 2021 20:04:53 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH 4/6] usbip: fix stub_dev usbip_sockfd_store() races
 leading to gpf
To:     Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org,
        valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1615171203.git.skhan@linuxfoundation.org>
 <268a0668144d5ff36ec7d87fdfa90faf583b7ccc.1615171203.git.skhan@linuxfoundation.org>
 <05aed75a-4a81-ef59-fc4f-6007f18e7839@i-love.sakura.ne.jp>
 <5df3d221-9e78-4cbe-826b-81cbfc4d5888@i-love.sakura.ne.jp>
 <3305d1a1-12e2-087b-30f5-10f4bf8eaf83@linuxfoundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <f8f5e763-da2d-b26f-c6a5-d345bbe55448@i-love.sakura.ne.jp>
Date:   Tue, 9 Mar 2021 20:04:52 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <3305d1a1-12e2-087b-30f5-10f4bf8eaf83@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/03/09 1:27, Shuah Khan wrote:
> Yes. We might need synchronization between events, threads, and shutdown
> in usbip_host side and in connection polling and threads in vhci.
> 
> I am also looking at the shutdown sequences closely as well since the
> local state is referenced without usbip_device lock in these paths.
> 
> I am approaching these problems as peeling the onion an expression so
> we can limit the changes and take a spot fix approach. We have the
> goal to address these crashes and not introduce regressions.

I think my [PATCH v4 01/12]-[PATCH v4 06/12] simplify your further changes
without introducing regressions. While ud->lock is held when checking ud->status,
current attach/detach code is racy about read/update of ud->status . I think we
can close race in attach/detach code via a simple usbip_event_mutex serialization.

