Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07631AABF
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096545; cv=pass; b=fG5aZcGhHosVmzCQvIg7ysfYYhhztqps1A5UmOmvrMGrGBqWuGfYU4u9HAn3/i3sSSWjJX+n3E7fOOrp9nJpv440iPtdnhjY/xYqHsK3kNbtEkT4Oiaom7FAintTqB89orZFR8f4/TdziCogew8ZItIHA87bN9sIfJz+ry5lLCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096545; c=relaxed/simple;
	bh=a4ikoQTvcNkBaJmJT+GdaFYhiyiIcgcfVfCZMT6sAOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srTLmYLRrohMi4rTt8/izxQaQk6CATmAdUUYiiNODJdd4o4Xn7RUEUq3xsYx0aWnBUvDKDWi52gdiicCJxy59p9Gsec77n4C2hsf1ja+IlJNqo+uqZnj93Jd+TTKBKsrs1pa/wwIdKnI1wvpSYomDaUBFnkfmaEP5/FqGj+GfG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XE7i33Vw; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE7i33Vw"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c74722e27so23909871fa.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 02:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786096538; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjKjajia9ELIv6HkIZLLquEbqzMamevZpM0eF5Co4VLZa4TvlNkFlmz/6GCn/wA8SG
         +A2kj3fq70GlpUrUdmKDXYHr88b3SGNJjwaUTnCF+5CrpudYpfN2rCTJFdsfV4HS7ijd
         TYor+y4PICqG6/ot5suMAfY5xpyEsZitfp4hJSWmd8KyzrDu/XIOY3GrnTwij0Rb91Cf
         ctGa3wwTMriB2ovlzkk85DX9GHLDghb5CPGFlyOz+/SGZTrxIqn5MxzVtt3nWnymzv5r
         OSSJXHSVFLvviJs7JnrofTe+EC2tVLSUz99HipGvMwBtl1XObDWcyoI47v+rH77JhCG8
         fDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=avcBsrf+xKgBQwY5ltZFTOHgkRqEYeE68MLwwz7hyyw=;
        fh=gHLeY+I0Lv9y9yFrK589HWH6pHzOnBge3aOI8OS9fDs=;
        b=K0nI7ixJZj0xGw7Z9c0DvMjhtQBkg5fCZUJ85viazShXfQIdWT/FUhgmm1LS5HJ4/9
         k4wSIp3GnMI8K7y5KECHVTJJkuoMvAESgGXqu5UJzBCrSb/7LIB0LhpsLo9eYBBRZ3hH
         rPUIQE66u/EbaCqA1YmkRvMCs8F+ktyqD8ugRmkjcohAYo23dXQVBEEfvavqVuyYSorf
         tg9Cd5bGYzKVSNLlyMVTmNOwPADasmHh/L3DomESkGGP5dh/yGThvx8xHvLUWTGP96YM
         VEFpRMlOWEGLyYj+0Ku68kNbcF5CKKC/wuEY1KDw1VIB/nx2/oP5tACep60zcyZE/8r+
         RbqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786096538; x=1786701338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=avcBsrf+xKgBQwY5ltZFTOHgkRqEYeE68MLwwz7hyyw=;
        b=XE7i33VwmmDlERd1oL6Nva7nFvpOYikSpCW675Y0AMjM9PBUNjUq8eB0sE3yY522bc
         c+KWS8BG6+rCJZUujdBL1HOdjxmYpxbAiZHMvgKIfakCerShE4C/r+lLnRARISeTckQR
         yKpGa76mkiywmH8+5FWkUYUsVmoNe86gsLb/sNX0pyzH9KXgIGZIGlGl7Oabb+ViN0uE
         DGeiRD3QgJ5r+4D1YS+/w0KwKBeVSDU9PED0YKPbvEY9pt73s4If+XVhRLQHnQcnJfhC
         LIcnaHsAL40Va6WWwxhqlQX4PR3wDeE6Nd4Yo28LPYDcWgnmua4WwqX29t+Mm6f/6iqp
         Lpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096538; x=1786701338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avcBsrf+xKgBQwY5ltZFTOHgkRqEYeE68MLwwz7hyyw=;
        b=WfidAb5reqAABN2P4lCao6Jh6Ndei/RVOVZp869K0BvyQ24k9DJ1/0DGkEhMwszkS4
         X1ilhaxE4Dh/7nCZm+P4uGsARac0G7B0CgKKeTNvIoHEbhbARqCWpVTHyf4WQcWtG6UX
         6/+MMepglixYdlG+RG2uVYxQsC1k58Ngv2JauGLElKfcInKZHSGFGR1MEaKy3VhVQu4U
         n9xeE+EH+vZyAJd7OXSH+mN0qfsQ6N3zhBPD0ESeF3rDdQlhgRo0rv6zu7zrnUsHkZBl
         vLUDIaU8mbxYPnpYjXyyuGVTIeFBlQFhkjWACf8j/AgpipbRPZjxRR+h8JXhWTjKBwVt
         mEDw==
X-Forwarded-Encrypted: i=1; AHgh+Rrap4voblA52yjqYza7V3OWSlnY+AcsncoqL8tcTnUq/1SG4Ibcs0KK1CSse+8gESze3Fxjdn8nH9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPBfJvND1C7wr3hS51862dfLdZdVtpZr6sZgX7J0ooueGAXdmt
	dag3IvC3fBYSzBjUFmzhEBzGqCs7L/XJ/xeR/4LkxwFaAcnD293L0Qx+g90+p0/QLTXaMwfdCud
	NMUFD3voKnciMb1iNcFml6QsOojFdslE=
X-Gm-Gg: AR+sD13EIaANCnHcFe2NoZjEqYAt5FiZaC/ehVu4X1nihk0tmQ7YpiBWamx0D3cG6/Q
	UAgzuZdSYtostMCAjcgy55CCPtBAwYgCKv2FBC3QErcGe3gy5VPTBTpwubFR1VnRum4zH/ugEle
	86zch9zHGr9SDuAOtAx/uAnROvZHGFHSiPg0m96jd8UO1+xXVkyzq7XijrB9hiXwQdUSGJjVMs8
	4Z8FXXHmg+rDTT9XqiaZbZAc7KcaP6ztF1nlIO5g47x1ibYssN9Lufz0iFkT3Z4qzvQtY4roIwQ
	ceaTImLfqCCThntA06pByD1OyQkfYhKqASEA7qyTVB3k
X-Received: by 2002:a05:651c:b1e:b0:396:ade7:4153 with SMTP id
 38308e7fff4ca-39fcbea912bmr18638601fa.0.1786096537148; Fri, 07 Aug 2026
 02:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>
 <20260807043719.GI235112@black.igk.intel.com>
In-Reply-To: <20260807043719.GI235112@black.igk.intel.com>
From: David GUENAULT <david.guenault@gmail.com>
Date: Fri, 7 Aug 2026 11:55:24 +0200
X-Gm-Features: AUfX_mzzOPR4nFOxVSAcRYBx1f-AG8UXDR8elhEMz0i8DLOsV2TCHsAUy_EgucY
Message-ID: <CAOFj14869aOGeoSfBVcS+-W3FUCq7CN3g+3cuGRJeZTD5Zjnng@mail.gmail.com>
Subject: Re: thunderbolt: PCIe tunnel creation fails for USB4 eGPU dock on
 Titan Ridge host
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2026 at 06:37 +0300, Mika Westerberg wrote:
> That's because Titan Ridge is using firmware based connection manager so
> it's not the TB driver that creates the tunnels.
>
> Can you drop all the non-distro kernel command line options, except
> "thunderbolt.dyndbg=3D+p" and provide full dmesg?

Thanks -- you are right, and my original analysis was wrong on that point.
I had been enabling dyndbg after boot, so I never saw the init messages and
wrongly concluded from the port dumps that the software CM was in use.

Rebooted with a clean command line as requested. Kernel is vanilla mainline
v7.1.5 (build from kernel.ubuntu.com/mainline, no distro patches):

  BOOT_IMAGE=3D/boot/vmlinuz-7.1.5-070105-generic root=3DUUID=3D... ro quie=
t splash
  thunderbolt.dyndbg=3D+p vt.handoff=3D7

Everything except thunderbolt.dyndbg=3D+p is generated by Ubuntu's GRUB.
I also disabled the udev rules I had been using (they forced
power/control=3Don on the thunderbolt and 8086:15e7/15e8/15e9 PCI devices),
so this boot is entirely stock.

The firmware CM is indeed in use:

  [    1.673598] thunderbolt 0000:03:00.0: total paths: 12
  [    1.673598] thunderbolt 0000:03:00.0: IOMMU DMA protection is enabled
  [    1.673945] thunderbolt 0000:03:00.0: control channel created
  [    1.673949] thunderbolt 0000:03:00.0: using firmware connection manage=
r
  [    1.673950] thunderbolt 0000:03:00.0: NHI initialized, starting thunde=
rbolt

The dock is found and the link comes up bonded at 40 Gb/s, then:

  [    6.012100] thunderbolt 0000:03:00.0: PCIe tunnel creation failed

If I read icm.c correctly, that message is emitted by icm_*_approve_switch(=
)
when the firmware replies with ICM_FLAGS_ERROR, so the Titan Ridge firmware
is refusing the tunnel rather than the driver failing to build it. Is that
the right reading? If so, is there anything on the host side that can be
inspected or adjusted, or is this purely an NVM/firmware limitation?

One setting that is NOT a kernel command line option and may matter:
BIOS "Thunderbolt Security Level" is set to "Unique ID" (SL1), which shows
up as security=3Duser in sysfs. This is deliberate: with "No Security"
(security=3Dnone) the device is auto-authorized, approve_switch is never
called, no tunnel is ever attempted and nothing at all is logged -- the
device just silently appears authorized but unusable. Switching to SL1 is
what makes the firmware actually be asked for the tunnel.

Relevant versions:
  Host router : Titan Ridge 2C, 8086:15e7, NVM 42.0, generation 3
                NUC10i7FNH, BIOS FNCML357.0067.2026.0429.1614
  Device      : Minisforum DEG2, USB4 Switch 8087:5786 (Rev 133, TB Ver 64)
                NVM 62.42, generation 4
                vendor=3D0x41f device=3D0xd002 "TBGAA"
  fwupdmgr reports no NVM update available for the host controller.

Behaviour is identical on 7.0.0-28-generic (Ubuntu) and on vanilla v7.1.5.

Full dmesg below.

--- 8< --- full dmesg --- 8< ---

[    0.000000] Linux version 7.1.5-070105-generic (kernel@balboa)
(x86_64-linux-gnu-gcc-15 (Ubuntu 15.2.0-12ubuntu1) 15.2.0, GNU ld (GNU
Binutils for Ubuntu) 2.46) #202607241434 SMP PREEMPT_DYNAMIC Fri Jul
24 14:57:06 UTC 2026
[    0.000000] Command line:
BOOT_IMAGE=3D/boot/vmlinuz-7.1.5-070105-generic
root=3DUUID=3Db0c932f0-3e9f-449a-97aa-be8967f0406e ro quiet splash
thunderbolt.dyndbg=3D+p vt.handoff=3D7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff]
System RAM
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff]
device reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000002cab0fff]
System RAM
[    0.000000] BIOS-e820: [mem 0x000000002cab1000-0x000000002ebb4fff]
device reserved
[    0.000000] BIOS-e820: [mem 0x000000002ebb5000-0x000000002ec37fff]  ACPI=
 data
[    0.000000] BIOS-e820: [mem 0x000000002ec38000-0x000000002ec94fff]  ACPI=
 NVS
[    0.000000] BIOS-e820: [mem 0x000000002ec95000-0x000000002ec95fff]
device reserved
[    0.000000] BIOS-e820: [mem 0x000000002ec96000-0x000000002f110fff]  ACPI=
 NVS
