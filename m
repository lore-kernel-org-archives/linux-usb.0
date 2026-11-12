Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495338;
	b=UDdUDjvtMW4VpA568cyax5PxxVfTvV5dI+cndhUCVZ/Fa/2c1rHmpKx33qACR4WWrH4h
	 UHoaMGwOf6Yp7ABbhXbMPbc+g1q2h91/fwyhx/+7nzjQYOpL1rG0qlKxctDFSv/vJ02Rv
	 QDba9NBdk1MNUD8dU0TpgsyzyJCfe3XAGNGCcMU8yZdkDN4xgdrisZxmwOe4LJVAGtKc5
	 5EH+Hw7yO2VPeLzJ6SLQsw9hohZ4WReopd7oBiSE+6GXF8pZCDdRii7stMo/21CvgVYFf
	 jQNZmyK+MrAf7NygLrbR5mJM8duICH6t9hshUgSIyxz8TXOMfQk5prhHl2lhSW4tazQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495338;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aCHR6+LSQo4MRsIR0tvUi2uTPOXcMDshWrdcjlpeFJ8=;
	b=0E7viXriukzem3jvUWL7alJFiuuWaIS0HPO7bpZtRZtoBh34L/+pXQU/Jp2v5MIf5Roz
	 uwxZeraE93E+q38HbqOlO/GLS75ZuQAPPUFfuAbaqN2aYcVGgyrsaa5YmvQu4O+CwkxCG
	 Jw7F6CSduvQA1KFSIp47A+vwYZvgL92Jb7l0Cz04QUYXBapgLzhNtTFumjwvSXxwi3uVu
	 eIc0cicPfOlypcXoGBSVQNdVz1GMt0ShH9Kh8LWyKF/k09rASOj2bC9+vtNQdOWJnBZm1
	 8ZatCruL5cwy8mbD0Avu3nDXuMnfWfVj73VTKoWtQzBq9DympJyz4CuwnqrW8EFV76w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQUqJkPJ;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817A606A327
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2817A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQUqJkPJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794495337; x=1826031337;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xLgPXn4Q1ugxdRwiFRNaBteV1B9BAFlrh9Y68fEJOWQ=;
  b=cQUqJkPJugObohFVVKFFKt+A0uVSCUpJXdKa6f2IQhYJS9KfROwk87c3
   pOTgmrhWUZlzxUmFPofAnY5aEx+ozpj6cxhwjduy2JvHrjPp4ORebHxQX
   qeVlNJECwaUiZyCyrDDKR5sbu2eRU5mg0nolvdj0FEnRMiUwvydtTtU/+
   OLdcDW/NbHWs5uNoS1nNXAl0VBbOk5u8xVDcv5vKgWnGaA6SQL89uZz8G
   doGv7M0z+CClXWn9WeRKPx0OHn3o5Vp39KLBfelKLg952JP6twlPAfDvm
   Nr+JZnkul1gmXyrVDW8541USfykIUbAvtqPQm4fVRMrNlz3LMSCxhxT4a
   Q==;
X-CSE-ConnectionGUID: YNGRMDjxQ56RnkRixDdOIA==
X-CSE-MsgGUID: 2f7kV0Z6TzSBe5YRfyoy9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3162421"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3162421"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:55:37 -0800
X-CSE-ConnectionGUID: iV5G+E0XTWKvpabSFIhcgQ==
X-CSE-MsgGUID: 5AqsQOchT/GR5xnWPO9PwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8854006"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.49]) ([10.245.244.49])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:55:36 -0800
Message-ID: <78b30387-f71d-4e6d-b49c-aea1f8fbc98b@linux.intel.com>
Date: Thu, 12 Nov 2026 16:55:25 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_xhci=5Fhcd_0000=3A00=3A0d=2E0_=28Panther_Lake=2C_80?=
 =?UTF-8?B?ODY6ZTQzMSk6IOKAnFVua25vd24gZXZlbnQgY29uZGl0aW9uIDE5OeKAnSwgdGhl?=
 =?UTF-8?Q?n_HC_died=2C_with_a_TB4_dock_and_two_displays?=
To: Phani Kumar <phanigudipally@gmail.com>
Cc: linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com
References: <CAMcR36+hWzhS_Pytej3uoDvOU6160v5vtuWXSnyFb=zEoRFQJQ@mail.gmail.com>
 <d15451e1-b89f-4db3-95a8-21b188cd0030@linux.intel.com>
 <CAMcR36LCr0RFrHsLFPaPziPS=1CMbEnO3GcDk=3Oe33S8uZFpw@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAMcR36LCr0RFrHsLFPaPziPS=1CMbEnO3GcDk=3Oe33S8uZFpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 01:58, Phani Kumar wrote:
> Hi Mathias, Mika,
> 
> Thanks both. Here are the captures you asked for. All runs are on
> kernel 7.3.3 with Secure Boot (lockdown) disabled.
> 
> == xHCI traces and dynamic debug (Mathias) ==
> 
> xhci_hcd and usbcore dyndbg and the xhci-hcd trace were enabled from
> boot (xhci_hcd.dyndbg=+p usbcore.dyndbg=+p trace_event=xhci-hcd:*
> trace_buf_size=80M log_buf_len=16M). Nothing overflowed. Files: Attached.
> 
> 1) xhci-debug-20261110-capture3-event199.tar.xz: the event 199 case.
>     - 52.10 s: "Unknown event condition 199 for slot 5 ep 3"
>       (slot 5 is the RTL8153 in the dock, 2-3.4.5)
>     - 52.28 s: "Unknown event condition 199 for slot 2 ep 0"
>     - 67.94 s: "xHCI host not responding to stop endpoint command",
>       "HC died; cleaning up"
>     - The trace covers 34.5 s to 73.5 s.
> 
> 2) xhci-debug-20261110-capture2.tar.xz: a run without event 199 or
>     HC died.
>     - 114.4 s: "usb 2-3-port2: link state change", "do warm reset,
>       port only", and the warm reset does not complete
>     - 115.2 s: repeated "Transfer error for slot 5 ep 3" and "ep 2",
>       with soft and hard endpoint resets
>     - later, usb2-port3 stays stuck in warm reset (portsc 0x2f4)
> 
> port_bandwidth: the same before network traffic, during traffic, and
> after the failure in run 2. After the event 199 failure it can't be
> read ("Cannot send after transport endpoint shutdown").
>    FS_BW: port[1] 90%, port[2-5] 0%
>    HS_BW: port[1] 80%, port[2-5] 0%
>    SS_BW: port[1] 0%, port[2] 90%, port[3] 90%, port[4] 89%, port[5] 90%
> 

Thanks

case 1

Tunneled USB3 link goes bad somewhere between the hub 2-3 and RTL8153
2-3.4.5 at 52.09.
All URBs behind 2-3 hub fail with transaction errors after this.
r8153 driver immediately re-queues URBs, even the ones returned with -PROTO,
so we end up in a massive endpoint reset and restart churn with
225 endpoint resets, Setting deq, and restart during  1.6 seconds.
xHC then just stops submitting any events.

case 2

In this case the link between xHC and Hub 2-3 goes bad. xhci detects
the bad link early and prevents URBs from being queueud.
Only 28 transfer errors in 100ms, xHC seems to handles this.

Several unsuccessful attempts to recover the link to 2-3 hub are done.
xHC stays functional.

I don't know why the links suddenly fails.

hub 2-3 port2 is unsuccessfully being reset all the time in both cases.

Any Idea what's connected to hub 2-3 port2? can it be unplugged? (if yes, does it help?)

Thanks
Mathias

