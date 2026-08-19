Received: from srv2.spambusters.email (srv2.spambusters.email [185.90.57.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105B63515F6
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.90.57.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157585; cv=none; b=Nq/VBKT6OEzmArlBSP8xnQsZ7bGsBNYVDuLW8zsDTY7xDRFfLfe+VSkf+pqOQTloHTH7FR1viHDROdbJ8mZ9lheb2xghpAwM6lQSLnjmfRws/Mnql/O+JKQDD6IqII9qhBnn/qLh5Ex5bx/CkgZYLfopfMB9t3cij70dgBHrGr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157585; c=relaxed/simple;
	bh=a+KrRSPmL8bBmb9GpPoUf0HdtjwwNZWqiTYKbN21sPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASKiRzAnpLbsFtdQlKjTYlHsX9jIZ8eE5nEOiOiFtdxduqXWMdlHyjGSkVDpCIC9G2TdTzkvXV2VLnRGwtMr5xovptj93Vz5ldvwNpKvTXmMyP1O0Zvl/vnb4DgzFykIivW6beLyLPI4O2QCmTcPTfU5BVfhDAQWKktqagb1/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fonseca.com.pt; spf=pass smtp.mailfrom=fonseca.com.pt; dkim=pass (2048-bit key) header.d=fonseca.com.pt header.i=@fonseca.com.pt header.b=l4+DUJAF; arc=none smtp.client-ip=185.90.57.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fonseca.com.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fonseca.com.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fonseca.com.pt header.i=@fonseca.com.pt header.b="l4+DUJAF"
Received: from nv7.serverhs.org ([62.233.41.48])
	by srv2.spambusters.email with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pedro@fonseca.com.pt>)
	id 1wwifL-002QQL-IH; Wed, 19 Aug 2026 16:57:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fonseca.com.pt; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iHZsKJTDrjxEmPUqsLQ6LRP8LAPgMvY1w195E1rv5ko=; b=l4+DUJAFoCOTDgqvbjC2bDX5My
	2DEfcU3d0+ZL1KG2Zk5JPTCdG1a7Pw7dCtzYf/jCwnvQD7MdqCWFNdF2PvljSUuTRY8T4NRWdrR54
	YOFGdAcDzhvtYUOyN644uOt3XQAPmSxl8ahgxpkflfcGnJQjiYgdHxdCMagj5djsjmtOMDGEJDFsG
	N4T747YSNT3pr23nOJI3TyEy2vlcecNClQL5J/nU4PaRQz5N9RP9bnO21w7PqLA8glvTuvtDsbLTq
	LSZcSBIaKEwFClvpFrkdFDkRIsCDKWKDaMptBjC1QNTDFaoUgzCKOly07iKdjdaY9TcbRoMhnIjOA
	8BprFHXA==;
Received: from dsl-27-39.bl26.telepac.pt ([176.78.27.39]:42782 helo=[192.168.1.158])
	by nv7.serverhs.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <pedro@fonseca.com.pt>)
	id 1wwifK-0000000GU5s-14PP;
	Wed, 19 Aug 2026 16:57:22 +0100
Message-ID: <2664462f-1b66-4f66-b561-c072f041eaf0@fonseca.com.pt>
Date: Wed, 19 Aug 2026 16:57:20 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: hard lockup on ASM2142 when Address Device command times
 out
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt>
 <20260819171744.4bc8e8c6.michal.pecio@gmail.com>
