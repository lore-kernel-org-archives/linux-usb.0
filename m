Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBCDC6379F
	for <linux-usb@archiver.kernel.org>; Mon, 20 Feb 2023 01:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjBTBhi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 19 Feb 2023 20:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjBTBhh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Feb 2023 20:37:37 -0500
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859C3CDF0
        for <linux-usb@vger.kernel.org>; Sun, 19 Feb 2023 17:37:36 -0800 (PST)
Received: from [172.31.17.196] (vpn1.lineo.co.jp [203.141.200.204])
        by mail.lineo.co.jp (Postfix) with ESMTPSA id C4B3680225692;
        Mon, 20 Feb 2023 10:37:33 +0900 (JST)
Message-ID: <72eb1e14-5778-a787-3f2f-4a4057cd265f@lineo.co.jp>
Date:   Mon, 20 Feb 2023 10:37:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH] usb: gadget: f_fs: Fix incorrect version checking of
 OS descs
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-usb@vger.kernel.org, Yuta Hayama <hayama@lineo.co.jp>
References: <1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6@lineo.co.jp>
 <Y+4VC+8ezcRlguI4@kroah.com>
From:   Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <Y+4VC+8ezcRlguI4@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 2023/02/16 20:35, Greg Kroah-Hartman wrote:
>> +	if (bcd_version == 0x1) {
>> +		pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
>> +			  "Pass for compatibility, but fix your user space driver.\n",
>> +			  bcd_version);
> 
> No one will see a debug message :(
> 
> Make this a much louder warning please.

Okay, I will change it to pr_warn().

>> +		pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",

And, the comma at the end of this is my mistake. I intended it to be just a
concatenation of strings. I will fix these in v2.

By the way, is there a problem with the "notify because the value 0x1 is wrong"
approach itself?


Thank you,

Yuta Hayama

