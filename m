Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20CDC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 15:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7F8420818
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 15:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfDOPP3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 11:15:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:23729 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbfDOPP3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Apr 2019 11:15:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Apr 2019 08:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,354,1549958400"; 
   d="scan'208";a="149585831"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2019 08:15:27 -0700
Subject: Re: Problem with USB2 devices connected to a hub
To:     Georg Chini <georg@chini.tk>, linux-usb@vger.kernel.org
References: <ccf69384-7aa2-883f-beb0-6bac8e9364e8@chini.tk>
 <352717b6-d467-92e6-640f-469c0682a91d@linux.intel.com>
 <9dc271d6-67c4-4e06-5bcb-d5dd3a480927@chini.tk>
 <c3e9e38f-28dd-3154-afcd-3922a23fbde0@linux.intel.com>
 <dea4e484-c4d3-a56b-6beb-1acf05c1ac8d@chini.tk>
 <dca924bf-dbb0-297c-cb39-d7cea474a144@chini.tk>
 <f413aeb9-08c5-2cff-f238-4766df35401d@chini.tk>
 <6e528087-923a-bc00-7db6-04c1c86845f2@linux.intel.com>
 <6ff355d4-5fc5-6c80-d3ee-d279c40c5ab3@chini.tk>
 <457f1aeb-aa48-b3ec-caaf-951de8744cb4@chini.tk>
 <0d3f6759-e7f8-8fd5-d164-dad4c08a49d4@linux.intel.com>
 <1f127b03-f009-f7ec-4c99-e859416565a1@linux.intel.com>
 <cbf6294c-93d5-27c1-f94e-92d04bd7d931@chini.tk>
 <3b6dad8e-2285-d98d-f703-b83c939f5848@chini.tk>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <7b7f9ef0-6276-c609-9b8b-8e96115a4772@linux.intel.com>
Date:   Mon, 15 Apr 2019 18:17:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <3b6dad8e-2285-d98d-f703-b83c939f5848@chini.tk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.4.2019 22.48, Georg Chini wrote:
> On 08.04.19 08:46, Georg Chini wrote:
>> On 02.04.19 16:52, Mathias Nyman wrote:
>>> On 28.3.2019 15.41, Mathias Nyman wrote:
>>>>
>>>>>> The issue happens when only a single hub and a single device is connected to the
>>>>>> USB subsystem. On my previous board, I had two USB dongles and two sound
>>>>>> devices connected to the same hub and it worked without issues. So I guess it
>>>>>> is not a real bandwidth limit. Somehow the hub seems to eat the bandwidth.
>>>>>
>>>>>
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git bandwidth-debug
>>>>
>>>> New traces using the bandwidth-debug testbranch could be useful, even without the "available bandwidth"
>>>> support
>>>>
> Here are the traces. In the beginning, there is no USB device connected. Then I connect a hub
> (this time a simple 4 port USB 2.0 hub). After that I connect an USB sound device to the hub.
> 
> Hope it helps.
> 

Traces show secondary bandwidth error response from xHC hardware when adding ISOC OUT endpoint 1:

321.773182: xhci_add_endpoint: State disabled mult 1 max P. Streams 0 interval 1000 us max ESIT payload 200 CErr 0 Type Isoc OUT burst 0 maxp 200 deq 00000000fffb2001 avg trb len 200
321.773198: xhci_configure_endpoint_ctrl_ctx: Add: slot 1out
321.773199: xhci_configure_endpoint: RS 00001 full-speed multi-TT Ctx Entries 7 MEL 0 us Port# 2/0 [TT Slot 7 Port# 1 TTT 0 Intr 0] Addr 0 State enabled/disabled
321.773200: xhci_queue_trb: CMD: Configure Endpoint Command: ctx 00000000fffaf000 slot 8 flags d:C
321.773380: xhci_handle_event: EVENT: TRB 00000000ffffeb60 status 'Secondary Bandwidth Error' len 0 slot 8 ep 0 type 'Command Completion Event' flags e:c

That endpoint only moves 200 bytes every 1ms (every FS frame), which is 1.6Mbit/s.
There was another periodic endpoint added before this one, but it only moves 4 bytes every 32ms, equals ~1kbit/s

which together are still far from the ~12Mbit/s supported by FS bus, even with the TT think time etc.
Traces doesn't show any incorrect values being given to xHC hw in the context either.

Only thing I can think of is that there are other parameters affecting the available bandwidth calculations,
such as the average TRB length, and Link powermanagement related exit latencies.

xhci specs say:

The xHC uses the value of the Average TRB Length field in the Endpoint Context as a metric to help
compute the system bus bandwidth requirements of an endpoint. The accuracy of this parameter is
particularly important for periodic endpoints. An xHC will use the Average TRB Length and other metrics to
allocate/distribute system bus bandwidth to endpoints. These “other” metrics are xHC implementation
specific and outside the scope of this specification.

I'm out for a week, so response will be slow.

-Mathias
