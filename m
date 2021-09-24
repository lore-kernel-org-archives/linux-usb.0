Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0A7C433EF
	for <linux-usb@archiver.kernel.org>; Fri, 24 Sep 2021 10:24:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE49961164
	for <linux-usb@archiver.kernel.org>; Fri, 24 Sep 2021 10:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240521AbhIXK0B (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Sep 2021 06:26:01 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:51712 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240310AbhIXKZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Sep 2021 06:25:58 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 351B020E9251
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mlJlOiBbUEFUQ0hdIFVTQjogcGh5OiB0YWh2bzpy?=
 =?UTF-8?Q?emove_unnecessary_debug_log?=
To:     <yangzhiwei@uniontech.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <20210924182215.53718a246a8bc81e6c01c082@uniontech.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <2f06b8e5-406a-2dd6-0ab6-68937fd0b42f@omp.ru>
Date:   Fri, 24 Sep 2021 13:24:06 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210924182215.53718a246a8bc81e6c01c082@uniontech.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.09.2021 13:22, yangzhiwei@uniontech.com wrote:

> oh ,thanks for your reply.
> I was worked on 4.10 kernel the last two years, and I am sorry about my 
> carelessness on features of new versions.
> 
> Now, should we remove the two dbg lines?

    Definitely!

[...]

MBR, Sergey
