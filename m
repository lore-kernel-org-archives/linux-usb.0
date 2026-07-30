Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6972A3F12CA
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402429; cv=none; b=XfZBDkmLRm8ElLQzPOuPMFY5R3uyibBvePVPHVB4AD/HGxV2KVoTOxcrgBjdNSXEUfEAlAbU3X7UnDg/p9oP4+oHcM0zFBvvrjSsWlKcJ+1+Vk90tyj/YCxyeH7ZcVUhyoeH7o3oxh1vI7Kc6iI3VZiWIyTrT0xtYfPpib2xgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402429; c=relaxed/simple;
	bh=Ha2LWLlshEqkIfK1YUhBDbpfGIZzS/OrsIFlbK0bOkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYRgB3QkFdGKsOyyp3/zH3j2err5r9PaP5LlzhHmwnK4iJCW2OM9rm8/pbUY7CApCjOgF6UX5klk4fpKe+iozmRJfh02pekQRq+VgHbiYabwBhBCb65jBUaOXO/+VrJsfvdbGSZxJK0R8+Ln8BXD8r/MQy+KCiLW9XdRSwZgFgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5pLl8mO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5pLl8mO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785402429; x=1816938429;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ha2LWLlshEqkIfK1YUhBDbpfGIZzS/OrsIFlbK0bOkk=;
  b=E5pLl8mOipWs8OxChnRcLpIfoX2/ai+5FJ4n2I90MolWI7yNiVxRG9+J
   jAdvOCVG4ebW57xQcT+LR30pfQZkZQITFQXHJCIwIcK+WCqpUXWaOv5Hm
   +ENFa925sUg5tQ+8wMiIEEmgubqJNWk/CARa2t/hNIw0tedw1ZWr9mHXf
   lJGkEoeVyhCyNbWlkW5BpW9+rgGFLSy10UAbhOENEKBVG1Ys90BGwoZch
   BexC5Eo4H1eQaobz16mrN7DLY1eX+Kg1Tm9IQu95l3mSJvnK/u/KKUxZD
   zF0o+saSpVmqryJZEvPna5S2GvezWKSvSmLCJ4y7++NytK2HCjYF174sf
   w==;
X-CSE-ConnectionGUID: GSAcf/2ET0qW8eMxx1hy5A==
X-CSE-MsgGUID: +ZlsxmvpSSm9EGIf6IcmyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86135236"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86135236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 02:07:08 -0700
X-CSE-ConnectionGUID: 3Kywk2VgTj6Eg2yw3cvCTQ==
X-CSE-MsgGUID: 2ydSqsMrTpq1F9Yep6kX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="253916010"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.174]) ([10.245.245.174])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 02:07:05 -0700
Message-ID: <a47f7c2d-d122-4cb3-bc03-1165b3578e6d@linux.intel.com>
Date: Thu, 30 Jul 2026 12:07:03 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: xhci: use BIT_ULL for CRCR bits
To: Michal Pecio <michal.pecio@gmail.com>,
 Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
 linux-usb@vger.kernel.org, arien.judge@morsemicro.com
References: <20260730054521.296139-1-lachlan.hodges@morsemicro.com>
 <20260730100434.3354b600.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260730100434.3354b600.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 11:04, Michal Pecio wrote:
> On Thu, 30 Jul 2026 15:45:21 +1000, Lachlan Hodges wrote:
>> The CRCR register is 64 bits wide - commit abe93f27cdd7
>> ("xhci: use BIT macro") changed the flag definitions from (1 << n),
>> a signed int, to BIT(n), an unsigned long. Within
>> xhci_set_cmd_ring_deq(), the following operation is performed on the
>> CRCR register:
>>
>> ...
>> 	crcr &= ~CMD_RING_PTR_MASK;
>> 	crcr |= deq_dma;
>> 	crcr &= ~CMD_RING_CYCLE;
>> 	crcr |= xhci->cmd_ring->cycle_state;
>> ...
>>
>> Previously, ~CMD_RING_CYCLE was ~(int)1, a negative signed value
>> (0xFFFFFFFE with the sign bit set). Widening a negative signed int to
>> u64 sign-extends it to 0xFFFFFFFFFFFFFFFE, correctly clearing only bit
>> 0 and preserving the 64-bit pointer written two lines above.
>>
>> After the change when running on 32 bit kernels, ~CMD_RING_CYCLE is
>> ~(unsigned long)1UL. On a 32-bit host this is an unsigned 32-bit
>> value (0xFFFFFFFE, no sign bit). Widening an unsigned value to u64
>> zero-extends it instead (0x00000000FFFFFFFE), so the subsequent AND
>> silently clears bits 63:32 of crcr, truncating the command ring
>> pointer that was just written before the value reaches hardware.
>>
>> To fix, similar to how CMD_RING_PTR_MASK is defined, make sure we
>> use the BIT_ULL variant when defining the CRCR bits.
>>
>> Fixes: abe93f27cdd7 ("xhci: use BIT macro")
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
>> ---
>>
>> Hi, I experienced this when running the tip of wireless-next on
>> a raspberry pi 4B compiled for arm32. The main symptoms were the
>> following log message:
>>
>> [    0.549897] raspberrypi-firmware soc:firmware: Attached to firmware from 2021-02-25T12:11:39
>> [    0.626859] xhci_hcd 0000:01:00.0: xHCI Host Controller
>> [    0.626889] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
>> [    0.812619] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x100 quirks 0x0000200000000890
>> [    0.813188] xhci_hcd 0000:01:00.0: xHCI Host Controller
>> [    0.813203] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
>> [    0.813219] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
>> [    0.813602] hub 1-0:1.0: USB hub found
>> [    0.814052] hub 2-0:1.0: USB hub found
>> [    0.952714] xhci_hcd 0000:01:00.0: ERROR mismatched command completion event
>>
>> Additionally running lsusb just hangs. Running the same kernel compiled
>> for aarch64 worked fine. Bisected to the commit in the Fixes line
>> above. Additionally a USB device plugged in to the USB3.0 (or 2.0)
>> did not enumerate. Once this patch is applied the USB device
>> enumerates properly on the tip of wireless-next 4a0bd262df75 ("wifi:
>> mac80211: fix per-STA profile length in cross-link CSA parsing").
> 
> Makes sense, including observed symptoms.
> 
> A system with IOMMU would fault on top of that, but the accesses
> are reads, so hopefully no corruption in absence of IOMMU.
> 
>> Happy to test alternate fix proposals! Thanks.
> 
> I think the sort of code you quoted should work without surprises,
> so widening these macros to ULL is right.
> 
> And there is a few more. They currently don't break anything, but
> neither does CMD_RING_ABORT or CMD_RING_RUNNING for that matter.
> 
> ERST_EHB
> EP_CTX_CYCLE_MASK
> 
> Let's see what Mathias thinks about it.
> 

Fully agree,

We should probably try to get it into 7.2

Thanks Lachlan for debugging and elegantly describing the issue.

-Mathias

