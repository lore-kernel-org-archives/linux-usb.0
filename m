Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5A5C4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 15:09:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95F40217D4
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 15:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuTtE4P4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfDEPJU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 11:09:20 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:52997 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfDEPJU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 11:09:20 -0400
Received: by mail-wm1-f50.google.com with SMTP id a184so7062276wma.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Apr 2019 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=Y+R21v24VrGZ9Ioflyb+SU0Pm3gSGmG5YW3GEXKImvk=;
        b=fuTtE4P4S91vkAafrEguhCEpvzF2Zpitc6aI0jcMIdO8e2PfVxRtQRBKh5eKyvuWaZ
         ZJM05IzF7u0ALEgjnnpw3na8haKinS+HyMg9noo73p1pueGC0YHfyXtJOPkuHcaOca0s
         5P73gHPonQnO8BUjNMqwYtbPUXxzMeQGI2IM6GAuDJ6itHQ6n9Te8MCq4d1QrBo3Vtdw
         GL1hibC0FogGN2BBand70/ozchoV5RGOk9hdvYMGoEaDorr8Q4v8AcZ4/m0pK0N6nFXK
         TN9ynxkSKkEDKHV2HokdwuN6oIPjckK+Spw74TcXOgQXqzH87HT8LNi6WustMJ4/zdKB
         lbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:from:subject:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=Y+R21v24VrGZ9Ioflyb+SU0Pm3gSGmG5YW3GEXKImvk=;
        b=O8XZ1MPfPGhOZi1/3+ZNIT0WLtWKu1olkg78vl2hoaAEkY6UEIHHsRl7n9FSEzWgE+
         2zXz6i5cQr4NAVAbBjSF6Z1zLn3fcSG/ZV6GyiA8vUAjYvtHQk8n/aATTsLFeSOs80Qk
         Xu5YiK0XMc/dC1JvMefcVrsUA7+TO5Vx69UEqEWGiphdUAOCg3BrgxUvDfdrFLQ9KeI4
         gfVhqKR8c627gjYLZXO1bjB3u4JFhV1mPs/VlKhDFQ/N0juxg5yxSmd+b/w9Heg7/CcM
         WRdMB3yVRrI5W33bK/T7zM39moFtzjih8xh13N2Pn1ILK7K5w84vokLHk7ku/u8xqa17
         yddA==
X-Gm-Message-State: APjAAAVkouOKeI3nQlcjnHB0v+71Mz7Q0KE85BSdCu4GqGzV0FOQ5u4v
        WN8hbSaQ/jW91rNyJoH6nfBtG0OJ
X-Google-Smtp-Source: APXvYqwdM+/1ZeM+MJVYkJpw/DmHvKbQ5aP31a5lhtQZbZh2snF1wZ5/gVhfMBLLXm2P0srXpNnmug==
X-Received: by 2002:a1c:6587:: with SMTP id z129mr8502519wmb.84.1554476957606;
        Fri, 05 Apr 2019 08:09:17 -0700 (PDT)
Received: from ?IPv6:2003:da:df28:a100:3615:f02e:4511:2c54? (p200300DADF28A1003615F02E45112C54.dip0.t-ipconnect.de. [2003:da:df28:a100:3615:f02e:4511:2c54])
        by smtp.gmail.com with ESMTPSA id 192sm5152201wme.13.2019.04.05.08.09.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 08:09:16 -0700 (PDT)
To:     linux-usb@vger.kernel.org
From:   "Linus K." <linus.kaschulla@gmail.com>
Subject: Bug: cdc_acm blocking write after many small writes
Message-ID: <10cfe58c-2d91-30d3-8672-ebe261363bf1@gmail.com>
Date:   Fri, 5 Apr 2019 17:09:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
I recently submitted this bug to https://bugzilla.kernel.org/ and was 
redirected here.

Using a Atmel Evo Kit (which is recognized as /dev/ttyACM0).

When writing many small chunks of data to it, it'll block write forever 
(at least many minutes using select call).
Writing anyway causes errno 11: Resource temporarily not available.

This seems to be a race condition or buffer overflow since adding a 
small sleep of 1ms between writes (of 1 byte or similar small) defers 
the point of getting stuck.
Without sleep I can push about 240 bytes and with 1ms sleep I get a lot 
more (e.g. about 105680).

Also writing bigger chunks doesn't seem to produce the problem.
I can't use that as a solution hover since I need to keep the delay as 
small as possible.
Meaning small packets (often 1 to 3 bytes) and no caching.

The used serial devices has a set baud of 115200 symbols/sec (no parity, 
8 bytes, 1 stopbit).

I should also not that I didn't run into the bug writing as much data as 
possible.
I ran 2 writes of 1 byte every 16.667ms (60 Hz) which caused the program 
to get stuck after about 5-20 seconds.
The program is implemented using python, has 2 extra threads but only 
uses the serial connection (reading and writing) in the main thread.

I also tried different usb ports (separate root hubs).

This bug doesn't exists on my RaspberryPi this bug didn't exist on 
kernel 4.14.98-v7+ and probably before.
The raspberrypi only had the occasional pause when exceeding writing 
more than the device could handle and resumes asap (as expected).

The same problem also doesn't exists when using a FTDI as well as a 
CP2102 on my PC.

(I also disabled the ModemManager service which tried to communicate 
with the device using Hayes (AT) commands.)

There is no kernel log regarding the bug. Tested using USB 2 as as well 
as USB 3.
Kernel log when plugging in affected device:
[ 6184.123072] usb 2-10.2: New USB device found, idVendor=03eb, 
idProduct=2404, bcdDevice= 1.00
[ 6184.123076] usb 2-10.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[ 6184.123078] usb 2-10.2: Product: CDC
[ 6184.123080] usb 2-10.2: Manufacturer: ATMEL ASF
[ 6184.131485] cdc_acm 2-10.2:1.0: ttyACM0: USB ACM device
---


Greetings,
Linus Kaschulla (currently studing, using linux for many years and 
getting my feed wet with c programming with linux)

