Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05395C001E0
	for <linux-usb@archiver.kernel.org>; Tue,  1 Aug 2023 10:40:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjHAKkk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Aug 2023 06:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbjHAKki (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 06:40:38 -0400
X-Greylist: delayed 487 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 01 Aug 2023 03:40:36 PDT
Received: from iam.tj (yes.iam.tj [109.74.197.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBB9A1
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 03:40:36 -0700 (PDT)
Received: from [IPV6:2a01:7e00:e001:ee80:145d:5eff:feb1:1df1] (unknown [IPv6:2a01:7e00:e001:ee80:145d:5eff:feb1:1df1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id 05DAE347BA
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 11:32:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=iam.tj; s=2019;
        t=1690885948; bh=L9FoNLvG9+s4JWl7AjEN3gf9R647YZ5TzCXBusV9RGo=;
        h=Date:To:From:Subject:From;
        b=FV2z+zzbjjnfHMwSuVRUJeMwg4UHLAEvSZiWXbcq10+m1jG791+6xc3NGCI1Qo8NR
         eqA8cEHmSFwvd7vUINu7Ldo04kLVDSrS3VSofClZKX9ckztHZGrJG3hlqnpyZb07sV
         PhNOqAKeWMsvsdhwBpaBxUQ83LhLFNQHZx2F9+8jaZ2HlKSc3j6XozvcmHLYeKTuTf
         B55wM/qoAUGU6ONfi72R4fpkdBcdDhtaluD0U/Zu+Xq45nzIsgdpO+z9rn/KK2T7dw
         LLJFQkXGQ4FwxbkjEK107RCBumdNXmoT8vdzeLDPsh/NEHuvW0lcPx0zusUuQzrRZW
         tNT/SJvNEz9+Q==
Message-ID: <61dd0e13-3483-8b16-7f8c-0b419b9e1812@iam.tj>
Date:   Tue, 1 Aug 2023 11:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To:     linux-usb@vger.kernel.org
From:   Tj <linux@iam.tj>
Subject: Resume: "usb usb2-port3: Cannot enable. Maybe the USB cable is bad?"
 Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

See https://bugzilla.kernel.org/show_bug.cgi?id=217744 for kernel log etc.

On resume from suspend, since at least v6.1 and including v6.5-rc4 - an 
external USB Ethernet device fails to resume due to:

usb usb2-port3: Cannot enable. Maybe the USB cable is bad?

Linux version 6.5.0-rc4+debian+tj (root@linux-builder) (gcc (Debian 
12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #67 SMP 
PREEMPT_DYNAMIC Mon Jul 31 22:25:03 BST 2023

DMI: LENOVO 20W6001WUS/20W6001WUS, BIOS N34ET53W (1.53 ) 08/31/2022

The affected owner (nickname 'Chosen_') and myself worked in Matrix 
Linux room to narrow down the cause by building and testing v6.5-rc4 
when the Debian distro v6.1 showed the problem. There is no difference 
in the symptoms or the kernel messages between the versions.

Owner is prepared to work with developers to investigate and resolve this.
