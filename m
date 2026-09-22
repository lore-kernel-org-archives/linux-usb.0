Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B2535FCF
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076507; cv=none; b=ZMHlgV2RThccpWGUSkDh4Wr2wC9b0gB51/0VHFGAd+oK8Hrz7pKNRx9bI7T8sRyVdDLOews06R2XRkPcltnUzpdWSDSsbC0PLtD+ujBIZ0u9u8iix0OBWHCUoaWysGU+CfJ7GGOGsHSMXPFcX0ZGVFOTQFNuoHLV3F/rFiGBko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076507; c=relaxed/simple;
	bh=zFENwsbVen0cDdwjq50AVT2nSTZOVy8mhUHPh4HUMOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivQybiStdOkVcN1bv86w+/G//waDw3xlbQ3WPnqI8Bq83p5phgPjFsGWbGMRwk8sduRezL+ls8ZzVCSjNwTmFx2S1xBSdVObRWcLyIl1d2Yy0LMOKCEfp7cYmDIcC/kUPzt/at0OXYIiHwa20qlpUvT82WlxDTWsWZMJeYDhBnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J67nr9mP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J67nr9mP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790076506; x=1821612506;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zFENwsbVen0cDdwjq50AVT2nSTZOVy8mhUHPh4HUMOg=;
  b=J67nr9mP/pMVhncKQDnZL1WdFYIizgLa93OoEUeRm80WcPts7nPsQDT2
   Z33Gvs3tDsVld7wprFhFlr+NJ4y+p8nplQpDGO2qY6SzmOQXkyuv0OqOu
   h4+hBl73Qh9gaaZwQMMplHuxbOmwvgaABf8gTN/2K1860IjIXvsTqZXsi
   aY5fSsbT4ohfa0KQYIWk2RwUeNi8XV6skXAC+2CKlBGYcBsDX/N5+nhDj
   WLxvelX28vosLGFQFiigu3jtyM85VmDmG9y3SCOBc1Bgq7dkdCmHs7AMP
   w6h63cMLrPC6cppRG5Ruz9cYT9JsccXoUvu/0RZT58qKGnRfKYoLXWZ57
   Q==;
X-CSE-ConnectionGUID: y7lfbpaNSrWEl7eGJJXaJg==
X-CSE-MsgGUID: b8XKVDI6Tyy04A+RUWB/kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90538265"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90538265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:28:25 -0700
X-CSE-ConnectionGUID: n4YaVKGnTACc7fJKYYxStQ==
X-CSE-MsgGUID: 7s+K+JTWRheFOIX8dHzv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272589323"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.69]) ([10.245.245.69])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:28:24 -0700
Message-ID: <346a4f1d-629f-4a93-a00b-0b59306562cb@linux.intel.com>
Date: Tue, 22 Sep 2026 14:28:17 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ben <benstaples10@gmail.com>
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
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260922042608.GZ106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 07:26, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Sep 21, 2026 at 07:25:53PM -0400, Ben wrote:
>> Mika,
>>
>> I've attached the dmesg output from cold boot, the output of tbdump,
>> and a copy of my boot record for a sanity check. I plugged my
>> mouse/keyboard driectly into the motherboard as I tried once before
>> this and did not have access to USB devices through the dock.
> 
> Thanks! Yeah I can see that the xHCI is enumerated just fine:
> 
> [    0.444810] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [    0.444815] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 1
> [    0.446007] xhci_hcd 0000:0c:00.0: hcc params 0x20007fc1 hci version 0x110 quirks 0x0000000000009810
> [    0.446448] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [    0.446450] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 2
> [    0.446452] xhci_hcd 0000:0c:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> 
> but then later on it is not accessible anymore:
> 
> [   24.964042] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: -110
> [   24.964050] xhci_hcd 0000:0c:00.0: xHCI host controller not responding, assume dead
> [   24.964053] xhci_hcd 0000:0c:00.0: HC died; cleaning up
> [   24.964071] xhci_hcd 0000:0c:00.0: Error while assigning device slot ID: Command Aborted
> [   24.964075] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI host supports is 64.
> 
> It could be that it went into runtime suspend before that. One thing you
> could try is to connect USB3 device to the dock, like memory stick or so.
> That would prevent xHCI from entering runtime suspend.
> 
>>> Are you able to see if the link is USB4 or TB3? Can you do the same now
>>> with Linux, boot with the dock connected and share full dmesg?
>>
>> In Windows, I check with the Intel Thunderbolt Control Center, which
>> indicated the link was TB4. I then checked the Device manager and the
>> PCIE device indicated that it was taking up enough of the bus to
>> support that, though I was not able to take a screenshot. I could
>> check again if it would be helpful
> 
> Can you see the 0c:00.0 xHCI in the device manager? I would expect yes and
> then this ends up just being Linux specific issue with the xHCI on GR. I'm
> adding Mathias in case he has any ideas.

It fails on the very first command xHCI is asked to run.
This command is queued after a usb device connection is detected.

It behaves as interrupts aren't working properly, or then xHC isn't
running at all.
Looks like this xHC host supports D1 and D2 states, not sure if it's relevant.

"Abort failed to stop command ring: -110" means command was queued 10seconds
earlier. If there were usb devices connected to this host at boot then it still
took way too long to detect them (~12 seconds).

Missing/blocked xHC interrupt would be my best guess.

Are there any interrupts for this xHCI device in /proc/interrupts?

Can you take snapshot copy of some xHC rings and registers a couple seconds before
the crash? following directories would be interesting, (including all files,
especially the 'trbs' ones):

/sys/kernel/debug/usb/xhci/0000:0c:00.0/event-ring/
/sys/kernel/debug/usb/xhci/0000:0c:00.0/command-ring/

The reg-op file could also be useful:

/sys/kernel/debug/usb/xhci/0000:0c:00.0/reg-op


The event ring content should show if xHC processed the command or not.
i.e. is xHC not running, thus failing to process the command, or are
interrupts not triggered on successfully completed commands.

Thanks
Mathias
