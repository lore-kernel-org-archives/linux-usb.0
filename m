Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D32AC433ED
	for <linux-usb@archiver.kernel.org>; Tue, 20 Apr 2021 15:27:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B2DC613CA
	for <linux-usb@archiver.kernel.org>; Tue, 20 Apr 2021 15:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhDTP2Q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Apr 2021 11:28:16 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:43683 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbhDTP2P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Apr 2021 11:28:15 -0400
Received: from [192.168.1.186] (cpe-68-203-5-165.austin.res.rr.com [68.203.5.165])
        (Authenticated sender: frank@zago.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1D6C424000B;
        Tue, 20 Apr 2021 15:27:40 +0000 (UTC)
Subject: Re: [PATCH 1/2] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org
References: <20210420022520.47965-1-frank@zago.net>
 <YH6Gv9QG5VusXlgy@kroah.com>
From:   Frank Zago <frank@zago.net>
Message-ID: <0c2922e1-cc93-32a2-89c2-169ef642ef37@zago.net>
Date:   Tue, 20 Apr 2021 10:27:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YH6Gv9QG5VusXlgy@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/20/21 2:46 AM, Greg Kroah-Hartman wrote:
> On Mon, Apr 19, 2021 at 09:25:19PM -0500, Frank Zago wrote:
>> From: frank zago <frank@zago.net>
>>
>> The 0x5512 USB PID is for the I2C/GPIO/SPI interfaces. UART is still
>> present but only the TX and RX pins are available; DTS, DTR, ... are
>> used for other things. Remove the PID, and let a I2C driver bind to
>> it.
>>
>> Existing CH341 boards usually have physical jumpers to switch between
>> the 3 modes.
>>
>> This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.
>>
>> Signed-off-by: Frank Zago <frank@zago.net>
>> Signed-off-by: frank zago <frank@zago.net>
> 
> Why are you signing off twice?
> 

I did it in the patch, then git send-mail added another one. That'll be fixed in the next revision.

Regards,
Frank
