Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102013;
	b=GV44VlPzk7KMv+mydEr25C60LMUx7HuZfqzjVbC5vE486svmWjht0CmGmeHDl6Y99B8J
	 ulo7B1EHmWRapZaInmCouDY55G7WIdVe7b87qpGdH7H7mRhxR+Sp/cX+xcraKu9ZqtN8y
	 Z0x1wpfSRPFyVijYb2MalakbSGnzkEUJMRhhpl/kA++l4V2lZ4gxMKHdHI+NtgeRJQ/vA
	 B0tnnMy7XXLBHxm0Ch0OlKlo3qplAMybLo0ORbOSyzUVmhTzVhciI96Ra4BmTY95SaYQ6
	 dDZGotzK9p/2/RtZ1gf/jDrh+CTXf580SLm5T3Uiq/ZQwMhEn+H3e+fvuVm1O/Lby6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102013;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1DhxKPag4QnJI8h018mWy2cQ1T0+TGTYvGJUvXmgtiw=;
	b=3oYTf2PiGVO+zMBoNM/nUnRfocsCOkTpGaZDb4khfPBOEzyMrA8FdEWKGY+F6tK1GaSi
	 /p2F4kP7OQjnIPtHKAWfZCiD1+M06E4q3O4BkSu7IRh0+WZpiXfYpc3WOgCkwjH6CIMyP
	 +r3qrrrLxlXtZXPSpzkkpKpV3B8R8nQNMWFVFFcaBPZTjO0hO442d72cv4SqnW8KoIimR
	 GBSuARcMuCzqDvLWrqZ4kt8M06X5qEPNWFlyexehibl8p3I+WUCqpBkigOebOTtu3jR/c
	 vIzP05cdCj+GHq6XTOz08rMZJc3uct6m1yTriSX00IzXJv9nF7S8Ess9u2U1Ez5KoBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Dbx0/FmK";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A67606A324;
	Thu, 19 Nov 2026 15:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A67606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dbx0/FmK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795102014; x=1826638014;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WY6VoEXvMcL6w5qrhNPPqWVL4OjNmLGwj52oUp7WWCE=;
  b=Dbx0/FmKyMYNGYA/2gD9fgQFEQ3Troi5tzLo6Cj9Heumj19sNlhmlFMW
   5YWlr+1K+rcakMXg6hvTCVz8Vk8ngvHbNFa1uHgZHGhVx6TBSjHM3jcpO
   sz4bn9clHXbPExAYhjPHUH5bkpVr+Jew7eONj4lnSN7Qhec3LhO5sC/8H
   AR3dOiRqJvD9OLsl3cXzRu/Ch8ChtFQnd8zyJBLf6ArDLJDyXKc5dBsrm
   i/RUtaRhnFcfPFcGx7O2iVInsG1XV6fVhN6BMAfVcPnYdPc3j0Z/oPNwE
   8QwBntPsuPgH2QHRErcBEbOOy5qW4SYNLxZHWXOMXxhw9DRenTmjMFZzQ
   w==;
X-CSE-ConnectionGUID: Nz9sNUzcSHq9BjOgzIlB1w==
X-CSE-MsgGUID: UFq2sUDARK+ovGlc5v93ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3800163"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3800163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:26:53 -0800
X-CSE-ConnectionGUID: 8zH6sFHFR1y7uZIeUyNLZQ==
X-CSE-MsgGUID: z8JgdylwRtusIJXVBOleqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10823970"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.137]) ([10.245.245.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:26:50 -0800
Message-ID: <026c4fd4-cae7-41e6-88e7-be8387031eb7@linux.intel.com>
Date: Thu, 19 Nov 2026 17:26:47 +0200
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
Subject: Re: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
 <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
 <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 00:30, Wesley Cheng wrote:
> 
> 
> On 11/17/2026 1:59 AM, Mathias Nyman wrote:
>> Hi
>>
>>>>
>>>
>>> Hi Mathias,
>>>
>>> Was wondering if this design looked a bit more acceptable?  Was able to figure out a way to achieve what you had suggested earlier mitigating the dma free problem I mentioned in my previous email.  If there are any issues w/ this please let me know.
>>>
>>> Thanks
>>> Wesley Cheng
>>
>> Big picture looks good
>> I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 2/4].
>>
>> It reveals and reminds me of how poorly designed existing xhci_free_dev() is.
>>
>> I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
>> inside the lock, preventing it from being dereferenced based on slot_id
>> somewhere else, and then free it without the lock.
>>
>> I ended up with a huge mess that rewrites vdev free/allocation,
>> slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().
>>
>> Seems like best solution for now is to add "no_pool_rings[]" to support the
>> larger page size, and then later rework the vdev allocation/free and
>> slot enabling/disabling. I'll take a look at the details of the series.
>>
>> I also have another sideband change attempting to fix the use-after-free
>> stale vdev pointer in sideband. It basically swaps vdev to udev.
>> I'll post it on the list. Let me know your thoughts on it.
>>
> Sure, I assume you're talking about:
> https://lore.kernel.org/all/20261118125109.1429538-1-mathias.nyman@linux.intel.com/
> 
> If so, let me look it over, pull it into my branch and test it out if it looks good.  I wasn't able to reliably reproduce the issue that Lianqin initially reported, so I'll see if I can figure out a way to exercise that call path.
> 

Yes, but sashiko found one missing sideband_to_vdev(sb) check that would be good to fix.
Rest of warnings were expected.

I'll fix it, and clean up some other minor things, and send a v2

Thanks
Mathias

