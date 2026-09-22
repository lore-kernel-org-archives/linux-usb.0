Received: from mxout023.mail.hostpoint.ch (mxout023.mail.hostpoint.ch [217.26.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55A4A204F
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.26.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057535; cv=none; b=UwsXHU0ijIQEbOj+Z1GdaJpcR0BBf3WAuJNtY/UlMAK23Wf0c54uve6HhvKg7aC8KT0jstwCXTIu9YxxXmqTsqNgmosY9KqncgnOlVIm1t6lWdbkWP0ZeJd1zV+8Q3xtnp4jSNC09F3IBJWgA1YshhBA7n8Wttzyo4ZLIz98BS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057535; c=relaxed/simple;
	bh=sqS3+wkeHyGuGEumMSJEmTH5u3nru3J8fhOosIX8g0c=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PkT7a6L3N0TwagPEy9AM8bcM/iNU4iQU86yWPF08UwPYkTkISfUDGKWcR9I39jWuXEmbjQ4j/9cUTdmlLMCEZVzYX+OnNU+8UHHsRGf3fYXwuxCzdX4zDw/7ZalprdKf2+xlt6gwmeQWqStE24R68djPLwpTsfeVvPiVvHUJL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=semprevivo.ch; spf=pass smtp.mailfrom=semprevivo.ch; arc=none smtp.client-ip=217.26.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=semprevivo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semprevivo.ch
Received: from asmtp014.mail.hostpoint.internal ([10.4.1.187] helo=asmtp014.mail.hostpoint.ch)
	by mxout014.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5 (FreeBSD))
	(envelope-from <rodolfo@semprevivo.ch>)
	id 1x8tRs-000000002lY-1m0b;
	Tue, 22 Sep 2026 07:53:48 +0200
Received: from [157.143.51.59] (helo=[192.168.1.164])
	by asmtp014.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5 (FreeBSD))
	(envelope-from <rodolfo@semprevivo.ch>)
	id 1x8tRs-00000000APh-1M3O;
	Tue, 22 Sep 2026 07:53:48 +0200
X-Authenticated-Sender-Id: rodolfo@semprevivo.ch
Message-ID: <ef5ba6ff-ed50-4bb6-ae6d-fb11f0a47954@semprevivo.ch>
Date: Tue, 22 Sep 2026 07:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
From: Rodolfo Semprevivo <rodolfo@semprevivo.ch>
Subject: =?UTF-8?Q?=5BBUG=5D_Type-C_Subsystem_xHCI_=288086=3Ae331=2C_Panther?=
 =?UTF-8?Q?_Lake=29_=E2=80=94_repeated_err_-71_/_port_reset_failures_under_s?=
 =?UTF-8?Q?ustained_DP+HID_load?=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hardware

* Laptop: ASUS ROG Zephyrus G16 (2026), model GU606AX
* CPU: Intel Core Ultra 9 386H (Panther Lake)
* Affected controller: 0000:00:0d.0 "Core Ultra Processors (Series 3)
    Type-C Subsystem xHCI" [8086:e331] (separate from the Thunderbolt
    DMA0 controller at 0000:00:0d.2 [8086:e333], which is unaffected)
* Distro: CachyOS (Arch-based)
* Kernel: 7.2.6-1-cachyos (also reproduced on 6.18.52-1-cachyos-lts)
* linux-firmware: 1:20260916-1 (current at time of report)


Connected device

ASUS ProArt PA169CDV pen display (4K, USB-C with DP Alt Mode, integrated 
USB hub for pen digitizer + touch + a VLI USB2.0 Billboard device), 
connected via a certified USB4 20Gbps cable to the laptop's left-side 
USB-C/Thunderbolt-capable port. The same cable and monitor work 
correctly (4K@60Hz) on another laptop (older Alder Lake-based ASUS ROG 
Zephyrus, Intel + NVIDIA hybrid).


Problem description

When the external monitor is connected at 3840x2160@60Hz, the downstream 
USB hub inside the monitor enumerates correctly (pen digitizer, 
touchscreen, and a VLI USB2.0 Billboard control device all appear 
normally), but within ~10-30 seconds the ports begin failing resets and 
the entire hub disconnects:

|usb 3-1-port1: cannot reset (err = -71) usb 3-1-port1: cannot reset 
(err = -71) [... repeated ...] usb 3-1-port1: Cannot enable. Maybe the 
USB cable is bad? usb 3-1-port1: cannot disable (err = -71) usb 
3-1-port2: cannot reset (err = -71) [... same pattern on port2 ...] usb 
3-1.1: USB disconnect, device number N usb 3-1.2: USB disconnect, device 
number N usb 3-1.4: USB disconnect, device number N usb 3-1.5: USB 
disconnect, device number N usb 3-1: reset high-speed USB device number 
N using xhci_hcd usb 3-1: device descriptor read/64, error -71 usb 3-1: 
USB disconnect, device number N|

The external monitor shows "No Signal" / "USB Type-C No Signal" once 
this occurs.

Reproduction is 100% consistent at 3840x2160@60Hz. The same physical 
port, cable, and monitor work reliably at:

* 3840x2160@30Hz
* 1920x1080@60Hz

This was verified to be independent of which GPU drives the DP output: 
the laptop has a MUX switch (Intel Xe iGPU / NVIDIA RTX 5090 dGPU). 
Forcing the dGPU-only mode (NVIDIA driving the port instead of Xe) 
reproduces the identical err -71 pattern, ruling out a GPU-driver-side 
cause.


Things already ruled out

* Cable: same cable confirmed working at 4K@60Hz on a different
    (older, Alder Lake) laptop with the same monitor.
* GPU/driver routing: identical failure under both Xe (|xe| driver,
    card0-DP-2) and NVIDIA (|nvidia| driver, card1-DP-1) via MUX switch.
* Firmware: |fwupdmgr get-updates| reports all firmware (EC/BIOS/etc.)
    up to date, no updates available.
* Kernel: reproduced on both current CachyOS kernel (7.2.6-1) and LTS
    (6.18.52-1).
* linux-firmware: current as of report date.
* xhci_hcd.quirks=0x2 (reset-on-resume) kernel parameter: no effect,
    identical failure pattern.
* Driver binding: |lspci -nnk| confirms all Panther Lake controllers
    (xe, thunderbolt, xhci_hcd, iwlwifi, etc.) have their expected
    kernel driver bound; no unbound devices found.


lspci output for the affected controller

0000:00:0d.0 USB controller [0c03]: Intel Corporation Core Ultra 
Processors (Series 3) Type-C Subsystem xHCI [8086:e331] Kernel driver in 
use: xhci_hcd


Request

Given that the error is consistently tied to the higher-bandwidth mode 
(4K@60Hz, which pushes more sustained DP AUX/HPD and USB traffic through 
this specific Type-C xHCI controller) and reproduces identically 
regardless of GPU/driver backing the DP output, this looks like it could 
be a Panther Lake-specific xHCI/Type-C subsystem timing or 
power-negotiation issue rather than a cable or userspace configuration 
problem. Happy to provide additional logs (full dmesg, usbmon capture, 
lsusb -v) on request.

Reporter: (Rodolfo Semprevivo/rodolfo@semprevivo.ch)

