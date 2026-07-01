Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC436F437
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 21:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940188; cv=none; b=MeJD4/9i50eFhxU9Ahoy49pDpEmvXJDWeUwCez6alwEkG9Teh4MdRokUpBK99Ni/5FvucXJ5GkFXYquzAgKDFWK8iG1GlbWiswia4diAAD2JKxUIyo4dPb5L+7lHC5mq99pyR5NHyYTTDXovf6HRNDYNOjFe694teNfqhq8bR4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940188; c=relaxed/simple;
	bh=HFIFyocoK7OyU3Xp4N9bUao+xcfzHAp6BWmKmXMaaNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRWMH8IsFv/H4yMj44gW7Lmk40VdhoO5Q8AHP+WfgPlWYUwo7VPXV6PSlcHOuzt1554GUvExB8faOEPqq9UbzoJ1y1Drk36uTpmH0iDu92oA79bxD6AO2fd8fZTuwTSdbxeRaEoO80mzwMxl0J77/kHTzCPtzVB1izId39q9mgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgS6jwMm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgS6jwMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782940186; x=1814476186;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HFIFyocoK7OyU3Xp4N9bUao+xcfzHAp6BWmKmXMaaNs=;
  b=RgS6jwMmCoY6X9b17bf4klQQ3xIS3fjAQlrVj8PQdF8NA3q57dOCxtQO
   wK47Wk4uyRe9VwL+il63DRweWYvIf4pLTKjO2WCri6Zo6R9CvykzSBxlv
   SPDyIY8LmKPX8ScIk4MX+jlYKJ2QogKLqksLwFw9bxZ+xXBJa7lLd2ZzZ
   tyKNSjlyuMZsyFzjbQQZDzJ5e+s59LbCLdY3c2Wj8fsXdxJfQL9GsnXpo
   e/iUWk4pcnd7lyPrzAMnVeiliE7uKliz6EmsbKeG5+NZGSv4BmN/eCVJm
   iJ+SVkxgKw/zrGglasLa7wd6LinuZnddQWLgAWDtNF3B5wMbgpzUsfxXz
   w==;
X-CSE-ConnectionGUID: P9tQGccQQeirUszW+09a4w==
X-CSE-MsgGUID: QP7YiAF1RPecRl45NqSBXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106481492"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="106481492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 14:09:46 -0700
X-CSE-ConnectionGUID: YJA93nyUTxaeBlnqAZUz7A==
X-CSE-MsgGUID: dpl49c/FT+OHlAMZXG66Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="254605799"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.90]) ([10.245.244.90])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 14:09:45 -0700
Message-ID: <577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
Date: Thu, 2 Jul 2026 00:09:42 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/1/26 19:02, Michel Dänzer wrote:
> 
> The ethernet port of a Lenovo ThinkPad USB-C Dock Gen2 connected to a ThinkPad P14s Gen 5 AMD stopped working in 7.1.
> 
>   ip addr show enx482ae347e7c3
> 
> says the interface doesn't exist. The only thing about it in dmesg is:
> 
>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
> 
> In previous kernels, dmesg had more lines about it:
> 
>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier off
>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
> 
> 
> I bisected this to d1e280334b7f ("usb: core: Fix SuperSpeed root hub wMaxPacketSize"). Reverting that commit on top of 7.1.2 fixes the issue.
> 
> 

Thanks for reporting this.

That patch limits USB3 roothub change bitmap from 4 bytes to 2 bytes, which
should be enough for the max 15 children USB3 hubs support.
Odd that this change impacts the usb ethernet device of that dock.

It's not an important change, and should be reverted to get things working.
It also reveals there might be a off-by-one or similar bug in hub or xhci code.
would be nice to get that fixed.

Does the roothub have 15 USB3 ports?

If possible, could you share a dmesg with usbcore dynamic debug enabled

mount -t debugfs none /sys/kernel/debug
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
<connect dock>
dmesg

Thanks
Mathias
