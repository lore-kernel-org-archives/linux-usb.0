Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A854C10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 14:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BBE62084B
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 14:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfDIOec (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 10:34:32 -0400
Received: from mga02.intel.com ([134.134.136.20]:20195 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbfDIOeb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Apr 2019 10:34:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2019 07:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,329,1549958400"; 
   d="scan'208";a="147780055"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2019 07:34:29 -0700
Subject: Re: Regression xhci_hcd cmd failed due to incorrect slot or ep state
To:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>,
        linux-usb@vger.kernel.org
References: <0d300c86-4aaa-28d4-cb37-5bc62fa67a9a@gmx.at>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <520462de-9a7f-d3f3-2cce-e4be045cf8b2@linux.intel.com>
Date:   Tue, 9 Apr 2019 17:36:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <0d300c86-4aaa-28d4-cb37-5bc62fa67a9a@gmx.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7.4.2019 13.32, Bernhard Gebetsberger wrote:
> When using  the kernel version 4.20 or above my usb wifi stick doesn't
> work until I reboot my system, dmesg shows this message when the issue
> occurs:
> 
> xhci_hcd 0000:15:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state
> 
> I've found that the problem is caused by this commit:
> 
> commit f8f80be501aa2f10669585c3e328fad079d8cb3a
> Author: Mathias Nyman <mathias.nyman@linux.intel.com  <mailto:mathias.nyman@linux.intel.com>>
> Date:   Thu Sep 20 19:13:37 2018 +0300
> 
>      xhci: Use soft retry to recover faster from transaction errors
> 
> It looks like it only affects wifi sticks(various models) on specific
> hardware configurations(I have this issue on my Ryzen pc, my Intel pc
> isn´t affected, but someone in the kernel bug tracker mentioned that he
> has this issue on an Intel notebook as well (only with USB 3.0 ports
> though)).

Thanks for the report.

I can see how these would be related, setting a new Transfer Ring dequeue pointer
requires the ep ring to be in Error or stopped state, otherwise you see the above message.

The soft retry patch will automatically restart a ring from stopped to running state.

But to know the details where the issue exactly is, or how we ended up there, I would need to
look at logs and traces.

Logs and traces can be taken with:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable

< trigger failure >

Send output of dmesg to me, and
copy /sys/kernel/debug/tracing/trace to me.

-Mathias

   