[    0.000000] BIOS-e820: [mem 0x000000002f111000-0x000000002fc4dfff]
device reserved
[    0.000000] BIOS-e820: [mem 0x000000002fc4e000-0x000000002fc4efff]
System RAM
[    0.000000] BIOS-e820: [mem 0x000000002fc4f000-0x000000003cffffff]
device reserved
[    0.000000] BIOS-e820: [gap 0x000000003d000000-0x00000000dfffffff]
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff]
device reserved
[    0.000000] BIOS-e820: [gap 0x00000000f0000000-0x00000000fdffffff]
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff]
device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fe011000-0x00000000febfffff]
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff]
device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fec01000-0x00000000fecfffff]
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed03fff]
device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fed04000-0x00000000fedfffff]
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff]
device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fee01000-0x00000000feffffff]
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff]
device reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000010c0ffffff]
System RAM
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.7 by American Megatrends
[    0.000000] efi: ACPI=3D0x2f077000 ACPI 2.0=3D0x2f077014
TPMFinalLog=3D0x2f07f000 SMBIOS=3D0x2f9ef000 SMBIOS 3.0=3D0x2f9ee000
MEMATTR=3D0x266ad018 ESRT=3D0x284d0818 MOKvar=3D0x2fa39000 INITRD=3D0x25ac1=
698
RNG=3D0x2ebce018 TPMEventLog=3D0x2ebc1018
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem292: MMIO range=3D[0xe0000000-0xefffffff]
(256MB) from e820 map
[    0.000000] e820: remove [mem 0xe0000000-0xefffffff] device reserved
[    0.000000] efi: Not removing mem293: MMIO
range=3D[0xfe000000-0xfe010fff] (68KB) from e820 map
[    0.000000] efi: Not removing mem294: MMIO
range=3D[0xfec00000-0xfec00fff] (4KB) from e820 map
[    0.000000] efi: Not removing mem295: MMIO
range=3D[0xfed00000-0xfed03fff] (16KB) from e820 map
[    0.000000] efi: Not removing mem296: MMIO
range=3D[0xfee00000-0xfee00fff] (4KB) from e820 map
[    0.000000] efi: Remove mem297: MMIO range=3D[0xff000000-0xffffffff]
(16MB) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] device reserved
[    0.000000] DMI: SMBIOS 3.3.0 present.
[    0.000000] DMI: Intel(R) Client Systems NUC10i7FNH/NUC10i7FNB,
BIOS FNCML357.0067.2026.0429.1614 04/29/2026
[    0.000000] DMI: Memory slots populated: 2/2
[    0.000000] tsc: Detected 1600.000 MHz processor
[    0.000000] tsc: Detected 1599.960 MHz TSC
[    0.000385] e820: update [mem 0x00000000-0x00000fff] System RAM =3D=3D>
device reserved
[    0.000390] e820: remove [mem 0x000a0000-0x000fffff] System RAM
[    0.000408] last_pfn =3D 0x10c1000 max_arch_pfn =3D 0x400000000
[    0.000416] MTRR map: 5 entries (3 fixed + 2 variable; max 23),
built from 10 variable MTRRs
[    0.000421] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[    0.001219] last_pfn =3D 0x2fc4f max_arch_pfn =3D 0x400000000
[    0.023032] esrt: Reserving ESRT space from 0x00000000284d0818 to
0x00000000284d0850.
[    0.023054] e820: update [mem 0x284d0000-0x284d0fff] System RAM =3D=3D>
device reserved
[    0.023154] Using GB pages for direct mapping
[    0.023602] Secure boot disabled
[    0.023604] RAMDISK: [mem 0x1ded2000-0x22ff3fff]
[    0.024516] ACPI: Early table checksum verification disabled
[    0.024522] ACPI: RSDP 0x000000002F077014 000024 (v02 INTEL )
[    0.024530] ACPI: XSDT 0x000000002F013728 0000DC (v01 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024541] ACPI: FACP 0x000000002EC32000 000114 (v06 INTEL
NUC9i5FN 00000043 AMI  00010013)
[    0.024552] ACPI: DSDT 0x000000002EBEE000 0439C6 (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024558] ACPI: FACS 0x000000002F110000 000040
[    0.024563] ACPI: MCFG 0x000000002EC35000 00003C (v01 INTEL
NUC9i5FN 00000043 MSFT 00000097)
[    0.024569] ACPI: SSDT 0x000000002EC33000 001B4A (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024575] ACPI: FIDT 0x000000002EBED000 00009C (v01 INTEL
NUC9i5FN 00000043 AMI  00010013)
[    0.024581] ACPI: SSDT 0x000000002EBE9000 0031C6 (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024587] ACPI: HPET 0x000000002EC37000 000038 (v01 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024592] ACPI: SSDT 0x000000002EBE5000 0033B4 (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024598] ACPI: SSDT 0x000000002EBE3000 00115C (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024604] ACPI: SSDT 0x000000002EBDF000 0032BD (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024609] ACPI: NHLT 0x000000002EC36000 00002D (v00 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024615] ACPI: LPIT 0x000000002EBDE000 000094 (v01 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024621] ACPI: WDAT 0x000000002EBDC000 000134 (v01 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024627] ACPI: SSDT 0x000000002EBD9000 002720 (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024633] ACPI: SSDT 0x000000002EBD8000 00087C (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024638] ACPI: DBGP 0x000000002EBD7000 000034 (v01 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024644] ACPI: DBG2 0x000000002EBD6000 000054 (v00 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024650] ACPI: SSDT 0x000000002EBD4000 001B66 (v02 INTEL
NUC9i5FN 00000043 INTL 20160527)
[    0.024656] ACPI: FPDT 0x000000002EBD2000 000044 (v01 INTEL
NUC9i5FN 00000043 AMI  01000013)
[    0.024661] ACPI: BGRT 0x000000002EBD1000 000038 (v01 INTEL
NUC9i5FN 00000043 AMI  00010013)
[    0.024667] ACPI: TPM2 0x000000002EBD0000 00004C (v04 INTEL
NUC9i5FN 00000043 AMI  00000000)
[    0.024673] ACPI: DMAR 0x000000002EBD3000 0000A8 (v01 INTEL
NUC9i5FN 00000043      01000013)
[    0.024679] ACPI: WSMT 0x000000002EBDD000 000028 (v01 INTEL
NUC9i5FN 00000043 AMI  00010013)
[    0.024684] ACPI: APIC 0x000000002EBCF000 0000F4 (v04 INTEL
NUC9i5FN 00000043 AMI  00010013)
[    0.024689] ACPI: Reserving FACP table memory at [mem 0x2ec32000-0x2ec32=
113]
[    0.024692] ACPI: Reserving DSDT table memory at [mem 0x2ebee000-0x2ec31=
9c5]
[    0.024694] ACPI: Reserving FACS table memory at [mem 0x2f110000-0x2f110=
03f]
[    0.024696] ACPI: Reserving MCFG table memory at [mem 0x2ec35000-0x2ec35=
03b]
[    0.024698] ACPI: Reserving SSDT table memory at [mem 0x2ec33000-0x2ec34=
b49]
[    0.024700] ACPI: Reserving FIDT table memory at [mem 0x2ebed000-0x2ebed=
09b]
[    0.024701] ACPI: Reserving SSDT table memory at [mem 0x2ebe9000-0x2ebec=
1c5]
[    0.024703] ACPI: Reserving HPET table memory at [mem 0x2ec37000-0x2ec37=
037]
[    0.024705] ACPI: Reserving SSDT table memory at [mem 0x2ebe5000-0x2ebe8=
3b3]
[    0.024707] ACPI: Reserving SSDT table memory at [mem 0x2ebe3000-0x2ebe4=
15b]
[    0.024709] ACPI: Reserving SSDT table memory at [mem 0x2ebdf000-0x2ebe2=
2bc]
[    0.024710] ACPI: Reserving NHLT table memory at [mem 0x2ec36000-0x2ec36=
02c]
[    0.024712] ACPI: Reserving LPIT table memory at [mem 0x2ebde000-0x2ebde=
093]
[    0.024714] ACPI: Reserving WDAT table memory at [mem 0x2ebdc000-0x2ebdc=
133]
[    0.024716] ACPI: Reserving SSDT table memory at [mem 0x2ebd9000-0x2ebdb=
71f]
[    0.024717] ACPI: Reserving SSDT table memory at [mem 0x2ebd8000-0x2ebd8=
87b]
[    0.024719] ACPI: Reserving DBGP table memory at [mem 0x2ebd7000-0x2ebd7=
033]
[    0.024721] ACPI: Reserving DBG2 table memory at [mem 0x2ebd6000-0x2ebd6=
053]
[    0.024723] ACPI: Reserving SSDT table memory at [mem 0x2ebd4000-0x2ebd5=
b65]
[    0.024724] ACPI: Reserving FPDT table memory at [mem 0x2ebd2000-0x2ebd2=
043]
[    0.024726] ACPI: Reserving BGRT table memory at [mem 0x2ebd1000-0x2ebd1=
037]
[    0.024728] ACPI: Reserving TPM2 table memory at [mem 0x2ebd0000-0x2ebd0=
04b]
[    0.024729] ACPI: Reserving DMAR table memory at [mem 0x2ebd3000-0x2ebd3=
0a7]
[    0.024731] ACPI: Reserving WSMT table memory at [mem 0x2ebdd000-0x2ebdd=
027]
[    0.024733] ACPI: Reserving APIC table memory at [mem 0x2ebcf000-0x2ebcf=
0f3]
[    0.025353] No NUMA configuration found
[    0.025355] Faking a node at [mem 0x0000000000000000-0x00000010c0ffffff]
[    0.025385] NODE_DATA(0) allocated [mem 0x10c0fd4f80-0x10c0ffffff]
[    0.025885] Reserving Intel graphics memory at [mem 0x39000000-0x3cfffff=
f]
[    0.026449] ACPI: PM-Timer IO Port: 0x1808
[    0.026466] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.026469] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.026471] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.026472] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.026474] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.026475] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.026477] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.026479] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.026480] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.026482] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.026483] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.026485] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.026545] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.026551] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.026554] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.026563] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.026565] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.026587] e820: update [mem 0x261e1000-0x26242fff] System RAM =3D=3D>
device reserved
[    0.026610] TSC deadline timer available
[    0.026615] CPU topo: Max. logical packages:   1
[    0.026617] CPU topo: Max. logical nodes:      1
[    0.026619] CPU topo: Num. nodes per package:  1
[    0.026624] CPU topo: Max. logical dies:       1
[    0.026625] CPU topo: Max. dies per package:   1
[    0.026635] CPU topo: Max. threads per core:   2
[    0.026636] CPU topo: Num. cores per package:     6
[    0.026637] CPU topo: Num. threads per package:  12
[    0.026639] CPU topo: Allowing 12 present CPUs plus 0 hotplug CPUs
[    0.026673] PM: hibernation: Registered nosave memory: [mem
0x00000000-0x00000fff]
[    0.026678] PM: hibernation: Registered nosave memory: [mem
0x0009f000-0x000fffff]
[    0.026682] PM: hibernation: Registered nosave memory: [mem
0x261e1000-0x26242fff]
[    0.026686] PM: hibernation: Registered nosave memory: [mem
0x284d0000-0x284d0fff]
[    0.026689] PM: hibernation: Registered nosave memory: [mem
0x2cab1000-0x2fc4dfff]
[    0.026692] PM: hibernation: Registered nosave memory: [mem
0x2fc4f000-0xffffffff]
[    0.026695] [gap 0x3d000000-0xfdffffff] available for PCI devices
[    0.026699] Booting paravirtualized kernel on bare hardware
[    0.026703] clocksource: refined-jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.026908] Zone ranges:
[    0.026910]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.026914]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.026917]   Normal   [mem 0x0000000100000000-0x00000010c0ffffff]
[    0.026920]   Device   empty
[    0.026922] Movable zone start for each node
[    0.026927] Early memory node ranges
[    0.026928]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.026931]   node   0: [mem 0x0000000000100000-0x000000002cab0fff]
[    0.026933]   node   0: [mem 0x000000002fc4e000-0x000000002fc4efff]
[    0.026935]   node   0: [mem 0x0000000100000000-0x00000010c0ffffff]
[    0.026954] Initmem setup node 0 [mem 0x0000000000001000-0x00000010c0fff=
fff]
[    0.026966] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.027003] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.028771] On node 0, zone DMA32: 12701 pages in unavailable ranges
[    0.178325] On node 0, zone Normal: 945 pages in unavailable ranges
[    0.178681] On node 0, zone Normal: 28672 pages in unavailable ranges
[    0.178701] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:12
nr_cpu_ids:12 nr_node_ids:1
[    0.179880] percpu: Embedded 85 pages/cpu s225280 r8192 d114688 u524288
[    0.179895] pcpu-alloc: s225280 r8192 d114688 u524288 alloc=3D1*2097152
[    0.179900] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07
[    0.179910] pcpu-alloc: [0] 08 09 10 11
[    0.179953] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-7.1.5-070105-generic
root=3DUUID=3Db0c932f0-3e9f-449a-97aa-be8967f0406e ro quiet splash
thunderbolt.dyndbg=3D+p vt.handoff=3D7
[    0.180140] Unknown kernel command line parameters "splash", will
be passed to user space.
[    0.180180] printk: log buffer data + meta data: 262144 + 1114112 =3D
1376256 bytes
[    0.189191] Dentry cache hash table entries: 8388608 (order: 14,
67108864 bytes, linear)
[    0.193628] Inode-cache hash table entries: 4194304 (order: 13,
33554432 bytes, linear)
[    0.193955] software IO TLB: area num 16.
[    0.212050] Fallback order for Node 0: 0
[    0.212057] Built 1 zonelists, mobility grouping on.  Total pages: 16702=
032
[    0.212059] Policy zone: Normal
[    0.212074] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.557831] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D12, =
Nodes=3D1
[    0.583067] ftrace: allocating 63972 entries in 252 pages
[    0.583073] ftrace: allocated 252 pages with 6 groups
[    0.584620] Dynamic Preempt: lazy
[    0.584820] rcu: Preemptible hierarchical RCU implementation.
[    0.584822] rcu:     RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_=
ids=3D12.
[    0.584825]     Trampoline variant of Tasks RCU enabled.
[    0.584827]     Rude variant of Tasks RCU enabled.
[    0.584828]     Tracing variant of Tasks RCU enabled.
[    0.584829] rcu: RCU calculated value of scheduler-enlistment delay
is 100 jiffies.
[    0.584831] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D12
[    0.584866] RCU Tasks: Setting shift to 4 and lim to 1
rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D12.
[    0.584872] RCU Tasks Rude: Setting shift to 4 and lim to 1
rcu_task_cb_adjust=3D1 rcu_task_cpu_ids=3D12.
[    0.598295] NR_IRQS: 524544, nr_irqs: 2152, preallocated irqs: 16
[    0.598688] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.598923] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.599087] Console: colour dummy device 80x25
[    0.599093] printk: legacy console [tty0] enabled
[    0.599235] ACPI: Core revision 20251212
[    0.599782] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.599831] APIC: Switch to symmetric I/O mode setup
[    0.599835] DMAR: Host address width 39
[    0.599838] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.599864] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap
1c0000c40660462 ecap 19e2ff0505e
[    0.599870] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.599877] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap
d2008c40660462 ecap f050da
[    0.599881] DMAR: RMRR base: 0x0000002f537000 end: 0x0000002f780fff
[    0.599885] DMAR: RMRR base: 0x00000038800000 end: 0x0000003cffffff
[    0.599889] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.599893] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.599895] DMAR-IR: Queued invalidation will be enabled to support
x2apic and Intr-remapping.
[    0.602278] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.602282] x2apic enabled
[    0.602420] APIC: Switched APIC routing to: cluster x2apic
[    0.608014] clocksource: tsc-early: mask: 0xffffffffffffffff
max_cycles: 0x170fff30cc4, max_idle_ns: 440795237869 ns
[    0.608028] Calibrating delay loop (skipped), value calculated
using timer frequency.. 3199.92 BogoMIPS (lpj=3D1599960)
[    0.608090] CPU0: Thermal monitoring enabled (TM1)
[    0.608192] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.608196] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
[    0.608214] process: using mwait in idle threads
[    0.608222] mitigations: Enabled attack vectors: user_kernel,
user_user, guest_host, guest_guest, SMT mitigations: auto
[    0.608233] Speculative Store Bypass: Mitigation: Speculative Store
Bypass disabled via prctl
[    0.608236] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.608239] RETBleed: Mitigation: Enhanced IBRS
[    0.608241] ITS: Mitigation: Aligned branch/return thunks
[    0.608243] MMIO Stale Data: Mitigation: Clear CPU buffers
[    0.608246] VMSCAPE: Mitigation: IBPB before exit to userspace
[    0.608248] Spectre V1 : Mitigation: usercopy/swapgs barriers and
__user pointer sanitization
[    0.608251] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single
CALL on VMEXIT
[    0.608258] Spectre V2 : Enabling IBPB for BPF
[    0.608261] Spectre V2 : mitigation: Enabling conditional Indirect
Branch Prediction Barrier
[    0.608273] active return thunk: its_return_thunk
[    0.608281] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on
syscall and VM exit
[    0.608293] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating
point registers'
[    0.608297] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.608300] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.608302] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registe=
rs'
[    0.608304] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.608307] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.608311] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.608314] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.608317] x86/fpu: Enabled xstate features 0x1f, context size is
960 bytes, using 'compacted' format.
[    0.609023] pid_max: default: 32768 minimum: 301
[    0.609023] landlock: Up and running.
[    0.609023] Yama: becoming mindful.
[    0.609023] AppArmor: AppArmor initialized
[    0.609023] Mount-cache hash table entries: 131072 (order: 8,
1048576 bytes, linear)
[    0.609023] Mountpoint-cache hash table entries: 131072 (order: 8,
1048576 bytes, linear)
[    0.609023] VFS: Finished mounting rootfs on nullfs
[    0.609023] smpboot: CPU0: Intel(R) Core(TM) i7-10710U CPU @
1.10GHz (family: 0x6, model: 0xa6, stepping: 0x0)
[    0.609023] Performance Events: PEBS fmt3+, Skylake events, 32-deep
LBR, full-width counters, Intel PMU driver.
[    0.609023] ... version:                   4
[    0.609023] ... bit width:                 48
[    0.609023] ... generic counters:          4
[    0.609023] ... generic bitmap:            000000000000000f
[    0.609023] ... fixed-purpose counters:    3
[    0.609023] ... fixed-purpose bitmap:      0000000000000007
[    0.609023] ... value mask:                0000ffffffffffff
[    0.609023] ... max period:                00007fffffffffff
[    0.609023] ... global_ctrl mask:          000000070000000f
[    0.609023] signal: max sigframe size: 2032
[    0.609023] Estimated ratio of average max frequency by base
frequency (times 1024): 2624
[    0.609023] rcu: Hierarchical SRCU implementation.
[    0.609023] rcu:     Max phase no-delay instances is 400.
[    0.609139] Timer migration: 2 hierarchy levels; 8 children per
group; 2 crossnode level
[    0.615396] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.615637] smp: Bringing up secondary CPUs ...
[    0.615890] smpboot: x86: Booting SMP configuration:
[    0.615893] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
#8  #9 #10 #11
[    0.622584] MMIO Stale Data CPU bug present and SMT on, data leak
possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/pr=
ocessor_mmio_stale_data.html
for more details.
[    0.624121] smp: Brought up 1 node, 12 CPUs
[    0.624121] smpboot: Total of 12 processors activated (38399.04 BogoMIPS=
)
[    0.625371] Memory: 60194976K/66808128K available (23913K kernel
code, 4912K rwdata, 17432K rodata, 5384K init, 5804K bss, 6582268K
reserved, 0K cma-reserved)
[    0.629178] devtmpfs: initialized
[    0.629209] x86/mm: Memory block size: 2048MB
[    0.632128] ACPI: PM: Registering ACPI NVS region [mem
0x2ec38000-0x2ec94fff] (380928 bytes)
[    0.632152] ACPI: PM: Registering ACPI NVS region [mem
0x2ec96000-0x2f110fff] (4698112 bytes)
[    0.632418] posixtimers hash table entries: 8192 (order: 5, 131072
bytes, linear)
[    0.632418] futex hash table entries: 4096 (262144 bytes on 1 NUMA
nodes, total 256 KiB, linear).
[    0.633535] PM: RTC time: 05:50:42, date: 2026-08-07
[    0.634911] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.636141] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.636851] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for
atomic allocations
[    0.637555] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool
for atomic allocations
[    0.637596] audit: initializing netlink subsys (disabled)
[    0.637621] audit: type=3D2000 audit(1786081842.029:1):
state=3Dinitialized audit_enabled=3D0 res=3D1
[    0.638111] thermal_sys: Registered thermal governor 'fair_share'
[    0.638117] thermal_sys: Registered thermal governor 'bang_bang'
[    0.638121] thermal_sys: Registered thermal governor 'step_wise'
[    0.638123] thermal_sys: Registered thermal governor 'user_space'
[    0.638126] thermal_sys: Registered thermal governor 'power_allocator'
[    0.638146] cpuidle: using governor ladder
[    0.638146] cpuidle: using governor menu
[    0.638178] Freeing SMP alternatives memory: 56K
[    0.656712] efi: Freeing EFI boot services memory: 115308K
[    0.656722] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.657033] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000)
for domain 0000 [bus 00-ff]
[    0.657065] PCI: Using configuration type 1 for base access
[    0.657199] virt/tdx: TDX not supported by the host platform
[    0.657272] kprobes: kprobe jump-optimization is enabled. All
kprobes are optimized if possible.
[    0.658065] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 page=
s
[    0.658071] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.658076] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 page=
s
[    0.658079] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.660188] ACPI: Added _OSI(Module Device)
[    0.660195] ACPI: Added _OSI(Processor Device)
[    0.660198] ACPI: Added _OSI(Processor Aggregator Device)
[    0.829741] ACPI: 9 ACPI AML tables successfully acquired and loaded
[    0.894475] ACPI: \_SB_: platform _OSC: OS support mask [006e7eff]
[    0.894475] ACPI: \_SB_: platform _OSC: OS control mask [006e7eff]
[    0.895820] ACPI: Dynamic OEM Table Load:
[    0.895839] ACPI: SSDT 0xFFFF8EEF00349800 000400 (v02 PmRef
Cpu0Cst  00003001 INTL 20160527)
[    0.898514] ACPI: Dynamic OEM Table Load:
[    0.898528] ACPI: SSDT 0xFFFF8EEF02E15800 000479 (v02 PmRef
Cpu0Ist  00003000 INTL 20160527)
[    0.901149] ACPI: Dynamic OEM Table Load:
[    0.901162] ACPI: SSDT 0xFFFF8EEF028B0B00 0000F4 (v02 PmRef
Cpu0Psd  00003000 INTL 20160527)
[    0.903600] ACPI: Dynamic OEM Table Load:
[    0.903611] ACPI: SSDT 0xFFFF8EEF01997000 00011B (v02 PmRef
Cpu0Hwp  00003000 INTL 20160527)
[    0.906071] ACPI: Dynamic OEM Table Load:
[    0.906086] ACPI: SSDT 0xFFFF8EEF023D9000 000BE2 (v02 PmRef  HwpLvt
  00003000 INTL 20160527)
