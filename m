Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481FF3FBEDF;
	Wed,  6 May 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062673; cv=none; b=qRt7XXC2tu1ckBPRc8pTFkBNGt3J5TrsaUZItSfsXQkhwH8dInWzLnVsCXF9dnEDbna/bzFtPbCbK9QDrrQDwK4Rb+HwGChWM+wq0yckL/yPGMfOF3r/lr9CldYb2knisGpa0ANZSRy7UVum+BEsqX36YNyupjzai18AHqqfNp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062673; c=relaxed/simple;
	bh=1nAE+occhN6zEHUQdzuG07xyRL5KxzA1fIyT+VjMnBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmMxatLrATp5yLvy6dVSdG4WsQ2hQzYwNoTV3dT1e5a4ybGuDafXipTOAOPntpcQjDQFDs4RnnyHVFnFJmfW1MjkYYaNsF0fHl+51NXr6DVFYK1f25SWzI/gdbtf4YhpkrmJ2Jkrqul+6HxCCypJOMFq/q/oa7TIxnk0h+SC16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dP5YyP1e; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dP5YyP1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778062671; x=1809598671;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1nAE+occhN6zEHUQdzuG07xyRL5KxzA1fIyT+VjMnBo=;
  b=dP5YyP1eo1V+B66plPTDKsHQIoyOBnlcKO+/wIOEmw0vMK5h+ImGT3Sj
   6WlPrR2a6Kpjie1mnjrg3rfWv5a529Pb7AGCxLgn8sa1EvdqiGteE9Wgf
   JxEB5VfTOoRkQwn3+rgnYwFsl3m9kGniDVL7aqxZYktSoY8rMv4ZtCr92
   qSgTzz7v+u0c8tk5aqmbC6HVhcOLWeBgGtHpqBx33+JMQdWtvWBqvHoB4
   76R0XlFfysXqZ0WoQZ6pDAk14IZDkfPbjgQN/6NhPzFOon7k2QOBnvQ5v
   U5X6CD1ps10LpcG7xg9SNBjAR7oDNWuyR2BV0bkw95uol3zxHZ4M2UrVR
   A==;
X-CSE-ConnectionGUID: EW9mReddQsOQ06SiDsGBYw==
X-CSE-MsgGUID: F9+0vJmYS42Y/UBrRI7yeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78997925"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78997925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:17:50 -0700
X-CSE-ConnectionGUID: xmuKQU9bRpq7m5kaonYqGA==
X-CSE-MsgGUID: jiLdgjgBTnyhyNSY8H8sxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="236345712"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.236]) ([10.245.244.236])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:17:49 -0700
Message-ID: <a7d9e9f2-4752-469f-b7e4-f0db11852e6f@linux.intel.com>
Date: Wed, 6 May 2026 13:17:46 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: core: Fix root hub descriptor
 wBytesPerInterval
To: Michal Pecio <michal.pecio@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, caiyadong@huawei.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504111353.55ba2530.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260504111353.55ba2530.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/26 12:13, Michal Pecio wrote:
> Per USB3 9.6.7, it's "the total number of bytes this endpoint will
> transfer every service interval". There seems to be no good reason
> to have wBytesPerInterval < wMaxPacketSize - either one is too low
> or the other too high. Here, wBytesPerInterval is too low for hubs
> with more than 15 ports and xHCI spec allows such root hubs.
> 

There shouldn't be a USB3 hub with more than 15 ports as
USB 3.x specification limits USB3 ports to 15.

See USB 3.2 section 10.15.2.1 Hub Descriptor
"bNbrPorts:	Number of downstream facing ports that this hub supports. The
		maximum number of ports of ports a hub can support is 15."


Hub driver also fails if hub has more than 15 ports.
hub.c hub_configure():

    maxchild = USB_MAXCHILDREN;
         if (hub_is_superspeed(hdev))
                 maxchild = min_t(unsigned, maxchild, USB_SS_MAXPORTS);

         if (hub->descriptor->bNbrPorts > maxchild) {
                 message = "hub has too many ports!";
                 ret = -ENODEV;
                 goto fail;

ch11.h:#define USB_SS_MAXPORTS           15

The USB 3.2 specification 10.15.1 'Standard Descriptors for Hub Class' also
shows hardcoded values of '2' for both the wBytesPerInterval and wMaxPacketSize
for the hub interrupt endpoint.

Thanks
Mathias


