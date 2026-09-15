Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327C3612E8
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 05:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789448754; cv=none; b=eOywMtnRjU6JefEWkM+Bqi0bT9DGMbbxVeucIJGEn7jwHB0AVl2mJ0JNDfN1bBO+i7wj82xsyrl6N/vS+au33LS3jeT3ZMm4Ve2cVQ31K6RMGdImwdTO1+QeAfeXxI8HKn6QX2vgQXWJ+SHFVRkabyWgwgeqeQ8za2gMzC3FlOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789448754; c=relaxed/simple;
	bh=u1sl2+c/ofm3QmnVDDZO8c4sAtBuuNSPc6HsG1WxXzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv14tWQdbMzqL+V8k/9FpfccB9bHSIUnvXlz04Vw1oqDlErcs4vcHBFjXIxWp/Ycp26W9VO8VyXkZ8biIgcfVUzKNsPKBPSeVpQxZfLMIaxGltvnzDH7/sEN0c8QAYUR9uyJAFxfOxgXkAKLe1u6/4MgEgaV7OGEbjMO3l0TA1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOtOUGdF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOtOUGdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789448722; x=1820984722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u1sl2+c/ofm3QmnVDDZO8c4sAtBuuNSPc6HsG1WxXzI=;
  b=UOtOUGdFXmovlSEHkb7caazmQ1XjMfk87yuuzgYyQ9p5w564MoYlOXtm
   Gc8ZFpRMAD/piZaABIwmjzgwrYFnVvA9wN2WmmzLuLmLgrSLTYSAwAUSI
   M46FYhtzaT9lb9lLxyqFgWlZpkih6TYipNgIAoi7fdEkw0704i86mKSNN
   Fbyj8hbRvSnALByzeagAeMwwEI6HFJl+J0rXriz/NmDiizxiuDDu51VBX
   GNk4T2px2naye+2G2tWZ0idPj6xCPLy8khGOk/mG/ryjXxzMlqPwUmaqJ
   bF0Y8aEZUqYT8K/4umL4ltLFd3bVx05Ze2ZfsCgZSzKPTehL8YgcxFHbq
   w==;
X-CSE-ConnectionGUID: 8NttFJZzT2m9KSIk3PYwDA==
X-CSE-MsgGUID: J6azixTfSXyRjnjfwefL+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100129427"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100129427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:05:20 -0700
X-CSE-ConnectionGUID: muUE9wroTYOPCPqIE1eaBg==
X-CSE-MsgGUID: K4/9gQYATn+tjj5vVoT6ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276368518"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 14 Sep 2026 22:05:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 02F4499; Tue, 15 Sep 2026 07:05:15 +0200 (CEST)
Date: Tue, 15 Sep 2026 07:05:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ben <benstaples10@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260915050515.GI106095@black.igk.intel.com>
References: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>
 <20260915041958.GE106095@black.igk.intel.com>
 <CANcA1gC3cEuuK1OJkeq44ZZ_7uZZN=ZDkOJH0L-ERUNQcgZ12g@mail.gmail.com>
 <20260915043845.GG106095@black.igk.intel.com>
 <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>

Hi,

Thanks! Okay so now it looks better. I see the PCIe root port has enough
resources and they are shared by the Maple Ridge controller. However, looks
like the BIOS allocations to the device behind (Goshen Ridge) are not
enough.

Now two things. First, if  you connect the CalDigit dock after the system
has been booted up, does it get all the resources now? In this case Linux
does the resource allocation.

Second thing is that if you connect the dock using TB4 cable you should not
even see the xHCI on the dock because USB3 is tunneled over so the
SuperSpeed devices should show up in the lsusb output and in this case if
there are no real PCIe device that you actually need this should be
"working". This only happens the link is "USB4" so if you use active TB3
cable that will not be the case.


On Tue, Sep 15, 2026 at 12:46:35AM -0400, Ben wrote:
> Mika, 
> 
> My bad. 
> Corrected. 
> 
> Ben
> 
> On Tue, Sep 15, 2026 at 12:38 AM Mika Westerberg <
> mika.westerberg@linux.intel.com> wrote:
> 
>     Hi,
> 
>     There's a typo in the command line should be "thunderbolt.dyndbg=+p".
> 
>     On Tue, Sep 15, 2026 at 12:27:03AM -0400, Ben wrote:
>     > Mika,
>     >
>     > Here's an updated capture on the mainline kernel.
>     >
>     > Best,
>     > Ben
>     >
>     > On Tue, Sep 15, 2026 at 12:20 AM Mika Westerberg <
>     > mika.westerberg@linux.intel.com> wrote:
>     >
>     >     Hi,
>     >
>     >     On Tue, Sep 15, 2026 at 12:04:34AM -0400, Ben wrote:
>     >     > Hello,
>     >     >
>     >     > Long and short of it is that my Caldigit TB4 dock is not working
>     properly
>     >     with
>     >     > my modern linux desktop setup that has thunderbolt enabled by
>     installing
>     >     a PCIE
>     >     > card. It's able to drive two 1440p displays fine, but USB is not
>     >     functioning at
>     >     > all. USB does work with another machine so I'm sure it's not the
>     dock.  
>     >     >
>     >     > I have done a lot of investigation over the last two nights, and I
>     >     figured that
>     >     > y'all would be the people to send the results to (though there is a
>     >     terribly
>     >     > large amount of stuff I'm sending)
>     >     >
>     >     > Attached are reports generated immediately after boot on various
>     kernels
>     >     and a
>     >     > writeup of what I've done to try and work around the issue. 
>     >     >
>     >     > Best,
>     >     > Ben
>     >
>     >     > ############################################
>     >     > # Captured: Tue Sep 15 03:19:04 AM UTC 2026
>     >     > ############################################
>     >     >
>     >     > === uname -r ===
>     >     > 7.3.0-rc2-1-cachyos-rc
>     >     >
>     >     > === uname -a ===
>     >     > Linux moomooPC-cachy 7.3.0-rc2-1-cachyos-rc #1 SMP PREEMPT_DYNAMIC
>     Fri,
>     >     11 Sep 2026 06:51:19 +0000 x86_64 GNU/Linux
>     >     >
>     >     > === /proc/cmdline ===
>     >     > initrd=\initramfs-linux-cachyos-rc.img root=UUID=
>     >     a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 rw rootflags=subvol=/@
>     zswap.enabled=0
>     >     nowatchdog quiet pcie_aspm=off iommu=soft usbcore.autosuspend=-1
>     >     thunderbolt.d3cold=0 thunderbolt.host_reset=0
>     >     >
>     >
>     >     Please drop all the non-default command line options. For instance
>     >     pcie_aspm=off goes and disables whole native PCIe support. I have
>     never
>     >     seen thunderbolt.d3cold so must be something not in the mainline.
>     >
>     >     Once that is done then at least PCIe should be working. However, if
>     this is
>     >     a PCIe add-in-card you need to have BIOS support for this too to add
>     the
>     >     "power contract" in order to keep the tunnels after PM transitions.
>     But
>     >     let's see the full dmesg after you have dropped all the non-default
>     command
>     >     line options first.
>     >
>     >     But you can still add "thunderbolt.dyndbg=+p" so we can see what is
>     going
>     >     on.
>     >
> 
>     > ############################################
>     > # Captured: Tue Sep 15 04:24:51 AM UTC 2026
>     > ############################################
>     >
>     > === uname -r ===
>     > 7.3.0-rc2-1-mainline
>     >
>     > === uname -a ===
>     > Linux moomooPC-cachy 7.3.0-rc2-1-mainline #1 SMP PREEMPT_DYNAMIC Tue, 15
>     Sep 2026 02:32:12 +0000 x86_64 GNU/Linux
>     >
>     > === /proc/cmdline ===
>     > initrd=\initramfs-linux-mainline.img root=UUID=
>     a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 rw rootflags=subvol=/@ zswap.enabled=0
>     nowatchdog quiet thunderbolt.dynbg=+p
>     >
>     > === bootctl status (bootloader / active entry) ===
>     > System:
>     >       Firmware: UEFI 2.90 (American Megatrends 5.26)
>     >  Firmware Arch: x64
>     >    Secure Boot: disabled
>     >   TPM2 Support: yes
>     >   Measured UKI: no
>     >    Measured OS: no
>     >   Boot into FW: supported
>     >  Platform Lang: en_US.UTF-8
>     >
>     > Current Boot Loader:
>     >         Product: systemd-boot 261.3-1-arch
>     >        Features: ✓ Boot counting
>     >                  ✓ Menu timeout control
>     >                  ✓ One-shot menu timeout control
>     >                  ✓ Default entry control
>     >                  ✓ One-shot entry control
>     >                  ✓ Support for XBOOTLDR partition
>     >                  ✓ Support for passing random seed to OS
>     >                  ✓ Load drop-in drivers
>     >                  ✓ Support Type #1 sort-key field
>     >                  ✓ Support @saved pseudo-entry
>     >                  ✓ Support Type #1 devicetree field
>     >                  ✓ Enroll SecureBoot keys
>     >                  ✓ Retain SHIM protocols
>     >                  ✓ Menu can be disabled
>     >                  ✓ Multi-Profile UKIs are supported
>     >                  ✓ Loader reports network boot URL
>     >                  ✓ Support Type #1 uki field
>     >                  ✓ Support Type #1 uki-url field
>     >                  ✓ Loader reports active TPM2 PCR banks
>     >                  ✓ Loader reports firmware keyboard layout
>     >                  ✓ Loader measures SMBIOS information
>     >       Partition: /dev/disk/by-partuuid/
>     96ac16a9-6809-407c-9f2b-2d422147eb1a
>     >          Loader: └─/boot//EFI/BOOT/BOOTX64.EFI
>     > Keyboard Layout: n/a (not reported by firmware)
>     >   Current Entry: linux-mainline.conf
>     >
>     > Random Seed:
>     >  System Token: set
>     >        Exists: yes
>     >
>     > Available Boot Loaders on ESP:
>     >           ESP: /boot (/dev/disk/by-partuuid/
>     96ac16a9-6809-407c-9f2b-2d422147eb1a)
>     >          File: ├─/boot//EFI/systemd/systemd-boot-fallbackx64.efi
>     (systemd-boot 261.2-1-arch)
>     >                ├─/boot//EFI/systemd/systemd-bootx64.efi (systemd-boot
>     261.3-1-arch)
>     >                └─/boot//EFI/BOOT/BOOTX64.EFI (systemd-boot 261.3-1-arch)
>     >
>     > Boot Loaders Listed in EFI Variables:
>     >         Title: UEFI OS
>     >            ID: 0x0001
>     >        Status: active, boot-order
>     >     Partition: /dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a
>     >          File: └─/boot//EFI/BOOT/BOOTX64.EFI
>     >
>     >         Title: Linux Boot Manager
>     >            ID: 0x0000
>     >        Status: active, boot-order
>     >     Partition: /dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a
>     >          File: └─/boot//EFI/systemd/systemd-bootx64.efi
>     >
>     >         Title: Fallback Linux Boot Manager
>     >            ID: 0x0002
>     >        Status: active, boot-order
>     >     Partition: /dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a
>     >          File: └─/boot//EFI/systemd/systemd-boot-fallbackx64.efi
>     >
>     > Boot Loader Entry Locations:
>     >           ESP: /boot (/dev/disk/by-partuuid/
>     96ac16a9-6809-407c-9f2b-2d422147eb1a, $BOOT)
>     >        config: /boot//loader/loader.conf
>     >         token: cachyos
>     >
>     > Default Boot Loader Entry:
>     >          type: Boot Loader Specification Type #1 (.conf)
>     >         title: Linux
>     >            id: linux.conf
>     >        source: /boot//loader/entries/linux.conf (on the EFI System
>     Partition)
>     >         linux: /boot//vmlinuz-linux
>     >        initrd: /boot//initramfs-linux.img
>     >       options: root=UUID=a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 rw
>     rootflags=subvol=/@ zswap.enabled=0 nowatchdog quiet pcie_aspm=off iommu=
>     soft usbcore.autosuspend=-1 thunderbolt.d3cold=0 thunderbolt.host_reset=0
>     >
>     > === boltctl list ===
>     >  * CalDigit, Inc. TS4
>     >    |- type:          peripheral
>     >    |- name:          TS4
>     >    |- vendor:        CalDigit, Inc.
>     >    |- uuid:          6bfd8780-0027-b0bc-ffff-ffffffffffff
>     >    |- generation:    USB4
>     >    |- status:        authorized
>     >    |  |- domain:     d3fb8780-004a-2159-ffff-ffffffffffff
>     >    |  |- rx speed:   40 Gb/s = 2 lanes * 20 Gb/s
>     >    |  |- tx speed:   40 Gb/s = 2 lanes * 20 Gb/s
>     >    |  `- authflags:  boot
>     >    |- authorized:    Tue 15 Sep 2026 04:24:10 AM UTC
>     >    |- connected:     Tue 15 Sep 2026 04:24:10 AM UTC
>     >    `- stored:        Sun 13 Sep 2026 11:02:17 PM UTC
>     >       |- policy:     iommu
>     >       `- key:        no
>     >
>     >
>     > === Thunderbolt NVM versions ===
>     > /sys/bus/thunderbolt/devices/0-0/nvm_version: 43.83
>     > /sys/bus/thunderbolt/devices/0-1/nvm_version: 45.83
>     >
>     > === lspci -tv (tree) ===
>     > -[0000:00]-+-00.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Root Complex
>     >            +-00.2  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge IOMMU
>     >            +-01.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >            +-01.1-[01-03]----00.0-[02-03]----00.0-[03]--+-00.0  Advanced
>     Micro Devices, Inc. [AMD/ATI] Navi 22 [Radeon RX 6700/6700 XT/6750 XT /
>     6800M/6850M XT]
>     >            |                                            \-00.1  Advanced
>     Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller
>     >            +-01.2-[04]----00.0  Sandisk Corp WD SN560/SN740/SN770/SN5000
>     NVMe SSD
>     >            +-02.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >            +-02.1-[05-6e]----00.0-[06-6e]--+-00.0-[07-68]----00.0-[08-68]
>     --+-00.0-[09]----00.0  Intel Corporation Thunderbolt 4 NHI [Maple Ridge 4C
>     2020]
>     >            |                               |                             
>      +-01.0-[0a-38]----00.0-[0b-10]--+-00.0-[0c]----00.0  Intel Corporation
>     Thunderbolt 4 USB Controller [Goshen Ridge 2020]
>     >            |                               |                             
>      |                               +-01.0-[0d]--
>     >            |                               |                             
>      |                               +-02.0-[0e]--
>     >            |                               |                             
>      |                               +-03.0-[0f]--
>     >            |                               |                             
>      |                               \-04.0-[10]----00.0  Intel Corporation
>     Ethernet Controller (2) I225-LMvP
>     >            |                               |                             
>      +-02.0-[39]----00.0  Intel Corporation Thunderbolt 4 USB Controller [Maple
>     Ridge 4C 2020]
>     >            |                               |                             
>      \-03.0-[3a-68]--
>     >            |                               +-08.0-[69]--
>     >            |                               +-09.0-[6a]--
>     >            |                               +-0a.0-[6b]----00.0  Realtek
>     Semiconductor Co., Ltd. RTL8125 2.5GbE Controller
>     >            |                               +-0b.0-[6c]----00.0  Realtek
>     Semiconductor Co., Ltd. RTL8852BE PCIe 802.11ax Wireless Network Controller
>     >            |                               +-0c.0-[6d]----00.0  Advanced
>     Micro Devices, Inc. [AMD] 600 Series Chipset USB 3.2 Controller
>     >            |                               \-0d.0-[6e]----00.0  Advanced
>     Micro Devices, Inc. [AMD] 600 Series Chipset SATA Controller
>     >            +-03.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >            +-04.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >            +-08.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >            +-08.1-[6f]--+-00.0  Advanced Micro Devices, Inc. [AMD/ATI]
>     Raphael
>     >            |            +-00.1  Advanced Micro Devices, Inc. [AMD/ATI]
>     Radeon High Definition Audio Controller
>     >            |            +-00.2  Advanced Micro Devices, Inc. [AMD] Family
>     19h PSP/CCP
>     >            |            +-00.3  Advanced Micro Devices, Inc. [AMD]
>     Raphael/Granite Ridge USB 3.1 xHCI
>     >            |            +-00.4  Advanced Micro Devices, Inc. [AMD]
>     Raphael/Granite Ridge USB 3.1 xHCI
>     >            |            \-00.6  Advanced Micro Devices, Inc. [AMD] Ryzen
>     HD Audio Controller
>     >            +-08.3-[70]----00.0  Advanced Micro Devices, Inc. [AMD]
>     Raphael/Granite Ridge USB 2.0 xHCI
>     >            +-14.0  Advanced Micro Devices, Inc. [AMD] FCH SMBus
>     Controller
>     >            +-14.3  Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge
>     >            +-18.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 0
>     >            +-18.1  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 1
>     >            +-18.2  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 2
>     >            +-18.3  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 3
>     >            +-18.4  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 4
>     >            +-18.5  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 5
>     >            +-18.6  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 6
>     >            \-18.7  Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 7
>     >
>     > === power/control state for relevant PCI devices ===
>     > 06:00.0: auto
>     > 06:08.0: auto
>     > 06:09.0: auto
>     > 07:00.0: auto
>     > 08:00.0: auto
>     > 08:01.0: auto
>     > 08:02.0: auto
>     > 08:03.0: auto
>     > 09:00.0: on
>     > 0a:00.0: auto
>     > 0b:00.0: auto
>     > 0b:01.0: auto
>     > 0b:02.0: auto
>     > 0b:03.0: auto
>     > 0b:04.0: auto
>     > 0c:00.0: on
>     > 6d:00.0: auto
>     >
>     > === dmesg: AER / corrected / uncorrectable check ===
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0A08:00: _OSC: OS now controls
>     [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
>     >
>     > === dmesg: xhci_hcd 0000:0c:00.0 lines ===
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: [8086:0b27] type 00 class
>     0x0c0330 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: BAR 0 [mem
>     0xc0200000-0xc020ffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: new USB bus registered,
>     assigned bus number 1
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: hcc params 0x20007fc1
>     hci version 0x110 quirks 0x0000000000009810
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: new USB bus registered,
>     assigned bus number 2
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: Host supports USB 3.1
>     Enhanced SuperSpeed
>     > [Tue Sep 15 00:23:43 2026] usb usb1: SerialNumber: 0000:0c:00.0
>     > [Tue Sep 15 00:23:43 2026] usb usb2: SerialNumber: 0000:0c:00.0
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Abort failed to stop
>     command ring: -110
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: xHCI host controller
>     not responding, assume dead
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: HC died; cleaning up
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Error while assigning
>     device slot ID: Command Aborted
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Max number of devices
>     this xHCI host supports is 64.
>     >
>     > === dmesg: full failure context (10 lines before/after abort) ===
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: SECUREDISPLAY: optional
>     securedisplay ta ucode is not available
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: smu driver if version =
>     0x0000000e, smu fw if version = 0x00000012, smu fw program = 0, smu fw
>     version = 0x00413f00 (65.63.0)
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: use vbios provided
>     pptable
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: SMU is initialized
>     successfully!
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] Display Core
>     v3.2.392 initialized on DCN 3.0
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] DP-HDMI FRL PCON
>     supported
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] DMUB hardware
>     initialized: version=0x02020022
>     > [Tue Sep 15 00:23:49 2026] workqueue: name exceeds WQ_NAME_LEN.
>     Truncating to: hdmi_frl_status_polling_workque
>     > [Tue Sep 15 00:23:51 2026] amdgpu 0000:03:00.0: kiq ring mec 2 pipe 1 q 0
>     > [Tue Sep 15 00:23:56 2026] clocksource: Watchdog remote CPU 9 read timed
>     out
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Abort failed to stop
>     command ring: -110
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: xHCI host controller
>     not responding, assume dead
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: HC died; cleaning up
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Error while assigning
>     device slot ID: Command Aborted
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Max number of devices
>     this xHCI host supports is 64.
>     > [Tue Sep 15 00:24:07 2026] usb usb1-port1: couldn't allocate usb_device
>     > [Tue Sep 15 00:24:07 2026] usb usb2-port1: couldn't allocate usb_device
>     > [Tue Sep 15 00:24:07 2026] kfd kfd: Allocated 3969056 bytes on gart
>     > [Tue Sep 15 00:24:07 2026] kfd kfd: Total number of KFD nodes to be
>     created: 1
>     > [Tue Sep 15 00:24:07 2026] amdgpu: Virtual CRAT table created for GPU
>     > [Tue Sep 15 00:24:07 2026] amdgpu: Topology: Add GPU node [0x1002:0x73df]
>     >
>     > === dmesg: FULL LOG ===
>     > [Tue Sep 15 00:23:42 2026] Linux version 7.3.0-rc2-1-mainline
>     (linux-mainline@archlinux) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
>     Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Tue, 15 Sep 2026 02:32:12 +0000
>     > [Tue Sep 15 00:23:42 2026] Command line: initrd=\
>     initramfs-linux-mainline.img root=UUID=a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7
>     rw rootflags=subvol=/@ zswap.enabled=0 nowatchdog quiet thunderbolt.dynbg=
>     +p
>     > [Tue Sep 15 00:23:42 2026] BIOS-provided physical RAM map:
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x0000000000000000-0x000000000009ffff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x00000000000a0000-0x00000000000fffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x0000000000100000-0x00000000099fefff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x00000000099ff000-0x0000000009ffffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000000a000000-0x000000000a1fffff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000000a200000-0x000000000a20ffff]  ACPI NVS
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000000a210000-0x000000000affffff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000000b000000-0x000000000b020fff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000000b021000-0x000000006abdefff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000006abdf000-0x000000007138bfff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000007138c000-0x0000000071528fff]  ACPI data
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x0000000071529000-0x0000000073528fff]  ACPI NVS
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x0000000073529000-0x00000000781fefff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x00000000781ff000-0x0000000079ff8fff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x0000000079ff9000-0x0000000079ffbfff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x0000000079ffc000-0x0000000079ffffff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000007a000000-0x000000007bffffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [gap
>     0x000000007c000000-0x000000007d7f2fff]
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000007d7f3000-0x000000007d7fffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [gap
>     0x000000007d800000-0x00000000dfffffff]
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x00000000e0000000-0x00000000efffffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [gap
>     0x00000000f0000000-0x00000000f6ffffff]
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x00000000f7000000-0x00000000ffffffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x0000000100000000-0x000000085defffff]  System RAM
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [gap
>     0x000000085df00000-0x000000085ef3ffff]
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000085ef40000-0x00000008a01fffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [gap
>     0x00000008a0200000-0x000000fcffffffff]
>     > [Tue Sep 15 00:23:42 2026] BIOS-e820: [mem
>     0x000000fd00000000-0x000000ffffffffff]  device reserved
>     > [Tue Sep 15 00:23:42 2026] NX (Execute Disable) protection: active
>     > [Tue Sep 15 00:23:42 2026] APIC: Static calls initialized
>     > [Tue Sep 15 00:23:42 2026] efi: EFI v2.9 by American Megatrends
>     > [Tue Sep 15 00:23:42 2026] efi: ACPI=0x71528000 ACPI 2.0=0x71528014
>     TPMFinalLog=0x734dd000 SMBIOS=0x77665000 SMBIOS 3.0=0x77664000 MEMATTR=
>     0x65283018 ESRT=0x67660618 RNG=0x71510f18 INITRD=0x5cbdcb98 TPMEventLog=
>     0x713d3018
>     > [Tue Sep 15 00:23:42 2026] random: crng init done
>     > [Tue Sep 15 00:23:42 2026] efi: Remove mem58: MMIO range=
>     [0xe0000000-0xefffffff] (256MB) from e820 map
>     > [Tue Sep 15 00:23:42 2026] e820: remove [mem 0xe0000000-0xefffffff]
>     device reserved
>     > [Tue Sep 15 00:23:42 2026] efi: Remove mem59: MMIO range=
>     [0xf7000000-0xfedfffff] (126MB) from e820 map
>     > [Tue Sep 15 00:23:42 2026] e820: remove [mem 0xf7000000-0xfedfffff]
>     device reserved
>     > [Tue Sep 15 00:23:42 2026] efi: Not removing mem60: MMIO range=
>     [0xfee00000-0xfee00fff] (4KB) from e820 map
>     > [Tue Sep 15 00:23:42 2026] efi: Remove mem61: MMIO range=
>     [0xfee01000-0xffffffff] (17MB) from e820 map
>     > [Tue Sep 15 00:23:42 2026] e820: remove [mem 0xfee01000-0xffffffff]
>     device reserved
>     > [Tue Sep 15 00:23:42 2026] efi: Remove mem63: MMIO range=
>     [0x880000000-0x8a01fffff] (514MB) from e820 map
>     > [Tue Sep 15 00:23:42 2026] e820: remove [mem 0x880000000-0x8a01fffff]
>     device reserved
>     > [Tue Sep 15 00:23:42 2026] DMI: SMBIOS 3.6.0 present.
>     > [Tue Sep 15 00:23:42 2026] DMI: ASUS System Product Name/TUF GAMING
>     B650-PLUS WIFI, BIOS 3886 06/24/2026
>     > [Tue Sep 15 00:23:42 2026] DMI: Memory slots populated: 2/4
>     > [Tue Sep 15 00:23:42 2026] tsc: Fast TSC calibration using PIT
>     > [Tue Sep 15 00:23:42 2026] tsc: Detected 4191.948 MHz processor
>     > [Tue Sep 15 00:23:42 2026] e820: update [mem 0x00000000-0x00000fff]
>     System RAM ==> device reserved
>     > [Tue Sep 15 00:23:42 2026] e820: remove [mem 0x000a0000-0x000fffff]
>     System RAM
>     > [Tue Sep 15 00:23:42 2026] last_pfn = 0x85df00 max_arch_pfn = 0x400000000
>     > [Tue Sep 15 00:23:42 2026] MTRR map: 5 entries (3 fixed + 2 variable; max
>     20), built from 9 variable MTRRs
>     > [Tue Sep 15 00:23:42 2026] x86/PAT: Configuration [0-7]: WB  WC  UC- UC 
>     WB  WP  UC- WT 
>     > [Tue Sep 15 00:23:42 2026] e820: update [mem 0x80000000-0xffffffff]
>     System RAM ==> device reserved
>     > [Tue Sep 15 00:23:42 2026] last_pfn = 0x7a000 max_arch_pfn = 0x400000000
>     > [Tue Sep 15 00:23:42 2026] esrt: Reserving ESRT space from
>     0x0000000067660618 to 0x00000000676606a0.
>     > [Tue Sep 15 00:23:42 2026] e820: update [mem 0x67660000-0x67660fff]
>     System RAM ==> device reserved
>     > [Tue Sep 15 00:23:42 2026] Using GB pages for direct mapping
>     > [Tue Sep 15 00:23:42 2026] Secure boot disabled
>     > [Tue Sep 15 00:23:42 2026] RAMDISK: [mem 0x54287000-0x57661fff]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Early table checksum verification
>     disabled
>     > [Tue Sep 15 00:23:42 2026] ACPI: RSDP 0x0000000071528014 000024 (v02
>     ALASKA)
>     > [Tue Sep 15 00:23:42 2026] ACPI: XSDT 0x0000000071527728 00010C (v01
>     ALASKA A M I    01072009 AMI  01000013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: FACP 0x000000007151C000 000114 (v06
>     ALASKA A M I    01072009 AMI  00010013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: DSDT 0x00000000714FA000 011FC5 (v02
>     ALASKA A M I    01072009 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: FACS 0x000000007350D000 000040
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x000000007151E000 008689 (v02 AMD 
>       Splinter 00000002 MSFT 04000000)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x000000007151D000 000221 (v02
>     ALASKA CPUSSDT  01072009 AMI  01072009)
>     > [Tue Sep 15 00:23:42 2026] ACPI: FIDT 0x0000000071511000 00009C (v01
>     ALASKA A M I    01072009 AMI  00010013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: MCFG 0x000000007150F000 00003C (v01
>     ALASKA A M I    01072009 MSFT 00010013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: HPET 0x000000007150E000 000038 (v01
>     ALASKA A M I    01072009 AMI  00000005)
>     > [Tue Sep 15 00:23:42 2026] ACPI: WDRT 0x000000007150D000 000047 (v01
>     ALASKA A M I    01072009 AMI  00000005)
>     > [Tue Sep 15 00:23:42 2026] ACPI: FPDT 0x000000007150C000 000044 (v01
>     ALASKA A M I    01072009 AMI  01000013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: VFCT 0x00000000714E4000 015CA0 (v01
>     ALASKA A M I    00000001 AMD  31504F47)
>     > [Tue Sep 15 00:23:42 2026] ACPI: BGRT 0x000000007151B000 000038 (v01
>     ALASKA A M I    01072009 AMI  00010013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: WPBT 0x0000000071519000 000040 (v01
>     ALASKA A M I    00000001 ASUS 00000001)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x0000000071514000 004DEE (v02 AMD 
>       AMD CPU  00000001 AMD  00000001)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x0000000071513000 000041 (v02 AMD 
>       AppCompD 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x0000000071512000 000567 (v02 AMD 
>       ASUSPLDR 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713FB000 00161D (v02 AMD 
>       CPMTBASL 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713F9000 0016A6 (v02 AMD 
>       CPMDFIG2 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713F6000 002AAE (v02 AMD 
>       CDFAAIG2 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713F5000 0008C2 (v02 AMD 
>       CPMDFDG2 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713EA000 00A724 (v02 AMD 
>       CPMCMN   00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713E7000 0028C1 (v02 AMD 
>       AOD      00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: TPM2 0x00000000713E6000 00004C (v04
>     ALASKA A M I    00000001 AMI  00000000)
>     > [Tue Sep 15 00:23:42 2026] ACPI: WSMT 0x00000000713E5000 000028 (v01
>     ALASKA A M I    01072009 AMI  00010013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: APIC 0x00000000713E4000 00015E (v06
>     ALASKA A M I    01072009 AMI  00010013)
>     > [Tue Sep 15 00:23:42 2026] ACPI: IVRS 0x00000000713E3000 0000C8 (v02 AMD 
>       AmdTable 00000001 AMD  00000001)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713E2000 000508 (v02 AMD 
>       MEMTOOL0 00000002 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713E1000 0009EE (v02 AMD 
>       CPMMSOSC 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713E0000 000484 (v02 AMD 
>       AMDWOV   00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713DF000 000546 (v02 AMD 
>       CPMAPMFD 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: SSDT 0x00000000713DE000 00087A (v02 AMD 
>       AmdTable 00000001 INTL 20230331)
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving FACP table memory at [mem
>     0x7151c000-0x7151c113]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving DSDT table memory at [mem
>     0x714fa000-0x7150bfc4]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving FACS table memory at [mem
>     0x7350d000-0x7350d03f]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x7151e000-0x71526688]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x7151d000-0x7151d220]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving FIDT table memory at [mem
>     0x71511000-0x7151109b]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving MCFG table memory at [mem
>     0x7150f000-0x7150f03b]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving HPET table memory at [mem
>     0x7150e000-0x7150e037]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving WDRT table memory at [mem
>     0x7150d000-0x7150d046]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving FPDT table memory at [mem
>     0x7150c000-0x7150c043]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving VFCT table memory at [mem
>     0x714e4000-0x714f9c9f]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving BGRT table memory at [mem
>     0x7151b000-0x7151b037]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving WPBT table memory at [mem
>     0x71519000-0x7151903f]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x71514000-0x71518ded]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x71513000-0x71513040]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x71512000-0x71512566]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713fb000-0x713fc61c]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713f9000-0x713fa6a5]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713f6000-0x713f8aad]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713f5000-0x713f58c1]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713ea000-0x713f4723]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713e7000-0x713e98c0]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving TPM2 table memory at [mem
>     0x713e6000-0x713e604b]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving WSMT table memory at [mem
>     0x713e5000-0x713e5027]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving APIC table memory at [mem
>     0x713e4000-0x713e415d]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving IVRS table memory at [mem
>     0x713e3000-0x713e30c7]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713e2000-0x713e2507]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713e1000-0x713e19ed]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713e0000-0x713e0483]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713df000-0x713df545]
>     > [Tue Sep 15 00:23:42 2026] ACPI: Reserving SSDT table memory at [mem
>     0x713de000-0x713de879]
>     > [Tue Sep 15 00:23:42 2026] No NUMA configuration found
>     > [Tue Sep 15 00:23:42 2026] Faking a node at [mem
>     0x0000000000000000-0x000000085defffff]
>     > [Tue Sep 15 00:23:42 2026] NODE_DATA(0) allocated [mem
>     0x85ded4f80-0x85defffff]
>     > [Tue Sep 15 00:23:42 2026] ACPI: PM-Timer IO Port: 0x808
>     > [Tue Sep 15 00:23:42 2026] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint
>     [0x1])
>     > [Tue Sep 15 00:23:42 2026] IOAPIC[0]: apic_id 32, version 33, address
>     0xfec00000, GSI 0-23
>     > [Tue Sep 15 00:23:42 2026] IOAPIC[1]: apic_id 33, version 33, address
>     0xfec01000, GSI 24-55
>     > [Tue Sep 15 00:23:42 2026] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq
>     2 dfl dfl)
>     > [Tue Sep 15 00:23:42 2026] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq
>     9 low level)
>     > [Tue Sep 15 00:23:42 2026] ACPI: Using ACPI (MADT) for SMP configuration
>     information
>     > [Tue Sep 15 00:23:42 2026] ACPI: HPET id: 0x10228201 base: 0xfed00000
>     > [Tue Sep 15 00:23:42 2026] e820: update [mem 0x648f1000-0x64aa1fff]
>     System RAM ==> device reserved
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Max. logical packages:   1
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Max. logical nodes:      1
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Num. nodes per package:  1
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Max. logical dies:       1
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Max. dies per package:   1
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Max. threads per core:   2
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Num. cores per package:     8
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Num. threads per package:  16
>     > [Tue Sep 15 00:23:42 2026] CPU topo: Allowing 16 present CPUs plus 0
>     hotplug CPUs
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x00000000-0x00000fff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x000a0000-0x000fffff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x099ff000-0x09ffffff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x0a200000-0x0a20ffff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x0b000000-0x0b020fff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x648f1000-0x64aa1fff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x67660000-0x67660fff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x6abdf000-0x781fefff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x79ff9000-0x79ffbfff]
>     > [Tue Sep 15 00:23:42 2026] PM: hibernation: Registered nosave memory:
>     [mem 0x7a000000-0xffffffff]
>     > [Tue Sep 15 00:23:42 2026] [gap 0x7d800000-0xfedfffff] available for PCI
>     devices
>     > [Tue Sep 15 00:23:42 2026] Booting paravirtualized kernel on bare
>     hardware
>     > [Tue Sep 15 00:23:42 2026] clocksource: refined-jiffies: mask: 0xffffffff
>     max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
>     > [Tue Sep 15 00:23:42 2026] Zone ranges:
>     > [Tue Sep 15 00:23:42 2026]   DMA      [mem
>     0x0000000000001000-0x0000000000ffffff]
>     > [Tue Sep 15 00:23:42 2026]   DMA32    [mem
>     0x0000000001000000-0x00000000ffffffff]
>     > [Tue Sep 15 00:23:42 2026]   Normal   [mem
>     0x0000000100000000-0x000000085defffff]
>     > [Tue Sep 15 00:23:42 2026]   Device   empty
>     > [Tue Sep 15 00:23:42 2026] Movable zone start for each node
>     > [Tue Sep 15 00:23:42 2026] Early memory node ranges
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x0000000000001000-0x000000000009ffff]
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x0000000000100000-0x00000000099fefff]
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x000000000a000000-0x000000000a1fffff]
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x000000000a210000-0x000000000affffff]
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x000000000b021000-0x000000006abdefff]
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x00000000781ff000-0x0000000079ff8fff]
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x0000000079ffc000-0x0000000079ffffff]
>     > [Tue Sep 15 00:23:42 2026]   node   0: [mem
>     0x0000000100000000-0x000000085defffff]
>     > [Tue Sep 15 00:23:42 2026] Initmem setup node 0 [mem
>     0x0000000000001000-0x000000085defffff]
>     > [Tue Sep 15 00:23:42 2026] On node 0, zone DMA: 1 pages in unavailable
>     ranges
>     > [Tue Sep 15 00:23:42 2026] On node 0, zone DMA: 96 pages in unavailable
>     ranges
>     > [Tue Sep 15 00:23:42 2026] On node 0, zone DMA32: 1537 pages in
>     unavailable ranges
>     > [Tue Sep 15 00:23:42 2026] On node 0, zone DMA32: 16 pages in unavailable
>     ranges
>     > [Tue Sep 15 00:23:42 2026] On node 0, zone DMA32: 33 pages in unavailable
>     ranges
>     > [Tue Sep 15 00:23:42 2026] On node 0, zone DMA32: 22048 pages in
>     unavailable ranges
>     > [Tue Sep 15 00:23:42 2026] On node 0, zone DMA32: 3 pages in unavailable
>     ranges
>     > [Tue Sep 15 00:23:43 2026] On node 0, zone Normal: 24576 pages in
>     unavailable ranges
>     > [Tue Sep 15 00:23:43 2026] On node 0, zone Normal: 8448 pages in
>     unavailable ranges
>     > [Tue Sep 15 00:23:43 2026] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16
>     nr_cpu_ids:16 nr_node_ids:1
>     > [Tue Sep 15 00:23:43 2026] percpu: Embedded 64 pages/cpu s225280 r8192
>     d28672 u262144
>     > [Tue Sep 15 00:23:43 2026] pcpu-alloc: s225280 r8192 d28672 u262144 alloc
>     =1*2097152
>     > [Tue Sep 15 00:23:43 2026] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08
>     09 10 11 12 13 14 15
>     > [Tue Sep 15 00:23:43 2026] Kernel command line: initrd=\
>     initramfs-linux-mainline.img root=UUID=a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7
>     rw rootflags=subvol=/@ zswap.enabled=0 nowatchdog quiet thunderbolt.dynbg=
>     +p
>     > [Tue Sep 15 00:23:43 2026] printk: log buffer data + meta data: 131072 +
>     557056 = 688128 bytes
>     > [Tue Sep 15 00:23:43 2026] Dentry cache hash table entries: 4194304
>     (order: 13, 33554432 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] Inode-cache hash table entries: 2097152
>     (order: 12, 16777216 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] software IO TLB: area num 16.
>     > [Tue Sep 15 00:23:43 2026] Fallback order for Node 0: 0
>     > [Tue Sep 15 00:23:43 2026] Built 1 zonelists, mobility grouping on. 
>     Total pages: 8168010
>     > [Tue Sep 15 00:23:43 2026] Policy zone: Normal
>     > [Tue Sep 15 00:23:43 2026] mem auto-init: stack:all(zero), heap alloc:on,
>     heap free:off
>     > [Tue Sep 15 00:23:43 2026] SLUB: HWalign=64, Order=0-3, MinObjects=0,
>     CPUs=16, Nodes=1
>     > [Tue Sep 15 00:23:43 2026] ftrace: allocating 59266 entries in 232 pages
>     > [Tue Sep 15 00:23:43 2026] ftrace: allocated 232 pages with 4 groups
>     > [Tue Sep 15 00:23:43 2026] Dynamic Preempt: full
>     > [Tue Sep 15 00:23:43 2026] rcu: Preemptible hierarchical RCU
>     implementation.
>     > [Tue Sep 15 00:23:43 2026] rcu:       RCU restricting CPUs from NR_CPUS=
>     8192 to nr_cpu_ids=16.
>     > [Tue Sep 15 00:23:43 2026] rcu:       RCU priority boosting: priority 1
>     delay 500 ms.
>     > [Tue Sep 15 00:23:43 2026]    Trampoline variant of Tasks RCU enabled.
>     > [Tue Sep 15 00:23:43 2026]    Rude variant of Tasks RCU enabled.
>     > [Tue Sep 15 00:23:43 2026]    Tracing variant of Tasks RCU enabled.
>     > [Tue Sep 15 00:23:43 2026] rcu: RCU calculated value of
>     scheduler-enlistment delay is 100 jiffies.
>     > [Tue Sep 15 00:23:43 2026] rcu: Adjusting geometry for rcu_fanout_leaf=
>     16, nr_cpu_ids=16
>     > [Tue Sep 15 00:23:43 2026] RCU Tasks: Setting shift to 4 and lim to 1
>     rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
>     > [Tue Sep 15 00:23:43 2026] RCU Tasks Rude: Setting shift to 4 and lim to
>     1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
>     > [Tue Sep 15 00:23:43 2026] NR_IRQS: 524544, nr_irqs: 1096, preallocated
>     irqs: 16
>     > [Tue Sep 15 00:23:43 2026] rcu: srcu_init: Setting srcu_struct sizes
>     based on contention.
>     > [Tue Sep 15 00:23:43 2026] clocksource: jiffies: mask: 0xffffffff
>     max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
>     > [Tue Sep 15 00:23:43 2026] kfence: initialized - using 2097152 bytes for
>     255 objects at 0x(____ptrval____)-0x(____ptrval____)
>     > [Tue Sep 15 00:23:43 2026] Console: colour dummy device 80x25
>     > [Tue Sep 15 00:23:43 2026] printk: legacy console [tty0] enabled
>     > [Tue Sep 15 00:23:43 2026] ACPI: Core revision 20260408
>     > [Tue Sep 15 00:23:43 2026] clocksource: hpet: mask: 0xffffffff
>     max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
>     > [Tue Sep 15 00:23:43 2026] APIC: Switch to symmetric I/O mode setup
>     > [Tue Sep 15 00:23:43 2026] AMD-Vi: Using global IVHD
>     EFR:0x246577efa2254afa, EFR2:0x0
>     > [Tue Sep 15 00:23:43 2026] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1
>     pin2=-1
>     > [Tue Sep 15 00:23:43 2026] clocksource: tsc-early: mask:
>     0xffffffffffffffff max_cycles: 0x3c6caace422, max_idle_ns: 440795264558 ns
>     > [Tue Sep 15 00:23:43 2026] Calibrating delay loop (skipped), value
>     calculated using timer frequency.. 8383.89 BogoMIPS (lpj=4191948)
>     > [Tue Sep 15 00:23:43 2026] x86/cpu: User Mode Instruction Prevention
>     (UMIP) activated
>     > [Tue Sep 15 00:23:43 2026] LVT offset 1 assigned for vector 0xf9
>     > [Tue Sep 15 00:23:43 2026] LVT offset 2 assigned for vector 0xf4
>     > [Tue Sep 15 00:23:43 2026] Last level iTLB entries: 4KB 512, 2MB 512, 4MB
>     256
>     > [Tue Sep 15 00:23:43 2026] Last level dTLB entries: 4KB 3072, 2MB 3072,
>     4MB 1536, 1GB 0
>     > [Tue Sep 15 00:23:43 2026] process: using mwait in idle threads
>     > [Tue Sep 15 00:23:43 2026] mitigations: Enabled attack vectors:
>     user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
>     > [Tue Sep 15 00:23:43 2026] Speculative Store Bypass: Mitigation:
>     Speculative Store Bypass disabled via prctl
>     > [Tue Sep 15 00:23:43 2026] Transient Scheduler Attacks: Mitigation: Clear
>     CPU buffers
>     > [Tue Sep 15 00:23:43 2026] Spectre V2 : Mitigation: Enhanced / Automatic
>     IBRS
>     > [Tue Sep 15 00:23:43 2026] Spectre V2 : User space: Mitigation: STIBP
>     always-on protection
>     > [Tue Sep 15 00:23:43 2026] Speculative Return Stack Overflow: Mitigation:
>     Safe RET
>     > [Tue Sep 15 00:23:43 2026] VMSCAPE: Mitigation: IBPB before exit to
>     userspace
>     > [Tue Sep 15 00:23:43 2026] Spectre V1 : Mitigation: usercopy/swapgs
>     barriers and __user pointer sanitization
>     > [Tue Sep 15 00:23:43 2026] Spectre V2 : Enabling IBPB for BPF
>     > [Tue Sep 15 00:23:43 2026] Spectre V2 : mitigation: Enabling conditional
>     Indirect Branch Prediction Barrier
>     > [Tue Sep 15 00:23:43 2026] active return thunk: srso_alias_return_thunk
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x001: 'x87
>     floating point registers'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
>     registers'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
>     registers'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x020:
>     'AVX-512 opmask'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x040:
>     'AVX-512 Hi256'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x080:
>     'AVX-512 ZMM_Hi256'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x200:
>     'Protection Keys User registers'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x800:
>     'Control-flow User registers'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Supporting XSAVE feature 0x1000:
>     'Control-flow Kernel registers (KVM only)'
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: xstate_offset[2]:  576, xstate_sizes
>     [2]:  256
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: xstate_offset[5]:  832, xstate_sizes
>     [5]:   64
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: xstate_offset[6]:  896, xstate_sizes
>     [6]:  512
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: xstate_offset[7]: 1408, xstate_sizes
>     [7]: 1024
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: xstate_offset[9]: 2432, xstate_sizes
>     [9]:    8
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: xstate_offset[11]: 2440, xstate_sizes
>     [11]:   16
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: xstate_offset[12]: 2456, xstate_sizes
>     [12]:   24
>     > [Tue Sep 15 00:23:43 2026] x86/fpu: Enabled xstate features 0x1ae7,
>     context size is 2480 bytes, using 'compacted' format.
>     > [Tue Sep 15 00:23:43 2026] pid_max: default: 32768 minimum: 301
>     > [Tue Sep 15 00:23:43 2026] landlock: Up and running.
>     > [Tue Sep 15 00:23:43 2026] Yama: becoming mindful.
>     > [Tue Sep 15 00:23:43 2026] LSM support for eBPF active
>     > [Tue Sep 15 00:23:43 2026] Mount-cache hash table entries: 65536 (order:
>     7, 524288 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] Mountpoint-cache hash table entries: 65536
>     (order: 7, 524288 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] VFS: Finished mounting rootfs on nullfs
>     > [Tue Sep 15 00:23:43 2026] smpboot: CPU0: AMD Ryzen 7 7800X3D 8-Core
>     Processor (family: 0x19, model: 0x61, stepping: 0x2)
>     > [Tue Sep 15 00:23:43 2026] Performance Events: Fam17h+ 16-deep LBR, core
>     perfctr, AMD PMU driver.
>     > [Tue Sep 15 00:23:43 2026] ... version:                   2
>     > [Tue Sep 15 00:23:43 2026] ... bit width:                 48
>     > [Tue Sep 15 00:23:43 2026] ... generic counters:          6
>     > [Tue Sep 15 00:23:43 2026] ... generic bitmap:           
>     000000000000003f
>     > [Tue Sep 15 00:23:43 2026] ... fixed-purpose counters:    0
>     > [Tue Sep 15 00:23:43 2026] ... fixed-purpose bitmap:     
>     0000000000000000
>     > [Tue Sep 15 00:23:43 2026] ... value mask:               
>     0000ffffffffffff
>     > [Tue Sep 15 00:23:43 2026] ... max period:               
>     00007fffffffffff
>     > [Tue Sep 15 00:23:43 2026] ... global_ctrl mask:         
>     000000000000003f
>     > [Tue Sep 15 00:23:43 2026] signal: max sigframe size: 3376
>     > [Tue Sep 15 00:23:43 2026] rcu: Hierarchical SRCU implementation.
>     > [Tue Sep 15 00:23:43 2026] rcu:       Max phase no-delay instances is
>     400.
>     > [Tue Sep 15 00:23:43 2026] Timer migration: 2 hierarchy levels; 8
>     children per group; 2 crossnode level
>     > [Tue Sep 15 00:23:43 2026] MCE: In-kernel MCE decoding enabled.
>     > [Tue Sep 15 00:23:43 2026] smp: Bringing up secondary CPUs ...
>     > [Tue Sep 15 00:23:43 2026] smpboot: x86: Booting SMP configuration:
>     > [Tue Sep 15 00:23:43 2026] .... node  #0, CPUs:        #1  #2  #3  #4  #
>     5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
>     > [Tue Sep 15 00:23:43 2026] Spectre V2 : Update user space SMT mitigation:
>     STIBP always-on
>     > [Tue Sep 15 00:23:43 2026] smp: Brought up 1 node, 16 CPUs
>     > [Tue Sep 15 00:23:43 2026] smpboot: Total of 16 processors activated
>     (134142.33 BogoMIPS)
>     > [Tue Sep 15 00:23:43 2026] Memory: 31827628K/32672040K available (22437K
>     kernel code, 3074K rwdata, 17976K rodata, 4972K init, 4980K bss, 826948K
>     reserved, 0K cma-reserved)
>     > [Tue Sep 15 00:23:43 2026] devtmpfs: initialized
>     > [Tue Sep 15 00:23:43 2026] x86/mm: Memory block size: 128MB
>     > [Tue Sep 15 00:23:43 2026] ACPI: PM: Registering ACPI NVS region [mem
>     0x0a200000-0x0a20ffff] (65536 bytes)
>     > [Tue Sep 15 00:23:43 2026] ACPI: PM: Registering ACPI NVS region [mem
>     0x71529000-0x73528fff] (33554432 bytes)
>     > [Tue Sep 15 00:23:43 2026] posixtimers hash table entries: 8192 (order:
>     5, 131072 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] futex hash table entries: 4096 (262144 bytes
>     on 1 NUMA nodes, total 256 KiB, linear).
>     > [Tue Sep 15 00:23:43 2026] xor: automatically using best checksumming
>     function   avx       
>     > [Tue Sep 15 00:23:43 2026] PM: RTC time: 04:23:43, date: 2026-09-15
>     > [Tue Sep 15 00:23:43 2026] NET: Registered PF_NETLINK/PF_ROUTE protocol
>     family
>     > [Tue Sep 15 00:23:43 2026] DMA: preallocated 4096 KiB GFP_KERNEL pool for
>     atomic allocations
>     > [Tue Sep 15 00:23:43 2026] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA
>     pool for atomic allocations
>     > [Tue Sep 15 00:23:43 2026] DMA: preallocated 4096 KiB GFP_KERNEL|
>     GFP_DMA32 pool for atomic allocations
>     > [Tue Sep 15 00:23:43 2026] audit: initializing netlink subsys (disabled)
>     > [Tue Sep 15 00:23:43 2026] audit: type=2000 audit(1789446223.160:1):
>     state=initialized audit_enabled=0 res=1
>     > [Tue Sep 15 00:23:43 2026] thermal_sys: Registered thermal governor
>     'fair_share'
>     > [Tue Sep 15 00:23:43 2026] thermal_sys: Registered thermal governor
>     'bang_bang'
>     > [Tue Sep 15 00:23:43 2026] thermal_sys: Registered thermal governor
>     'step_wise'
>     > [Tue Sep 15 00:23:43 2026] thermal_sys: Registered thermal governor
>     'user_space'
>     > [Tue Sep 15 00:23:43 2026] thermal_sys: Registered thermal governor
>     'power_allocator'
>     > [Tue Sep 15 00:23:43 2026] cpuidle: using governor ladder
>     > [Tue Sep 15 00:23:43 2026] cpuidle: using governor menu
>     > [Tue Sep 15 00:23:43 2026] efi: Freeing EFI boot services memory: 75476K
>     > [Tue Sep 15 00:23:43 2026] ACPI FADT declares the system doesn't support
>     PCIe ASPM, so disable it
>     > [Tue Sep 15 00:23:43 2026] acpiphp: ACPI Hot Plug PCI Controller Driver
>     version: 0.5
>     > [Tue Sep 15 00:23:43 2026] PCI: ECAM [mem 0xe0000000-0xefffffff] (base
>     0xe0000000) for domain 0000 [bus 00-ff]
>     > [Tue Sep 15 00:23:43 2026] PCI: Using configuration type 1 for base
>     access
>     > [Tue Sep 15 00:23:43 2026] virt/tdx: TDX not supported by the host
>     platform
>     > [Tue Sep 15 00:23:43 2026] kprobes: kprobe jump-optimization is enabled.
>     All kprobes are optimized if possible.
>     > [Tue Sep 15 00:23:43 2026] HugeTLB: registered 1.00 GiB page size,
>     pre-allocated 0 pages
>     > [Tue Sep 15 00:23:43 2026] HugeTLB: 16380 KiB vmemmap can be freed for a
>     1.00 GiB page
>     > [Tue Sep 15 00:23:43 2026] HugeTLB: registered 2.00 MiB page size,
>     pre-allocated 0 pages
>     > [Tue Sep 15 00:23:43 2026] HugeTLB: 28 KiB vmemmap can be freed for a
>     2.00 MiB page
>     > [Tue Sep 15 00:23:43 2026] raid6: using avx512x2 recovery algorithm
>     > [Tue Sep 15 00:23:43 2026] ACPI: Added _OSI(Module Device)
>     > [Tue Sep 15 00:23:43 2026] ACPI: Added _OSI(Processor Device)
>     > [Tue Sep 15 00:23:43 2026] ACPI: Added _OSI(Processor Aggregator Device)
>     > [Tue Sep 15 00:23:43 2026] ACPI: 17 ACPI AML tables successfully acquired
>     and loaded
>     > [Tue Sep 15 00:23:43 2026] ACPI: \_SB_: platform _OSC: OS support mask
>     [006e7eff]
>     > [Tue Sep 15 00:23:43 2026] ACPI: \_SB_: platform _OSC: OS control mask
>     [006a7eff]
>     > [Tue Sep 15 00:23:43 2026] ACPI: Interpreter enabled
>     > [Tue Sep 15 00:23:43 2026] ACPI: PM: (supports S0 S3 S4 S5)
>     > [Tue Sep 15 00:23:43 2026] ACPI: Using IOAPIC for interrupt routing
>     > [Tue Sep 15 00:23:43 2026] PCI: Using host bridge windows from ACPI; if
>     necessary, use "pci=nocrs" and report a bug
>     > [Tue Sep 15 00:23:43 2026] PCI: Ignoring E820 reservations for host
>     bridge windows
>     > [Tue Sep 15 00:23:43 2026] ACPI: Enabled 8 GPEs in block 00 to 1F
>     > [Tue Sep 15 00:23:43 2026] ACPI: \_SB_.PCI0.GPP0.M237: New power resource
>     > [Tue Sep 15 00:23:43 2026] ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New power
>     resource
>     > [Tue Sep 15 00:23:43 2026] ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: New
>     power resource
>     > [Tue Sep 15 00:23:43 2026] ACPI: \_SB_.PRWB: New power resource
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus
>     00-ff])
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0A08:00: _OSC: OS supports
>     [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0A08:00: _OSC: OS now controls
>     [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0A08:00: FADT indicates ASPM is
>     unsupported, using BIOS configuration
>     > [Tue Sep 15 00:23:43 2026] PCI host bridge to bus 0000:00
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [io 
>     0x0000-0x03af window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [io 
>     0x03e0-0x0cf7 window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [io 
>     0x03b0-0x03df window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [io 
>     0x0d00-0xffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [mem
>     0x000a0000-0x000dffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [mem
>     0xf2000000-0xf6ffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [mem
>     0xf0000000-0xf1ffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [mem
>     0x80000000-0xdfffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [mem
>     0x880000000-0xfcffffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: root bus resource [bus 00-ff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:00.0: [1022:14d8] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:00.2: [1022:14d9] type 00 class
>     0x080600 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.0: [1022:14da] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1: [1022:14db] type 01 class
>     0x060400 PCIe Root Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1: PCI bridge to [bus 01-03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1:   bridge window [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1:   bridge window [mem
>     0xdcb00000-0xdcdfffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1:   bridge window [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2: [1022:14db] type 01 class
>     0x060400 PCIe Root Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2: PCI bridge to [bus 04]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2:   bridge window [mem
>     0xdcf00000-0xdcffffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.0: [1022:14da] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1: [1022:14db] type 01 class
>     0x060400 PCIe Root Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1: PCI bridge to [bus 05-6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1:   bridge window [io 
>     0xc000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1:   bridge window [mem
>     0xa8000000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:03.0: [1022:14da] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:04.0: [1022:14da] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.0: [1022:14da] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1: [1022:14dd] type 01 class
>     0x060400 PCIe Root Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1: PCI bridge to [bus 6f]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1:   bridge window [io 
>     0xe000-0xefff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1:   bridge window [mem
>     0xdc700000-0xdcafffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1:   bridge window [mem
>     0xfc80000000-0xfc901fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3: [1022:14dd] type 01 class
>     0x060400 PCIe Root Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3: PCI bridge to [bus 70]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3:   bridge window [mem
>     0xdce00000-0xdcefffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:14.0: [1022:790b] type 00 class
>     0x0c0500 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:14.3: [1022:790e] type 00 class
>     0x060100 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.0: [1022:14e0] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.1: [1022:14e1] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.2: [1022:14e2] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.3: [1022:14e3] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.4: [1022:14e4] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.5: [1022:14e5] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.6: [1022:14e6] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.7: [1022:14e7] type 00 class
>     0x060000 conventional PCI endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0: [1002:1478] type 01 class
>     0x060400 PCIe Switch Upstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0: BAR 0 [mem
>     0xdcd00000-0xdcd03fff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0: PCI bridge to [bus 02-03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0:   bridge window [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0:   bridge window [mem
>     0xdcb00000-0xdccfffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0:   bridge window [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1: PCI bridge to [bus 01-03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0: [1002:1479] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0: PCI bridge to [bus 03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0:   bridge window [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0:   bridge window [mem
>     0xdcb00000-0xdccfffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0:   bridge window [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0: PCI bridge to [bus 02-03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: [1002:73df] type 00 class
>     0x030000 PCIe Legacy Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: BAR 0 [mem
>     0xf800000000-0xfbffffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: BAR 2 [mem
>     0xfc00000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: BAR 4 [io  0xf000-0xf0ff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: BAR 5 [mem
>     0xdcb00000-0xdcbfffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: ROM [mem
>     0xdcc00000-0xdcc1ffff pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: PME# supported from D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.1: [1002:ab28] type 00 class
>     0x040300 PCIe Legacy Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.1: BAR 0 [mem
>     0xdcc20000-0xdcc23fff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.1: PME# supported from D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0: PCI bridge to [bus 03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:04:00.0: [15b7:5017] type 00 class
>     0x010802 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:04:00.0: BAR 0 [mem
>     0xdcf00000-0xdcf03fff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2: PCI bridge to [bus 04]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0: [1022:43f4] type 01 class
>     0x060400 PCIe Switch Upstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0: PCI bridge to [bus 06-6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0:   bridge window [io 
>     0xc000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0:   bridge window [mem
>     0xa8000000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1: PCI bridge to [bus 05-6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: [1022:43f5] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: PCI bridge to [bus 07-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0:   bridge window [mem
>     0xa8000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:08.0: [1022:43f5] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:08.0: PCI bridge to [bus 69]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:08.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:08.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:09.0: [1022:43f5] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:09.0: PCI bridge to [bus 6a]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:09.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:09.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0: [1022:43f5] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0: PCI bridge to [bus 6b]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0:   bridge window [io 
>     0xd000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0:   bridge window [mem
>     0xdc500000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0: [1022:43f5] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0: PCI bridge to [bus 6c]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0:   bridge window [io 
>     0xc000-0xcfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0:   bridge window [mem
>     0xdc400000-0xdc4fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0: [1022:43f5] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0: PCI bridge to [bus 6d]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0:   bridge window [mem
>     0xdc300000-0xdc3fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0: [1022:43f5] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0: PCI bridge to [bus 6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0:   bridge window [mem
>     0xdc200000-0xdc2fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0: PCI bridge to [bus 06-6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: [8086:1136] type 01 class
>     0x060400 PCIe Switch Upstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: PCI bridge to [bus 08-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0:   bridge window [mem
>     0xa8000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: PCI bridge to [bus 07-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: [8086:1136] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: PCI bridge to [bus 09]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0:   bridge window [mem
>     0xdc000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0:   bridge window [mem
>     0xfc75100000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: [8086:1136] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: PCI bridge to [bus 0a-38]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0:   bridge window [mem
>     0xc0000000-0xd6efffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0:   bridge window [mem
>     0xfc50000000-0xfc74ffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: [8086:1136] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: PCI bridge to [bus 39]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0:   bridge window [mem
>     0xd8000000-0xd80fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: [8086:1136] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: PCI bridge to [bus 3a-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0:   bridge window [mem
>     0xa8000000-0xbeffffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0:   bridge window [mem
>     0xfc20000000-0xfc44ffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: PCI bridge to [bus 08-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:09:00.0: [8086:1137] type 00 class
>     0x0c0340 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:09:00.0: BAR 0 [mem
>     0xfc75100000-0xfc7513ffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:09:00.0: BAR 2 [mem
>     0xfc75140000-0xfc75140fff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:09:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:09:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:09:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: PCI bridge to [bus 09]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: [8086:0b26] type 01 class
>     0x060400 PCIe Switch Upstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: PCI bridge to [bus 0b-10]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0:   bridge window [mem
>     0xc0000000-0xc02fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: PCI bridge to [bus 0a-38]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: [8086:0b26] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: PCI bridge to [bus 0c]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0:   bridge window [mem
>     0xc0200000-0xc02fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: [8086:0b26] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: PCI bridge to [bus 0d]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: [8086:0b26] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: PCI bridge to [bus 0e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: [8086:0b26] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: PCI bridge to [bus 0f]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: [8086:0b26] type 01 class
>     0x060400 PCIe Switch Downstream Port
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: PCI bridge to [bus 10]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0:   bridge window [mem
>     0xc0000000-0xc01fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: PCI bridge to [bus 0b-10]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: [8086:0b27] type 00 class
>     0x0c0330 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: BAR 0 [mem
>     0xc0200000-0xc020ffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: PCI bridge to [bus 0c]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: PCI bridge to [bus 0d]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: PCI bridge to [bus 0e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: PCI bridge to [bus 0f]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:10:00.0: [8086:5502] type 00 class
>     0x020000 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:10:00.0: BAR 0 [mem
>     0xc0000000-0xc00fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:10:00.0: BAR 3 [mem
>     0xc0100000-0xc0103fff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:10:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: PCI bridge to [bus 10]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:39:00.0: [8086:1138] type 00 class
>     0x0c0330 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:39:00.0: BAR 0 [mem
>     0xd8000000-0xd800ffff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:39:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:39:00.0: PME# supported from D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: PCI bridge to [bus 39]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: PCI bridge to [bus 3a-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:08.0: PCI bridge to [bus 69]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:09.0: PCI bridge to [bus 6a]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6b:00.0: [10ec:8125] type 00 class
>     0x020000 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6b:00.0: BAR 0 [io  0xd000-0xd0ff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6b:00.0: BAR 2 [mem
>     0xdc500000-0xdc50ffff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6b:00.0: BAR 4 [mem
>     0xdc510000-0xdc513fff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6b:00.0: supports D1 D2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6b:00.0: PME# supported from D0 D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0: PCI bridge to [bus 6b]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6c:00.0: [10ec:b852] type 00 class
>     0x028000 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6c:00.0: BAR 0 [io  0xc000-0xc0ff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6c:00.0: BAR 2 [mem
>     0xdc400000-0xdc4fffff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6c:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0: PCI bridge to [bus 6c]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6d:00.0: [1022:43f7] type 00 class
>     0x0c0330 PCIe Legacy Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6d:00.0: BAR 0 [mem
>     0xdc300000-0xdc307fff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6d:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6d:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0: PCI bridge to [bus 6d]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6e:00.0: [1022:43f6] type 00 class
>     0x010601 PCIe Legacy Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6e:00.0: BAR 5 [mem
>     0xdc280000-0xdc2803ff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6e:00.0: ROM [mem
>     0xdc200000-0xdc27ffff pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6e:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6e:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0: PCI bridge to [bus 6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: [1002:164e] type 00 class
>     0x030000 PCIe Legacy Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: BAR 0 [mem
>     0xfc80000000-0xfc8fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: BAR 2 [mem
>     0xfc90000000-0xfc901fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: BAR 4 [io  0xe000-0xe0ff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: BAR 5 [mem
>     0xdca00000-0xdca7ffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: PME# supported from D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.1: [1002:1640] type 00 class
>     0x040300 PCIe Legacy Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.1: BAR 0 [mem
>     0xdca88000-0xdca8bfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.1: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.1: PME# supported from D1 D2
>     D3hot D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.2: [1022:1649] type 00 class
>     0x108000 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.2: BAR 2 [mem
>     0xdc900000-0xdc9fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.2: BAR 5 [mem
>     0xdca8c000-0xdca8dfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.2: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.3: [1022:15b6] type 00 class
>     0x0c0330 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.3: BAR 0 [mem
>     0xdc800000-0xdc8fffff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.3: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.3: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.4: [1022:15b7] type 00 class
>     0x0c0330 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.4: BAR 0 [mem
>     0xdc700000-0xdc7fffff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.4: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.4: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.6: [1022:15e3] type 00 class
>     0x040300 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.6: BAR 0 [mem
>     0xdca80000-0xdca87fff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.6: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.6: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1: PCI bridge to [bus 6f]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:70:00.0: [1022:15b8] type 00 class
>     0x0c0330 PCIe Endpoint
>     > [Tue Sep 15 00:23:43 2026] pci 0000:70:00.0: BAR 0 [mem
>     0xdce00000-0xdcefffff 64bit]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:70:00.0: enabling Extended Tags
>     > [Tue Sep 15 00:23:43 2026] pci 0000:70:00.0: PME# supported from D0 D3hot
>     D3cold
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3: PCI bridge to [bus 70]
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKA configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKB configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKC configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKD configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKE configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKF configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKG configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] ACPI: PCI: Interrupt link LNKH configured for
>     IRQ 0
>     > [Tue Sep 15 00:23:43 2026] iommu: Default domain type: Translated
>     > [Tue Sep 15 00:23:43 2026] iommu: DMA domain TLB invalidation policy:
>     lazy mode
>     > [Tue Sep 15 00:23:43 2026] SCSI subsystem initialized
>     > [Tue Sep 15 00:23:43 2026] libata version 3.00 loaded.
>     > [Tue Sep 15 00:23:43 2026] ACPI: bus type USB registered
>     > [Tue Sep 15 00:23:43 2026] usbcore: registered new interface driver usbfs
>     > [Tue Sep 15 00:23:43 2026] usbcore: registered new interface driver hub
>     > [Tue Sep 15 00:23:43 2026] usbcore: registered new device driver usb
>     > [Tue Sep 15 00:23:43 2026] EDAC MC: Ver: 3.0.0
>     > [Tue Sep 15 00:23:43 2026] efivars: Registered efivars operations
>     > [Tue Sep 15 00:23:43 2026] NetLabel: Initializing
>     > [Tue Sep 15 00:23:43 2026] NetLabel:  domain hash size = 128
>     > [Tue Sep 15 00:23:43 2026] NetLabel:  protocols = UNLABELED CIPSOv4
>     CALIPSO
>     > [Tue Sep 15 00:23:43 2026] NetLabel:  unlabeled traffic allowed by
>     default
>     > [Tue Sep 15 00:23:43 2026] mctp: management component transport protocol
>     core
>     > [Tue Sep 15 00:23:43 2026] NET: Registered PF_MCTP protocol family
>     > [Tue Sep 15 00:23:43 2026] PCI: Using ACPI for IRQ routing
>     > [Tue Sep 15 00:23:43 2026] PCI: pci_cache_line_size set to 64 bytes
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x099ff000-0x0bffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x0a200000-0x0bffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x0b000000-0x0bffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x648f1000-0x67ffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x67660000-0x67ffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x6abdf000-0x6bffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x79ff9000-0x7bffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x7a000000-0x7bffffff]
>     > [Tue Sep 15 00:23:43 2026] e820: register RAM buffer resource [mem
>     0x85df00000-0x85fffffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: vgaarb: setting as boot VGA
>     device
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: vgaarb: bridge control
>     possible
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: vgaarb: VGA device added:
>     decodes=io+mem,owns=none,locks=none
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: vgaarb: bridge control
>     possible
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: vgaarb: VGA device added:
>     decodes=io+mem,owns=none,locks=none
>     > [Tue Sep 15 00:23:43 2026] vgaarb: loaded
>     > [Tue Sep 15 00:23:43 2026] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
>     > [Tue Sep 15 00:23:43 2026] hpet0: 3 comparators, 32-bit 14.318180 MHz
>     counter
>     > [Tue Sep 15 00:23:43 2026] clocksource: Switched to clocksource tsc-early
>     > [Tue Sep 15 00:23:43 2026] VFS: Disk quotas dquot_6.6.0
>     > [Tue Sep 15 00:23:43 2026] VFS: Dquot-cache hash table entries: 512 (4096
>     bytes)
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C01:00: Reserved [mem
>     0xe0000000-0xefffffff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:00: Could not reserve [mem
>     0xf7600000-0xf767ffff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:01: Reserved [mem
>     0x860000000-0x87fffffff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:02: Reserved [mem
>     0xf7200000-0xf72fffff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:03: Reserved [io  0x0290-0x029f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:03: Reserved [io  0x0200-0x023f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0010-0x001f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0022-0x003f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0063]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0065]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0067-0x006f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0072-0x007f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0080]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0084-0x0086]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0088]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x008c-0x008e]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x0090-0x009f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x00a2-0x00bf]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x00b1]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Skipped [io  0x00e0-0x00ef]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x04d0-0x04d1]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x040b]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x04d6]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0c00-0x0c01]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0c14]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0c50-0x0c51]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0c52]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0c6c]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0c6f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0cd8-0x0cdf]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0800-0x089f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0b00-0x0b0f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0b20-0x0b3f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0900-0x090f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [io  0x0910-0x091f]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [mem
>     0xfedc0000-0xfedc0fff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [mem
>     0xfee00000-0xfee00fff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [mem
>     0xfec10000-0xfec10fff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [mem
>     0xfeb00000-0xfeb00fff]
>     > [Tue Sep 15 00:23:43 2026] acpi PNP0C02:04: Reserved [mem
>     0xff000000-0xffffffff]
>     > [Tue Sep 15 00:23:43 2026] pnp: PnP ACPI init
>     > [Tue Sep 15 00:23:43 2026] pnp 00:00: [dma 0 disabled]
>     > [Tue Sep 15 00:23:43 2026] pnp: PnP ACPI: found 1 devices
>     > [Tue Sep 15 00:23:43 2026] clocksource: acpi_pm: mask: 0xffffff
>     max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
>     > [Tue Sep 15 00:23:43 2026] NET: Registered PF_INET protocol family
>     > [Tue Sep 15 00:23:43 2026] IP idents hash table entries: 262144 (order:
>     9, 2097152 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] tcp_listen_portaddr_hash hash table entries:
>     16384 (order: 6, 262144 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] Table-perturb hash table entries: 65536
>     (order: 6, 262144 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] TCP established hash table entries: 262144
>     (order: 9, 2097152 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] TCP bind hash table entries: 65536 (order: 9,
>     2097152 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] TCP: Hash tables configured (established
>     262144 bind 65536)
>     > [Tue Sep 15 00:23:43 2026] MPTCP token hash table entries: 32768 (order:
>     8, 786432 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] UDP hash table entries: 16384 (order: 8,
>     1048576 bytes, linear)
>     > [Tue Sep 15 00:23:43 2026] NET: Registered PF_UNIX/PF_LOCAL protocol
>     family
>     > [Tue Sep 15 00:23:43 2026] NET: Registered PF_XDP protocol family
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [io 
>     0x1000-0x0fff] to [bus 0d] add_size 1000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [mem
>     0x00100000-0x000fffff 64bit pref] to [bus 0d] add_size 200000 add_align
>     100000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [mem
>     0x00100000-0x000fffff] to [bus 0d] add_size 200000 add_align 100000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [io 
>     0x1000-0x0fff] to [bus 0e] add_size 1000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [mem
>     0x00100000-0x000fffff 64bit pref] to [bus 0e] add_size 200000 add_align
>     100000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [mem
>     0x00100000-0x000fffff] to [bus 0e] add_size 200000 add_align 100000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [io 
>     0x1000-0x0fff] to [bus 0f] add_size 1000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [mem
>     0x00100000-0x000fffff 64bit pref] to [bus 0f] add_size 200000 add_align
>     100000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [mem
>     0x00100000-0x000fffff] to [bus 0f] add_size 200000 add_align 100000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: bridge window [io 
>     0x1000-0x0fff] to [bus 0b-10] add_size 3000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: bridge window [mem
>     0x00100000-0x000fffff 64bit pref] to [bus 0b-10] add_size 600000 add_align
>     100000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: bridge window [io 
>     0x1000-0x0fff] to [bus 0a-38] add_size 4000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: bridge window [io 
>     0x1000-0x0fff] to [bus 3a-68] add_size 1000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: bridge window [io 
>     0x1000-0x0fff] to [bus 08-68] add_size 5000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: bridge window [io 
>     0x1000-0x0fff] to [bus 07-68] add_size 5000
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0: PCI bridge to [bus 03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0:   bridge window [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0:   bridge window [mem
>     0xdcb00000-0xdccfffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0:   bridge window [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0: PCI bridge to [bus 02-03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0:   bridge window [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0:   bridge window [mem
>     0xdcb00000-0xdccfffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0:   bridge window [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1: PCI bridge to [bus 01-03]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1:   bridge window [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1:   bridge window [mem
>     0xdcb00000-0xdcdfffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1:   bridge window [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2: PCI bridge to [bus 04]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2:   bridge window [mem
>     0xdcf00000-0xdcffffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: bridge window [io  size
>     0x5000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: bridge window [io  size
>     0x5000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: bridge window [io  size
>     0x5000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: bridge window [io  size
>     0x5000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: bridge window [io  size
>     0x5000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: bridge window [io  size
>     0x5000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: bridge window [io  size
>     0x5000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: bridge window [io  size
>     0x5000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: bridge window [io  size
>     0x4000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: bridge window [io  size
>     0x4000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: bridge window [io  size
>     0x4000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: bridge window [io  size
>     0x4000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: PCI bridge to [bus 09]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0:   bridge window [mem
>     0xdc000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0:   bridge window [mem
>     0xfc75100000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: bridge window [mem
>     0xfc50000000-0xfc505fffff 64bit pref]: assigned
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: bridge window [io  size
>     0x3000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: bridge window [io  size
>     0x3000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: bridge window [io  size
>     0x3000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: bridge window [io  size
>     0x3000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [mem size
>     0x00200000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [mem size
>     0x00200000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [mem
>     0xfc50000000-0xfc501fffff 64bit pref]: assigned
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [mem size
>     0x00200000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [mem size
>     0x00200000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [mem
>     0xfc50200000-0xfc503fffff 64bit pref]: assigned
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [mem size
>     0x00200000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [mem size
>     0x00200000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [mem
>     0xfc50400000-0xfc505fffff 64bit pref]: assigned
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [mem size
>     0x00200000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [mem size
>     0x00200000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [mem size
>     0x00200000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [mem size
>     0x00200000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [mem size
>     0x00200000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [mem size
>     0x00200000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [io  size
>     0x1000]: can't assign; no space
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: bridge window [io  size
>     0x1000]: failed to assign
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: PCI bridge to [bus 0c]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0:   bridge window [mem
>     0xc0200000-0xc02fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: PCI bridge to [bus 0d]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0:   bridge window [mem
>     0xfc50000000-0xfc501fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: PCI bridge to [bus 0e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0:   bridge window [mem
>     0xfc50200000-0xfc503fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: PCI bridge to [bus 0f]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0:   bridge window [mem
>     0xfc50400000-0xfc505fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: PCI bridge to [bus 10]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0:   bridge window [mem
>     0xc0000000-0xc01fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: PCI bridge to [bus 0b-10]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0:   bridge window [mem
>     0xc0000000-0xc02fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0:   bridge window [mem
>     0xfc50000000-0xfc505fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: PCI bridge to [bus 0a-38]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0:   bridge window [mem
>     0xc0000000-0xd6efffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0:   bridge window [mem
>     0xfc50000000-0xfc74ffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: PCI bridge to [bus 39]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0:   bridge window [mem
>     0xd8000000-0xd80fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: PCI bridge to [bus 3a-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0:   bridge window [mem
>     0xa8000000-0xbeffffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0:   bridge window [mem
>     0xfc20000000-0xfc44ffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: PCI bridge to [bus 08-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0:   bridge window [mem
>     0xa8000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: PCI bridge to [bus 07-68]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0:   bridge window [mem
>     0xa8000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:08.0: PCI bridge to [bus 69]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:09.0: PCI bridge to [bus 6a]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0: PCI bridge to [bus 6b]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0:   bridge window [io 
>     0xd000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0:   bridge window [mem
>     0xdc500000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0: PCI bridge to [bus 6c]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0:   bridge window [io 
>     0xc000-0xcfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0:   bridge window [mem
>     0xdc400000-0xdc4fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0: PCI bridge to [bus 6d]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0:   bridge window [mem
>     0xdc300000-0xdc3fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0: PCI bridge to [bus 6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0:   bridge window [mem
>     0xdc200000-0xdc2fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0: PCI bridge to [bus 06-6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0:   bridge window [io 
>     0xc000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0:   bridge window [mem
>     0xa8000000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1: PCI bridge to [bus 05-6e]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1:   bridge window [io 
>     0xc000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1:   bridge window [mem
>     0xa8000000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1:   bridge window [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1: PCI bridge to [bus 6f]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1:   bridge window [io 
>     0xe000-0xefff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1:   bridge window [mem
>     0xdc700000-0xdcafffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1:   bridge window [mem
>     0xfc80000000-0xfc901fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3: PCI bridge to [bus 70]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3:   bridge window [mem
>     0xdce00000-0xdcefffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: Some PCI device resources are
>     unassigned, try booting with pci=realloc
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 4 [io  0x0000-0x03af
>     window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7
>     window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df
>     window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff
>     window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 8 [mem
>     0x000a0000-0x000dffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 9 [mem
>     0xf2000000-0xf6ffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 10 [mem
>     0xf0000000-0xf1ffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 11 [mem
>     0x80000000-0xdfffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:00: resource 12 [mem
>     0x880000000-0xfcffffffff window]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:01: resource 0 [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:01: resource 1 [mem
>     0xdcb00000-0xdcdfffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:01: resource 2 [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:02: resource 0 [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:02: resource 1 [mem
>     0xdcb00000-0xdccfffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:02: resource 2 [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:03: resource 0 [io 
>     0xf000-0xffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:03: resource 1 [mem
>     0xdcb00000-0xdccfffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:03: resource 2 [mem
>     0xf800000000-0xfc0fffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:04: resource 1 [mem
>     0xdcf00000-0xdcffffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:05: resource 0 [io 
>     0xc000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:05: resource 1 [mem
>     0xa8000000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:05: resource 2 [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:06: resource 0 [io 
>     0xc000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:06: resource 1 [mem
>     0xa8000000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:06: resource 2 [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:07: resource 0 [io  size 0x5000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:07: resource 1 [mem
>     0xa8000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:07: resource 2 [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:08: resource 0 [io  size 0x5000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:08: resource 1 [mem
>     0xa8000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:08: resource 2 [mem
>     0xfc20000000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:09: resource 1 [mem
>     0xdc000000-0xdc0fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:09: resource 2 [mem
>     0xfc75100000-0xfc751fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0a: resource 0 [io  size 0x4000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0a: resource 1 [mem
>     0xc0000000-0xd6efffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0a: resource 2 [mem
>     0xfc50000000-0xfc74ffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0b: resource 0 [io  size 0x3000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0b: resource 1 [mem
>     0xc0000000-0xc02fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0b: resource 2 [mem
>     0xfc50000000-0xfc505fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0c: resource 1 [mem
>     0xc0200000-0xc02fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0d: resource 0 [io  size 0x1000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0d: resource 1 [mem size
>     0x00200000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0d: resource 2 [mem
>     0xfc50000000-0xfc501fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0e: resource 0 [io  size 0x1000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0e: resource 1 [mem size
>     0x00200000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0e: resource 2 [mem
>     0xfc50200000-0xfc503fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0f: resource 0 [io  size 0x1000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0f: resource 1 [mem size
>     0x00200000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:0f: resource 2 [mem
>     0xfc50400000-0xfc505fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:10: resource 1 [mem
>     0xc0000000-0xc01fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:39: resource 1 [mem
>     0xd8000000-0xd80fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:3a: resource 0 [io  size 0x1000]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:3a: resource 1 [mem
>     0xa8000000-0xbeffffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:3a: resource 2 [mem
>     0xfc20000000-0xfc44ffffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6b: resource 0 [io 
>     0xd000-0xdfff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6b: resource 1 [mem
>     0xdc500000-0xdc5fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6c: resource 0 [io 
>     0xc000-0xcfff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6c: resource 1 [mem
>     0xdc400000-0xdc4fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6d: resource 1 [mem
>     0xdc300000-0xdc3fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6e: resource 1 [mem
>     0xdc200000-0xdc2fffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6f: resource 0 [io 
>     0xe000-0xefff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6f: resource 1 [mem
>     0xdc700000-0xdcafffff]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:6f: resource 2 [mem
>     0xfc80000000-0xfc901fffff 64bit pref]
>     > [Tue Sep 15 00:23:43 2026] pci_bus 0000:70: resource 1 [mem
>     0xdce00000-0xdcefffff]
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.1: D0 power state depends on
>     0000:03:00.0
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: CLS mismatch (64 != 128),
>     using 64 bytes
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.1: D0 power state depends on
>     0000:6f:00.0
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:00.2: AMD-Vi: IOMMU performance
>     counters supported
>     > [Tue Sep 15 00:23:43 2026] Trying to unpack rootfs image as initramfs...
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.0: Adding to iommu group 0
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.1: Adding to iommu group 1
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:01.2: Adding to iommu group 2
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.0: Adding to iommu group 3
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:02.1: Adding to iommu group 4
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:03.0: Adding to iommu group 5
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:04.0: Adding to iommu group 6
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.0: Adding to iommu group 7
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.1: Adding to iommu group 8
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:08.3: Adding to iommu group 9
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:14.0: Adding to iommu group 10
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:14.3: Adding to iommu group 10
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.0: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.1: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.2: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.3: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.4: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.5: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.6: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:00:18.7: Adding to iommu group 11
>     > [Tue Sep 15 00:23:43 2026] pci 0000:01:00.0: Adding to iommu group 12
>     > [Tue Sep 15 00:23:43 2026] pci 0000:02:00.0: Adding to iommu group 13
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.0: Adding to iommu group 14
>     > [Tue Sep 15 00:23:43 2026] pci 0000:03:00.1: Adding to iommu group 15
>     > [Tue Sep 15 00:23:43 2026] pci 0000:04:00.0: Adding to iommu group 16
>     > [Tue Sep 15 00:23:43 2026] pci 0000:05:00.0: Adding to iommu group 17
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:08.0: Adding to iommu group 19
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:09.0: Adding to iommu group 20
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0a.0: Adding to iommu group 21
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0b.0: Adding to iommu group 22
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0c.0: Adding to iommu group 23
>     > [Tue Sep 15 00:23:43 2026] pci 0000:06:0d.0: Adding to iommu group 24
>     > [Tue Sep 15 00:23:43 2026] pci 0000:07:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:01.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:02.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:08:03.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:09:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0a:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:01.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:02.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:03.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0b:04.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:0c:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:10:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:39:00.0: Adding to iommu group 18
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6b:00.0: Adding to iommu group 21
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6c:00.0: Adding to iommu group 22
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6d:00.0: Adding to iommu group 23
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6e:00.0: Adding to iommu group 24
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.0: Adding to iommu group 25
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.1: Adding to iommu group 26
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.2: Adding to iommu group 27
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.3: Adding to iommu group 28
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.4: Adding to iommu group 29
>     > [Tue Sep 15 00:23:43 2026] pci 0000:6f:00.6: Adding to iommu group 30
>     > [Tue Sep 15 00:23:43 2026] pci 0000:70:00.0: Adding to iommu group 31
>     > [Tue Sep 15 00:23:43 2026] AMD-Vi: Extended features (0x246577efa2254afa,
>     0x0): PPR NX GT [5] IA GA PC GA_vAPIC
>     > [Tue Sep 15 00:23:43 2026] AMD-Vi: Interrupt remapping enabled
>     > [Tue Sep 15 00:23:43 2026] AMD-Vi: Virtual APIC enabled
>     > [Tue Sep 15 00:23:43 2026] PCI-DMA: Using software bounce buffering for
>     IO (SWIOTLB)
>     > [Tue Sep 15 00:23:43 2026] software IO TLB: mapped [mem
>     0x0000000060126000-0x0000000064126000] (64MB)
>     > [Tue Sep 15 00:23:43 2026] LVT offset 0 assigned for vector 0x400
>     > [Tue Sep 15 00:23:43 2026] perf: AMD IBS detected (0x00000bff)
>     > [Tue Sep 15 00:23:43 2026] perf/amd_iommu: Detected AMD IOMMU #0 (2
>     banks, 4 counters/bank).
>     > [Tue Sep 15 00:23:43 2026] Initialise system trusted keyrings
>     > [Tue Sep 15 00:23:43 2026] Key type blacklist registered
>     > [Tue Sep 15 00:23:43 2026] workingset: timestamp_bits=36 (anon: 31)
>     max_order=23 bucket_order=0 (anon: 0)
>     > [Tue Sep 15 00:23:43 2026] fuse: init (API version 7.46)
>     > [Tue Sep 15 00:23:43 2026] integrity: Platform Keyring initialized
>     > [Tue Sep 15 00:23:43 2026] integrity: Machine keyring initialized
>     > [Tue Sep 15 00:23:43 2026] Key type asymmetric registered
>     > [Tue Sep 15 00:23:43 2026] Asymmetric key parser 'x509' registered
>     > [Tue Sep 15 00:23:43 2026] Block layer SCSI generic (bsg) driver version
>     0.4 loaded (major 245)
>     > [Tue Sep 15 00:23:43 2026] io scheduler mq-deadline registered
>     > [Tue Sep 15 00:23:43 2026] io scheduler kyber registered
>     > [Tue Sep 15 00:23:43 2026] io scheduler bfq registered
>     > [Tue Sep 15 00:23:43 2026] raid6: skipped pq benchmark and selected
>     avx512x4
>     > [Tue Sep 15 00:23:43 2026] ledtrig-cpu: registered to indicate activity
>     on CPUs
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:00:01.1: PME: Signaling with IRQ
>     29
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:00:01.2: PME: Signaling with IRQ
>     30
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:00:02.1: PME: Signaling with IRQ
>     31
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:00:02.1: pciehp: Slot #0
>     AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock-
>     NoCompl+ IbPresDis- LLActRep+
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:00:08.1: PME: Signaling with IRQ
>     32
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:00:08.3: PME: Signaling with IRQ
>     33
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:08:01.0: pciehp: Slot #1
>     AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock-
>     NoCompl+ IbPresDis- LLActRep+
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:08:03.0: pciehp: Slot #3
>     AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock-
>     NoCompl+ IbPresDis- LLActRep+
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:0b:01.0: pciehp: Slot #1
>     AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock-
>     NoCompl+ IbPresDis- LLActRep+
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:0b:02.0: pciehp: Slot #2
>     AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock-
>     NoCompl+ IbPresDis- LLActRep+
>     > [Tue Sep 15 00:23:43 2026] pcieport 0000:0b:03.0: pciehp: Slot #3
>     AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock-
>     NoCompl+ IbPresDis- LLActRep+
>     > [Tue Sep 15 00:23:43 2026] input: Power Button as /devices/platform/
>     PNP0C0C:00/input/input0
>     > [Tue Sep 15 00:23:43 2026] ACPI: button: Power Button [PWRB]
>     > [Tue Sep 15 00:23:43 2026] input: Power Button as /devices/platform/
>     LNXPWRBN:00/input/input1
>     > [Tue Sep 15 00:23:43 2026] ACPI: button: Power Button [PWRF]
>     > [Tue Sep 15 00:23:43 2026] Monitor-Mwait will be used to enter C-1 state
>     > [Tue Sep 15 00:23:43 2026] Estimated ratio of average max frequency by
>     base frequency (times 1024): 1127
>     > [Tue Sep 15 00:23:43 2026] Serial: 8250/16550 driver, 32 ports, IRQ
>     sharing enabled
>     > [Tue Sep 15 00:23:43 2026] 00:00: ttyS0 I/O:0x3f8 (irq = 4, base_baud =
>     115200) is a 16550A
>     > [Tue Sep 15 00:23:43 2026] Non-volatile memory driver v1.3
>     > [Tue Sep 15 00:23:43 2026] Freeing initrd memory: 53100K
>     > [Tue Sep 15 00:23:43 2026] tpm_crb_acpi MSFT0101:00: Disabling hwrng
>     > [Tue Sep 15 00:23:43 2026] ACPI: bus type drm_connector registered
>     > [Tue Sep 15 00:23:43 2026] ahci 0000:6e:00.0: enabling device (0000 ->
>     0002)
>     > [Tue Sep 15 00:23:43 2026] ahci 0000:6e:00.0: SSS flag set, parallel bus
>     scan disabled
>     > [Tue Sep 15 00:23:43 2026] ahci 0000:6e:00.0: AHCI vers 0001.0301, 32
>     command slots, 6 Gbps, SATA mode
>     > [Tue Sep 15 00:23:43 2026] ahci 0000:6e:00.0: 4/6 ports implemented (port
>     mask 0xf)
>     > [Tue Sep 15 00:23:43 2026] ahci 0000:6e:00.0: flags: 64bit ncq sntf stag
>     pm led clo only pmp pio slum part sxs deso sadm sds apst
>     > [Tue Sep 15 00:23:43 2026] scsi host0: ahci
>     > [Tue Sep 15 00:23:43 2026] scsi host1: ahci
>     > [Tue Sep 15 00:23:43 2026] scsi host2: ahci
>     > [Tue Sep 15 00:23:43 2026] scsi host3: ahci
>     > [Tue Sep 15 00:23:43 2026] scsi host4: ahci
>     > [Tue Sep 15 00:23:43 2026] scsi host5: ahci
>     > [Tue Sep 15 00:23:43 2026] ata1: SATA max UDMA/133 abar m1024@0xdc280000
>     port 0xdc280100 irq 48 lpm-pol 3
>     > [Tue Sep 15 00:23:43 2026] ata2: SATA max UDMA/133 abar m1024@0xdc280000
>     port 0xdc280180 irq 48 lpm-pol 3
>     > [Tue Sep 15 00:23:43 2026] ata3: SATA max UDMA/133 abar m1024@0xdc280000
>     port 0xdc280200 irq 48 lpm-pol 3
>     > [Tue Sep 15 00:23:43 2026] ata4: SATA max UDMA/133 abar m1024@0xdc280000
>     port 0xdc280280 irq 48 lpm-pol 3
>     > [Tue Sep 15 00:23:43 2026] ata5: DUMMY
>     > [Tue Sep 15 00:23:43 2026] ata6: DUMMY
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: new USB bus registered,
>     assigned bus number 1
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: hcc params 0x20007fc1
>     hci version 0x110 quirks 0x0000000000009810
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: new USB bus registered,
>     assigned bus number 2
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:0c:00.0: Host supports USB 3.1
>     Enhanced SuperSpeed
>     > [Tue Sep 15 00:23:43 2026] usb usb1: New USB device found, idVendor=1d6b,
>     idProduct=0002, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb1: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb1: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb1: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb1: SerialNumber: 0000:0c:00.0
>     > [Tue Sep 15 00:23:43 2026] hub 1-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 1-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] usb usb2: New USB device found, idVendor=1d6b,
>     idProduct=0003, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb2: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb2: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb2: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb2: SerialNumber: 0000:0c:00.0
>     > [Tue Sep 15 00:23:43 2026] hub 2-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 2-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:39:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:39:00.0: new USB bus registered,
>     assigned bus number 3
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:39:00.0: hcc params 0x20007fc1
>     hci version 0x110 quirks 0x0000000200009810
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:39:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:39:00.0: new USB bus registered,
>     assigned bus number 4
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:39:00.0: Host supports USB 3.1
>     Enhanced SuperSpeed
>     > [Tue Sep 15 00:23:43 2026] usb usb3: New USB device found, idVendor=1d6b,
>     idProduct=0002, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb3: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb3: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb3: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb3: SerialNumber: 0000:39:00.0
>     > [Tue Sep 15 00:23:43 2026] hub 3-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 3-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] usb usb4: New USB device found, idVendor=1d6b,
>     idProduct=0003, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb4: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb4: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb4: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb4: SerialNumber: 0000:39:00.0
>     > [Tue Sep 15 00:23:43 2026] hub 4-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 4-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6d:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6d:00.0: new USB bus registered,
>     assigned bus number 5
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6d:00.0: hcc params 0x0200ef81
>     hci version 0x110 quirks 0x0000000200000010
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6d:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6d:00.0: new USB bus registered,
>     assigned bus number 6
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6d:00.0: Host supports USB 3.2
>     Enhanced SuperSpeed
>     > [Tue Sep 15 00:23:43 2026] usb usb5: New USB device found, idVendor=1d6b,
>     idProduct=0002, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb5: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb5: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb5: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb5: SerialNumber: 0000:6d:00.0
>     > [Tue Sep 15 00:23:43 2026] hub 5-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 5-0:1.0: 12 ports detected
>     > [Tue Sep 15 00:23:43 2026] usb usb6: We don't know the algorithms for LPM
>     for this host, disabling LPM.
>     > [Tue Sep 15 00:23:43 2026] usb usb6: New USB device found, idVendor=1d6b,
>     idProduct=0003, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb6: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb6: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb6: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb6: SerialNumber: 0000:6d:00.0
>     > [Tue Sep 15 00:23:43 2026] hub 6-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 6-0:1.0: 5 ports detected
>     > [Tue Sep 15 00:23:43 2026] usb: port power management may be unreliable
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.3: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.3: new USB bus registered,
>     assigned bus number 7
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.3: hcc params 0x0120ffc5
>     hci version 0x120 quirks 0x0000000200000010
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.3: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.3: new USB bus registered,
>     assigned bus number 8
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.3: Host supports USB 3.1
>     Enhanced SuperSpeed
>     > [Tue Sep 15 00:23:43 2026] usb usb7: New USB device found, idVendor=1d6b,
>     idProduct=0002, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb7: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb7: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb7: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb7: SerialNumber: 0000:6f:00.3
>     > [Tue Sep 15 00:23:43 2026] hub 7-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 7-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] usb usb8: We don't know the algorithms for LPM
>     for this host, disabling LPM.
>     > [Tue Sep 15 00:23:43 2026] usb usb8: New USB device found, idVendor=1d6b,
>     idProduct=0003, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb8: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb8: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb8: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb8: SerialNumber: 0000:6f:00.3
>     > [Tue Sep 15 00:23:43 2026] hub 8-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 8-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.4: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.4: new USB bus registered,
>     assigned bus number 9
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.4: hcc params 0x0120ffc5
>     hci version 0x120 quirks 0x0000000200000010
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.4: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.4: new USB bus registered,
>     assigned bus number 10
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:6f:00.4: Host supports USB 3.1
>     Enhanced SuperSpeed
>     > [Tue Sep 15 00:23:43 2026] usb usb9: New USB device found, idVendor=1d6b,
>     idProduct=0002, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb9: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb9: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb9: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb9: SerialNumber: 0000:6f:00.4
>     > [Tue Sep 15 00:23:43 2026] hub 9-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 9-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] usb usb10: We don't know the algorithms for
>     LPM for this host, disabling LPM.
>     > [Tue Sep 15 00:23:43 2026] usb usb10: New USB device found, idVendor=
>     1d6b, idProduct=0003, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb10: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb10: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb10: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb10: SerialNumber: 0000:6f:00.4
>     > [Tue Sep 15 00:23:43 2026] hub 10-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 10-0:1.0: 2 ports detected
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:70:00.0: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:70:00.0: new USB bus registered,
>     assigned bus number 11
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:70:00.0: USB0 root hub has no
>     ports
>     > [Tue Sep 15 00:23:43 2026] xhci_hcd 0000:70:00.0: hcc params 0x0110ffc5
>     hci version 0x120 quirks 0x0000000200000010
>     > [Tue Sep 15 00:23:43 2026] usb usb11: New USB device found, idVendor=
>     1d6b, idProduct=0002, bcdDevice= 7.03
>     > [Tue Sep 15 00:23:43 2026] usb usb11: New USB device strings: Mfr=3,
>     Product=2, SerialNumber=1
>     > [Tue Sep 15 00:23:43 2026] usb usb11: Product: xHCI Host Controller
>     > [Tue Sep 15 00:23:43 2026] usb usb11: Manufacturer: Linux
>     7.3.0-rc2-1-mainline xhci-hcd
>     > [Tue Sep 15 00:23:43 2026] usb usb11: SerialNumber: 0000:70:00.0
>     > [Tue Sep 15 00:23:43 2026] hub 11-0:1.0: USB hub found
>     > [Tue Sep 15 00:23:43 2026] hub 11-0:1.0: 1 port detected
>     > [Tue Sep 15 00:23:43 2026] usbcore: registered new interface driver
>     usbserial_generic
>     > [Tue Sep 15 00:23:43 2026] usbserial: USB Serial support registered for
>     generic
>     > [Tue Sep 15 00:23:43 2026] i8042: PNP: No PS/2 controller found.
>     > [Tue Sep 15 00:23:43 2026] rtc_cmos PNP0B00:00: RTC can wake from S4
>     > [Tue Sep 15 00:23:43 2026] rtc_cmos PNP0B00:00: registered as rtc0
>     > [Tue Sep 15 00:23:43 2026] rtc_cmos PNP0B00:00: setting system clock to
>     2026-09-15T04:23:43 UTC (1789446223)
>     > [Tue Sep 15 00:23:43 2026] rtc_cmos PNP0B00:00: alarms up to one month,
>     y3k, 114 bytes nvram
>     > [Tue Sep 15 00:23:43 2026] simple-framebuffer simple-framebuffer.0: [drm]
>     Registered 1 planes with drm panic
>     > [Tue Sep 15 00:23:43 2026] [drm] Initialized simpledrm 1.0.0 for
>     simple-framebuffer.0 on minor 0
>     > [Tue Sep 15 00:23:43 2026] fbcon: Deferring console take-over
>     > [Tue Sep 15 00:23:43 2026] simple-framebuffer simple-framebuffer.0: [drm]
>     fb0: simpledrmdrmfb frame buffer device
>     > [Tue Sep 15 00:23:43 2026] hid: raw HID events driver (C) Jiri Kosina
>     > [Tue Sep 15 00:23:43 2026] usbcore: registered new interface driver
>     usbhid
>     > [Tue Sep 15 00:23:43 2026] usbhid: USB HID core driver
>     > [Tue Sep 15 00:23:43 2026] drop_monitor: Initializing network drop
>     monitor service
>     > [Tue Sep 15 00:23:43 2026] NET: Registered PF_INET6 protocol family
>     > [Tue Sep 15 00:23:43 2026] Segment Routing with IPv6
>     > [Tue Sep 15 00:23:43 2026] RPL Segment Routing with IPv6
>     > [Tue Sep 15 00:23:43 2026] In-situ OAM (IOAM) with IPv6
>     > [Tue Sep 15 00:23:43 2026] NET: Registered PF_PACKET protocol family
>     > [Tue Sep 15 00:23:43 2026] x86/amd: Previous system reset reason
>     [0x00080800]: software wrote 0x6 to reset control register 0xCF9
>     > [Tue Sep 15 00:23:43 2026] AGESA: AGESA!V9 ComboAm5PI 1.3.0.1b Patch A
>     > [Tue Sep 15 00:23:43 2026] microcode: Current revision: 0x0a60120c
>     > [Tue Sep 15 00:23:43 2026] resctrl: L3 allocation detected
>     > [Tue Sep 15 00:23:43 2026] resctrl: MB allocation detected
>     > [Tue Sep 15 00:23:43 2026] resctrl: SMBA allocation detected
>     > [Tue Sep 15 00:23:43 2026] resctrl: L3 monitoring detected
>     > [Tue Sep 15 00:23:43 2026] IPI shorthand broadcast: enabled
>     > [Tue Sep 15 00:23:43 2026] sched_clock: Marking stable (530009624,
>     1341107)->(550628804, -19278073)
>     > [Tue Sep 15 00:23:43 2026] registered taskstats version 1
>     > [Tue Sep 15 00:23:43 2026] Loading compiled-in X.509 certificates
>     > [Tue Sep 15 00:23:43 2026] Loaded X.509 cert 'Build time autogenerated
>     kernel key: e322d3fa7803c44cc9c62a3c96c7837a32caad7c'
>     > [Tue Sep 15 00:23:43 2026] Demotion targets for Node 0: null
>     > [Tue Sep 15 00:23:43 2026] Key type .fscrypt registered
>     > [Tue Sep 15 00:23:43 2026] Key type fscrypt-provisioning registered
>     > [Tue Sep 15 00:23:43 2026] Btrfs loaded, zoned=yes, fsverity=yes
>     > [Tue Sep 15 00:23:43 2026] Key type big_key registered
>     > [Tue Sep 15 00:23:43 2026] integrity: Loading X.509 certificate: UEFI:db
>     > [Tue Sep 15 00:23:43 2026] integrity: Loaded X.509 cert 'ASUSTeK
>     MotherBoard SW Key Certificate: da83b990422ebc8c441f8d8b039a65a2'
>     > [Tue Sep 15 00:23:43 2026] integrity: Loading X.509 certificate: UEFI:db
>     > [Tue Sep 15 00:23:43 2026] integrity: Loaded X.509 cert 'ASUSTeK Notebook
>     SW Key Certificate: b8e581e4df77a5bb4282d5ccfc00c071'
>     > [Tue Sep 15 00:23:43 2026] integrity: Loading X.509 certificate: UEFI:db
>     > [Tue Sep 15 00:23:43 2026] integrity: Loaded X.509 cert 'Microsoft
>     Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
>     > [Tue Sep 15 00:23:43 2026] integrity: Loading X.509 certificate: UEFI:db
>     > [Tue Sep 15 00:23:43 2026] integrity: Loaded X.509 cert 'Microsoft
>     Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
>     > [Tue Sep 15 00:23:43 2026] integrity: Loading X.509 certificate: UEFI:db
>     > [Tue Sep 15 00:23:43 2026] integrity: Loaded X.509 cert 'Microsoft Option
>     ROM UEFI CA 2023: 514fbf937fa46fb57bf07af8bed84b3b864b1711'
>     > [Tue Sep 15 00:23:43 2026] integrity: Loading X.509 certificate: UEFI:db
>     > [Tue Sep 15 00:23:43 2026] integrity: Loaded X.509 cert 'Microsoft UEFI
>     CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
>     > [Tue Sep 15 00:23:43 2026] integrity: Loading X.509 certificate: UEFI:db
>     > [Tue Sep 15 00:23:43 2026] integrity: Loaded X.509 cert 'Microsoft
>     Corporation: Windows UEFI CA 2023:
>     aefc5fbbbe055d8f8daa585473499417ab5a5272'
>     > [Tue Sep 15 00:23:43 2026] PM:   Magic number: 10:390:363
>     > [Tue Sep 15 00:23:43 2026] msr msr2: hash matches
>     > [Tue Sep 15 00:23:43 2026] RAS: Correctable Errors collector initialized.
>     > [Tue Sep 15 00:23:43 2026] clk: Disabling unused clocks
>     > [Tue Sep 15 00:23:43 2026] PM: genpd: Disabling unused power domains
>     > [Tue Sep 15 00:23:43 2026] ata1: SATA link down (SStatus 0 SControl 300)
>     > [Tue Sep 15 00:23:43 2026] usb 7-1: new full-speed USB device number 2
>     using xhci_hcd
>     > [Tue Sep 15 00:23:43 2026] usb 11-1: new high-speed USB device number 2
>     using xhci_hcd
>     > [Tue Sep 15 00:23:43 2026] usb 5-5: new full-speed USB device number 2
>     using xhci_hcd
>     > [Tue Sep 15 00:23:43 2026] usb 7-1: New USB device found, idVendor=8968,
>     idProduct=4e4b, bcdDevice= 0.01
>     > [Tue Sep 15 00:23:43 2026] usb 11-1: New USB device found, idVendor=046d,
>     idProduct=0825, bcdDevice= 0.12
>     > [Tue Sep 15 00:23:43 2026] usb 7-1: New USB device strings: Mfr=1,
>     Product=2, SerialNumber=3
>     > [Tue Sep 15 00:23:43 2026] usb 7-1: Product: NK65
>     > [Tue Sep 15 00:23:43 2026] usb 7-1: Manufacturer: Yiancar-Designs
>     > [Tue Sep 15 00:23:43 2026] usb 7-1: SerialNumber: 0
>     > [Tue Sep 15 00:23:43 2026] input: Yiancar-Designs NK65 as /devices/
>     pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.0/0003:8968:4E4B.0001/
>     input/input2
>     > [Tue Sep 15 00:23:43 2026] hid-generic 0003:8968:4E4B.0001:
>     input,hidraw0: USB HID v1.11 Keyboard [Yiancar-Designs NK65] on
>     usb-0000:6f:00.3-1/input0
>     > [Tue Sep 15 00:23:43 2026] hid-generic 0003:8968:4E4B.0002:
>     hiddev96,hidraw1: USB HID v1.11 Device [Yiancar-Designs NK65] on
>     usb-0000:6f:00.3-1/input1
>     > [Tue Sep 15 00:23:43 2026] input: Yiancar-Designs NK65 Mouse as /devices/
>     pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/0003:8968:4E4B.0003/
>     input/input3
>     > [Tue Sep 15 00:23:43 2026] input: Yiancar-Designs NK65 System Control as
>     /devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/
>     0003:8968:4E4B.0003/input/input4
>     > [Tue Sep 15 00:23:44 2026] ata2: SATA link down (SStatus 0 SControl 300)
>     > [Tue Sep 15 00:23:44 2026] input: Yiancar-Designs NK65 Consumer Control
>     as /devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/
>     0003:8968:4E4B.0003/input/input5
>     > [Tue Sep 15 00:23:44 2026] input: Yiancar-Designs NK65 Keyboard as /
>     devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/
>     0003:8968:4E4B.0003/input/input6
>     > [Tue Sep 15 00:23:44 2026] hid-generic 0003:8968:4E4B.0003:
>     input,hidraw2: USB HID v1.11 Mouse [Yiancar-Designs NK65] on
>     usb-0000:6f:00.3-1/input2
>     > [Tue Sep 15 00:23:44 2026] usb 5-5: New USB device found, idVendor=13d3,
>     idProduct=3571, bcdDevice= 0.00
>     > [Tue Sep 15 00:23:44 2026] usb 5-5: New USB device strings: Mfr=1,
>     Product=2, SerialNumber=3
>     > [Tue Sep 15 00:23:44 2026] usb 5-5: Product: Bluetooth Radio
>     > [Tue Sep 15 00:23:44 2026] usb 5-5: Manufacturer: Realtek
>     > [Tue Sep 15 00:23:44 2026] usb 5-5: SerialNumber: 00e04c000001
>     > [Tue Sep 15 00:23:44 2026] usb 11-1: New USB device strings: Mfr=0,
>     Product=0, SerialNumber=2
>     > [Tue Sep 15 00:23:44 2026] usb 11-1: SerialNumber: 86C48050
>     > [Tue Sep 15 00:23:44 2026] usb 5-6: new full-speed USB device number 3
>     using xhci_hcd
>     > [Tue Sep 15 00:23:44 2026] tsc: Refined TSC clocksource calibration:
>     4192.140 MHz
>     > [Tue Sep 15 00:23:44 2026] clocksource: tsc: mask: 0xffffffffffffffff
>     max_cycles: 0x3c6d5fc3ef2, max_idle_ns: 440795235573 ns
>     > [Tue Sep 15 00:23:44 2026] clocksource: Switched to clocksource tsc
>     > [Tue Sep 15 00:23:44 2026] ata3: SATA link up 6.0 Gbps (SStatus 133
>     SControl 300)
>     > [Tue Sep 15 00:23:44 2026] ata3.00: Model 'CT1000BX500SSD1', rev
>     'M6CR060', applying quirks: nolpm
>     > [Tue Sep 15 00:23:44 2026] ata3.00: ATA-10: CT1000BX500SSD1, M6CR060, max
>     UDMA/133
>     > [Tue Sep 15 00:23:44 2026] ata3.00: 1953525168 sectors, multi 1: LBA48
>     NCQ (depth 32), AA
>     > [Tue Sep 15 00:23:44 2026] ata3.00: LPM support broken, forcing max_power
>     > [Tue Sep 15 00:23:44 2026] ata3.00: Features: Dev-Sleep DIPM
>     > [Tue Sep 15 00:23:44 2026] ata3.00: configured for UDMA/133
>     > [Tue Sep 15 00:23:44 2026] ahci 0000:6e:00.0: port does not support
>     device sleep
>     > [Tue Sep 15 00:23:44 2026] scsi 2:0:0:0: Direct-Access     ATA     
>     CT1000BX500SSD1  060  PQ: 0 ANSI: 5
>     > [Tue Sep 15 00:23:44 2026] sd 2:0:0:0: [sda] 1953525168 512-byte logical
>     blocks: (1.00 TB/932 GiB)
>     > [Tue Sep 15 00:23:44 2026] sd 2:0:0:0: [sda] Write Protect is off
>     > [Tue Sep 15 00:23:44 2026] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
>     > [Tue Sep 15 00:23:44 2026] sd 2:0:0:0: [sda] Write cache: enabled, read
>     cache: enabled, doesn't support DPO or FUA
>     > [Tue Sep 15 00:23:44 2026] sd 2:0:0:0: [sda] Preferred minimum I/O size
>     512 bytes
>     > [Tue Sep 15 00:23:44 2026] usb 5-6: New USB device found, idVendor=1038,
>     idProduct=182c, bcdDevice= 1.00
>     > [Tue Sep 15 00:23:44 2026] usb 5-6: New USB device strings: Mfr=1,
>     Product=2, SerialNumber=0
>     > [Tue Sep 15 00:23:44 2026] usb 5-6: Product: SteelSeries Prime+
>     > [Tue Sep 15 00:23:44 2026] usb 5-6: Manufacturer: SteelSeries
>     > [Tue Sep 15 00:23:44 2026] hid-generic 0003:1038:182C.0004:
>     hiddev97,hidraw3: USB HID v1.11 Device [SteelSeries SteelSeries Prime+] on
>     usb-0000:6d:00.0-6/input0
>     > [Tue Sep 15 00:23:44 2026] input: SteelSeries SteelSeries Prime+ as /
>     devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6d:00.0/usb5
>     /5-6/5-6:1.1/0003:1038:182C.0005/input/input7
>     > [Tue Sep 15 00:23:44 2026] hid-generic 0003:1038:182C.0005:
>     input,hidraw4: USB HID v1.11 Mouse [SteelSeries SteelSeries Prime+] on
>     usb-0000:6d:00.0-6/input1
>     > [Tue Sep 15 00:23:44 2026] hid-generic 0003:1038:182C.0006:
>     hiddev98,hidraw5: USB HID v1.11 Device [SteelSeries SteelSeries Prime+] on
>     usb-0000:6d:00.0-6/input2
>     > [Tue Sep 15 00:23:44 2026] input: SteelSeries SteelSeries Prime+ Keyboard
>     as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6d:00.0/
>     usb5/5-6/5-6:1.3/0003:1038:182C.0007/input/input8
>     > [Tue Sep 15 00:23:44 2026]  sda: sda1
>     > [Tue Sep 15 00:23:44 2026] sd 2:0:0:0: [sda] Attached SCSI disk
>     > [Tue Sep 15 00:23:44 2026] hid-generic 0003:1038:182C.0007:
>     input,hidraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Prime+] on
>     usb-0000:6d:00.0-6/input3
>     > [Tue Sep 15 00:23:44 2026] usb 5-11: new full-speed USB device number 4
>     using xhci_hcd
>     > [Tue Sep 15 00:23:45 2026] ata4: SATA link up 6.0 Gbps (SStatus 133
>     SControl 300)
>     > [Tue Sep 15 00:23:45 2026] ata4.00: Model 'Samsung SSD 850 EVO 500GB',
>     rev 'EMT02B6Q', applying quirks: noncqtrim zeroaftertrim
>     > [Tue Sep 15 00:23:45 2026] ata4.00: supports DRM functions and may not be
>     fully accessible
>     > [Tue Sep 15 00:23:45 2026] ata4.00: ATA-9: Samsung SSD 850 EVO 500GB,
>     EMT02B6Q, max UDMA/133
>     > [Tue Sep 15 00:23:45 2026] ata4.00: 976773168 sectors, multi 1: LBA48 NCQ
>     (depth 32), AA
>     > [Tue Sep 15 00:23:45 2026] ata4.00: Features: Trust Dev-Sleep DIPM
>     NCQ-sndrcv
>     > [Tue Sep 15 00:23:45 2026] ata4.00: supports DRM functions and may not be
>     fully accessible
>     > [Tue Sep 15 00:23:45 2026] ata4.00: Invalid log directory version 0x0000
>     > [Tue Sep 15 00:23:45 2026] ata4.00: configured for UDMA/133
>     > [Tue Sep 15 00:23:45 2026] ahci 0000:6e:00.0: port does not support
>     device sleep
>     > [Tue Sep 15 00:23:45 2026] scsi 3:0:0:0: Direct-Access     ATA     
>     Samsung SSD 850  2B6Q PQ: 0 ANSI: 5
>     > [Tue Sep 15 00:23:45 2026] sd 3:0:0:0: [sdb] 976773168 512-byte logical
>     blocks: (500 GB/466 GiB)
>     > [Tue Sep 15 00:23:45 2026] sd 3:0:0:0: [sdb] Write Protect is off
>     > [Tue Sep 15 00:23:45 2026] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
>     > [Tue Sep 15 00:23:45 2026] sd 3:0:0:0: [sdb] Write cache: enabled, read
>     cache: enabled, doesn't support DPO or FUA
>     > [Tue Sep 15 00:23:45 2026] sd 3:0:0:0: [sdb] Preferred minimum I/O size
>     512 bytes
>     > [Tue Sep 15 00:23:45 2026]  sdb: sdb1
>     > [Tue Sep 15 00:23:45 2026] sd 3:0:0:0: [sdb] supports TCG Opal
>     > [Tue Sep 15 00:23:45 2026] sd 3:0:0:0: [sdb] Attached SCSI disk
>     > [Tue Sep 15 00:23:45 2026] Freeing unused decrypted memory: 2028K
>     > [Tue Sep 15 00:23:45 2026] Freeing unused kernel image (initmem) memory:
>     4972K
>     > [Tue Sep 15 00:23:45 2026] Write protecting the kernel read-only data:
>     40960k
>     > [Tue Sep 15 00:23:45 2026] Freeing unused kernel image (text/rodata gap)
>     memory: 88K
>     > [Tue Sep 15 00:23:45 2026] Freeing unused kernel image (rodata/data gap)
>     memory: 456K
>     > [Tue Sep 15 00:23:45 2026] x86/mm: Checked W+X mappings: passed, no W+X
>     pages found.
>     > [Tue Sep 15 00:23:45 2026] rodata_test: all tests were successful
>     > [Tue Sep 15 00:23:45 2026] Run /init as init process
>     > [Tue Sep 15 00:23:45 2026]   with arguments:
>     > [Tue Sep 15 00:23:45 2026]     /init
>     > [Tue Sep 15 00:23:45 2026]   with environment:
>     > [Tue Sep 15 00:23:45 2026]     HOME=/
>     > [Tue Sep 15 00:23:45 2026]     TERM=linux
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Successfully made /usr/ read-only.
>     > [Tue Sep 15 00:23:45 2026] usb 5-11: New USB device found, idVendor=0b05,
>     idProduct=19af, bcdDevice= 1.00
>     > [Tue Sep 15 00:23:45 2026] usb 5-11: config 1 has an invalid interface
>     number: 2 but max is 1
>     > [Tue Sep 15 00:23:45 2026] usb 5-11: config 1 has no interface number 1
>     > [Tue Sep 15 00:23:45 2026] usb 5-11: New USB device strings: Mfr=1,
>     Product=2, SerialNumber=3
>     > [Tue Sep 15 00:23:45 2026] usb 5-11: Product: AURA LED Controller
>     > [Tue Sep 15 00:23:45 2026] usb 5-11: Manufacturer: AsusTek Computer Inc.
>     > [Tue Sep 15 00:23:45 2026] usb 5-11: SerialNumber: 9876543210
>     > [Tue Sep 15 00:23:45 2026] hid-generic 0003:0B05:19AF.0008:
>     hiddev99,hidraw7: USB HID v1.11 Device [AsusTek Computer Inc. AURA LED
>     Controller] on usb-0000:6d:00.0-11/input2
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: systemd 261.3-1-arch running in
>     system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP
>     +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD
>     +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT
>     +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON
>     +UTMP +LIBARCHIVE)
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Detected architecture x86-64.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Running in initrd.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Initializing machine ID from
>     random generator.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Queued start job for default
>     target Initrd Default Target.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Expecting device /dev/disk/by-uuid
>     /a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7...
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Reached target Path Units.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Reached target Slice Units.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Reached target Swaps.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Reached target Timer Units.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Listening on Journal Socket (/dev/
>     log).
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Listening on Journal Sockets.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Listening on udev Control Socket.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Listening on udev Kernel Socket.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Reached target Socket Units.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Create List of Static Device Nodes
>     skipped, unmet condition check ConditionFileNotEmpty=/lib/modules/
>     7.3.0-rc2-1-mainline/modules.devname
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Starting Journal Service...
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Starting Load Kernel Modules...
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: TPM PCR OS Separator skipped,
>     unmet condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: TPM PCR Barrier (initrd) skipped,
>     unmet condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Starting Create Static Device
>     Nodes in /dev...
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Starting Coldplug All udev
>     Devices...
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Starting Virtual Console Setup...
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Finished Create Static Device
>     Nodes in /dev.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Reached target Preparation for
>     Local File Systems.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Reached target Local File Systems.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Starting Rule-based Manager for
>     Device Events and Files...
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Finished Virtual Console Setup.
>     > [Tue Sep 15 00:23:45 2026] systemd-journald[212]: Collecting audit
>     messages is disabled.
>     > [Tue Sep 15 00:23:45 2026] ACPI: video: Video Device [VGA] (multi-head:
>     yes  rom: no  post: no)
>     > [Tue Sep 15 00:23:45 2026] input: Video Bus as /devices/pci0000:00/
>     0000:00:08.1/acpi.video_bus.0/input/input9
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Started Rule-based Manager for
>     Device Events and Files.
>     > [Tue Sep 15 00:23:45 2026] systemd[1]: Started Journal Service.
>     > [Tue Sep 15 00:23:45 2026] fbcon: Taking over console
>     > [Tue Sep 15 00:23:45 2026] Console: switching to colour frame buffer
>     device 128x48
>     > [Tue Sep 15 00:23:47 2026] Key type psk registered
>     > [Tue Sep 15 00:23:47 2026] amdgpu: vga_switcheroo: detected switching
>     method \_SB_.PCI0.GP17.VGA_.ATPX handle
>     > [Tue Sep 15 00:23:47 2026] amdgpu: ATPX version 1, functions 0x00000000
>     > [Tue Sep 15 00:23:47 2026] nvme nvme0: pci function 0000:04:00.0
>     > [Tue Sep 15 00:23:47 2026] amdgpu: Virtual CRAT table created for CPU
>     > [Tue Sep 15 00:23:47 2026] amdgpu: Topology: Add CPU node
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: enabling device (0006 ->
>     0007)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: initializing kernel
>     modesetting (NAVY_FLOUNDER 0x1002:0x73DF 0x1DA2:0xE445 0xC1).
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: register mmio base:
>     0xDCB00000
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: register mmio size:
>     1048576
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     0 <common_v1_0_0> (nv_common)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     1 <gmc_v10_0_0> (gmc_v10_0)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     2 <ih_v5_0_0> (navi10_ih)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     3 <psp_v11_0_0> (psp)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     4 <smu_v11_0_0> (smu)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     5 <dce_v1_0_0> (dm)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     6 <gfx_v10_0_0> (gfx_v10_0)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     7 <sdma_v5_2_0> (sdma_v5_2)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     8 <vcn_v3_0_0> (vcn_v3_0)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: detected ip block number
>     9 <jpeg_v3_0_0> (jpeg_v3_0)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: Fetched VBIOS from VFCT
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: [drm] ATOM BIOS:
>     113-D5121200-O04, build: 591224  , ver: 020.002.000.019.000000, 2021/10/22
>     > [Tue Sep 15 00:23:47 2026] Console: switching to colour dummy device
>     80x25
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: vgaarb: deactivate vga
>     console
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: Trusted Memory Zone (TMZ)
>     feature disabled as experimental (default)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: vm size is 262144 GB, 4
>     levels, block size is 9-bit, fragment size is 9-bit
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: VRAM: 12272M
>     0x0000008000000000 - 0x00000082FEFFFFFF (12272M used)
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: GART: 512M
>     0x0000000000000000 - 0x000000001FFFFFFF
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: [drm] Detected VRAM RAM=
>     12272M, BAR=16384M
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: [drm] RAM width 192bits
>     GDDR6
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0:  12272M of VRAM memory
>     ready
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0:  15615M of GTT memory
>     ready.
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: [drm] GART: num cpu pages
>     131072, num gpu pages 131072
>     > [Tue Sep 15 00:23:47 2026] amdgpu 0000:03:00.0: [drm] PCIE GART of 512M
>     enabled (table at 0x0000008000300000).
>     > [Tue Sep 15 00:23:47 2026] nvme nvme0: passthrough uses implicit buffer
>     lengths
>     > [Tue Sep 15 00:23:47 2026] nvme nvme0: allocated 64 MiB host memory
>     buffer (1 segment).
>     > [Tue Sep 15 00:23:47 2026] nvme nvme0: 16/0/0 default/read/poll queues
>     > [Tue Sep 15 00:23:47 2026]  nvme0n1: p1 p2
>     > [Tue Sep 15 00:23:47 2026] BTRFS: device fsid
>     a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 devid 1 transid 21629 /dev/nvme0n1p2
>     (259:2) scanned by mount (306)
>     > [Tue Sep 15 00:23:47 2026] BTRFS info (device nvme0n1p2): first mount of
>     filesystem a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7
>     > [Tue Sep 15 00:23:47 2026] BTRFS info (device nvme0n1p2): using crc32c
>     checksum algorithm
>     > [Tue Sep 15 00:23:47 2026] BTRFS info (device nvme0n1p2): enabling ssd
>     optimizations
>     > [Tue Sep 15 00:23:47 2026] BTRFS info (device nvme0n1p2): turning on
>     async discard
>     > [Tue Sep 15 00:23:47 2026] BTRFS info (device nvme0n1p2): enabling free
>     space tree
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: STB initialized to 2048
>     entries
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] Loading DMUB
>     firmware via PSP: version=0x02020022
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] use_doorbell being
>     set to: [true]
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] use_doorbell being
>     set to: [true]
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [VCN instance 0] Found
>     VCN firmware Version ENC: 1.33 DEC: 4 VEP: 0 Revision: 21
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: reserve 0xa00000 from
>     0x82fd000000 for PSP TMR
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: RAS: optional ras ta
>     ucode is not available
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: SECUREDISPLAY: optional
>     securedisplay ta ucode is not available
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: smu driver if version =
>     0x0000000e, smu fw if version = 0x00000012, smu fw program = 0, smu fw
>     version = 0x00413f00 (65.63.0)
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: use vbios provided
>     pptable
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: SMU is initialized
>     successfully!
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] Display Core
>     v3.2.392 initialized on DCN 3.0
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] DP-HDMI FRL PCON
>     supported
>     > [Tue Sep 15 00:23:49 2026] amdgpu 0000:03:00.0: [drm] DMUB hardware
>     initialized: version=0x02020022
>     > [Tue Sep 15 00:23:49 2026] workqueue: name exceeds WQ_NAME_LEN.
>     Truncating to: hdmi_frl_status_polling_workque
>     > [Tue Sep 15 00:23:51 2026] amdgpu 0000:03:00.0: kiq ring mec 2 pipe 1 q 0
>     > [Tue Sep 15 00:23:56 2026] clocksource: Watchdog remote CPU 9 read timed
>     out
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Abort failed to stop
>     command ring: -110
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: xHCI host controller
>     not responding, assume dead
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: HC died; cleaning up
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Error while assigning
>     device slot ID: Command Aborted
>     > [Tue Sep 15 00:24:07 2026] xhci_hcd 0000:0c:00.0: Max number of devices
>     this xHCI host supports is 64.
>     > [Tue Sep 15 00:24:07 2026] usb usb1-port1: couldn't allocate usb_device
>     > [Tue Sep 15 00:24:07 2026] usb usb2-port1: couldn't allocate usb_device
>     > [Tue Sep 15 00:24:07 2026] kfd kfd: Allocated 3969056 bytes on gart
>     > [Tue Sep 15 00:24:07 2026] kfd kfd: Total number of KFD nodes to be
>     created: 1
>     > [Tue Sep 15 00:24:07 2026] amdgpu: Virtual CRAT table created for GPU
>     > [Tue Sep 15 00:24:07 2026] amdgpu: Topology: Add GPU node [0x1002:0x73df]
>     > [Tue Sep 15 00:24:07 2026] kfd kfd: added device 1002:73df
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: SE 2, SH per SE 2, CU per
>     SH 10, active_cu_number 40
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring gfx_0.0.0 uses VM
>     inv eng 0 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring gfx_0.1.0 uses VM
>     inv eng 1 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM
>     inv eng 4 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM
>     inv eng 5 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.2.0 uses VM
>     inv eng 6 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.3.0 uses VM
>     inv eng 7 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM
>     inv eng 8 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM
>     inv eng 9 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.2.1 uses VM
>     inv eng 10 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring comp_1.3.1 uses VM
>     inv eng 11 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring kiq_0.2.1.0 uses VM
>     inv eng 12 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring sdma0 uses VM inv
>     eng 13 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring sdma1 uses VM inv
>     eng 14 on hub 0
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring vcn_dec_0 uses VM
>     inv eng 0 on hub 8
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring vcn_enc_0.0 uses VM
>     inv eng 1 on hub 8
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring vcn_enc_0.1 uses VM
>     inv eng 4 on hub 8
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: ring jpeg_dec uses VM inv
>     eng 5 on hub 8
>     > [Tue Sep 15 00:24:07 2026] amdgpu: HMM registered 12272MB device memory
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: Using BACO for runtime pm
>     > [Tue Sep 15 00:24:07 2026] amdgpu 0000:03:00.0: [drm] Registered 6 planes
>     with drm panic
>     > [Tue Sep 15 00:24:07 2026] [drm] Initialized amdgpu 3.64.0 for
>     0000:03:00.0 on minor 1
>     > [Tue Sep 15 00:24:08 2026] fbcon: amdgpudrmfb (fb0) is primary device
>     > [Tue Sep 15 00:24:08 2026] [drm] pre_validate_dsc:1796 MST_DSC dsc
>     precompute is not needed
>     > [Tue Sep 15 00:24:08 2026] Console: switching to colour frame buffer
>     device 160x45
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb
>     frame buffer device
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: enabling device (0006 ->
>     0007)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: initializing kernel
>     modesetting (IP DISCOVERY 0x1002:0x164E 0x1043:0x8877 0xCB).
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: register mmio base:
>     0xDCA00000
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: register mmio size:
>     524288
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     0 <common_v1_0_0> (nv_common)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     1 <gmc_v10_0_0> (gmc_v10_0)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     2 <ih_v5_0_0> (navi10_ih)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     3 <psp_v13_0_0> (psp)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     4 <smu_v13_0_0> (smu)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     5 <dce_v1_0_0> (dm)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     6 <gfx_v10_0_0> (gfx_v10_0)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     7 <sdma_v5_2_0> (sdma_v5_2)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     8 <vcn_v3_0_0> (vcn_v3_0)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: detected ip block number
>     9 <jpeg_v3_0_0> (jpeg_v3_0)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: Fetched VBIOS from VFCT
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] ATOM BIOS:
>     102-RAPHAEL-008, build: 612127  , ver: 032.019.000.008.000000, 2022/09/26
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: Trusted Memory Zone (TMZ)
>     feature disabled as experimental (default)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: vm size is 262144 GB, 4
>     levels, block size is 9-bit, fragment size is 9-bit
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: VRAM: 512M
>     0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: GART: 1024M
>     0x0000000000000000 - 0x000000003FFFFFFF
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] Detected VRAM RAM=
>     512M, BAR=512M
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] RAM width 128bits
>     DDR5
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0:  512M of VRAM memory
>     ready
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0:  15615M of GTT memory
>     ready.
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] GART: num cpu pages
>     262144, num gpu pages 262144
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] PCIE GART of 1024M
>     enabled (table at 0x000000F41FC00000).
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] Loading DMUB
>     firmware via PSP: version=0x05003500
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] use_doorbell being
>     set to: [true]
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [VCN instance 0] Found
>     VCN firmware Version ENC: 1.33 DEC: 4 VEP: 0 Revision: 21
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: reserve 0xa00000 from
>     0xf41e000000 for PSP TMR
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: RAS: optional ras ta
>     ucode is not available
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: RAP: optional rap ta
>     ucode is not available
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: SECUREDISPLAY: optional
>     securedisplay ta ucode is not available
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: SMU is initialized
>     successfully!
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] Display Core
>     v3.2.392 initialized on DCN 3.1.5
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] DP-HDMI FRL PCON
>     supported
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] DMUB hardware
>     initialized: version=0x05003500
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] HDMI-A-2: PSR
>     support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] DP-4: PSR support
>     0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: kiq ring mec 2 pipe 1 q 0
>     > [Tue Sep 15 00:24:08 2026] kfd kfd: Allocated 3969056 bytes on gart
>     > [Tue Sep 15 00:24:08 2026] kfd kfd: Total number of KFD nodes to be
>     created: 1
>     > [Tue Sep 15 00:24:08 2026] amdgpu: Virtual CRAT table created for GPU
>     > [Tue Sep 15 00:24:08 2026] amdgpu: Topology: Add GPU node [0x1002:0x164e]
>     > [Tue Sep 15 00:24:08 2026] kfd kfd: added device 1002:164e
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: SE 1, SH per SE 1, CU per
>     SH 2, active_cu_number 2
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring gfx_0.0.0 uses VM
>     inv eng 0 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring gfx_0.1.0 uses VM
>     inv eng 1 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.0.0 uses VM
>     inv eng 4 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.1.0 uses VM
>     inv eng 5 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.2.0 uses VM
>     inv eng 6 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.3.0 uses VM
>     inv eng 7 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.0.1 uses VM
>     inv eng 8 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.1.1 uses VM
>     inv eng 9 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.2.1 uses VM
>     inv eng 10 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring comp_1.3.1 uses VM
>     inv eng 11 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring kiq_0.2.1.0 uses VM
>     inv eng 12 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring sdma0 uses VM inv
>     eng 13 on hub 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring vcn_dec_0 uses VM
>     inv eng 0 on hub 8
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring vcn_enc_0.0 uses VM
>     inv eng 1 on hub 8
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring vcn_enc_0.1 uses VM
>     inv eng 4 on hub 8
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: ring jpeg_dec uses VM inv
>     eng 5 on hub 8
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: Runtime PM not available
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] Registered 4 planes
>     with drm panic
>     > [Tue Sep 15 00:24:08 2026] [drm] Initialized amdgpu 3.64.0 for
>     0000:6f:00.0 on minor 0
>     > [Tue Sep 15 00:24:08 2026] amdgpu 0000:6f:00.0: [drm] Cannot find any
>     crtc or sizes
>     > [Tue Sep 15 00:24:08 2026] systemd-journald[212]: Received SIGTERM from
>     PID 1 (systemd).
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: systemd 261.3-1-arch running in
>     system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP
>     +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD
>     +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT
>     +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON
>     +UTMP +LIBARCHIVE)
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Detected architecture x86-64.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Hostname set to <moomooPC-cachy>.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: bpf-restrict-fs: LSM BPF program
>     attached
>     > [Tue Sep 15 00:24:09 2026] zram: Added device: zram0
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: initrd-switch-root.service:
>     Deactivated successfully.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Stopped Switch Root.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: systemd-journald.service:
>     Scheduled restart job, restart counter is at 1.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice CUPS Slice.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     dirmngr.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/getty.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     gpg-agent.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     gpg-agent-browser.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     gpg-agent-extra.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     gpg-agent-ssh.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     keyboxd.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     modprobe.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     systemd-fsck.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice Slice /system/
>     systemd-zram-setup.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Created slice User and Session
>     Slice.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Dispatch Password Requests to
>     Console Directory Watch skipped, unmet condition check ConditionPathExists
>     =!/run/plymouth/pid
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Started Forward Password Requests
>     to Wall Directory Watch.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Set up automount Arbitrary
>     Executable File Formats File System Automount Point.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Expecting device /dev/disk/by-uuid
>     /51a5824b-f9f6-43e1-a91e-35959c7db669...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Expecting device /dev/disk/by-uuid
>     /A108-C690...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Expecting device /dev/disk/by-uuid
>     /a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Expecting device /dev/disk/by-uuid
>     /e5f7a047-17df-4708-a14e-14dea42c220b...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Expecting device /dev/zram0...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Reached target Login Prompts.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Reached target Image Downloads.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Stopped target Switch Root.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Stopped target Initrd File
>     Systems.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Stopped target Initrd Root File
>     System.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Reached target Local Integrity
>     Protected Volumes.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Reached target Remote File
>     Systems.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Reached target Slice Units.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Reached target Local Verity
>     Protected Volumes.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Device-mapper event
>     daemon FIFOs.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on LVM2 poll daemon
>     socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Query the User
>     Interactively for a Password.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Process Core Dump
>     Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Credential Encryption
>     /Decryption.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Factory Reset
>     Management.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Hostname Service
>     Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Console Output Muting
>     Service Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: TPM PCR Measurements skipped,
>     unmet condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Make TPM PCR Policy skipped, unmet
>     condition check ConditionSecurity=measured-uki
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Disk Repartitioning
>     Service Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Resolve Monitor
>     Varlink Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Resolve Service
>     Varlink Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Simple Block Device
>     Backed Storage Provider.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on Simple File System
>     Backed Storage Provider.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on udev Control Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on udev Varlink Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Listening on User Database Manager
>     Socket.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounting Huge Pages File System...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounting POSIX Message Queue File
>     System...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounting Kernel Debug File
>     System...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounting Kernel Trace File
>     System...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Create List of Static
>     Device Nodes...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Monitoring of LVM2
>     mirrors, snapshots etc. using dmeventd or progress polling...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Load Kernel Module configfs
>     skipped, unmet condition check ConditionKernelModuleLoaded=!configfs
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounting Kernel Configuration File
>     System...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Load Kernel Module drm skipped,
>     unmet condition check ConditionKernelModuleLoaded=!drm
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Load Kernel Module fuse skipped,
>     unmet condition check ConditionKernelModuleLoaded=!fuse
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounting FUSE Control File
>     System...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: plymouth-switch-root.service:
>     Deactivated successfully.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Stopped Plymouth switch root
>     service.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Clear Stale Hibernate Storage Info
>     skipped, unmet condition check ConditionPathExists=/sys/firmware/efi/
>     efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Journal Service...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Load Kernel Modules...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: TPM PCR Machine ID Measurement
>     skipped, unmet condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: TPM PCR OS Separator skipped,
>     unmet condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Remount Root and Kernel
>     File Systems...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Early TPM SRK Setup skipped, unmet
>     condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: TPM PCR NvPCR Initialization
>     Separator skipped, unmet condition check ConditionPathExists=/etc/
>     initrd-release
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Reached target Local Encrypted
>     Volumes.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: TPM NvPCR Product ID Measurement
>     skipped, unmet condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Load udev Rules from
>     Credentials...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Coldplug All udev
>     Devices...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounted POSIX Message Queue File
>     System.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounted Huge Pages File System.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounted Kernel Debug File System.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounted Kernel Trace File System.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Finished Create List of Static
>     Device Nodes.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounted Kernel Configuration File
>     System.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Mounted FUSE Control File System.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Create Static Device
>     Nodes in /dev gracefully...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Finished Load udev Rules from
>     Credentials.
>     > [Tue Sep 15 00:24:09 2026] Asymmetric key parser 'pkcs8' registered
>     > [Tue Sep 15 00:24:09 2026] systemd-journald[449]: Collecting audit
>     messages is disabled.
>     > [Tue Sep 15 00:24:09 2026] i2c_dev: i2c /dev entries driver
>     > [Tue Sep 15 00:24:09 2026] BTRFS info (device nvme0n1p2 state M): use
>     zstd compression, level 3
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Finished Remount Root and Kernel
>     File Systems.
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Rebuild Hardware Database skipped,
>     unmet condition check ConditionNeedsUpdate=/etc
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Starting Load/Save OS Random
>     Seed...
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: TPM SRK Setup skipped, unmet
>     condition check ConditionSecurity=measured-os
>     > [Tue Sep 15 00:24:09 2026] systemd[1]: Started Journal Service.
>     > [Tue Sep 15 00:24:09 2026] device-mapper: uevent: version 1.0.3
>     > [Tue Sep 15 00:24:09 2026] device-mapper: ioctl: 4.50.0-ioctl
>     (2025-04-28) initialised: dm-devel@lists.linux.dev
>     > [Tue Sep 15 00:24:09 2026] thunderbolt: unknown parameter 'dynbg' ignored
>     > [Tue Sep 15 00:24:09 2026] ACPI: bus type thunderbolt registered
>     > [Tue Sep 15 00:24:09 2026] thunderbolt 0000:09:00.0: enabling device
>     (0000 -> 0002)
>     > [Tue Sep 15 00:24:09 2026] zram0: detected capacity change from 0 to
>     63961088
>     > [Tue Sep 15 00:24:09 2026] zswap: loaded using pool zstd
>     > [Tue Sep 15 00:24:09 2026] Adding 31980540k swap on /dev/zram0. 
>     Priority:100 extents:1 across:31980540k SSDsc
>     > [Tue Sep 15 00:24:10 2026] ahci 0000:6e:00.0: port does not support
>     device sleep
>     > [Tue Sep 15 00:24:10 2026] pps_core: LinuxPPS API ver. 1 registered
>     > [Tue Sep 15 00:24:10 2026] pps_core: Software ver. 5.3.6 - Copyright
>     2005-2007 Rodolfo Giometti <giometti@linux.it>
>     > [Tue Sep 15 00:24:10 2026] mousedev: PS/2 mouse device common for all
>     mice
>     > [Tue Sep 15 00:24:10 2026] ccp 0000:6f:00.2: enabling device (0000 ->
>     0002)
>     > [Tue Sep 15 00:24:10 2026] PTP clock support registered
>     > [Tue Sep 15 00:24:10 2026] ccp 0000:6f:00.2: tee enabled
>     > [Tue Sep 15 00:24:10 2026] ccp 0000:6f:00.2: psp enabled
>     > [Tue Sep 15 00:24:10 2026] piix4_smbus 0000:00:14.0: SMBus Host
>     Controller at 0xb00, revision 0
>     > [Tue Sep 15 00:24:10 2026] piix4_smbus 0000:00:14.0: Using register 0x02
>     for SMBus port selection
>     > [Tue Sep 15 00:24:10 2026] Intel(R) 2.5G Ethernet Linux Driver
>     > [Tue Sep 15 00:24:10 2026] Copyright(c) 2018 Intel Corporation.
>     > [Tue Sep 15 00:24:10 2026] igc 0000:10:00.0: enabling device (0000 ->
>     0002)
>     > [Tue Sep 15 00:24:10 2026] igc 0000:10:00.0: PCIe PTM not supported by
>     PCIe bus/controller
>     > [Tue Sep 15 00:24:10 2026] i2c i2c-14: Successfully instantiated SPD at
>     0x51
>     > [Tue Sep 15 00:24:10 2026] i2c i2c-14: Successfully instantiated SPD at
>     0x53
>     > [Tue Sep 15 00:24:10 2026] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host
>     Controller at 0xb20
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: Core ver 2.22
>     > [Tue Sep 15 00:24:10 2026] NET: Registered PF_BLUETOOTH protocol family
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: HCI device and connection manager
>     initialized
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: HCI socket layer initialized
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: L2CAP socket layer initialized
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: SCO socket layer initialized
>     > [Tue Sep 15 00:24:10 2026] RAPL PMU: API unit is 2^-32 Joules, 2 fixed
>     counters, 163840 ms ovfl timer
>     > [Tue Sep 15 00:24:10 2026] RAPL PMU: hw unit of domain package 2^-16
>     Joules
>     > [Tue Sep 15 00:24:10 2026] RAPL PMU: hw unit of domain core 2^-16 Joules
>     > [Tue Sep 15 00:24:10 2026] mc: Linux media interface: v0.10
>     > [Tue Sep 15 00:24:10 2026] input: PC Speaker as /devices/platform/pcspkr/
>     input/input10
>     > [Tue Sep 15 00:24:10 2026] r8169 0000:6b:00.0: can't disable ASPM; OS
>     doesn't have ASPM control
>     > [Tue Sep 15 00:24:10 2026] cfg80211: Loading compiled-in X.509
>     certificates for regulatory database
>     > [Tue Sep 15 00:24:10 2026] Loaded X.509 cert 'sforshee:
>     00b28ddf47aef9cea7'
>     > [Tue Sep 15 00:24:10 2026] Loaded X.509 cert 'wens:
>     61c038651aabdcf94bd0ac7ff06c7248db18c600'
>     > [Tue Sep 15 00:24:10 2026] asus_wmi: failed to register LPS0 sleep
>     handler in asus-wmi
>     > [Tue Sep 15 00:24:10 2026] asus_wmi: SFUN value: 0x1
>     > [Tue Sep 15 00:24:10 2026] eeepc-wmi eeepc-wmi: Detected ATK, not
>     ASUSWMI, use DSTS
>     > [Tue Sep 15 00:24:10 2026] videodev: Linux video capture interface: v2.00
>     > [Tue Sep 15 00:24:10 2026] input: Eee PC WMI hotkeys as /devices/platform
>     /eeepc-wmi/input/input11
>     > [Tue Sep 15 00:24:10 2026] r8169 0000:6b:00.0 eth0: RTL8125B,
>     10:7c:61:20:b5:a5, XID 641, IRQ 143
>     > [Tue Sep 15 00:24:10 2026] r8169 0000:6b:00.0 eth0: jumbo features
>     [frames: 16362 bytes, tx checksumming: ko]
>     > [Tue Sep 15 00:24:10 2026] igc 0000:10:00.0 (unnamed net_device)
>     (uninitialized): PHC added
>     > [Tue Sep 15 00:24:10 2026] r8169 0000:6b:00.0 eno1: renamed from eth0
>     > [Tue Sep 15 00:24:10 2026] igc 0000:10:00.0: 4.000 Gb/s available PCIe
>     bandwidth (5.0 GT/s PCIe x1 link)
>     > [Tue Sep 15 00:24:10 2026] igc 0000:10:00.0 eth0: MAC: 64:4b:f0:38:ff:0e
>     > [Tue Sep 15 00:24:10 2026] asus_armoury: No matching power limits found
>     for this system
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:03:00.1: enabling device
>     (0000 -> 0002)
>     > [Tue Sep 15 00:24:10 2026] usbcore: registered new interface driver btusb
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:03:00.1: Handle
>     vga_switcheroo audio client
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:03:00.1: Force to non-snoop
>     mode
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:6f:00.1: enabling device
>     (0000 -> 0002)
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:6f:00.1: Handle
>     vga_switcheroo audio client
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:6f:00.6: enabling device
>     (0000 -> 0002)
>     > [Tue Sep 15 00:24:10 2026] igc 0000:10:00.0 enp16s0: renamed from eth0
>     > [Tue Sep 15 00:24:10 2026] spd5118 14-0051: DDR5 temperature sensor:
>     vendor 0x00:0xb3 revision 2.2
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: hci0: RTL: examining hci_ver=0b
>     hci_rev=000b lmp_ver=0b lmp_subver=8852
>     > [Tue Sep 15 00:24:10 2026] spd5118 14-0053: DDR5 temperature sensor:
>     vendor 0x00:0xb3 revision 2.2
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: hci0: RTL: rom_version status=0
>     version=1
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: hci0: RTL: btrtl_initialize: key id
>     0
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: hci0: RTL: loading rtl_bt/
>     rtl8852bu_fw.bin
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: hci0: RTL: loading rtl_bt/
>     rtl8852bu_config.bin
>     > [Tue Sep 15 00:24:10 2026] Bluetooth: hci0: RTL: cfg_sz 6, total sz 62539
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:6f:00.1: bound 0000:6f:00.0
>     (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
>     > [Tue Sep 15 00:24:10 2026] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0
>     (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic HDMI/DP,pcm=3 as /
>     devices/pci0000:00/0000:00:08.1/0000:6f:00.1/sound/card1/input12
>     > [Tue Sep 15 00:24:10 2026] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/
>     pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card0/
>     input14
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic HDMI/DP,pcm=7 as /
>     devices/pci0000:00/0000:00:08.1/0000:6f:00.1/sound/card1/input13
>     > [Tue Sep 15 00:24:10 2026] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/
>     pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card0/
>     input15
>     > [Tue Sep 15 00:24:10 2026] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/
>     pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card0/
>     input16
>     > [Tue Sep 15 00:24:10 2026] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/
>     pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card0/
>     input17
>     > [Tue Sep 15 00:24:10 2026] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices
>     /pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card0
>     /input18
>     > [Tue Sep 15 00:24:10 2026] input: HDA ATI HDMI HDMI/DP,pcm=11 as /devices
>     /pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card0
>     /input19
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: TSC scaling supported
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: Nested Virtualization enabled
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: Nested Paging enabled
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: LBR virtualization supported
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: AVIC enabled
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: x2AVIC enabled (max 512 vCPUs)
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: Virtual GIF supported
>     > [Tue Sep 15 00:24:10 2026] kvm_amd: Virtual NMI enabled
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0: autoconfig
>     for ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0:   
>     speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0:    hp_outs=1
>     (0x1b/0x0/0x0/0x0/0x0)
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0:    mono:
>     mono_out=0x0
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0:    inputs:
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0:      Rear
>     Mic=0x18
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0:      Front
>     Mic=0x19
>     > [Tue Sep 15 00:24:10 2026] snd_hda_codec_alc882 hdaudioC2D0:      Line=
>     0x1a
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic Rear Mic as /devices/
>     pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card2/input20
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic Front Mic as /devices/
>     pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card2/input21
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic Line as /devices/
>     pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card2/input22
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic Line Out Front as /
>     devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card2/input23
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic Line Out Surround as /
>     devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card2/input24
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic Line Out CLFE as /
>     devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card2/input25
>     > [Tue Sep 15 00:24:10 2026] input: HD-Audio Generic Front Headphone as /
>     devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card2/input26
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: loaded firmware
>     rtw89/rtw8852b_fw-2.bin
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: enabling device
>     (0000 -> 0003)
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware version
>     0.29.29.18 (9e3d777f), cmd version 0, type 5
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware version
>     0.29.29.18 (9e3d777f), cmd version 0, type 3
>     > [Tue Sep 15 00:24:10 2026] thunderbolt 0-1: new device found, vendor=0x3d
>     device=0x26
>     > [Tue Sep 15 00:24:10 2026] thunderbolt 0-1: CalDigit, Inc. TS4
>     > [Tue Sep 15 00:24:10 2026] intel_rapl_common: Found RAPL domain package
>     > [Tue Sep 15 00:24:10 2026] intel_rapl_common: Found RAPL domain core
>     > [Tue Sep 15 00:24:10 2026] amd_atl: AMD Address Translation Library
>     initialized
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element BB
>     version: 00 28 00 00
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element
>     radio A version: 00 32 00 00
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element
>     NCTL version: 00 0a 00 00
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element
>     TXPWR version: 00 43 00 00
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element
>     TXPWR version: 00 43 00 00
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element
>     TXPWR version: 00 43 00 00
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element
>     PWR_TRK version: 00 32 00 00
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: Firmware element
>     REGD version: 00 49 00 33
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: chip info CID: 0,
>     CV: 1, AID: 0, ACV: 1, RFE: 1
>     > [Tue Sep 15 00:24:10 2026] rtw89_8852be 0000:6c:00.0: rfkill hardware
>     state changed to enable
>     > [Tue Sep 15 00:24:10 2026] BTRFS: device fsid
>     51a5824b-f9f6-43e1-a91e-35959c7db669 devid 1 transid 872 /dev/sdb1 (8:17)
>     scanned by mount (730)
>     > [Tue Sep 15 00:24:10 2026] BTRFS: device fsid
>     e5f7a047-17df-4708-a14e-14dea42c220b devid 1 transid 4763 /dev/sda1 (8:1)
>     scanned by mount (729)
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sdb1): first mount of
>     filesystem 51a5824b-f9f6-43e1-a91e-35959c7db669
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sda1): first mount of
>     filesystem e5f7a047-17df-4708-a14e-14dea42c220b
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sda1): using crc32c
>     checksum algorithm
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sdb1): using crc32c
>     checksum algorithm
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sdb1): enabling ssd
>     optimizations
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sdb1): turning on async
>     discard
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sdb1): enabling free space
>     tree
>     > [Tue Sep 15 00:24:10 2026] systemd-journald[449]: Received client request
>     to flush runtime journal.
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sda1): enabling ssd
>     optimizations
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sda1): turning on async
>     discard
>     > [Tue Sep 15 00:24:10 2026] BTRFS info (device sda1): enabling free space
>     tree
>     > [Tue Sep 15 00:24:11 2026] usb 11-1: set resolution quirk: cval->res =
>     384
>     > [Tue Sep 15 00:24:11 2026] usbcore: registered new interface driver
>     snd-usb-audio
>     > [Tue Sep 15 00:24:11 2026] uvcvideo 11-1:1.0: Found UVC 1.00 device
>     <unnamed> (046d:0825)
>     > [Tue Sep 15 00:24:11 2026] Bluetooth: hci0: RTL: fw version 0x127cfd78
>     > [Tue Sep 15 00:24:11 2026] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
>     > [Tue Sep 15 00:24:11 2026] Bluetooth: BNEP filters: protocol multicast
>     > [Tue Sep 15 00:24:11 2026] Bluetooth: BNEP socket layer initialized
>     > [Tue Sep 15 00:24:11 2026] Realtek Internal NBASE-T PHY r8169-0-6b00:00:
>     attached PHY driver (mii_bus:phy_addr=r8169-0-6b00:00, irq=MAC)
>     > [Tue Sep 15 00:24:11 2026] usbcore: registered new interface driver
>     uvcvideo
>     > [Tue Sep 15 00:24:11 2026] Bluetooth: hci0: AOSP extensions version v1.00
>     > [Tue Sep 15 00:24:11 2026] Bluetooth: MGMT ver 1.23
>     > [Tue Sep 15 00:24:12 2026] r8169 0000:6b:00.0 eno1: Link is Down
>     > [Tue Sep 15 00:24:15 2026] wlan0: authenticate with 30:de:4b:9e:aa:d2
>     (local address=a8:41:f4:2d:3e:80)
>     > [Tue Sep 15 00:24:15 2026] wlan0: send auth to 30:de:4b:9e:aa:d2 (try 1/
>     3)
>     > [Tue Sep 15 00:24:15 2026] wlan0: authenticated
>     > [Tue Sep 15 00:24:15 2026] wlan0: associate with 30:de:4b:9e:aa:d2 (try 1
>     /3)
>     > [Tue Sep 15 00:24:15 2026] wlan0: RX AssocResp from 30:de:4b:9e:aa:d2
>     (capab=0x1511 status=0 aid=4)
>     > [Tue Sep 15 00:24:16 2026] wlan0: associated
>     > [Tue Sep 15 00:24:16 2026] wlan0: Limiting TX power to 27 (30 - 3) dBm as
>     advertised by 30:de:4b:9e:aa:d2
>     > [Tue Sep 15 00:24:16 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=
>     192.168.1.37 DST=224.0.0.252 LEN=60 TOS=0x00 PREC=0x00 TTL=255 ID=23161
>     PROTO=UDP SPT=5355 DPT=5355 LEN=40
>     > [Tue Sep 15 00:24:16 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=
>     192.168.1.37 DST=224.0.0.252 LEN=60 TOS=0x00 PREC=0x00 TTL=255 ID=23370
>     PROTO=UDP SPT=5355 DPT=5355 LEN=40
>     > [Tue Sep 15 00:24:16 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=
>     192.168.1.37 DST=224.0.0.252 LEN=60 TOS=0x00 PREC=0x00 TTL=255 ID=23419
>     PROTO=UDP SPT=5355 DPT=5355 LEN=40
>     > [Tue Sep 15 00:24:17 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=
>     fe80:0000:0000:0000:6614:9233:071f:5ae4 DST=
>     ff02:0000:0000:0000:0000:0000:0001:0003 LEN=80 TC=0 HOPLIMIT=255 FLOWLBL=
>     806937 PROTO=UDP SPT=5355 DPT=5355 LEN=40
>     > [Tue Sep 15 00:24:17 2026] [UFW BLOCK] IN=wlan0 OUT= MAC=
>     01:00:5e:00:00:fb:6e:ad:51:a7:10:10:08:00 SRC=192.168.1.203 DST=224.0.0.251
>     LEN=32 TOS=0x00 PREC=0xC0 TTL=1 ID=0 DF PROTO=2
>     > [Tue Sep 15 00:24:17 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=
>     fe80:0000:0000:0000:6614:9233:071f:5ae4 DST=
>     ff02:0000:0000:0000:0000:0000:0001:0003 LEN=80 TC=0 HOPLIMIT=255 FLOWLBL=
>     806937 PROTO=UDP SPT=5355 DPT=5355 LEN=40
>     > [Tue Sep 15 00:24:17 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=
>     fe80:0000:0000:0000:6614:9233:071f:5ae4 DST=
>     ff02:0000:0000:0000:0000:0000:0001:0003 LEN=80 TC=0 HOPLIMIT=255 FLOWLBL=
>     806937 PROTO=UDP SPT=5355 DPT=5355 LEN=40
>     > [Tue Sep 15 00:24:19 2026] input: ydotoold virtual device as /devices/
>     virtual/input/input27
>     > [Tue Sep 15 00:24:20 2026] usb 11-1: reset high-speed USB device number 2
>     using xhci_hcd
>     > [Tue Sep 15 00:24:22 2026] Bluetooth: RFCOMM TTY layer initialized
>     > [Tue Sep 15 00:24:22 2026] Bluetooth: RFCOMM socket layer initialized
>     > [Tue Sep 15 00:24:22 2026] Bluetooth: RFCOMM ver 1.11
>     >
>     > === lspci -vv (full) ===
>     > 00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Root Complex
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >
>     > 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge
>     IOMMU
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 28
>     >       Capabilities: [40] Secure device <?>
>     >       Capabilities: [64] MSI: Enable+ Count=1/4 Maskable- 64bit+
>     >               Address: 00000000fee06000  Data: 0020
>     >       Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+
>     >
>     > 00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 0
>     >
>     > 00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge GPP Bridge (prog-if 00 [Normal decode])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: MSI(X) routed to IRQ 29
>     >       IOMMU group: 1
>     >       Bus: primary=00, secondary=01, subordinate=03, sec-latency=0
>     >       I/O behind bridge: f000-ffff [size=4K] [16-bit]
>     >       Memory behind bridge: dcb00000-dcdfffff [size=3M] [32-bit]
>     >       Prefetchable memory behind bridge: f800000000-fc0fffffff [size=
>     16640M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [58] Express (v2) Root Port (Slot+), IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 256 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM not
>     supported
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 75W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               RootCap: CRSVisible+
>     >               RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
>     CRSVisible+
>     >               RootSta: PME ReqID 0301, PMEStatus- PMEPending-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq+ OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- LN System CLS Not Supported, TPHComp+
>     ExtTPHComp- ARIFwd+
>     >                        AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS-
>     >               DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: ReqEn- EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [370 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1-
>     L1_PM_Substates+
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >               L1SubCtl2:
>     >       Capabilities: [3c4 v1] Designated Vendor-Specific: Vendor=1022 ID=
>     0001 Rev=1 Len=44 <?>
>     >       Capabilities: [400 v1] Data Link Feature <?>
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [440 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady+ MargSoftReady-
>     >       Capabilities: [500 v1] Physical Layer 32.0 GT/s
>     >               Phy32Cap: EqualizationBypass+ NoEqualizationNeeded-
>     >                         ModTsMode0+ ModTsMode1- ModTsMode2-
>     >               Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis-
>     >                         Modified TS Usage Mode: PCI Express
>     >               Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >                         Received Enhanced Link Behavior Control: Full
>     Equalization required
>     >                         ModTsRecv- TxPrecodeOn- TxPrecodeReq-
>     NoEqualizationNeededRecv-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 00:01.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge GPP Bridge (prog-if 00 [Normal decode])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: MSI(X) routed to IRQ 30
>     >       IOMMU group: 2
>     >       Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: dcf00000-dcffffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [58] Express (v2) Root Port (Slot+), IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 512 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 32GT/s, Width x4, ASPM not supported
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 75W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               RootCap: CRSVisible+
>     >               RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
>     CRSVisible+
>     >               RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq+ OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- LN System CLS Not Supported, TPHComp+
>     ExtTPHComp- ARIFwd+
>     >                        AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS-
>     >               DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: ReqEn- EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-32GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [370 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1-
>     L1_PM_Substates+
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >               L1SubCtl2:
>     >       Capabilities: [3c4 v1] Designated Vendor-Specific: Vendor=1022 ID=
>     0001 Rev=1 Len=44 <?>
>     >       Capabilities: [400 v1] Data Link Feature <?>
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [440 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady+ MargSoftReady-
>     >       Capabilities: [500 v1] Physical Layer 32.0 GT/s
>     >               Phy32Cap: EqualizationBypass+ NoEqualizationNeeded-
>     >                         ModTsMode0+ ModTsMode1- ModTsMode2-
>     >               Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis-
>     >                         Modified TS Usage Mode: PCI Express
>     >               Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >                         Received Enhanced Link Behavior Control: Full
>     Equalization required
>     >                         ModTsRecv- TxPrecodeOn- TxPrecodeReq-
>     NoEqualizationNeededRecv-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 3
>     >
>     > 00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge GPP Bridge (prog-if 00 [Normal decode])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: MSI(X) routed to IRQ 31
>     >       IOMMU group: 4
>     >       Bus: primary=00, secondary=05, subordinate=6e, sec-latency=0
>     >       I/O behind bridge: c000-dfff [size=8K] [16-bit]
>     >       Memory behind bridge: a8000000-dc5fffff [size=838M] [32-bit]
>     >       Prefetchable memory behind bridge: fc20000000-fc751fffff [size=
>     1362M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort+ <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [58] Express (v2) Root Port (Slot+), IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #1, Speed 32GT/s, Width x4, ASPM not supported
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
>     Surprise+
>     >                       Slot #0, PowerLimit 75W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
>     HPIrq+ LinkChg+
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               RootCap: CRSVisible+
>     >               RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
>     CRSVisible+
>     >               RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq+ OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- LN System CLS Not Supported, TPHComp+
>     ExtTPHComp- ARIFwd+
>     >                        AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS-
>     >               DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: ReqEn- EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-32GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [370 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1-
>     L1_PM_Substates+
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >               L1SubCtl2:
>     >       Capabilities: [3c4 v1] Designated Vendor-Specific: Vendor=1022 ID=
>     0001 Rev=1 Len=44 <?>
>     >       Capabilities: [400 v1] Data Link Feature <?>
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [440 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady+ MargSoftReady-
>     >       Capabilities: [500 v1] Physical Layer 32.0 GT/s
>     >               Phy32Cap: EqualizationBypass+ NoEqualizationNeeded-
>     >                         ModTsMode0+ ModTsMode1- ModTsMode2-
>     >               Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis-
>     >                         Modified TS Usage Mode: PCI Express
>     >               Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >                         Received Enhanced Link Behavior Control: Full
>     Equalization required
>     >                         ModTsRecv- TxPrecodeOn- TxPrecodeReq-
>     NoEqualizationNeededRecv-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 5
>     >
>     > 00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 6
>     >
>     > 00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Dummy Host Bridge
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 7
>     >
>     > 00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Internal GPP Bridge to Bus [C:A] (prog-if 00 [Normal decode])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 32
>     >       IOMMU group: 8
>     >       Bus: primary=00, secondary=6f, subordinate=6f, sec-latency=0
>     >       I/O behind bridge: e000-efff [size=4K] [16-bit]
>     >       Memory behind bridge: dc700000-dcafffff [size=4M] [32-bit]
>     >       Prefetchable memory behind bridge: fc80000000-fc901fffff [size=
>     258M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [58] Express (v2) Root Port (Slot-), IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               RootCap: CRSVisible+
>     >               RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
>     CRSVisible+
>     >               RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- LN System CLS Not Supported, TPHComp-
>     ExtTPHComp- ARIFwd-
>     >                        AtomicOpsCap: Routing+ 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: ReqEn- EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [400 v1] Data Link Feature <?>
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [450 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 00:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Internal GPP Bridge to Bus [C:A] (prog-if 00 [Normal decode])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 33
>     >       IOMMU group: 9
>     >       Bus: primary=00, secondary=70, subordinate=70, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: dce00000-dcefffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [58] Express (v2) Root Port (Slot-), IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               RootCap: CRSVisible+
>     >               RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+
>     CRSVisible+
>     >               RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- LN System CLS Not Supported, TPHComp-
>     ExtTPHComp- ARIFwd-
>     >                        AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: ReqEn- EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [400 v1] Data Link Feature <?>
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [450 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller
>     (rev 71)
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 10
>     >       Kernel driver in use: piix4_smbus
>     >       Kernel modules: i2c_piix4, sp5100_tco
>     >
>     > 00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge
>     (rev 51)
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0
>     >       IOMMU group: 10
>     >
>     > 00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 0
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >
>     > 00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 1
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >
>     > 00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 2
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >
>     > 00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 3
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >       Kernel driver in use: k10temp
>     >       Kernel modules: k10temp
>     >
>     > 00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 4
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >
>     > 00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 5
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >
>     > 00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 6
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >
>     > 00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
>     Ridge Data Fabric; Function 7
>     >       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       IOMMU group: 11
>     >
>     > 01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
>     Upstream Port of PCI Express Switch (rev c1) (prog-if 00 [Normal decode])
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B routed to IRQ 34
>     >       IOMMU group: 12
>     >       Region 0: Memory at dcd00000 (32-bit, non-prefetchable) [size=16K]
>     >       Bus: primary=01, secondary=02, subordinate=03, sec-latency=0
>     >       I/O behind bridge: f000-ffff [size=4K] [16-bit]
>     >       Memory behind bridge: dcb00000-dccfffff [size=2M] [32-bit]
>     >       Prefetchable memory behind bridge: f800000000-fc0fffffff [size=
>     16640M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [58] Express (v2) Upstream Port, IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
>     SlotPowerLimit 75W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 256 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L1, Exit
>     Latency L1 <64us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq+ OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: Routing+ 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [150 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr+ CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 14, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 05080001 0000010f 02080000 00000000
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [320 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Capabilities: [400 v1] Data Link Feature <?>
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [440 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady+ MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
>     Downstream Port of PCI Express Switch (prog-if 00 [Normal decode])
>     >       Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
>     Downstream Port of PCI Express Switch
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 35
>     >       IOMMU group: 13
>     >       Bus: primary=02, secondary=03, subordinate=03, sec-latency=0
>     >       I/O behind bridge: f000-ffff [size=4K] [16-bit]
>     >       Memory behind bridge: dcb00000-dccfffff [size=2M] [32-bit]
>     >       Prefetchable memory behind bridge: f800000000-fc0fffffff [size=
>     16640M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [58] Express (v2) Downstream Port (Slot-), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 256 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq+ OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing+
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -3.5dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [c0] Subsystem: Advanced Micro Devices, Inc. [AMD/
>     ATI] Navi 10 XL Downstream Port of PCI Express Switch
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [150 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [400 v1] Data Link Feature <?>
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [440 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady+ MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
>     Navi 22 [Radeon RX 6700/6700 XT/6750 XT / 6800M/6850M XT] (rev c1) (prog-if
>     00 [VGA controller])
>     >       Subsystem: Sapphire Technology Limited Sapphire Radeon RX 6700
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 101
>     >       IOMMU group: 14
>     >       Region 0: Memory at f800000000 (64-bit, prefetchable) [size=16G]
>     >       Region 2: Memory at fc00000000 (64-bit, prefetchable) [size=256M]
>     >       Region 4: I/O ports at f000 [size=256]
>     >       Region 5: Memory at dcb00000 (32-bit, non-prefetchable) [size=1M]
>     >       Expansion ROM at dcc00000 [disabled] [size=128K]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0-,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 256 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq+ OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn+
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [150 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 14, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 04080001 0000000f 03020000 00000000
>     >       Capabilities: [200 v1] Physical Resizable BAR
>     >               BAR 0: current size: 16GB, supported: 256MB 512MB 1GB 2GB
>     4GB 8GB 16GB
>     >               BAR 2: current size: 256MB, supported: 2MB 4MB 8MB 16MB
>     32MB 64MB 128MB 256MB
>     >       Capabilities: [240 v1] Power Budgeting <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Capabilities: [2d0 v1] Process Address Space ID (PASID)
>     >               PASIDCap: Exec+ Priv+, Max PASID Width: 10
>     >               PASIDCtl: Enable+ Exec- Priv-
>     >       Capabilities: [320 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 1048576ns
>     >               Max no snoop latency: 1048576ns
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [440 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady+ MargSoftReady-
>     >       Kernel driver in use: amdgpu
>     >       Kernel modules: amdgpu
>     >
>     > 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23
>     HDMI/DP Audio Controller (prog-if 00 [HDA compatible])
>     >       Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/
>     DP Audio Controller
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin C disabled, MSI(X) routed to IRQ 147
>     >       IOMMU group: 15
>     >       Region 0: Memory at dcc20000 (32-bit, non-prefetchable) [size=16K]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0-,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 256 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq+ OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [150 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 14, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 04080001 0000000f 03020000 00000000
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Kernel driver in use: snd_hda_intel
>     >       Kernel modules: snd_hda_intel
>     >
>     > 04:00.0 Non-Volatile memory controller: Sandisk Corp WD SN560/SN740/SN770
>     /SN5000 NVMe SSD (rev 01) (prog-if 02 [NVM Express])
>     >       Subsystem: Sandisk Corp WD SN560/SN740/SN770/SN5000 NVMe SSD
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 100, 102-117
>     >       IOMMU group: 16
>     >       Region 0: Memory at dcf00000 (64-bit, non-prefetchable) [size=16K]
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0-,D1-,D2-,D3hot-,D3cold-)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [90] MSI: Enable- Count=1/32 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [b0] MSI-X: Enable+ Count=65 Masked-
>     >               Vector table: BAR=0 offset=00003000
>     >               PBA: BAR=0 offset=00002000
>     >       Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s
>     <1us, L1 unlimited
>     >                       ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>     FLReset-
>     >                       MaxPayload 512 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <8us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP-
>     LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [100 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF+
>     >               AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [1b8 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 1048576ns
>     >               Max no snoop latency: 1048576ns
>     >       Capabilities: [300 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [900 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1-
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=32us PortTPowerOnTime=
>     10us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=0us LTR1.2_Threshold=32768ns
>     >               L1SubCtl2: T_PwrOn=10us
>     >       Capabilities: [910 v1] Data Link Feature <?>
>     >       Capabilities: [920 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver+
>     >               PortSta: MargReady+ MargSoftReady+
>     >       Capabilities: [9c0 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Kernel driver in use: nvme
>     >       Kernel modules: nvme
>     >
>     > 05:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Upstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Physical Slot: 0
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B routed to IRQ 24
>     >       IOMMU group: 17
>     >       Bus: primary=05, secondary=06, subordinate=6e, sec-latency=0
>     >       I/O behind bridge: c000-dfff [size=8K] [16-bit]
>     >       Memory behind bridge: a8000000-dc5fffff [size=838M] [32-bit]
>     >       Prefetchable memory behind bridge: fc20000000-fc751fffff [size=
>     1362M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Upstream Port, IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
>     SlotPowerLimit 75W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <32us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr+ CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 14, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 05000001 0000230f 06080000 00000000
>     >       Capabilities: [160 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 1048576ns
>     >               Max no snoop latency: 1048576ns
>     >       Capabilities: [1c0 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [200 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=128us PortTPowerOnTime=
>     10us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=0us LTR1.2_Threshold=32768ns
>     >               L1SubCtl2: T_PwrOn=10us
>     >       Capabilities: [220 v1] Data Link Feature <?>
>     >       Capabilities: [240 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [280 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady+ MargSoftReady+
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 06:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 36
>     >       IOMMU group: 18
>     >       Bus: primary=06, secondary=07, subordinate=68, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: a8000000-dc0fffff [size=833M] [32-bit]
>     >       Prefetchable memory behind bridge: fc20000000-fc751fffff [size=
>     1362M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <32us
>     >                       ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 8GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 26W; Interlock- NoCompl-
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [1c0 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: LaneErr at lane: 0 1 2 3
>     >       Capabilities: [200 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=128us PortTPowerOnTime=
>     150us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=128us LTR1.2_Threshold=284672ns
>     >               L1SubCtl2: T_PwrOn=150us
>     >       Capabilities: [220 v1] Data Link Feature <?>
>     >       Capabilities: [240 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >       Capabilities: [280 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 06:08.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 37
>     >       IOMMU group: 19
>     >       Bus: primary=06, secondary=69, subordinate=69, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: [disabled] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x1, ASPM L1, Exit
>     Latency L1 <32us
>     >                       ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 26W; Interlock- NoCompl-
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr+ CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 14, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 04000001 0000220f 69000000 00000000
>     >       Capabilities: [1c0 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [200 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=128us PortTPowerOnTime=
>     150us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=128us LTR1.2_Threshold=32768ns
>     >               L1SubCtl2: T_PwrOn=10us
>     >       Capabilities: [220 v1] Data Link Feature <?>
>     >       Capabilities: [240 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >       Capabilities: [280 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 06:09.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 38
>     >       IOMMU group: 20
>     >       Bus: primary=06, secondary=6a, subordinate=6a, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: [disabled] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
>     TransPend-
>     >               LnkCap: Port #1, Speed 16GT/s, Width x1, ASPM L1, Exit
>     Latency L1 <32us
>     >                       ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 26W; Interlock- NoCompl-
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr+ CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 14, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 04000001 0000200f 6a000000 00000000
>     >       Capabilities: [1c0 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [200 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=128us PortTPowerOnTime=
>     150us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=128us LTR1.2_Threshold=32768ns
>     >               L1SubCtl2: T_PwrOn=10us
>     >       Capabilities: [220 v1] Data Link Feature <?>
>     >       Capabilities: [240 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >       Capabilities: [280 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 06:0a.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 39
>     >       IOMMU group: 21
>     >       Bus: primary=06, secondary=6b, subordinate=6b, sec-latency=0
>     >       I/O behind bridge: d000-dfff [size=4K] [16-bit]
>     >       Memory behind bridge: dc500000-dc5fffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #2, Speed 16GT/s, Width x1, ASPM L1, Exit
>     Latency L1 <32us
>     >                       ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 26W; Interlock- NoCompl-
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -6dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [1c0 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [200 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=128us PortTPowerOnTime=
>     150us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=150us LTR1.2_Threshold=306176ns
>     >               L1SubCtl2: T_PwrOn=150us
>     >       Capabilities: [220 v1] Data Link Feature <?>
>     >       Capabilities: [240 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >       Capabilities: [280 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 06:0b.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 41
>     >       IOMMU group: 22
>     >       Bus: primary=06, secondary=6c, subordinate=6c, sec-latency=0
>     >       I/O behind bridge: c000-cfff [size=4K] [16-bit]
>     >       Memory behind bridge: dc400000-dc4fffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #3, Speed 16GT/s, Width x1, ASPM L1, Exit
>     Latency L1 <32us
>     >                       ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 26W; Interlock- NoCompl-
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [1c0 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [200 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=128us PortTPowerOnTime=
>     150us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=128us LTR1.2_Threshold=284672ns
>     >               L1SubCtl2: T_PwrOn=150us
>     >       Capabilities: [220 v1] Data Link Feature <?>
>     >       Capabilities: [240 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3-
>     LinkEquRequest-
>     >       Capabilities: [280 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 06:0c.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B routed to IRQ 24
>     >       IOMMU group: 23
>     >       Bus: primary=06, secondary=6d, subordinate=6d, sec-latency=0
>     >       I/O behind bridge: [disabled] [16-bit]
>     >       Memory behind bridge: dc300000-dc3fffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Downstream Port (Slot-), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #12, Speed 2.5GT/s, Width x1, ASPM L0s L1,
>     Exit Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -6dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 06:0d.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset
>     PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
>     >       Subsystem: ASMedia Technology Inc. Device 3328
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B routed to IRQ 25
>     >       IOMMU group: 24
>     >       Bus: primary=06, secondary=6e, subordinate=6e, sec-latency=0
>     >       I/O behind bridge: [disabled] [16-bit]
>     >       Memory behind bridge: dc200000-dc2fffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Downstream Port (Slot-), IntMsgNum
>     0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #13, Speed 2.5GT/s, Width x1, ASPM L0s L1,
>     Exit Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -6dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 07:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge
>     4C 2020] (rev 02) (prog-if 00 [Normal decode])
>     >       Subsystem: Device 87f6:1043
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 128 bytes
>     >       Interrupts: pin B routed to IRQ 24
>     >       IOMMU group: 18
>     >       Bus: primary=07, secondary=08, subordinate=68, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: a8000000-dc0fffff [size=833M] [32-bit]
>     >       Prefetchable memory behind bridge: fc20000000-fc751fffff [size=
>     1362M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Device 87f6:1043
>     >       Capabilities: [c0] Express (v2) Upstream Port, IntMsgNum 0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
>     SlotPowerLimit 26W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L0s L1, Exit
>     Latency L0s <2us, L1 <4us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 8GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -6dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=064 <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [800 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Capabilities: [a00 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=0us PortTPowerOnTime=
>     10us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=0us LTR1.2_Threshold=284672ns
>     >               L1SubCtl2: T_PwrOn=150us
>     >       Capabilities: [b00 v2] Precision Time Measurement
>     >               PTMCap: Requester+ Responder+ Root-
>     >               PTMClockGranularity: Unimplemented
>     >               PTMControl: Enabled- RootSelected-
>     >               PTMEffectiveGranularity: Unknown
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 08:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge
>     4C 2020] (rev 02) (prog-if 00 [Normal decode])
>     >       Subsystem: Device 87f6:1043
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 128 bytes
>     >       Interrupts: pin B routed to IRQ 24
>     >       IOMMU group: 18
>     >       Bus: primary=08, secondary=09, subordinate=09, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: dc000000-dc0fffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: fc75100000-fc751fffff [size=1M]
>     [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Device 87f6:1043
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
>     Latency L0s <2us, L1 <4us
>     >                       ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=1 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed+ WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending- InProgress-
>     >               VC1:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable- ID=1 ArbSelect=Fixed TC/VC=00
>     >                       Status: NegoPending+ InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=064 <?>
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 08:01.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge
>     4C 2020] (rev 02) (prog-if 00 [Normal decode])
>     >       Subsystem: Device 87f6:1043
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 128 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 42
>     >       IOMMU group: 18
>     >       Bus: primary=08, secondary=0a, subordinate=38, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: c0000000-d6efffff [size=367M] [32-bit]
>     >       Prefetchable memory behind bridge: fc50000000-fc74ffffff [size=
>     592M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Device 87f6:1043
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #1, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <4us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
>     Surprise+
>     >                       Slot #1, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
>     HPIrq+ LinkChg+
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=064 <?>
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 08:02.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge
>     4C 2020] (rev 02) (prog-if 00 [Normal decode])
>     >       Subsystem: Device 87f6:1043
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 128 bytes
>     >       Interrupts: pin B routed to IRQ 26
>     >       IOMMU group: 18
>     >       Bus: primary=08, secondary=39, subordinate=39, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: d8000000-d80fffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Device 87f6:1043
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #2, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
>     Latency L0s <2us, L1 <4us
>     >                       ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed unknown, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -6dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 08:03.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge
>     4C 2020] (rev 02) (prog-if 00 [Normal decode])
>     >       Subsystem: Device 87f6:1043
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 128 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 43
>     >       IOMMU group: 18
>     >       Bus: primary=08, secondary=3a, subordinate=68, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: a8000000-beffffff [size=368M] [32-bit]
>     >       Prefetchable memory behind bridge: fc20000000-fc44ffffff [size=
>     592M] [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Device 87f6:1043
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #3, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <4us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
>     Surprise+
>     >                       Slot #3, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending+ InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=064 <?>
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 09:00.0 USB controller: Intel Corporation Thunderbolt 4 NHI [Maple Ridge
>     4C 2020] (prog-if 40 [USB4 Host Interface])
>     >       Subsystem: Device 87f6:1043
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 119-134
>     >       IOMMU group: 18
>     >       Region 0: Memory at fc75100000 (64-bit, prefetchable) [size=256K]
>     >       Region 2: Memory at fc75140000 (64-bit, prefetchable) [size=4K]
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
>     unlimited, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP-
>     LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI-X: Enable+ Count=16 Masked-
>     >               Vector table: BAR=2 offset=00000000
>     >               PBA: BAR=2 offset=00000fa0
>     >       Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Kernel driver in use: thunderbolt
>     >       Kernel modules: thunderbolt
>     >
>     > 0a:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge
>     2020] (rev 03) (prog-if 00 [Normal decode])
>     >       Subsystem: Intel Corporation Device 0000
>     >       Physical Slot: 1
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B routed to IRQ 25
>     >       IOMMU group: 18
>     >       Bus: primary=0a, secondary=0b, subordinate=10, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: c0000000-c02fffff [size=3M] [32-bit]
>     >       Prefetchable memory behind bridge: fc50000000-fc505fffff [size=6M]
>     [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Intel Corporation Device 0000
>     >       Capabilities: [c0] Express (v2) Upstream Port, IntMsgNum 0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=04c <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [800 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Capabilities: [a00 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     L1_PM_Substates+
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >               L1SubCtl2:
>     >       Capabilities: [b00 v1] Precision Time Measurement
>     >               PTMCap: Requester+ Responder+ Root-
>     >               PTMClockGranularity: Unimplemented
>     >               PTMControl: Enabled- RootSelected-
>     >               PTMEffectiveGranularity: Unknown
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 0b:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge
>     2020] (rev 03) (prog-if 00 [Normal decode])
>     >       Subsystem: Intel Corporation Device 0000
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx-
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B routed to IRQ 25
>     >       IOMMU group: 18
>     >       Bus: primary=0b, secondary=0c, subordinate=0c, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: c0200000-c02fffff [size=1M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Intel Corporation Device 0000
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=04c <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 0b:01.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge
>     2020] (rev 03) (prog-if 00 [Normal decode])
>     >       Subsystem: Intel Corporation Device 0000
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 44
>     >       IOMMU group: 18
>     >       Bus: primary=0b, secondary=0d, subordinate=0d, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: [disabled] [32-bit]
>     >       Prefetchable memory behind bridge: fc50000000-fc501fffff [size=2M]
>     [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Intel Corporation Device 0000
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #1, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
>     Surprise+
>     >                       Slot #1, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending+ InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=04c <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 0b:02.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge
>     2020] (rev 03) (prog-if 00 [Normal decode])
>     >       Subsystem: Intel Corporation Device 0000
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 45
>     >       IOMMU group: 18
>     >       Bus: primary=0b, secondary=0e, subordinate=0e, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: [disabled] [32-bit]
>     >       Prefetchable memory behind bridge: fc50200000-fc503fffff [size=2M]
>     [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Intel Corporation Device 0000
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #2, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
>     Surprise+
>     >                       Slot #2, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending+ InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=04c <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 0b:03.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge
>     2020] (rev 03) (prog-if 00 [Normal decode])
>     >       Subsystem: Intel Corporation Device 0000
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 46
>     >       IOMMU group: 18
>     >       Bus: primary=0b, secondary=0f, subordinate=0f, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: [disabled] [32-bit]
>     >       Prefetchable memory behind bridge: fc50400000-fc505fffff [size=2M]
>     [32-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Intel Corporation Device 0000
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #3, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk-
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
>     Surprise+
>     >                       Slot #3, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -6dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>     >                       Status: NegoPending+ InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=04c <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 0b:04.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge
>     2020] (rev 03) (prog-if 00 [Normal decode])
>     >       Subsystem: Intel Corporation Device 0000
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 47
>     >       IOMMU group: 18
>     >       Bus: primary=0b, secondary=10, subordinate=10, sec-latency=0
>     >       I/O behind bridge: [disabled] [32-bit]
>     >       Memory behind bridge: c0000000-c01fffff [size=2M] [32-bit]
>     >       Prefetchable memory behind bridge: [disabled] [64-bit]
>     >       Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- <SERR- <PERR-
>     >       BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset-
>     FastB2B-
>     >               PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [ac] Subsystem: Intel Corporation Device 0000
>     >       Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum
>     0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0
>     >                       ExtTag+ RBE+ TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #4, Speed 8GT/s, Width x1, ASPM L1, Exit
>     Latency L1 <4us
>     >                       ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
>     FltModeDis-
>     >               LnkSta: Speed 5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>     >               SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
>     Surprise-
>     >                       Slot #0, PowerLimit 0W; Interlock- NoCompl+
>     >               SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
>     HPIrq- LinkChg-
>     >                       Control: AttnInd Unknown, PwrInd Unknown, Power-
>     Interlock-
>     >               SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
>     Interlock-
>     >                       Changed: MRL- PresDet- LinkState-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- ARIFwd-
>     >                        AtomicOpsCap: Routing-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     ARIFwd-
>     >                        AtomicOpsCtl: EgressBlck-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance-
>     SpeedDis-, Selectable De-emphasis: -3.5dB
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [50] Capability ID 0x15 [0000]
>     >       Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=04c <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [900 v1] Access Control Services
>     >               ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl+ DirectTrans+
>     >               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
>     UpstreamFwd+ EgressCtrl- DirectTrans-
>     >       Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=
>     0006 Rev=0 Len=16 <?>
>     >       Kernel driver in use: pcieport
>     >       Kernel modules: shpchp
>     >
>     > 0c:00.0 USB controller: Intel Corporation Thunderbolt 4 USB Controller
>     [Goshen Ridge 2020] (rev 03) (prog-if 30 [XHCI])
>     >       Subsystem: Intel Corporation Device 0000
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 49-56
>     >       IOMMU group: 18
>     >       Region 0: Memory at c0200000 (32-bit, non-prefetchable) [size=64K]
>     >       Capabilities: [80] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [88] MSI: Enable+ Count=8/8 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
>     unlimited, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP-
>     LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
>     >       Capabilities: [200 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO+ CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 0e, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00001001 0000200f c0200490 e1060200
>     >       Capabilities: [300 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [400 v1] Power Budgeting <?>
>     >       Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
>     Len=100 <?>
>     >       Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2
>     Len=04c <?>
>     >       Capabilities: [700 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [800 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Kernel driver in use: xhci_hcd
>     >       Kernel modules: xhci_pci
>     >
>     > 10:00.0 Ethernet controller: Intel Corporation Ethernet Controller (2)
>     I225-LMvP (rev 03)
>     >       Subsystem: CalDigit, Inc. TS4 On-Board 2.5GbE Ethernet Adaptor
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 138-142
>     >       IOMMU group: 18
>     >       Region 0: Memory at c0000000 (32-bit, non-prefetchable) [size=1M]
>     >       Region 3: Memory at c0100000 (32-bit, non-prefetchable) [size=16K]
>     >       Capabilities: [40] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
>     >       Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >               Masking: 00000000  Pending: 00000000
>     >       Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
>     >               Vector table: BAR=3 offset=00000000
>     >               PBA: BAR=3 offset=00002000
>     >       Capabilities: [a0] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s
>     <512ns, L1 <64us
>     >                       ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>     FLReset-
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit
>     Latency L1 <4us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [100 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [140 v1] Device Serial Number 64-4b-f0-ff-ff-38-ff-0e
>     >       Capabilities: [1c0 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Capabilities: [1f0 v1] Precision Time Measurement
>     >               PTMCap: Requester+ Responder- Root-
>     >               PTMClockGranularity: 4ns
>     >               PTMControl: Enabled+ RootSelected-
>     >               PTMEffectiveGranularity: Unknown
>     >       Capabilities: [1e0 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+
>     L1_PM_Substates+
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >               L1SubCtl2:
>     >       Kernel driver in use: igc
>     >       Kernel modules: igc
>     >
>     > 39:00.0 USB controller: Intel Corporation Thunderbolt 4 USB Controller
>     [Maple Ridge 4C 2020] (prog-if 30 [XHCI])
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: MSI(X) routed to IRQ 57-64
>     >       IOMMU group: 18
>     >       Region 0: Memory at d8000000 (64-bit, non-prefetchable) [size=64K]
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME
>     (D0-,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] MSI: Enable+ Count=8/8 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [90] Vendor Specific Information: Intel <unknown>
>     >       Capabilities: [b0] Vendor Specific Information: Intel Capabilities
>     v1
>     >       Capabilities: [bc] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <2us, L1 <8us
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit
>     Latency L1 <1us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x4
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -6dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [100 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Kernel driver in use: xhci_hcd
>     >       Kernel modules: xhci_pci
>     >
>     > 6b:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8125
>     2.5GbE Controller (rev 05)
>     >       DeviceName: Realtek RTL8125BG LAN
>     >       Subsystem: ASUSTeK Computer Inc. Device 87d7
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 143
>     >       IOMMU group: 21
>     >       Region 0: I/O ports at d000 [size=256]
>     >       Region 2: Memory at dc500000 (64-bit, non-prefetchable) [size=64K]
>     >       Region 4: Memory at dc510000 (64-bit, non-prefetchable) [size=16K]
>     >       Capabilities: [40] Power Management version 3
>     >               Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME
>     (D0+,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >               Masking: 00000000  Pending: 00000000
>     >       Capabilities: [70] Express (v2) Endpoint, IntMsgNum 1
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <512ns, L1 <64us
>     >                       ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 26W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
>     >                       MaxPayload 128 bytes, MaxReadReq 4096 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
>     Latency L0s unlimited, L1 <64us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp+ ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -6dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [b0] MSI-X: Enable+ Count=32 Masked-
>     >               Vector table: BAR=4 offset=00000000
>     >               PBA: BAR=4 offset=00000800
>     >       Capabilities: [d0] Vital Product Data
>     >               Not readable
>     >       Capabilities: [100 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF+
>     >               AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [148 v1] Virtual Channel
>     >               Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>     >               Arb:    Fixed- WRR32- WRR64- WRR128-
>     >               Ctrl:   ArbSelect=Fixed
>     >               Status: InProgress-
>     >               VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>     >                       Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128-
>     WRR256-
>     >                       Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>     >                       Status: NegoPending- InProgress-
>     >       Capabilities: [168 v1] Device Serial Number 01-00-00-00-68-4c-e0-00
>     >       Capabilities: [178 v1] Transaction Processing Hints
>     >               No steering table available
>     >       Capabilities: [204 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Capabilities: [20c v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=150us PortTPowerOnTime=
>     150us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=0us LTR1.2_Threshold=306176ns
>     >               L1SubCtl2: T_PwrOn=150us
>     >       Capabilities: [21c v1] Vendor Specific Information: ID=0002 Rev=4
>     Len=100 <?>
>     >       Kernel driver in use: r8169
>     >       Kernel modules: r8169
>     >
>     > 6c:00.0 Network controller: Realtek Semiconductor Co., Ltd. RTL8852BE
>     PCIe 802.11ax Wireless Network Controller
>     >       Subsystem: AzureWave Device 5471
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 149
>     >       IOMMU group: 22
>     >       Region 0: I/O ports at c000 [size=256]
>     >       Region 2: Memory at dc400000 (64-bit, non-prefetchable) [size=1M]
>     >       Capabilities: [40] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 <64us
>     >                       ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
>     SlotPowerLimit 26W TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
>     FLReset-
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
>     Latency L0s <4us, L1 <64us
>     >                       ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis+
>     NROPrPrP- LTR+
>     >                        10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis+
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer- 2Retimers- DRS-
>     >               LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [100 v2] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF+
>     >               AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
>     ECRCChkCap+ ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [148 v1] Device Serial Number 00-e0-4c-ff-fe-88-52-01
>     >       Capabilities: [158 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Capabilities: [160 v1] L1 PM Substates
>     >               L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>     L1_PM_Substates+
>     >                         PortCommonModeRestoreTime=30us PortTPowerOnTime=
>     60us
>     >               L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>     >                          T_CommonMode=0us LTR1.2_Threshold=284672ns
>     >               L1SubCtl2: T_PwrOn=150us
>     >       Kernel driver in use: rtw89_8852be
>     >       Kernel modules: rtw89_8852be
>     >
>     > 6d:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 600 Series
>     Chipset USB 3.2 Controller (rev 01) (prog-if 30 [XHCI])
>     >       Subsystem: ASMedia Technology Inc. Device 1142
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 65-72
>     >       IOMMU group: 23
>     >       Region 0: Memory at dc300000 (64-bit, non-prefetchable) [size=32K]
>     >       Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
>     >               Vector table: BAR=0 offset=00002000
>     >               PBA: BAR=0 offset=00002080
>     >       Capabilities: [78] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=55mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME+
>     >       Capabilities: [80] Express (v2) Legacy Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s
>     <64ns, L1 <64us
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
>     Latency L0s <4us, L1 <64us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR+
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF+
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Capabilities: [160 v1] Latency Tolerance Reporting
>     >               Max snoop latency: 0ns
>     >               Max no snoop latency: 0ns
>     >       Kernel driver in use: xhci_hcd
>     >       Kernel modules: xhci_pci
>     >
>     > 6e:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] 600 Series
>     Chipset SATA Controller (rev 01) (prog-if 01 [AHCI 1.0])
>     >       Subsystem: ASMedia Technology Inc. Device 1062
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 48
>     >       IOMMU group: 24
>     >       Region 5: Memory at dc280000 (32-bit, non-prefetchable) [size=1K]
>     >       Expansion ROM at dc200000 [disabled] [size=512K]
>     >       Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [70] Power Management version 3
>     >               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=55mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [80] Express (v2) Legacy Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s
>     <64ns, L1 <64us
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     TEE-IO-
>     >               DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
>     Latency L0s <4us, L1 <64us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 2.5GT/s, Width x1
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Not Supported, TimeoutDis-
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [100 v1] Advanced Error Reporting
>     >               UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF- MalfTLP-
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
>     RxOF+ MalfTLP+
>     >                       ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP-
>     AtomicOpBlocked- TLPBlockedErr-
>     >                       PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
>     MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>     >               CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr- HeaderOF-
>     >               CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
>     AdvNonFatalErr- CorrIntErr+ HeaderOF+
>     >               AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
>     ECRCChkCap- ECRCChkEn-
>     >                       MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>     >               HeaderLog: 00000000 00000000 00000000 00000000
>     >       Kernel driver in use: ahci
>     >       Kernel modules: ahci
>     >
>     > 6f:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
>     Raphael (rev cb) (prog-if 00 [VGA controller])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort+
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 118
>     >       IOMMU group: 25
>     >       Region 0: Memory at fc80000000 (64-bit, prefetchable) [size=256M]
>     >       Region 2: Memory at fc90000000 (64-bit, prefetchable) [size=2M]
>     >       Region 4: I/O ports at e000 [size=256]
>     >       Region 5: Memory at dca00000 (32-bit, non-prefetchable) [size=512K]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0-,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn+
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable- Count=1/4 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [c0] MSI-X: Enable+ Count=4 Masked-
>     >               Vector table: BAR=5 offset=00042000
>     >               PBA: BAR=5 offset=00043000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Capabilities: [2b0 v1] Address Translation Service (ATS)
>     >               ATSCap: Invalidate Queue Depth: 00
>     >               ATSCtl: Enable+, Smallest Translation Unit: 00
>     >       Capabilities: [2c0 v1] Page Request Interface (PRI)
>     >               PRICtl: Enable+ Reset-
>     >               PRISta: RF- UPRGI- Stopped+ PASID-
>     >               Page Request Capacity: 00000100, Page Request Allocation:
>     00000020
>     >       Capabilities: [2d0 v1] Process Address Space ID (PASID)
>     >               PASIDCap: Exec+ Priv+, Max PASID Width: 10
>     >               PASIDCtl: Enable+ Exec- Priv-
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [450 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: amdgpu
>     >       Kernel modules: amdgpu
>     >
>     > 6f:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Radeon High
>     Definition Audio Controller (prog-if 00 [HDA compatible])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin C disabled, MSI(X) routed to IRQ 146
>     >       IOMMU group: 26
>     >       Region 0: Memory at dca88000 (32-bit, non-prefetchable) [size=16K]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0-,D1+,D2+,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn+
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Kernel driver in use: snd_hda_intel
>     >       Kernel modules: snd_hda_intel
>     >
>     > 6f:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family
>     19h PSP/CCP
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin D disabled, MSI(X) routed to IRQ 136-137
>     >       IOMMU group: 27
>     >       Region 2: Memory at dc900000 (32-bit, non-prefetchable) [size=1M]
>     >       Region 5: Memory at dca8c000 (32-bit, non-prefetchable) [size=8K]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0-,D1-,D2-,D3hot-,D3cold-)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable- Count=1/2 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [c0] MSI-X: Enable+ Count=2 Masked-
>     >               Vector table: BAR=5 offset=00000000
>     >               PBA: BAR=5 offset=00001000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Kernel driver in use: ccp
>     >       Kernel modules: ccp
>     >
>     > 6f:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/
>     Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin E disabled, MSI(X) routed to IRQ 74-81
>     >       IOMMU group: 28
>     >       Region 0: Memory at dc800000 (64-bit, non-prefetchable) [size=1M]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
>     >               Vector table: BAR=0 offset=000fe000
>     >               PBA: BAR=0 offset=000ff000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Kernel driver in use: xhci_hcd
>     >       Kernel modules: xhci_pci
>     >
>     > 6f:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/
>     Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 83-90
>     >       IOMMU group: 29
>     >       Region 0: Memory at dc700000 (64-bit, non-prefetchable) [size=1M]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
>     >               Vector table: BAR=0 offset=000fe000
>     >               PBA: BAR=0 offset=000ff000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Kernel driver in use: xhci_hcd
>     >       Kernel modules: xhci_pci
>     >
>     > 6f:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Ryzen HD Audio
>     Controller (prog-if 00 [HDA compatible])
>     >       DeviceName: Realtek ALC1200 Audio
>     >       Subsystem: ASUSTeK Computer Inc. Device 88b9
>     >       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Latency: 0, Cache Line Size: 64 bytes
>     >       Interrupts: pin D disabled, MSI(X) routed to IRQ 148
>     >       IOMMU group: 30
>     >       Region 0: Memory at dca80000 (32-bit, non-prefetchable) [size=32K]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete- EqualizationPhase1-
>     >                        EqualizationPhase2- EqualizationPhase3-
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>     >               Address: 00000000fee00000  Data: 0000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Kernel driver in use: snd_hda_intel
>     >       Kernel modules: snd_hda_intel
>     >
>     > 70:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/
>     Granite Ridge USB 2.0 xHCI (prog-if 30 [XHCI])
>     >       Subsystem: ASUSTeK Computer Inc. Device 8877
>     >       Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
>     Stepping- SERR- FastB2B- DisINTx+
>     >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>     <TAbort- <MAbort- >SERR- <PERR- INTx-
>     >       Interrupts: pin B disabled, MSI(X) routed to IRQ 91-98
>     >       IOMMU group: 31
>     >       Region 0: Memory at dce00000 (64-bit, non-prefetchable) [size=1M]
>     >       Capabilities: [48] Vendor Specific Information: Len=08 <?>
>     >       Capabilities: [50] Power Management version 3
>     >               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME
>     (D0+,D1-,D2-,D3hot+,D3cold+)
>     >               Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
>     >       Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
>     >               DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
>     <4us, L1 unlimited
>     >                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>     SlotPowerLimit 0W TEE-IO-
>     >               DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>     >                       RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>     >                       MaxPayload 128 bytes, MaxReadReq 512 bytes
>     >               DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
>     TransPend-
>     >               LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
>     Latency L0s <64ns, L1 <1us
>     >                       ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>     >               LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>     >                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>     FltModeDis-
>     >               LnkSta: Speed 16GT/s, Width x16
>     >                       TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>     >               DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
>     NROPrPrP- LTR-
>     >                        10BitTagComp+ 10BitTagReq- OBFF Not Supported,
>     ExtFmt- EETLPPrefix-
>     >                        EmergencyPowerReduction Not Supported,
>     EmergencyPowerReductionInit-
>     >                        FRS- TPHComp- ExtTPHComp-
>     >                        AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>     >               DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>     >                        AtomicOpsCtl: ReqEn-
>     >                        IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>     >                        10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>     >               LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
>     Retimer+ 2Retimers+ DRS-
>     >               LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance-
>     SpeedDis-
>     >                        Transmit Margin: Normal Operating Range,
>     EnterModifiedCompliance- ComplianceSOS-
>     >                        Compliance Preset/De-emphasis: -6dB de-emphasis,
>     0dB preshoot
>     >               LnkSta2: Current De-emphasis Level: -3.5dB,
>     EqualizationComplete+ EqualizationPhase1+
>     >                        EqualizationPhase2+ EqualizationPhase3+
>     LinkEqualizationRequest-
>     >                        Retimer- 2Retimers- CrosslinkRes: unsupported,
>     FltMode-
>     >       Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
>     >               Address: 0000000000000000  Data: 0000
>     >       Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
>     >               Vector table: BAR=0 offset=000fe000
>     >               PBA: BAR=0 offset=000ff000
>     >       Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
>     Len=010 <?>
>     >       Capabilities: [270 v1] Secondary PCI Express
>     >               LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>     >               LaneErrStat: 0
>     >       Capabilities: [2a0 v1] Access Control Services
>     >               ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
>     UpstreamFwd- EgressCtrl- DirectTrans-
>     >       Capabilities: [410 v1] Physical Layer 16.0 GT/s
>     >               Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+
>     LinkEquRequest-
>     >       Capabilities: [450 v1] Lane Margining at the Receiver
>     >               PortCap: Uses Driver-
>     >               PortSta: MargReady- MargSoftReady-
>     >       Kernel driver in use: xhci_hcd
>     >       Kernel modules: xhci_pci
>     >
> 
> 

> ############################################
> # Captured: Tue Sep 15 04:43:55 AM UTC 2026
> ############################################
> 
> === uname -r ===
> 7.3.0-rc2-1-mainline
> 
> === uname -a ===
> Linux moomooPC-cachy 7.3.0-rc2-1-mainline #1 SMP PREEMPT_DYNAMIC Tue, 15 Sep 2026 02:32:12 +0000 x86_64 GNU/Linux
> 
> === /proc/cmdline ===
> initrd=\initramfs-linux-mainline.img root=UUID=a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 rw rootflags=subvol=/@ zswap.enabled=0 nowatchdog quiet thunderbolt.dyndbg=+p
> 
> === bootctl status (bootloader / active entry) ===
> System:
>       Firmware: UEFI 2.90 (American Megatrends 5.26)
>  Firmware Arch: x64
>    Secure Boot: disabled
>   TPM2 Support: yes
>   Measured UKI: no
>    Measured OS: no
>   Boot into FW: supported
>  Platform Lang: en_US.UTF-8
> 
> Current Boot Loader:
>         Product: systemd-boot 261.3-1-arch
>        Features: ✓ Boot counting
>                  ✓ Menu timeout control
>                  ✓ One-shot menu timeout control
>                  ✓ Default entry control
>                  ✓ One-shot entry control
>                  ✓ Support for XBOOTLDR partition
>                  ✓ Support for passing random seed to OS
>                  ✓ Load drop-in drivers
>                  ✓ Support Type #1 sort-key field
>                  ✓ Support @saved pseudo-entry
>                  ✓ Support Type #1 devicetree field
>                  ✓ Enroll SecureBoot keys
>                  ✓ Retain SHIM protocols
>                  ✓ Menu can be disabled
>                  ✓ Multi-Profile UKIs are supported
>                  ✓ Loader reports network boot URL
>                  ✓ Support Type #1 uki field
>                  ✓ Support Type #1 uki-url field
>                  ✓ Loader reports active TPM2 PCR banks
>                  ✓ Loader reports firmware keyboard layout
>                  ✓ Loader measures SMBIOS information
>       Partition: /dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a
>          Loader: └─/boot//EFI/BOOT/BOOTX64.EFI
> Keyboard Layout: n/a (not reported by firmware)
>   Current Entry: linux-mainline.conf
> 
> Random Seed:
>  System Token: set
>        Exists: yes
> 
> Available Boot Loaders on ESP:
>           ESP: /boot (/dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a)
>          File: ├─/boot//EFI/systemd/systemd-boot-fallbackx64.efi (systemd-boot 261.2-1-arch)
>                ├─/boot//EFI/systemd/systemd-bootx64.efi (systemd-boot 261.3-1-arch)
>                └─/boot//EFI/BOOT/BOOTX64.EFI (systemd-boot 261.3-1-arch)
> 
> Boot Loaders Listed in EFI Variables:
>         Title: UEFI OS
>            ID: 0x0001
>        Status: active, boot-order
>     Partition: /dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a
>          File: └─/boot//EFI/BOOT/BOOTX64.EFI
> 
>         Title: Linux Boot Manager
>            ID: 0x0000
>        Status: active, boot-order
>     Partition: /dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a
>          File: └─/boot//EFI/systemd/systemd-bootx64.efi
> 
>         Title: Fallback Linux Boot Manager
>            ID: 0x0002
>        Status: active, boot-order
>     Partition: /dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a
>          File: └─/boot//EFI/systemd/systemd-boot-fallbackx64.efi
> 
> Boot Loader Entry Locations:
>           ESP: /boot (/dev/disk/by-partuuid/96ac16a9-6809-407c-9f2b-2d422147eb1a, $BOOT)
>        config: /boot//loader/loader.conf
>         token: cachyos
> 
> Default Boot Loader Entry:
>          type: Boot Loader Specification Type #1 (.conf)
>         title: Linux
>            id: linux.conf
>        source: /boot//loader/entries/linux.conf (on the EFI System Partition)
>         linux: /boot//vmlinuz-linux
>        initrd: /boot//initramfs-linux.img
>       options: root=UUID=a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 rw rootflags=subvol=/@ zswap.enabled=0 nowatchdog quiet pcie_aspm=off iommu=soft usbcore.autosuspend=-1 thunderbolt.d3cold=0 thunderbolt.host_reset=0
> 
> === boltctl list ===
>  * CalDigit, Inc. TS4
>    |- type:          peripheral
>    |- name:          TS4
>    |- vendor:        CalDigit, Inc.
>    |- uuid:          6bfd8780-0027-b0bc-ffff-ffffffffffff
>    |- generation:    USB4
>    |- status:        authorized
>    |  |- domain:     d3fb8780-004a-2159-ffff-ffffffffffff
>    |  |- rx speed:   40 Gb/s = 2 lanes * 20 Gb/s
>    |  |- tx speed:   40 Gb/s = 2 lanes * 20 Gb/s
>    |  `- authflags:  boot
>    |- authorized:    Tue 15 Sep 2026 04:43:03 AM UTC
>    |- connected:     Tue 15 Sep 2026 04:43:03 AM UTC
>    `- stored:        Sun 13 Sep 2026 11:02:17 PM UTC
>       |- policy:     iommu
>       `- key:        no
> 
> 
> === Thunderbolt NVM versions ===
> /sys/bus/thunderbolt/devices/0-0/nvm_version: 43.83
> /sys/bus/thunderbolt/devices/0-1/nvm_version: 45.83
> 
> === lspci -tv (tree) ===
> -[0000:00]-+-00.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Root Complex
>            +-00.2  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge IOMMU
>            +-01.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
>            +-01.1-[01-03]----00.0-[02-03]----00.0-[03]--+-00.0  Advanced Micro Devices, Inc. [AMD/ATI] Navi 22 [Radeon RX 6700/6700 XT/6750 XT / 6800M/6850M XT]
>            |                                            \-00.1  Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller
>            +-01.2-[04]----00.0  Sandisk Corp WD SN560/SN740/SN770/SN5000 NVMe SSD
>            +-02.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
>            +-02.1-[05-6e]----00.0-[06-6e]--+-00.0-[07-68]----00.0-[08-68]--+-00.0-[09]----00.0  Intel Corporation Thunderbolt 4 NHI [Maple Ridge 4C 2020]
>            |                               |                               +-01.0-[0a-38]----00.0-[0b-10]--+-00.0-[0c]----00.0  Intel Corporation Thunderbolt 4 USB Controller [Goshen Ridge 2020]
>            |                               |                               |                               +-01.0-[0d]--
>            |                               |                               |                               +-02.0-[0e]--
>            |                               |                               |                               +-03.0-[0f]--
>            |                               |                               |                               \-04.0-[10]----00.0  Intel Corporation Ethernet Controller (2) I225-LMvP
>            |                               |                               +-02.0-[39]----00.0  Intel Corporation Thunderbolt 4 USB Controller [Maple Ridge 4C 2020]
>            |                               |                               \-03.0-[3a-68]--
>            |                               +-08.0-[69]--
>            |                               +-09.0-[6a]--
>            |                               +-0a.0-[6b]----00.0  Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller
>            |                               +-0b.0-[6c]----00.0  Realtek Semiconductor Co., Ltd. RTL8852BE PCIe 802.11ax Wireless Network Controller
>            |                               +-0c.0-[6d]----00.0  Advanced Micro Devices, Inc. [AMD] 600 Series Chipset USB 3.2 Controller
>            |                               \-0d.0-[6e]----00.0  Advanced Micro Devices, Inc. [AMD] 600 Series Chipset SATA Controller
>            +-03.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
>            +-04.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
>            +-08.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
>            +-08.1-[6f]--+-00.0  Advanced Micro Devices, Inc. [AMD/ATI] Raphael
>            |            +-00.1  Advanced Micro Devices, Inc. [AMD/ATI] Radeon High Definition Audio Controller
>            |            +-00.2  Advanced Micro Devices, Inc. [AMD] Family 19h PSP/CCP
>            |            +-00.3  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 3.1 xHCI
>            |            +-00.4  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 3.1 xHCI
>            |            \-00.6  Advanced Micro Devices, Inc. [AMD] Ryzen HD Audio Controller
>            +-08.3-[70]----00.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 2.0 xHCI
>            +-14.0  Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller
>            +-14.3  Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge
>            +-18.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 0
>            +-18.1  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 1
>            +-18.2  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 2
>            +-18.3  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 3
>            +-18.4  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 4
>            +-18.5  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 5
>            +-18.6  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 6
>            \-18.7  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 7
> 
> === power/control state for relevant PCI devices ===
> 06:00.0: auto
> 06:08.0: auto
> 06:09.0: auto
> 07:00.0: auto
> 08:00.0: auto
> 08:01.0: auto
> 08:02.0: auto
> 08:03.0: auto
> 09:00.0: on
> 0a:00.0: auto
> 0b:00.0: auto
> 0b:01.0: auto
> 0b:02.0: auto
> 0b:03.0: auto
> 0b:04.0: auto
> 0c:00.0: on
> 6d:00.0: auto
> 
> === dmesg: AER / corrected / uncorrectable check ===
> [Tue Sep 15 00:42:36 2026] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
> 
> === dmesg: xhci_hcd 0000:0c:00.0 lines ===
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: [8086:0b27] type 00 class 0x0c0330 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: BAR 0 [mem 0xc0200000-0xc020ffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 1
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: hcc params 0x20007fc1 hci version 0x110 quirks 0x0000000000009810
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 2
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> [Tue Sep 15 00:42:36 2026] usb usb1: SerialNumber: 0000:0c:00.0
> [Tue Sep 15 00:42:36 2026] usb usb2: SerialNumber: 0000:0c:00.0
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: -110
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: xHCI host controller not responding, assume dead
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: HC died; cleaning up
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Error while assigning device slot ID: Command Aborted
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI host supports is 64.
> 
> === dmesg: full failure context (10 lines before/after abort) ===
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: RAS: optional ras ta ucode is not available
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: SECUREDISPLAY: optional securedisplay ta ucode is not available
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: smu driver if version = 0x0000000e, smu fw if version = 0x00000012, smu fw program = 0, smu fw version = 0x00413f00 (65.63.0)
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: use vbios provided pptable
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: SMU is initialized successfully!
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] Display Core v3.2.392 initialized on DCN 3.0
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] DP-HDMI FRL PCON supported
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] DMUB hardware initialized: version=0x02020022
> [Tue Sep 15 00:42:42 2026] workqueue: name exceeds WQ_NAME_LEN. Truncating to: hdmi_frl_status_polling_workque
> [Tue Sep 15 00:42:49 2026] clocksource: Watchdog remote CPU 9 read timed out
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: -110
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: xHCI host controller not responding, assume dead
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: HC died; cleaning up
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Error while assigning device slot ID: Command Aborted
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI host supports is 64.
> [Tue Sep 15 00:43:00 2026] usb usb1-port1: couldn't allocate usb_device
> [Tue Sep 15 00:43:00 2026] usb usb2-port1: couldn't allocate usb_device
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: kiq ring mec 2 pipe 1 q 0
> [Tue Sep 15 00:43:01 2026] kfd kfd: Allocated 3969056 bytes on gart
> [Tue Sep 15 00:43:01 2026] kfd kfd: Total number of KFD nodes to be created: 1
> [Tue Sep 15 00:43:01 2026] amdgpu: Virtual CRAT table created for GPU
> 
> === dmesg: FULL LOG ===
> [Tue Sep 15 00:42:35 2026]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [Tue Sep 15 00:42:35 2026]   Normal   [mem 0x0000000100000000-0x000000085defffff]
> [Tue Sep 15 00:42:35 2026]   Device   empty
> [Tue Sep 15 00:42:35 2026] Movable zone start for each node
> [Tue Sep 15 00:42:35 2026] Early memory node ranges
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x0000000000100000-0x00000000099fefff]
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x000000000a210000-0x000000000affffff]
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x000000000b021000-0x000000006abdefff]
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x00000000781ff000-0x0000000079ff8fff]
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x0000000079ffc000-0x0000000079ffffff]
> [Tue Sep 15 00:42:35 2026]   node   0: [mem 0x0000000100000000-0x000000085defffff]
> [Tue Sep 15 00:42:35 2026] Initmem setup node 0 [mem 0x0000000000001000-0x000000085defffff]
> [Tue Sep 15 00:42:35 2026] On node 0, zone DMA: 1 pages in unavailable ranges
> [Tue Sep 15 00:42:35 2026] On node 0, zone DMA: 96 pages in unavailable ranges
> [Tue Sep 15 00:42:35 2026] On node 0, zone DMA32: 1537 pages in unavailable ranges
> [Tue Sep 15 00:42:35 2026] On node 0, zone DMA32: 16 pages in unavailable ranges
> [Tue Sep 15 00:42:35 2026] On node 0, zone DMA32: 33 pages in unavailable ranges
> [Tue Sep 15 00:42:35 2026] On node 0, zone DMA32: 22048 pages in unavailable ranges
> [Tue Sep 15 00:42:35 2026] On node 0, zone DMA32: 3 pages in unavailable ranges
> [Tue Sep 15 00:42:36 2026] On node 0, zone Normal: 24576 pages in unavailable ranges
> [Tue Sep 15 00:42:36 2026] On node 0, zone Normal: 8448 pages in unavailable ranges
> [Tue Sep 15 00:42:36 2026] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
> [Tue Sep 15 00:42:36 2026] percpu: Embedded 64 pages/cpu s225280 r8192 d28672 u262144
> [Tue Sep 15 00:42:36 2026] pcpu-alloc: s225280 r8192 d28672 u262144 alloc=1*2097152
> [Tue Sep 15 00:42:36 2026] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
> [Tue Sep 15 00:42:36 2026] Kernel command line: initrd=\initramfs-linux-mainline.img root=UUID=a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 rw rootflags=subvol=/@ zswap.enabled=0 nowatchdog quiet thunderbolt.dyndbg=+p
> [Tue Sep 15 00:42:36 2026] printk: log buffer data + meta data: 131072 + 557056 = 688128 bytes
> [Tue Sep 15 00:42:36 2026] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
> [Tue Sep 15 00:42:36 2026] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
> [Tue Sep 15 00:42:36 2026] software IO TLB: area num 16.
> [Tue Sep 15 00:42:36 2026] Fallback order for Node 0: 0 
> [Tue Sep 15 00:42:36 2026] Built 1 zonelists, mobility grouping on.  Total pages: 8168010
> [Tue Sep 15 00:42:36 2026] Policy zone: Normal
> [Tue Sep 15 00:42:36 2026] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
> [Tue Sep 15 00:42:36 2026] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
> [Tue Sep 15 00:42:36 2026] ftrace: allocating 59266 entries in 232 pages
> [Tue Sep 15 00:42:36 2026] ftrace: allocated 232 pages with 4 groups
> [Tue Sep 15 00:42:36 2026] Dynamic Preempt: full
> [Tue Sep 15 00:42:36 2026] rcu: Preemptible hierarchical RCU implementation.
> [Tue Sep 15 00:42:36 2026] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=16.
> [Tue Sep 15 00:42:36 2026] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
> [Tue Sep 15 00:42:36 2026] 	Trampoline variant of Tasks RCU enabled.
> [Tue Sep 15 00:42:36 2026] 	Rude variant of Tasks RCU enabled.
> [Tue Sep 15 00:42:36 2026] 	Tracing variant of Tasks RCU enabled.
> [Tue Sep 15 00:42:36 2026] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
> [Tue Sep 15 00:42:36 2026] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
> [Tue Sep 15 00:42:36 2026] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
> [Tue Sep 15 00:42:36 2026] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
> [Tue Sep 15 00:42:36 2026] NR_IRQS: 524544, nr_irqs: 1096, preallocated irqs: 16
> [Tue Sep 15 00:42:36 2026] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [Tue Sep 15 00:42:36 2026] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
> [Tue Sep 15 00:42:36 2026] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
> [Tue Sep 15 00:42:36 2026] Console: colour dummy device 80x25
> [Tue Sep 15 00:42:36 2026] printk: legacy console [tty0] enabled
> [Tue Sep 15 00:42:36 2026] ACPI: Core revision 20260408
> [Tue Sep 15 00:42:36 2026] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
> [Tue Sep 15 00:42:36 2026] APIC: Switch to symmetric I/O mode setup
> [Tue Sep 15 00:42:36 2026] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x0
> [Tue Sep 15 00:42:36 2026] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [Tue Sep 15 00:42:36 2026] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x3c6c9816305, max_idle_ns: 440795284625 ns
> [Tue Sep 15 00:42:36 2026] Calibrating delay loop (skipped), value calculated using timer frequency.. 8383.85 BogoMIPS (lpj=4191928)
> [Tue Sep 15 00:42:36 2026] x86/cpu: User Mode Instruction Prevention (UMIP) activated
> [Tue Sep 15 00:42:36 2026] LVT offset 1 assigned for vector 0xf9
> [Tue Sep 15 00:42:36 2026] LVT offset 2 assigned for vector 0xf4
> [Tue Sep 15 00:42:36 2026] Last level iTLB entries: 4KB 512, 2MB 512, 4MB 256
> [Tue Sep 15 00:42:36 2026] Last level dTLB entries: 4KB 3072, 2MB 3072, 4MB 1536, 1GB 0
> [Tue Sep 15 00:42:36 2026] process: using mwait in idle threads
> [Tue Sep 15 00:42:36 2026] mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
> [Tue Sep 15 00:42:36 2026] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [Tue Sep 15 00:42:36 2026] Transient Scheduler Attacks: Mitigation: Clear CPU buffers
> [Tue Sep 15 00:42:36 2026] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
> [Tue Sep 15 00:42:36 2026] Spectre V2 : User space: Mitigation: STIBP always-on protection
> [Tue Sep 15 00:42:36 2026] Speculative Return Stack Overflow: Mitigation: Safe RET
> [Tue Sep 15 00:42:36 2026] VMSCAPE: Mitigation: IBPB before exit to userspace
> [Tue Sep 15 00:42:36 2026] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [Tue Sep 15 00:42:36 2026] Spectre V2 : Enabling IBPB for BPF
> [Tue Sep 15 00:42:36 2026] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [Tue Sep 15 00:42:36 2026] active return thunk: srso_alias_return_thunk
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
> [Tue Sep 15 00:42:36 2026] x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Kernel registers (KVM only)'
> [Tue Sep 15 00:42:36 2026] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [Tue Sep 15 00:42:36 2026] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
> [Tue Sep 15 00:42:36 2026] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
> [Tue Sep 15 00:42:36 2026] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
> [Tue Sep 15 00:42:36 2026] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
> [Tue Sep 15 00:42:36 2026] x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
> [Tue Sep 15 00:42:36 2026] x86/fpu: xstate_offset[12]: 2456, xstate_sizes[12]:   24
> [Tue Sep 15 00:42:36 2026] x86/fpu: Enabled xstate features 0x1ae7, context size is 2480 bytes, using 'compacted' format.
> [Tue Sep 15 00:42:36 2026] pid_max: default: 32768 minimum: 301
> [Tue Sep 15 00:42:36 2026] landlock: Up and running.
> [Tue Sep 15 00:42:36 2026] Yama: becoming mindful.
> [Tue Sep 15 00:42:36 2026] LSM support for eBPF active
> [Tue Sep 15 00:42:36 2026] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [Tue Sep 15 00:42:36 2026] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [Tue Sep 15 00:42:36 2026] VFS: Finished mounting rootfs on nullfs
> [Tue Sep 15 00:42:36 2026] smpboot: CPU0: AMD Ryzen 7 7800X3D 8-Core Processor (family: 0x19, model: 0x61, stepping: 0x2)
> [Tue Sep 15 00:42:36 2026] Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD PMU driver.
> [Tue Sep 15 00:42:36 2026] ... version:                   2
> [Tue Sep 15 00:42:36 2026] ... bit width:                 48
> [Tue Sep 15 00:42:36 2026] ... generic counters:          6
> [Tue Sep 15 00:42:36 2026] ... generic bitmap:            000000000000003f
> [Tue Sep 15 00:42:36 2026] ... fixed-purpose counters:    0
> [Tue Sep 15 00:42:36 2026] ... fixed-purpose bitmap:      0000000000000000
> [Tue Sep 15 00:42:36 2026] ... value mask:                0000ffffffffffff
> [Tue Sep 15 00:42:36 2026] ... max period:                00007fffffffffff
> [Tue Sep 15 00:42:36 2026] ... global_ctrl mask:          000000000000003f
> [Tue Sep 15 00:42:36 2026] signal: max sigframe size: 3376
> [Tue Sep 15 00:42:36 2026] rcu: Hierarchical SRCU implementation.
> [Tue Sep 15 00:42:36 2026] rcu: 	Max phase no-delay instances is 400.
> [Tue Sep 15 00:42:36 2026] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
> [Tue Sep 15 00:42:36 2026] MCE: In-kernel MCE decoding enabled.
> [Tue Sep 15 00:42:36 2026] smp: Bringing up secondary CPUs ...
> [Tue Sep 15 00:42:36 2026] smpboot: x86: Booting SMP configuration:
> [Tue Sep 15 00:42:36 2026] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
> [Tue Sep 15 00:42:36 2026] Spectre V2 : Update user space SMT mitigation: STIBP always-on
> [Tue Sep 15 00:42:36 2026] smp: Brought up 1 node, 16 CPUs
> [Tue Sep 15 00:42:36 2026] smpboot: Total of 16 processors activated (134141.69 BogoMIPS)
> [Tue Sep 15 00:42:36 2026] Memory: 31827624K/32672040K available (22437K kernel code, 3074K rwdata, 17976K rodata, 4972K init, 4980K bss, 826952K reserved, 0K cma-reserved)
> [Tue Sep 15 00:42:36 2026] devtmpfs: initialized
> [Tue Sep 15 00:42:36 2026] x86/mm: Memory block size: 128MB
> [Tue Sep 15 00:42:36 2026] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20ffff] (65536 bytes)
> [Tue Sep 15 00:42:36 2026] ACPI: PM: Registering ACPI NVS region [mem 0x71529000-0x73528fff] (33554432 bytes)
> [Tue Sep 15 00:42:36 2026] posixtimers hash table entries: 8192 (order: 5, 131072 bytes, linear)
> [Tue Sep 15 00:42:36 2026] futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes, total 256 KiB, linear).
> [Tue Sep 15 00:42:36 2026] xor: automatically using best checksumming function   avx       
> [Tue Sep 15 00:42:36 2026] PM: RTC time: 04:42:36, date: 2026-09-15
> [Tue Sep 15 00:42:36 2026] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [Tue Sep 15 00:42:36 2026] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
> [Tue Sep 15 00:42:36 2026] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [Tue Sep 15 00:42:36 2026] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [Tue Sep 15 00:42:36 2026] audit: initializing netlink subsys (disabled)
> [Tue Sep 15 00:42:36 2026] audit: type=2000 audit(1789447355.160:1): state=initialized audit_enabled=0 res=1
> [Tue Sep 15 00:42:36 2026] thermal_sys: Registered thermal governor 'fair_share'
> [Tue Sep 15 00:42:36 2026] thermal_sys: Registered thermal governor 'bang_bang'
> [Tue Sep 15 00:42:36 2026] thermal_sys: Registered thermal governor 'step_wise'
> [Tue Sep 15 00:42:36 2026] thermal_sys: Registered thermal governor 'user_space'
> [Tue Sep 15 00:42:36 2026] thermal_sys: Registered thermal governor 'power_allocator'
> [Tue Sep 15 00:42:36 2026] cpuidle: using governor ladder
> [Tue Sep 15 00:42:36 2026] cpuidle: using governor menu
> [Tue Sep 15 00:42:36 2026] efi: Freeing EFI boot services memory: 75476K
> [Tue Sep 15 00:42:36 2026] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
> [Tue Sep 15 00:42:36 2026] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [Tue Sep 15 00:42:36 2026] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for domain 0000 [bus 00-ff]
> [Tue Sep 15 00:42:36 2026] PCI: Using configuration type 1 for base access
> [Tue Sep 15 00:42:36 2026] virt/tdx: TDX not supported by the host platform
> [Tue Sep 15 00:42:36 2026] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
> [Tue Sep 15 00:42:36 2026] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> [Tue Sep 15 00:42:36 2026] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> [Tue Sep 15 00:42:36 2026] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [Tue Sep 15 00:42:36 2026] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [Tue Sep 15 00:42:36 2026] raid6: using avx512x2 recovery algorithm
> [Tue Sep 15 00:42:36 2026] ACPI: Added _OSI(Module Device)
> [Tue Sep 15 00:42:36 2026] ACPI: Added _OSI(Processor Device)
> [Tue Sep 15 00:42:36 2026] ACPI: Added _OSI(Processor Aggregator Device)
> [Tue Sep 15 00:42:36 2026] ACPI: 17 ACPI AML tables successfully acquired and loaded
> [Tue Sep 15 00:42:36 2026] ACPI: \_SB_: platform _OSC: OS support mask [006e7eff]
> [Tue Sep 15 00:42:36 2026] ACPI: \_SB_: platform _OSC: OS control mask [006a7eff]
> [Tue Sep 15 00:42:36 2026] ACPI: Interpreter enabled
> [Tue Sep 15 00:42:36 2026] ACPI: PM: (supports S0 S3 S4 S5)
> [Tue Sep 15 00:42:36 2026] ACPI: Using IOAPIC for interrupt routing
> [Tue Sep 15 00:42:36 2026] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [Tue Sep 15 00:42:36 2026] PCI: Ignoring E820 reservations for host bridge windows
> [Tue Sep 15 00:42:36 2026] ACPI: Enabled 8 GPEs in block 00 to 1F
> [Tue Sep 15 00:42:36 2026] ACPI: \_SB_.PCI0.GPP0.M237: New power resource
> [Tue Sep 15 00:42:36 2026] ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New power resource
> [Tue Sep 15 00:42:36 2026] ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: New power resource
> [Tue Sep 15 00:42:36 2026] ACPI: \_SB_.PRWB: New power resource
> [Tue Sep 15 00:42:36 2026] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [Tue Sep 15 00:42:36 2026] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [Tue Sep 15 00:42:36 2026] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
> [Tue Sep 15 00:42:36 2026] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
> [Tue Sep 15 00:42:36 2026] PCI host bridge to bus 0000:00
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [mem 0xf2000000-0xf6ffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xf1ffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [mem 0x80000000-0xdfffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [mem 0x880000000-0xfcffffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: root bus resource [bus 00-ff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:00.0: [1022:14d8] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:00.2: [1022:14d9] type 00 class 0x080600 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.0: [1022:14da] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1: [1022:14db] type 01 class 0x060400 PCIe Root Port
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1: PCI bridge to [bus 01-03]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1:   bridge window [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1:   bridge window [mem 0xdcb00000-0xdcdfffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1:   bridge window [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2: [1022:14db] type 01 class 0x060400 PCIe Root Port
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2: PCI bridge to [bus 04]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2:   bridge window [mem 0xdcf00000-0xdcffffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.0: [1022:14da] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1: [1022:14db] type 01 class 0x060400 PCIe Root Port
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1: PCI bridge to [bus 05-6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1:   bridge window [io  0xc000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1:   bridge window [mem 0xa8000000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:03.0: [1022:14da] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:04.0: [1022:14da] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.0: [1022:14da] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1: [1022:14dd] type 01 class 0x060400 PCIe Root Port
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1: PCI bridge to [bus 6f]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1:   bridge window [mem 0xdc700000-0xdcafffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1:   bridge window [mem 0xfc80000000-0xfc901fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3: [1022:14dd] type 01 class 0x060400 PCIe Root Port
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3: PCI bridge to [bus 70]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3:   bridge window [mem 0xdce00000-0xdcefffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.0: [1022:14e0] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.1: [1022:14e1] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.2: [1022:14e2] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.3: [1022:14e3] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.4: [1022:14e4] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.5: [1022:14e5] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.6: [1022:14e6] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.7: [1022:14e7] type 00 class 0x060000 conventional PCI endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0: [1002:1478] type 01 class 0x060400 PCIe Switch Upstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0: BAR 0 [mem 0xdcd00000-0xdcd03fff]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0: PCI bridge to [bus 02-03]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0:   bridge window [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0:   bridge window [mem 0xdcb00000-0xdccfffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0:   bridge window [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1: PCI bridge to [bus 01-03]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0: [1002:1479] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0: PCI bridge to [bus 03]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0:   bridge window [mem 0xdcb00000-0xdccfffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0:   bridge window [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0: PCI bridge to [bus 02-03]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: [1002:73df] type 00 class 0x030000 PCIe Legacy Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: BAR 0 [mem 0xf800000000-0xfbffffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: BAR 2 [mem 0xfc00000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: BAR 4 [io  0xf000-0xf0ff]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: BAR 5 [mem 0xdcb00000-0xdcbfffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: ROM [mem 0xdcc00000-0xdcc1ffff pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: PME# supported from D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.1: [1002:ab28] type 00 class 0x040300 PCIe Legacy Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.1: BAR 0 [mem 0xdcc20000-0xdcc23fff]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.1: PME# supported from D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0: PCI bridge to [bus 03]
> [Tue Sep 15 00:42:36 2026] pci 0000:04:00.0: [15b7:5017] type 00 class 0x010802 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:04:00.0: BAR 0 [mem 0xdcf00000-0xdcf03fff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2: PCI bridge to [bus 04]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0: [1022:43f4] type 01 class 0x060400 PCIe Switch Upstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0: PCI bridge to [bus 06-6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0:   bridge window [io  0xc000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0:   bridge window [mem 0xa8000000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1: PCI bridge to [bus 05-6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: [1022:43f5] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: PCI bridge to [bus 07-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0:   bridge window [mem 0xa8000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:08.0: [1022:43f5] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:06:08.0: PCI bridge to [bus 69]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:08.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:06:08.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:09.0: [1022:43f5] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:06:09.0: PCI bridge to [bus 6a]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:09.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:06:09.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0: [1022:43f5] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0: PCI bridge to [bus 6b]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0:   bridge window [io  0xd000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0:   bridge window [mem 0xdc500000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0: [1022:43f5] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0: PCI bridge to [bus 6c]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0:   bridge window [io  0xc000-0xcfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0:   bridge window [mem 0xdc400000-0xdc4fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0: [1022:43f5] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0: PCI bridge to [bus 6d]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0:   bridge window [mem 0xdc300000-0xdc3fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0: [1022:43f5] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0: PCI bridge to [bus 6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0:   bridge window [mem 0xdc200000-0xdc2fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0: PCI bridge to [bus 06-6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: [8086:1136] type 01 class 0x060400 PCIe Switch Upstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: PCI bridge to [bus 08-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0:   bridge window [mem 0xa8000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: PCI bridge to [bus 07-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: [8086:1136] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: PCI bridge to [bus 09]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0:   bridge window [mem 0xdc000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0:   bridge window [mem 0xfc75100000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: [8086:1136] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: PCI bridge to [bus 0a-38]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0:   bridge window [mem 0xc0000000-0xd6efffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0:   bridge window [mem 0xfc50000000-0xfc74ffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: [8086:1136] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: PCI bridge to [bus 39]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0:   bridge window [mem 0xd8000000-0xd80fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: [8086:1136] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: PCI bridge to [bus 3a-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0:   bridge window [mem 0xa8000000-0xbeffffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0:   bridge window [mem 0xfc20000000-0xfc44ffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: PCI bridge to [bus 08-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:09:00.0: [8086:1137] type 00 class 0x0c0340 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:09:00.0: BAR 0 [mem 0xfc75100000-0xfc7513ffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:09:00.0: BAR 2 [mem 0xfc75140000-0xfc75140fff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:09:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:09:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: PCI bridge to [bus 09]
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: [8086:0b26] type 01 class 0x060400 PCIe Switch Upstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: PCI bridge to [bus 0b-10]
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0:   bridge window [mem 0xc0000000-0xc02fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: PCI bridge to [bus 0a-38]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: [8086:0b26] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: PCI bridge to [bus 0c]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0:   bridge window [mem 0xc0200000-0xc02fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: [8086:0b26] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: PCI bridge to [bus 0d]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: [8086:0b26] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: PCI bridge to [bus 0e]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: [8086:0b26] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: PCI bridge to [bus 0f]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: [8086:0b26] type 01 class 0x060400 PCIe Switch Downstream Port
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: PCI bridge to [bus 10]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0:   bridge window [mem 0xc0000000-0xc01fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: PCI bridge to [bus 0b-10]
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: [8086:0b27] type 00 class 0x0c0330 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: BAR 0 [mem 0xc0200000-0xc020ffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: PCI bridge to [bus 0c]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: PCI bridge to [bus 0d]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: PCI bridge to [bus 0e]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: PCI bridge to [bus 0f]
> [Tue Sep 15 00:42:36 2026] pci 0000:10:00.0: [8086:5502] type 00 class 0x020000 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:10:00.0: BAR 0 [mem 0xc0000000-0xc00fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:10:00.0: BAR 3 [mem 0xc0100000-0xc0103fff]
> [Tue Sep 15 00:42:36 2026] pci 0000:10:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: PCI bridge to [bus 10]
> [Tue Sep 15 00:42:36 2026] pci 0000:39:00.0: [8086:1138] type 00 class 0x0c0330 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:39:00.0: BAR 0 [mem 0xd8000000-0xd800ffff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:39:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:39:00.0: PME# supported from D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: PCI bridge to [bus 39]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: PCI bridge to [bus 3a-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:08.0: PCI bridge to [bus 69]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:09.0: PCI bridge to [bus 6a]
> [Tue Sep 15 00:42:36 2026] pci 0000:6b:00.0: [10ec:8125] type 00 class 0x020000 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6b:00.0: BAR 0 [io  0xd000-0xd0ff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6b:00.0: BAR 2 [mem 0xdc500000-0xdc50ffff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:6b:00.0: BAR 4 [mem 0xdc510000-0xdc513fff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:6b:00.0: supports D1 D2
> [Tue Sep 15 00:42:36 2026] pci 0000:6b:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0: PCI bridge to [bus 6b]
> [Tue Sep 15 00:42:36 2026] pci 0000:6c:00.0: [10ec:b852] type 00 class 0x028000 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6c:00.0: BAR 0 [io  0xc000-0xc0ff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6c:00.0: BAR 2 [mem 0xdc400000-0xdc4fffff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:6c:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0: PCI bridge to [bus 6c]
> [Tue Sep 15 00:42:36 2026] pci 0000:6d:00.0: [1022:43f7] type 00 class 0x0c0330 PCIe Legacy Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6d:00.0: BAR 0 [mem 0xdc300000-0xdc307fff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:6d:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6d:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0: PCI bridge to [bus 6d]
> [Tue Sep 15 00:42:36 2026] pci 0000:6e:00.0: [1022:43f6] type 00 class 0x010601 PCIe Legacy Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6e:00.0: BAR 5 [mem 0xdc280000-0xdc2803ff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6e:00.0: ROM [mem 0xdc200000-0xdc27ffff pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:6e:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6e:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0: PCI bridge to [bus 6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: [1002:164e] type 00 class 0x030000 PCIe Legacy Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: BAR 0 [mem 0xfc80000000-0xfc8fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: BAR 2 [mem 0xfc90000000-0xfc901fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: BAR 4 [io  0xe000-0xe0ff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: BAR 5 [mem 0xdca00000-0xdca7ffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: PME# supported from D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.1: [1002:1640] type 00 class 0x040300 PCIe Legacy Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.1: BAR 0 [mem 0xdca88000-0xdca8bfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.1: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.1: PME# supported from D1 D2 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.2: [1022:1649] type 00 class 0x108000 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.2: BAR 2 [mem 0xdc900000-0xdc9fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.2: BAR 5 [mem 0xdca8c000-0xdca8dfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.2: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.3: [1022:15b6] type 00 class 0x0c0330 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.3: BAR 0 [mem 0xdc800000-0xdc8fffff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.3: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.3: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.4: [1022:15b7] type 00 class 0x0c0330 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.4: BAR 0 [mem 0xdc700000-0xdc7fffff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.4: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.4: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.6: [1022:15e3] type 00 class 0x040300 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.6: BAR 0 [mem 0xdca80000-0xdca87fff]
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.6: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.6: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1: PCI bridge to [bus 6f]
> [Tue Sep 15 00:42:36 2026] pci 0000:70:00.0: [1022:15b8] type 00 class 0x0c0330 PCIe Endpoint
> [Tue Sep 15 00:42:36 2026] pci 0000:70:00.0: BAR 0 [mem 0xdce00000-0xdcefffff 64bit]
> [Tue Sep 15 00:42:36 2026] pci 0000:70:00.0: enabling Extended Tags
> [Tue Sep 15 00:42:36 2026] pci 0000:70:00.0: PME# supported from D0 D3hot D3cold
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3: PCI bridge to [bus 70]
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
> [Tue Sep 15 00:42:36 2026] iommu: Default domain type: Translated
> [Tue Sep 15 00:42:36 2026] iommu: DMA domain TLB invalidation policy: lazy mode
> [Tue Sep 15 00:42:36 2026] SCSI subsystem initialized
> [Tue Sep 15 00:42:36 2026] libata version 3.00 loaded.
> [Tue Sep 15 00:42:36 2026] ACPI: bus type USB registered
> [Tue Sep 15 00:42:36 2026] usbcore: registered new interface driver usbfs
> [Tue Sep 15 00:42:36 2026] usbcore: registered new interface driver hub
> [Tue Sep 15 00:42:36 2026] usbcore: registered new device driver usb
> [Tue Sep 15 00:42:36 2026] EDAC MC: Ver: 3.0.0
> [Tue Sep 15 00:42:36 2026] efivars: Registered efivars operations
> [Tue Sep 15 00:42:36 2026] NetLabel: Initializing
> [Tue Sep 15 00:42:36 2026] NetLabel:  domain hash size = 128
> [Tue Sep 15 00:42:36 2026] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [Tue Sep 15 00:42:36 2026] NetLabel:  unlabeled traffic allowed by default
> [Tue Sep 15 00:42:36 2026] mctp: management component transport protocol core
> [Tue Sep 15 00:42:36 2026] NET: Registered PF_MCTP protocol family
> [Tue Sep 15 00:42:36 2026] PCI: Using ACPI for IRQ routing
> [Tue Sep 15 00:42:36 2026] PCI: pci_cache_line_size set to 64 bytes
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x099ff000-0x0bffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x0a200000-0x0bffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x0b000000-0x0bffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x648f1000-0x67ffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x67660000-0x67ffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x6abdf000-0x6bffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x79ff9000-0x7bffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x7a000000-0x7bffffff]
> [Tue Sep 15 00:42:36 2026] e820: register RAM buffer resource [mem 0x85df00000-0x85fffffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: vgaarb: setting as boot VGA device
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: vgaarb: bridge control possible
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: vgaarb: bridge control possible
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [Tue Sep 15 00:42:36 2026] vgaarb: loaded
> [Tue Sep 15 00:42:36 2026] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [Tue Sep 15 00:42:36 2026] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
> [Tue Sep 15 00:42:36 2026] clocksource: Switched to clocksource tsc-early
> [Tue Sep 15 00:42:36 2026] VFS: Disk quotas dquot_6.6.0
> [Tue Sep 15 00:42:36 2026] VFS: Dquot-cache hash table entries: 512 (4096 bytes)
> [Tue Sep 15 00:42:36 2026] acpi PNP0C01:00: Reserved [mem 0xe0000000-0xefffffff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:00: Could not reserve [mem 0xf7600000-0xf767ffff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:01: Reserved [mem 0x860000000-0x87fffffff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:02: Reserved [mem 0xf7200000-0xf72fffff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:03: Reserved [io  0x0290-0x029f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:03: Reserved [io  0x0200-0x023f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0010-0x001f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0022-0x003f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0063]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0065]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0067-0x006f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0072-0x007f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0080]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0084-0x0086]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0088]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x008c-0x008e]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x0090-0x009f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x00a2-0x00bf]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x00b1]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Skipped [io  0x00e0-0x00ef]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x04d0-0x04d1]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x040b]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x04d6]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0c00-0x0c01]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0c14]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0c50-0x0c51]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0c52]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0c6c]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0c6f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0cd8-0x0cdf]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0800-0x089f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0b00-0x0b0f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0b20-0x0b3f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0900-0x090f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [io  0x0910-0x091f]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [mem 0xfedc0000-0xfedc0fff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [mem 0xfee00000-0xfee00fff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [mem 0xfec10000-0xfec10fff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [mem 0xfeb00000-0xfeb00fff]
> [Tue Sep 15 00:42:36 2026] acpi PNP0C02:04: Reserved [mem 0xff000000-0xffffffff]
> [Tue Sep 15 00:42:36 2026] pnp: PnP ACPI init
> [Tue Sep 15 00:42:36 2026] pnp 00:00: [dma 0 disabled]
> [Tue Sep 15 00:42:36 2026] pnp: PnP ACPI: found 1 devices
> [Tue Sep 15 00:42:36 2026] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> [Tue Sep 15 00:42:36 2026] NET: Registered PF_INET protocol family
> [Tue Sep 15 00:42:36 2026] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [Tue Sep 15 00:42:36 2026] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
> [Tue Sep 15 00:42:36 2026] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [Tue Sep 15 00:42:36 2026] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [Tue Sep 15 00:42:36 2026] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
> [Tue Sep 15 00:42:36 2026] TCP: Hash tables configured (established 262144 bind 65536)
> [Tue Sep 15 00:42:36 2026] MPTCP token hash table entries: 32768 (order: 8, 786432 bytes, linear)
> [Tue Sep 15 00:42:36 2026] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
> [Tue Sep 15 00:42:36 2026] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [Tue Sep 15 00:42:36 2026] NET: Registered PF_XDP protocol family
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [io  0x1000-0x0fff] to [bus 0d] add_size 1000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0d] add_size 200000 add_align 100000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [mem 0x00100000-0x000fffff] to [bus 0d] add_size 200000 add_align 100000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [io  0x1000-0x0fff] to [bus 0e] add_size 1000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0e] add_size 200000 add_align 100000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [mem 0x00100000-0x000fffff] to [bus 0e] add_size 200000 add_align 100000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [io  0x1000-0x0fff] to [bus 0f] add_size 1000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0f] add_size 200000 add_align 100000
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [mem 0x00100000-0x000fffff] to [bus 0f] add_size 200000 add_align 100000
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: bridge window [io  0x1000-0x0fff] to [bus 0b-10] add_size 3000
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 0b-10] add_size 600000 add_align 100000
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: bridge window [io  0x1000-0x0fff] to [bus 0a-38] add_size 4000
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: bridge window [io  0x1000-0x0fff] to [bus 3a-68] add_size 1000
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: bridge window [io  0x1000-0x0fff] to [bus 08-68] add_size 5000
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: bridge window [io  0x1000-0x0fff] to [bus 07-68] add_size 5000
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0: PCI bridge to [bus 03]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0:   bridge window [mem 0xdcb00000-0xdccfffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0:   bridge window [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0: PCI bridge to [bus 02-03]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0:   bridge window [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0:   bridge window [mem 0xdcb00000-0xdccfffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0:   bridge window [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1: PCI bridge to [bus 01-03]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1:   bridge window [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1:   bridge window [mem 0xdcb00000-0xdcdfffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1:   bridge window [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2: PCI bridge to [bus 04]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2:   bridge window [mem 0xdcf00000-0xdcffffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: bridge window [io  size 0x5000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: bridge window [io  size 0x5000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: bridge window [io  size 0x5000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: bridge window [io  size 0x5000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: bridge window [io  size 0x5000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: bridge window [io  size 0x5000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: bridge window [io  size 0x5000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: bridge window [io  size 0x5000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: bridge window [io  size 0x4000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: bridge window [io  size 0x4000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: bridge window [io  size 0x4000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: bridge window [io  size 0x4000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: PCI bridge to [bus 09]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0:   bridge window [mem 0xdc000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0:   bridge window [mem 0xfc75100000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: bridge window [mem 0xfc50000000-0xfc505fffff 64bit pref]: assigned
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: bridge window [io  size 0x3000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: bridge window [io  size 0x3000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: bridge window [io  size 0x3000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: bridge window [io  size 0x3000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [mem size 0x00200000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [mem size 0x00200000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [mem 0xfc50000000-0xfc501fffff 64bit pref]: assigned
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [mem size 0x00200000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [mem size 0x00200000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [mem 0xfc50200000-0xfc503fffff 64bit pref]: assigned
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [mem size 0x00200000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [mem size 0x00200000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [mem 0xfc50400000-0xfc505fffff 64bit pref]: assigned
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [mem size 0x00200000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [mem size 0x00200000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [mem size 0x00200000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [mem size 0x00200000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [mem size 0x00200000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [mem size 0x00200000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [io  size 0x1000]: can't assign; no space
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: bridge window [io  size 0x1000]: failed to assign
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: PCI bridge to [bus 0c]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0:   bridge window [mem 0xc0200000-0xc02fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: PCI bridge to [bus 0d]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0:   bridge window [mem 0xfc50000000-0xfc501fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: PCI bridge to [bus 0e]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0:   bridge window [mem 0xfc50200000-0xfc503fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: PCI bridge to [bus 0f]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0:   bridge window [mem 0xfc50400000-0xfc505fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: PCI bridge to [bus 10]
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0:   bridge window [mem 0xc0000000-0xc01fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: PCI bridge to [bus 0b-10]
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0:   bridge window [mem 0xc0000000-0xc02fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0:   bridge window [mem 0xfc50000000-0xfc505fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: PCI bridge to [bus 0a-38]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0:   bridge window [mem 0xc0000000-0xd6efffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0:   bridge window [mem 0xfc50000000-0xfc74ffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: PCI bridge to [bus 39]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0:   bridge window [mem 0xd8000000-0xd80fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: PCI bridge to [bus 3a-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0:   bridge window [mem 0xa8000000-0xbeffffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0:   bridge window [mem 0xfc20000000-0xfc44ffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: PCI bridge to [bus 08-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0:   bridge window [mem 0xa8000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: PCI bridge to [bus 07-68]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0:   bridge window [mem 0xa8000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:08.0: PCI bridge to [bus 69]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:09.0: PCI bridge to [bus 6a]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0: PCI bridge to [bus 6b]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0:   bridge window [io  0xd000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0:   bridge window [mem 0xdc500000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0: PCI bridge to [bus 6c]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0:   bridge window [io  0xc000-0xcfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0:   bridge window [mem 0xdc400000-0xdc4fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0: PCI bridge to [bus 6d]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0:   bridge window [mem 0xdc300000-0xdc3fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0: PCI bridge to [bus 6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0:   bridge window [mem 0xdc200000-0xdc2fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0: PCI bridge to [bus 06-6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0:   bridge window [io  0xc000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0:   bridge window [mem 0xa8000000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1: PCI bridge to [bus 05-6e]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1:   bridge window [io  0xc000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1:   bridge window [mem 0xa8000000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1:   bridge window [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1: PCI bridge to [bus 6f]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1:   bridge window [mem 0xdc700000-0xdcafffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1:   bridge window [mem 0xfc80000000-0xfc901fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3: PCI bridge to [bus 70]
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3:   bridge window [mem 0xdce00000-0xdcefffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: Some PCI device resources are unassigned, try booting with pci=realloc
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 9 [mem 0xf2000000-0xf6ffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 10 [mem 0xf0000000-0xf1ffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 11 [mem 0x80000000-0xdfffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:00: resource 12 [mem 0x880000000-0xfcffffffff window]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:01: resource 0 [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:01: resource 1 [mem 0xdcb00000-0xdcdfffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:01: resource 2 [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:02: resource 1 [mem 0xdcb00000-0xdccfffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:02: resource 2 [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:03: resource 1 [mem 0xdcb00000-0xdccfffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:03: resource 2 [mem 0xf800000000-0xfc0fffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:04: resource 1 [mem 0xdcf00000-0xdcffffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:05: resource 0 [io  0xc000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:05: resource 1 [mem 0xa8000000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:05: resource 2 [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:06: resource 0 [io  0xc000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:06: resource 1 [mem 0xa8000000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:06: resource 2 [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:07: resource 0 [io  size 0x5000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:07: resource 1 [mem 0xa8000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:07: resource 2 [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:08: resource 0 [io  size 0x5000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:08: resource 1 [mem 0xa8000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:08: resource 2 [mem 0xfc20000000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:09: resource 1 [mem 0xdc000000-0xdc0fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:09: resource 2 [mem 0xfc75100000-0xfc751fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0a: resource 0 [io  size 0x4000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0a: resource 1 [mem 0xc0000000-0xd6efffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0a: resource 2 [mem 0xfc50000000-0xfc74ffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0b: resource 0 [io  size 0x3000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0b: resource 1 [mem 0xc0000000-0xc02fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0b: resource 2 [mem 0xfc50000000-0xfc505fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0c: resource 1 [mem 0xc0200000-0xc02fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0d: resource 0 [io  size 0x1000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0d: resource 1 [mem size 0x00200000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0d: resource 2 [mem 0xfc50000000-0xfc501fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0e: resource 0 [io  size 0x1000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0e: resource 1 [mem size 0x00200000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0e: resource 2 [mem 0xfc50200000-0xfc503fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0f: resource 0 [io  size 0x1000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0f: resource 1 [mem size 0x00200000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:0f: resource 2 [mem 0xfc50400000-0xfc505fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:10: resource 1 [mem 0xc0000000-0xc01fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:39: resource 1 [mem 0xd8000000-0xd80fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:3a: resource 0 [io  size 0x1000]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:3a: resource 1 [mem 0xa8000000-0xbeffffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:3a: resource 2 [mem 0xfc20000000-0xfc44ffffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6b: resource 0 [io  0xd000-0xdfff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6b: resource 1 [mem 0xdc500000-0xdc5fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6c: resource 0 [io  0xc000-0xcfff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6c: resource 1 [mem 0xdc400000-0xdc4fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6d: resource 1 [mem 0xdc300000-0xdc3fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6e: resource 1 [mem 0xdc200000-0xdc2fffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6f: resource 0 [io  0xe000-0xefff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6f: resource 1 [mem 0xdc700000-0xdcafffff]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6f: resource 2 [mem 0xfc80000000-0xfc901fffff 64bit pref]
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:70: resource 1 [mem 0xdce00000-0xdcefffff]
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.1: D0 power state depends on 0000:03:00.0
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: CLS mismatch (64 != 128), using 64 bytes
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.1: D0 power state depends on 0000:6f:00.0
> [Tue Sep 15 00:42:36 2026] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
> [Tue Sep 15 00:42:36 2026] Trying to unpack rootfs image as initramfs...
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.0: Adding to iommu group 0
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.1: Adding to iommu group 1
> [Tue Sep 15 00:42:36 2026] pci 0000:00:01.2: Adding to iommu group 2
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.0: Adding to iommu group 3
> [Tue Sep 15 00:42:36 2026] pci 0000:00:02.1: Adding to iommu group 4
> [Tue Sep 15 00:42:36 2026] pci 0000:00:03.0: Adding to iommu group 5
> [Tue Sep 15 00:42:36 2026] pci 0000:00:04.0: Adding to iommu group 6
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.0: Adding to iommu group 7
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.1: Adding to iommu group 8
> [Tue Sep 15 00:42:36 2026] pci 0000:00:08.3: Adding to iommu group 9
> [Tue Sep 15 00:42:36 2026] pci 0000:00:14.0: Adding to iommu group 10
> [Tue Sep 15 00:42:36 2026] pci 0000:00:14.3: Adding to iommu group 10
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.0: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.1: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.2: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.3: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.4: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.5: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.6: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:00:18.7: Adding to iommu group 11
> [Tue Sep 15 00:42:36 2026] pci 0000:01:00.0: Adding to iommu group 12
> [Tue Sep 15 00:42:36 2026] pci 0000:02:00.0: Adding to iommu group 13
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.0: Adding to iommu group 14
> [Tue Sep 15 00:42:36 2026] pci 0000:03:00.1: Adding to iommu group 15
> [Tue Sep 15 00:42:36 2026] pci 0000:04:00.0: Adding to iommu group 16
> [Tue Sep 15 00:42:36 2026] pci 0000:05:00.0: Adding to iommu group 17
> [Tue Sep 15 00:42:36 2026] pci 0000:06:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:06:08.0: Adding to iommu group 19
> [Tue Sep 15 00:42:36 2026] pci 0000:06:09.0: Adding to iommu group 20
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0a.0: Adding to iommu group 21
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0b.0: Adding to iommu group 22
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0c.0: Adding to iommu group 23
> [Tue Sep 15 00:42:36 2026] pci 0000:06:0d.0: Adding to iommu group 24
> [Tue Sep 15 00:42:36 2026] pci 0000:07:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:08:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:08:01.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:08:02.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:08:03.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:09:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:0a:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:01.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:02.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:03.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:0b:04.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:0c:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:10:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:39:00.0: Adding to iommu group 18
> [Tue Sep 15 00:42:36 2026] pci 0000:6b:00.0: Adding to iommu group 21
> [Tue Sep 15 00:42:36 2026] pci 0000:6c:00.0: Adding to iommu group 22
> [Tue Sep 15 00:42:36 2026] pci 0000:6d:00.0: Adding to iommu group 23
> [Tue Sep 15 00:42:36 2026] pci 0000:6e:00.0: Adding to iommu group 24
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.0: Adding to iommu group 25
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.1: Adding to iommu group 26
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.2: Adding to iommu group 27
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.3: Adding to iommu group 28
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.4: Adding to iommu group 29
> [Tue Sep 15 00:42:36 2026] pci 0000:6f:00.6: Adding to iommu group 30
> [Tue Sep 15 00:42:36 2026] pci 0000:70:00.0: Adding to iommu group 31
> [Tue Sep 15 00:42:36 2026] AMD-Vi: Extended features (0x246577efa2254afa, 0x0): PPR NX GT [5] IA GA PC GA_vAPIC
> [Tue Sep 15 00:42:36 2026] AMD-Vi: Interrupt remapping enabled
> [Tue Sep 15 00:42:36 2026] AMD-Vi: Virtual APIC enabled
> [Tue Sep 15 00:42:36 2026] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [Tue Sep 15 00:42:36 2026] software IO TLB: mapped [mem 0x0000000060126000-0x0000000064126000] (64MB)
> [Tue Sep 15 00:42:36 2026] LVT offset 0 assigned for vector 0x400
> [Tue Sep 15 00:42:36 2026] perf: AMD IBS detected (0x00000bff)
> [Tue Sep 15 00:42:36 2026] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
> [Tue Sep 15 00:42:36 2026] Initialise system trusted keyrings
> [Tue Sep 15 00:42:36 2026] Key type blacklist registered
> [Tue Sep 15 00:42:36 2026] workingset: timestamp_bits=36 (anon: 31) max_order=23 bucket_order=0 (anon: 0)
> [Tue Sep 15 00:42:36 2026] fuse: init (API version 7.46)
> [Tue Sep 15 00:42:36 2026] integrity: Platform Keyring initialized
> [Tue Sep 15 00:42:36 2026] integrity: Machine keyring initialized
> [Tue Sep 15 00:42:36 2026] Key type asymmetric registered
> [Tue Sep 15 00:42:36 2026] Asymmetric key parser 'x509' registered
> [Tue Sep 15 00:42:36 2026] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
> [Tue Sep 15 00:42:36 2026] io scheduler mq-deadline registered
> [Tue Sep 15 00:42:36 2026] io scheduler kyber registered
> [Tue Sep 15 00:42:36 2026] io scheduler bfq registered
> [Tue Sep 15 00:42:36 2026] raid6: skipped pq benchmark and selected avx512x4
> [Tue Sep 15 00:42:36 2026] ledtrig-cpu: registered to indicate activity on CPUs
> [Tue Sep 15 00:42:36 2026] pcieport 0000:00:01.1: PME: Signaling with IRQ 29
> [Tue Sep 15 00:42:36 2026] pcieport 0000:00:01.2: PME: Signaling with IRQ 30
> [Tue Sep 15 00:42:36 2026] pcieport 0000:00:02.1: PME: Signaling with IRQ 31
> [Tue Sep 15 00:42:36 2026] pcieport 0000:00:02.1: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
> [Tue Sep 15 00:42:36 2026] pcieport 0000:00:08.1: PME: Signaling with IRQ 32
> [Tue Sep 15 00:42:36 2026] pcieport 0000:00:08.3: PME: Signaling with IRQ 33
> [Tue Sep 15 00:42:36 2026] pcieport 0000:08:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
> [Tue Sep 15 00:42:36 2026] pcieport 0000:08:03.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
> [Tue Sep 15 00:42:36 2026] pcieport 0000:0b:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
> [Tue Sep 15 00:42:36 2026] pcieport 0000:0b:02.0: pciehp: Slot #2 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
> [Tue Sep 15 00:42:36 2026] pcieport 0000:0b:03.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
> [Tue Sep 15 00:42:36 2026] input: Power Button as /devices/platform/PNP0C0C:00/input/input0
> [Tue Sep 15 00:42:36 2026] ACPI: button: Power Button [PWRB]
> [Tue Sep 15 00:42:36 2026] input: Power Button as /devices/platform/LNXPWRBN:00/input/input1
> [Tue Sep 15 00:42:36 2026] ACPI: button: Power Button [PWRF]
> [Tue Sep 15 00:42:36 2026] Monitor-Mwait will be used to enter C-1 state
> [Tue Sep 15 00:42:36 2026] Estimated ratio of average max frequency by base frequency (times 1024): 1127
> [Tue Sep 15 00:42:36 2026] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [Tue Sep 15 00:42:36 2026] 00:00: ttyS0 I/O:0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [Tue Sep 15 00:42:36 2026] Non-volatile memory driver v1.3
> [Tue Sep 15 00:42:36 2026] Freeing initrd memory: 53100K
> [Tue Sep 15 00:42:36 2026] tpm_crb_acpi MSFT0101:00: Disabling hwrng
> [Tue Sep 15 00:42:36 2026] ACPI: bus type drm_connector registered
> [Tue Sep 15 00:42:36 2026] ahci 0000:6e:00.0: enabling device (0000 -> 0002)
> [Tue Sep 15 00:42:36 2026] ahci 0000:6e:00.0: SSS flag set, parallel bus scan disabled
> [Tue Sep 15 00:42:36 2026] ahci 0000:6e:00.0: AHCI vers 0001.0301, 32 command slots, 6 Gbps, SATA mode
> [Tue Sep 15 00:42:36 2026] ahci 0000:6e:00.0: 4/6 ports implemented (port mask 0xf)
> [Tue Sep 15 00:42:36 2026] ahci 0000:6e:00.0: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
> [Tue Sep 15 00:42:36 2026] scsi host0: ahci
> [Tue Sep 15 00:42:36 2026] scsi host1: ahci
> [Tue Sep 15 00:42:36 2026] scsi host2: ahci
> [Tue Sep 15 00:42:36 2026] scsi host3: ahci
> [Tue Sep 15 00:42:36 2026] scsi host4: ahci
> [Tue Sep 15 00:42:36 2026] scsi host5: ahci
> [Tue Sep 15 00:42:36 2026] ata1: SATA max UDMA/133 abar m1024@0xdc280000 port 0xdc280100 irq 48 lpm-pol 3
> [Tue Sep 15 00:42:36 2026] ata2: SATA max UDMA/133 abar m1024@0xdc280000 port 0xdc280180 irq 48 lpm-pol 3
> [Tue Sep 15 00:42:36 2026] ata3: SATA max UDMA/133 abar m1024@0xdc280000 port 0xdc280200 irq 48 lpm-pol 3
> [Tue Sep 15 00:42:36 2026] ata4: SATA max UDMA/133 abar m1024@0xdc280000 port 0xdc280280 irq 48 lpm-pol 3
> [Tue Sep 15 00:42:36 2026] ata5: DUMMY
> [Tue Sep 15 00:42:36 2026] ata6: DUMMY
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 1
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: hcc params 0x20007fc1 hci version 0x110 quirks 0x0000000000009810
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 2
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:0c:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> [Tue Sep 15 00:42:36 2026] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb1: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb1: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb1: SerialNumber: 0000:0c:00.0
> [Tue Sep 15 00:42:36 2026] hub 1-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 1-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb2: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb2: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb2: SerialNumber: 0000:0c:00.0
> [Tue Sep 15 00:42:36 2026] hub 2-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 2-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 3
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:39:00.0: hcc params 0x20007fc1 hci version 0x110 quirks 0x0000000200009810
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 4
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> [Tue Sep 15 00:42:36 2026] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb3: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb3: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb3: SerialNumber: 0000:39:00.0
> [Tue Sep 15 00:42:36 2026] hub 3-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 3-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb4: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb4: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb4: SerialNumber: 0000:39:00.0
> [Tue Sep 15 00:42:36 2026] hub 4-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 4-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6d:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6d:00.0: new USB bus registered, assigned bus number 5
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6d:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000200000010
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6d:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6d:00.0: new USB bus registered, assigned bus number 6
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6d:00.0: Host supports USB 3.2 Enhanced SuperSpeed
> [Tue Sep 15 00:42:36 2026] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb5: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb5: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb5: SerialNumber: 0000:6d:00.0
> [Tue Sep 15 00:42:36 2026] hub 5-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 5-0:1.0: 12 ports detected
> [Tue Sep 15 00:42:36 2026] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
> [Tue Sep 15 00:42:36 2026] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb6: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb6: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb6: SerialNumber: 0000:6d:00.0
> [Tue Sep 15 00:42:36 2026] hub 6-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 6-0:1.0: 5 ports detected
> [Tue Sep 15 00:42:36 2026] usb: port power management may be unreliable
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.3: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.3: new USB bus registered, assigned bus number 7
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.3: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000010
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.3: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.3: new USB bus registered, assigned bus number 8
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.3: Host supports USB 3.1 Enhanced SuperSpeed
> [Tue Sep 15 00:42:36 2026] usb usb7: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb7: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb7: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb7: SerialNumber: 0000:6f:00.3
> [Tue Sep 15 00:42:36 2026] hub 7-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 7-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] usb usb8: We don't know the algorithms for LPM for this host, disabling LPM.
> [Tue Sep 15 00:42:36 2026] usb usb8: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb8: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb8: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb8: SerialNumber: 0000:6f:00.3
> [Tue Sep 15 00:42:36 2026] hub 8-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 8-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.4: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.4: new USB bus registered, assigned bus number 9
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.4: hcc params 0x0120ffc5 hci version 0x120 quirks 0x0000000200000010
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.4: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.4: new USB bus registered, assigned bus number 10
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:6f:00.4: Host supports USB 3.1 Enhanced SuperSpeed
> [Tue Sep 15 00:42:36 2026] usb usb9: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb9: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb9: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb9: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb9: SerialNumber: 0000:6f:00.4
> [Tue Sep 15 00:42:36 2026] hub 9-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 9-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] usb usb10: We don't know the algorithms for LPM for this host, disabling LPM.
> [Tue Sep 15 00:42:36 2026] usb usb10: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb10: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb10: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb10: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb10: SerialNumber: 0000:6f:00.4
> [Tue Sep 15 00:42:36 2026] hub 10-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 10-0:1.0: 2 ports detected
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:70:00.0: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:70:00.0: new USB bus registered, assigned bus number 11
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:70:00.0: USB0 root hub has no ports
> [Tue Sep 15 00:42:36 2026] xhci_hcd 0000:70:00.0: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0000000200000010
> [Tue Sep 15 00:42:36 2026] usb usb11: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.03
> [Tue Sep 15 00:42:36 2026] usb usb11: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [Tue Sep 15 00:42:36 2026] usb usb11: Product: xHCI Host Controller
> [Tue Sep 15 00:42:36 2026] usb usb11: Manufacturer: Linux 7.3.0-rc2-1-mainline xhci-hcd
> [Tue Sep 15 00:42:36 2026] usb usb11: SerialNumber: 0000:70:00.0
> [Tue Sep 15 00:42:36 2026] hub 11-0:1.0: USB hub found
> [Tue Sep 15 00:42:36 2026] hub 11-0:1.0: 1 port detected
> [Tue Sep 15 00:42:36 2026] usbcore: registered new interface driver usbserial_generic
> [Tue Sep 15 00:42:36 2026] usbserial: USB Serial support registered for generic
> [Tue Sep 15 00:42:36 2026] i8042: PNP: No PS/2 controller found.
> [Tue Sep 15 00:42:36 2026] rtc_cmos PNP0B00:00: RTC can wake from S4
> [Tue Sep 15 00:42:36 2026] rtc_cmos PNP0B00:00: registered as rtc0
> [Tue Sep 15 00:42:36 2026] rtc_cmos PNP0B00:00: setting system clock to 2026-09-15T04:42:36 UTC (1789447356)
> [Tue Sep 15 00:42:36 2026] rtc_cmos PNP0B00:00: alarms up to one month, y3k, 114 bytes nvram
> [Tue Sep 15 00:42:36 2026] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 planes with drm panic
> [Tue Sep 15 00:42:36 2026] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 on minor 0
> [Tue Sep 15 00:42:36 2026] fbcon: Deferring console take-over
> [Tue Sep 15 00:42:36 2026] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
> [Tue Sep 15 00:42:36 2026] hid: raw HID events driver (C) Jiri Kosina
> [Tue Sep 15 00:42:36 2026] usbcore: registered new interface driver usbhid
> [Tue Sep 15 00:42:36 2026] usbhid: USB HID core driver
> [Tue Sep 15 00:42:36 2026] drop_monitor: Initializing network drop monitor service
> [Tue Sep 15 00:42:36 2026] NET: Registered PF_INET6 protocol family
> [Tue Sep 15 00:42:36 2026] Segment Routing with IPv6
> [Tue Sep 15 00:42:36 2026] RPL Segment Routing with IPv6
> [Tue Sep 15 00:42:36 2026] In-situ OAM (IOAM) with IPv6
> [Tue Sep 15 00:42:36 2026] NET: Registered PF_PACKET protocol family
> [Tue Sep 15 00:42:36 2026] x86/amd: Previous system reset reason [0x00080800]: software wrote 0x6 to reset control register 0xCF9
> [Tue Sep 15 00:42:36 2026] AGESA: AGESA!V9 ComboAm5PI 1.3.0.1b Patch A
> [Tue Sep 15 00:42:36 2026] microcode: Current revision: 0x0a60120c
> [Tue Sep 15 00:42:36 2026] resctrl: L3 allocation detected
> [Tue Sep 15 00:42:36 2026] resctrl: MB allocation detected
> [Tue Sep 15 00:42:36 2026] resctrl: SMBA allocation detected
> [Tue Sep 15 00:42:36 2026] resctrl: L3 monitoring detected
> [Tue Sep 15 00:42:36 2026] IPI shorthand broadcast: enabled
> [Tue Sep 15 00:42:36 2026] sched_clock: Marking stable (527081402, 1342290)->(547521533, -19097841)
> [Tue Sep 15 00:42:36 2026] registered taskstats version 1
> [Tue Sep 15 00:42:36 2026] Loading compiled-in X.509 certificates
> [Tue Sep 15 00:42:36 2026] Loaded X.509 cert 'Build time autogenerated kernel key: e322d3fa7803c44cc9c62a3c96c7837a32caad7c'
> [Tue Sep 15 00:42:36 2026] Demotion targets for Node 0: null
> [Tue Sep 15 00:42:36 2026] Key type .fscrypt registered
> [Tue Sep 15 00:42:36 2026] Key type fscrypt-provisioning registered
> [Tue Sep 15 00:42:36 2026] Btrfs loaded, zoned=yes, fsverity=yes
> [Tue Sep 15 00:42:36 2026] Key type big_key registered
> [Tue Sep 15 00:42:36 2026] integrity: Loading X.509 certificate: UEFI:db
> [Tue Sep 15 00:42:36 2026] integrity: Loaded X.509 cert 'ASUSTeK MotherBoard SW Key Certificate: da83b990422ebc8c441f8d8b039a65a2'
> [Tue Sep 15 00:42:36 2026] integrity: Loading X.509 certificate: UEFI:db
> [Tue Sep 15 00:42:36 2026] integrity: Loaded X.509 cert 'ASUSTeK Notebook SW Key Certificate: b8e581e4df77a5bb4282d5ccfc00c071'
> [Tue Sep 15 00:42:36 2026] integrity: Loading X.509 certificate: UEFI:db
> [Tue Sep 15 00:42:36 2026] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
> [Tue Sep 15 00:42:36 2026] integrity: Loading X.509 certificate: UEFI:db
> [Tue Sep 15 00:42:36 2026] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
> [Tue Sep 15 00:42:36 2026] integrity: Loading X.509 certificate: UEFI:db
> [Tue Sep 15 00:42:36 2026] integrity: Loaded X.509 cert 'Microsoft Option ROM UEFI CA 2023: 514fbf937fa46fb57bf07af8bed84b3b864b1711'
> [Tue Sep 15 00:42:36 2026] integrity: Loading X.509 certificate: UEFI:db
> [Tue Sep 15 00:42:36 2026] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
> [Tue Sep 15 00:42:36 2026] integrity: Loading X.509 certificate: UEFI:db
> [Tue Sep 15 00:42:36 2026] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
> [Tue Sep 15 00:42:36 2026] PM:   Magic number: 10:252:717
> [Tue Sep 15 00:42:36 2026] pci_bus 0000:6f: hash matches
> [Tue Sep 15 00:42:36 2026] RAS: Correctable Errors collector initialized.
> [Tue Sep 15 00:42:36 2026] clk: Disabling unused clocks
> [Tue Sep 15 00:42:36 2026] PM: genpd: Disabling unused power domains
> [Tue Sep 15 00:42:36 2026] usb 7-1: new full-speed USB device number 2 using xhci_hcd
> [Tue Sep 15 00:42:36 2026] ata1: SATA link down (SStatus 0 SControl 300)
> [Tue Sep 15 00:42:36 2026] usb 11-1: new high-speed USB device number 2 using xhci_hcd
> [Tue Sep 15 00:42:36 2026] usb 5-5: new full-speed USB device number 2 using xhci_hcd
> [Tue Sep 15 00:42:36 2026] usb 7-1: New USB device found, idVendor=8968, idProduct=4e4b, bcdDevice= 0.01
> [Tue Sep 15 00:42:36 2026] usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [Tue Sep 15 00:42:36 2026] usb 7-1: Product: NK65
> [Tue Sep 15 00:42:36 2026] usb 7-1: Manufacturer: Yiancar-Designs
> [Tue Sep 15 00:42:36 2026] usb 7-1: SerialNumber: 0
> [Tue Sep 15 00:42:36 2026] usb 11-1: New USB device found, idVendor=046d, idProduct=0825, bcdDevice= 0.12
> [Tue Sep 15 00:42:36 2026] input: Yiancar-Designs NK65 as /devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.0/0003:8968:4E4B.0001/input/input2
> [Tue Sep 15 00:42:36 2026] hid-generic 0003:8968:4E4B.0001: input,hidraw0: USB HID v1.11 Keyboard [Yiancar-Designs NK65] on usb-0000:6f:00.3-1/input0
> [Tue Sep 15 00:42:36 2026] hid-generic 0003:8968:4E4B.0002: hiddev96,hidraw1: USB HID v1.11 Device [Yiancar-Designs NK65] on usb-0000:6f:00.3-1/input1
> [Tue Sep 15 00:42:36 2026] input: Yiancar-Designs NK65 Mouse as /devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/0003:8968:4E4B.0003/input/input3
> [Tue Sep 15 00:42:36 2026] input: Yiancar-Designs NK65 System Control as /devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/0003:8968:4E4B.0003/input/input4
> [Tue Sep 15 00:42:37 2026] input: Yiancar-Designs NK65 Consumer Control as /devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/0003:8968:4E4B.0003/input/input5
> [Tue Sep 15 00:42:37 2026] input: Yiancar-Designs NK65 Keyboard as /devices/pci0000:00/0000:00:08.1/0000:6f:00.3/usb7/7-1/7-1:1.2/0003:8968:4E4B.0003/input/input6
> [Tue Sep 15 00:42:37 2026] hid-generic 0003:8968:4E4B.0003: input,hidraw2: USB HID v1.11 Mouse [Yiancar-Designs NK65] on usb-0000:6f:00.3-1/input2
> [Tue Sep 15 00:42:37 2026] ata2: SATA link down (SStatus 0 SControl 300)
> [Tue Sep 15 00:42:37 2026] usb 5-5: New USB device found, idVendor=13d3, idProduct=3571, bcdDevice= 0.00
> [Tue Sep 15 00:42:37 2026] usb 5-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [Tue Sep 15 00:42:37 2026] usb 5-5: Product: Bluetooth Radio
> [Tue Sep 15 00:42:37 2026] usb 5-5: Manufacturer: Realtek
> [Tue Sep 15 00:42:37 2026] usb 5-5: SerialNumber: 00e04c000001
> [Tue Sep 15 00:42:37 2026] usb 11-1: New USB device strings: Mfr=0, Product=0, SerialNumber=2
> [Tue Sep 15 00:42:37 2026] usb 11-1: SerialNumber: 86C48050
> [Tue Sep 15 00:42:37 2026] usb 5-6: new full-speed USB device number 3 using xhci_hcd
> [Tue Sep 15 00:42:37 2026] tsc: Refined TSC clocksource calibration: 4192.141 MHz
> [Tue Sep 15 00:42:37 2026] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x3c6d60a8266, max_idle_ns: 440795211045 ns
> [Tue Sep 15 00:42:37 2026] clocksource: Switched to clocksource tsc
> [Tue Sep 15 00:42:37 2026] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [Tue Sep 15 00:42:37 2026] ata3.00: Model 'CT1000BX500SSD1', rev 'M6CR060', applying quirks: nolpm
> [Tue Sep 15 00:42:37 2026] ata3.00: ATA-10: CT1000BX500SSD1, M6CR060, max UDMA/133
> [Tue Sep 15 00:42:37 2026] ata3.00: 1953525168 sectors, multi 1: LBA48 NCQ (depth 32), AA
> [Tue Sep 15 00:42:37 2026] ata3.00: LPM support broken, forcing max_power
> [Tue Sep 15 00:42:37 2026] ata3.00: Features: Dev-Sleep DIPM
> [Tue Sep 15 00:42:37 2026] ata3.00: configured for UDMA/133
> [Tue Sep 15 00:42:37 2026] ahci 0000:6e:00.0: port does not support device sleep
> [Tue Sep 15 00:42:37 2026] scsi 2:0:0:0: Direct-Access     ATA      CT1000BX500SSD1  060  PQ: 0 ANSI: 5
> [Tue Sep 15 00:42:37 2026] sd 2:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
> [Tue Sep 15 00:42:37 2026] sd 2:0:0:0: [sda] Write Protect is off
> [Tue Sep 15 00:42:37 2026] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [Tue Sep 15 00:42:37 2026] sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [Tue Sep 15 00:42:37 2026] sd 2:0:0:0: [sda] Preferred minimum I/O size 512 bytes
> [Tue Sep 15 00:42:37 2026] usb 5-6: New USB device found, idVendor=1038, idProduct=182c, bcdDevice= 1.00
> [Tue Sep 15 00:42:37 2026] usb 5-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [Tue Sep 15 00:42:37 2026] usb 5-6: Product: SteelSeries Prime+
> [Tue Sep 15 00:42:37 2026] usb 5-6: Manufacturer: SteelSeries
> [Tue Sep 15 00:42:37 2026] hid-generic 0003:1038:182C.0004: hiddev97,hidraw3: USB HID v1.11 Device [SteelSeries SteelSeries Prime+] on usb-0000:6d:00.0-6/input0
> [Tue Sep 15 00:42:37 2026] input: SteelSeries SteelSeries Prime+ as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6d:00.0/usb5/5-6/5-6:1.1/0003:1038:182C.0005/input/input7
> [Tue Sep 15 00:42:37 2026] hid-generic 0003:1038:182C.0005: input,hidraw4: USB HID v1.11 Mouse [SteelSeries SteelSeries Prime+] on usb-0000:6d:00.0-6/input1
> [Tue Sep 15 00:42:37 2026]  sda: sda1
> [Tue Sep 15 00:42:37 2026] sd 2:0:0:0: [sda] Attached SCSI disk
> [Tue Sep 15 00:42:37 2026] hid-generic 0003:1038:182C.0006: hiddev98,hidraw5: USB HID v1.11 Device [SteelSeries SteelSeries Prime+] on usb-0000:6d:00.0-6/input2
> [Tue Sep 15 00:42:37 2026] input: SteelSeries SteelSeries Prime+ Keyboard as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:6d:00.0/usb5/5-6/5-6:1.3/0003:1038:182C.0007/input/input8
> [Tue Sep 15 00:42:37 2026] hid-generic 0003:1038:182C.0007: input,hidraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Prime+] on usb-0000:6d:00.0-6/input3
> [Tue Sep 15 00:42:37 2026] usb 5-11: new full-speed USB device number 4 using xhci_hcd
> [Tue Sep 15 00:42:38 2026] ata4: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> [Tue Sep 15 00:42:38 2026] ata4.00: Model 'Samsung SSD 850 EVO 500GB', rev 'EMT02B6Q', applying quirks: noncqtrim zeroaftertrim
> [Tue Sep 15 00:42:38 2026] ata4.00: supports DRM functions and may not be fully accessible
> [Tue Sep 15 00:42:38 2026] ata4.00: ATA-9: Samsung SSD 850 EVO 500GB, EMT02B6Q, max UDMA/133
> [Tue Sep 15 00:42:38 2026] ata4.00: 976773168 sectors, multi 1: LBA48 NCQ (depth 32), AA
> [Tue Sep 15 00:42:38 2026] ata4.00: Features: Trust Dev-Sleep DIPM NCQ-sndrcv
> [Tue Sep 15 00:42:38 2026] ata4.00: supports DRM functions and may not be fully accessible
> [Tue Sep 15 00:42:38 2026] ata4.00: Invalid log directory version 0x0000
> [Tue Sep 15 00:42:38 2026] ata4.00: configured for UDMA/133
> [Tue Sep 15 00:42:38 2026] ahci 0000:6e:00.0: port does not support device sleep
> [Tue Sep 15 00:42:38 2026] scsi 3:0:0:0: Direct-Access     ATA      Samsung SSD 850  2B6Q PQ: 0 ANSI: 5
> [Tue Sep 15 00:42:38 2026] sd 3:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
> [Tue Sep 15 00:42:38 2026] sd 3:0:0:0: [sdb] Write Protect is off
> [Tue Sep 15 00:42:38 2026] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
> [Tue Sep 15 00:42:38 2026] sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [Tue Sep 15 00:42:38 2026] sd 3:0:0:0: [sdb] Preferred minimum I/O size 512 bytes
> [Tue Sep 15 00:42:38 2026]  sdb: sdb1
> [Tue Sep 15 00:42:38 2026] sd 3:0:0:0: [sdb] supports TCG Opal
> [Tue Sep 15 00:42:38 2026] sd 3:0:0:0: [sdb] Attached SCSI disk
> [Tue Sep 15 00:42:38 2026] Freeing unused decrypted memory: 2028K
> [Tue Sep 15 00:42:38 2026] Freeing unused kernel image (initmem) memory: 4972K
> [Tue Sep 15 00:42:38 2026] Write protecting the kernel read-only data: 40960k
> [Tue Sep 15 00:42:38 2026] Freeing unused kernel image (text/rodata gap) memory: 88K
> [Tue Sep 15 00:42:38 2026] Freeing unused kernel image (rodata/data gap) memory: 456K
> [Tue Sep 15 00:42:38 2026] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [Tue Sep 15 00:42:38 2026] rodata_test: all tests were successful
> [Tue Sep 15 00:42:38 2026] Run /init as init process
> [Tue Sep 15 00:42:38 2026]   with arguments:
> [Tue Sep 15 00:42:38 2026]     /init
> [Tue Sep 15 00:42:38 2026]   with environment:
> [Tue Sep 15 00:42:38 2026]     HOME=/
> [Tue Sep 15 00:42:38 2026]     TERM=linux
> [Tue Sep 15 00:42:38 2026] systemd[1]: Successfully made /usr/ read-only.
> [Tue Sep 15 00:42:38 2026] usb 5-11: New USB device found, idVendor=0b05, idProduct=19af, bcdDevice= 1.00
> [Tue Sep 15 00:42:38 2026] usb 5-11: config 1 has an invalid interface number: 2 but max is 1
> [Tue Sep 15 00:42:38 2026] usb 5-11: config 1 has no interface number 1
> [Tue Sep 15 00:42:38 2026] usb 5-11: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [Tue Sep 15 00:42:38 2026] usb 5-11: Product: AURA LED Controller
> [Tue Sep 15 00:42:38 2026] usb 5-11: Manufacturer: AsusTek Computer Inc.
> [Tue Sep 15 00:42:38 2026] usb 5-11: SerialNumber: 9876543210
> [Tue Sep 15 00:42:38 2026] hid-generic 0003:0B05:19AF.0008: hiddev99,hidraw7: USB HID v1.11 Device [AsusTek Computer Inc. AURA LED Controller] on usb-0000:6d:00.0-11/input2
> [Tue Sep 15 00:42:38 2026] systemd[1]: systemd 261.3-1-arch running in system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
> [Tue Sep 15 00:42:38 2026] systemd[1]: Detected architecture x86-64.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Running in initrd.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Initializing machine ID from random generator.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Queued start job for default target Initrd Default Target.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Expecting device /dev/disk/by-uuid/a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7...
> [Tue Sep 15 00:42:38 2026] systemd[1]: Reached target Path Units.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Reached target Slice Units.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Reached target Swaps.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Reached target Timer Units.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Listening on Journal Socket (/dev/log).
> [Tue Sep 15 00:42:38 2026] systemd[1]: Listening on Journal Sockets.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Listening on udev Control Socket.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Listening on udev Kernel Socket.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Reached target Socket Units.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Create List of Static Device Nodes skipped, unmet condition check ConditionFileNotEmpty=/lib/modules/7.3.0-rc2-1-mainline/modules.devname
> [Tue Sep 15 00:42:38 2026] systemd[1]: Starting Journal Service...
> [Tue Sep 15 00:42:38 2026] systemd[1]: Starting Load Kernel Modules...
> [Tue Sep 15 00:42:38 2026] systemd[1]: TPM PCR OS Separator skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:42:38 2026] systemd[1]: TPM PCR Barrier (initrd) skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:42:38 2026] systemd[1]: Starting Create Static Device Nodes in /dev...
> [Tue Sep 15 00:42:38 2026] systemd[1]: Starting Coldplug All udev Devices...
> [Tue Sep 15 00:42:38 2026] systemd[1]: Starting Virtual Console Setup...
> [Tue Sep 15 00:42:38 2026] systemd[1]: Finished Create Static Device Nodes in /dev.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Reached target Preparation for Local File Systems.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Reached target Local File Systems.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Starting Rule-based Manager for Device Events and Files...
> [Tue Sep 15 00:42:38 2026] systemd[1]: Finished Virtual Console Setup.
> [Tue Sep 15 00:42:38 2026] systemd-journald[214]: Collecting audit messages is disabled.
> [Tue Sep 15 00:42:38 2026] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
> [Tue Sep 15 00:42:38 2026] input: Video Bus as /devices/pci0000:00/0000:00:08.1/acpi.video_bus.0/input/input9
> [Tue Sep 15 00:42:38 2026] systemd[1]: Started Rule-based Manager for Device Events and Files.
> [Tue Sep 15 00:42:38 2026] systemd[1]: Started Journal Service.
> [Tue Sep 15 00:42:38 2026] fbcon: Taking over console
> [Tue Sep 15 00:42:38 2026] Console: switching to colour frame buffer device 128x48
> [Tue Sep 15 00:42:40 2026] Key type psk registered
> [Tue Sep 15 00:42:40 2026] amdgpu: vga_switcheroo: detected switching method \_SB_.PCI0.GP17.VGA_.ATPX handle
> [Tue Sep 15 00:42:40 2026] amdgpu: ATPX version 1, functions 0x00000000
> [Tue Sep 15 00:42:40 2026] nvme nvme0: pci function 0000:04:00.0
> [Tue Sep 15 00:42:40 2026] amdgpu: Virtual CRAT table created for CPU
> [Tue Sep 15 00:42:40 2026] amdgpu: Topology: Add CPU node
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: enabling device (0006 -> 0007)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: initializing kernel modesetting (NAVY_FLOUNDER 0x1002:0x73DF 0x1DA2:0xE445 0xC1).
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: register mmio base: 0xDCB00000
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: register mmio size: 1048576
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 0 <common_v1_0_0> (nv_common)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 1 <gmc_v10_0_0> (gmc_v10_0)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 2 <ih_v5_0_0> (navi10_ih)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 3 <psp_v11_0_0> (psp)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 4 <smu_v11_0_0> (smu)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 5 <dce_v1_0_0> (dm)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 6 <gfx_v10_0_0> (gfx_v10_0)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 7 <sdma_v5_2_0> (sdma_v5_2)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 8 <vcn_v3_0_0> (vcn_v3_0)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: detected ip block number 9 <jpeg_v3_0_0> (jpeg_v3_0)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: Fetched VBIOS from VFCT
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: [drm] ATOM BIOS: 113-D5121200-O04, build: 591224  , ver: 020.002.000.019.000000, 2021/10/22
> [Tue Sep 15 00:42:40 2026] Console: switching to colour dummy device 80x25
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: VRAM: 12272M 0x0000008000000000 - 0x00000082FEFFFFFF (12272M used)
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: [drm] Detected VRAM RAM=12272M, BAR=16384M
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: [drm] RAM width 192bits GDDR6
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0:  12272M of VRAM memory ready
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0:  15615M of GTT memory ready.
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: [drm] GART: num cpu pages 131072, num gpu pages 131072
> [Tue Sep 15 00:42:40 2026] amdgpu 0000:03:00.0: [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
> [Tue Sep 15 00:42:40 2026] nvme nvme0: passthrough uses implicit buffer lengths
> [Tue Sep 15 00:42:40 2026] nvme nvme0: allocated 64 MiB host memory buffer (1 segment).
> [Tue Sep 15 00:42:40 2026] nvme nvme0: 16/0/0 default/read/poll queues
> [Tue Sep 15 00:42:40 2026]  nvme0n1: p1 p2
> [Tue Sep 15 00:42:40 2026] BTRFS: device fsid a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 devid 1 transid 21645 /dev/nvme0n1p2 (259:2) scanned by mount (305)
> [Tue Sep 15 00:42:40 2026] BTRFS info (device nvme0n1p2): first mount of filesystem a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7
> [Tue Sep 15 00:42:40 2026] BTRFS info (device nvme0n1p2): using crc32c checksum algorithm
> [Tue Sep 15 00:42:40 2026] BTRFS info (device nvme0n1p2): enabling ssd optimizations
> [Tue Sep 15 00:42:40 2026] BTRFS info (device nvme0n1p2): turning on async discard
> [Tue Sep 15 00:42:40 2026] BTRFS info (device nvme0n1p2): enabling free space tree
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: STB initialized to 2048 entries
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] Loading DMUB firmware via PSP: version=0x02020022
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] use_doorbell being set to: [true]
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] use_doorbell being set to: [true]
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [VCN instance 0] Found VCN firmware Version ENC: 1.33 DEC: 4 VEP: 0 Revision: 21
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: reserve 0xa00000 from 0x82fd000000 for PSP TMR
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: RAS: optional ras ta ucode is not available
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: SECUREDISPLAY: optional securedisplay ta ucode is not available
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: smu driver if version = 0x0000000e, smu fw if version = 0x00000012, smu fw program = 0, smu fw version = 0x00413f00 (65.63.0)
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: use vbios provided pptable
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: SMU is initialized successfully!
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] Display Core v3.2.392 initialized on DCN 3.0
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] DP-HDMI FRL PCON supported
> [Tue Sep 15 00:42:42 2026] amdgpu 0000:03:00.0: [drm] DMUB hardware initialized: version=0x02020022
> [Tue Sep 15 00:42:42 2026] workqueue: name exceeds WQ_NAME_LEN. Truncating to: hdmi_frl_status_polling_workque
> [Tue Sep 15 00:42:49 2026] clocksource: Watchdog remote CPU 9 read timed out
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: -110
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: xHCI host controller not responding, assume dead
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: HC died; cleaning up
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Error while assigning device slot ID: Command Aborted
> [Tue Sep 15 00:43:00 2026] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI host supports is 64.
> [Tue Sep 15 00:43:00 2026] usb usb1-port1: couldn't allocate usb_device
> [Tue Sep 15 00:43:00 2026] usb usb2-port1: couldn't allocate usb_device
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: kiq ring mec 2 pipe 1 q 0
> [Tue Sep 15 00:43:01 2026] kfd kfd: Allocated 3969056 bytes on gart
> [Tue Sep 15 00:43:01 2026] kfd kfd: Total number of KFD nodes to be created: 1
> [Tue Sep 15 00:43:01 2026] amdgpu: Virtual CRAT table created for GPU
> [Tue Sep 15 00:43:01 2026] amdgpu: Topology: Add GPU node [0x1002:0x73df]
> [Tue Sep 15 00:43:01 2026] kfd kfd: added device 1002:73df
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: SE 2, SH per SE 2, CU per SH 10, active_cu_number 40
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM inv eng 4 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM inv eng 5 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.2.0 uses VM inv eng 6 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.3.0 uses VM inv eng 7 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM inv eng 8 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM inv eng 9 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.2.1 uses VM inv eng 10 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring comp_1.3.1 uses VM inv eng 11 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring kiq_0.2.1.0 uses VM inv eng 12 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring sdma0 uses VM inv eng 13 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring sdma1 uses VM inv eng 14 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring vcn_dec_0 uses VM inv eng 0 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring vcn_enc_0.0 uses VM inv eng 1 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring vcn_enc_0.1 uses VM inv eng 4 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: ring jpeg_dec uses VM inv eng 5 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu: HMM registered 12272MB device memory
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: Using BACO for runtime pm
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: [drm] Registered 6 planes with drm panic
> [Tue Sep 15 00:43:01 2026] [drm] Initialized amdgpu 3.64.0 for 0000:03:00.0 on minor 1
> [Tue Sep 15 00:43:01 2026] fbcon: amdgpudrmfb (fb0) is primary device
> [Tue Sep 15 00:43:01 2026] [drm] pre_validate_dsc:1796 MST_DSC dsc precompute is not needed
> [Tue Sep 15 00:43:01 2026] Console: switching to colour frame buffer device 160x45
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: enabling device (0006 -> 0007)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: initializing kernel modesetting (IP DISCOVERY 0x1002:0x164E 0x1043:0x8877 0xCB).
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: register mmio base: 0xDCA00000
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: register mmio size: 524288
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 0 <common_v1_0_0> (nv_common)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 1 <gmc_v10_0_0> (gmc_v10_0)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 2 <ih_v5_0_0> (navi10_ih)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 3 <psp_v13_0_0> (psp)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 4 <smu_v13_0_0> (smu)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 5 <dce_v1_0_0> (dm)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 6 <gfx_v10_0_0> (gfx_v10_0)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 7 <sdma_v5_2_0> (sdma_v5_2)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 8 <vcn_v3_0_0> (vcn_v3_0)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: detected ip block number 9 <jpeg_v3_0_0> (jpeg_v3_0)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: Fetched VBIOS from VFCT
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] ATOM BIOS: 102-RAPHAEL-008, build: 612127  , ver: 032.019.000.008.000000, 2022/09/26
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] Detected VRAM RAM=512M, BAR=512M
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] RAM width 128bits DDR5
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0:  512M of VRAM memory ready
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0:  15615M of GTT memory ready.
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] GART: num cpu pages 262144, num gpu pages 262144
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] PCIE GART of 1024M enabled (table at 0x000000F41FC00000).
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] Loading DMUB firmware via PSP: version=0x05003500
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] use_doorbell being set to: [true]
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [VCN instance 0] Found VCN firmware Version ENC: 1.33 DEC: 4 VEP: 0 Revision: 21
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: reserve 0xa00000 from 0xf41e000000 for PSP TMR
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: RAS: optional ras ta ucode is not available
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: RAP: optional rap ta ucode is not available
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: SECUREDISPLAY: optional securedisplay ta ucode is not available
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: SMU is initialized successfully!
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] Display Core v3.2.392 initialized on DCN 3.1.5
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] DP-HDMI FRL PCON supported
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] DMUB hardware initialized: version=0x05003500
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] HDMI-A-2: PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] DP-4: PSR support 0, DC PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: kiq ring mec 2 pipe 1 q 0
> [Tue Sep 15 00:43:01 2026] kfd kfd: Allocated 3969056 bytes on gart
> [Tue Sep 15 00:43:01 2026] kfd kfd: Total number of KFD nodes to be created: 1
> [Tue Sep 15 00:43:01 2026] amdgpu: Virtual CRAT table created for GPU
> [Tue Sep 15 00:43:01 2026] amdgpu: Topology: Add GPU node [0x1002:0x164e]
> [Tue Sep 15 00:43:01 2026] kfd kfd: added device 1002:164e
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: SE 1, SH per SE 1, CU per SH 2, active_cu_number 2
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.0.0 uses VM inv eng 4 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.1.0 uses VM inv eng 5 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.2.0 uses VM inv eng 6 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.3.0 uses VM inv eng 7 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.0.1 uses VM inv eng 8 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.1.1 uses VM inv eng 9 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.2.1 uses VM inv eng 10 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring comp_1.3.1 uses VM inv eng 11 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring kiq_0.2.1.0 uses VM inv eng 12 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring sdma0 uses VM inv eng 13 on hub 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring vcn_dec_0 uses VM inv eng 0 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring vcn_enc_0.0 uses VM inv eng 1 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring vcn_enc_0.1 uses VM inv eng 4 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: ring jpeg_dec uses VM inv eng 5 on hub 8
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: Runtime PM not available
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] Registered 4 planes with drm panic
> [Tue Sep 15 00:43:01 2026] [drm] Initialized amdgpu 3.64.0 for 0000:6f:00.0 on minor 0
> [Tue Sep 15 00:43:01 2026] amdgpu 0000:6f:00.0: [drm] Cannot find any crtc or sizes
> [Tue Sep 15 00:43:01 2026] systemd-journald[214]: Received SIGTERM from PID 1 (systemd).
> [Tue Sep 15 00:43:02 2026] systemd[1]: systemd 261.3-1-arch running in system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
> [Tue Sep 15 00:43:02 2026] systemd[1]: Detected architecture x86-64.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Hostname set to <moomooPC-cachy>.
> [Tue Sep 15 00:43:02 2026] systemd[1]: bpf-restrict-fs: LSM BPF program attached
> [Tue Sep 15 00:43:02 2026] zram: Added device: zram0
> [Tue Sep 15 00:43:02 2026] systemd[1]: initrd-switch-root.service: Deactivated successfully.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Stopped Switch Root.
> [Tue Sep 15 00:43:02 2026] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice CUPS Slice.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/dirmngr.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/getty.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/gpg-agent.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/gpg-agent-browser.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/gpg-agent-extra.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/keyboxd.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/modprobe.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/systemd-fsck.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice Slice /system/systemd-zram-setup.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Created slice User and Session Slice.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Dispatch Password Requests to Console Directory Watch skipped, unmet condition check ConditionPathExists=!/run/plymouth/pid
> [Tue Sep 15 00:43:02 2026] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Expecting device /dev/disk/by-uuid/51a5824b-f9f6-43e1-a91e-35959c7db669...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Expecting device /dev/disk/by-uuid/A108-C690...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Expecting device /dev/disk/by-uuid/a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Expecting device /dev/disk/by-uuid/e5f7a047-17df-4708-a14e-14dea42c220b...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Expecting device /dev/zram0...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Reached target Login Prompts.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Reached target Image Downloads.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Stopped target Switch Root.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Stopped target Initrd File Systems.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Stopped target Initrd Root File System.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Reached target Local Integrity Protected Volumes.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Reached target Remote File Systems.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Reached target Slice Units.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Reached target Local Verity Protected Volumes.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Device-mapper event daemon FIFOs.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on LVM2 poll daemon socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Query the User Interactively for a Password.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Process Core Dump Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Credential Encryption/Decryption.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Factory Reset Management.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Hostname Service Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Console Output Muting Service Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: TPM PCR Measurements skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:43:02 2026] systemd[1]: Make TPM PCR Policy skipped, unmet condition check ConditionSecurity=measured-uki
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Disk Repartitioning Service Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Resolve Monitor Varlink Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Resolve Service Varlink Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Simple Block Device Backed Storage Provider.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on Simple File System Backed Storage Provider.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on udev Control Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on udev Varlink Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Listening on User Database Manager Socket.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounting Huge Pages File System...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounting POSIX Message Queue File System...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounting Kernel Debug File System...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounting Kernel Trace File System...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Create List of Static Device Nodes...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Load Kernel Module configfs skipped, unmet condition check ConditionKernelModuleLoaded=!configfs
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounting Kernel Configuration File System...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Load Kernel Module drm skipped, unmet condition check ConditionKernelModuleLoaded=!drm
> [Tue Sep 15 00:43:02 2026] systemd[1]: Load Kernel Module fuse skipped, unmet condition check ConditionKernelModuleLoaded=!fuse
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounting FUSE Control File System...
> [Tue Sep 15 00:43:02 2026] systemd[1]: plymouth-switch-root.service: Deactivated successfully.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Stopped Plymouth switch root service.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Clear Stale Hibernate Storage Info skipped, unmet condition check ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Journal Service...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Load Kernel Modules...
> [Tue Sep 15 00:43:02 2026] systemd[1]: TPM PCR Machine ID Measurement skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:43:02 2026] systemd[1]: TPM PCR OS Separator skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Remount Root and Kernel File Systems...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Early TPM SRK Setup skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:43:02 2026] systemd[1]: TPM PCR NvPCR Initialization Separator skipped, unmet condition check ConditionPathExists=/etc/initrd-release
> [Tue Sep 15 00:43:02 2026] systemd[1]: Reached target Local Encrypted Volumes.
> [Tue Sep 15 00:43:02 2026] systemd[1]: TPM NvPCR Product ID Measurement skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Load udev Rules from Credentials...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Coldplug All udev Devices...
> [Tue Sep 15 00:43:02 2026] systemd[1]: Finished Create List of Static Device Nodes.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounted Huge Pages File System.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounted POSIX Message Queue File System.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounted Kernel Debug File System.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounted Kernel Trace File System.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounted Kernel Configuration File System.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Mounted FUSE Control File System.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Create Static Device Nodes in /dev gracefully...
> [Tue Sep 15 00:43:02 2026] BTRFS info (device nvme0n1p2 state M): use zstd compression, level 3
> [Tue Sep 15 00:43:02 2026] systemd[1]: Finished Remount Root and Kernel File Systems.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Rebuild Hardware Database skipped, unmet condition check ConditionNeedsUpdate=/etc
> [Tue Sep 15 00:43:02 2026] systemd[1]: Starting Load/Save OS Random Seed...
> [Tue Sep 15 00:43:02 2026] systemd[1]: TPM SRK Setup skipped, unmet condition check ConditionSecurity=measured-os
> [Tue Sep 15 00:43:02 2026] systemd[1]: Finished Load udev Rules from Credentials.
> [Tue Sep 15 00:43:02 2026] systemd-journald[457]: Collecting audit messages is disabled.
> [Tue Sep 15 00:43:02 2026] Asymmetric key parser 'pkcs8' registered
> [Tue Sep 15 00:43:02 2026] i2c_dev: i2c /dev entries driver
> [Tue Sep 15 00:43:02 2026] systemd[1]: Finished Load/Save OS Random Seed.
> [Tue Sep 15 00:43:02 2026] systemd[1]: Started Journal Service.
> [Tue Sep 15 00:43:02 2026] device-mapper: uevent: version 1.0.3
> [Tue Sep 15 00:43:02 2026] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
> [Tue Sep 15 00:43:02 2026] ACPI: bus type thunderbolt registered
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: enabling device (0000 -> 0002)
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: IOMMU DMA protection is disabled
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: total paths: 12
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: allocating TX ring 0 of size 10
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: allocating RX ring 0 of size 10
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: control channel created
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: using firmware connection manager
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: NHI initialized, starting thunderbolt
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: control channel starting...
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: starting TX ring 0
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: enabling interrupt at register 0x38200 bit 0 (0x0 -> 0x1)
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: starting RX ring 0
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: enabling interrupt at register 0x38200 bit 12 (0x1 -> 0x1001)
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: USB4 proxy operations supported
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: security level set to none
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0: current switch config:
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0:  USB4 Switch: 8087:1136 (Revision: 2, TB Version: 32)
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0:   Max Port Number: 13
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0:   Config:
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0:    Upstream Port Number: 7 Depth: 0 Route String: 0x0 Enabled: 1, PlugEventsDelay: 10ms
> [Tue Sep 15 00:43:02 2026] thunderbolt 0000:09:00.0:    unknown1: 0x0 unknown4: 0x0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 0: DROM version: 1
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 0: uid: 0x59214a008087fbd3
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 1: 8086:1136 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x47800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 120/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 2: 8086:1136 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x80000000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 0/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 3: 8086:1136 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 4: 8086:1136 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 5: 8086:1136 (Revision: 0, TB Version: 1, Type: DP/HDMI (0xe0101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 9/9
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x100000d
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 16/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 6: 8086:1136 (Revision: 0, TB Version: 1, Type: DP/HDMI (0xe0101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 9/9
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x100000d
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 16/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 0:7: disabled by eeprom
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 8: 8086:1136 (Revision: 0, TB Version: 1, Type: PCIe (0x100101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x40800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 9: 8086:1136 (Revision: 0, TB Version: 1, Type: PCIe (0x100101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x40800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 10: 8086:1136 (Revision: 0, TB Version: 1, Type: Inactive (0x0))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 9/9
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 11: 8086:1136 (Revision: 0, TB Version: 1, Type: Inactive (0x0))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 9/9
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 12: 8086:1136 (Revision: 0, TB Version: 1, Type: USB (0x200101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 13: 8086:1136 (Revision: 0, TB Version: 1, Type: USB (0x200101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 0: NVM version 43.83
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: current switch config:
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  USB4 Switch: 8087:b26 (Revision: 3, TB Version: 32)
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max Port Number: 19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Config:
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:    Upstream Port Number: 1 Depth: 1 Route String: 0x1 Enabled: 1, PlugEventsDelay: 254ms
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:    unknown1: 0x0 unknown4: 0x0
> [Tue Sep 15 00:43:03 2026] zram0: detected capacity change from 0 to 63961088
> [Tue Sep 15 00:43:03 2026] zswap: loaded using pool zstd
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 1: DROM version: 1
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 1: uid: 0xbcb027008087fd6b
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 1: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0xc780001a
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 120/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 2: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x80000000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 0/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 3: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 4: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 5: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 6: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 7: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 8: 8086:b26 (Revision: 3, TB Version: 1, Type: Port (0x1))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 19/19
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 16
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x83c00000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 60/2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 9: 8086:b26 (Revision: 3, TB Version: 1, Type: PCIe (0x100102))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x40800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 10: 8086:b26 (Revision: 3, TB Version: 1, Type: PCIe (0x100101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x40800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 11: 8086:b26 (Revision: 3, TB Version: 1, Type: PCIe (0x100101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x40800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 12: 8086:b26 (Revision: 3, TB Version: 1, Type: PCIe (0x100101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x40800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 13: 8086:b26 (Revision: 1, TB Version: 1, Type: DP/HDMI (0xe0102))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 9/9
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 14: 8086:b26 (Revision: 1, TB Version: 1, Type: DP/HDMI (0xe0102))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 9/9
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x40800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 15: 8086:b26 (Revision: 1, TB Version: 1, Type: Inactive (0x0))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 0/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 0/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 16: 8086:b26 (Revision: 3, TB Version: 1, Type: USB (0x200102))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 17: 8086:b26 (Revision: 3, TB Version: 1, Type: USB (0x200101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 18: 8086:b26 (Revision: 3, TB Version: 1, Type: USB (0x200101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:  Port 19: 8086:b26 (Revision: 3, TB Version: 1, Type: USB (0x200101))
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max hop id (in/out): 8/8
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Max counters: 2
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   NFC Credits: 0x800000
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0:   Credits (total/control): 8/0
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 1: running quirk_dp_credit_allocation [thunderbolt]
> [Tue Sep 15 00:43:03 2026] thunderbolt 0-1: new device found, vendor=0x3d device=0x26
> [Tue Sep 15 00:43:03 2026] thunderbolt 0-1: CalDigit, Inc. TS4
> [Tue Sep 15 00:43:03 2026] thunderbolt 0000:09:00.0: 1: NVM version 45.83
> [Tue Sep 15 00:43:03 2026] Adding 31980540k swap on /dev/zram0.  Priority:100 extents:1 across:31980540k SSDsc
> [Tue Sep 15 00:43:03 2026] pps_core: LinuxPPS API ver. 1 registered
> [Tue Sep 15 00:43:03 2026] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [Tue Sep 15 00:43:03 2026] mousedev: PS/2 mouse device common for all mice
> [Tue Sep 15 00:43:03 2026] ahci 0000:6e:00.0: port does not support device sleep
> [Tue Sep 15 00:43:03 2026] PTP clock support registered
> [Tue Sep 15 00:43:03 2026] Bluetooth: Core ver 2.22
> [Tue Sep 15 00:43:03 2026] NET: Registered PF_BLUETOOTH protocol family
> [Tue Sep 15 00:43:03 2026] Bluetooth: HCI device and connection manager initialized
> [Tue Sep 15 00:43:03 2026] Bluetooth: HCI socket layer initialized
> [Tue Sep 15 00:43:03 2026] Bluetooth: L2CAP socket layer initialized
> [Tue Sep 15 00:43:03 2026] Bluetooth: SCO socket layer initialized
> [Tue Sep 15 00:43:03 2026] Intel(R) 2.5G Ethernet Linux Driver
> [Tue Sep 15 00:43:03 2026] Copyright(c) 2018 Intel Corporation.
> [Tue Sep 15 00:43:03 2026] igc 0000:10:00.0: enabling device (0000 -> 0002)
> [Tue Sep 15 00:43:03 2026] igc 0000:10:00.0: PCIe PTM not supported by PCIe bus/controller
> [Tue Sep 15 00:43:03 2026] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [Tue Sep 15 00:43:03 2026] RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 163840 ms ovfl timer
> [Tue Sep 15 00:43:03 2026] RAPL PMU: hw unit of domain package 2^-16 Joules
> [Tue Sep 15 00:43:03 2026] RAPL PMU: hw unit of domain core 2^-16 Joules
> [Tue Sep 15 00:43:03 2026] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [Tue Sep 15 00:43:03 2026] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> [Tue Sep 15 00:43:03 2026] input: PC Speaker as /devices/platform/pcspkr/input/input10
> [Tue Sep 15 00:43:03 2026] mc: Linux media interface: v0.10
> [Tue Sep 15 00:43:03 2026] ccp 0000:6f:00.2: enabling device (0000 -> 0002)
> [Tue Sep 15 00:43:03 2026] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
> [Tue Sep 15 00:43:03 2026] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
> [Tue Sep 15 00:43:03 2026] ccp 0000:6f:00.2: tee enabled
> [Tue Sep 15 00:43:03 2026] ccp 0000:6f:00.2: psp enabled
> [Tue Sep 15 00:43:03 2026] i2c i2c-14: Successfully instantiated SPD at 0x51
> [Tue Sep 15 00:43:03 2026] i2c i2c-14: Successfully instantiated SPD at 0x53
> [Tue Sep 15 00:43:03 2026] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
> [Tue Sep 15 00:43:03 2026] asus_wmi: failed to register LPS0 sleep handler in asus-wmi
> [Tue Sep 15 00:43:03 2026] r8169 0000:6b:00.0: can't disable ASPM; OS doesn't have ASPM control
> [Tue Sep 15 00:43:03 2026] asus_wmi: SFUN value: 0x1
> [Tue Sep 15 00:43:03 2026] eeepc-wmi eeepc-wmi: Detected ATK, not ASUSWMI, use DSTS
> [Tue Sep 15 00:43:03 2026] videodev: Linux video capture interface: v2.00
> [Tue Sep 15 00:43:03 2026] input: Eee PC WMI hotkeys as /devices/platform/eeepc-wmi/input/input11
> [Tue Sep 15 00:43:03 2026] r8169 0000:6b:00.0 eth0: RTL8125B, 10:7c:61:20:b5:a5, XID 641, IRQ 138
> [Tue Sep 15 00:43:03 2026] r8169 0000:6b:00.0 eth0: jumbo features [frames: 16362 bytes, tx checksumming: ko]
> [Tue Sep 15 00:43:03 2026] r8169 0000:6b:00.0 eno1: renamed from eth0
> [Tue Sep 15 00:43:03 2026] asus_armoury: No matching power limits found for this system
> [Tue Sep 15 00:43:03 2026] usbcore: registered new interface driver btusb
> [Tue Sep 15 00:43:03 2026] spd5118 14-0051: DDR5 temperature sensor: vendor 0x00:0xb3 revision 2.2
> [Tue Sep 15 00:43:03 2026] Bluetooth: hci0: RTL: examining hci_ver=0b hci_rev=000b lmp_ver=0b lmp_subver=8852
> [Tue Sep 15 00:43:03 2026] igc 0000:10:00.0 (unnamed net_device) (uninitialized): PHC added
> [Tue Sep 15 00:43:03 2026] Bluetooth: hci0: RTL: rom_version status=0 version=1
> [Tue Sep 15 00:43:03 2026] spd5118 14-0053: DDR5 temperature sensor: vendor 0x00:0xb3 revision 2.2
> [Tue Sep 15 00:43:03 2026] Bluetooth: hci0: RTL: btrtl_initialize: key id 0
> [Tue Sep 15 00:43:03 2026] Bluetooth: hci0: RTL: loading rtl_bt/rtl8852bu_fw.bin
> [Tue Sep 15 00:43:03 2026] Bluetooth: hci0: RTL: loading rtl_bt/rtl8852bu_config.bin
> [Tue Sep 15 00:43:03 2026] Bluetooth: hci0: RTL: cfg_sz 6, total sz 62539
> [Tue Sep 15 00:43:03 2026] igc 0000:10:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
> [Tue Sep 15 00:43:03 2026] igc 0000:10:00.0 eth0: MAC: 64:4b:f0:38:ff:0e
> [Tue Sep 15 00:43:03 2026] igc 0000:10:00.0 enp16s0: renamed from eth0
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:03:00.1: enabling device (0000 -> 0002)
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:03:00.1: Handle vga_switcheroo audio client
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:03:00.1: Force to non-snoop mode
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:6f:00.1: enabling device (0000 -> 0002)
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:6f:00.1: Handle vga_switcheroo audio client
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:6f:00.6: enabling device (0000 -> 0002)
> [Tue Sep 15 00:43:03 2026] kvm_amd: TSC scaling supported
> [Tue Sep 15 00:43:03 2026] kvm_amd: Nested Virtualization enabled
> [Tue Sep 15 00:43:03 2026] kvm_amd: Nested Paging enabled
> [Tue Sep 15 00:43:03 2026] kvm_amd: LBR virtualization supported
> [Tue Sep 15 00:43:03 2026] kvm_amd: AVIC enabled
> [Tue Sep 15 00:43:03 2026] kvm_amd: x2AVIC enabled (max 512 vCPUs)
> [Tue Sep 15 00:43:03 2026] kvm_amd: Virtual GIF supported
> [Tue Sep 15 00:43:03 2026] kvm_amd: Virtual NMI enabled
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:6f:00.1: bound 0000:6f:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [Tue Sep 15 00:43:03 2026] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0: autoconfig for ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0:    mono: mono_out=0x0
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0:    inputs:
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0:      Rear Mic=0x18
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0:      Front Mic=0x19
> [Tue Sep 15 00:43:03 2026] snd_hda_codec_alc882 hdaudioC3D0:      Line=0x1a
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:6f:00.1/sound/card2/input12
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:6f:00.1/sound/card2/input13
> [Tue Sep 15 00:43:03 2026] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card1/input14
> [Tue Sep 15 00:43:03 2026] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card1/input15
> [Tue Sep 15 00:43:03 2026] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card1/input16
> [Tue Sep 15 00:43:03 2026] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card1/input17
> [Tue Sep 15 00:43:03 2026] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card1/input18
> [Tue Sep 15 00:43:03 2026] input: HDA ATI HDMI HDMI/DP,pcm=11 as /devices/pci0000:00/0000:00:01.1/0000:01:00.0/0000:02:00.0/0000:03:00.1/sound/card1/input19
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: loaded firmware rtw89/rtw8852b_fw-2.bin
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: enabling device (0000 -> 0003)
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card3/input20
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card3/input21
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card3/input22
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic Line Out Front as /devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card3/input23
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic Line Out Surround as /devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card3/input24
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic Line Out CLFE as /devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card3/input25
> [Tue Sep 15 00:43:03 2026] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:6f:00.6/sound/card3/input26
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware version 0.29.29.18 (9e3d777f), cmd version 0, type 5
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware version 0.29.29.18 (9e3d777f), cmd version 0, type 3
> [Tue Sep 15 00:43:03 2026] intel_rapl_common: Found RAPL domain package
> [Tue Sep 15 00:43:03 2026] intel_rapl_common: Found RAPL domain core
> [Tue Sep 15 00:43:03 2026] amd_atl: AMD Address Translation Library initialized
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element BB version: 00 28 00 00
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element radio A version: 00 32 00 00
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element NCTL version: 00 0a 00 00
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element TXPWR version: 00 43 00 00
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element TXPWR version: 00 43 00 00
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element TXPWR version: 00 43 00 00
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element PWR_TRK version: 00 32 00 00
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: Firmware element REGD version: 00 49 00 33
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: chip info CID: 0, CV: 1, AID: 0, ACV: 1, RFE: 1
> [Tue Sep 15 00:43:03 2026] rtw89_8852be 0000:6c:00.0: rfkill hardware state changed to enable
> [Tue Sep 15 00:43:03 2026] BTRFS: device fsid e5f7a047-17df-4708-a14e-14dea42c220b devid 1 transid 4763 /dev/sda1 (8:1) scanned by mount (736)
> [Tue Sep 15 00:43:03 2026] BTRFS info (device sda1): first mount of filesystem e5f7a047-17df-4708-a14e-14dea42c220b
> [Tue Sep 15 00:43:03 2026] BTRFS info (device sda1): using crc32c checksum algorithm
> [Tue Sep 15 00:43:03 2026] BTRFS: device fsid 51a5824b-f9f6-43e1-a91e-35959c7db669 devid 1 transid 872 /dev/sdb1 (8:17) scanned by mount (737)
> [Tue Sep 15 00:43:03 2026] BTRFS info (device sdb1): first mount of filesystem 51a5824b-f9f6-43e1-a91e-35959c7db669
> [Tue Sep 15 00:43:03 2026] BTRFS info (device sdb1): using crc32c checksum algorithm
> [Tue Sep 15 00:43:03 2026] systemd-journald[457]: Received client request to flush runtime journal.
> [Tue Sep 15 00:43:03 2026] BTRFS info (device sdb1): enabling ssd optimizations
> [Tue Sep 15 00:43:03 2026] BTRFS info (device sdb1): turning on async discard
> [Tue Sep 15 00:43:03 2026] BTRFS info (device sdb1): enabling free space tree
> [Tue Sep 15 00:43:04 2026] BTRFS info (device sda1): enabling ssd optimizations
> [Tue Sep 15 00:43:04 2026] BTRFS info (device sda1): turning on async discard
> [Tue Sep 15 00:43:04 2026] BTRFS info (device sda1): enabling free space tree
> [Tue Sep 15 00:43:04 2026] usb 11-1: set resolution quirk: cval->res = 384
> [Tue Sep 15 00:43:04 2026] usbcore: registered new interface driver snd-usb-audio
> [Tue Sep 15 00:43:04 2026] uvcvideo 11-1:1.0: Found UVC 1.00 device <unnamed> (046d:0825)
> [Tue Sep 15 00:43:04 2026] Bluetooth: hci0: RTL: fw version 0x127cfd78
> [Tue Sep 15 00:43:04 2026] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [Tue Sep 15 00:43:04 2026] Bluetooth: BNEP filters: protocol multicast
> [Tue Sep 15 00:43:04 2026] Bluetooth: BNEP socket layer initialized
> [Tue Sep 15 00:43:05 2026] Realtek Internal NBASE-T PHY r8169-0-6b00:00: attached PHY driver (mii_bus:phy_addr=r8169-0-6b00:00, irq=MAC)
> [Tue Sep 15 00:43:05 2026] usbcore: registered new interface driver uvcvideo
> [Tue Sep 15 00:43:05 2026] Bluetooth: hci0: AOSP extensions version v1.00
> [Tue Sep 15 00:43:05 2026] Bluetooth: MGMT ver 1.23
> [Tue Sep 15 00:43:05 2026] r8169 0000:6b:00.0 eno1: Link is Down
> [Tue Sep 15 00:43:09 2026] wlan0: authenticate with 30:de:4b:9e:aa:d2 (local address=a8:41:f4:2d:3e:80)
> [Tue Sep 15 00:43:09 2026] wlan0: send auth to 30:de:4b:9e:aa:d2 (try 1/3)
> [Tue Sep 15 00:43:09 2026] wlan0: authenticated
> [Tue Sep 15 00:43:09 2026] wlan0: associate with 30:de:4b:9e:aa:d2 (try 1/3)
> [Tue Sep 15 00:43:09 2026] wlan0: RX AssocResp from 30:de:4b:9e:aa:d2 (capab=0x1511 status=0 aid=4)
> [Tue Sep 15 00:43:09 2026] wlan0: associated
> [Tue Sep 15 00:43:09 2026] wlan0: Limiting TX power to 27 (30 - 3) dBm as advertised by 30:de:4b:9e:aa:d2
> [Tue Sep 15 00:43:09 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=192.168.1.37 DST=224.0.0.252 LEN=60 TOS=0x00 PREC=0x00 TTL=255 ID=94 PROTO=UDP SPT=5355 DPT=5355 LEN=40 
> [Tue Sep 15 00:43:09 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=192.168.1.37 DST=224.0.0.252 LEN=60 TOS=0x00 PREC=0x00 TTL=255 ID=145 PROTO=UDP SPT=5355 DPT=5355 LEN=40 
> [Tue Sep 15 00:43:09 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=192.168.1.37 DST=224.0.0.252 LEN=60 TOS=0x00 PREC=0x00 TTL=255 ID=364 PROTO=UDP SPT=5355 DPT=5355 LEN=40 
> [Tue Sep 15 00:43:10 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=fe80:0000:0000:0000:6614:9233:071f:5ae4 DST=ff02:0000:0000:0000:0000:0000:0001:0003 LEN=80 TC=0 HOPLIMIT=255 FLOWLBL=118920 PROTO=UDP SPT=5355 DPT=5355 LEN=40 
> [Tue Sep 15 00:43:11 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=fe80:0000:0000:0000:6614:9233:071f:5ae4 DST=ff02:0000:0000:0000:0000:0000:0001:0003 LEN=80 TC=0 HOPLIMIT=255 FLOWLBL=118920 PROTO=UDP SPT=5355 DPT=5355 LEN=40 
> [Tue Sep 15 00:43:11 2026] [UFW BLOCK] IN=wlan0 OUT= MAC= SRC=fe80:0000:0000:0000:6614:9233:071f:5ae4 DST=ff02:0000:0000:0000:0000:0000:0001:0003 LEN=80 TC=0 HOPLIMIT=255 FLOWLBL=118920 PROTO=UDP SPT=5355 DPT=5355 LEN=40 
> [Tue Sep 15 00:43:14 2026] input: ydotoold virtual device as /devices/virtual/input/input27
> [Tue Sep 15 00:43:16 2026] usb 11-1: reset high-speed USB device number 2 using xhci_hcd
> [Tue Sep 15 00:43:18 2026] Bluetooth: RFCOMM TTY layer initialized
> [Tue Sep 15 00:43:18 2026] Bluetooth: RFCOMM socket layer initialized
> [Tue Sep 15 00:43:18 2026] Bluetooth: RFCOMM ver 1.11
> 
> === lspci -vv (full) ===
> 00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Root Complex
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 
> 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge IOMMU
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 28
> 	Capabilities: [40] Secure device <?>
> 	Capabilities: [64] MSI: Enable+ Count=1/4 Maskable- 64bit+
> 		Address: 00000000fee06000  Data: 0020
> 	Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+
> 
> 00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 0
> 
> 00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge GPP Bridge (prog-if 00 [Normal decode])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: MSI(X) routed to IRQ 29
> 	IOMMU group: 1
> 	Bus: primary=00, secondary=01, subordinate=03, sec-latency=0
> 	I/O behind bridge: f000-ffff [size=4K] [16-bit]
> 	Memory behind bridge: dcb00000-dcdfffff [size=3M] [32-bit]
> 	Prefetchable memory behind bridge: f800000000-fc0fffffff [size=16640M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Express (v2) Root Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 256 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM not supported
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 75W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		RootCap: CRSVisible+
> 		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
> 		RootSta: PME ReqID 0301, PMEStatus- PMEPending-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
> 			 AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS-
> 		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: ReqEn- EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [370 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1- L1_PM_Substates+
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 		L1SubCtl2:
> 	Capabilities: [3c4 v1] Designated Vendor-Specific: Vendor=1022 ID=0001 Rev=1 Len=44 <?>
> 	Capabilities: [400 v1] Data Link Feature <?>
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [440 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady+ MargSoftReady-
> 	Capabilities: [500 v1] Physical Layer 32.0 GT/s
> 		Phy32Cap: EqualizationBypass+ NoEqualizationNeeded-
> 			  ModTsMode0+ ModTsMode1- ModTsMode2-
> 		Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis-
> 			  Modified TS Usage Mode: PCI Express
> 		Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 			  Received Enhanced Link Behavior Control: Full Equalization required
> 			  ModTsRecv- TxPrecodeOn- TxPrecodeReq- NoEqualizationNeededRecv-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 00:01.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge GPP Bridge (prog-if 00 [Normal decode])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: MSI(X) routed to IRQ 30
> 	IOMMU group: 2
> 	Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: dcf00000-dcffffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Express (v2) Root Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 512 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 32GT/s, Width x4, ASPM not supported
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 75W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		RootCap: CRSVisible+
> 		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
> 		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
> 			 AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS-
> 		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: ReqEn- EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-32GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [370 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1- L1_PM_Substates+
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 		L1SubCtl2:
> 	Capabilities: [3c4 v1] Designated Vendor-Specific: Vendor=1022 ID=0001 Rev=1 Len=44 <?>
> 	Capabilities: [400 v1] Data Link Feature <?>
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [440 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady+ MargSoftReady-
> 	Capabilities: [500 v1] Physical Layer 32.0 GT/s
> 		Phy32Cap: EqualizationBypass+ NoEqualizationNeeded-
> 			  ModTsMode0+ ModTsMode1- ModTsMode2-
> 		Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis-
> 			  Modified TS Usage Mode: PCI Express
> 		Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 			  Received Enhanced Link Behavior Control: Full Equalization required
> 			  ModTsRecv- TxPrecodeOn- TxPrecodeReq- NoEqualizationNeededRecv-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 3
> 
> 00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge GPP Bridge (prog-if 00 [Normal decode])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: MSI(X) routed to IRQ 31
> 	IOMMU group: 4
> 	Bus: primary=00, secondary=05, subordinate=6e, sec-latency=0
> 	I/O behind bridge: c000-dfff [size=8K] [16-bit]
> 	Memory behind bridge: a8000000-dc5fffff [size=838M] [32-bit]
> 	Prefetchable memory behind bridge: fc20000000-fc751fffff [size=1362M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Express (v2) Root Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #1, Speed 32GT/s, Width x4, ASPM not supported
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
> 			Slot #0, PowerLimit 75W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq+ LinkChg+
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		RootCap: CRSVisible+
> 		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
> 		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd+
> 			 AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS-
> 		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: ReqEn- EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-32GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [370 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1- L1_PM_Substates+
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 		L1SubCtl2:
> 	Capabilities: [3c4 v1] Designated Vendor-Specific: Vendor=1022 ID=0001 Rev=1 Len=44 <?>
> 	Capabilities: [400 v1] Data Link Feature <?>
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [440 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady+ MargSoftReady-
> 	Capabilities: [500 v1] Physical Layer 32.0 GT/s
> 		Phy32Cap: EqualizationBypass+ NoEqualizationNeeded-
> 			  ModTsMode0+ ModTsMode1- ModTsMode2-
> 		Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis-
> 			  Modified TS Usage Mode: PCI Express
> 		Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 			  Received Enhanced Link Behavior Control: Full Equalization required
> 			  ModTsRecv- TxPrecodeOn- TxPrecodeReq- NoEqualizationNeededRecv-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 5
> 
> 00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 6
> 
> 00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Dummy Host Bridge
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 7
> 
> 00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Internal GPP Bridge to Bus [C:A] (prog-if 00 [Normal decode])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 32
> 	IOMMU group: 8
> 	Bus: primary=00, secondary=6f, subordinate=6f, sec-latency=0
> 	I/O behind bridge: e000-efff [size=4K] [16-bit]
> 	Memory behind bridge: dc700000-dcafffff [size=4M] [32-bit]
> 	Prefetchable memory behind bridge: fc80000000-fc901fffff [size=258M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Express (v2) Root Port (Slot-), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		RootCap: CRSVisible+
> 		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
> 		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd-
> 			 AtomicOpsCap: Routing+ 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: ReqEn- EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [400 v1] Data Link Feature <?>
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [450 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 00:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Internal GPP Bridge to Bus [C:A] (prog-if 00 [Normal decode])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 33
> 	IOMMU group: 9
> 	Bus: primary=00, secondary=70, subordinate=70, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: dce00000-dcefffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Express (v2) Root Port (Slot-), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		RootCap: CRSVisible+
> 		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
> 		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd-
> 			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: ReqEn- EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [c0] Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [400 v1] Data Link Feature <?>
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [450 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 71)
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 10
> 	Kernel driver in use: piix4_smbus
> 	Kernel modules: i2c_piix4, sp5100_tco
> 
> 00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev 51)
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	IOMMU group: 10
> 
> 00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 0
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 
> 00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 1
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 
> 00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 2
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 
> 00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 3
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 	Kernel driver in use: k10temp
> 	Kernel modules: k10temp
> 
> 00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 4
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 
> 00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 5
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 
> 00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 6
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 
> 00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge Data Fabric; Function 7
> 	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	IOMMU group: 11
> 
> 01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch (rev c1) (prog-if 00 [Normal decode])
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B routed to IRQ 34
> 	IOMMU group: 12
> 	Region 0: Memory at dcd00000 (32-bit, non-prefetchable) [size=16K]
> 	Bus: primary=01, secondary=02, subordinate=03, sec-latency=0
> 	I/O behind bridge: f000-ffff [size=4K] [16-bit]
> 	Memory behind bridge: dcb00000-dccfffff [size=2M] [32-bit]
> 	Prefetchable memory behind bridge: f800000000-fc0fffffff [size=16640M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Express (v2) Upstream Port, IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 75W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 256 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L1, Exit Latency L1 <64us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: Routing+ 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [150 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 14, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 05080001 0000030f 02080000 00000000
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [320 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Capabilities: [400 v1] Data Link Feature <?>
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [440 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady+ MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch (prog-if 00 [Normal decode])
> 	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 35
> 	IOMMU group: 13
> 	Bus: primary=02, secondary=03, subordinate=03, sec-latency=0
> 	I/O behind bridge: f000-ffff [size=4K] [16-bit]
> 	Memory behind bridge: dcb00000-dccfffff [size=2M] [32-bit]
> 	Prefetchable memory behind bridge: f800000000-fc0fffffff [size=16640M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Express (v2) Downstream Port (Slot-), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 256 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing+
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -3.5dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [c0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [150 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [400 v1] Data Link Feature <?>
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [440 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady+ MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 22 [Radeon RX 6700/6700 XT/6750 XT / 6800M/6850M XT] (rev c1) (prog-if 00 [VGA controller])
> 	Subsystem: Sapphire Technology Limited Sapphire Radeon RX 6700
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 101
> 	IOMMU group: 14
> 	Region 0: Memory at f800000000 (64-bit, prefetchable) [size=16G]
> 	Region 2: Memory at fc00000000 (64-bit, prefetchable) [size=256M]
> 	Region 4: I/O ports at f000 [size=256]
> 	Region 5: Memory at dcb00000 (32-bit, non-prefetchable) [size=1M]
> 	Expansion ROM at dcc00000 [disabled] [size=128K]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 256 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn+
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [150 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 14, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 04080001 0000020f 03020000 00000000
> 	Capabilities: [200 v1] Physical Resizable BAR
> 		BAR 0: current size: 16GB, supported: 256MB 512MB 1GB 2GB 4GB 8GB 16GB
> 		BAR 2: current size: 256MB, supported: 2MB 4MB 8MB 16MB 32MB 64MB 128MB 256MB
> 	Capabilities: [240 v1] Power Budgeting <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Capabilities: [2d0 v1] Process Address Space ID (PASID)
> 		PASIDCap: Exec+ Priv+, Max PASID Width: 10
> 		PASIDCtl: Enable+ Exec- Priv-
> 	Capabilities: [320 v1] Latency Tolerance Reporting
> 		Max snoop latency: 1048576ns
> 		Max no snoop latency: 1048576ns
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [440 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady+ MargSoftReady-
> 	Kernel driver in use: amdgpu
> 	Kernel modules: amdgpu
> 
> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller (prog-if 00 [HDA compatible])
> 	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin C disabled, MSI(X) routed to IRQ 146
> 	IOMMU group: 15
> 	Region 0: Memory at dcc20000 (32-bit, non-prefetchable) [size=16K]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 256 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq+ OBFF Disabled, EETLPPrefixBlk-
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [150 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 14, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 04080001 0000020f 03020000 00000000
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
> 
> 04:00.0 Non-Volatile memory controller: Sandisk Corp WD SN560/SN740/SN770/SN5000 NVMe SSD (rev 01) (prog-if 02 [NVM Express])
> 	Subsystem: Sandisk Corp WD SN560/SN740/SN770/SN5000 NVMe SSD
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 100, 102-117
> 	IOMMU group: 16
> 	Region 0: Memory at dcf00000 (64-bit, non-prefetchable) [size=16K]
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [90] MSI: Enable- Count=1/32 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [b0] MSI-X: Enable+ Count=65 Masked-
> 		Vector table: BAR=0 offset=00003000
> 		PBA: BAR=0 offset=00002000
> 	Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <1us, L1 unlimited
> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
> 			MaxPayload 512 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <8us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [100 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [1b8 v1] Latency Tolerance Reporting
> 		Max snoop latency: 1048576ns
> 		Max no snoop latency: 1048576ns
> 	Capabilities: [300 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [900 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1- L1_PM_Substates+
> 			  PortCommonModeRestoreTime=32us PortTPowerOnTime=10us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=0us LTR1.2_Threshold=32768ns
> 		L1SubCtl2: T_PwrOn=10us
> 	Capabilities: [910 v1] Data Link Feature <?>
> 	Capabilities: [920 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver+
> 		PortSta: MargReady+ MargSoftReady+
> 	Capabilities: [9c0 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Kernel driver in use: nvme
> 	Kernel modules: nvme
> 
> 05:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Upstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Physical Slot: 0
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B routed to IRQ 24
> 	IOMMU group: 17
> 	Bus: primary=05, secondary=06, subordinate=6e, sec-latency=0
> 	I/O behind bridge: c000-dfff [size=8K] [16-bit]
> 	Memory behind bridge: a8000000-dc5fffff [size=838M] [32-bit]
> 	Prefetchable memory behind bridge: fc20000000-fc751fffff [size=1362M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Upstream Port, IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 75W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <32us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 14, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 05000001 0000200f 06080000 00000000
> 	Capabilities: [160 v1] Latency Tolerance Reporting
> 		Max snoop latency: 1048576ns
> 		Max no snoop latency: 1048576ns
> 	Capabilities: [1c0 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [200 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=128us PortTPowerOnTime=10us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=0us LTR1.2_Threshold=32768ns
> 		L1SubCtl2: T_PwrOn=10us
> 	Capabilities: [220 v1] Data Link Feature <?>
> 	Capabilities: [240 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [280 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady+ MargSoftReady+
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 06:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 36
> 	IOMMU group: 18
> 	Bus: primary=06, secondary=07, subordinate=68, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: a8000000-dc0fffff [size=833M] [32-bit]
> 	Prefetchable memory behind bridge: fc20000000-fc751fffff [size=1362M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <32us
> 			ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 8GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 26W; Interlock- NoCompl-
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 05000001 0000210f 07080000 00000000
> 	Capabilities: [1c0 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: LaneErr at lane: 0 1 2 3
> 	Capabilities: [200 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=128us PortTPowerOnTime=150us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=128us LTR1.2_Threshold=284672ns
> 		L1SubCtl2: T_PwrOn=150us
> 	Capabilities: [220 v1] Data Link Feature <?>
> 	Capabilities: [240 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 	Capabilities: [280 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 06:08.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 37
> 	IOMMU group: 19
> 	Bus: primary=06, secondary=69, subordinate=69, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: [disabled] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x1, ASPM L1, Exit Latency L1 <32us
> 			ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 26W; Interlock- NoCompl-
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 14, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 04000001 0000230f 69000000 00000000
> 	Capabilities: [1c0 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [200 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=128us PortTPowerOnTime=150us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=128us LTR1.2_Threshold=32768ns
> 		L1SubCtl2: T_PwrOn=10us
> 	Capabilities: [220 v1] Data Link Feature <?>
> 	Capabilities: [240 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 	Capabilities: [280 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 06:09.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 38
> 	IOMMU group: 20
> 	Bus: primary=06, secondary=6a, subordinate=6a, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: [disabled] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
> 		LnkCap:	Port #1, Speed 16GT/s, Width x1, ASPM L1, Exit Latency L1 <32us
> 			ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 26W; Interlock- NoCompl-
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq+ ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 14, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 04000001 0000210f 6a000000 00000000
> 	Capabilities: [1c0 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [200 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=128us PortTPowerOnTime=150us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=128us LTR1.2_Threshold=32768ns
> 		L1SubCtl2: T_PwrOn=10us
> 	Capabilities: [220 v1] Data Link Feature <?>
> 	Capabilities: [240 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 	Capabilities: [280 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 06:0a.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 39
> 	IOMMU group: 21
> 	Bus: primary=06, secondary=6b, subordinate=6b, sec-latency=0
> 	I/O behind bridge: d000-dfff [size=4K] [16-bit]
> 	Memory behind bridge: dc500000-dc5fffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #2, Speed 16GT/s, Width x1, ASPM L1, Exit Latency L1 <32us
> 			ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 26W; Interlock- NoCompl-
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [1c0 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [200 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=128us PortTPowerOnTime=150us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=150us LTR1.2_Threshold=306176ns
> 		L1SubCtl2: T_PwrOn=150us
> 	Capabilities: [220 v1] Data Link Feature <?>
> 	Capabilities: [240 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 	Capabilities: [280 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 06:0b.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 41
> 	IOMMU group: 22
> 	Bus: primary=06, secondary=6c, subordinate=6c, sec-latency=0
> 	I/O behind bridge: c000-cfff [size=4K] [16-bit]
> 	Memory behind bridge: dc400000-dc4fffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #3, Speed 16GT/s, Width x1, ASPM L1, Exit Latency L1 <32us
> 			ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 26W; Interlock- NoCompl-
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [1c0 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [200 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=128us PortTPowerOnTime=150us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=128us LTR1.2_Threshold=284672ns
> 		L1SubCtl2: T_PwrOn=150us
> 	Capabilities: [220 v1] Data Link Feature <?>
> 	Capabilities: [240 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> 	Capabilities: [280 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 06:0c.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B routed to IRQ 24
> 	IOMMU group: 23
> 	Bus: primary=06, secondary=6d, subordinate=6d, sec-latency=0
> 	I/O behind bridge: [disabled] [16-bit]
> 	Memory behind bridge: dc300000-dc3fffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Downstream Port (Slot-), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #12, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 06:0d.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset PCIe Switch Downstream Port (rev 01) (prog-if 00 [Normal decode])
> 	Subsystem: ASMedia Technology Inc. Device 3328
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B routed to IRQ 25
> 	IOMMU group: 24
> 	Bus: primary=06, secondary=6e, subordinate=6e, sec-latency=0
> 	I/O behind bridge: [disabled] [16-bit]
> 	Memory behind bridge: dc200000-dc2fffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Downstream Port (Slot-), IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #13, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 3328
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 07:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
> 	Subsystem: Device 87f6:1043
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 128 bytes
> 	Interrupts: pin B routed to IRQ 24
> 	IOMMU group: 18
> 	Bus: primary=07, secondary=08, subordinate=68, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: a8000000-dc0fffff [size=833M] [32-bit]
> 	Prefetchable memory behind bridge: fc20000000-fc751fffff [size=1362M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [ac] Subsystem: Device 87f6:1043
> 	Capabilities: [c0] Express (v2) Upstream Port, IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 26W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <2us, L1 <4us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 8GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=064 <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [800 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Capabilities: [a00 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=0us PortTPowerOnTime=10us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=0us LTR1.2_Threshold=284672ns
> 		L1SubCtl2: T_PwrOn=150us
> 	Capabilities: [b00 v2] Precision Time Measurement
> 		PTMCap: Requester+ Responder+ Root-
> 		PTMClockGranularity: Unimplemented
> 		PTMControl: Enabled- RootSelected-
> 		PTMEffectiveGranularity: Unknown
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 08:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
> 	Subsystem: Device 87f6:1043
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 128 bytes
> 	Interrupts: pin B routed to IRQ 24
> 	IOMMU group: 18
> 	Bus: primary=08, secondary=09, subordinate=09, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: dc000000-dc0fffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: fc75100000-fc751fffff [size=1M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [ac] Subsystem: Device 87f6:1043
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <2us, L1 <4us
> 			ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=1 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed+ WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending- InProgress-
> 		VC1:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable- ID=1 ArbSelect=Fixed TC/VC=00
> 			Status:	NegoPending+ InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=064 <?>
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 08:01.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
> 	Subsystem: Device 87f6:1043
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 128 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 42
> 	IOMMU group: 18
> 	Bus: primary=08, secondary=0a, subordinate=38, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: c0000000-d6efffff [size=367M] [32-bit]
> 	Prefetchable memory behind bridge: fc50000000-fc74ffffff [size=592M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [ac] Subsystem: Device 87f6:1043
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #1, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <4us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
> 			Slot #1, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq+ LinkChg+
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=064 <?>
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 08:02.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
> 	Subsystem: Device 87f6:1043
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 128 bytes
> 	Interrupts: pin B routed to IRQ 26
> 	IOMMU group: 18
> 	Bus: primary=08, secondary=39, subordinate=39, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: d8000000-d80fffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [ac] Subsystem: Device 87f6:1043
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #2, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <2us, L1 <4us
> 			ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed unknown, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 08:03.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
> 	Subsystem: Device 87f6:1043
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 128 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 43
> 	IOMMU group: 18
> 	Bus: primary=08, secondary=3a, subordinate=68, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: a8000000-beffffff [size=368M] [32-bit]
> 	Prefetchable memory behind bridge: fc20000000-fc44ffffff [size=592M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [ac] Subsystem: Device 87f6:1043
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #3, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <4us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
> 			Slot #3, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending+ InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=064 <?>
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 09:00.0 USB controller: Intel Corporation Thunderbolt 4 NHI [Maple Ridge 4C 2020] (prog-if 40 [USB4 Host Interface])
> 	Subsystem: Device 87f6:1043
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 119-134
> 	IOMMU group: 18
> 	Region 0: Memory at fc75100000 (64-bit, prefetchable) [size=256K]
> 	Region 2: Memory at fc75140000 (64-bit, prefetchable) [size=4K]
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI-X: Enable+ Count=16 Masked-
> 		Vector table: BAR=2 offset=00000000
> 		PBA: BAR=2 offset=00000fa0
> 	Capabilities: [100 v1] Device Serial Number fb-d3-59-21-4a-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Kernel driver in use: thunderbolt
> 	Kernel modules: thunderbolt
> 
> 0a:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 2020] (rev 03) (prog-if 00 [Normal decode])
> 	Subsystem: Intel Corporation Device 0000
> 	Physical Slot: 1
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B routed to IRQ 25
> 	IOMMU group: 18
> 	Bus: primary=0a, secondary=0b, subordinate=10, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: c0000000-c02fffff [size=3M] [32-bit]
> 	Prefetchable memory behind bridge: fc50000000-fc505fffff [size=6M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
> 	Capabilities: [c0] Express (v2) Upstream Port, IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [800 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Capabilities: [a00 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1- L1_PM_Substates+
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 		L1SubCtl2:
> 	Capabilities: [b00 v1] Precision Time Measurement
> 		PTMCap: Requester+ Responder+ Root-
> 		PTMClockGranularity: Unimplemented
> 		PTMControl: Enabled- RootSelected-
> 		PTMEffectiveGranularity: Unknown
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 0b:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 2020] (rev 03) (prog-if 00 [Normal decode])
> 	Subsystem: Intel Corporation Device 0000
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B routed to IRQ 25
> 	IOMMU group: 18
> 	Bus: primary=0b, secondary=0c, subordinate=0c, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: c0200000-c02fffff [size=1M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 34000000 00000010 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 0b:01.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 2020] (rev 03) (prog-if 00 [Normal decode])
> 	Subsystem: Intel Corporation Device 0000
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 44
> 	IOMMU group: 18
> 	Bus: primary=0b, secondary=0d, subordinate=0d, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: [disabled] [32-bit]
> 	Prefetchable memory behind bridge: fc50000000-fc501fffff [size=2M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #1, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
> 			Slot #1, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending+ InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 0b:02.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 2020] (rev 03) (prog-if 00 [Normal decode])
> 	Subsystem: Intel Corporation Device 0000
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 45
> 	IOMMU group: 18
> 	Bus: primary=0b, secondary=0e, subordinate=0e, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: [disabled] [32-bit]
> 	Prefetchable memory behind bridge: fc50200000-fc503fffff [size=2M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #2, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
> 			Slot #2, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending+ InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 0b:03.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 2020] (rev 03) (prog-if 00 [Normal decode])
> 	Subsystem: Intel Corporation Device 0000
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 46
> 	IOMMU group: 18
> 	Bus: primary=0b, secondary=0f, subordinate=0f, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: [disabled] [32-bit]
> 	Prefetchable memory behind bridge: fc50400000-fc505fffff [size=2M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #3, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk-
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
> 			Slot #3, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending+ InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 0b:04.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge 2020] (rev 03) (prog-if 00 [Normal decode])
> 	Subsystem: Intel Corporation Device 0000
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 47
> 	IOMMU group: 18
> 	Bus: primary=0b, secondary=10, subordinate=10, sec-latency=0
> 	I/O behind bridge: [disabled] [32-bit]
> 	Memory behind bridge: c0000000-c01fffff [size=2M] [32-bit]
> 	Prefetchable memory behind bridge: [disabled] [64-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
> 	Capabilities: [c0] Express (v2) Downstream Port (Slot+), IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ RBE+ TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #4, Speed 8GT/s, Width x1, ASPM L1, Exit Latency L1 <4us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> 		LnkSta:	Speed 5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #0, PowerLimit 0W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- ARIFwd-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> 			 AtomicOpsCtl: EgressBlck-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -3.5dB
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [900 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl+ DirectTrans+
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
> 	Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 ID=0006 Rev=0 Len=16 <?>
> 	Kernel driver in use: pcieport
> 	Kernel modules: shpchp
> 
> 0c:00.0 USB controller: Intel Corporation Thunderbolt 4 USB Controller [Goshen Ridge 2020] (rev 03) (prog-if 30 [XHCI])
> 	Subsystem: Intel Corporation Device 0000
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 49-56
> 	IOMMU group: 18
> 	Region 0: Memory at c0200000 (32-bit, non-prefetchable) [size=64K]
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable+ Count=8/8 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [100 v1] Device Serial Number fd-6b-bc-b0-27-e9-07-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO+ CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 0e, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00001001 0000240f c0200490 e1060200
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [800 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Kernel driver in use: xhci_hcd
> 	Kernel modules: xhci_pci
> 
> 10:00.0 Ethernet controller: Intel Corporation Ethernet Controller (2) I225-LMvP (rev 03)
> 	Subsystem: CalDigit, Inc. TS4 On-Board 2.5GbE Ethernet Adaptor
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 139-143
> 	IOMMU group: 18
> 	Region 0: Memory at c0000000 (32-bit, non-prefetchable) [size=1M]
> 	Region 3: Memory at c0100000 (32-bit, non-prefetchable) [size=16K]
> 	Capabilities: [40] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
> 		Address: 0000000000000000  Data: 0000
> 		Masking: 00000000  Pending: 00000000
> 	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
> 		Vector table: BAR=3 offset=00000000
> 		PBA: BAR=3 offset=00002000
> 	Capabilities: [a0] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit Latency L1 <4us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [100 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [140 v1] Device Serial Number 64-4b-f0-ff-ff-38-ff-0e
> 	Capabilities: [1c0 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Capabilities: [1f0 v1] Precision Time Measurement
> 		PTMCap: Requester+ Responder- Root-
> 		PTMClockGranularity: 4ns
> 		PTMControl: Enabled+ RootSelected-
> 		PTMEffectiveGranularity: Unknown
> 	Capabilities: [1e0 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+ L1_PM_Substates+
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 		L1SubCtl2:
> 	Kernel driver in use: igc
> 	Kernel modules: igc
> 
> 39:00.0 USB controller: Intel Corporation Thunderbolt 4 USB Controller [Maple Ridge 4C 2020] (prog-if 30 [XHCI])
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: MSI(X) routed to IRQ 57-64
> 	IOMMU group: 18
> 	Region 0: Memory at d8000000 (64-bit, non-prefetchable) [size=64K]
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0-,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] MSI: Enable+ Count=8/8 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [90] Vendor Specific Information: Intel <unknown>
> 	Capabilities: [b0] Vendor Specific Information: Intel Capabilities v1
> 	Capabilities: [bc] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <2us, L1 <8us
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [100 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Kernel driver in use: xhci_hcd
> 	Kernel modules: xhci_pci
> 
> 6b:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8125 2.5GbE Controller (rev 05)
> 	DeviceName: Realtek RTL8125BG LAN
> 	Subsystem: ASUSTeK Computer Inc. Device 87d7
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 138
> 	IOMMU group: 21
> 	Region 0: I/O ports at d000 [size=256]
> 	Region 2: Memory at dc500000 (64-bit, non-prefetchable) [size=64K]
> 	Region 4: Memory at dc510000 (64-bit, non-prefetchable) [size=16K]
> 	Capabilities: [40] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
> 		Address: 0000000000000000  Data: 0000
> 		Masking: 00000000  Pending: 00000000
> 	Capabilities: [70] Express (v2) Endpoint, IntMsgNum 1
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 26W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 128 bytes, MaxReadReq 4096 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s unlimited, L1 <64us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp+ ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [b0] MSI-X: Enable+ Count=32 Masked-
> 		Vector table: BAR=4 offset=00000000
> 		PBA: BAR=4 offset=00000800
> 	Capabilities: [d0] Vital Product Data
> 		Not readable
> 	Capabilities: [100 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [148 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [168 v1] Device Serial Number 01-00-00-00-68-4c-e0-00
> 	Capabilities: [178 v1] Transaction Processing Hints
> 		No steering table available
> 	Capabilities: [204 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Capabilities: [20c v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=150us PortTPowerOnTime=150us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=0us LTR1.2_Threshold=306176ns
> 		L1SubCtl2: T_PwrOn=150us
> 	Capabilities: [21c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
> 	Kernel driver in use: r8169
> 	Kernel modules: r8169
> 
> 6c:00.0 Network controller: Realtek Semiconductor Co., Ltd. RTL8852BE PCIe 802.11ax Wireless Network Controller
> 	Subsystem: AzureWave Device 5471
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 149
> 	IOMMU group: 22
> 	Region 0: I/O ports at c000 [size=256]
> 	Region 2: Memory at dc400000 (64-bit, non-prefetchable) [size=1M]
> 	Capabilities: [40] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 <64us
> 			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 26W TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 <64us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Via message/WAKE#, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis+
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [100 v2] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [148 v1] Device Serial Number 00-e0-4c-ff-fe-88-52-01
> 	Capabilities: [158 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Capabilities: [160 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=30us PortTPowerOnTime=60us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=0us LTR1.2_Threshold=284672ns
> 		L1SubCtl2: T_PwrOn=150us
> 	Kernel driver in use: rtw89_8852be
> 	Kernel modules: rtw89_8852be
> 
> 6d:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset USB 3.2 Controller (rev 01) (prog-if 30 [XHCI])
> 	Subsystem: ASMedia Technology Inc. Device 1142
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 65-72
> 	IOMMU group: 23
> 	Region 0: Memory at dc300000 (64-bit, non-prefetchable) [size=32K]
> 	Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
> 		Vector table: BAR=0 offset=00002000
> 		PBA: BAR=0 offset=00002080
> 	Capabilities: [78] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=55mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME+
> 	Capabilities: [80] Express (v2) Legacy Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <64ns, L1 <64us
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 <64us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [160 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Kernel driver in use: xhci_hcd
> 	Kernel modules: xhci_pci
> 
> 6e:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset SATA Controller (rev 01) (prog-if 01 [AHCI 1.0])
> 	Subsystem: ASMedia Technology Inc. Device 1062
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 48
> 	IOMMU group: 24
> 	Region 5: Memory at dc280000 (32-bit, non-prefetchable) [size=1K]
> 	Expansion ROM at dc200000 [disabled] [size=512K]
> 	Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [70] Power Management version 3
> 		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=55mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [80] Express (v2) Legacy Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <64ns, L1 <64us
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE-IO-
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 <64us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 2.5GT/s, Width x1
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> 			ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> 			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr+ HeaderOF+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Kernel driver in use: ahci
> 	Kernel modules: ahci
> 
> 6f:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Raphael (rev cb) (prog-if 00 [VGA controller])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort+ <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 118
> 	IOMMU group: 25
> 	Region 0: Memory at fc80000000 (64-bit, prefetchable) [size=256M]
> 	Region 2: Memory at fc90000000 (64-bit, prefetchable) [size=2M]
> 	Region 4: I/O ports at e000 [size=256]
> 	Region 5: Memory at dca00000 (32-bit, non-prefetchable) [size=512K]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn+
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable- Count=1/4 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [c0] MSI-X: Enable+ Count=4 Masked-
> 		Vector table: BAR=5 offset=00042000
> 		PBA: BAR=5 offset=00043000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Capabilities: [2b0 v1] Address Translation Service (ATS)
> 		ATSCap:	Invalidate Queue Depth: 00
> 		ATSCtl:	Enable+, Smallest Translation Unit: 00
> 	Capabilities: [2c0 v1] Page Request Interface (PRI)
> 		PRICtl: Enable+ Reset-
> 		PRISta: RF- UPRGI- Stopped+ PASID-
> 		Page Request Capacity: 00000100, Page Request Allocation: 00000020
> 	Capabilities: [2d0 v1] Process Address Space ID (PASID)
> 		PASIDCap: Exec+ Priv+, Max PASID Width: 10
> 		PASIDCtl: Enable+ Exec- Priv-
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [450 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: amdgpu
> 	Kernel modules: amdgpu
> 
> 6f:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Radeon High Definition Audio Controller (prog-if 00 [HDA compatible])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin C disabled, MSI(X) routed to IRQ 147
> 	IOMMU group: 26
> 	Region 0: Memory at dca88000 (32-bit, non-prefetchable) [size=16K]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Legacy Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn+
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
> 
> 6f:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 19h PSP/CCP
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin D disabled, MSI(X) routed to IRQ 136-137
> 	IOMMU group: 27
> 	Region 2: Memory at dc900000 (32-bit, non-prefetchable) [size=1M]
> 	Region 5: Memory at dca8c000 (32-bit, non-prefetchable) [size=8K]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable- Count=1/2 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [c0] MSI-X: Enable+ Count=2 Masked-
> 		Vector table: BAR=5 offset=00000000
> 		PBA: BAR=5 offset=00001000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Kernel driver in use: ccp
> 	Kernel modules: ccp
> 
> 6f:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin E disabled, MSI(X) routed to IRQ 74-81
> 	IOMMU group: 28
> 	Region 0: Memory at dc800000 (64-bit, non-prefetchable) [size=1M]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
> 		Vector table: BAR=0 offset=000fe000
> 		PBA: BAR=0 offset=000ff000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Kernel driver in use: xhci_hcd
> 	Kernel modules: xhci_pci
> 
> 6f:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 83-90
> 	IOMMU group: 29
> 	Region 0: Memory at dc700000 (64-bit, non-prefetchable) [size=1M]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
> 		Vector table: BAR=0 offset=000fe000
> 		PBA: BAR=0 offset=000ff000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Kernel driver in use: xhci_hcd
> 	Kernel modules: xhci_pci
> 
> 6f:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Ryzen HD Audio Controller (prog-if 00 [HDA compatible])
> 	DeviceName: Realtek ALC1200 Audio
> 	Subsystem: ASUSTeK Computer Inc. Device 88b9
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupts: pin D disabled, MSI(X) routed to IRQ 148
> 	IOMMU group: 30
> 	Region 0: Memory at dca80000 (32-bit, non-prefetchable) [size=32K]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
> 			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 		Address: 00000000fee00000  Data: 0000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
> 
> 70:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 2.0 xHCI (prog-if 30 [XHCI])
> 	Subsystem: ASUSTeK Computer Inc. Device 8877
> 	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Interrupts: pin B disabled, MSI(X) routed to IRQ 91-98
> 	IOMMU group: 31
> 	Region 0: Memory at dce00000 (64-bit, non-prefetchable) [size=1M]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
> 	Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> 		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
> 			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> 		LnkSta:	Speed 16GT/s, Width x16
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
> 			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- TPHComp- ExtTPHComp-
> 			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> 			 AtomicOpsCtl: ReqEn-
> 			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
> 			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> 		LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
> 		LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> 	Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
> 		Vector table: BAR=0 offset=000fe000
> 		PBA: BAR=0 offset=000ff000
> 	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [270 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [2a0 v1] Access Control Services
> 		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> 	Capabilities: [410 v1] Physical Layer 16.0 GT/s
> 		Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ LinkEquRequest-
> 	Capabilities: [450 v1] Lane Margining at the Receiver
> 		PortCap: Uses Driver-
> 		PortSta: MargReady- MargSoftReady-
> 	Kernel driver in use: xhci_hcd
> 	Kernel modules: xhci_pci
> 

