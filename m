Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4D0C4338F
	for <linux-usb@archiver.kernel.org>; Thu,  5 Aug 2021 20:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6020661132
	for <linux-usb@archiver.kernel.org>; Thu,  5 Aug 2021 20:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241038AbhHEUk4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 5 Aug 2021 16:40:56 -0400
Received: from perseus.uberspace.de ([95.143.172.134]:40922 "EHLO
        perseus.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbhHEUkz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Aug 2021 16:40:55 -0400
Received: (qmail 9548 invoked from network); 5 Aug 2021 20:40:39 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by perseus.uberspace.de with SMTP; 5 Aug 2021 20:40:39 -0000
Subject: Re: [PATCH] USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM
 v2
To:     Johan Hovold <johan@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20210804232522.43330-1-mail@david-bauer.net>
 <f96cd59f-f391-71d9-07a4-f5ee9d9d9afa@gmail.com>
 <YQwMERPkztnJkOS5@hovoldconsulting.com>
From:   David Bauer <mail@david-bauer.net>
Message-ID: <f4730026-604e-db14-8a33-173ebd44a8a7@david-bauer.net>
Date:   Thu, 5 Aug 2021 22:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQwMERPkztnJkOS5@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/5/21 6:04 PM, Johan Hovold wrote:
> On Thu, Aug 05, 2021 at 02:52:02PM +0300, Sergei Shtylyov wrote:
>> On 05.08.2021 2:25, David Bauer wrote:
>>
>>> The Auto-M§ OP-COM v2 is a OBD diagnostic device using a FTD232 for the
>>
>>     M3?
> 
> I assumed so too and fixed that up when applying. Thanks.

Thanks for fixing this up.

Best
David

> 
> Johan
> 
