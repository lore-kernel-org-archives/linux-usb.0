Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2239CC10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5E9F20833
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfDIHSV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 03:18:21 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46637 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfDIHSV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 03:18:21 -0400
Received: from [192.168.178.52] ([109.104.45.158]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N17l4-1glorX0WxW-012VdQ; Tue, 09 Apr 2019 09:18:05 +0200
Subject: lan78xx: About 8000 usb interrupts per second when idle
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Minas Harutyunyan <hminas@synopsys.com>
Cc:     "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Woojung Huh <woojung.huh@microchip.com>
References: <20190408143443.335f7e93@xhacker.debian>
 <002929b7-9a0d-6d92-4e03-18a6748c6708@i2se.com>
 <20190408160551.03911b27@xhacker.debian>
 <20190409144655.753d3bd9@xhacker.debian>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <3cda1098-e0ad-42ac-af96-c85eba480556@i2se.com>
Date:   Tue, 9 Apr 2019 09:18:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409144655.753d3bd9@xhacker.debian>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:PfcJPCrYVLcjm9gJsmtXIxXskzLVuLPS0gcbHYat3t/1cJeukHR
 2rycSP3HwB9/GGMbisCuoqLIsQcvzYKlVQHWhdbB54QHfT877QXViF2zoKbdu+YzTiwFDpA
 +vXVPNOCz2X8Ugi3SeX1eiKpuYgKtBBJgjWFCTc06BYbR2JQ6xCSCxuf5mlmqRbTfG2+r4p
 2uL13tNoW7GOQMrc0UJBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OiZzqBtHulk=:m+G/mvnOhjsxMQvHEg0ued
 ho8AWe8jP/EfV4AAzDPl5dULpSDkRuBsEs1SNkbAN2LxB/JnUiC3gNZRpQIUEdgIMUR4ysxVE
 8OjPSZJtNWidK1G0R8ZkUUxVx2dGnZwHzH8Wi0hUHHXFd5c5dVFP4bZ7N44/EnDcJlBc13Azh
 esHWWLcEzm4/LmGIeO8MDhVHQ8hb/jk2x3Jp1ZzmEoFaBYPknUYQImfVQJHxgA/3D99kkyaL/
 rTehm/EQTJ0CYbk8FmrZ+2J1LBJGXTlh2RP5xqT80sMROOfN2WzvJBtEhKsqHTd8E9a/CNNjh
 XtQ2wCkPuehgBUw4tsChfkGbWvkUbo9FUkOgU+A414zyUKOzTiQS2voW3kOqJj1Np/IBt9sK+
 EALcbejAZxNWgnDVV58c5F/RLRbA8WobDK2nfT1WYCrXdxpKz8D6xmRkZ0wkaUVH8B9bNi0WJ
 6dhaZNTlFlxzMX8rg+HoppOGgR7+E/UvEY0glgS4IFD/zoo6WDfwy9LS35DbKLneRwJykWacl
 v4FQNDYaU6Hhi4qKzU7q2XgH3zbJD8CPW3o/FKVq9BGn62j50SabjDKI8ci4ujAJyBTJOTSd3
 n+vOOb8PK2SWut4Be1U599bpXAKpu56AW10moX819bPyf4SFQrPHNyUpY19uh8i4KGlVIEOHx
 fdnfl7UGVKcfA4kxvBFKwPgj6OCHZAYcOwFg39XJXO6MO50whc/tUOEvqT+PewR9cgyl3QAlF
 cN21L9h9j6kdCNbZtUpTcZ2tOR1m9NMHqLF14p9CXpNFjjtNJOE/Sj89TVU=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

Am 09.04.19 um 08:54 schrieb Jisheng Zhang:
> On Mon, 8 Apr 2019 16:05:51 +0800 Jisheng Zhang wrote:
>
>> Hi Stefan,
>>
>> On Mon, 8 Apr 2019 09:57:14 +0200 Stefan Wahren wrote:
>>
>>>
>>> Hi Jisheng,
>>>
>>>
>>> thanks for sending this patch.  I already reported this issue last year
>>> [1], but Microchip wasn't able to provide a fix.
>>>
>>> I will give it a try.
>>>   
>>>> The second one: 8000 usb interrupts per second when idle. This is abnormal.
>>>> any idea? Is it due to the lan78xx?    
>>> Does this downstream patch [2] improve your situation?  
>> Thanks a lot. Will try the patch tonight.
> I tried this patch, it doesn't help. One more observation: if I
> ifconfig eth0 down, I can still get 8000 usb interrupts per second. Not sure
> whether this is usb issue or not.

Jisheng reports a lot of USB interrupts while the lan78xx driver on
Raspberry Pi 3B+ is in idle.

Any suggestions to narrow this down?

Stefan

>
> Thanks
>
