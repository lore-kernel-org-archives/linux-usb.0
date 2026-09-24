Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1A377ECF
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264971; cv=none; b=lvQZE4aksgWgnoiJHwSVCFjDFJNP+8F6w/buUikkt+hjHU//Pcli0QnRUhb9gFdLJfi3JpO5ToEukksVunqawWG+R3B80pvhh+L9ogmLNLAFBJ8fBTWZp02yiGgWTujjv7sLTscOLJlZlaqbNzcaPw9wdWmvv8oxow7PqyqGDi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264971; c=relaxed/simple;
	bh=WJTUowe5H6pdtw0+cLFJuxZT9ymkSCI4E03mWScB6OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcrwpVXaD1K4pN6fDvyZYbOZDCW9dmfFQXrSD3qM+FFV0KWsewF+EThfQNgg0t5F2+rucBGh/eeEGojgQvCHc/fyaWjQF8oC9w6C28K0wfCbIBVr7elSSLmQyf8X4rfk1//N6GytA6nWRO35sb3tMDCgNFIcRIlZhDf5kMIVhgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7Sv/WNq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7Sv/WNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790264968; x=1821800968;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WJTUowe5H6pdtw0+cLFJuxZT9ymkSCI4E03mWScB6OY=;
  b=Z7Sv/WNqWDwWjhtdl8RUKyFwUyglSiDC8ICwjVwmJPn5KJULVv/qSvqV
   QZGeoMPi1R+SLONUHejOLojHcqqITXOng6M3oNBmG+90xOfIj38BXTinY
   wMw2n3d+7p+ww7wPQql+onfLTDv4J00oUKhZR4oWNEcR2hQHB8KWzdWlX
   ZFedQI+IIBYTU7IhLVNToKaG2icashr8KljRAqolz1K4ZIx/v0LUM32/n
   3OnpqByALUOeEKeMqxkB4k8O+QqaohFG9ft/gEAbyqZfoCL8AyKTDtBdL
   6pNjjIPrLb3y6+FgE3usm9BaJ+ZwEFJ320fSiuLFPtWt7fccfyApch9JC
   A==;
X-CSE-ConnectionGUID: h/CQJuPoRFuToegYuujHYA==
X-CSE-MsgGUID: jEzgBTsXTK69nXpEfpiSvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91147607"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91147607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:49:27 -0700
X-CSE-ConnectionGUID: M1mvO0sqS1+eU1f5/ORr0w==
X-CSE-MsgGUID: g97kINuwRKGcew0O4/M6Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273178212"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.151]) ([10.245.244.151])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:49:24 -0700
Message-ID: <2a4026e7-f5d3-4301-bc60-0570cbd7fa09@linux.intel.com>
Date: Thu, 24 Sep 2026 18:49:22 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [WARNING: UNSCANNABLE EXTRACTION FAILED]Re: xhci_hcd 0000:0c:00.0
 dies with "Abort failed to stop command ring: -110" exactly 24s post-init,
 tunneled USB4 xHCI behind Goshen Ridge (ASUS ThunderboltEX 4) + CalDigit TS4
To: Ben <benstaples10@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
 YehezkelShB@gmail.com
References: <20260915043845.GG106095@black.igk.intel.com>
 <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com>
 <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com>
 <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
 <20260917043847.GV106095@black.igk.intel.com>
 <CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
 <20260921044453.GJ106095@black.igk.intel.com>
 <CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>
 <20260922042608.GZ106095@black.igk.intel.com>
 <CANcA1gAijg6Ftmw9+aeuG+SjKKwKo-HyXb+kfBiGFGj=ZzNvaQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CANcA1gAijg6Ftmw9+aeuG+SjKKwKo-HyXb+kfBiGFGj=ZzNvaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 06:02, Ben wrote:
> Hello,
> 
>> It could be that it went into runtime suspend before that. One thing you
>> could try is to connect USB3 device to the dock, like memory stick or so.
>> That would prevent xHCI from entering runtime suspend.
> 
> I have had a usb drive plugged into the dock just for quickly checking
> whether the usb ports on the dock are working properly each boot via
> lsusb. I believe that was the case during the boot that I shared.
> 
>> Can you see the 0c:00.0 xHCI in the device manager? I would expect yes and
>> then this ends up just being Linux specific issue with the xHCI on GR. I'm
>> adding Mathias in case he has any ideas.
> 
> I was truly having a hard time figuring out how to get this
> information on Windows and it really was not cooperating when I booted
> it up.
> If it's still useful, the next time around (or within the next couple
> days when I can find some time) I can confirm this with certainty.
> 
>> Can you take snapshot copy of some xHC rings and registers a couple seconds before
>> the crash? following directories would be interesting, (including all files,
>> especially the 'trbs' ones):
> 
> I've attached logs that should contain the relevant information around
> the time of this event:
>      command-ring  msi-irqs.txt    pci-irq.txt      proc-interrupts.txt
>   reg-op       uptime.txt
>      event-ring    pci-enable.txt  power-state.txt  reg-cap
>   reg-runtime
> 
>> [   24.975645] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: -110
> 
> I am providing these and I will hold onto additional ones from 2.48
> seconds into the boot.
>      24.57 /run/xhci-initrd/slot_200
>      24.68 /run/xhci-initrd/slot_201
>      24.79 /run/xhci-initrd/slot_202
>      24.90 /run/xhci-initrd/slot_203
>      25.01 /run/xhci-initrd/slot_204
>      25.12 /run/xhci-initrd/slot_205
> 

Thanks for the logs.

Registers show xHC and the command ring are running, but it still didn't process the
'enable slot' command. There are no command completion events on the event ring.
No interrupts either, but that is expected as there are no events.

Odd thing is that event ring is completely empty.
There's usually a port change event when host detects a device, this event triggers
hub driver to start the usb device enumeration process, queuing the 'enable slot'
command as one of the first steps.

Either xHC isn't really running, or fails to write to the event ring.

I noticed that both event and command rings DMA addresses are above 32 bit.

Maybe dmesg log with usb core and xhci dynamic debug enabled could show something.
Can you add the following to the kernel cmd line:

xhci_hcd.dyndbg=+p usbcore.dyndbg=+p

Could also be worth testing with with 32bit DMA mask:

xhci_hcd.quirks=0x800000


Details from slot_200 logs;
reg-op
USBCMD = 0x00000005     xHC is Running with interrupts enabled,
USBSTS = 0x00000010     port change detect active, EINT==0 so no unhandled interrupt pending.
CRCR = 0x00000008       command ring is running

reg-runtime
MFINDEX = 0x00003252
IR0_IMAN = 0x00000002      primary interrupter enabled
IR0_ERDP_LOW = 0x026d3000  event ring dma address has both high and low 32 bit values
IR0_ERDP_HIGH = 0x00000001

command-ring/trbs
  0 0x00000001026d1000: Enable Slot Command: flags C
  0 0x00000001026d1010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000

event-ring/trbs
  0 0x00000001026d3000: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
  0 0x00000001026d3010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000

Event ring is empty, command ring shows the Enable Slot command that times out.

Thanks
Mathias
