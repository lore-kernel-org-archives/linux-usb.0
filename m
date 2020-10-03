Return-Path: <SRS0=HmPd=DK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1E9C4363D
	for <linux-usb@archiver.kernel.org>; Sat,  3 Oct 2020 17:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A0DF206C1
	for <linux-usb@archiver.kernel.org>; Sat,  3 Oct 2020 17:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgJCRyr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 3 Oct 2020 13:54:47 -0400
Received: from winds.org ([68.75.195.9]:40800 "EHLO winds.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbgJCRyr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Oct 2020 13:54:47 -0400
Received: by winds.org (Postfix, from userid 100)
        id 469B0148963F; Sat,  3 Oct 2020 13:54:46 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by winds.org (Postfix) with ESMTP id 444EF1486015;
        Sat,  3 Oct 2020 13:54:46 -0400 (EDT)
Date:   Sat, 3 Oct 2020 13:54:46 -0400 (EDT)
From:   Byron Stanoszek <gandalf@winds.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: USBIP is claiming all my USB devices - Commit 7a2f2974f265 is
 broken
In-Reply-To: <20201003172738.GA1526548@kroah.com>
Message-ID: <alpine.LNX.2.23.451.2010031353180.5043@winds.org>
References: <alpine.LNX.2.23.451.2010031259080.4257@winds.org> <20201003172738.GA1526548@kroah.com>
User-Agent: Alpine 2.23 (LNX 451 2020-06-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 3 Oct 2020, Greg Kroah-Hartman wrote:

> On Sat, Oct 03, 2020 at 01:18:36PM -0400, Byron Stanoszek wrote:
>> All,
>>
>> I was testing Linux 5.9-rc7 today when I realized that none of my USB devices
>> were responding anymore. For instance, my mouse does not respond and its usual
>> red LED is not on.
>>
>> Reverting git commit 7a2f2974f265 solved the problem for me.
>
> Can you try the patches listed here:
> 	https://lore.kernel.org/r/20201003142651.GA794077@kroah.com
>
> As this issue should be solved with them.  Hopefully :)

I confirm this also solved the problem for me.

Thanks,
  -Byron