Content-Language: pt-PT, en-GB
From: Pedro Fonseca <pedro@fonseca.com.pt>
In-Reply-To: <20260819171744.4bc8e8c6.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Get-Message-Sender-Via: nv7.serverhs.org: authenticated_id: pedro@fonseca.com.pt
X-Authenticated-Sender: nv7.serverhs.org: pedro@fonseca.com.pt
X-SpamExperts-Domain: nv7.serverhs.org
X-SpamExperts-Username: 62.233.41.48
Authentication-Results: spambusters.email; auth=pass smtp.auth=62.233.41.48@nv7.serverhs.org
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.000968367741332)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVVEuMAi/3uaqBqb73aYIp6RHteoh0IbMNe
 AJwfWcrLOSu2SmbhJN1U9FKs8X3+Nt2FRO2jku9Ou67dCO0ib8TtCsSH2HEVBohCasKFQEzrqufH
 zJ6mVE7ewsipSVIfs4b+Oxk+pC/pnw7VJetyExsCS5+h1uiHzk/Rfxfh461YLyu3RZI1CD15pCOE
 1vk99RMxqKIdDR6RVaf4xWSq5/wwdOtYechJ/ikE1WgRg4cS6IWYhudgXd4x16sWu5W5tfrUnnj/
 QpEdoUIl9Qx+dIhcrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5Ay2op6Rhkg
 LjMjtw/4mxjlzG0EsPLrmM5WlT0oQmEihX1XamBLeqEzM7LsUIt0ZvGLIT5LUm075ewdrul30woF
 SbEXnztUC1bmnr5NdXiSNGFa9xbqyXm4K90IEHnZCdttupV1CRfHOwz2JiB69OsOFwi1QdP2KyHd
 0gCsz3QL5HlFXjk86ke0DsUjvutWIVF5/m+qKE989e94cDCjpn7cuEUCkFG00o0dYRrfTmSDaBVG
 sVkHi3KzV2F7uDYQcqKMlm3dazyjiVxDag0+zn4/XdSNFEiA/wt11xDVn/Y7dsvW/Bw1qIHDo9Tc
 sksOa99k+/bMgw5nFFzOZY1qa53ZbuhWwibJwZRvHlb2Mga1NEp8Fni1aT3DfF5c88XE+0u6Wgzm
 KIE+B/BJ1OgYMjhCffeFTYlhvk1RsxCeadQiZolG3wJnHh/wY8Nxyu1BiIERlKeELwhSLdOWVXry
 hj9Ai6DGekMtXeif0eiY2gV/xdMFXTZ/Il1Q5UsZ411xD6DOGXEtTGpN3TdPH8CVaKJlYMDlJOe7
 wcpOyVqarp4A0JNRXxKF5tPxTxfD0dMN+t5ZOtN1LGeKMTiA83lWQLkYA0zyN54lLK0b9Z/zyvaQ
 G5suh1hDRkvjY50i7nSXPWtPt6oG8bUR0FG1ryJC4j97D06wZ0OLEKOfMvKoR0ESEohGsVkHi3Kz
 V2F7uDYQcqKMN2uWfIT56ef/wP/mGRvHhXKkwbQCTncSOx9zZlsBOUCVQQan+QF7W/Bk2eM2qSfr
X-Report-Abuse-To: spam@srv2.spambusters.email
X-Complaints-To: abuse@srv1.spambusters.email

Hi Michal,

Thank you for taking the time to look into my email, it's very much 
appreciated.
My replies below.


Once again, thank you.

KR,

PF

On 19/08/2026 16:17, Michal Pecio wrote:
> On Wed, 19 Aug 2026 11:35:40 +0100, Pedro Fonseca wrote:
>> I am hitting a reproducible hard lockup in xhci_hcd on an ASMedia
>> ASM2142/ASM3142 controller. It happened twice in three days on the
>> same kernel, and both times the machine lost all USB input and had
>> to be power-cycled.
> Is this a regression or just using new hardware for the first time?
Neither the kernel nor the controller is new, but the workload is: the 
OnePlus 6T (the trigger device) first appears in my logs on 2026-08-15, 
one day after I first booted 7.1.8-200.fc44 (Fedora). The earlier 
kernels here (7.1.4, 7.1.5) were never exposed to this plug/unplug 
pattern, so I can't call it a regression either way.
>
>> The two occurrences produced different backtraces, and I think
>> together they show both ends of the same deadlock: one caught the CPU
>> holding xhci->lock, the other caught a CPU spinning for it from hard
>> IRQ context.
> Yes, a known bug when command abort fails and in some other cases.
> The lock ought to be dropped while waiting, but this opens new race
> conditions which will need to be analyzed and solved.
>
> Not a deadlock, lock holder times out.

Thanks, that matches what I see. It happened a third time today, and 
this time the watchdog caught the holder side directly:

   Workqueue: events xhci_handle_command_timeout
   RIP: 0010:delay_halt_mwaitx+0x39/0x40
   Call Trace:
    delay_halt.part.0+0x36/0x60
    xhci_handshake+0x92/0x110
    xhci_abort_cmd_ring.isra.0+0xda/0x1d0
    xhci_handle_command_timeout+0x1b3/0x280
    process_one_work+0x19e/0x390
   xhci_hcd 0000:26:00.0: Abort failed to stop command ring: -110
   xhci_hcd 0000:26:00.0: xHCI host controller not responding, assume dead
   xhci_hcd 0000:26:00.0: HC died; cleaning up

Again exactly 19 seconds after a connect/disconnect cycle on 3-2.2.

