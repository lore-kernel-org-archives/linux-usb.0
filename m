Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3B8C10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 911A22083E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfDIHiF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 03:38:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33901 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfDIHiE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 03:38:04 -0400
Received: by mail-wr1-f68.google.com with SMTP id p10so19499623wrq.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2019 00:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Fj+NGjK1ktOShyw/KLHW3Klsnu/Qg6rnooIZNDIYhE=;
        b=avEjY/vyOaGIFHPIALZmg6GAN/+vNK2+wOCtm50iQBnzTWsfMzozU9Pw9cjnDkgPTf
         P+E0SWY1ffgJkkgM7ktldfc9vovF03EzzlYYp1Mk6xB8jPlRMOZOh/pdEz9CnXPoiuar
         IZLUD7BLit7YHyHs/8nwQcjf5L8wNg6cJTEKYd2PZypuzuvxoPzRos58Ew6O0LSbkCaB
         7dqbWXzTQl86OESpM1f3u1iTkWkMFucI5Kd9JjNTL6e+DEw61/E5AdCP9WemfqrV9X/u
         kgOcGGhp/o/nZCc4OKdmKMccNSivAFEUGbix1+tul8q1plNkJipGKPAWEubaNwJewpnK
         8ADw==
X-Gm-Message-State: APjAAAU204Co+gwQAL5ji8Woqs6JeA2SRaZ4wo7XlntRd00aSWjjwmuV
        iLaaEUBX3q5qA2NpW3HsUb5OCeJYwsg=
X-Google-Smtp-Source: APXvYqxgDXeMkj1QmsOpy5C1czhZIxlwH9TIVvKxwfjfjEm4HsPuV0EfIqt5P8E9ZpQaSkKoY0b2sA==
X-Received: by 2002:adf:ba81:: with SMTP id p1mr22867122wrg.192.1554795482976;
        Tue, 09 Apr 2019 00:38:02 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id j11sm42433791wrw.85.2019.04.09.00.38.01
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 00:38:02 -0700 (PDT)
Subject: Re: Question about regulators
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-usb@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@kernel.org>
References: <20190403101343.718c156d@xps13> <20190409092634.222919dd@xps13>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cc277611-6597-07ac-7ee1-d9759d9edf77@redhat.com>
Date:   Tue, 9 Apr 2019 09:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409092634.222919dd@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 09-04-19 09:26, Miquel Raynal wrote:
> Hello,
> 
> Adding Greg & Hans just in case they have an idea, or someone else to
> ping in mind.
> 
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 3 Apr 2019
> 10:13:43 +0200:
> 
>> Hello,
>>
>> I am reading the document named "xHCI interoperability testing v0.94"
>> available on usb.org. There is this paragraph:
>>
>>          Devices operating at Enhanced SuperSpeed GenX are allowed to
>>          draw a maximum configured current of 900mA and unconfigured
>>          current of 150mA. Devices operating at High-Speed or below may
>>          draw a maximum configured current of 500mA and unconfigured
>>          current of 100mA*. Devices must report their maximum configured
>>          current draw and their power configuration as self or bus
>>          powered to the host and must operate within the regions
>>          reported. Additionally any device that is in the suspended
>>          state may draw no more than 2.5 mA.
>>
>> My understanding is that the current limitation on Vbus should be tuned
>> dynamically between 100, 150, 500 and 900mA depending on the type of
>> device and if has been configured or not.
>>
>> Despite some researches in the USB core I can't find any mechanism
>> handling this in Linux implementation.
>>
>> Behind this remark, I actually have boards (Armada 7040/8040 DB) with a
>> regulator on Vbus to limit the current to either 500 or 900mA. I
>> checked the xhci-platform driver which is used with these SoCs and I
>> don't find any mean to tweak this value depending on the inserted
>> device.
>>
>> Should I actually care? Is it enough to limit to 900mA whenever the
>> xHCI driver is probed?

To be clear you are talking about a regulator producing Vbus for device
plugged into the system, right ?

In that case just configuring th current-limit at 900mA is fine, it really
is up to the device to not consume more then it may and even if it does since
the port is capable of delivering 900mA anyways that is not a problem.

There is code in various places in the kernel for Linux devices to not
consume too much energy (mostly in charger ic drivers) when the Linux
device itself is an USB device drawing power.

Regards,

Hans

