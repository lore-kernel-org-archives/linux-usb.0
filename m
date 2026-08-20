Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC22253EE
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214109; cv=none; b=JXlJ7D1bVBR67dhdwrb4u04mtXK2UbMWw6SSLpa2x7Rep6syyDgQixEVPzL9vRUpQSsL3Q82RLNmcXhYRcG8t+8JxwrufrdO0WUArFKw52jM60KPlL2TGQQRCXjijBGGI2j9aMYXh5A2XYmRsRn/foEugr9PZrT0YQmYKx9hlzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214109; c=relaxed/simple;
	bh=hU6WbeKXjkf04ex0lb3C0wtWXl/i8eF6gaU6bGhNuCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lf8dzET1IS8RZ1Xfc6Eafkm2b+rFbcCJJ6M9POj1XRGaBBPfZlCne5+3xhxgHO9C56IsID9Fw6kKomTP3cotkaKx7BuIEcgdHbu82anSgrb1GzjZiUHhRvl6YWuK9kLC3JE+tn/WV1DdcQCo3zuwtumQH5D5Ml0YvtMTN5QtKhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxpFUJNJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxpFUJNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787214107; x=1818750107;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hU6WbeKXjkf04ex0lb3C0wtWXl/i8eF6gaU6bGhNuCE=;
  b=lxpFUJNJ1daLpGSwOpvy4xyBswHldLybpcEIuZWSqOlVn8SeR3FYQSqS
   KR55BM+2m6bi1VVfH9ClGpdivfYzmNrpvTqyZgB8GYsyaiScn2F3eMCL3
   BQdBKc6WRD4X+EOvJ5ng+hW8yifTSfkJ3a50majuJEyWeh9UWD4M530HK
   SwRK+JlV6ty1oKajaGfLbkNnHvlsSLChLN2ZocTzXZ6nAVcRlUegYEaRi
   xuU7JrIfaq4VK71wiza1EkhjMNZfaSAPiSrcSA6uUzdwHQZVnQxjCok0K
   0P2xZrBUdTUSZXWpPpPQM+HVDZOr4NjFUD+h8M9rLgiwknQMnGVkZIQh7
   Q==;
X-CSE-ConnectionGUID: LnGBOh2ASpGhQHWzbWAWCQ==
X-CSE-MsgGUID: AWW2FdToS+OI4m1JPkVNYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87756512"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87756512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:21:47 -0700
X-CSE-ConnectionGUID: u4KLPAvpQsSFN31p1v9Wdw==
X-CSE-MsgGUID: 630S6q5bSiCvUmRf6g6HxA==
X-ExtLoop1: 1
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.28]) ([10.245.245.28])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:21:46 -0700
Message-ID: <f4eb5fa3-3c91-4c7c-b709-b493a0563e66@linux.intel.com>
Date: Thu, 20 Aug 2026 11:21:24 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP (0x83)
 loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
To: Michal Pecio <michal.pecio@gmail.com>,
 =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1551785954451@mail.yandex.ru>
 <20260815215259.014cc324.michal.pecio@gmail.com>
 <fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
 <20260818000909.31af0ae3.michal.pecio@gmail.com>
 <358afe43-5f0f-41f6-89cc-129b20ef7641@yandex.ru>
 <20260818232945.2c67b15b.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260818232945.2c67b15b.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/26 00:29, Michal Pecio wrote:
> On Tue, 18 Aug 2026 20:31:17 +0300, Дмитрий wrote:
>> Hi Michal,
>>
>> I tested the suggested commit:
>>
>> 3d9eeb336131bc5a174367c384fa00c15c8744fd
>>
>> on top of Fedora kernel 7.1.8 with the earlier commit
>> 7c0c31c66a7f9daace156bac427aafb2f4bbb5fc also applied.
>>
>> The resulting kernel was:
>>
>> 7.1.8-200.xhci3d9eeb3.fc44.x86_64
>>
>> COPR build:
>>
>> https://copr.fedorainfracloud.org/coprs/vertigo-red/kernel-xhci-deq/build/10875339/
>>
>> IOMMU remained enabled in translated, strict mode:
>>
>> intel_iommu=on iommu.passthrough=0 iommu.strict=1
>>
>> There were no DMAR or IOMMU faults.
>>
>> A journal-cursor-bounded run with dynamic debug enabled for
>> drivers/usb/host/xhci-ring.c timed out after 45.026 seconds:
>>
>> rc=124
>>
>> The v4l2-ctl output contained 22 capture markers and reported 239
>> dropped buffers. During the exact test interval, the kernel logged:

Is the camera still unusable with this new kernel if you disable all
debugging?

With the "All TDs skipped" issue fixed the driver should now be in
sync with the isoch ring.

> 
> This number of Missed Service Errors is excessive and may be the main
> reason for data loss. Unfortunately, I don't konw what causes it. Some
> users reported seeing correlation with CPU load (it may go both ways -
> either high or low CPU load causes errors).
> 
> It notably shouldn't be affected by scheduling patches in usb-next,
> because uvcvideo uses URB_ISO_ASAP. And you say the bug is very old.
> 
> Maybe it's something to do with multi-TRB TDs? Would it get any better
> in video modes that don't produce "spurious events"?
> 

Could you take a short xhci trace of this issue?

It should show the content of those TRBs in mode detail.
TRB fields like TD size are more important in Multi-TRB TDs.
Controller uses those for scheduling.

mount -t debugfs none /sys/kernel/debug
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send content of /sys/kernel/debug/tracing/trace

Content of HCCPARAMS2 register and USBCMD register would also be useful
as those dictate how the TRB fields are interpreted.

cat /sys/kernel/debug/usb/xhci/0000:00:14.0/reg-cap
cat /sys/kernel/debug/usb/xhci/0000:00:14.0/reg-op

Thanks
Mathias