[    0.908994] ACPI: Dynamic OEM Table Load:
[    0.909009] ACPI: SSDT 0xFFFF8EEF02E15000 000778 (v02 PmRef  ApIst
  00003000 INTL 20160527)
[    0.911818] ACPI: Dynamic OEM Table Load:
[    0.911831] ACPI: SSDT 0xFFFF8EEF0034AC00 0003D7 (v02 PmRef  ApHwp
  00003000 INTL 20160527)
[    0.914652] ACPI: Dynamic OEM Table Load:
[    0.914667] ACPI: SSDT 0xFFFF8EEF023DD000 000D74 (v02 PmRef  ApPsd
  00003000 INTL 20160527)
[    0.918978] ACPI: Dynamic OEM Table Load:
[    0.919026] ACPI: SSDT 0xFFFF8EEF0034C000 0003CA (v02 PmRef  ApCst
  00003000 INTL 20160527)
[    0.931358] ACPI: EC: EC started
[    0.931362] ACPI: EC: interrupt blocked
[    0.933075] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.933080] ACPI: \_SB_.PCI0.LPCB.H_EC: Boot DSDT EC used to handle
transactions
[    0.933084] ACPI: Interpreter enabled
[    0.933166] ACPI: PM: (supports S0 S3 S4 S5)
[    0.933169] ACPI: Using IOAPIC for interrupt routing
[    0.936613] PCI: Using host bridge windows from ACPI; if necessary,
use "pci=3Dnocrs" and report a bug
[    0.936617] PCI: Ignoring E820 reservations for host bridge windows
[    0.939114] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.952564] ACPI: \_SB_.PCI0.RP05.PXP_: New power resource
[    0.958535] ACPI: \_SB_.PCI0.RP09.PXP_: New power resource
[    0.973419] ACPI: \_SB_.PCI0.XHC_.RHUB.HS10.BTPR: New power resource
[    0.976559] ACPI: \_SB_.PCI0.XDCI.USBC: New power resource
[    0.977072] ACPI: \_SB_.PCI0.PAUD: New power resource
[    0.983057] ACPI: \_SB_.PCI0.SAT0.VOL0.V0PR: New power resource
[    0.983542] ACPI: \_SB_.PCI0.SAT0.VOL1.V1PR: New power resource
[    0.984006] ACPI: \_SB_.PCI0.SAT0.VOL2.V2PR: New power resource
[    0.998808] ACPI: \_SB_.PCI0.CNVW.WRST: New power resource
[    1.011498] ACPI: \_TZ_.FN00: New power resource
[    1.011671] ACPI: \_TZ_.FN01: New power resource
[    1.011839] ACPI: \_TZ_.FN02: New power resource
[    1.013069] ACPI: \PIN_: New power resource
[    1.014813] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    1.014828] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI EDR HPX-Type3]
[    1.016786] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    1.020652] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug
SHPCHotplug PME PCIeCapability LTR DPC]
[    1.023227] PCI host bridge to bus 0000:00
[    1.023237] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window=
]
[    1.023242] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window=
]
[    1.023246] pci_bus 0000:00: root bus resource [mem
0x000a0000-0x000bffff window]
[    1.023250] pci_bus 0000:00: root bus resource [mem
0x000e0000-0x000fffff window]
[    1.023253] pci_bus 0000:00: root bus resource [mem
0x3d000000-0xdfffffff window]
[    1.023256] pci_bus 0000:00: root bus resource [mem
0x4000000000-0x7fffffffff window]
[    1.023259] pci_bus 0000:00: root bus resource [mem
0xfc800000-0xfe7fffff window]
[    1.023263] pci_bus 0000:00: root bus resource [bus 00-fe]
[    1.023445] pci 0000:00:00.0: [8086:9b51] type 00 class 0x060000
conventional PCI endpoint
[    1.023611] pci 0000:00:02.0: [8086:9bca] type 00 class 0x030000
PCIe Root Complex Integrated Endpoint
[    1.023643] pci 0000:00:02.0: BAR 0 [mem 0x6022000000-0x6022ffffff 64bit=
]
[    1.023648] pci 0000:00:02.0: BAR 2 [mem 0x4000000000-0x400fffffff
64bit pref]
[    1.023652] pci 0000:00:02.0: BAR 4 [io  0x3000-0x303f]
[    1.023678] pci 0000:00:02.0: Video device with shadowed ROM at
[mem 0x000c0000-0x000dffff]
[    1.024112] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
conventional PCI endpoint
[    1.024147] pci 0000:00:08.0: BAR 0 [mem 0x6023120000-0x6023120fff 64bit=
]
[    1.024314] pci 0000:00:12.0: [8086:02f9] type 00 class 0x118000
conventional PCI endpoint
[    1.024365] pci 0000:00:12.0: BAR 0 [mem 0x602311f000-0x602311ffff 64bit=
]
[    1.024559] pci 0000:00:14.0: [8086:02ed] type 00 class 0x0c0330
conventional PCI endpoint
[    1.024606] pci 0000:00:14.0: BAR 0 [mem 0x6023100000-0x602310ffff 64bit=
]
[    1.024668] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    1.026076] pci 0000:00:14.2: [8086:02ef] type 00 class 0x050000
conventional PCI endpoint
[    1.026136] pci 0000:00:14.2: BAR 0 [mem 0x6023118000-0x6023119fff 64bit=
]
[    1.026142] pci 0000:00:14.2: BAR 2 [mem 0x602311e000-0x602311efff 64bit=
]
[    1.026402] pci 0000:00:14.3: [8086:02f0] type 00 class 0x028000
PCIe Root Complex Integrated Endpoint
[    1.026520] pci 0000:00:14.3: BAR 0 [mem 0x6023114000-0x6023117fff 64bit=
]
[    1.026857] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    1.027603] pci 0000:00:15.0: [8086:02e8] type 00 class 0x0c8000
conventional PCI endpoint
[    1.027801] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    1.038249] pci 0000:00:15.2: [8086:02ea] type 00 class 0x0c8000
conventional PCI endpoint
[    1.038381] pci 0000:00:15.2: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    1.048671] pci 0000:00:16.0: [8086:02e0] type 00 class 0x078000
conventional PCI endpoint
[    1.048732] pci 0000:00:16.0: BAR 0 [mem 0x602311b000-0x602311bfff 64bit=
]
[    1.048802] pci 0000:00:16.0: PME# supported from D3hot
[    1.050019] pci 0000:00:17.0: [8086:02d3] type 00 class 0x010601
conventional PCI endpoint
[    1.050069] pci 0000:00:17.0: BAR 0 [mem 0x56320000-0x56321fff]
[    1.050074] pci 0000:00:17.0: BAR 1 [mem 0x56323000-0x563230ff]
[    1.050078] pci 0000:00:17.0: BAR 2 [io  0x3090-0x3097]
[    1.050083] pci 0000:00:17.0: BAR 3 [io  0x3080-0x3083]
[    1.050087] pci 0000:00:17.0: BAR 4 [io  0x3060-0x307f]
[    1.050091] pci 0000:00:17.0: BAR 5 [mem 0x56322000-0x563227ff]
[    1.050148] pci 0000:00:17.0: PME# supported from D3hot
[    1.051059] pci 0000:00:1c.0: [8086:02bc] type 01 class 0x060400
PCIe Root Port
[    1.051089] pci 0000:00:1c.0: PCI bridge to [bus 01-39]
[    1.051097] pci 0000:00:1c.0:   bridge window [mem 0x40000000-0x560fffff=
]
[    1.051109] pci 0000:00:1c.0:   bridge window [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.051202] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    1.052921] pci 0000:00:1d.0: [8086:02b0] type 01 class 0x060400
PCIe Root Port
[    1.052950] pci 0000:00:1d.0: PCI bridge to [bus 3a]
[    1.052959] pci 0000:00:1d.0:   bridge window [mem 0x56200000-0x562fffff=
]
[    1.053056] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    1.156925] pci 0000:00:1d.5: [8086:02b5] type 01 class 0x060400
PCIe Root Port
[    1.156959] pci 0000:00:1d.5: PCI bridge to [bus 3b]
[    1.156968] pci 0000:00:1d.5:   bridge window [mem 0x56100000-0x561fffff=
]
[    1.157073] pci 0000:00:1d.5: PME# supported from D0 D3hot D3cold
[    1.158804] pci 0000:00:1f.0: [8086:0284] type 00 class 0x060100
conventional PCI endpoint
[    1.159579] pci 0000:00:1f.3: [8086:02c8] type 00 class 0x040380
conventional PCI endpoint
[    1.159714] pci 0000:00:1f.3: BAR 0 [mem 0x6023110000-0x6023113fff 64bit=
]
[    1.159731] pci 0000:00:1f.3: BAR 4 [mem 0x6023000000-0x60230fffff 64bit=
]
[    1.159861] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    1.162910] pci 0000:00:1f.4: [8086:02a3] type 00 class 0x0c0500
conventional PCI endpoint
[    1.162977] pci 0000:00:1f.4: BAR 0 [mem 0x602311a000-0x602311a0ff 64bit=
]
[    1.163001] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    1.163647] pci 0000:00:1f.5: [8086:02a4] type 00 class 0x0c8000
conventional PCI endpoint
[    1.163712] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    1.163858] pci 0000:00:1f.6: [8086:0d4f] type 00 class 0x020000
conventional PCI endpoint
[    1.163990] pci 0000:00:1f.6: BAR 0 [mem 0x56300000-0x5631ffff]
[    1.164136] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    1.164593] pci 0000:01:00.0: [8086:15e7] type 01 class 0x060400
PCIe Switch Upstream Port
[    1.164638] pci 0000:01:00.0: PCI bridge to [bus 02-39]
[    1.164652] pci 0000:01:00.0:   bridge window [mem 0x40000000-0x560fffff=
]
[    1.164669] pci 0000:01:00.0:   bridge window [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.164688] pci 0000:01:00.0: enabling Extended Tags
[    1.164828] pci 0000:01:00.0: supports D1 D2
[    1.164831] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.165205] pci 0000:00:1c.0: PCI bridge to [bus 01-39]
[    1.165366] pci 0000:02:00.0: [8086:15e7] type 01 class 0x060400
PCIe Switch Downstream Port
[    1.165407] pci 0000:02:00.0: PCI bridge to [bus 03]
[    1.165421] pci 0000:02:00.0:   bridge window [mem 0x56000000-0x560fffff=
]
[    1.165454] pci 0000:02:00.0: enabling Extended Tags
[    1.165597] pci 0000:02:00.0: supports D1 D2
[    1.165599] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.165899] pci 0000:02:01.0: [8086:15e7] type 01 class 0x060400
PCIe Switch Downstream Port
[    1.165940] pci 0000:02:01.0: PCI bridge to [bus 04-38]
[    1.165953] pci 0000:02:01.0:   bridge window [mem 0x40000000-0x55efffff=
]
[    1.165970] pci 0000:02:01.0:   bridge window [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.165991] pci 0000:02:01.0: enabling Extended Tags
[    1.166143] pci 0000:02:01.0: supports D1 D2
[    1.166146] pci 0000:02:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.166443] pci 0000:02:02.0: [8086:15e7] type 01 class 0x060400
PCIe Switch Downstream Port
[    1.166483] pci 0000:02:02.0: PCI bridge to [bus 39]
[    1.166496] pci 0000:02:02.0:   bridge window [mem 0x55f00000-0x55ffffff=
]
[    1.166530] pci 0000:02:02.0: enabling Extended Tags
[    1.166667] pci 0000:02:02.0: supports D1 D2
[    1.166670] pci 0000:02:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.166999] pci 0000:01:00.0: PCI bridge to [bus 02-39]
[    1.167155] pci 0000:03:00.0: [8086:15e8] type 00 class 0x088000
PCIe Endpoint
[    1.167226] pci 0000:03:00.0: BAR 0 [mem 0x56000000-0x5603ffff]
[    1.167232] pci 0000:03:00.0: BAR 1 [mem 0x56040000-0x56040fff]
[    1.167254] pci 0000:03:00.0: enabling Extended Tags
[    1.167402] pci 0000:03:00.0: supports D1 D2
[    1.167405] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.167673] pci 0000:02:00.0: PCI bridge to [bus 03]
[    1.167758] pci 0000:02:01.0: PCI bridge to [bus 04-38]
[    1.167954] pci 0000:39:00.0: [8086:15e9] type 00 class 0x0c0330
PCIe Endpoint
[    1.168030] pci 0000:39:00.0: BAR 0 [mem 0x55f00000-0x55f0ffff]
[    1.168057] pci 0000:39:00.0: enabling Extended Tags
[    1.168225] pci 0000:39:00.0: supports D1 D2
[    1.168228] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.168617] pci 0000:02:02.0: PCI bridge to [bus 39]
[    1.168998] pci 0000:3a:00.0: [c0a9:540a] type 00 class 0x010802
PCIe Endpoint
[    1.169149] pci 0000:3a:00.0: BAR 0 [mem 0x56200000-0x56203fff 64bit]
[    1.169961] pci 0000:00:1d.0: PCI bridge to [bus 3a]
[    1.170273] pci 0000:3b:00.0: [17a0:9755] type 00 class 0x080501
PCIe Endpoint
[    1.170394] pci 0000:3b:00.0: BAR 0 [mem 0x56100000-0x56100fff]
[    1.170624] pci 0000:3b:00.0: supports D1 D2
[    1.170627] pci 0000:3b:00.0: PME# supported from D1 D2 D3hot D3cold
[    1.171031] pci 0000:00:1d.5: PCI bridge to [bus 3b]
[    1.180416] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    1.180617] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    1.180810] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    1.181001] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    1.181206] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    1.181399] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    1.181590] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    1.181782] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    1.182976] Low-power S0 idle used by default for system suspend
[    1.191219] ACPI: EC: interrupt unblocked
[    1.191223] ACPI: EC: event unblocked
[    1.191239] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    1.191242] ACPI: EC: GPE=3D0x6e
[    1.191246] ACPI: \_SB_.PCI0.LPCB.H_EC: Boot DSDT EC initialization comp=
lete
[    1.191250] ACPI: \_SB_.PCI0.LPCB.H_EC: EC: Used to handle
transactions and events
[    1.192031] iommu: Default domain type: Translated
[    1.192036] iommu: DMA domain TLB invalidation policy: lazy mode
[    1.192156] SCSI subsystem initialized
[    1.192172] libata version 3.00 loaded.
[    1.192172] ACPI: bus type USB registered
[    1.192172] usbcore: registered new interface driver usbfs
[    1.192172] usbcore: registered new interface driver hub
[    1.192172] usbcore: registered new device driver usb
[    1.192195] pps_core: LinuxPPS API ver. 1 registered
[    1.192197] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    1.192203] PTP clock support registered
[    1.193067] EDAC MC: Ver: 3.0.0
[    1.193277] efivars: Registered efivars operations
[    1.193514] NetLabel: Initializing
[    1.193517] NetLabel:  domain hash size =3D 128
[    1.193520] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    1.193557] NetLabel:  unlabeled traffic allowed by default
[    1.194074] mctp: management component transport protocol core
[    1.194074] NET: Registered PF_MCTP protocol family
[    1.194074] PCI: Using ACPI for IRQ routing
[    1.231176] PCI: pci_cache_line_size set to 64 bytes
[    1.231409] e820: register RAM buffer resource [mem 0x0009f000-0x0009fff=
f]
[    1.231413] e820: register RAM buffer resource [mem 0x261e1000-0x27fffff=
f]
[    1.231415] e820: register RAM buffer resource [mem 0x284d0000-0x2bfffff=
f]
[    1.231418] e820: register RAM buffer resource [mem 0x2cab1000-0x2ffffff=
f]
[    1.231421] e820: register RAM buffer resource [mem 0x2fc4f000-0x2ffffff=
f]
[    1.231423] e820: register RAM buffer resource [mem
0x10c1000000-0x10c3ffffff]
[    1.232038] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    1.232043] pci 0000:00:02.0: vgaarb: bridge control possible
[    1.232046] pci 0000:00:02.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    1.232057] vgaarb: loaded
[    1.232057] Monitor-Mwait will be used to enter C-1 state
[    1.232060] Monitor-Mwait will be used to enter C-2 state
[    1.232060] Monitor-Mwait will be used to enter C-3 state
[    1.255039] clocksource: Switched to clocksource tsc-early
[    1.255608] VFS: Disk quotas dquot_6.6.0
[    1.255645] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    1.256147] AppArmor: AppArmor Filesystem Enabled
[    1.257027] acpi PNP0C02:01: Reserved [io  0x0a00-0x0a0f]
[    1.257036] acpi PNP0C02:01: Reserved [io  0x0a10-0x0a2f]
[    1.257040] acpi PNP0C02:01: Reserved [io  0x0a30-0x0a4f]
[    1.257044] acpi PNP0C02:01: Reserved [io  0x0a50-0x0a6f]
[    1.257048] acpi PNP0C02:01: Reserved [io  0x0a70-0x0a7f]
[    1.257052] acpi PNP0C02:01: Reserved [io  0x0a80-0x0a8f]
[    1.257072] acpi PNP0C02:02: Skipped [io  0x002e-0x002f]
[    1.257076] acpi PNP0C02:02: Skipped [io  0x004e-0x004f]
[    1.257080] acpi PNP0C02:02: Skipped [io  0x0061]
[    1.257083] acpi PNP0C02:02: Skipped [io  0x0063]
[    1.257087] acpi PNP0C02:02: Skipped [io  0x0065]
[    1.257090] acpi PNP0C02:02: Skipped [io  0x0067]
[    1.257094] acpi PNP0C02:02: Skipped [io  0x0070]
[    1.257097] acpi PNP0C02:02: Skipped [io  0x0080]
[    1.257101] acpi PNP0C02:02: Skipped [io  0x0092]
[    1.257115] acpi PNP0C02:02: Skipped [io  0x00b2-0x00b3]
[    1.257120] acpi PNP0C02:02: Reserved [io  0x0680-0x069f]
[    1.257124] acpi PNP0C02:02: Reserved [io  0x164e-0x164f]
[    1.257413] acpi PNP0C02:03: Reserved [mem 0xfed10000-0xfed17fff]
[    1.257418] acpi PNP0C02:03: Reserved [mem 0xfed18000-0xfed18fff]
[    1.257423] acpi PNP0C02:03: Reserved [mem 0xfed19000-0xfed19fff]
[    1.257427] acpi PNP0C02:03: Reserved [mem 0xe0000000-0xefffffff]
[    1.257434] acpi PNP0C02:03: Reserved [mem 0xfed20000-0xfed3ffff]
[    1.257439] acpi PNP0C02:03: Could not reserve [mem 0xfed90000-0xfed93ff=
f]
[    1.257444] acpi PNP0C02:03: Reserved [mem 0xfed45000-0xfed8ffff]
[    1.257448] acpi PNP0C02:03: Could not reserve [mem 0xfee00000-0xfeeffff=
f]
[    1.257795] acpi PNP0C02:04: Reserved [mem 0xfd000000-0xfd69ffff]
[    1.257801] acpi PNP0C02:04: Reserved [mem 0xfd6b0000-0xfd6cffff]
[    1.257805] acpi PNP0C02:04: Reserved [mem 0xfd6f0000-0xfdffffff]
[    1.257810] acpi PNP0C02:04: Could not reserve [mem 0xfe000000-0xfe01fff=
f]
[    1.257814] acpi PNP0C02:04: Reserved [mem 0xfe200000-0xfe7fffff]
[    1.257818] acpi PNP0C02:04: Reserved [mem 0xff000000-0xffffffff]
[    1.257823] acpi PNP0C02:04: Could not reserve [io  0x1800-0x18fe]
[    1.258622] acpi PNP0C02:05: Reserved [io  0x2000-0x20fe]
[    1.259063] acpi PNP0C02:06: Reserved [mem 0xfe038000-0xfe038fff]
[    1.259165] pnp: PnP ACPI init
[    1.263511] pnp: PnP ACPI: found 0 devices
[    1.271757] clocksource: acpi_pm: mask: 0xffffff max_cycles:
0xffffff, max_idle_ns: 2085701024 ns
[    1.271943] NET: Registered PF_INET protocol family
[    1.272285] IP idents hash table entries: 262144 (order: 9, 2097152
bytes, linear)
[    1.316554] tcp_listen_portaddr_hash hash table entries: 32768
(order: 7, 524288 bytes, linear)
[    1.316687] Table-perturb hash table entries: 65536 (order: 6,
262144 bytes, linear)
[    1.317220] TCP established hash table entries: 524288 (order: 10,
4194304 bytes, linear)
[    1.318329] TCP bind hash table entries: 65536 (order: 9, 2097152
bytes, linear)
[    1.318841] TCP: Hash tables configured (established 524288 bind 65536)
[    1.319252] MPTCP token hash table entries: 65536 (order: 9,
1572864 bytes, linear)
[    1.319827] UDP hash table entries: 32768 (order: 9, 2097152 bytes, line=
ar)
[    1.320378] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.320399] NET: Registered PF_XDP protocol family
[    1.320423] pci 0000:02:01.0: bridge window [io  0x1000-0x0fff] to
[bus 04-38] add_size 1000
[    1.320435] pci 0000:01:00.0: bridge window [io  0x1000-0x0fff] to
[bus 02-39] add_size 1000
[    1.320441] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to
[bus 01-39] add_size 2000
[    1.320462] pci 0000:00:15.0: BAR 0 [mem 0x4010000000-0x4010000fff
64bit]: assigned
[    1.320494] pci 0000:00:15.2: BAR 0 [mem 0x4010001000-0x4010001fff
64bit]: assigned
[    1.320523] pci 0000:00:1c.0: bridge window [io  0x4000-0x5fff]: assigne=
d
[    1.320531] pci 0000:01:00.0: bridge window [io  0x4000-0x4fff]: assigne=
d
[    1.320537] pci 0000:02:01.0: bridge window [io  0x4000-0x4fff]: assigne=
d
[    1.320542] pci 0000:02:00.0: PCI bridge to [bus 03]
[    1.320551] pci 0000:02:00.0:   bridge window [mem 0x56000000-0x560fffff=
]
[    1.320565] pci 0000:02:01.0: PCI bridge to [bus 04-38]
[    1.320570] pci 0000:02:01.0:   bridge window [io  0x4000-0x4fff]
[    1.320578] pci 0000:02:01.0:   bridge window [mem 0x40000000-0x55efffff=
]
[    1.320585] pci 0000:02:01.0:   bridge window [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.320596] pci 0000:02:02.0: PCI bridge to [bus 39]
[    1.320604] pci 0000:02:02.0:   bridge window [mem 0x55f00000-0x55ffffff=
]
[    1.320617] pci 0000:01:00.0: PCI bridge to [bus 02-39]
[    1.320621] pci 0000:01:00.0:   bridge window [io  0x4000-0x4fff]
[    1.320629] pci 0000:01:00.0:   bridge window [mem 0x40000000-0x560fffff=
]
[    1.320636] pci 0000:01:00.0:   bridge window [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.320645] pci 0000:00:1c.0: PCI bridge to [bus 01-39]
[    1.320650] pci 0000:00:1c.0:   bridge window [io  0x4000-0x5fff]
[    1.320656] pci 0000:00:1c.0:   bridge window [mem 0x40000000-0x560fffff=
]
[    1.320662] pci 0000:00:1c.0:   bridge window [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.320670] pci 0000:00:1d.0: PCI bridge to [bus 3a]
[    1.320676] pci 0000:00:1d.0:   bridge window [mem 0x56200000-0x562fffff=
]
[    1.320686] pci 0000:00:1d.5: PCI bridge to [bus 3b]
[    1.320692] pci 0000:00:1d.5:   bridge window [mem 0x56100000-0x561fffff=
]
[    1.320704] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.320708] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.320712] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    1.320716] pci_bus 0000:00: resource 7 [mem 0x000e0000-0x000fffff windo=
w]
[    1.320720] pci_bus 0000:00: resource 8 [mem 0x3d000000-0xdfffffff windo=
w]
[    1.320723] pci_bus 0000:00: resource 9 [mem
0x4000000000-0x7fffffffff window]
[    1.320727] pci_bus 0000:00: resource 10 [mem 0xfc800000-0xfe7fffff wind=
ow]
[    1.320732] pci_bus 0000:01: resource 0 [io  0x4000-0x5fff]
[    1.320735] pci_bus 0000:01: resource 1 [mem 0x40000000-0x560fffff]
[    1.320739] pci_bus 0000:01: resource 2 [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.320743] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    1.320746] pci_bus 0000:02: resource 1 [mem 0x40000000-0x560fffff]
[    1.320750] pci_bus 0000:02: resource 2 [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.320754] pci_bus 0000:03: resource 1 [mem 0x56000000-0x560fffff]
[    1.320758] pci_bus 0000:04: resource 0 [io  0x4000-0x4fff]
[    1.320761] pci_bus 0000:04: resource 1 [mem 0x40000000-0x55efffff]
[    1.320765] pci_bus 0000:04: resource 2 [mem
0x6000000000-0x6021ffffff 64bit pref]
[    1.320769] pci_bus 0000:39: resource 1 [mem 0x55f00000-0x55ffffff]
[    1.320772] pci_bus 0000:3a: resource 1 [mem 0x56200000-0x562fffff]
[    1.320776] pci_bus 0000:3b: resource 1 [mem 0x56100000-0x561fffff]
[    1.321864] pci 0000:01:00.0: CLS mismatch (64 !=3D 128), using 64 bytes
[    1.322100] pci 0000:01:00.0: enabling device (0002 -> 0003)
[    1.322576] pci 0000:00:1d.5: mask Replay Timer Timeout Correctable
Errors due to 0000:3b:00.0 hardware defect
[    1.322669] DMAR: No ATSR found
[    1.322671] DMAR: No SATC found
[    1.322674] DMAR: dmar0: Using Queued invalidation
[    1.322681] DMAR: dmar1: Using Queued invalidation
[    1.322773] Trying to unpack rootfs image as initramfs...
[    1.323265] pci 0000:00:02.0: Adding to iommu group 0
[    1.324465] pci 0000:00:00.0: Adding to iommu group 1
[    1.324490] pci 0000:00:08.0: Adding to iommu group 2
[    1.324522] pci 0000:00:12.0: Adding to iommu group 3
[    1.324563] pci 0000:00:14.0: Adding to iommu group 4
[    1.324588] pci 0000:00:14.2: Adding to iommu group 4
[    1.324611] pci 0000:00:14.3: Adding to iommu group 5
[    1.324650] pci 0000:00:15.0: Adding to iommu group 6
[    1.324672] pci 0000:00:15.2: Adding to iommu group 6
[    1.324703] pci 0000:00:16.0: Adding to iommu group 7
[    1.324724] pci 0000:00:17.0: Adding to iommu group 8
[    1.324751] pci 0000:00:1c.0: Adding to iommu group 9
[    1.324783] pci 0000:00:1d.0: Adding to iommu group 10
[    1.324814] pci 0000:00:1d.5: Adding to iommu group 11
[    1.324893] pci 0000:00:1f.0: Adding to iommu group 12
[    1.324917] pci 0000:00:1f.3: Adding to iommu group 12
[    1.324940] pci 0000:00:1f.4: Adding to iommu group 12
[    1.324963] pci 0000:00:1f.5: Adding to iommu group 12
[    1.324985] pci 0000:00:1f.6: Adding to iommu group 12
[    1.325011] pci 0000:01:00.0: Adding to iommu group 13
[    1.325045] pci 0000:02:00.0: Adding to iommu group 14
[    1.325071] pci 0000:02:01.0: Adding to iommu group 15
[    1.325098] pci 0000:02:02.0: Adding to iommu group 16
[    1.325143] pci 0000:03:00.0: Adding to iommu group 17
[    1.325185] pci 0000:39:00.0: Adding to iommu group 18
[    1.325216] pci 0000:3a:00.0: Adding to iommu group 19
[    1.325239] pci 0000:3b:00.0: Adding to iommu group 20
[    1.328784] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    1.328792] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.328795] software IO TLB: mapped [mem
0x0000000018aa2000-0x000000001caa2000] (64MB)
[    1.331860] platform rtc_cmos: registered fallback platform RTC device
[    1.331885] sgx: EPC section 0x30200000-0x35efffff
[    1.332590] sgx: SGX disabled: SGX launch control CPU feature is
not available, /dev/sgx_enclave disabled.
[    1.334416] Initialise system trusted keyrings
[    1.334435] Key type blacklist registered
[    1.334586] workingset: timestamp_bits=3D36 (anon: 32) max_order=3D24
bucket_order=3D0 (anon: 0)
[    1.335378] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.335785] fuse: init (API version 7.45)
[    1.336255] integrity: Platform Keyring initialized
[    1.336268] integrity: Machine keyring initialized
[    1.371182] Key type asymmetric registered
[    1.371190] Asymmetric key parser 'x509' registered
[    1.371258] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 242)
[    1.371481] io scheduler mq-deadline registered
[    1.376124] ledtrig-cpu: registered to indicate activity on CPUs
[    1.376427] pcieport 0000:00:1c.0: PME: Signaling with IRQ 123
[    1.376507] pcieport 0000:00:1c.0: pciehp: Slot #8 AttnBtn-
PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+
IbPresDis- LLActRep+
[    1.377530] pcieport 0000:00:1d.0: PME: Signaling with IRQ 124
[    1.378184] pcieport 0000:00:1d.5: PME: Signaling with IRQ 125
[    1.378820] pcieport 0000:02:01.0: enabling device (0002 -> 0003)
[    1.379132] pcieport 0000:02:01.0: pciehp: Slot #1 AttnBtn-
PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+
IbPresDis- LLActRep+
[    1.380245] input: Sleep Button as /devices/platform/PNP0C0E:00/input/in=
put0
[    1.380308] ACPI: button: Sleep Button [SLPB]
[    1.380422] input: Power Button as /devices/platform/PNP0C0C:00/input/in=
put1
[    1.380481] ACPI: button: Power Button [PWRB]
[    1.380570] input: Power Button as /devices/platform/LNXPWRBN:00/input/i=
nput2
[    1.380632] ACPI: button: Power Button [PWRF]
[    1.389645] ACPI: thermal: [Firmware Bug]: No valid trip points!
[    1.389788] acpi LNXTHERM:00: registered as thermal_zone0
[    1.389796] ACPI: thermal: Thermal Zone [TZ0] (-263 C)
[    1.390647] acpi LNXTHERM:01: registered as thermal_zone1
[    1.390655] ACPI: thermal: Thermal Zone [TZ00] (46 C)
[    1.391343] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.399165] hpet_acpi_probe: no address or irqs in _CRS
[    1.406014] ACPI: bus type drm_connector registered
[    1.413027] loop: module loaded
[    1.413791] tun: Universal TUN/TAP device driver, 1.6
[    1.413887] PPP generic driver version 2.4.2
[    1.414602] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.414621] xhci_hcd 0000:00:14.0: new USB bus registered, assigned
bus number 1
[    1.415924] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci
version 0x110 quirks 0x0000000000009810
[    1.416578] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.416590] xhci_hcd 0000:00:14.0: new USB bus registered, assigned
bus number 2
[    1.416599] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.416722] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 7.01
[    1.416730] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.416735] usb usb1: Product: xHCI Host Controller
[    1.416740] usb usb1: Manufacturer: Linux 7.1.5-070105-generic xhci-hcd
[    1.416744] usb usb1: SerialNumber: 0000:00:14.0
[    1.417174] hub 1-0:1.0: USB hub found
[    1.417212] hub 1-0:1.0: 12 ports detected
[    1.422823] usb usb2: New USB device found, idVendor=3D1d6b,
idProduct=3D0003, bcdDevice=3D 7.01
[    1.422833] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.422839] usb usb2: Product: xHCI Host Controller
[    1.422843] usb usb2: Manufacturer: Linux 7.1.5-070105-generic xhci-hcd
[    1.422851] usb usb2: SerialNumber: 0000:00:14.0
[    1.423189] hub 2-0:1.0: USB hub found
[    1.423219] hub 2-0:1.0: 6 ports detected
[    1.426422] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    1.426436] xhci_hcd 0000:39:00.0: new USB bus registered, assigned
bus number 3
[    1.427754] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci
version 0x110 quirks 0x0000000200009810
[    1.428354] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    1.428363] xhci_hcd 0000:39:00.0: new USB bus registered, assigned
bus number 4
[    1.428370] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.428475] usb usb3: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 7.01
[    1.428483] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.428488] usb usb3: Product: xHCI Host Controller
[    1.428492] usb usb3: Manufacturer: Linux 7.1.5-070105-generic xhci-hcd
[    1.428495] usb usb3: SerialNumber: 0000:39:00.0
[    1.428784] hub 3-0:1.0: USB hub found
[    1.428809] hub 3-0:1.0: 2 ports detected
[    1.429330] usb usb4: New USB device found, idVendor=3D1d6b,
idProduct=3D0003, bcdDevice=3D 7.01
[    1.429338] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.429343] usb usb4: Product: xHCI Host Controller
[    1.429347] usb usb4: Manufacturer: Linux 7.1.5-070105-generic xhci-hcd
[    1.429351] usb usb4: SerialNumber: 0000:39:00.0
[    1.429620] hub 4-0:1.0: USB hub found
[    1.429643] hub 4-0:1.0: 2 ports detected
[    1.430655] i8042: PNP: No PS/2 controller found.
[    1.430661] i8042: Probing ports directly.
[    1.431818] i8042: No controller found
[    1.432000] mousedev: PS/2 mouse device common for all mice
[    1.432404] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.433720] rtc_cmos rtc_cmos: registered as rtc0
[    1.433957] rtc_cmos rtc_cmos: setting system clock to
2026-08-07T05:50:43 UTC (1786081843)
[    1.434015] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nv=
ram
[    1.434036] i2c_dev: i2c /dev entries driver
[    1.435648] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is
disabled. Duplicate IMA measurements will not be recorded in the IMA
log.
[    1.435692] device-mapper: uevent: version 1.0.3
[    1.435871] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28)
initialised: dm-devel@lists.linux.dev
[    1.435886] intel_pstate: Intel P-state driver initializing
[    1.436884] intel_pstate: HWP enabled
[    1.437013] simple-framebuffer simple-framebuffer.0: [drm]
Registered 1 planes with drm panic
[    1.437025] [drm] Initialized simpledrm 1.0.0 for
simple-framebuffer.0 on minor 0
[    1.438547] fbcon: Deferring console take-over
[    1.438549] simple-framebuffer simple-framebuffer.0: [drm] fb0:
simpledrmdrmfb frame buffer device
[    1.438623] drop_monitor: Initializing network drop monitor service
[    1.438723] NET: Registered PF_INET6 protocol family
[    1.438974] Segment Routing with IPv6
[    1.438981] In-situ OAM (IOAM) with IPv6
[    1.438996] NET: Registered PF_PACKET protocol family
[    1.439044] Key type dns_resolver registered
[    1.440803] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.441374] microcode: Current revision: 0x00000102
[    1.442351] IPI shorthand broadcast: enabled
[    1.443869] sched_clock: Marking stable (1434001246,
9101188)->(1537167930, -94065496)
[    1.444136] registered taskstats version 1
[    1.445448] Loading compiled-in X.509 certificates
[    1.445975] Loaded X.509 cert 'Build time autogenerated kernel key:
816dcead58a78c66793b228720f0cb3bfb65b47a'
[    1.446348] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing
2025 Kmod: d541cef61dc7e793b7eb7e899970a2eef0b5dc8c'
[    1.446720] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing:
14df34d1a87cf37625abec039ef2bf521249b969'
[    1.447092] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing
2025 Kmod: 4627603d2357a2a3f81006370894c221175893e9'
[    1.447463] Loaded X.509 cert 'Canonical Ltd. Kernel Module
Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
[    1.447464] blacklist: Loading compiled-in revocation X.509 certificates
[    1.447480] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing:
61482aa2830d0ab2ad5af10b7250da9033ddcef0'
[    1.447491] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing
(2017): 242ade75ac4a15e50d50c84b0d45ff3eae707a03'
[    1.447502] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing
(ESM 2018): 365188c1d374d6b07c3c8f240f8ef722433d6a8b'
[    1.447512] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing
(2019): c0746fd6c5da3ae827864651ad66ae47fe24b3e8'
[    1.447525] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing
(2021 v1): a8d54bbb3825cfb94fa13c9f8a594a195c107b8d'
[    1.447538] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing
(2021 v2): 4cf046892d6fd3c9a5b03f98d845f90851dc6a8c'
[    1.447548] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing
(2021 v3): 100437bb6de6e469b581e61cd66bce3ef4ed53af'
[    1.447558] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing
(Ubuntu Core 2019): c1d57b8f6b743f23ee41f4f7ee292f06eecadfb9'
[    1.451090] Demotion targets for Node 0: null
[    1.451239] Key type .fscrypt registered
[    1.451240] Key type fscrypt-provisioning registered
[    1.451285] Key type big_key registered
[    1.451287] Key type trusted registered
[    1.512355] Freeing initrd memory: 83080K
[    1.520139] Key type encrypted registered
[    1.520143] AppArmor: AppArmor sha256 policy hashing enabled
[    1.520149] Loading compiled-in module X.509 certificates
[    1.520554] Loaded X.509 cert 'Build time autogenerated kernel key:
816dcead58a78c66793b228720f0cb3bfb65b47a'
[    1.520556] ima: Allocated hash algorithm: sha256
[    1.538377] ima: No architecture policies found
[    1.538403] evm: Initialising EVM extended attributes:
[    1.538404] evm: security.selinux
[    1.538405] evm: security.SMACK64
[    1.538406] evm: security.SMACK64EXEC
[    1.538406] evm: security.SMACK64TRANSMUTE
[    1.538407] evm: security.SMACK64MMAP
[    1.538408] evm: security.apparmor
[    1.538408] evm: security.ima
[    1.538409] evm: security.capability
[    1.538410] evm: HMAC attrs: 0x1
[    1.538835] integrity: Loading X.509 certificate: UEFI:db
[    1.538876] integrity: Loaded X.509 cert 'Microsoft Corporation
UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.538877] integrity: Loading X.509 certificate: UEFI:db
[    1.538892] integrity: Loaded X.509 cert 'Microsoft Windows
Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.538893] integrity: Loading X.509 certificate: UEFI:db
[    1.538905] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023:
81aa6b3244c935bce0d6628af39827421e32497d'
[    1.538906] integrity: Loading X.509 certificate: UEFI:db
[    1.538917] integrity: Loaded X.509 cert 'Microsoft Option ROM UEFI
CA 2023: 514fbf937fa46fb57bf07af8bed84b3b864b1711'
[    1.540178] PM:   Magic number: 6:852:819
[    1.540453] RAS: Correctable Errors collector initialized.
[    1.540594] clk: Disabling unused clocks
[    1.540596] PM: genpd: Disabling unused power domains
[    1.541566] Freeing unused decrypted memory: 2028K
[    1.542143] Freeing unused kernel image (initmem) memory: 5384K
[    1.542182] Write protecting the kernel read-only data: 43008k
[    1.542717] Freeing unused kernel image (text/rodata gap) memory: 660K
[    1.542989] Freeing unused kernel image (rodata/data gap) memory: 1000K
[    1.556516] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.556523] Run /init as init process
[    1.556525]   with arguments:
[    1.556526]     /init
[    1.556527]     splash
[    1.556528]   with environment:
[    1.556529]     HOME=3D/
[    1.556530]     TERM=3Dlinux
[    1.651719] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.659015] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.659447] e1000e: Intel(R) PRO/1000 Network Driver
[    1.659450] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.660212] e1000e 0000:00:1f.6: Interrupt Throttling Rate
(ints/sec) set to dynamic conservative mode
[    1.664126] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[    1.671428] Key type psk registered
[    1.671843] ahci 0000:00:17.0: AHCI vers 0001.0301, 32 command
slots, 6 Gbps, SATA mode
[    1.671848] ahci 0000:00:17.0: 1/1 ports implemented (port mask 0x4)
[    1.671850] ahci 0000:00:17.0: flags: 64bit ncq sntf pm clo only
pio slum part deso sadm sds apst
[    1.672438] scsi host0: ahci
[    1.672653] scsi host1: ahci
[    1.672807] scsi host2: ahci
[    1.672871] ata1: DUMMY
[    1.672873] ata2: DUMMY
[    1.672878] ata3: SATA max UDMA/133 abar m2048@0x56322000 port
0x56322200 irq 144 lpm-pol 4
[    1.673426] intel-lpss 0000:00:15.2: enabling device (0004 -> 0006)
[    1.673449] ACPI: bus type thunderbolt registered
[    1.673593] thunderbolt 0000:03:00.0: total paths: 12
[    1.673598] thunderbolt 0000:03:00.0: IOMMU DMA protection is enabled
[    1.673767] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.673900] thunderbolt 0000:03:00.0: allocating TX ring 0 of size 10
[    1.673926] thunderbolt 0000:03:00.0: allocating RX ring 0 of size 10
[    1.673945] thunderbolt 0000:03:00.0: control channel created
[    1.673949] thunderbolt 0000:03:00.0: using firmware connection manager
[    1.673950] thunderbolt 0000:03:00.0: NHI initialized, starting thunderb=
olt
[    1.673951] thunderbolt 0000:03:00.0: control channel starting...
[    1.673953] thunderbolt 0000:03:00.0: starting TX ring 0
[    1.673960] thunderbolt 0000:03:00.0: enabling interrupt at
register 0x38200 bit 0 (0x0 -> 0x1)
[    1.673962] thunderbolt 0000:03:00.0: starting RX ring 0
[    1.673968] thunderbolt 0000:03:00.0: enabling interrupt at
register 0x38200 bit 12 (0x1 -> 0x1001)
[    1.790300] usb 1-1: New USB device found, idVendor=3D1b1c,
idProduct=3D1bfe, bcdDevice=3D15.02
[    1.790307] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    1.790309] usb 1-1: Product: CORSAIR K55 CORE RGB Gaming Keyboard
[    1.790311] usb 1-1: Manufacturer: Corsair
[    1.790313] usb 1-1: SerialNumber: AD0000001200600049EFC6308EC50000
[    1.853299] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized):
registered PHC clock
[    1.904298] usb 1-2: new full-speed USB device number 3 using xhci_hcd
[    1.918893] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width
x1) 1c:69:7a:60:ca:9f
[    1.918908] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connecti=
on
[    1.919066] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No: FFFFFF-0=
FF
[    1.984938] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.985197] ata3.00: ATA-11: KINGSTON SA400S37480G, SBFKB1D1, max UDMA/1=
33
[    1.985271] ata3.00: 937703088 sectors, multi 16: LBA48 NCQ (depth 32), =
AA
[    1.985694] ata3.00: Features: DIPM
[    1.986144] ata3.00: configured for UDMA/133
[    1.996783] scsi 2:0:0:0: Direct-Access     ATA      KINGSTON
SA400S3 B1D1 PQ: 0 ANSI: 5
[    1.997617] sd 2:0:0:0: Attached scsi generic sg0 type 0
[    1.997877] sd 2:0:0:0: [sda] 937703088 512-byte logical blocks:
(480 GB/447 GiB)
[    1.997934] sd 2:0:0:0: [sda] Write Protect is off
[    1.997946] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.997997] sd 2:0:0:0: [sda] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    1.998059] sd 2:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    2.015419]  sda: sda1
[    2.015815] sd 2:0:0:0: [sda] Attached SCSI disk
[    2.021621] e1000e 0000:00:1f.6 eno1: renamed from eth0
[    2.022870] nvme nvme0: pci function 0000:3a:00.0
[    2.024666] sdhci-pci 0000:3b:00.0: SDHCI controller found
[17a0:9755] (rev 0)
[    2.024691] sdhci-pci 0000:3b:00.0: enabling device (0000 -> 0002)
[    2.027727] nvme nvme0: missing or invalid SUBNQN field.
[    2.033075] usb 1-2: New USB device found, idVendor=3D1b1c,
idProduct=3D1ba6, bcdDevice=3D 5.06
[    2.033079] usb 1-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    2.033081] usb 1-2: Product: CORSAIR SLIPSTREAM WIRELESS USB Receiver
[    2.033083] usb 1-2: Manufacturer: Corsair
[    2.033084] usb 1-2: SerialNumber: B3DD53DB6DFC7151
[    2.052435] nvme nvme0: passthrough uses implicit buffer lengths
[    2.054546] nvme nvme0: allocated 32 MiB host memory buffer (1 segment).
[    2.056063] mmc0: SDHCI controller on PCI [0000:3b:00.0] using ADMA 64-b=
it
[    2.080286] nvme nvme0: 8/0/0 default/read/poll queues
[    2.085169] nvme nvme0: Ignoring bogus Namespace Identifiers
[    2.088970]  nvme0n1: p1 p2
[    2.148170] usb 1-4: new full-speed USB device number 4 using xhci_hcd
[    2.273465] usb 1-4: New USB device found, idVendor=3D1532,
idProduct=3D0550, bcdDevice=3D 0.01
[    2.273483] usb 1-4: New USB device strings: Mfr=3D0, Product=3D2, Seria=
lNumber=3D3
[    2.273490] usb 1-4: Product: Razer Barracuda X 2.4
[    2.273495] usb 1-4: SerialNumber: O001000007
[    2.367261] tsc: Refined TSC clocksource calibration: 1608.000 MHz
[    2.367294] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x172daa3a18b, max_idle_ns: 440795212390 ns
[    2.367724] clocksource: Switched to clocksource tsc
[    2.389465] usb 1-10: new full-speed USB device number 5 using xhci_hcd
[    2.515813] usb 1-10: New USB device found, idVendor=3D8087,
idProduct=3D0026, bcdDevice=3D 0.02
[    2.515832] usb 1-10: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D0
[    2.531297] hid: raw HID events driver (C) Jiri Kosina
[    2.542861] usbcore: registered new interface driver usbhid
[    2.542865] usbhid: USB HID core driver
[    2.544939] input: Corsair CORSAIR K55 CORE RGB Gaming Keyboard as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:1B1C:1BFE.0001/input=
/input3
[    2.595767] hid-generic 0003:1B1C:1BFE.0001: input,hidraw0: USB HID
v1.10 Keyboard [Corsair CORSAIR K55 CORE RGB Gaming Keyboard] on
usb-0000:00:14.0-1/input0
[    2.595971] hid-generic 0003:1B1C:1BFE.0002: hiddev0,hidraw1: USB
HID v1.10 Device [Corsair CORSAIR K55 CORE RGB Gaming Keyboard] on
usb-0000:00:14.0-1/input1
[    2.596086] hid-generic 0003:1B1C:1BFE.0003: hiddev1,hidraw2: USB
HID v1.10 Device [Corsair CORSAIR K55 CORE RGB Gaming Keyboard] on
usb-0000:00:14.0-1/input2
[    2.596233] input: Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver
as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:1B1C:1BA6.0004/in=
put/input4
[    2.596319] hid-generic 0003:1B1C:1BA6.0004: input,hidraw3: USB HID
v1.11 Mouse [Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver] on
usb-0000:00:14.0-2/input0
[    2.596449] hid-generic 0003:1B1C:1BA6.0005: hiddev2,hidraw4: USB
HID v1.11 Device [Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver] on
usb-0000:00:14.0-2/input1
[    2.596555] hid-generic 0003:1B1C:1BA6.0006: hiddev3,hidraw5: USB
HID v1.11 Device [Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver] on
usb-0000:00:14.0-2/input2
[    2.596784] input: Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver
Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.5/0003:1B1C:1BA=
6.0007/input/input5
[    2.648036] hid-generic 0003:1B1C:1BA6.0007: input,hidraw6: USB HID
v1.11 Keyboard [Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver] on
usb-0000:00:14.0-2/input5
[    2.648473] input: Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver
as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.4/0003:1B1C:1BA6.0008/in=
put/input6
[    2.648787] hid-generic 0003:1B1C:1BA6.0008: input,hidraw7: USB HID
v1.11 Mouse [Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver] on
usb-0000:00:14.0-2/input4
[    2.649751] input: Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver
Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.3/0003:1B1C:1BA=
6.0009/input/input7
[    2.701053] hid-generic 0003:1B1C:1BA6.0009: input,hidraw8: USB HID
v1.11 Keyboard [Corsair CORSAIR SLIPSTREAM WIRELESS USB Receiver] on
usb-0000:00:14.0-2/input3
[    2.701600] input: Razer Barracuda X 2.4 Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.3/0003:1532:0550.000A/input=
/input8
[    2.753249] hid-generic 0003:1532:0550.000A: input,hiddev4,hidraw9:
USB HID v1.10 Device [Razer Barracuda X 2.4] on
usb-0000:00:14.0-4/input3
[    3.082663] thunderbolt 0000:03:00.0: security level set to user
[    3.083196] thunderbolt 0000:03:00.0: current switch config:
[    3.083209] thunderbolt 0000:03:00.0:  Thunderbolt 3 Switch:
8086:15e7 (Revision: 6, TB Version: 16)
[    3.083220] thunderbolt 0000:03:00.0:   Max Port Number: 13
[    3.083227] thunderbolt 0000:03:00.0:   Config:
[    3.083232] thunderbolt 0000:03:00.0:    Upstream Port Number: 7
Depth: 0 Route String: 0x0 Enabled: 1, PlugEventsDelay: 254ms
[    3.083240] thunderbolt 0000:03:00.0:    unknown1: 0x0 unknown4: 0x0
[    3.131610] thunderbolt 0000:03:00.0: 0: DROM version: 1
[    3.132378] thunderbolt 0000:03:00.0: 0: uid: 0x80868bcc4ca82d00
[    3.134297] thunderbolt 0000:03:00.0:  Port 1: 8086:15e7 (Revision:
6, TB Version: 1, Type: Port (0x1))
[    3.134300] thunderbolt 0000:03:00.0:   Max hop id (in/out): 19/19
[    3.134301] thunderbolt 0000:03:00.0:   Max counters: 16
[    3.134302] thunderbolt 0000:03:00.0:   NFC Credits: 0x7800000
[    3.134303] thunderbolt 0000:03:00.0:   Credits (total/control): 120/2
[    3.136217] thunderbolt 0000:03:00.0:  Port 2: 8086:15e7 (Revision:
6, TB Version: 1, Type: Port (0x1))
[    3.136219] thunderbolt 0000:03:00.0:   Max hop id (in/out): 19/19
[    3.136220] thunderbolt 0000:03:00.0:   Max counters: 16
[    3.136221] thunderbolt 0000:03:00.0:   NFC Credits: 0x0
[    3.136222] thunderbolt 0000:03:00.0:   Credits (total/control): 0/2
[    3.136223] thunderbolt 0000:03:00.0: 0:3: disabled by eeprom
[    3.136224] thunderbolt 0000:03:00.0: 0:4: disabled by eeprom
[    3.136473] thunderbolt 0000:03:00.0:  Port 5: 8086:15e7 (Revision:
6, TB Version: 1, Type: DP/HDMI (0xe0101))
[    3.136474] thunderbolt 0000:03:00.0:   Max hop id (in/out): 255/255
[    3.136476] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.136477] thunderbolt 0000:03:00.0:   NFC Credits: 0x1800000
[    3.136478] thunderbolt 0000:03:00.0:   Credits (total/control): 24/0
[    3.136729] thunderbolt 0000:03:00.0:  Port 6: 8086:15e7 (Revision:
6, TB Version: 1, Type: DP/HDMI (0xe0101))
[    3.136730] thunderbolt 0000:03:00.0:   Max hop id (in/out): 255/255
[    3.136731] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.136732] thunderbolt 0000:03:00.0:   NFC Credits: 0x1800000
[    3.136733] thunderbolt 0000:03:00.0:   Credits (total/control): 24/0
[    3.136734] thunderbolt 0000:03:00.0: 0:7: disabled by eeprom
[    3.136984] thunderbolt 0000:03:00.0:  Port 8: 8086:15e7 (Revision:
6, TB Version: 1, Type: PCIe (0x100101))
[    3.136986] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.136987] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.136988] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.136989] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.137241] thunderbolt 0000:03:00.0:  Port 9: 8086:15e7 (Revision:
6, TB Version: 1, Type: PCIe (0x100101))
[    3.137242] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.137243] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.137244] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.137245] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.137246] thunderbolt 0000:03:00.0: 0:10: disabled by eeprom
[    3.137247] thunderbolt 0000:03:00.0: 0:11: disabled by eeprom
[    3.137497] thunderbolt 0000:03:00.0:  Port 12: 8086:15ea
(Revision: 6, TB Version: 1, Type: Inactive (0x0))
[    3.137498] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.137499] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.137500] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.137501] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.137753] thunderbolt 0000:03:00.0:  Port 13: 8086:15ea
(Revision: 6, TB Version: 1, Type: Inactive (0x0))
[    3.137754] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.137755] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.137756] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.137757] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.137793] thunderbolt 0000:03:00.0: 0: NVM version 42.0
[    3.138590] thunderbolt 0000:03:00.0: current switch config:
[    3.138592] thunderbolt 0000:03:00.0:  USB4 Switch: 8087:5786
(Revision: 133, TB Version: 64)
[    3.138594] thunderbolt 0000:03:00.0:   Max Port Number: 23
[    3.138596] thunderbolt 0000:03:00.0:   Config:
[    3.138597] thunderbolt 0000:03:00.0:    Upstream Port Number: 1
Depth: 1 Route String: 0x1 Enabled: 1, PlugEventsDelay: 254ms
[    3.138598] thunderbolt 0000:03:00.0:    unknown1: 0x0 unknown4: 0x0
[    3.153542] thunderbolt 0000:03:00.0: 1: DROM version: 1
[    3.156461] thunderbolt 0000:03:00.0: 1: uid: 0xf87e040080877eba
[    3.158328] thunderbolt 0000:03:00.0:  Port 1: 0:5780 (Revision: 0,
TB Version: 1, Type: Port (0x1))
[    3.158331] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.158332] thunderbolt 0000:03:00.0:   Max counters: 4
[    3.158333] thunderbolt 0000:03:00.0:   NFC Credits: 0x4a000000
[    3.158334] thunderbolt 0000:03:00.0:   Credits (total/control): 160/2
[    3.159859] thunderbolt 0000:03:00.0:  Port 2: 0:5780 (Revision: 0,
TB Version: 1, Type: Port (0x1))
[    3.159861] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.159862] thunderbolt 0000:03:00.0:   Max counters: 0
[    3.159863] thunderbolt 0000:03:00.0:   NFC Credits: 0x4a000000
[    3.159864] thunderbolt 0000:03:00.0:   Credits (total/control): 160/2
[    3.161780] thunderbolt 0000:03:00.0:  Port 3: 0:5780 (Revision: 0,
TB Version: 1, Type: Port (0x1))
[    3.161782] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.161783] thunderbolt 0000:03:00.0:   Max counters: 4
[    3.161784] thunderbolt 0000:03:00.0:   NFC Credits: 0x8a000000
[    3.161785] thunderbolt 0000:03:00.0:   Credits (total/control): 160/2
[    3.163541] thunderbolt 0000:03:00.0:  Port 4: 0:5780 (Revision: 0,
TB Version: 1, Type: Port (0x1))
[    3.163543] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.163544] thunderbolt 0000:03:00.0:   Max counters: 0
[    3.163545] thunderbolt 0000:03:00.0:   NFC Credits: 0xa000000
[    3.163546] thunderbolt 0000:03:00.0:   Credits (total/control): 160/2
[    3.165440] thunderbolt 0000:03:00.0:  Port 5: 0:5780 (Revision: 0,
TB Version: 1, Type: Inactive (0x0))
[    3.165441] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.165442] thunderbolt 0000:03:00.0:   Max counters: 4
[    3.165443] thunderbolt 0000:03:00.0:   NFC Credits: 0x8a000000
[    3.165444] thunderbolt 0000:03:00.0:   Credits (total/control): 160/0
[    3.166608] thunderbolt 0000:03:00.0:  Port 6: 0:5780 (Revision: 0,
TB Version: 1, Type: Inactive (0x0))
[    3.166610] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.166611] thunderbolt 0000:03:00.0:   Max counters: 0
[    3.166612] thunderbolt 0000:03:00.0:   NFC Credits: 0xa000000
[    3.166613] thunderbolt 0000:03:00.0:   Credits (total/control): 160/0
[    3.168546] thunderbolt 0000:03:00.0:  Port 7: 0:5780 (Revision: 0,
TB Version: 1, Type: Inactive (0x0))
[    3.168548] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.168549] thunderbolt 0000:03:00.0:   Max counters: 4
[    3.168550] thunderbolt 0000:03:00.0:   NFC Credits: 0x8a000000
[    3.168551] thunderbolt 0000:03:00.0:   Credits (total/control): 160/0
[    3.169752] thunderbolt 0000:03:00.0:  Port 8: 0:5780 (Revision: 0,
TB Version: 1, Type: Inactive (0x0))
[    3.169754] thunderbolt 0000:03:00.0:   Max hop id (in/out): 31/31
[    3.169755] thunderbolt 0000:03:00.0:   Max counters: 0
[    3.169756] thunderbolt 0000:03:00.0:   NFC Credits: 0xa000000
[    3.169757] thunderbolt 0000:03:00.0:   Credits (total/control): 160/0
[    3.170138] thunderbolt 0000:03:00.0:  Port 9: 0:5780 (Revision: 0,
TB Version: 1, Type: PCIe (0x100102))
[    3.170140] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.170141] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.170142] thunderbolt 0000:03:00.0:   NFC Credits: 0x40800000
[    3.170143] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.170538] thunderbolt 0000:03:00.0:  Port 10: 0:5780 (Revision:
0, TB Version: 1, Type: PCIe (0x100101))
[    3.170539] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.170540] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.170541] thunderbolt 0000:03:00.0:   NFC Credits: 0x40800000
[    3.170542] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.171690] thunderbolt 0000:03:00.0:  Port 11: 0:5780 (Revision:
0, TB Version: 1, Type: DP/HDMI (0xe0102))
[    3.171694] thunderbolt 0000:03:00.0:   Max hop id (in/out): 9/9
[    3.171696] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.171697] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.171698] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.172474] thunderbolt 0000:03:00.0:  Port 12: 0:5780 (Revision:
0, TB Version: 1, Type: DP/HDMI (0xe0102))
[    3.172477] thunderbolt 0000:03:00.0:   Max hop id (in/out): 9/9
[    3.172478] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.172479] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.172480] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.172481] thunderbolt 0000:03:00.0: 1:13: disabled by eeprom
[    3.172482] thunderbolt 0000:03:00.0: 1:14: disabled by eeprom
[    3.172677] thunderbolt 0000:03:00.0:  Port 15: not implemented
[    3.172678] thunderbolt 0000:03:00.0: 1:16: disabled by eeprom
[    3.173073] thunderbolt 0000:03:00.0:  Port 17: 0:5780 (Revision:
0, TB Version: 1, Type: Inactive (0x0))
[    3.173076] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.173078] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.173079] thunderbolt 0000:03:00.0:   NFC Credits: 0x40800000
[    3.173080] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.173512] thunderbolt 0000:03:00.0:  Port 18: 0:5780 (Revision:
0, TB Version: 1, Type: Inactive (0x0))
[    3.173516] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.173518] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.173519] thunderbolt 0000:03:00.0:   NFC Credits: 0x40800000
[    3.173520] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.174320] thunderbolt 0000:03:00.0:  Port 19: 0:5780 (Revision:
0, TB Version: 1, Type: DP/HDMI (0xe0102))
[    3.174324] thunderbolt 0000:03:00.0:   Max hop id (in/out): 9/9
[    3.174325] thunderbolt 0000:03:00.0:   Max counters: 2
[    3.174326] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.174327] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.174709] thunderbolt 0000:03:00.0:  Port 20: 0:5780 (Revision:
0, TB Version: 1, Type: USB (0x200102))
[    3.174711] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.174712] thunderbolt 0000:03:00.0:   Max counters: 1
[    3.174713] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.174714] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.175108] thunderbolt 0000:03:00.0:  Port 21: 0:5780 (Revision:
0, TB Version: 1, Type: USB (0x200101))
[    3.175110] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.175111] thunderbolt 0000:03:00.0:   Max counters: 1
[    3.175112] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.175113] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.175476] thunderbolt 0000:03:00.0:  Port 22: 0:5780 (Revision:
0, TB Version: 1, Type: USB (0x200101))
[    3.175478] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.175479] thunderbolt 0000:03:00.0:   Max counters: 1
[    3.175480] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.175481] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.175866] thunderbolt 0000:03:00.0:  Port 23: 0:5780 (Revision:
0, TB Version: 1, Type: USB (0x200101))
[    3.175868] thunderbolt 0000:03:00.0:   Max hop id (in/out): 8/8
[    3.175869] thunderbolt 0000:03:00.0:   Max counters: 1
[    3.175870] thunderbolt 0000:03:00.0:   NFC Credits: 0x800000
[    3.175871] thunderbolt 0000:03:00.0:   Credits (total/control): 8/0
[    3.175872] thunderbolt 0000:03:00.0: 1: running
quirk_usb3_maximum_bandwidth [thunderbolt]
[    3.177840] thunderbolt 0-1: new device found, vendor=3D0x41f device=3D0=
xd002
[    3.177842] thunderbolt 0-1: Micro Computer (HK) Tech. Ltd. TBGAA
[    3.177864] thunderbolt 0000:03:00.0: 1: NVM version 62.42
[    3.261109] EXT4-fs (nvme0n1p2): mounted filesystem
b0c932f0-3e9f-449a-97aa-be8967f0406e ro with ordered data mode. Quota
mode: none.
[    3.458291] systemd[1]: Inserted module 'autofs4'
[    3.501621] systemd[1]: systemd 255.4-1ubuntu8.16 running in system
mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT
-GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC
+KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT +QRENCODE
+TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP
+SYSVINIT default-hierarchy=3Dunified)
[    3.501627] systemd[1]: Detected architecture x86-64.
[    3.504232] systemd[1]: Hostname set to <david-NUC10i7FNH>.
[    3.799599] systemd[1]: Queued start job for default target graphical.ta=
rget.
[    3.811014] systemd[1]: Created slice machine.slice - Virtual
Machine and Container Slice.
[    3.811889] systemd[1]: Created slice system-modprobe.slice - Slice
/system/modprobe.
[    3.812148] systemd[1]: Created slice system-systemd\x2dfsck.slice
- Slice /system/systemd-fsck.
[    3.812314] systemd[1]: Created slice user.slice - User and Session Slic=
e.
[    3.812361] systemd[1]: Started systemd-ask-password-wall.path -
Forward Password Requests to Wall Directory Watch.
[    3.812506] systemd[1]: Set up automount
proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats
File System Automount Point.
[    3.812522] systemd[1]: Expecting device
dev-disk-by\x2duuid-F970\x2d9EBA.device -
/dev/disk/by-uuid/F970-9EBA...
[    3.812540] systemd[1]: Reached target integritysetup.target -
Local Integrity Protected Volumes.
[    3.812563] systemd[1]: Reached target remote-fs.target - Remote
File Systems.
[    3.812570] systemd[1]: Reached target slices.target - Slice Units.
[    3.812580] systemd[1]: Reached target snapd.mounts-pre.target -
Mounting snaps.
[    3.812599] systemd[1]: Reached target veritysetup.target - Local
Verity Protected Volumes.
[    3.812610] systemd[1]: Reached target virt-guest-shutdown.target -
libvirt guests shutdown target.
[    3.812676] systemd[1]: Listening on dm-event.socket -
Device-mapper event daemon FIFOs.
[    3.812756] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2
poll daemon socket.
[    3.812840] systemd[1]: Listening on syslog.socket - Syslog Socket.
[    3.812896] systemd[1]: Listening on systemd-fsckd.socket - fsck to
fsckd communication Socket.
[    3.812936] systemd[1]: Listening on systemd-initctl.socket -
initctl Compatibility Named Pipe.
[    3.813002] systemd[1]: Listening on
systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    3.813076] systemd[1]: Listening on systemd-journald.socket -
Journal Socket.
[    3.813201] systemd[1]: Listening on systemd-oomd.socket -
Userspace Out-Of-Memory (OOM) Killer Socket.
[    3.813232] systemd[1]: systemd-pcrextend.socket - TPM2 PCR
Extension (Varlink) was skipped because of an unmet condition check
(ConditionSecurity=3Dmeasured-uki).
[    3.813311] systemd[1]: Listening on systemd-udevd-control.socket -
udev Control Socket.
[    3.813368] systemd[1]: Listening on systemd-udevd-kernel.socket -
udev Kernel Socket.
[    3.814565] systemd[1]: Mounting dev-hugepages.mount - Huge Pages
File System...
[    3.815013] systemd[1]: Mounting dev-mqueue.mount - POSIX Message
Queue File System...
[    3.815534] systemd[1]: Mounting sys-kernel-debug.mount - Kernel
Debug File System...
[    3.815987] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel
Trace File System...
[    3.818228] systemd[1]: Starting systemd-journald.service - Journal
Service...
[    3.818332] systemd[1]: Finished blk-availability.service -
Availability of block devices.
[    3.819050] systemd[1]: Starting keyboard-setup.service - Set the
console keyboard layout...
[    3.819939] systemd[1]: Starting kmod-static-nodes.service - Create
List of Static Device Nodes...
[    3.820734] systemd[1]: Starting lvm2-monitor.service - Monitoring
of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    3.821596] systemd[1]: Starting modprobe@configfs.service - Load
Kernel Module configfs...
[    3.822424] systemd[1]: Starting modprobe@dm_mod.service - Load
Kernel Module dm_mod...
[    3.823120] systemd[1]: Starting modprobe@drm.service - Load Kernel
Module drm...
[    3.823900] systemd[1]: Starting modprobe@efi_pstore.service - Load
Kernel Module efi_pstore...
[    3.824473] systemd[1]: Starting modprobe@fuse.service - Load
Kernel Module fuse...
[    3.825166] systemd[1]: Starting modprobe@loop.service - Load
Kernel Module loop...
[    3.825304] systemd[1]: systemd-fsck-root.service - File System
Check on Root Device was skipped because of an unmet condition check
(ConditionPathExists=3D!/run/initramfs/fsck-root).
[    3.827203] systemd[1]: Starting systemd-modules-load.service -
Load Kernel Modules...
[    3.827234] systemd[1]: systemd-pcrmachine.service - TPM2 PCR
Machine ID Measurement was skipped because of an unmet condition check
(ConditionSecurity=3Dmeasured-uki).
[    3.828092] systemd[1]: Starting systemd-remount-fs.service -
Remount Root and Kernel File Systems...
[    3.828167] systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK
Setup (Early) was skipped because of an unmet condition check
(ConditionSecurity=3Dmeasured-uki).
[    3.828969] systemd[1]: Starting systemd-udev-trigger.service -
Coldplug All udev Devices...
[    3.829677] pstore: Using crash dump compression: deflate
[    3.830267] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File Sy=
stem.
[    3.830378] systemd[1]: Mounted dev-mqueue.mount - POSIX Message
Queue File System.
[    3.830475] systemd[1]: Mounted sys-kernel-debug.mount - Kernel
Debug File System.
[    3.830568] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel
Trace File System.
[    3.830793] systemd[1]: Finished kmod-static-nodes.service - Create
List of Static Device Nodes.
[    3.831078] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    3.831239] systemd[1]: Finished modprobe@configfs.service - Load
Kernel Module configfs.
[    3.831428] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    3.831520] systemd[1]: Finished modprobe@dm_mod.service - Load
Kernel Module dm_mod.
[    3.831674] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    3.831772] systemd[1]: Finished modprobe@drm.service - Load Kernel
Module drm.
[    3.831999] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    3.832138] systemd[1]: Finished modprobe@fuse.service - Load
Kernel Module fuse.
[    3.832343] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    3.832435] systemd[1]: Finished modprobe@loop.service - Load
Kernel Module loop.
[    3.833137] systemd[1]: Mounting sys-fs-fuse-connections.mount -
FUSE Control File System...
[    3.833274] systemd-journald[361]: Collecting audit messages is disabled=
.
[    3.833709] systemd[1]: Mounting sys-kernel-config.mount - Kernel
Configuration File System...
[    3.833752] systemd[1]: systemd-repart.service - Repartition Root
Disk was skipped because no trigger condition checks were met.
[    3.834918] systemd[1]: Starting
systemd-tmpfiles-setup-dev-early.service - Create Static Device Nodes
in /dev gracefully...
[    3.837938] systemd[1]: Mounted sys-fs-fuse-connections.mount -
FUSE Control File System.
[    3.838057] systemd[1]: Mounted sys-kernel-config.mount - Kernel
Configuration File System.
[    3.838139] pstore: Registered efi_pstore as persistent store backend
[    3.838595] systemd[1]: modprobe@efi_pstore.service: Deactivated
successfully.
[    3.838768] systemd[1]: Finished modprobe@efi_pstore.service - Load
Kernel Module efi_pstore.
[    3.842811] EXT4-fs (nvme0n1p2): re-mounted
b0c932f0-3e9f-449a-97aa-be8967f0406e r/w.
[    3.843471] lp: driver loaded but no devices found
[    3.843740] systemd[1]: Finished systemd-remount-fs.service -
Remount Root and Kernel File Systems.
[    3.844487] systemd[1]: Activating swap swap.img.swap - /swap.img...
[    3.845038] systemd[1]: systemd-hwdb-update.service - Rebuild
Hardware Database was skipped because of an unmet condition check
(ConditionNeedsUpdate=3D/etc).
[    3.845080] systemd[1]: systemd-pstore.service - Platform
Persistent Storage Archival was skipped because of an unmet condition
check (ConditionDirectoryNotEmpty=3D/sys/fs/pstore).
[    3.845875] systemd[1]: Starting systemd-random-seed.service -
Load/Save OS Random Seed...
[    3.845889] systemd[1]: systemd-tpm2-setup.service - TPM2 SRK Setup
was skipped because of an unmet condition check
(ConditionSecurity=3Dmeasured-uki).
[    3.845987] ppdev: user-space parallel port driver
[    3.852630] Adding 8388604k swap on /swap.img.  Priority:-1
extents:5 across:8912892k SS
[    3.852679] systemd[1]: Activated swap swap.img.swap - /swap.img.
[    3.852741] systemd[1]: Reached target swap.target - Swaps.
[    3.861425] systemd[1]: Finished systemd-modules-load.service -
Load Kernel Modules.
[    3.861598] systemd[1]: Finished systemd-random-seed.service -
Load/Save OS Random Seed.
[    3.881326] systemd[1]: Starting systemd-sysctl.service - Apply
Kernel Variables...
[    3.881532] systemd[1]: Finished keyboard-setup.service - Set the
console keyboard layout.
[    3.881712] systemd[1]: Finished
systemd-tmpfiles-setup-dev-early.service - Create Static Device Nodes
in /dev gracefully.
[    3.881801] systemd[1]: systemd-sysusers.service - Create System
Users was skipped because no trigger condition checks were met.
[    3.882422] systemd[1]: Starting systemd-tmpfiles-setup-dev.service
- Create Static Device Nodes in /dev...
[    3.889746] systemd[1]: Finished systemd-tmpfiles-setup-dev.service
- Create Static Device Nodes in /dev.
[    3.890819] systemd[1]: Starting systemd-udevd.service - Rule-based
Manager for Device Events and Files...
[    3.891623] systemd[1]: Finished systemd-sysctl.service - Apply
Kernel Variables.
[    3.903636] systemd[1]: Started systemd-journald.service - Journal Servi=
ce.
[    3.910248] systemd-journald[361]: Received client request to flush
runtime journal.
[    3.924348] loop0: detected capacity change from 0 to 151464
[    3.926220] loop1: detected capacity change from 0 to 151512
[    3.928035] loop2: detected capacity change from 0 to 136816
[    3.930304] loop3: detected capacity change from 0 to 8
[    3.932345] loop4: detected capacity change from 0 to 515416
[    3.934294] loop5: detected capacity change from 0 to 527808
[    3.938424] loop6: detected capacity change from 0 to 37864
[    3.940129] loop7: detected capacity change from 0 to 33792
[    3.941107] systemd-journald[361]:
/var/log/journal/0025d2536734429ea00b64222eadaaee/system.journal:
Journal file uses a different sequence number ID, rotating.
[    3.941114] systemd-journald[361]: Rotating system journal.
[    3.946027] loop8: detected capacity change from 0 to 1088496
[    3.947649] loop9: detected capacity change from 0 to 1088256
[    4.102158] intel_pch_thermal 0000:00:12.0: enabling device (0000 -> 000=
2)
[    4.108302] acpi-tad ACPI000E:00: registered as rtc1
[    4.153579] intel_pmc_core INT33A1:00:  initialized
[    4.178174] mc: Linux media interface: v0.10
[    4.191552] Serial bus multi instantiate pseudo device driver
INT3515:02: Instantiated 1 I2C devices.
[    4.240873] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    4.250187] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    4.250443] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.250572] Loaded X.509 cert 'wens:
61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    4.284418] Bluetooth: Core ver 2.22
[    4.284450] NET: Registered PF_BLUETOOTH protocol family
[    4.284453] Bluetooth: HCI device and connection manager initialized
[    4.284461] Bluetooth: HCI socket layer initialized
[    4.284463] Bluetooth: L2CAP socket layer initialized
[    4.284466] Bluetooth: SCO socket layer initialized
[    4.853495] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters,
655360 ms ovfl timer
[    4.853500] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    4.853501] RAPL PMU: hw unit of domain package 2^-14 Joules
[    4.853503] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    4.853504] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    4.853505] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    4.864892] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    4.867140] i915 0000:00:02.0: [drm] Found cometlake/ult (device ID
9bca) integrated display version 9.00 stepping N/A
[    4.868054] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    4.869320] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    4.869345] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    4.870216] iwlwifi 0000:00:14.3: Detected crf-id 0x3617, cnv-id
0x20000302 wfpm id 0x80000000
[    4.870240] iwlwifi 0000:00:14.3: PCI dev 02f0/0074, rev=3D0x351, rfid=
=3D0x10a100
[    4.870248] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6 AX201 160MHz
[    4.873462] i2c i2c-2: Successfully instantiated SPD at 0x50
[    4.883552] ee1004 2-0050: 512 byte EE1004-compliant SPD EEPROM, read-on=
ly
[    4.885192] usbcore: registered new interface driver btusb
[    4.887050] spi-nor spi0.0: supply vcc not found, using dummy regulator
[    4.888070] iwlwifi 0000:00:14.3: loaded firmware version
77.b405f9d4.0 QuZ-a0-hr-b0-77.ucode op_mode iwlmvm
[    4.892411] Creating 1 MTD partitions on "0000:00:1f.5":
[    4.892421] 0x000000000000-0x000002000000 : "BIOS"
[    4.894093] i915 0000:00:02.0: vgaarb: deactivate vga console
[    4.894215] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    4.901033] i915 0000:00:02.0: [drm] Finished loading DMC firmware
i915/kbl_dmc_ver1_04.bin (v1.4)
[    4.902516] i915 0000:00:02.0: vgaarb: VGA decodes changed:
olddecodes=3Dio+mem,decodes=3Dio:owns=3Dio+mem
[    4.903161] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
[    4.903361] Bluetooth: hci0: Boot Address: 0x24800
[    4.903364] Bluetooth: hci0: Firmware Version: 249-27.23
[    4.903365] Bluetooth: hci0: Firmware already loaded
[    4.906894] Bluetooth: hci0: HCI LE Coded PHY feature bit is set,
but its usage is not supported.
[    4.918235] mei_hdcp
0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0
(ops i915_hdcp_ops [i915])
[    4.921377] audit: type=3D1400 audit(1786081846.986:2):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"ch-checkns" pid=3D729 comm=3D"apparmor_parser"
[    4.921380] audit: type=3D1400 audit(1786081846.986:3):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"chrome" pid=3D731 comm=3D"apparmor_parser"
[    4.921382] audit: type=3D1400 audit(1786081846.986:4):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"bitwarden" pid=3D725 comm=3D"apparmor_parser"
[    4.921384] audit: type=3D1400 audit(1786081846.986:5):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D4D6F6E676F444220436F6D70617373 pid=3D722 comm=3D"apparmor_parser"
[    4.921386] audit: type=3D1400 audit(1786081846.986:6):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"brave" pid=3D726 comm=3D"apparmor_parser"
[    4.921387] audit: type=3D1400 audit(1786081846.986:7):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"cam" pid=3D728 comm=3D"apparmor_parser"
[    4.921389] audit: type=3D1400 audit(1786081846.986:8):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"balena-etcher" pid=3D724 comm=3D"apparmor_parser"
[    4.921391] audit: type=3D1400 audit(1786081846.986:9):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"QtWebEngineProcess" pid=3D723 comm=3D"apparmor_parser"
[    4.921393] audit: type=3D1400 audit(1786081846.986:10):
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"
name=3D"Discord" pid=3D721 comm=3D"apparmor_parser"
[    4.961013] i915 0000:00:02.0: [drm] Registered 3 planes with drm panic
[    4.973116] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 1
[    4.976186] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
no  post: no)
[    4.976707] input: Video Bus as
/devices/pci0000:00/acpi.video_bus.0/input/input10
[    5.061775] fbcon: i915drmfb (fb0) is primary device
[    5.061780] fbcon: Deferring console take-over
[    5.061784] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    5.103491] usbcore: registered new interface driver snd-usb-audio
[    5.142409] intel_rapl_common: Found RAPL domain package
[    5.142413] intel_rapl_common: Found RAPL domain core
[    5.142415] intel_rapl_common: Found RAPL domain uncore
[    5.142416] intel_rapl_common: Found RAPL domain dram
[    5.142418] intel_rapl_common: Found RAPL domain psys
[    5.204473] iwlwifi 0000:00:14.3: Detected RF HR B3, rfid=3D0x10a100
[    5.206637] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    5.270962] iwlwifi 0000:00:14.3: base HW address: 98:af:65:84:11:24
[    5.289732] iwlwifi 0000:00:14.3 wlp0s20f3: renamed from wlan0
[    5.357181] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
intel_audio_component_bind_ops [i915])
[    5.425310] snd_hda_codec_alc269 hdaudioC0D0: ALC256: picked fixup
for PCI SSID 8086:2081
[    5.425850] snd_hda_codec_alc269 hdaudioC0D0: autoconfig for
ALC256: line_outs=3D1 (0x21/0x0/0x0/0x0/0x0) type:hp
[    5.425857] snd_hda_codec_alc269 hdaudioC0D0:    speaker_outs=3D0
(0x0/0x0/0x0/0x0/0x0)
[    5.425861] snd_hda_codec_alc269 hdaudioC0D0:    hp_outs=3D0
(0x0/0x0/0x0/0x0/0x0)
[    5.425864] snd_hda_codec_alc269 hdaudioC0D0:    mono: mono_out=3D0x0
[    5.425867] snd_hda_codec_alc269 hdaudioC0D0:    inputs:
[    5.425869] snd_hda_codec_alc269 hdaudioC0D0:      Internal Mic=3D0x12
[    5.425872] snd_hda_codec_alc269 hdaudioC0D0:      Internal Mic=3D0x13
[    5.425874] snd_hda_codec_alc269 hdaudioC0D0:      Headset Mic=3D0x19
[    5.452428] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    5.452433] Bluetooth: BNEP filters: protocol multicast
[    5.452436] Bluetooth: BNEP socket layer initialized
[    5.457261] Bluetooth: MGMT ver 1.23
[    5.462322] NET: Registered PF_ALG protocol family
[    5.622339] NET: Registered PF_QIPCRTR protocol family
[    5.649898] input: HDA Intel PCH Headphone as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[    5.649960] input: HDA Intel PCH HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[    5.650011] input: HDA Intel PCH HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[    5.650051] input: HDA Intel PCH HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[    5.820281] kauditd_printk_skb: 166 callbacks suppressed
[    5.820285] audit: type=3D1400 audit(1786081847.885:177):
apparmor=3D"STATUS" operation=3D"profile_replace" info=3D"same as current
profile, skipping" profile=3D"unconfined"
name=3D"/usr/lib/snapd/snap-confine" pid=3D1337 comm=3D"apparmor_parser"
[    6.012100] thunderbolt 0000:03:00.0: PCIe tunnel creation failed
[    6.281213] bridge: filtering via arp/ip/ip6tables is no longer
available by default. Update your scripts to load br_netfilter if you
need this.
[    6.328683] audit: type=3D1400 audit(1786081848.393:178):
apparmor=3D"DENIED" operation=3D"capable" class=3D"cap"
profile=3D"/usr/sbin/cupsd" pid=3D1430 comm=3D"cupsd" capability=3D12
capname=3D"net_admin"
[    6.884797] Bluetooth: RFCOMM TTY layer initialized
[    6.884808] Bluetooth: RFCOMM socket layer initialized
[    6.884813] Bluetooth: RFCOMM ver 1.11
[    8.513059] rfkill: input handler disabled
[    9.311932] e1000e 0000:00:1f.6 eno1: NIC Link is Up 1000 Mbps Full
Duplex, Flow Control: None
[    9.316413] br0: port 1(eno1) entered blocking state
[    9.316418] br0: port 1(eno1) entered disabled state
[    9.316434] e1000e 0000:00:1f.6 eno1: entered allmulticast mode
[    9.316571] e1000e 0000:00:1f.6 eno1: entered promiscuous mode
[    9.316683] br0: port 1(eno1) entered blocking state
[    9.316685] br0: port 1(eno1) entered forwarding state
[   17.714741] systemd-journald[361]:
/var/log/journal/0025d2536734429ea00b64222eadaaee/user-1000.journal:
Journal file uses a different sequence number ID, rotating.
[   18.062919] rfkill: input handler enabled
[   19.148531] rfkill: input handler disabled

--- 8< --- end --- 8< ---




Le ven. 7 ao=C3=BBt 2026 =C3=A0 06:37, Mika Westerberg
<mika.westerberg@linux.intel.com> a =C3=A9crit :
>
> Hi,
>
> On Thu, Aug 06, 2026 at 11:48:24PM +0200, David GUENAULT wrote:
> > PCIe tunneling never succeeds between an Intel Titan Ridge 2C host rout=
er
> > and a USB4 (Thunderbolt 5) eGPU dock, although the Thunderbolt link its=
elf
> > comes up fully bonded at 40 Gb/s and both routers enumerate cleanly.
> > tb_tunnel_pci() fails silently -- the only message is "PCIe tunnel crea=
tion
> > failed", with no path/credit/activation diagnostics even with full dynd=
bg.
>
> That's because Titan Ridge is using firmware based connection manager so
> it's not the TB driver that creates the tunnels.
>
> Can you drop all the non-distro kernel command line options, except
> "thunderbolt.dyndbg=3D+p" and provide full dmesg?
