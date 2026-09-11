Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A141612A
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134003; cv=none; b=Lt3nYf4J2Ozp8WXOZbxKlQezqbDtaSe2rkT6tlbZoK4o+rNExKlOqfT1SdFBlxtRqAP/TYUVTvjN2mTt4AnY85IJ3VKh1UExm9JIjvUXu7iMEp0DTy/ADjqw6NeuE2WFlF7mc9+5B4B4Zxf0aHJ+mseQjbZA341Mg/ZH4+eRP2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134003; c=relaxed/simple;
	bh=SK6Fn2a+jXUyZAmUEWoCMbRg47XMd2cs+kzW83ukPwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTPY1u98WTaVsX+SnJT9KTbIiCu71LOwUkOy18GZf0qGNV4478WfjHFx0jpmuVMr3Taf2ba999kSzAHGSWIX3Lu3waSVxppw8vN1NzxQsA7lzqlc+qQXdt5Xsefxe5rG0yFisi89gWuQiJcz7b7mjoOhDkKVbBgo89a1GzYmzec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKQJ1v66; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKQJ1v66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789134002; x=1820670002;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SK6Fn2a+jXUyZAmUEWoCMbRg47XMd2cs+kzW83ukPwQ=;
  b=UKQJ1v66FqcOzFn4dkszJJx5FgH0pb96bq+fJwhZT8LYqzV80Vp3CHHw
   VJBxJiUUnDONKBYQ9+il4n6XfGeCNWAv0bcbQpDfzu2FvfAcwcpQOUlkT
   fcB3ZQqqQ3UV48DXKjW1lFhfXyDM0GFF80cF6pPDTOB2eTNnbp+aR4R1r
   4fkQWt/dKZKYW8W1ZiIIQ99DDHmKyJKKXJRBqbvcVOU+E6vnv4/Rw/C0e
   SO2CpetOZrEpSdLsluyXe77YrJilc7lUkn/G5VqZ+w7nZmEnlPjsfHDZ/
   uBVveXb/83zHFAt7RyjEgC2h6Xnt0rsZ45ghtWeRHRGJ9SaUWyaiPPI75
   A==;
X-CSE-ConnectionGUID: fPauS7uKS6GDylam86L/5A==
X-CSE-MsgGUID: HZWAqHI9QTGdg2e0DWEH+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93289640"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93289640"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:40:01 -0700
X-CSE-ConnectionGUID: ugUTac7pRayK0FBSN0RhqA==
X-CSE-MsgGUID: 925YT5e/QKW6fdTmRn8CaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="298993"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.154]) ([10.245.244.154])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:40:00 -0700
Message-ID: <fe9a4727-52a1-4464-9fe7-c5f50d09713b@linux.intel.com>
Date: Fri, 11 Sep 2026 16:39:57 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige
 16 Flip AI+ C3MTG
To: EricLin <ericlin050914@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
References: <31c54bec-2b64-4cfc-980e-9eee999aabce@linux.intel.com>
 <20260911121107.33832-1-ericlin050914@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260911121107.33832-1-ericlin050914@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/26 15:11, EricLin wrote:
>> Is this a new issue with 7.3-rc kernel, or something that can be
> reproduced with older kernels?
> 
> This issue has persisted since I performed a fresh installation of Arch Linux on this device (which is Linux kernel 7.0)
> 
>> Those resets are not that frequent, often several minutes apart.
>>
>> First guess is that its still somehow related to power management, and device
> is reset (in resume?) to recover.
> 
> Well, these messages seem to appear only when I use this fingerprint sensor
> 
>> If it works on newer kernels then git bisect can help you find the offending
> commit.
> 
>> Enabling usb core and xhci dynamic debug could tell us more:
> 
>> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
>> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>> < Reproduce issue >
>> Send output of dmesg
> 
> Here are the outputs of dmesg (with debug enabled)
> [    0.467820] xhci_hcd 0000:00:0d.0: xHCI Host Controller
> [    0.467827] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
> [    0.468960] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
> [    0.469267] xhci_hcd 0000:00:0d.0: xHCI Host Controller
> [    0.469269] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
> [    0.469270] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
> [    0.471205] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    0.471208] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
> [    0.472349] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
> [    0.472638] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    0.472639] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
> [    0.472640] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
> [    0.717291] usb 3-6: new full-speed USB device number 2 using xhci_hcd
> [    0.840784] usb 3-6: New USB device found, idVendor=27c6, idProduct=6090, bcdDevice= 1.00
> [    0.841565] usb 3-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [    0.841569] usb 3-6: Product: Goodix USB2.0 MISC
> [    0.841572] usb 3-6: Manufacturer: Goodix Technology Co., Ltd.
> [    0.841574] usb 3-6: SerialNumber: UIDEA968203_XXXX_MOC_B0
> [    0.957240] usb 3-7: new high-speed USB device number 3 using xhci_hcd
> [  197.151533] usb 3-6: reset full-speed USB device number 2 using xhci_hcd        # The first time of using this fingerprint sensor
> [  197.401517] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [  240.364042] xhci_hcd 0000:00:14.0: HC state intact, continuing without reset        # The second time of using this fingerprint sensor
> [  240.364098] xhci_hcd 0000:00:14.0: Setting command ring address to 0xffffe001
> [  240.364262] xhci_hcd 0000:00:14.0: xhci_resume: starting usb3 port polling.

Ok, looks like xHC (and fingerprint sensor) were suspended, and sensor reset
at resume.

Does disabling runtime suspend for xHCI and the sensor help?
After boot, as root:

echo on > /sys/bus/pci/devices/0000:00:14.0/power/control
echo on > /sys/bus/usb/devices/3-6/power/control

Thanks
Mathias


