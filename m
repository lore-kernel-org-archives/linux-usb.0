Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145E73D3309
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120406; cv=none; b=iU5CZVXKv76/G5ECOlxNFGLgLwxkwo1fTRX1QsRM0xFiEuoPHUW53iSKCnFmohlUZZoWn7ZB79bo7yQ0Diu9DyHHU2EROcsajF3dTjwVjpnY6VbNvmdtpqL5d+vmRoyMVoRcxdRT/hodESf9XmkZzUQ5ujBKAvl1zleRbrSH0PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120406; c=relaxed/simple;
	bh=ItH6y0rFnP+YPf4D2daGI7SCEl5qRMVc9MiatKJBOZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htr3MDJhK47kimxHKgFMqhtM0XUG2+BflKTyYWuizXmXxqvTMerRVvFtY/g5d+/j+5+QkRenZox4ntQtqHgJ1JjlMNLsLnMRjitfyij7YdyqrgaBeyjG9L2hnSxp/GVFHl2QPGNPEJ86K1LQg3+xI7AZMXDhPV7QY+p31glXr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN1U3tkr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN1U3tkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789120404; x=1820656404;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ItH6y0rFnP+YPf4D2daGI7SCEl5qRMVc9MiatKJBOZo=;
  b=RN1U3tkrYUpCceDNAHhF6FKDUjl70IxOBMeErQaaMEeeLPLlGXbK/7K4
   KMPX8wGdMiNXabA7diPiUbBIiaS3XoAyA5ZyRy5UpKPV9+wSz+TNRUpO1
   Fe+XoTAeYIsUCiLopWhIAZ0LwlAK276zsa5HFUzDZ32a1pSJ2aNSF/E86
   IfwQnJ9DvM/nudtEPO3CNMdKDNhLLw7uH9FHrR3g3V/LzNN1eIbEXufEk
   LZ5EgNMB9/yCzvPl8kYgmH8dEyf+UKTCS2pLYbM/3Blq33P920cHtr3Ik
   CBn4De6QSxA21S32kzV3agzZI//+iwL2aiaV65Xiflvrizty+Po+sCU4E
   Q==;
X-CSE-ConnectionGUID: zYqoVf5FRbuiV4P3O9cW/w==
X-CSE-MsgGUID: GqDpbseuRFGiAMIvyfOeEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106949814"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="106949814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 02:53:23 -0700
X-CSE-ConnectionGUID: 8/LC/5bNSyC+MaRag2B3Sg==
X-CSE-MsgGUID: DO5JGeWbQiyuCUoNVxdtAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="267596579"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.154]) ([10.245.244.154])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 02:53:22 -0700
Message-ID: <31c54bec-2b64-4cfc-980e-9eee999aabce@linux.intel.com>
Date: Fri, 11 Sep 2026 12:53:19 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige
 16 Flip AI+ C3MTG
To: Eric Lin <ericlin050914@gmail.com>, mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <CAFb0CM2Rh7uRYmqY5coE3RoGT1F6NAuO2qr6dU=K4W9aZKVuAw@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAFb0CM2Rh7uRYmqY5coE3RoGT1F6NAuO2qr6dU=K4W9aZKVuAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 9/10/26 17:47, Eric Lin wrote:
> Hi! I am experiencing an issue where my internal USB fingerprint
> sensor enters a continuous reset loop on Linux
> 
> System Info:
> Laptop Model: MSI Prestige 16 Flip AI+ C3MTG
> Device info: Bus 003 Device 002: ID 27c6:6090 Shenzhen Goodix
> Technology Co.,Ltd. Goodix USB2.0 MISC
> Kernel Version: 7.3.0-rc2-1-cachyos-rc
> Linux Distro: Arch Linux

Is this a new issue with 7.3-rc kernel, or something that can be
reproduced with older kernels?

> 
> Behavior:
> The device repeatedly disconnects and reconnects. I have tried
> disabling USB autosuspend via udev rules, but the reset behavior
> continues
> 
> Relevant dmesg log output:
> [    0.728290] usb 3-6: new full-speed USB device number 2 using xhci_hcd
> [    0.852232] usb 3-6: New USB device found, idVendor=27c6,
> idProduct=6090, bcdDevice= 1.00
> [    0.853030] usb 3-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [    0.853035] usb 3-6: Product: Goodix USB2.0 MISC
> [    0.853038] usb 3-6: Manufacturer: Goodix Technology Co., Ltd.
> [    0.853041] usb 3-6: SerialNumber: UIDEA968203_XXXX_MOC_B0
> [   10.774839] ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
> [   30.365584] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [   30.605812] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [  425.108819] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [  425.368738] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [ 1265.198999] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [ 1265.447057] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [ 1283.745362] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [ 1491.845657] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> [ 1492.094664] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
> 

Those resets are not that frequent, often several minutes apart.

First guess is that its still somehow related to power management, and device
is reset (in resume?) to recover.

> Please let me know if you need any further hardware traces or if I
> should test a specific kernel patch.

If it works on newer kernels then git bisect can help you find the offending
commit.

Enabling usb core and xhci dynamic debug could tell us more:

echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
< Reproduce issue >
Send output of dmesg

Thanks
Mathias

