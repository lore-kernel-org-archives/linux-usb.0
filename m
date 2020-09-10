Return-Path: <SRS0=IRyt=CT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3392BC43461
	for <linux-usb@archiver.kernel.org>; Thu, 10 Sep 2020 10:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBB1C2145D
	for <linux-usb@archiver.kernel.org>; Thu, 10 Sep 2020 10:01:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgIJKBs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Sep 2020 06:01:48 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:57250 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbgIJKBr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Sep 2020 06:01:47 -0400
Received: from fsav305.sakura.ne.jp (fsav305.sakura.ne.jp [153.120.85.136])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08AA1WOa077957;
        Thu, 10 Sep 2020 19:01:32 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav305.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp);
 Thu, 10 Sep 2020 19:01:31 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08AA1VfS077951
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Thu, 10 Sep 2020 19:01:31 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC 0/5] fix races in CDC-WDM
To:     Oliver Neukum <oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
References: <20200812132034.14363-1-oneukum@suse.com>
 <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
 <1599728957.10822.9.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
Date:   Thu, 10 Sep 2020 19:01:28 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599728957.10822.9.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/10 18:09, Oliver Neukum wrote:
>> Does it make sense to wait for response of someone else's usb_submit_urb() when
>> someone is calling close(), for there is no guarantee that failure notice received
>> via wdm_flush() via some file descriptor corresponds to usb_submit_urb() request from
>> wdm_write() call from that file descriptor?
> 
> Well, user space may do multithreading. Whether it makes sense is
> another question. We just need to return results confirming to the
> standards. You noticed bugs. I think the next version will fix them.

My question is how do you handle if App1 and App2 (not multithreading but
multiprocessing) shares the "desc" ? Unless

>> In patch "[RFC 3/5] CDC-WDM: making flush() interruptible", it is legal to return -EINTR
>>  from close(). But I think that returning -EINTR from close() is not recommended because
>> it can confuse multithreaded application (retrying close() upon -EINTR is not safe).
> 
> Well, but what is the alternative? Should we ignore signals?
> 

we return the error from write() request (i.e. give up trying to report errors from
close() event), we can't pass results to the intended recipients.

