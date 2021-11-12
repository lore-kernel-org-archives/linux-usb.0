Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FDDC433EF
	for <linux-usb@archiver.kernel.org>; Fri, 12 Nov 2021 09:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F83E60F45
	for <linux-usb@archiver.kernel.org>; Fri, 12 Nov 2021 09:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbhKLJtS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Nov 2021 04:49:18 -0500
Received: from dynamic-077-001-167-197.77.1.pool.telefonica.de ([77.1.167.197]:46572
        "EHLO vacharakis.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234675AbhKLJtS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 04:49:18 -0500
X-Greylist: delayed 503 seconds by postgrey-1.27 at vger.kernel.org; Fri, 12 Nov 2021 04:49:18 EST
Received: from [192.168.1.209] (router.lan [192.168.1.1])
        by vacharakis.de (Postfix) with ESMTP id F052A3C34FC
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 10:37:59 +0100 (CET)
Message-ID: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
Date:   Fri, 12 Nov 2021 10:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To:     linux-usb@vger.kernel.org
Content-Language: de-DE
From:   DocMAX <mail@vacharakis.de>
Subject: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi there,

i would like to send a bug to you.

Issue in dmesg (lots of them):
sd 5:0:0:0: [sde] tag#4 FAILED Result: hostbyte=DID_OK 
driverbyte=DRIVER_OK cmd_age=19s
sd 5:0:0:0: [sde] tag#4 Sense Key : Illegal Request [current]
sd 5:0:0:0: [sde] tag#4 Add. Sense: Invalid command operation code
sd 5:0:0:0: [sde] tag#4 CDB: Write(16) 8a 00 00 00 00 00 85 33 72 e0 00 
00 00 20 00 00

My workaround: kernel cmdline: usb-storage.quirks=2109:0715:u

My kernel: Linux zeus 5.14.16-arch1-1 #1 SMP PREEMPT Tue, 02 Nov 2021 
22:22:59 +0000 x86_64 GNU/Linux

Would be cool if you can fix this.
Thanks,

Kr, DocMAX