>
>> Affected controller:
>>
>>     26:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM2142/ASM3142
>>             USB 3.1 Host Controller [1b21:2142]
>>             Subsystem: Micro-Star International Co., Ltd. [MSI] [1462:7a32]
>>             Kernel driver in use: xhci_hcd
>>
>> Topology below it: a Genesys Logic hub (05e3:0610 USB2 / 05e3:0626
>> USB3) with a Ducky keyboard (04d9:0356) and a OnePlus 6T phone
>> (18d1:4ee7, ADB/charging mode) attached.
>>
>>     /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 480M
>>         |__ Port 002: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
>>             |__ Port 002: Dev 003, If 0, Class=Vendor Specific Class,
>>                                          Driver=[none], 480M
>>             |__ Port 003: Dev 004, If 0, Class=HID, Driver=usbhid, 12M
>>             |__ Port 003: Dev 004, If 1, Class=HID, Driver=usbhid, 12M
>>             |__ Port 003: Dev 004, If 2, Class=HID, Driver=usbhid, 12M
>>
>>
>> Trigger
>> =======
>>
>> In both occurrences the lockup happens exactly 19 seconds after a fast
>> connect/disconnect cycle of the OnePlus 6T on port 3-2.2, behind the
>> Genesys hub. The phone re-enumerates repeatedly as ADB switches modes,
>> and the controller dies in the middle of a setup device command.
>>
>> It is not fully deterministic - it happened twice in roughly two days
>> of normal use, not on every plug event.
>>
>>
>> Occurrence 2 - 2026-08-19 10:45:05 (waiter side)
>> ================================================
>>
>> Aug 19 10:44:45 usb 3-2.2: new high-speed USB device number 13 using
>> xhci_hcd
>> Aug 19 10:44:45 usb 3-2.2: New USB device found, idVendor=18d1,
>> idProduct=4ee7, bcdDevice= 4.09
>> Aug 19 10:44:45 usb 3-2.2: Product: OnePlus 6T
>> Aug 19 10:44:45 usb 3-2.2: USB disconnect, device number 13
>> Aug 19 10:44:46 usb 3-2.2: new high-speed USB device number 14 using
>> xhci_hcd
>> Aug 19 10:45:05 watchdog: CPU11: Watchdog detected hard LOCKUP on cpu 11
>> [...]
>> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: Abort failed to stop command
>> ring: -110
>> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: xHCI host controller not
>> responding, assume dead
>> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: HC died; cleaning up
>> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: Timeout while waiting for setup
>> device command
>> Aug 19 10:45:05 usb 3-1: USB disconnect, device number 2
>> Aug 19 10:45:05 usb 4-2: USB disconnect, device number 2
>> Aug 19 10:45:05 usb 3-2: USB disconnect, device number 3
>> Aug 19 10:45:06 usb 3-2.2: device not accepting address 14, error -108
>> Aug 19 10:45:06 usb 3-2-port2: couldn't allocate usb_device
>> Aug 19 10:45:06 usb 3-2.3: USB disconnect, device number 12
> Looks like a firmware bug, because ASMedia should internally time
> out an Address Device command after 3 seconds. The only exception
> I know is the old ASM1042 (waits forever and can't be aborted).
>
> An interesting experiment would be to unplug the offending device
> before abort timeout. This recovers even ASM1042, at least so long
> as it's alive. You should see "error -71" and continued operation:
>
> usb 3-2.2: device not accepting address 14, error -71
I'll try that on the next occurrence and report back, it reproduces 
every day or two, so it shouldn't take long.

One data point in favour of your firmware-bug theory: on 08-15 the same 
phone was plugged into the other xHCI on this board (AMD X370, 
0000:03:00.0) and produced repeated "Device not responding to setup 
address" + "device not accepting address, error -71" with no further 
harm. The ASMedia is the only controller that wedges on it.
>
>> After the controller died, the second xHCI on this board (03:00.0, the
>> AMD X370 chipset one) also started failing while I was trying to plug
>> in a spare keyboard to reboot cleanly:
>>
>> Aug 19 10:45:52 usb 1-12: new full-speed USB device number 26 using xhci_hcd
>> Aug 19 10:45:57 usb 1-12: Device not responding to setup address.
>> Aug 19 10:45:58 usb 1-12: device not accepting address 26, error -71
>> Aug 19 10:45:58 usb 1-12: WARN: invalid context state for evaluate context command.
>> Aug 19 10:46:01 usb usb1-port12: attempt power cycle
>> Aug 19 10:49:32 usb 1-12: device not accepting address 29, error -71
>> Aug 19 10:49:59 xhci_hcd 0000:03:00.0: xHC error in resume, USBSTS 0x401, Reinit
>> Aug 19 10:49:59 usb usb1: root hub lost power or was reset
>> Aug 19 10:49:59 usb usb2: root hub lost power or was reset
> Are you sure it's not a pre-existing, independent issue?
You're right, it is. Checking older logs, port 1-12 was already throwing 
those -71 errors on 08-15 with the same phone, days before the first 
ASMedia lockup. So the 03:00.0 trouble is most likely the flaky 
device/cable itself, independent of this bug. Sorry for the noise there.
>
>> I power-cycled the machine at 10:50.
> Probably SSH would work over some PCI NIC.
Yes. Even better: after today's occurrence I confirmed that a PCI remove 
+ rescan of 0000:26:00.0 brings the controller back fully (all devices 
re-enumerate) with no reboot needed, so I have a way to recover and keep 
experimenting without power cycling.

>
> Regards,
> Michal
