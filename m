Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CA3E274E;
	Wed,  6 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064253; cv=none; b=azq+szSrgyQRjrgDm8I0Je1FbZDxIz46piCoC9K0/I0ARLdU7fb+VntuThogJ2KtWM+hX8D0otKuEdORMDUD4o1gZk79HcmsxxE90j9TSRcZFFz3FYNCUlv9kARCCHVlHcFiVy/h1V+LZnBo+WTpeuDyV7ZUKEnzvdmIHokPi3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064253; c=relaxed/simple;
	bh=0WJPvQlOxUEv5EM0d4rE/fS4vL4Kia8XzPUY7Q6KM/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYnEVs3HNyjps4GJEs0e00y2SnOsOg/BgRKrN24bOp9XVR+qilYuBo0BOR7T2STVs7QF3Quoj/kLqTUJIosMEGE32/oG7CWmL0hMA1qxY5M9xC7S7A6NRLFhUDpMt+SVJD4KLR8sTwJvqGfGtB/V4DPWadHKMoeREAHLvhySk+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt9z5mV4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt9z5mV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778064251; x=1809600251;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0WJPvQlOxUEv5EM0d4rE/fS4vL4Kia8XzPUY7Q6KM/0=;
  b=Yt9z5mV4dJ7SgrhSSQsC0iXgUfhY08ilWTIj23EicxqOOWk+NYcO+IxP
   3tATOlDwPrASR3zrlSMsWhJgU67W/jmYZXeREGXhN4pXKpl17Piyy8nmD
   PHN4nRJR9VAKv8BvpXMw+EpjWe/W4+tSk9GQ0CyFkvLvwejBQB5mskBTt
   V8/bf9VRmLAHIc8h+ftmH+TEk2QBmNB17Kh0nx4DpwEwP2dKAQIEJpYW9
   kaU3HjwuddzSqh4F4cL+erjG/U+5+O93BcRCMcqN4TFgv+QDmGnz/I6ar
   8QN4N898pkyaBlQrOQKkd2iw46Q1c8LpZHPpuVnDE3ne8ddVwzCSF8neS
   Q==;
X-CSE-ConnectionGUID: /FBylt08QsCu8hKs4DsDCg==
X-CSE-MsgGUID: rSwA6tfDSfePdUefHmQ0Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96560237"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="96560237"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:44:10 -0700
X-CSE-ConnectionGUID: ZMp0826QQimLX2IM04OgsA==
X-CSE-MsgGUID: p4SLqeBISuyWYCR1X9fzYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="266454632"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.236]) ([10.245.244.236])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:44:08 -0700
Message-ID: <b0a0ab5e-cfba-4854-900b-4c575c3b74f0@linux.intel.com>
Date: Wed, 6 May 2026 13:44:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: core: Fix root hub descriptor
 wBytesPerInterval
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, "Xuetao (kirin)"
 <xuetao09@huawei.com>, caiyadong@huawei.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260504111353.55ba2530.michal.pecio@gmail.com>
 <a7d9e9f2-4752-469f-b7e4-f0db11852e6f@linux.intel.com>
 <20260506123155.3b041e55.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260506123155.3b041e55.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/26 13:31, Michal Pecio wrote:
> On Wed, 6 May 2026 13:17:46 +0300, Mathias Nyman wrote:
>> On 5/4/26 12:13, Michal Pecio wrote:
>>> Per USB3 9.6.7, it's "the total number of bytes this endpoint will
>>> transfer every service interval". There seems to be no good reason
>>> to have wBytesPerInterval < wMaxPacketSize - either one is too low
>>> or the other too high. Here, wBytesPerInterval is too low for hubs
>>> with more than 15 ports and xHCI spec allows such root hubs.
>>>    
>>
>> There shouldn't be a USB3 hub with more than 15 ports as
>> USB 3.x specification limits USB3 ports to 15.
>>
>> See USB 3.2 section 10.15.2.1 Hub Descriptor
>> "bNbrPorts:	Number of downstream facing ports that this hub supports. The
>> 		maximum number of ports of ports a hub can support is 15."
>>
>>
>> Hub driver also fails if hub has more than 15 ports.
>> hub.c hub_configure():
>>
>>      maxchild = USB_MAXCHILDREN;
>>           if (hub_is_superspeed(hdev))
>>                   maxchild = min_t(unsigned, maxchild, USB_SS_MAXPORTS);
>>
>>           if (hub->descriptor->bNbrPorts > maxchild) {
>>                   message = "hub has too many ports!";
>>                   ret = -ENODEV;
>>                   goto fail;
>>
>> ch11.h:#define USB_SS_MAXPORTS           15
>>
>> The USB 3.2 specification 10.15.1 'Standard Descriptors for Hub Class' also
>> shows hardcoded values of '2' for both the wBytesPerInterval and wMaxPacketSize
>> for the hub interrupt endpoint.
> 
> Thanks, looks like we should be able to get away with reducing
> wMaxPacketSize then. Currently it's calculated to fit USB_MAXCHILDREN
> i.e. 31 ports, supposedly dictated by the needs of (obsolete) WUSB.
> 
> Any preferences whether to replace USB_MAXCHILDREN with USB_SS_MAXPORTS
> in the existing formula for USB3 hubs or just hardcode 0x02?

Maybe prefer the hardcoded 0x02 value as spec does it as well

Thanks
Mathias


