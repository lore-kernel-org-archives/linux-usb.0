Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6582D780A;
	Mon,  3 Aug 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763090; cv=none; b=dKzyq+KsxjmC/Y3ZJnTg/ctDEoU5GEkNq81ao20axcV4NCtUpPd92hx+hZZTNIxuCLc65NT3vwiWaX0o8Pt2iOCtoHNOWl9btbml4PLjyfmO6cpkLHDGwkWb/QiDOiXurB5p+I0wCJV/F9fxJvhlckRPzY8emyExgsDuBKN/4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763090; c=relaxed/simple;
	bh=MwfLYU3tG3zbabY1f3MgXkyY63nDb9qUGGE7nCUOdHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIjnD9gaxrjmqH+zmbWYsWDq2E6EPrpiBYyFIjyY09ZWLE4VxqWx0VYW17j6Y3oSAnkso17u/7499hN3HIqaHxTNPp1UBtSYjPCsoNw19GmgbUUr71iliJiBrWMGuraSFs+HXCau+ps3t3ydYOGJyRa3nKFxVv1Qn8vfLDx9dHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuFYfZq7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuFYfZq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785763080; x=1817299080;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MwfLYU3tG3zbabY1f3MgXkyY63nDb9qUGGE7nCUOdHo=;
  b=SuFYfZq7UdxhB0FgOab8XqiVPOlb7RYJY0QlT3i5RQ7ioviV3mVl7y+1
   F8tCw+eY/CEd6+tlYjKhPKVsJUyJKo8RtjMiKJw4ohnrr3jcfQXKcYkoI
   rPCD3j0KrpuqM35cDhxYzygakCXxCRghJ5DtcA0Ed/XMTbr1xIe0jnYh+
   FeUkHWqFCAzz2jf63i5kQw0CDM/QBeWrB6LCWRmJj7uOY9a4H7JMvBAph
   QcZktkquNiNWRmdLa/xP8K9tP3XmqJ2mRsJ3MKsYqsypwj2pCBUfZArXj
   JTQ1Rr9CEnchUx0SJQUliNaeoLcFuMS2ROqMULWIl+f3HGAs+bl+EZWwT
   g==;
X-CSE-ConnectionGUID: UWjgqSfhRkCsbwhYaF3pdQ==
X-CSE-MsgGUID: EtGxTViVQAio4srFdokCAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97670134"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="97670134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 06:17:54 -0700
X-CSE-ConnectionGUID: qmsA2INMTFmlEfgM3SsXyA==
X-CSE-MsgGUID: 0zQ/PjBSSn+Moh07UQDgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="285856044"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.9]) ([10.245.245.9])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 06:13:44 -0700
Message-ID: <67997c70-d77d-4ede-a461-c80395e8a0b9@linux.intel.com>
Date: Mon, 3 Aug 2026 16:13:41 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Handle USB3 port events when there is one
 roothub
To: Semih Baskan <strst.gs@gmail.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, hkallweit1@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803110704.381-1-strst.gs@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260803110704.381-1-strst.gs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/26 14:07, Semih Baskan wrote:
> handle_port_status() drops every USB3 port event when xhci->shared_hcd is
> NULL. The check dates from a time when xhci-plat always created a shared
> hcd, so a NULL one could only mean the hcd had been removed.
> 
> Since commit 4736ebd7fcaf ("usb: host: xhci-plat: omit shared hcd if
> either root hub has no ports") that is no longer true. A controller whose
> USB2 root hub has no ports gets a single roothub, the USB3 rhub is served
> by the main hcd, and shared_hcd stays NULL for the lifetime of the device.
> Every SuperSpeed port event is then thrown away as bogus behind a debug
> message, so devices never enumerate even though the port sees the device
> and its change bits stay set:
> 
>    0x006a1203 Powered Connected Enabled Link:U0 PortSpeed:4
>    Change: CSC WRC PRC PLC
> 
> Broadcom Northstar is such a controller. USB3 works there up to 5.15 and
> stops working from 5.19 onwards.
> 

Interesting, I remember discussing USB3 only xHC hosts a couple years ago
when we got a USB2 only xHC.

We assumed a USB3 only xHC host is unlikely as connectors need to be backwards
compatible and support USB2 devices.

Is some other host controller (xHCI/EHCI) handling USB2 traffic in this
Broadcom Northstar case?

> Ask xhci_get_usb3_hcd() instead. It returns the shared hcd when there is
> one, the main hcd when the USB2 root hub has no ports, and NULL once the
> shared hcd is gone, which keeps the original meaning of the check.
> 
> Tested on an Asus RT-N18U (BCM47081), which has a single roothub. Before
> the change nothing enumerates on the USB3 port; after it SuperSpeed
> devices enumerate normally over repeated connect and disconnect cycles,
> the change bits shown above clear, and USB2 is unaffected on both ports.
> 
> Fixes: 4736ebd7fcaf ("usb: host: xhci-plat: omit shared hcd if either root hub has no ports")
> Cc: stable@vger.kernel.org
> Signed-off-by: Semih Baskan <strst.gs@gmail.com>

Adding, no reason to not support USB3 only hosts

Thanks
Mathias

