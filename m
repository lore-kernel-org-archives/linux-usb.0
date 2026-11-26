Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683191;
	b=I58jTjqQjvpevAVJNhUaTCu8B2gHJQRS3gQ6PokyoLuDR5LWZUMtlLRNWJ6SDFH2bsXv
	 CVN5crJNX47TyPpupLs6jKwsZfNb9heVKa5Ik/0bBMmmRj6dezS88VLW1B8CTWQAsXkVb
	 NcUudJhgGXngPH4YG6Ae/QxXj4fOs3sI1SWa847ya50BNGHm0KmMxsgBf5+aqd1TLtP4O
	 w6EaHUq/oyO1X0m4eRfYjKAkM95J4EMl17GejkofuBOghHqmFdVyAAzQD42ZlVyQw1N1/
	 huSQ2K8oTF6rhYSND+BF7kwdWCSA64LTWNauLwy8SfODS4wkvZ/ARzDaXp9oEWeDmTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683191;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=c8qlz4Bh4y5oYu09BGKviXfh+x5+0olHZwcREVnh14A=;
	b=wniWdhgf4B9DZD0JjvqIKjqaRgkn07UgjrxZVyd3pCatKa4gT+K427NUrcDvdjy28xce
	 bQ+OUnCLTbQWPwy8KEjzjyGBG/yFc7ivzXapPRO/oCpho6krLoSthr8K/LbCtrjjYFU+7
	 HnIzbjgpIuZIdHP27Xz4eH9HzBJk2umDdL8el5GES+NJ+oDuINPsRhA2sI1LtjGD1dwe+
	 USnMHuKDazjltu+gf41yrbArcm3Jld44an5aM/Qn8FYOCg3Vf4n21oRxpblBTQ8LDe23m
	 k+qn0D2S7cjx4IaOtOe7Ayb6oInwJQr0dTl/++F4IboBa6yZRJlyNb9Weo0C2FveTSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ByI8j0eM;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A75606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ByI8j0eM
DKIM2-Signature:  i=1; m=1; t=1795683186;
 mf=PGFsb2ViYmVydEBnbXguZGU+;
 rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:Xs7ft5U9tkRg+sYqPJQ6QzOWnDTy
   9LSQEiiSChitZuDaBf4nxLsK81rppAvFwYmrSVd/qUTYThVFAOUwf69bWE6lECOWRAj+Lvwozms
   chYUWmeeDcaQ3EERmPurrAeCO3hzN0xaJKpX9U9rVq0bCF+xdG11PffotDnszl9o/yh2BkV31FI
   D0HFE9HQpDZhar800U3yESU6TRDr7lpMR5fWqWTu5yBWPX6dqmGAvQ8pmcxx0QMJ8a7RzU1s3ax
   wNGTnFWs0PM5m9EIi/drlApQ44TRSWg9oFGby1+CNtk6tKGz2k6N/cwgfxl475eFDnxvRiKrOun
   IOK6s9RAFvwjcQ==;
Message-Instance:  m=1;
 h=sha256:
   nH+N45CzmmN1ZtWfZKN2OAEgHhKUEe1rt7E/ZdXw5E0=:
   p0ZzsWGeCqZoWZ4MWIIagrscZATIeFQaFE+nsKMabbc=,
  sha512:
   FGKzMWGnPOqTqW1RAtU80j9LqeB0um6L1Ku0N0qNfJx2GmqxW4fA64KsBIKkbDja8XmZK/uqjgcUq1sHlcaztA==:
   XC4M2MG931FdEyr95nlRivQI9YR2cc+K3pzz0WC45lMqMTja78SfjZgVao8qIGtCRuVE+m/S7gCwFOtx12wrZw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795683186; x=1796287986; i=aloebbert@gmx.de;
	bh=c8qlz4Bh4y5oYu09BGKviXfh+x5+0olHZwcREVnh14A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ByI8j0eMqZ1FyTMdSFCKuJKSIWUWrQ/FV04VMjdu4o7e5UnUkjg7Pgp9FqQceIGz
	 5wY5+FW1i/7VF4KNxWFLSFZXlX3gBSIm/oMZ4s/kMSZUQbVryVRn3TUhTgkm7GCnn
	 6jNNUavtQ+v5AdYWTrXQ/I4ub3Ffy6UDHVwVw2T8PMwcaVEWRMDfwIvob2E4weWUN
	 M7Xe8AhaCafHooDcevZGlvhVmvoWlMBZ3yxQFZy5WrducDkW0TMRffz+Ga/Yw4Br1
	 6ZaED2RADzj2d6FaF1O4Aie8gJ1Ffhz5IVN63f3/7sproytQrP1Izzr4GCm87iIzh
	 98v+WRSbXQJjZFesyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dsb-1yYrwN0znZ-00wuHc; Thu, 26
 Nov 2026 09:53:06 +0100
From: Achim =?UTF-8?B?TMO2YmJlcnQ=?= <aloebbert@gmx.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
Subject:
 Re: [REGRESSION/BUG] thunderbolt: ASM4242 fails to restore DP tunnel after
 resume on Ryzen 8700G (7.4-rc4)
Date: Thu, 26 Nov 2026 09:53:05 +0100
Message-ID: <y0Ed3XDFSA-_b1YnGjn2yQ@gmx.de>
In-Reply-To: <20261126073108.GL191152@black.igk.intel.com>
References:
 <UCVQtIkrSxeOKGOgiChTpA@gmx.de> <20261126073108.GL191152@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPartjbI8-qFWTyyGo-SToscmWg"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:y/NXhti2V4zd0vGsvf/5pt3kdn5Z6Tw33wrFZ6y/1vt5CTiuPGo
 7GAfStNlsE7iZ5ZsSyrz1CRh0d8or6SXx5lX+2Xqi/em/BDRSJl9mSOlvnkr5ZLzwBNxz/2
 ygeItBGC3YGQY3idaA7nbmaSVMGL4vfsloqtFNVfYeBWu4EQJx5TFwRolKEngSwrD0dCUEE
 ODJuDjLDja7t/Ae+ON6xA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Nr25FW7GQl8=;iXAciaGKXh6wPDUOuI/JMHfyV3o
 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

This is a multi-part message in MIME format.

--nextPartjbI8-qFWTyyGo-SToscmWg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

> Can you provide full dmesg without anything non-standard, except
> "thunderbolt.dyndbg=3D+p" in the command line?
>=20
> Once the host router (well any router) is enumerated during resume it is
> expected to send plug events to the DP IN adapters that are available fo=
r
> tunneling. That does not seem to happen here but it would be good to see
> the full dmesg first.

Hi Mika,

please find attached full dmesg log with command line changed as requested=
.
Still have a black screen after resume, until a manual re-bind of 0000:71:=
00.

Best regards,
Achim

--nextPartjbI8-qFWTyyGo-SToscmWg
Content-Disposition: attachment; filename="tb-resume-bug-dmesg.2.txt"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; name="tb-resume-bug-dmesg.2.txt"

[    0.000000] Linux version 7.4.0-rc4-x86_64 (root@dt8) (x86_64-pc-linux-=
gnu-gcc (Gentoo 16.2.1_p20260926 p1) 16.2.1 20260926, GNU ld (Gentoo 2.47 =
p1) 2.47.0) #2 SMP PREEMPT_DYNAMIC Tue Nov 24 17:48:32 CET 2026
[    0.000000] Command line:  dolvm crypt_root=3DLABEL=3Ddt8-luks root=3DL=
ABEL=3Ddt8-root resume=3DLABEL=3Ddt8-swap thunderbolt.dyndbg=3D+p
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000099fefff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x00000000099ff000-0x0000000009ffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a23bfff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x000000000a23c000-0x000000000affffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b020fff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x000000000b021000-0x0000000087c2bfff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x0000000087c2c000-0x0000000095dabfff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000095dac000-0x0000000097dabfff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x0000000097dac000-0x0000000097ffefff]  ACP=
I data
[    0.000000] BIOS-e820: [mem 0x0000000097fff000-0x00000000988b9fff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x00000000988ba000-0x00000000988bafff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x00000000988bb000-0x0000000099e83fff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x0000000099e84000-0x0000000099e85fff]  ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x0000000099e86000-0x0000000099ff9fff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x0000000099ffa000-0x0000000099ffcfff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000099ffd000-0x0000000099ffffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [mem 0x000000009a000000-0x000000009bffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x000000009c000000-0x000000009d78ffff]
[    0.000000] BIOS-e820: [mem 0x000000009d790000-0x000000009d7effff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x000000009d7f0000-0x000000009d7f4fff]
[    0.000000] BIOS-e820: [mem 0x000000009d7f5000-0x000000009fffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x00000000a0000000-0x00000000dfffffff]
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x00000000f0000000-0x00000000f6ffffff]
[    0.000000] BIOS-e820: [mem 0x00000000f7000000-0x00000000ffffffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000fde2fffff]  Sys=
tem RAM
[    0.000000] BIOS-e820: [gap 0x0000000fde300000-0x0000000fdf33ffff]
[    0.000000] BIOS-e820: [mem 0x0000000fdf340000-0x00000010801fffff]  dev=
ice reserved
[    0.000000] BIOS-e820: [gap 0x0000001080200000-0x000000fcffffffff]
[    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff]  dev=
ice reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.11 by American Megatrends
[    0.000000] efi: ACPI=3D0x97d92000 ACPI 2.0=3D0x97d92014 TPMFinalLog=3D=
0x97d5e000 SMBIOS=3D0x8da1f000 SMBIOS 3.0=3D0x8da1e000 MEMATTR=3D0x81c5169=
8 ESRT=3D0x85a03098 RNG=3D0x97e22018 TPMEventLog=3D0x97e1b018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem260: MMIO range=3D[0xe0000000-0xefffffff] (2=
56MB) from e820 map
[    0.000000] e820: remove [mem 0xe0000000-0xefffffff] device reserved
[    0.000000] efi: Remove mem261: MMIO range=3D[0xf7000000-0xfedfffff] (1=
26MB) from e820 map
[    0.000000] e820: remove [mem 0xf7000000-0xfedfffff] device reserved
[    0.000000] efi: Not removing mem262: MMIO range=3D[0xfee00000-0xfee00f=
ff] (4KB) from e820 map
[    0.000000] efi: Remove mem263: MMIO range=3D[0xfee01000-0xffffffff] (1=
7MB) from e820 map
[    0.000000] e820: remove [mem 0xfee01000-0xffffffff] device reserved
[    0.000000] efi: Remove mem265: MMIO range=3D[0x1060000000-0x10801fffff=
] (514MB) from e820 map
[    0.000000] e820: remove [mem 0x1060000000-0x10801fffff] device reserve=
d
[    0.000000] DMI: SMBIOS 3.8.0 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. X870 AORUS ELITE WIFI7 I=
CE/X870 AORUS ELITE WIFI7 ICE, BIOS F13e 10/19/2026
[    0.000000] DMI: Memory slots populated: 2/4
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 4200.373 MHz processor
[    0.000068] e820: update [mem 0x00000000-0x00000fff] System RAM =3D=3D>=
 device reserved
[    0.000069] e820: remove [mem 0x000a0000-0x000fffff] System RAM
[    0.000074] last_pfn =3D 0xfde300 max_arch_pfn =3D 0x400000000
[    0.000077] MTRR map: 6 entries (3 fixed + 3 variable; max 20), built f=
rom 9 variable MTRRs
[    0.000078] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- W=
T =20
[    0.000230] last_pfn =3D 0x9a000 max_arch_pfn =3D 0x400000000
[    0.002528] esrt: Reserving ESRT space from 0x0000000085a03098 to 0x000=
0000085a030d0.
[    0.002533] e820: update [mem 0x85a03000-0x85a03fff] System RAM =3D=3D>=
 device reserved
[    0.002554] Using GB pages for direct mapping
[    0.003442] Secure boot enabled
[    0.003444] ACPI: Early table checksum verification disabled
[    0.003446] ACPI: RSDP 0x0000000097D92014 000024 (v02 ALASKA)
[    0.003448] ACPI: XSDT 0x0000000097D91728 00012C (v01 ALASKA A M I    0=
1072009 AMI  01000013)
[    0.003452] ACPI: FACP 0x0000000097FE7000 000114 (v06 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003454] ACPI: DSDT 0x0000000097F63000 079C80 (v02 ALASKA A M I    0=
1072009 INTL 20230628)
[    0.003456] ACPI: FACS 0x0000000097D8E000 000040
[    0.003457] ACPI: _SDM 0x00000000988BA000 000055 (v03 ALASKA A M I    0=
1072009 AMI  01000013)
[    0.003458] ACPI: HWIN 0x0000000097FFE000 00006C (v00 GBT    AMD      0=
0050000 AMI  01000013)
[    0.003459] ACPI: SSDT 0x0000000097FF2000 00B10F (v02 GBT    GSWApp   0=
0000001 INTL 20230628)
[    0.003460] ACPI: SSDT 0x0000000097FE9000 00837C (v02 AMD    Splinter 0=
0000002 MSFT 04000000)
[    0.003462] ACPI: SSDT 0x0000000097FE8000 000221 (v02 ALASKA CPUSSDT  0=
1072009 AMI  01072009)
[    0.003463] ACPI: FIDT 0x0000000097FE1000 00009D (v01 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003464] ACPI: MCFG 0x0000000097FE0000 00003C (v01 ALASKA A M I    0=
1072009 MSFT 00010013)
[    0.003465] ACPI: HPET 0x0000000097FDF000 000038 (v01 ALASKA A M I    0=
1072009 AMI  00000005)
[    0.003466] ACPI: WDRT 0x0000000097FDE000 000047 (v01 ALASKA A M I    0=
1072009 AMI  00000005)
[    0.003467] ACPI: FPDT 0x0000000097FDD000 000044 (v01 ALASKA A M I    0=
1072009 AMI  01000013)
[    0.003469] ACPI: VFCT 0x0000000097FE2000 004284 (v01 ALASKA A M I    0=
0000001 AMD  33504F47)
[    0.003470] ACPI: BGRT 0x0000000097F62000 000038 (v01 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003471] ACPI: SSDT 0x0000000097F5C000 00547E (v02 AMD    AMD CPU  0=
0000001 AMD  00000001)
[    0.003472] ACPI: TPM2 0x0000000097F5B000 00004C (v04 ALASKA A M I    0=
0000001 AMI  00000000)
[    0.003473] ACPI: SSDT 0x0000000097F5A000 000CDE (v02 AMD    OEMACP   0=
0000001 INTL 20230628)
[    0.003474] ACPI: WPBT 0x0000000097E4E000 000034 (v01 ALASKA A M I    0=
0000001 GBT  25021100)
[    0.003476] ACPI: SSDT 0x0000000097E40000 00D2AE (v02 AMD    DISCUSB4 0=
0000002 INTL 20230628)
[    0.003477] ACPI: SSDT 0x0000000097E3F000 0006D4 (v02 AMD    CPMWLRC  0=
0000001 INTL 20230628)
[    0.003478] ACPI: SSDT 0x0000000097E3D000 00169E (v02 AMD    CPMDFIG2 0=
0000001 INTL 20230628)
[    0.003479] ACPI: SSDT 0x0000000097E3A000 002AA6 (v02 AMD    CDFAAIG2 0=
0000001 INTL 20230628)
[    0.003480] ACPI: SSDT 0x0000000097E30000 0098A6 (v02 AMD    CPMCMN   0=
0000001 INTL 20230628)
[    0.003481] ACPI: SSDT 0x0000000097E2D000 0026D3 (v02 AMD    AOD      0=
0000001 INTL 20230628)
[    0.003483] ACPI: MHSP 0x0000000097E2C000 0000C8 (v04 AMD    AGESA    2=
0505348 ?    00000001)
[    0.003484] ACPI: SSDT 0x0000000097E2B000 0000E5 (v02 MSFT   MHSP     0=
0000004 INTL 20230628)
[    0.003485] ACPI: WSMT 0x0000000097E2A000 000028 (v01 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003486] ACPI: APIC 0x0000000097E29000 00015E (v06 ALASKA A M I    0=
1072009 AMI  00010013)
[    0.003487] ACPI: IVRS 0x0000000097E28000 0001FE (v02 AMD    AmdTable 0=
0000001 AMD  00000001)
[    0.003488] ACPI: SSDT 0x0000000097E27000 000500 (v02 AMD    MEMTOOL0 0=
0000002 INTL 20230628)
[    0.003490] ACPI: SSDT 0x0000000097E26000 0009D0 (v02 AMD    CPMMSOSC 0=
0000001 INTL 20230628)
[    0.003491] ACPI: SSDT 0x0000000097E25000 00047C (v02 AMD    AMDWOV   0=
0000001 INTL 20230628)
[    0.003492] ACPI: SSDT 0x0000000097E24000 000FFD (v02 AMD    CPMACPV5 0=
0000001 INTL 20230628)
[    0.003493] ACPI: SSDT 0x0000000097E23000 00044E (v02 AMD    AmdTable 0=
0000001 INTL 20230628)
[    0.003494] ACPI: Reserving FACP table memory at [mem 0x97fe7000-0x97fe=
7113]
[    0.003495] ACPI: Reserving DSDT table memory at [mem 0x97f63000-0x97fd=
cc7f]
[    0.003495] ACPI: Reserving FACS table memory at [mem 0x97d8e000-0x97d8=
e03f]
[    0.003496] ACPI: Reserving _SDM table memory at [mem 0x988ba000-0x988b=
a054]
[    0.003496] ACPI: Reserving HWIN table memory at [mem 0x97ffe000-0x97ff=
e06b]
[    0.003496] ACPI: Reserving SSDT table memory at [mem 0x97ff2000-0x97ff=
d10e]
[    0.003497] ACPI: Reserving SSDT table memory at [mem 0x97fe9000-0x97ff=
137b]
[    0.003497] ACPI: Reserving SSDT table memory at [mem 0x97fe8000-0x97fe=
8220]
[    0.003498] ACPI: Reserving FIDT table memory at [mem 0x97fe1000-0x97fe=
109c]
[    0.003498] ACPI: Reserving MCFG table memory at [mem 0x97fe0000-0x97fe=
003b]
[    0.003498] ACPI: Reserving HPET table memory at [mem 0x97fdf000-0x97fd=
f037]
[    0.003499] ACPI: Reserving WDRT table memory at [mem 0x97fde000-0x97fd=
e046]
[    0.003499] ACPI: Reserving FPDT table memory at [mem 0x97fdd000-0x97fd=
d043]
[    0.003499] ACPI: Reserving VFCT table memory at [mem 0x97fe2000-0x97fe=
6283]
[    0.003500] ACPI: Reserving BGRT table memory at [mem 0x97f62000-0x97f6=
2037]
[    0.003500] ACPI: Reserving SSDT table memory at [mem 0x97f5c000-0x97f6=
147d]
[    0.003501] ACPI: Reserving TPM2 table memory at [mem 0x97f5b000-0x97f5=
b04b]
[    0.003501] ACPI: Reserving SSDT table memory at [mem 0x97f5a000-0x97f5=
acdd]
[    0.003501] ACPI: Reserving WPBT table memory at [mem 0x97e4e000-0x97e4=
e033]
[    0.003502] ACPI: Reserving SSDT table memory at [mem 0x97e40000-0x97e4=
d2ad]
[    0.003502] ACPI: Reserving SSDT table memory at [mem 0x97e3f000-0x97e3=
f6d3]
[    0.003503] ACPI: Reserving SSDT table memory at [mem 0x97e3d000-0x97e3=
e69d]
[    0.003503] ACPI: Reserving SSDT table memory at [mem 0x97e3a000-0x97e3=
caa5]
[    0.003503] ACPI: Reserving SSDT table memory at [mem 0x97e30000-0x97e3=
98a5]
[    0.003504] ACPI: Reserving SSDT table memory at [mem 0x97e2d000-0x97e2=
f6d2]
[    0.003504] ACPI: Reserving MHSP table memory at [mem 0x97e2c000-0x97e2=
c0c7]
[    0.003504] ACPI: Reserving SSDT table memory at [mem 0x97e2b000-0x97e2=
b0e4]
[    0.003505] ACPI: Reserving WSMT table memory at [mem 0x97e2a000-0x97e2=
a027]
[    0.003505] ACPI: Reserving APIC table memory at [mem 0x97e29000-0x97e2=
915d]
[    0.003506] ACPI: Reserving IVRS table memory at [mem 0x97e28000-0x97e2=
81fd]
[    0.003506] ACPI: Reserving SSDT table memory at [mem 0x97e27000-0x97e2=
74ff]
[    0.003506] ACPI: Reserving SSDT table memory at [mem 0x97e26000-0x97e2=
69cf]
[    0.003507] ACPI: Reserving SSDT table memory at [mem 0x97e25000-0x97e2=
547b]
[    0.003507] ACPI: Reserving SSDT table memory at [mem 0x97e24000-0x97e2=
4ffc]
[    0.003508] ACPI: Reserving SSDT table memory at [mem 0x97e23000-0x97e2=
344d]
[    0.004774] ACPI: PM-Timer IO Port: 0x808
[    0.004778] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.004791] IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI =
0-23
[    0.004795] IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI =
24-55
[    0.004796] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.004797] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.004799] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.004799] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.004804] e820: update [mem 0x82861000-0x828b7fff] System RAM =3D=3D>=
 device reserved
[    0.004812] CPU topo: Max. logical packages:   1
[    0.004812] CPU topo: Max. logical nodes:      1
[    0.004812] CPU topo: Num. nodes per package:  1
[    0.004814] CPU topo: Max. logical dies:       1
[    0.004814] CPU topo: Max. dies per package:   1
[    0.004817] CPU topo: Max. threads per core:   2
[    0.004817] CPU topo: Num. cores per package:     8
[    0.004817] CPU topo: Num. threads per package:  16
[    0.004817] CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.004830] PM: hibernation: Registered nosave memory: [mem 0x00000000-=
0x00000fff]
[    0.004831] PM: hibernation: Registered nosave memory: [mem 0x000a0000-=
0x000fffff]
[    0.004831] PM: hibernation: Registered nosave memory: [mem 0x099ff000-=
0x09ffffff]
[    0.004832] PM: hibernation: Registered nosave memory: [mem 0x0a200000-=
0x0a23bfff]
[    0.004833] PM: hibernation: Registered nosave memory: [mem 0x0b000000-=
0x0b020fff]
[    0.004834] PM: hibernation: Registered nosave memory: [mem 0x82861000-=
0x828b7fff]
[    0.004835] PM: hibernation: Registered nosave memory: [mem 0x85a03000-=
0x85a03fff]
[    0.004835] PM: hibernation: Registered nosave memory: [mem 0x87c2c000-=
0x97ffefff]
[    0.004836] PM: hibernation: Registered nosave memory: [mem 0x988ba000-=
0x988bafff]
[    0.004837] PM: hibernation: Registered nosave memory: [mem 0x99e84000-=
0x99e85fff]
[    0.004838] PM: hibernation: Registered nosave memory: [mem 0x99ffa000-=
0x99ffcfff]
[    0.004839] PM: hibernation: Registered nosave memory: [mem 0x9a000000-=
0xffffffff]
[    0.004840] [gap 0xa0000000-0xfedfffff] available for PCI devices
[    0.004841] Booting paravirtualized kernel on bare hardware
[    0.004843] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.011774] Zone ranges:
[    0.011774]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.011775]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.011776]   Normal   [mem 0x0000000100000000-0x0000000fde2fffff]
[    0.011776]   Device   empty
[    0.011777] Movable zone start for each node
[    0.011777] Early memory node ranges
[    0.011777]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.011778]   node   0: [mem 0x0000000000100000-0x00000000099fefff]
[    0.011778]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.011779]   node   0: [mem 0x000000000a23c000-0x000000000affffff]
[    0.011779]   node   0: [mem 0x000000000b021000-0x0000000087c2bfff]
[    0.011779]   node   0: [mem 0x0000000097fff000-0x00000000988b9fff]
[    0.011780]   node   0: [mem 0x00000000988bb000-0x0000000099e83fff]
[    0.011780]   node   0: [mem 0x0000000099e86000-0x0000000099ff9fff]
[    0.011781]   node   0: [mem 0x0000000099ffd000-0x0000000099ffffff]
[    0.011781]   node   0: [mem 0x0000000100000000-0x0000000fde2fffff]
[    0.011782] Initmem setup node 0 [mem 0x0000000000001000-0x0000000fde2f=
ffff]
[    0.012077] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.012098] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.012289] On node 0, zone DMA32: 1537 pages in unavailable ranges
[    0.012308] On node 0, zone DMA32: 60 pages in unavailable ranges
[    0.014939] On node 0, zone DMA32: 33 pages in unavailable ranges
[    0.015080] On node 0, zone DMA32: 33747 pages in unavailable ranges
[    0.015109] On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.015112] On node 0, zone DMA32: 2 pages in unavailable ranges
[    0.015112] On node 0, zone DMA32: 3 pages in unavailable ranges
[    0.095780] On node 0, zone Normal: 24576 pages in unavailable ranges
[    0.095811] On node 0, zone Normal: 7424 pages in unavailable ranges
[    0.095819] setup_percpu: NR_CPUS:64 nr_cpumask_bits:16 nr_cpu_ids:16 n=
r_node_ids:1
[    0.096014] percpu: Embedded 61 pages/cpu s212992 r8192 d28672 u262144
[    0.096018] pcpu-alloc: s212992 r8192 d28672 u262144 alloc=3D1*2097152
[    0.096019] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 =
13 14 15=20
[    0.096031] Kernel command line:  dolvm crypt_root=3DLABEL=3Ddt8-luks r=
oot=3DLABEL=3Ddt8-root resume=3DLABEL=3Ddt8-swap thunderbolt.dyndbg=3D+p
[    0.096073] Unknown kernel command line parameters "dolvm crypt_root=3D=
LABEL=3Ddt8-luks", will be passed to user space.
[    0.096267] printk: log buffer data + meta data: 262144 + 917504 =3D 11=
79648 bytes
[    0.097005] Dentry cache hash table entries: 8388608 (order: 14, 671088=
64 bytes, linear)
[    0.097376] Inode-cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes, linear)
[    0.097443] software IO TLB: area num 16.
[    0.098982] Built 1 zonelists, mobility grouping on.  Total pages: 1615=
2680
[    0.098983] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.154243] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16,=
 Nodes=3D1
[    0.154308] Dynamic Preempt: full
[    0.154362] rcu: Preemptible hierarchical RCU implementation.
[    0.154363] rcu: 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=
=3D16.
[    0.154364] 	Trampoline variant of Tasks RCU enabled.
[    0.154364] 	Tracing variant of Tasks RCU enabled.
[    0.154364] rcu: RCU calculated value of scheduler-enlistment delay is =
10 jiffies.
[    0.154365] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_id=
s=3D16
[    0.154375] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adju=
st=3D1 rcu_task_cpu_ids=3D16.
[    0.162113] NR_IRQS: 4352, nr_irqs: 1096, preallocated irqs: 16
[    0.162312] rcu: srcu_init: Setting srcu_struct sizes based on contenti=
on.
[    0.162342] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 19112604462750000 ns
[    0.162444] Console: colour dummy device 80x25
[    0.162446] printk: legacy console [tty0] enabled
[    0.162622] ACPI: Core revision 20260408
[    0.163025] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,=
 max_idle_ns: 133484873504 ns
[    0.163045] APIC: Switch to symmetric I/O mode setup
[    0.163048] AMD-Vi: Force device table to maximum size
[    0.163267] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:0xa0
[    0.163269] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:0xa0
[    0.163271] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:0xa0
[    0.163272] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:0x98
[    0.163273] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:0x98
[    0.163274] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x0
[    0.164646] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
[    0.213047] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles=
: 0x3c8bc104a28, max_idle_ns: 440795271386 ns
[    0.213052] Calibrating delay loop (skipped), value calculated using ti=
mer frequency.. 8400.74 BogoMIPS (lpj=3D42003730)
[    0.213073] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.213101] LVT offset 1 assigned for vector 0xf9
[    0.213103] LVT offset 2 assigned for vector 0xf4
[    0.213289] Last level iTLB entries: 4KB 512, 2MB 512, 4MB 256
[    0.213290] Last level dTLB entries: 4KB 3072, 2MB 3072, 4MB 1536, 1GB =
0
[    0.213294] process: using mwait in idle threads
[    0.213296] mitigations: Enabled attack vectors: user_kernel, user_user=
, guest_host, guest_guest, SMT mitigations: auto
[    0.213300] Speculative Store Bypass: Mitigation: Speculative Store Byp=
ass disabled via prctl
[    0.213302] Transient Scheduler Attacks: Mitigation: Clear CPU buffers
[    0.213303] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.213305] Spectre V2 : User space: Mitigation: STIBP always-on protec=
tion
[    0.213306] Speculative Return Stack Overflow: Mitigation: Safe RET
[    0.213307] VMSCAPE: Mitigation: IBPB before exit to userspace
[    0.213309] Spectre V1 : Mitigation: usercopy/swapgs barriers and __use=
r pointer sanitization
[    0.213311] Spectre V2 : mitigation: Enabling conditional Indirect Bran=
ch Prediction Barrier
[    0.213314] active return thunk: srso_alias_return_thunk
[    0.213324] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poin=
t registers'
[    0.213326] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.213327] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.213328] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.213329] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.213330] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256=
'
[    0.213331] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys U=
ser registers'
[    0.213333] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User=
 registers'
[    0.213334] x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Ker=
nel registers (KVM only)'
[    0.213336] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.213337] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.213339] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.213340] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.213341] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.213342] x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.213343] x86/fpu: xstate_offset[12]: 2456, xstate_sizes[12]:   24
[    0.213344] x86/fpu: Enabled xstate features 0x1ae7, context size is 24=
80 bytes, using 'compacted' format.
[    0.242141] pid_max: default: 32768 minimum: 301
[    0.242237] VFS: Disk quotas dquot_6.6.0
[    0.242241] VFS: Dquot-cache hash table entries: 512 (4096 bytes)
[    0.242281] Mount-cache hash table entries: 131072 (order: 8, 1048576 b=
ytes, linear)
[    0.242313] Mountpoint-cache hash table entries: 131072 (order: 8, 1048=
576 bytes, linear)
[    0.242391] VFS: Finished mounting rootfs on nullfs
[    0.362788] smpboot: CPU0: AMD Ryzen 7 8700G w/ Radeon 780M Graphics (f=
amily: 0x19, model: 0x75, stepping: 0x2)
[    0.363035] Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD =
PMU driver.
[    0.363050] ... version:                   2
[    0.363050] ... bit width:                 48
[    0.363050] ... generic counters:          6
[    0.363050] ... generic bitmap:            000000000000003f
[    0.363050] ... fixed-purpose counters:    0
[    0.363050] ... fixed-purpose bitmap:      0000000000000000
[    0.363050] ... value mask:                0000ffffffffffff
[    0.363050] ... max period:                00007fffffffffff
[    0.363050] ... global_ctrl mask:          000000000000003f
[    0.363050] signal: max sigframe size: 3376
[    0.363050] rcu: Hierarchical SRCU implementation.
[    0.363050] rcu: 	Max phase no-delay instances is 1000.
[    0.363050] Timer migration: 2 hierarchy levels; 8 children per group; =
2 crossnode level
[    0.363050] smp: Bringing up secondary CPUs ...
[    0.363050] smpboot: x86: Booting SMP configuration:
[    0.363050] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8 =
 #9 #10 #11 #12 #13 #14 #15
[    0.375051] Spectre V2 : Update user space SMT mitigation: STIBP always=
-on
[    0.385051] smp: Brought up 1 node, 16 CPUs
[    0.385051] smpboot: Total of 16 processors activated (134411.93 BogoMI=
PS)
[    0.385051] Memory: 63207844K/64610720K available (25374K kernel code, =
4191K rwdata, 16232K rodata, 20948K init, 3448K bss, 1389556K reserved, 0K=
 cma-reserved)
[    0.393061] devtmpfs: initialized
[    0.393145] x86/mm: Memory block size: 128MB
[    0.401231] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a2=
3bfff] (245760 bytes)
[    0.401231] ACPI: PM: Registering ACPI NVS region [mem 0x95dac000-0x97d=
abfff] (33554432 bytes)
[    0.401231] ACPI: PM: Registering ACPI NVS region [mem 0x988ba000-0x988=
bafff] (4096 bytes)
[    0.401231] ACPI: PM: Registering ACPI NVS region [mem 0x99e84000-0x99e=
85fff] (8192 bytes)
[    0.401231] posixtimers hash table entries: 8192 (order: 5, 131072 byte=
s, linear)
[    0.401231] futex hash table entries: 4096 (262144 bytes on 1 NUMA node=
s, total 256 KiB, linear).
[    0.401231] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.401231] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloc=
ations
[    0.401231] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atom=
ic allocations
[    0.401231] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for at=
omic allocations
[    0.401231] audit: initializing netlink subsys (disabled)
[    0.401231] audit: type=3D2000 audit(1795685489.230:1): state=3Dinitial=
ized audit_enabled=3D0 res=3D1
[    0.401231] thermal_sys: Registered thermal governor 'bang_bang'
[    0.401231] thermal_sys: Registered thermal governor 'step_wise'
[    0.401231] thermal_sys: Registered thermal governor 'user_space'
[    0.401231] thermal_sys: Registered thermal governor 'power_allocator'
[    0.403060] cpuidle: using governor ladder
[    0.403060] cpuidle: using governor menu
[    0.410617] efi: Freeing EFI boot services memory: 126160K
[    0.410623] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.410711] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for=
 domain 0000 [bus 00-ff]
[    0.410727] PCI: Using configuration type 1 for base access
[    0.410809] ACPI: Added _OSI(Module Device)
[    0.410809] ACPI: Added _OSI(Processor Device)
[    0.410809] ACPI: Added _OSI(Processor Aggregator Device)
[    0.449722] ACPI: 18 ACPI AML tables successfully acquired and loaded
[    0.636915] ACPI: \_SB_: platform _OSC: OS support mask [006e7eff]
[    0.636915] ACPI: \_SB_: platform _OSC: OS control mask [006e7eff]
[    0.643778] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.643784] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDoma=
in+
[    0.645857] ACPI: Interpreter enabled
[    0.646026] ACPI: PM: (supports S0 S3 S4 S5)
[    0.646029] ACPI: Using IOAPIC for interrupt routing
[    0.867676] PCI: Using host bridge windows from ACPI; if necessary, use=
 "pci=3Dnocrs" and report a bug
[    0.867681] PCI: Ignoring E820 reservations for host bridge windows
[    0.868477] ACPI: Enabled 10 GPEs in block 00 to 1F
[    0.871961] ACPI: \_SB_.PCI0.GP11.PWRS: New power resource
[    0.873209] ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New power resource
[    0.874294] ACPI: \_SB_.PCI0.GP12.PWRS: New power resource
[    0.875361] ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New power resource
[    0.877197] ACPI: \_SB_.PCI0.GP17.XHC0.P0U0: New power resource
[    0.879635] ACPI: \_SB_.PCI0.GP17.XHC1.P0U1: New power resource
[    0.882864] ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New power resource
[    0.884944] ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New power resource
[    0.887021] ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New power resource
[    0.888121] ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New power resource
[    0.888749] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
[    0.889216] ACPI: \_SB_.PCI0.GPP5.PWRS: New power resource
[    0.889732] ACPI: \_SB_.PCI0.GPP5.UP00.PWRS: New power resource
[    0.890200] ACPI: \_SB_.PCI0.GPP5.UP00.DP00.PWRS: New power resource
[    0.891274] ACPI: \_SB_.PCI0.GPP5.UP00.DP08.PWRS: New power resource
[    0.891665] ACPI: \_SB_.PCI0.GPP5.UP00.DP08.EP00.PWRS: New power resour=
ce
[    0.892101] ACPI: \_SB_.PCI0.GPP5.UP00.DP10.PWRS: New power resource
[    0.892564] ACPI: \_SB_.PCI0.GPP5.UP00.DP10.WN00.PWRS: New power resour=
ce
[    0.893036] ACPI: \_SB_.PCI0.GPP5.UP00.DP18.PWRS: New power resource
[    0.893682] ACPI: \_SB_.PCI0.GPP5.UP00.DP18.LN00.PWRS: New power resour=
ce
[    0.894156] ACPI: \_SB_.PCI0.GPP5.UP00.DP20.PWRS: New power resource
[    0.895229] ACPI: \_SB_.PCI0.GPP5.UP00.DP28.PWRS: New power resource
[    0.896012] ACPI: \_SB_.PCI0.GPP5.UP00.DP28.EP00.PWRS: New power resour=
ce
[    0.896486] ACPI: \_SB_.PCI0.GPP5.UP00.DP30.PWRS: New power resource
[    0.897269] ACPI: \_SB_.PCI0.GPP5.UP00.DP30.EP00.PWRS: New power resour=
ce
[    0.897741] ACPI: \_SB_.PCI0.GPP5.UP00.DP38.PWRS: New power resource
[    0.898517] ACPI: \_SB_.PCI0.GPP5.UP00.DP38.EP00.PWRS: New power resour=
ce
[    0.898994] ACPI: \_SB_.PCI0.GPP5.UP00.DP40.PWRS: New power resource
[    0.899772] ACPI: \_SB_.PCI0.GPP5.UP00.DP40.EP00.PWRS: New power resour=
ce
[    0.900246] ACPI: \_SB_.PCI0.GPP5.UP00.DP48.PWRS: New power resource
[    0.900639] ACPI: \_SB_.PCI0.GPP5.UP00.DP48.EP00.PWRS: New power resour=
ce
[    0.901070] ACPI: \_SB_.PCI0.GPP5.UP00.DP50.PWRS: New power resource
[    0.901461] ACPI: \_SB_.PCI0.GPP5.UP00.DP50.EP00.PWRS: New power resour=
ce
[    0.901892] ACPI: \_SB_.PCI0.GPP5.UP00.DP58.PWRS: New power resource
[    0.902281] ACPI: \_SB_.PCI0.GPP5.UP00.DP58.EP00.PWRS: New power resour=
ce
[    0.902714] ACPI: \_SB_.PCI0.GPP5.UP00.DP60.PWRS: New power resource
[    0.903178] ACPI: \_SB_.PCI0.GPP5.UP00.DP60.XH00.PWRS: New power resour=
ce
[    0.911526] ACPI: \_SB_.PCI0.GPP5.UP00.DP68.PWRS: New power resource
[    0.911986] ACPI: \_SB_.PCI0.GPP5.UP00.DP68.SA00.PWRS: New power resour=
ce
[    0.913694] ACPI: \_SB_.PCI0.GPP6.PWRS: New power resource
[    0.915095] ACPI: \_SB_.PCI0.GPP6.U4UP.PWRS: New power resource
[    0.916060] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P0.PWRS: New power resource
[    0.916937] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P0.UP0D.PWRS: New power resour=
ce
[    0.918380] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P1.PWRS: New power resource
[    0.919509] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P1.UP1D.PWRS: New power resour=
ce
[    0.920450] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P2.PWRS: New power resource
[    0.921324] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P2.UXHC.PWRS: New power resour=
ce
[    0.924335] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P3.PWRS: New power resource
[    0.925218] ACPI: \_SB_.PCI0.GPP6.U4UP.U4P3.UHI0.PWRS: New power resour=
ce
[    0.933827] ACPI: \_SB_.PRWL: New power resource
[    0.933866] ACPI: \_SB_.PRWB: New power resource
[    0.935616] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.935623] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Clo=
ckPM Segments MSI EDR HPX-Type3]
[    0.935865] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHot=
plug PME AER PCIeCapability LTR DPC]
[    0.936941] PCI host bridge to bus 0000:00
[    0.936947] pci_bus 0000:00: root bus resource [io  0x0000-0x03af windo=
w]
[    0.936951] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 windo=
w]
[    0.936955] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df windo=
w]
[    0.936958] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff windo=
w]
[    0.936962] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dff=
ff window]
[    0.936966] pci_bus 0000:00: root bus resource [mem 0xf2000000-0xf6ffff=
ff window]
[    0.936970] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xf1ffff=
ff window]
[    0.936974] pci_bus 0000:00: root bus resource [mem 0xa0000000-0xdfffff=
ff window]
[    0.936977] pci_bus 0000:00: root bus resource [mem 0x1060000000-0xfcff=
ffffff window]
[    0.936981] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.936985] acpi PNP0A08:00: OS native features: SHPCHotplug+ PCIeHotpl=
ug+ PME+ AER+ DPC+ LTR+
[    0.960332] pci 0000:00:00.0: [1022:14e8] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.960503] pci 0000:00:00.2: [1022:14e9] type 00 class 0x080600 conven=
tional PCI endpoint
[    0.960658] pci 0000:00:01.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.960807] pci 0000:00:01.2: [1022:14ed] type 01 class 0x060400 PCIe R=
oot Port
[    0.960827] pci 0000:00:01.2: PCI bridge to [bus 01]
[    0.960835] pci 0000:00:01.2:   bridge window [mem 0xddb00000-0xddbffff=
f]
[    0.960928] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.961139] pci 0000:00:02.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.961284] pci 0000:00:02.1: [1022:14ee] type 01 class 0x060400 PCIe R=
oot Port
[    0.961307] pci 0000:00:02.1: PCI bridge to [bus 02-0d]
[    0.961314] pci 0000:00:02.1:   bridge window [io  0xf000-0xffff]
[    0.961319] pci 0000:00:02.1:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    0.961420] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.963960] pci 0000:00:02.2: [1022:14ee] type 01 class 0x060400 PCIe R=
oot Port
[    0.963980] pci 0000:00:02.2: PCI bridge to [bus 0e-71]
[    0.963986] pci 0000:00:02.2:   bridge window [io  0x8000-0xdfff]
[    0.963991] pci 0000:00:02.2:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    0.964000] pci 0000:00:02.2:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    0.964081] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
[    0.988552] pci 0000:00:03.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.988701] pci 0000:00:04.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.988848] pci 0000:00:08.0: [1022:14ea] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.988986] pci 0000:00:08.1: [1022:14eb] type 01 class 0x060400 PCIe R=
oot Port
[    0.989006] pci 0000:00:08.1: PCI bridge to [bus 72]
[    0.989012] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
[    0.989017] pci 0000:00:08.1:   bridge window [mem 0xdd200000-0xdd7ffff=
f]
[    0.989026] pci 0000:00:08.1:   bridge window [mem 0xf800000000-0xf80ff=
fffff 64bit pref]
[    0.989036] pci 0000:00:08.1: enabling Extended Tags
[    0.989088] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.990215] pci 0000:00:08.2: [1022:14eb] type 01 class 0x060400 PCIe R=
oot Port
[    0.990248] pci 0000:00:08.2: PCI bridge to [bus 73]
[    0.990255] pci 0000:00:08.2:   bridge window [mem 0xdda00000-0xddaffff=
f]
[    0.990263] pci 0000:00:08.2:   bridge window [mem 0xf810000000-0xf8100=
fffff 64bit pref]
[    0.990272] pci 0000:00:08.2: enabling Extended Tags
[    0.990313] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    0.990461] pci 0000:00:08.3: [1022:14eb] type 01 class 0x060400 PCIe R=
oot Port
[    0.990477] pci 0000:00:08.3: PCI bridge to [bus 74]
[    0.990484] pci 0000:00:08.3:   bridge window [mem 0xdd800000-0xdd9ffff=
f]
[    0.990497] pci 0000:00:08.3: enabling Extended Tags
[    0.990538] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.990721] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 conven=
tional PCI endpoint
[    0.990880] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 conven=
tional PCI endpoint
[    0.991052] pci 0000:00:18.0: [1022:14f0] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991105] pci 0000:00:18.1: [1022:14f1] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991157] pci 0000:00:18.2: [1022:14f2] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991209] pci 0000:00:18.3: [1022:14f3] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991259] pci 0000:00:18.4: [1022:14f4] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991312] pci 0000:00:18.5: [1022:14f5] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991364] pci 0000:00:18.6: [1022:14f6] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991414] pci 0000:00:18.7: [1022:14f7] type 00 class 0x060000 conven=
tional PCI endpoint
[    0.991574] pci 0000:01:00.0: [144d:a80a] type 00 class 0x010802 PCIe E=
ndpoint
[    0.991610] pci 0000:01:00.0: BAR 0 [mem 0xddb00000-0xddb03fff 64bit]
[    0.991887] pci 0000:00:01.2: PCI bridge to [bus 01]
[    0.992022] pci 0000:02:00.0: [1022:43f4] type 01 class 0x060400 PCIe S=
witch Upstream Port
[    0.992049] pci 0000:02:00.0: PCI bridge to [bus 03-0d]
[    0.992057] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
[    0.992062] pci 0000:02:00.0:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    0.992085] pci 0000:02:00.0: enabling Extended Tags
[    0.992156] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.994969] pci 0000:00:02.1: PCI bridge to [bus 02-0d]
[    0.995207] pci 0000:03:00.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.995235] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.995265] pci 0000:03:00.0: enabling Extended Tags
[    0.995343] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.995610] pci 0000:03:02.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.995637] pci 0000:03:02.0: PCI bridge to [bus 05]
[    0.995645] pci 0000:03:02.0:   bridge window [io  0xf000-0xffff]
[    0.995650] pci 0000:03:02.0:   bridge window [mem 0xdd000000-0xdd0ffff=
f]
[    0.995674] pci 0000:03:02.0: enabling Extended Tags
[    0.995748] pci 0000:03:02.0: PME# supported from D0 D3hot D3cold
[    0.997692] pci 0000:03:03.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.997720] pci 0000:03:03.0: PCI bridge to [bus 06]
[    0.997730] pci 0000:03:03.0:   bridge window [mem 0xdca00000-0xdccffff=
f]
[    0.997754] pci 0000:03:03.0: enabling Extended Tags
[    0.997829] pci 0000:03:03.0: PME# supported from D0 D3hot D3cold
[    0.999765] pci 0000:03:04.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    0.999793] pci 0000:03:04.0: PCI bridge to [bus 07]
[    0.999823] pci 0000:03:04.0: enabling Extended Tags
[    0.999901] pci 0000:03:04.0: PME# supported from D0 D3hot D3cold
[    1.000149] pci 0000:03:05.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.000176] pci 0000:03:05.0: PCI bridge to [bus 08]
[    1.000206] pci 0000:03:05.0: enabling Extended Tags
[    1.000283] pci 0000:03:05.0: PME# supported from D0 D3hot D3cold
[    1.000530] pci 0000:03:06.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.000557] pci 0000:03:06.0: PCI bridge to [bus 09]
[    1.000587] pci 0000:03:06.0: enabling Extended Tags
[    1.000664] pci 0000:03:06.0: PME# supported from D0 D3hot D3cold
[    1.000914] pci 0000:03:07.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.000941] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    1.000971] pci 0000:03:07.0: enabling Extended Tags
[    1.001048] pci 0000:03:07.0: PME# supported from D0 D3hot D3cold
[    1.001298] pci 0000:03:08.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.001325] pci 0000:03:08.0: PCI bridge to [bus 0b]
[    1.001355] pci 0000:03:08.0: enabling Extended Tags
[    1.001432] pci 0000:03:08.0: PME# supported from D0 D3hot D3cold
[    1.001683] pci 0000:03:0c.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.001711] pci 0000:03:0c.0: PCI bridge to [bus 0c]
[    1.001718] pci 0000:03:0c.0:   bridge window [mem 0xdcf00000-0xdcfffff=
f]
[    1.001741] pci 0000:03:0c.0: enabling Extended Tags
[    1.001793] pci 0000:03:0c.0: PME# supported from D0 D3hot D3cold
[    1.003730] pci 0000:03:0d.0: [1022:43f5] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.003758] pci 0000:03:0d.0: PCI bridge to [bus 0d]
[    1.003765] pci 0000:03:0d.0:   bridge window [mem 0xdce00000-0xdceffff=
f]
[    1.003788] pci 0000:03:0d.0: enabling Extended Tags
[    1.003841] pci 0000:03:0d.0: PME# supported from D0 D3hot D3cold
[    1.005638] pci 0000:02:00.0: PCI bridge to [bus 03-0d]
[    1.005716] pci 0000:03:00.0: PCI bridge to [bus 04]
[    1.005850] pci 0000:05:00.0: [10ec:8125] type 00 class 0x020000 PCIe E=
ndpoint
[    1.005921] pci 0000:05:00.0: BAR 0 [io  0xf000-0xf0ff]
[    1.005929] pci 0000:05:00.0: BAR 2 [mem 0xdd000000-0xdd00ffff 64bit]
[    1.005936] pci 0000:05:00.0: BAR 4 [mem 0xdd010000-0xdd013fff 64bit]
[    1.006093] pci 0000:05:00.0: supports D1 D2
[    1.006096] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.023117] pci 0000:03:02.0: PCI bridge to [bus 05]
[    1.023297] pci 0000:06:00.0: [14c3:7925] type 00 class 0x028000 PCIe E=
ndpoint
[    1.023381] pci 0000:06:00.0: BAR 0 [mem 0xdca00000-0xdcbfffff 64bit]
[    1.023391] pci 0000:06:00.0: BAR 2 [mem 0xdcc00000-0xdcc07fff 64bit]
[    1.023543] pci 0000:06:00.0: PME# supported from D0 D3hot D3cold
[    1.043115] pci 0000:03:03.0: PCI bridge to [bus 06]
[    1.043234] pci 0000:03:04.0: PCI bridge to [bus 07]
[    1.043346] pci 0000:03:05.0: PCI bridge to [bus 08]
[    1.043460] pci 0000:03:06.0: PCI bridge to [bus 09]
[    1.043571] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    1.043682] pci 0000:03:08.0: PCI bridge to [bus 0b]
[    1.043822] pci 0000:0c:00.0: [1022:43fc] type 00 class 0x0c0330 PCIe L=
egacy Endpoint
[    1.043874] pci 0000:0c:00.0: BAR 0 [mem 0xdcf00000-0xdcf07fff 64bit]
[    1.043893] pci 0000:0c:00.0: enabling Extended Tags
[    1.043973] pci 0000:0c:00.0: PME# supported from D0 D3hot D3cold
[    1.045525] pci 0000:03:0c.0: PCI bridge to [bus 0c]
[    1.045640] pci 0000:0d:00.0: [1022:43f6] type 00 class 0x010601 PCIe L=
egacy Endpoint
[    1.045690] pci 0000:0d:00.0: BAR 5 [mem 0xdce80000-0xdce803ff]
[    1.045695] pci 0000:0d:00.0: ROM [mem 0xdce00000-0xdce7ffff pref]
[    1.045705] pci 0000:0d:00.0: enabling Extended Tags
[    1.045762] pci 0000:0d:00.0: PME# supported from D0 D3hot D3cold
[    1.047007] pci 0000:03:0d.0: PCI bridge to [bus 0d]
[    1.047231] pci 0000:0e:00.0: [1b21:2421] type 01 class 0x060400 PCIe S=
witch Upstream Port
[    1.047262] pci 0000:0e:00.0: PCI bridge to [bus 0f-71]
[    1.047270] pci 0000:0e:00.0:   bridge window [io  0x8000-0xdfff]
[    1.047276] pci 0000:0e:00.0:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    1.047289] pci 0000:0e:00.0:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    1.047387] pci 0000:0e:00.0: PME# supported from D0 D3hot D3cold
[    1.112191] pci 0000:00:02.2: PCI bridge to [bus 0e-71]
[    1.112429] pci 0000:0f:00.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.112457] pci 0000:0f:00.0: PCI bridge to [bus 10-3f]
[    1.112464] pci 0000:0f:00.0:   bridge window [io  0xb000-0xdfff]
[    1.112470] pci 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[    1.112481] pci 0000:0f:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[    1.112688] pci 0000:0f:00.0: PME# supported from D0 D3hot D3cold
[    1.134739] pci 0000:0f:01.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.134771] pci 0000:0f:01.0: PCI bridge to [bus 40-6f]
[    1.134779] pci 0000:0f:01.0:   bridge window [io  0x8000-0xafff]
[    1.134785] pci 0000:0f:01.0:   bridge window [mem 0xac000000-0xc3fffff=
f]
[    1.134798] pci 0000:0f:01.0:   bridge window [mem 0xb800000000-0xd7fff=
fffff 64bit pref]
[    1.135020] pci 0000:0f:01.0: PME# supported from D0 D3hot D3cold
[    1.147068] pci 0000:0f:02.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.147100] pci 0000:0f:02.0: PCI bridge to [bus 70]
[    1.147109] pci 0000:0f:02.0:   bridge window [mem 0xdc400000-0xdc7ffff=
f]
[    1.147203] pci 0000:0f:02.0: PME# supported from D0 D3hot D3cold
[    1.171690] pci 0000:0f:03.0: [1b21:2423] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.171718] pci 0000:0f:03.0: PCI bridge to [bus 71]
[    1.171726] pci 0000:0f:03.0:   bridge window [mem 0xdc000000-0xdc3ffff=
f]
[    1.171810] pci 0000:0f:03.0: PME# supported from D0 D3hot D3cold
[    1.196463] pci 0000:0e:00.0: PCI bridge to [bus 0f-71]
[    1.196734] pci 0000:10:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Upstream Port
[    1.196788] pci 0000:10:00.0: PCI bridge to [bus 11-16]
[    1.197036] pci 0000:10:00.0: supports D1 D2
[    1.197039] pci 0000:10:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.208131] pci 0000:10:00.0: 2.000 Gb/s available PCIe bandwidth, limi=
ted by 2.5 GT/s PCIe x1 link at 0000:0f:00.0 (capable of 8.000 Gb/s with 2=
.5 GT/s PCIe x4 link)
[    1.208323] pci 0000:0f:00.0: PCI bridge to [bus 10-3f]
[    1.208532] pci 0000:11:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.208589] pci 0000:11:00.0: PCI bridge to [bus 12]
[    1.208866] pci 0000:11:00.0: supports D1 D2
[    1.208869] pci 0000:11:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.209375] pci 0000:11:01.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.209432] pci 0000:11:01.0: PCI bridge to [bus 13]
[    1.209709] pci 0000:11:01.0: supports D1 D2
[    1.209711] pci 0000:11:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.210220] pci 0000:11:02.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.210274] pci 0000:11:02.0: PCI bridge to [bus 14]
[    1.210533] pci 0000:11:02.0: supports D1 D2
[    1.210535] pci 0000:11:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.211008] pci 0000:11:03.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.211062] pci 0000:11:03.0: PCI bridge to [bus 15]
[    1.211320] pci 0000:11:03.0: supports D1 D2
[    1.211322] pci 0000:11:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.211797] pci 0000:11:04.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[    1.211850] pci 0000:11:04.0: PCI bridge to [bus 16]
[    1.212114] pci 0000:11:04.0: supports D1 D2
[    1.212117] pci 0000:11:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.212535] pci 0000:10:00.0: PCI bridge to [bus 11-16]
[    1.212627] pci 0000:11:00.0: PCI bridge to [bus 12]
[    1.212726] pci 0000:11:01.0: PCI bridge to [bus 13]
[    1.212822] pci 0000:11:02.0: PCI bridge to [bus 14]
[    1.212919] pci 0000:11:03.0: PCI bridge to [bus 15]
[    1.213019] pci 0000:11:04.0: PCI bridge to [bus 16]
[    1.213455] pci 0000:0f:01.0: PCI bridge to [bus 40-6f]
[    1.213560] pci 0000:70:00.0: [1b21:2426] type 00 class 0x0c0330 PCIe L=
egacy Endpoint
[    1.213600] pci 0000:70:00.0: BAR 0 [mem 0xdc400000-0xdc407fff 64bit]
[    1.213674] pci 0000:70:00.0: PME# supported from D0 D3hot D3cold
[    1.224593] pci 0000:0f:02.0: PCI bridge to [bus 70]
[    1.224764] pci 0000:71:00.0: [1b21:2425] type 00 class 0x0c0340 PCIe L=
egacy Endpoint
[    1.224807] pci 0000:71:00.0: BAR 0 [mem 0xdc000000-0xdc03ffff 64bit]
[    1.224813] pci 0000:71:00.0: BAR 2 [mem 0xdc040000-0xdc04ffff 64bit]
[    1.224893] pci 0000:71:00.0: PME# supported from D0 D3hot D3cold
[    1.236417] pci 0000:0f:03.0: PCI bridge to [bus 71]
[    1.236587] pci 0000:72:00.0: [1002:15bf] type 00 class 0x030000 PCIe L=
egacy Endpoint
[    1.236617] pci 0000:72:00.0: BAR 0 [mem 0xf800000000-0xf80fffffff 64bi=
t pref]
[    1.236622] pci 0000:72:00.0: BAR 2 [mem 0xdd200000-0xdd3fffff 64bit pr=
ef]
[    1.236627] pci 0000:72:00.0: BAR 4 [io  0xe000-0xe0ff]
[    1.236631] pci 0000:72:00.0: BAR 5 [mem 0xdd700000-0xdd77ffff]
[    1.236639] pci 0000:72:00.0: enabling Extended Tags
[    1.236705] pci 0000:72:00.0: PME# supported from D1 D2 D3hot D3cold
[    1.236907] pci 0000:72:00.1: [1002:1640] type 00 class 0x040300 PCIe L=
egacy Endpoint
[    1.236935] pci 0000:72:00.1: BAR 0 [mem 0xdd788000-0xdd78bfff]
[    1.236946] pci 0000:72:00.1: enabling Extended Tags
[    1.236989] pci 0000:72:00.1: PME# supported from D1 D2 D3hot D3cold
[    1.237130] pci 0000:72:00.2: [1022:15c7] type 00 class 0x108000 PCIe E=
ndpoint
[    1.237159] pci 0000:72:00.2: BAR 2 [mem 0xdd600000-0xdd6fffff]
[    1.237164] pci 0000:72:00.2: BAR 5 [mem 0xdd78c000-0xdd78dfff]
[    1.237172] pci 0000:72:00.2: enabling Extended Tags
[    1.237302] pci 0000:72:00.3: [1022:15b9] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.237332] pci 0000:72:00.3: BAR 0 [mem 0xdd500000-0xdd5fffff 64bit]
[    1.237342] pci 0000:72:00.3: enabling Extended Tags
[    1.237387] pci 0000:72:00.3: PME# supported from D0 D3hot D3cold
[    1.237547] pci 0000:72:00.4: [1022:15ba] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.237577] pci 0000:72:00.4: BAR 0 [mem 0xdd400000-0xdd4fffff 64bit]
[    1.237587] pci 0000:72:00.4: enabling Extended Tags
[    1.237632] pci 0000:72:00.4: PME# supported from D0 D3hot D3cold
[    1.237780] pci 0000:72:00.6: [1022:15e3] type 00 class 0x040300 PCIe E=
ndpoint
[    1.237807] pci 0000:72:00.6: BAR 0 [mem 0xdd780000-0xdd787fff]
[    1.237818] pci 0000:72:00.6: enabling Extended Tags
[    1.237860] pci 0000:72:00.6: PME# supported from D0 D3hot D3cold
[    1.238037] pci 0000:00:08.1: PCI bridge to [bus 72]
[    1.238108] pci 0000:73:00.0: [1022:14ec] type 00 class 0x130000 PCIe E=
ndpoint
[    1.238142] pci 0000:73:00.0: enabling Extended Tags
[    1.238196] pci 0000:73:00.0: PME# supported from D3hot D3cold
[    1.238325] pci 0000:73:00.1: [1022:1502] type 00 class 0x118000 PCIe E=
ndpoint
[    1.238361] pci 0000:73:00.1: BAR 0 [mem 0xdda00000-0xdda7ffff]
[    1.238365] pci 0000:73:00.1: BAR 1 [mem 0xddac0000-0xddac1fff]
[    1.238369] pci 0000:73:00.1: BAR 2 [mem 0xf810000000-0xf81003ffff 64bi=
t pref]
[    1.238374] pci 0000:73:00.1: BAR 4 [mem 0xdda80000-0xddabffff]
[    1.238382] pci 0000:73:00.1: enabling Extended Tags
[    1.238563] pci 0000:00:08.2: PCI bridge to [bus 73]
[    1.238670] pci 0000:74:00.0: [1022:14ec] type 00 class 0x130000 PCIe E=
ndpoint
[    1.238704] pci 0000:74:00.0: enabling Extended Tags
[    1.238862] pci 0000:74:00.3: [1022:15c0] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.238891] pci 0000:74:00.3: BAR 0 [mem 0xdd900000-0xdd9fffff 64bit]
[    1.238902] pci 0000:74:00.3: enabling Extended Tags
[    1.238947] pci 0000:74:00.3: PME# supported from D0 D3hot D3cold
[    1.239095] pci 0000:74:00.4: [1022:15c1] type 00 class 0x0c0330 PCIe E=
ndpoint
[    1.239124] pci 0000:74:00.4: BAR 0 [mem 0xdd800000-0xdd8fffff 64bit]
[    1.239135] pci 0000:74:00.4: enabling Extended Tags
[    1.239180] pci 0000:74:00.4: PME# supported from D0 D3hot D3cold
[    1.239341] pci 0000:00:08.3: PCI bridge to [bus 74]
[    1.239490] pci_bus 0000:00: on NUMA node 0
[    1.248787] pci 0000:03:00.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.250723] pci 0000:03:04.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.251224] pci 0000:03:05.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.251794] pci 0000:03:06.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.252363] pci 0000:03:07.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.252933] pci 0000:03:08.0: [Firmware Bug]: ACPI status differs from =
reality
[    1.261136] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    1.261225] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    1.261307] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    1.261401] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    1.261490] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    1.261565] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    1.261641] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    1.261716] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    1.264023] iommu: Default domain type: Passthrough
[    1.264023] SCSI subsystem initialized
[    1.264023] libata version 3.00 loaded.
[    1.264023] ACPI: bus type USB registered
[    1.264023] usbcore: registered new interface driver usbfs
[    1.264023] usbcore: registered new interface driver hub
[    1.264023] usbcore: registered new device driver usb
[    1.309026] efivars: Registered efivars operations
[    1.309026] Advanced Linux Sound Architecture Driver Initialized.
[    1.309026] PCI: Using ACPI for IRQ routing
[    1.318530] PCI: pci_cache_line_size set to 64 bytes
[    1.318652] e820: register RAM buffer resource [mem 0x099ff000-0x0bffff=
ff]
[    1.318656] e820: register RAM buffer resource [mem 0x0a200000-0x0bffff=
ff]
[    1.318660] e820: register RAM buffer resource [mem 0x0b000000-0x0bffff=
ff]
[    1.318663] e820: register RAM buffer resource [mem 0x82861000-0x83ffff=
ff]
[    1.318666] e820: register RAM buffer resource [mem 0x85a03000-0x87ffff=
ff]
[    1.318670] e820: register RAM buffer resource [mem 0x87c2c000-0x87ffff=
ff]
[    1.318673] e820: register RAM buffer resource [mem 0x988ba000-0x9bffff=
ff]
[    1.318676] e820: register RAM buffer resource [mem 0x99e84000-0x9bffff=
ff]
[    1.318679] e820: register RAM buffer resource [mem 0x99ffa000-0x9bffff=
ff]
[    1.318683] e820: register RAM buffer resource [mem 0x9a000000-0x9bffff=
ff]
[    1.318686] e820: register RAM buffer resource [mem 0xfde300000-0xfdfff=
ffff]
[    1.318707] pci 0000:72:00.0: vgaarb: setting as boot VGA device
[    1.318707] pci 0000:72:00.0: vgaarb: bridge control possible
[    1.318707] pci 0000:72:00.0: vgaarb: VGA device added: decodes=3Dio+me=
m,owns=3Dnone,locks=3Dnone
[    1.318707] vgaarb: loaded
[    1.318707] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.318707] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    1.318707] clocksource: Switched to clocksource tsc-early
[    1.318707] acpi PNP0C01:00: Reserved [mem 0xe0000000-0xefffffff]
[    1.318707] acpi PNP0C02:00: Could not reserve [mem 0xf7500000-0xf757ff=
ff]
[    1.318707] acpi PNP0C02:01: Reserved [mem 0xfe0000000-0x105fffffff]
[    1.318707] acpi PNP0C02:02: Reserved [io  0x0a00-0x0a2f]
[    1.318707] acpi PNP0C02:02: Reserved [io  0x0a30-0x0a3f]
[    1.318707] acpi PNP0C02:02: Reserved [io  0x0a40-0x0a4f]
[    1.318707] acpi PNP0C02:02: Reserved [mem 0xfe100000-0xfe11ffff]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0010-0x001f]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0022-0x003f]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0063]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0065]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0067-0x006f]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0072-0x007f]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0080]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0084-0x0086]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0088]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x008c-0x008e]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x0090-0x009f]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x00a2-0x00bf]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x00b1]
[    1.318707] acpi PNP0C02:03: Skipped [io  0x00e0-0x00ef]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x04d0-0x04d1]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x040b]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x04d6]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0c00-0x0c01]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0c14]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0c50-0x0c51]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0c52]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0c6c]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0c6f]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0cd8-0x0cdf]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0800-0x089f]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0b00-0x0b0f]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0b20-0x0b3f]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0900-0x090f]
[    1.318707] acpi PNP0C02:03: Reserved [io  0x0910-0x091f]
[    1.318707] acpi PNP0C02:03: Reserved [mem 0xfedc0000-0xfedc0fff]
[    1.318707] acpi PNP0C02:03: Reserved [mem 0xfee00000-0xfee00fff]
[    1.318707] acpi PNP0C02:03: Reserved [mem 0xfec10000-0xfec10fff]
[    1.318707] acpi PNP0C02:03: Reserved [mem 0xfeb00000-0xfeb00fff]
[    1.318707] acpi PNP0C02:03: Reserved [mem 0xff000000-0xffffffff]
[    1.318707] pnp: PnP ACPI init
[    1.328146] pnp: PnP ACPI: found 0 devices
[    1.332820] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, =
max_idle_ns: 2085701024 ns
[    1.332937] NET: Registered PF_INET protocol family
[    1.333012] IP idents hash table entries: 262144 (order: 9, 2097152 byt=
es, linear)
[    1.335003] tcp_listen_portaddr_hash hash table entries: 32768 (order: =
7, 524288 bytes, linear)
[    1.335043] Table-perturb hash table entries: 65536 (order: 6, 262144 b=
ytes, linear)
[    1.335054] TCP established hash table entries: 524288 (order: 10, 4194=
304 bytes, linear)
[    1.335364] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes=
, linear)
[    1.335438] TCP: Hash tables configured (established 524288 bind 65536)
[    1.335466] UDP hash table entries: 32768 (order: 9, 2097152 bytes, lin=
ear)
[    1.335584] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.335679] RPC: Registered named UNIX socket transport module.
[    1.335682] RPC: Registered udp transport module.
[    1.335685] RPC: Registered tcp transport module.
[    1.335687] RPC: Registered tcp-with-tls transport module.
[    1.335690] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.335944] pci 0000:11:01.0: bridge window [io  0x1000-0x0fff] to [bus=
 13] add_size 1000
[    1.335949] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 13] add_size 200000 add_align 100000
[    1.335955] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 13] add_size 200000 add_align 100000
[    1.335960] pci 0000:11:02.0: bridge window [io  0x1000-0x0fff] to [bus=
 14] add_size 1000
[    1.335965] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 14] add_size 200000 add_align 100000
[    1.335970] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 14] add_size 200000 add_align 100000
[    1.335975] pci 0000:11:03.0: bridge window [io  0x1000-0x0fff] to [bus=
 15] add_size 1000
[    1.335979] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 15] add_size 200000 add_align 100000
[    1.335985] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 15] add_size 200000 add_align 100000
[    1.335990] pci 0000:10:00.0: bridge window [io  0x1000-0x0fff] to [bus=
 11-16] add_size 3000
[    1.335997] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 11-16] add_size 600000 add_align 100000
[    1.336004] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 11-16] add_size 600000 add_align 100000
[    1.336017] pci 0000:00:01.2: PCI bridge to [bus 01]
[    1.336026] pci 0000:00:01.2:   bridge window [mem 0xddb00000-0xddbffff=
f]
[    1.336055] pci 0000:03:00.0: PCI bridge to [bus 04]
[    1.336071] pci 0000:03:02.0: PCI bridge to [bus 05]
[    1.336075] pci 0000:03:02.0:   bridge window [io  0xf000-0xffff]
[    1.336081] pci 0000:03:02.0:   bridge window [mem 0xdd000000-0xdd0ffff=
f]
[    1.336091] pci 0000:03:03.0: PCI bridge to [bus 06]
[    1.336096] pci 0000:03:03.0:   bridge window [mem 0xdca00000-0xdccffff=
f]
[    1.336105] pci 0000:03:04.0: PCI bridge to [bus 07]
[    1.336117] pci 0000:03:05.0: PCI bridge to [bus 08]
[    1.336128] pci 0000:03:06.0: PCI bridge to [bus 09]
[    1.336139] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    1.336150] pci 0000:03:08.0: PCI bridge to [bus 0b]
[    1.336162] pci 0000:03:0c.0: PCI bridge to [bus 0c]
[    1.336167] pci 0000:03:0c.0:   bridge window [mem 0xdcf00000-0xdcfffff=
f]
[    1.336176] pci 0000:03:0d.0: PCI bridge to [bus 0d]
[    1.336182] pci 0000:03:0d.0:   bridge window [mem 0xdce00000-0xdceffff=
f]
[    1.336191] pci 0000:02:00.0: PCI bridge to [bus 03-0d]
[    1.336195] pci 0000:02:00.0:   bridge window [io  0xf000-0xffff]
[    1.336201] pci 0000:02:00.0:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    1.336210] pci 0000:00:02.1: PCI bridge to [bus 02-0d]
[    1.336214] pci 0000:00:02.1:   bridge window [io  0xf000-0xffff]
[    1.336219] pci 0000:00:02.1:   bridge window [mem 0xdca00000-0xdd0ffff=
f]
[    1.336249] pci 0000:10:00.0: bridge window [mem 0xc4000000-0xc45fffff]=
: assigned
[    1.336253] pci 0000:10:00.0: bridge window [mem 0xd800000000-0xd8005ff=
fff 64bit pref]: assigned
[    1.336258] pci 0000:10:00.0: bridge window [io  0xb000-0xdfff]: assign=
ed
[    1.336266] pci 0000:11:01.0: bridge window [mem 0xc4000000-0xc41fffff]=
: assigned
[    1.336270] pci 0000:11:01.0: bridge window [mem 0xd800000000-0xd8001ff=
fff 64bit pref]: assigned
[    1.336274] pci 0000:11:02.0: bridge window [mem 0xc4200000-0xc43fffff]=
: assigned
[    1.336278] pci 0000:11:02.0: bridge window [mem 0xd800200000-0xd8003ff=
fff 64bit pref]: assigned
[    1.336283] pci 0000:11:03.0: bridge window [mem 0xc4400000-0xc45fffff]=
: assigned
[    1.336286] pci 0000:11:03.0: bridge window [mem 0xd800400000-0xd8005ff=
fff 64bit pref]: assigned
[    1.336291] pci 0000:11:01.0: bridge window [io  0xb000-0xbfff]: assign=
ed
[    1.336295] pci 0000:11:02.0: bridge window [io  0xc000-0xcfff]: assign=
ed
[    1.336298] pci 0000:11:03.0: bridge window [io  0xd000-0xdfff]: assign=
ed
[    1.336304] pci 0000:11:00.0: PCI bridge to [bus 12]
[    1.336334] pci 0000:11:01.0: PCI bridge to [bus 13]
[    1.336339] pci 0000:11:01.0:   bridge window [io  0xb000-0xbfff]
[    1.336348] pci 0000:11:01.0:   bridge window [mem 0xc4000000-0xc41ffff=
f]
[    1.336356] pci 0000:11:01.0:   bridge window [mem 0xd800000000-0xd8001=
fffff 64bit pref]
[    1.336368] pci 0000:11:02.0: PCI bridge to [bus 14]
[    1.336372] pci 0000:11:02.0:   bridge window [io  0xc000-0xcfff]
[    1.336382] pci 0000:11:02.0:   bridge window [mem 0xc4200000-0xc43ffff=
f]
[    1.336389] pci 0000:11:02.0:   bridge window [mem 0xd800200000-0xd8003=
fffff 64bit pref]
[    1.336401] pci 0000:11:03.0: PCI bridge to [bus 15]
[    1.336406] pci 0000:11:03.0:   bridge window [io  0xd000-0xdfff]
[    1.336415] pci 0000:11:03.0:   bridge window [mem 0xc4400000-0xc45ffff=
f]
[    1.336422] pci 0000:11:03.0:   bridge window [mem 0xd800400000-0xd8005=
fffff 64bit pref]
[    1.336434] pci 0000:11:04.0: PCI bridge to [bus 16]
[    1.336455] pci 0000:10:00.0: PCI bridge to [bus 11-16]
[    1.336460] pci 0000:10:00.0:   bridge window [io  0xb000-0xdfff]
[    1.336469] pci 0000:10:00.0:   bridge window [mem 0xc4000000-0xc45ffff=
f]
[    1.336476] pci 0000:10:00.0:   bridge window [mem 0xd800000000-0xd8005=
fffff 64bit pref]
[    1.336488] pci 0000:0f:00.0: PCI bridge to [bus 10-3f]
[    1.336492] pci 0000:0f:00.0:   bridge window [io  0xb000-0xdfff]
[    1.336498] pci 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[    1.336503] pci 0000:0f:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[    1.336511] pci 0000:0f:01.0: PCI bridge to [bus 40-6f]
[    1.336515] pci 0000:0f:01.0:   bridge window [io  0x8000-0xafff]
[    1.336521] pci 0000:0f:01.0:   bridge window [mem 0xac000000-0xc3fffff=
f]
[    1.336526] pci 0000:0f:01.0:   bridge window [mem 0xb800000000-0xd7fff=
fffff 64bit pref]
[    1.336534] pci 0000:0f:02.0: PCI bridge to [bus 70]
[    1.336539] pci 0000:0f:02.0:   bridge window [mem 0xdc400000-0xdc7ffff=
f]
[    1.336549] pci 0000:0f:03.0: PCI bridge to [bus 71]
[    1.336554] pci 0000:0f:03.0:   bridge window [mem 0xdc000000-0xdc3ffff=
f]
[    1.336563] pci 0000:0e:00.0: PCI bridge to [bus 0f-71]
[    1.336567] pci 0000:0e:00.0:   bridge window [io  0x8000-0xdfff]
[    1.336573] pci 0000:0e:00.0:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    1.336578] pci 0000:0e:00.0:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    1.336586] pci 0000:00:02.2: PCI bridge to [bus 0e-71]
[    1.336590] pci 0000:00:02.2:   bridge window [io  0x8000-0xdfff]
[    1.336595] pci 0000:00:02.2:   bridge window [mem 0xac000000-0xdc7ffff=
f]
[    1.336599] pci 0000:00:02.2:   bridge window [mem 0xb800000000-0xf7fff=
fffff 64bit pref]
[    1.336626] pci 0000:00:08.1: PCI bridge to [bus 72]
[    1.336630] pci 0000:00:08.1:   bridge window [io  0xe000-0xefff]
[    1.336635] pci 0000:00:08.1:   bridge window [mem 0xdd200000-0xdd7ffff=
f]
[    1.336640] pci 0000:00:08.1:   bridge window [mem 0xf800000000-0xf80ff=
fffff 64bit pref]
[    1.336646] pci 0000:00:08.2: PCI bridge to [bus 73]
[    1.336651] pci 0000:00:08.2:   bridge window [mem 0xdda00000-0xddaffff=
f]
[    1.336655] pci 0000:00:08.2:   bridge window [mem 0xf810000000-0xf8100=
fffff 64bit pref]
[    1.336662] pci 0000:00:08.3: PCI bridge to [bus 74]
[    1.336666] pci 0000:00:08.3:   bridge window [mem 0xdd800000-0xdd9ffff=
f]
[    1.336673] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    1.336677] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    1.336680] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    1.336683] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    1.336687] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff wind=
ow]
[    1.336690] pci_bus 0000:00: resource 9 [mem 0xf2000000-0xf6ffffff wind=
ow]
[    1.336694] pci_bus 0000:00: resource 10 [mem 0xf0000000-0xf1ffffff win=
dow]
[    1.336697] pci_bus 0000:00: resource 11 [mem 0xa0000000-0xdfffffff win=
dow]
[    1.336701] pci_bus 0000:00: resource 12 [mem 0x1060000000-0xfcffffffff=
 window]
[    1.336704] pci_bus 0000:01: resource 1 [mem 0xddb00000-0xddbfffff]
[    1.336708] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
[    1.336711] pci_bus 0000:02: resource 1 [mem 0xdca00000-0xdd0fffff]
[    1.336714] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
[    1.336717] pci_bus 0000:03: resource 1 [mem 0xdca00000-0xdd0fffff]
[    1.336721] pci_bus 0000:05: resource 0 [io  0xf000-0xffff]
[    1.336724] pci_bus 0000:05: resource 1 [mem 0xdd000000-0xdd0fffff]
[    1.336727] pci_bus 0000:06: resource 1 [mem 0xdca00000-0xdccfffff]
[    1.336730] pci_bus 0000:0c: resource 1 [mem 0xdcf00000-0xdcffffff]
[    1.336734] pci_bus 0000:0d: resource 1 [mem 0xdce00000-0xdcefffff]
[    1.336737] pci_bus 0000:0e: resource 0 [io  0x8000-0xdfff]
[    1.336740] pci_bus 0000:0e: resource 1 [mem 0xac000000-0xdc7fffff]
[    1.336743] pci_bus 0000:0e: resource 2 [mem 0xb800000000-0xf7ffffffff =
64bit pref]
[    1.336747] pci_bus 0000:0f: resource 0 [io  0x8000-0xdfff]
[    1.336750] pci_bus 0000:0f: resource 1 [mem 0xac000000-0xdc7fffff]
[    1.336753] pci_bus 0000:0f: resource 2 [mem 0xb800000000-0xf7ffffffff =
64bit pref]
[    1.336757] pci_bus 0000:10: resource 0 [io  0xb000-0xdfff]
[    1.336760] pci_bus 0000:10: resource 1 [mem 0xc4000000-0xdbffffff]
[    1.336763] pci_bus 0000:10: resource 2 [mem 0xd800000000-0xf7ffffffff =
64bit pref]
[    1.336767] pci_bus 0000:11: resource 0 [io  0xb000-0xdfff]
[    1.336770] pci_bus 0000:11: resource 1 [mem 0xc4000000-0xc45fffff]
[    1.336773] pci_bus 0000:11: resource 2 [mem 0xd800000000-0xd8005fffff =
64bit pref]
[    1.336777] pci_bus 0000:13: resource 0 [io  0xb000-0xbfff]
[    1.336780] pci_bus 0000:13: resource 1 [mem 0xc4000000-0xc41fffff]
[    1.336783] pci_bus 0000:13: resource 2 [mem 0xd800000000-0xd8001fffff =
64bit pref]
[    1.336787] pci_bus 0000:14: resource 0 [io  0xc000-0xcfff]
[    1.336790] pci_bus 0000:14: resource 1 [mem 0xc4200000-0xc43fffff]
[    1.336793] pci_bus 0000:14: resource 2 [mem 0xd800200000-0xd8003fffff =
64bit pref]
[    1.336797] pci_bus 0000:15: resource 0 [io  0xd000-0xdfff]
[    1.336800] pci_bus 0000:15: resource 1 [mem 0xc4400000-0xc45fffff]
[    1.336803] pci_bus 0000:15: resource 2 [mem 0xd800400000-0xd8005fffff =
64bit pref]
[    1.336807] pci_bus 0000:40: resource 0 [io  0x8000-0xafff]
[    1.336810] pci_bus 0000:40: resource 1 [mem 0xac000000-0xc3ffffff]
[    1.336813] pci_bus 0000:40: resource 2 [mem 0xb800000000-0xd7ffffffff =
64bit pref]
[    1.336817] pci_bus 0000:70: resource 1 [mem 0xdc400000-0xdc7fffff]
[    1.336820] pci_bus 0000:71: resource 1 [mem 0xdc000000-0xdc3fffff]
[    1.336824] pci_bus 0000:72: resource 0 [io  0xe000-0xefff]
[    1.336827] pci_bus 0000:72: resource 1 [mem 0xdd200000-0xdd7fffff]
[    1.336830] pci_bus 0000:72: resource 2 [mem 0xf800000000-0xf80fffffff =
64bit pref]
[    1.336834] pci_bus 0000:73: resource 1 [mem 0xdda00000-0xddafffff]
[    1.336837] pci_bus 0000:73: resource 2 [mem 0xf810000000-0xf8100fffff =
64bit pref]
[    1.336841] pci_bus 0000:74: resource 1 [mem 0xdd800000-0xdd9fffff]
[    1.337034] pci 0000:00:00.0: enhanced atomics disabled
[    1.337452] pci 0000:72:00.1: D0 power state depends on 0000:72:00.0
[    1.337983] PCI: CLS 64 bytes, default 64
[    1.338013] NET: Registered PF_INET6 protocol family
[    1.338179] Segment Routing with IPv6
[    1.338188] In-situ OAM (IOAM) with IPv6
[    1.338250] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters suppor=
ted
[    1.338350] pci 0000:00:01.0: Adding to iommu group 0
[    1.338382] pci 0000:00:01.2: Adding to iommu group 1
[    1.338463] pci 0000:00:02.0: Adding to iommu group 2
[    1.338495] pci 0000:00:02.1: Adding to iommu group 3
[    1.338522] pci 0000:00:02.2: Adding to iommu group 4
[    1.338562] pci 0000:00:03.0: Adding to iommu group 5
[    1.338602] pci 0000:00:04.0: Adding to iommu group 6
[    1.338691] pci 0000:00:08.0: Adding to iommu group 7
[    1.338723] pci 0000:00:08.1: Adding to iommu group 8
[    1.338751] pci 0000:00:08.2: Adding to iommu group 9
[    1.338780] pci 0000:00:08.3: Adding to iommu group 10
[    1.338834] pci 0000:00:14.0: Adding to iommu group 11
[    1.338860] pci 0000:00:14.3: Adding to iommu group 11
[    1.339002] pci 0000:00:18.0: Adding to iommu group 12
[    1.339029] pci 0000:00:18.1: Adding to iommu group 12
[    1.339056] pci 0000:00:18.2: Adding to iommu group 12
[    1.339082] pci 0000:00:18.3: Adding to iommu group 12
[    1.339109] pci 0000:00:18.4: Adding to iommu group 12
[    1.339137] pci 0000:00:18.5: Adding to iommu group 12
[    1.339164] pci 0000:00:18.6: Adding to iommu group 12
[    1.339191] pci 0000:00:18.7: Adding to iommu group 12
[    1.339223] pci 0000:01:00.0: Adding to iommu group 13
[    1.339256] pci 0000:02:00.0: Adding to iommu group 14
[    1.339291] pci 0000:03:00.0: Adding to iommu group 15
[    1.339325] pci 0000:03:02.0: Adding to iommu group 16
[    1.339360] pci 0000:03:03.0: Adding to iommu group 17
[    1.339394] pci 0000:03:04.0: Adding to iommu group 18
[    1.339429] pci 0000:03:05.0: Adding to iommu group 19
[    1.339465] pci 0000:03:06.0: Adding to iommu group 20
[    1.339498] pci 0000:03:07.0: Adding to iommu group 21
[    1.339533] pci 0000:03:08.0: Adding to iommu group 22
[    1.339567] pci 0000:03:0c.0: Adding to iommu group 23
[    1.339603] pci 0000:03:0d.0: Adding to iommu group 24
[    1.339611] pci 0000:05:00.0: Adding to iommu group 16
[    1.339619] pci 0000:06:00.0: Adding to iommu group 17
[    1.339627] pci 0000:0c:00.0: Adding to iommu group 23
[    1.339635] pci 0000:0d:00.0: Adding to iommu group 24
[    1.339665] pci 0000:0e:00.0: Adding to iommu group 25
[    1.339702] pci 0000:0f:00.0: Adding to iommu group 26
[    1.339736] pci 0000:0f:01.0: Adding to iommu group 27
[    1.339771] pci 0000:0f:02.0: Adding to iommu group 28
[    1.339804] pci 0000:0f:03.0: Adding to iommu group 29
[    1.339813] pci 0000:10:00.0: Adding to iommu group 26
[    1.339834] pci 0000:11:00.0: Adding to iommu group 26
[    1.339846] pci 0000:11:01.0: Adding to iommu group 26
[    1.339859] pci 0000:11:02.0: Adding to iommu group 26
[    1.339871] pci 0000:11:03.0: Adding to iommu group 26
[    1.339883] pci 0000:11:04.0: Adding to iommu group 26
[    1.339891] pci 0000:70:00.0: Adding to iommu group 28
[    1.339901] pci 0000:71:00.0: Adding to iommu group 29
[    1.339950] pci 0000:72:00.0: Adding to iommu group 30
[    1.339978] pci 0000:72:00.1: Adding to iommu group 31
[    1.340006] pci 0000:72:00.2: Adding to iommu group 32
[    1.340034] pci 0000:72:00.3: Adding to iommu group 33
[    1.340062] pci 0000:72:00.4: Adding to iommu group 34
[    1.340090] pci 0000:72:00.6: Adding to iommu group 35
[    1.340118] pci 0000:73:00.0: Adding to iommu group 36
[    1.340149] pci 0000:73:00.1: Adding to iommu group 37
[    1.340179] pci 0000:74:00.0: Adding to iommu group 38
[    1.340207] pci 0000:74:00.3: Adding to iommu group 39
[    1.340235] pci 0000:74:00.4: Adding to iommu group 40
[    1.342833] AMD-Vi: Extended features (0x246577efa2254afa, 0x0): PPR NX=
 GT [5] IA GA PC GA_vAPIC PerfOpt
[    1.342846] AMD-Vi: Interrupt remapping enabled
[    1.740748] AMD-Vi: Virtual APIC enabled
[    1.740786] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.740791] software IO TLB: mapped [mem 0x000000007dc3b000-0x000000008=
1c3b000] (64MB)
[    1.740844] ACPI: bus type thunderbolt registered
[    1.741054] thunderbolt 0000:71:00.0: enabling device (0000 -> 0002)
[    1.741133] thunderbolt 0000:71:00.0: IOMMU DMA protection is enabled
[    1.741140] thunderbolt 0000:71:00.0: total paths: 21
[    1.742192] thunderbolt 0000:71:00.0: allocating TX ring 0 of size 10
[    1.742271] thunderbolt 0000:71:00.0: allocating RX ring 0 of size 10
[    1.742346] thunderbolt 0000:71:00.0: control channel created
[    1.742348] thunderbolt 0000:71:00.0: using software connection manager
[    1.742483] thunderbolt 0000:71:00.0: created link from 0000:0f:00.0
[    1.742504] thunderbolt 0000:71:00.0: created link from 0000:0f:01.0
[    1.742575] thunderbolt 0000:71:00.0: NHI initialized, starting thunder=
bolt
[    1.742577] thunderbolt 0000:71:00.0: control channel starting...
[    1.742578] thunderbolt 0000:71:00.0: starting TX ring 0
[    1.742595] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 0 (0x0 -> 0x1)
[    1.742597] thunderbolt 0000:71:00.0: starting RX ring 0
[    1.742604] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 21 (0x1 -> 0x200001)
[    1.742611] thunderbolt 0000:71:00.0: security level set to user
[    1.742786] thunderbolt 0000:71:00.0: current switch config:
[    1.742788] thunderbolt 0000:71:00.0:  USB4 Switch: 174c:2428 (Revision=
: 0, TB Version: 32)
[    1.742790] thunderbolt 0000:71:00.0:   Max Port Number: 11
[    1.742791] thunderbolt 0000:71:00.0:   Config:
[    1.742793] thunderbolt 0000:71:00.0:    Upstream Port Number: 5 Depth:=
 0 Route String: 0x0 Enabled: 1, PlugEventsDelay: 255ms
[    1.742795] thunderbolt 0000:71:00.0:    unknown1: 0x0 unknown4: 0x0
[    1.744624] thunderbolt 0000:71:00.0: initializing Switch at 0x0 (depth=
: 0, up port: 5)
[    1.746952] thunderbolt 0000:71:00.0: 0: credit allocation parameters:
[    1.746955] thunderbolt 0000:71:00.0: 0:  USB3: 64
[    1.746958] thunderbolt 0000:71:00.0: 0:  DP AUX: 2
[    1.746960] thunderbolt 0000:71:00.0: 0:  DP main: 0
[    1.746963] thunderbolt 0000:71:00.0: 0:  PCIe: 64
[    1.746965] thunderbolt 0000:71:00.0: 0:  DMA: 32
[    1.749243] thunderbolt 0000:71:00.0: 0: DROM version: 1
[    1.749931] thunderbolt 0000:71:00.0: 0: uid: 0x5a447f00174c872d
[    1.750696] thunderbolt 0000:71:00.0:  Port 1: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.750700] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.750703] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.750705] thunderbolt 0000:71:00.0:   NFC Credits: 0x4ae00000
[    1.750716] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.751411] thunderbolt 0000:71:00.0:  Port 2: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.751415] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.751417] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.751420] thunderbolt 0000:71:00.0:   NFC Credits: 0x8ae00000
[    1.751422] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.752185] thunderbolt 0000:71:00.0:  Port 3: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.752188] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.752190] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.752193] thunderbolt 0000:71:00.0:   NFC Credits: 0xae00000
[    1.752195] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.752883] thunderbolt 0000:71:00.0:  Port 4: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: Port (0x1))
[    1.752886] thunderbolt 0000:71:00.0:   Max hop id (in/out): 27/27
[    1.752889] thunderbolt 0000:71:00.0:   Max counters: 7
[    1.752891] thunderbolt 0000:71:00.0:   NFC Credits: 0xae00000
[    1.752893] thunderbolt 0000:71:00.0:   Credits (total/control): 174/2
[    1.753049] thunderbolt 0000:71:00.0:  Port 5: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: NHI (0x2))
[    1.753052] thunderbolt 0000:71:00.0:   Max hop id (in/out): 20/27
[    1.753054] thunderbolt 0000:71:00.0:   Max counters: 0
[    1.753057] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753059] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753215] thunderbolt 0000:71:00.0:  Port 6: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: PCIe (0x100101))
[    1.753218] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    1.753221] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753223] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753225] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753381] thunderbolt 0000:71:00.0:  Port 7: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: PCIe (0x100101))
[    1.753384] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    1.753387] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753389] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753391] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753547] thunderbolt 0000:71:00.0:  Port 8: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: USB (0x200101))
[    1.753550] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/27
[    1.753553] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753555] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753557] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753713] thunderbolt 0000:71:00.0:  Port 9: 0:0 (Revision: 0, TB Ver=
sion: 1, Type: USB (0x200101))
[    1.753716] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/27
[    1.753719] thunderbolt 0000:71:00.0:   Max counters: 1
[    1.753721] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753723] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.753879] thunderbolt 0000:71:00.0:  Port 10: 0:0 (Revision: 0, TB Ve=
rsion: 1, Type: DP/HDMI (0xe0101))
[    1.753882] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/27
[    1.753885] thunderbolt 0000:71:00.0:   Max counters: 0
[    1.753887] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.753889] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.754045] thunderbolt 0000:71:00.0:  Port 11: 0:0 (Revision: 0, TB Ve=
rsion: 1, Type: DP/HDMI (0xe0101))
[    1.754048] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/27
[    1.754050] thunderbolt 0000:71:00.0:   Max counters: 0
[    1.754053] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    1.754055] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    1.754057] thunderbolt 0000:71:00.0: 0: running quirk_stuck_pending
[    1.754065] thunderbolt 0000:71:00.0: 0:5: pending bit does not clear, =
reading it once
[    1.755972] thunderbolt 0000:71:00.0: 0: TMU: supports uni-directional =
mode
[    1.756050] thunderbolt 0000:71:00.0: 0: TMU: current mode: bi-directio=
nal, HiFi
[    1.757326] thunderbolt 0000:71:00.0: 0: NVM version 200011.240521
[    1.757466] thunderbolt 0000:71:00.0: 0: TMU: mode change bi-directiona=
l, HiFi -> uni-directional, LowRes requested
[    1.757801] thunderbolt 0000:71:00.0: 0: TMU: mode set to: uni-directio=
nal, LowRes
[    1.758040] thunderbolt 0000:71:00.0: 0: resetting
[    1.759021] thunderbolt 0000:71:00.0: acking hot unplug event on 0:1
[    1.790852] thunderbolt 0000:71:00.0: 0:10: DP IN resource available
[    1.791286] thunderbolt 0000:71:00.0: 0:11: DP IN resource available
[    1.791298] thunderbolt 0000:71:00.0: 0:1: got unplug event for disconn=
ected port, ignoring
[    1.791529] RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 16384=
0 ms ovfl timer
[    1.791537] RAPL PMU: hw unit of domain package 2^-16 Joules
[    1.791542] RAPL PMU: hw unit of domain core 2^-16 Joules
[    1.791548] LVT offset 0 assigned for vector 0x400
[    1.791700] perf: AMD IBS detected (0x00000bff)
[    1.791820] amd_uncore: 4 amd_df counters detected
[    1.791838] amd_uncore: 6 amd_l3 counters detected
[    1.791850] amd_uncore: 4 amd_umc_0 counters detected
[    1.791862] amd_uncore: 4 amd_umc_1 counters detected
[    1.791873] amd_uncore: 4 amd_umc_2 counters detected
[    1.791883] amd_uncore: 4 amd_umc_3 counters detected
[    1.791994] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/=
bank).
[    1.792037] kvm_amd: TSC scaling supported
[    1.792041] kvm_amd: Nested Virtualization enabled
[    1.792047] kvm_amd: Nested Paging enabled
[    1.792051] kvm_amd: LBR virtualization supported
[    1.792058] kvm_amd: AVIC enabled
[    1.792061] kvm_amd: x2AVIC enabled (max 512 vCPUs)
[    1.792066] kvm_amd: Virtual GIF supported
[    1.792069] kvm_amd: Virtual NMI enabled
[    1.796504] mce: Machine check injector initialized
[    1.798194] Initialise system trusted keyrings
[    1.798232] workingset: timestamp_bits=3D46 (anon: 41) max_order=3D24 b=
ucket_order=3D0 (anon: 0)
[    1.798330] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.798367] Key type nfs_keyring registered
[    1.798433] NFS: Registering the id_resolver key type
[    1.798437] Key type id_resolver registered
[    1.798440] Key type id_legacy registered
[    1.798443] nfs4filelayout_init: NFSv4 File Layout Driver Registering..=
.
[    1.798447] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regis=
tering...
[    1.798486] fuse: init (API version 7.47)
[    1.798604] SGI XFS with security attributes, no debug enabled
[    1.798841] cryptd: max_cpu_qlen set to 1000
[    1.803445] NET: Registered PF_ALG protocol family
[    1.803454] Key type asymmetric registered
[    1.803456] Asymmetric key parser 'x509' registered
[    1.803467] Block layer SCSI generic (bsg) driver version 0.4 loaded (m=
ajor 249)
[    1.803471] io scheduler mq-deadline registered
[    1.803474] io scheduler kyber registered
[    1.803488] io scheduler bfq registered
[    1.805083] pcieport 0000:00:01.2: PME: Signaling with IRQ 49
[    1.805350] pcieport 0000:00:02.1: PME: Signaling with IRQ 50
[    1.805607] pcieport 0000:00:02.2: PME: Signaling with IRQ 51
[    1.805868] pcieport 0000:00:08.1: PME: Signaling with IRQ 52
[    1.806145] pcieport 0000:00:08.2: PME: Signaling with IRQ 53
[    1.806370] pcieport 0000:00:08.3: PME: Signaling with IRQ 54
[    1.808898] pcieport 0000:0f:00.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.809385] pcieport 0000:0f:00.0: pciehp: Slot(0): Card not present
[    1.809397] pci_bus 0000:12: busn_res: [bus 12] is released
[    1.809703] pci_bus 0000:13: busn_res: [bus 13] is released
[    1.809805] pcieport 0000:0f:01.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[    1.809995] pci_bus 0000:14: busn_res: [bus 14] is released
[    1.810251] pci_bus 0000:15: busn_res: [bus 15] is released
[    1.810483] pci_bus 0000:16: busn_res: [bus 16] is released
[    1.810688] pci_bus 0000:11: busn_res: [bus 11-16] is released
[    1.814327] input: Power Button as /devices/platform/PNP0C0C:00/input/i=
nput0
[    1.814356] ACPI: button: Power Button [PWRB]
[    1.814400] input: Power Button as /devices/platform/LNXPWRBN:00/input/=
input1
[    1.814444] ACPI: button: Power Button [PWRF]
[    1.814567] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  =
post: no)
[    1.814869] input: Video Bus as /devices/pci0000:00/0000:00:08.1/acpi.v=
ideo_bus.0/input/input2
[    1.814919] Monitor-Mwait will be used to enter C-1 state
[    1.818427] Estimated ratio of average max frequency by base frequency =
(times 1024): 1143
[    1.818970] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.820206] Non-volatile memory driver v1.3
[    1.820581] ACPI: bus type drm_connector registered
[    1.834451] amdgpu: Virtual CRAT table created for CPU
[    1.834483] amdgpu: Topology: Add CPU node
[    1.834668] stackdepot: allocating hash table of 1048576 entries via kv=
calloc
[    1.836787] stackdepot: allocating space for 8192 stack pools via kvcal=
loc
[    1.836823] amdgpu 0000:72:00.0: enabling device (0006 -> 0007)
[    1.836907] amdgpu 0000:72:00.0: initializing kernel modesetting (IP DI=
SCOVERY 0x1002:0x15BF 0x1458:0xD000 0x06).
[    1.836926] amdgpu 0000:72:00.0: register mmio base: 0xDD700000
[    1.836929] amdgpu 0000:72:00.0: register mmio size: 524288
[    1.840309] amdgpu 0000:72:00.0: detected ip block number 0 <common_v1_=
0_0> (soc21_common)
[    1.840314] amdgpu 0000:72:00.0: detected ip block number 1 <gmc_v11_0_=
0> (gmc_v11_0)
[    1.840318] amdgpu 0000:72:00.0: detected ip block number 2 <ih_v6_0_0>=
 (ih_v6_0)
[    1.840322] amdgpu 0000:72:00.0: detected ip block number 3 <psp_v13_0_=
4> (psp)
[    1.840326] amdgpu 0000:72:00.0: detected ip block number 4 <smu_v13_0_=
0> (smu)
[    1.840330] amdgpu 0000:72:00.0: detected ip block number 5 <dce_v1_0_0=
> (dm)
[    1.840334] amdgpu 0000:72:00.0: detected ip block number 6 <gfx_v11_0_=
0> (gfx_v11_0)
[    1.840338] amdgpu 0000:72:00.0: detected ip block number 7 <sdma_v6_0_=
0> (sdma_v6_0)
[    1.840343] amdgpu 0000:72:00.0: detected ip block number 8 <vcn_v4_0_0=
> (vcn_v4_0)
[    1.840347] amdgpu 0000:72:00.0: detected ip block number 9 <jpeg_v4_0_=
0> (jpeg_v4_0)
[    1.840351] amdgpu 0000:72:00.0: detected ip block number 10 <mes_v11_0=
_0> (mes_v11_0)
[    1.840373] amdgpu 0000:72:00.0: Fetched VBIOS from VFCT
[    1.840378] amdgpu 0000:72:00.0: [drm] ATOM BIOS: 113-PHXGENERIC-001, b=
uild: 00132130, ver: 022.012.000.028.000001, 2024/12/10
[    1.841482] amdgpu 0000:72:00.0: vgaarb: deactivate vga console
[    1.841487] amdgpu 0000:72:00.0: Trusted Memory Zone (TMZ) feature enab=
led
[    1.841521] amdgpu 0000:72:00.0: vm size is 262144 GB, 4 levels, block =
size is 9-bit, fragment size is 9-bit
[    1.841546] amdgpu 0000:72:00.0: VRAM: 2048M 0x0000008000000000 - 0x000=
000807FFFFFFF (2048M used)
[    1.841551] amdgpu 0000:72:00.0: GART: 512M 0x00007FFF00000000 - 0x0000=
7FFF1FFFFFFF
[    1.841563] amdgpu 0000:72:00.0: [drm] Detected VRAM RAM=3D2048M, BAR=
=3D2048M
[    1.841567] amdgpu 0000:72:00.0: [drm] RAM width 64bits DDR5
[    1.841787] amdgpu 0000:72:00.0:  2048M of VRAM memory ready
[    1.841791] amdgpu 0000:72:00.0:  30931M of GTT memory ready.
[    1.841834] amdgpu 0000:72:00.0: [drm] GART: num cpu pages 131072, num =
gpu pages 131072
[    1.842293] amdgpu 0000:72:00.0: [drm] PCIE GART of 512M enabled (table=
 at 0x000000807FD00000).
[    1.842712] amdgpu 0000:72:00.0: [drm] Loading DMUB firmware via PSP: v=
ersion=3D0x08006500
[    1.843152] amdgpu 0000:72:00.0: [VCN instance 0] Found VCN firmware Ve=
rsion ENC: 1.24 DEC: 9 VEP: 0 Revision: 55
[    1.843282] amdgpu 0000:72:00.0: MES: vmid_uq_mask_mmhub 0x0000ff00, vm=
id_uq_mask_gfxhub 0x0000ff00
[    1.843287] amdgpu 0000:72:00.0: MES: gfx_hqd_mask 0x00000002, compute_=
hqd_mask 0x0000000c, sdma_hqd_mask 0x000000fc
[    1.868602] amdgpu 0000:72:00.0: reserve 0x4a00000 from 0x8070000000 fo=
r PSP TMR
[    2.575588] amdgpu 0000:72:00.0: RAS: optional ras ta ucode is not avai=
lable
[    2.583458] amdgpu 0000:72:00.0: RAP: optional rap ta ucode is not avai=
lable
[    2.583465] amdgpu 0000:72:00.0: SECUREDISPLAY: optional securedisplay =
ta ucode is not available
[    2.583512] amdgpu 0000:72:00.0: smu driver if version =3D 0x00000008, =
smu fw if version =3D 0x00000008, smu fw program =3D 0, smu fw version =3D=
 0x004c7500 (76.117.0)
[    2.609984] amdgpu 0000:72:00.0: SMU is initialized successfully!
[    2.610982] amdgpu 0000:72:00.0: [drm] Display Core v3.2.401 initialize=
d on DCN 3.1.4
[    2.610987] amdgpu 0000:72:00.0: [drm] DP-HDMI FRL PCON supported
[    2.613788] amdgpu 0000:72:00.0: [drm] DMUB hardware initialized: versi=
on=3D0x08006500
[    2.649509] amdgpu 0000:72:00.0: [drm] HDMI-A-1: PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.649552] amdgpu 0000:72:00.0: [drm] HDMI-A-2: PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.649601] amdgpu 0000:72:00.0: [drm] DP-1: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.649651] amdgpu 0000:72:00.0: [drm] DP-2: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.649729] amdgpu 0000:72:00.0: [drm] DP-3: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.649793] amdgpu 0000:72:00.0: [drm] DP-4: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.649872] amdgpu 0000:72:00.0: [drm] DP-5: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.649936] amdgpu 0000:72:00.0: [drm] DP-6: PSR support 0, DC PSR ver =
-1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    2.659054] kfd kfd: Allocated 3969056 bytes on gart
[    2.659072] kfd kfd: Total number of KFD nodes to be created: 1
[    2.659175] amdgpu: Virtual CRAT table created for GPU
[    2.659345] amdgpu: Topology: Add GPU node [0x1002:0x15bf]
[    2.659349] kfd kfd: added device 1002:15bf
[    2.659362] amdgpu 0000:72:00.0: SE 1, SH per SE 2, CU per SH 6, active=
_cu_number 12
[    2.659369] amdgpu 0000:72:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hu=
b 0
[    2.659373] amdgpu 0000:72:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hu=
b 0
[    2.659377] amdgpu 0000:72:00.0: ring comp_1.0.0 uses VM inv eng 4 on h=
ub 0
[    2.659380] amdgpu 0000:72:00.0: ring comp_1.1.0 uses VM inv eng 6 on h=
ub 0
[    2.659384] amdgpu 0000:72:00.0: ring comp_1.2.0 uses VM inv eng 7 on h=
ub 0
[    2.659387] amdgpu 0000:72:00.0: ring comp_1.3.0 uses VM inv eng 8 on h=
ub 0
[    2.659391] amdgpu 0000:72:00.0: ring comp_1.0.1 uses VM inv eng 9 on h=
ub 0
[    2.659394] amdgpu 0000:72:00.0: ring comp_1.1.1 uses VM inv eng 10 on =
hub 0
[    2.659398] amdgpu 0000:72:00.0: ring comp_1.2.1 uses VM inv eng 11 on =
hub 0
[    2.659401] amdgpu 0000:72:00.0: ring comp_1.3.1 uses VM inv eng 12 on =
hub 0
[    2.659405] amdgpu 0000:72:00.0: ring sdma0 uses VM inv eng 13 on hub 0
[    2.659409] amdgpu 0000:72:00.0: ring vcn_unified_0 uses VM inv eng 0 o=
n hub 8
[    2.659412] amdgpu 0000:72:00.0: ring jpeg_dec uses VM inv eng 1 on hub=
 8
[    2.659416] amdgpu 0000:72:00.0: ring mes_kiq_3.1.0 uses VM inv eng 14 =
on hub 0
[    2.660198] amdgpu 0000:72:00.0: Runtime PM not available
[    2.661241] amdgpu 0000:72:00.0: [drm] Registered 4 planes with drm pan=
ic
[    2.661281] [drm] Initialized amdgpu 3.65.0 for 0000:72:00.0 on minor 0
[    2.663751] amdgpu 0000:72:00.0: [drm] Cannot find any crtc or sizes
[    2.663782] [drm] pre_validate_dsc:1825 MST_DSC dsc precompute is not n=
eeded
[    2.668380] brd: module loaded
[    2.670180] loop: module loaded
[    2.670378] Loading iSCSI transport class v2.0-870.
[    2.670499] st: Version 20160209, fixed bufsize 32768, s/g segs 256
[    2.670531] SCSI Media Changer driver v0.25=20
[    2.670552] Key type psk registered
[    2.671019] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    2.671134] nvme nvme0: pci function 0000:01:00.0
[    2.671374] ahci 0000:0d:00.0: SSS flag set, parallel bus scan disabled
[    2.671437] ahci 0000:0d:00.0: AHCI vers 0001.0301, 32 command slots, 6=
 Gbps, SATA mode
[    2.671442] ahci 0000:0d:00.0: 4/6 ports implemented (port mask 0xf)
[    2.671446] ahci 0000:0d:00.0: flags: 64bit ncq sntf stag pm led clo on=
ly pmp pio slum part sxs deso sadm sds apst=20
[    2.672203] scsi host0: ahci
[    2.672400] scsi host1: ahci
[    2.672571] scsi host2: ahci
[    2.672741] scsi host3: ahci
[    2.672856] scsi host4: ahci
[    2.672974] scsi host5: ahci
[    2.673032] ata1: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce801=
00 irq 68 lpm-pol 1 ext
[    2.673037] ata2: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce801=
80 irq 68 lpm-pol 1 ext
[    2.673042] ata3: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce802=
00 irq 68 lpm-pol 1 ext
[    2.673047] ata4: SATA max UDMA/133 abar m1024@0xdce80000 port 0xdce802=
80 irq 68 lpm-pol 1 ext
[    2.673051] ata5: DUMMY
[    2.673053] ata6: DUMMY
[    2.685592] nvme nvme0: D3 entry latency set to 10 seconds
[    2.686556] nvme nvme0: passthrough uses implicit buffer lengths
[    2.691601] nvme nvme0: 16/0/0 default/read/poll queues
[    2.693131] r8169 0000:05:00.0 eth0: RTL8125D, 10:ff:e0:67:3d:cd, XID 6=
88, IRQ 86 (1 total)
[    2.693138] r8169 0000:05:00.0 eth0: jumbo features [frames: 16362 byte=
s, tx checksumming: ko]
[    2.693262] xhci_hcd 0000:0c:00.0: xHCI Host Controller
[    2.693269] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus=
 number 1
[    2.697283]  nvme0n1: p1 p2
[    2.749357] xhci_hcd 0000:0c:00.0: hcc params 0x0200ef81 hci version 0x=
110 quirks 0x0000000000000010
[    2.750067] xhci_hcd 0000:0c:00.0: xHCI Host Controller
[    2.750072] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus=
 number 2
[    2.750077] xhci_hcd 0000:0c:00.0: Host supports USB 3.2 Enhanced Super=
Speed
[    2.750297] usb usb1: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.750335] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.750339] usb usb1: Product: xHCI Host Controller
[    2.750342] usb usb1: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.750346] usb usb1: SerialNumber: 0000:0c:00.0
[    2.750538] hub 1-0:1.0: USB hub found
[    2.750567] hub 1-0:1.0: 12 ports detected
[    2.760790] clocksource: Watchdog remote CPU 4 read timed out
[    2.763170] usb usb2: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.763175] usb usb2: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.763210] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.763214] usb usb2: Product: xHCI Host Controller
[    2.763217] usb usb2: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.763220] usb usb2: SerialNumber: 0000:0c:00.0
[    2.763358] hub 2-0:1.0: USB hub found
[    2.763377] hub 2-0:1.0: 5 ports detected
[    2.768562] xhci_hcd 0000:70:00.0: xHCI Host Controller
[    2.768568] xhci_hcd 0000:70:00.0: new USB bus registered, assigned bus=
 number 3
[    2.771334] xhci_hcd 0000:70:00.0: hcc params 0x0200ef81 hci version 0x=
120 quirks 0x0000000200000010
[    2.772374] xhci_hcd 0000:70:00.0: xHCI Host Controller
[    2.772384] xhci_hcd 0000:70:00.0: new USB bus registered, assigned bus=
 number 4
[    2.772392] xhci_hcd 0000:70:00.0: Host supports USB 3.2 Enhanced Super=
Speed
[    2.772430] usb usb3: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.772487] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.772494] usb usb3: Product: xHCI Host Controller
[    2.772500] usb usb3: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.772505] usb usb3: SerialNumber: 0000:70:00.0
[    2.773267] hub 3-0:1.0: USB hub found
[    2.773282] hub 3-0:1.0: 2 ports detected
[    2.775672] usb usb4: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.775677] usb usb4: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.775707] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.775711] usb usb4: Product: xHCI Host Controller
[    2.775714] usb usb4: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.775717] usb usb4: SerialNumber: 0000:70:00.0
[    2.776035] hub 4-0:1.0: USB hub found
[    2.776050] hub 4-0:1.0: 2 ports detected
[    2.778613] xhci_hcd 0000:72:00.3: xHCI Host Controller
[    2.778620] xhci_hcd 0000:72:00.3: new USB bus registered, assigned bus=
 number 5
[    2.779003] xhci_hcd 0000:72:00.3: hcc params 0x0128ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.779521] xhci_hcd 0000:72:00.3: xHCI Host Controller
[    2.779526] xhci_hcd 0000:72:00.3: new USB bus registered, assigned bus=
 number 6
[    2.779530] xhci_hcd 0000:72:00.3: Host supports USB 3.1 Enhanced Super=
Speed
[    2.779546] usb usb5: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.779578] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.779582] usb usb5: Product: xHCI Host Controller
[    2.779584] usb usb5: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.779588] usb usb5: SerialNumber: 0000:72:00.3
[    2.779732] hub 5-0:1.0: USB hub found
[    2.779755] hub 5-0:1.0: 2 ports detected
[    2.781905] usb usb6: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.781910] usb usb6: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.781942] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.781946] usb usb6: Product: xHCI Host Controller
[    2.781949] usb usb6: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.781952] usb usb6: SerialNumber: 0000:72:00.3
[    2.782094] hub 6-0:1.0: USB hub found
[    2.782116] hub 6-0:1.0: 2 ports detected
[    2.784575] xhci_hcd 0000:72:00.4: xHCI Host Controller
[    2.784581] xhci_hcd 0000:72:00.4: new USB bus registered, assigned bus=
 number 7
[    2.784929] xhci_hcd 0000:72:00.4: USB0 root hub has no ports
[    2.784941] xhci_hcd 0000:72:00.4: hcc params 0x0110ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.785162] usb usb7: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.785195] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.785199] usb usb7: Product: xHCI Host Controller
[    2.785202] usb usb7: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.785205] usb usb7: SerialNumber: 0000:72:00.4
[    2.785357] hub 7-0:1.0: USB hub found
[    2.785375] hub 7-0:1.0: 1 port detected
[    2.787057] xhci_hcd 0000:74:00.3: xHCI Host Controller
[    2.787063] xhci_hcd 0000:74:00.3: new USB bus registered, assigned bus=
 number 8
[    2.787424] xhci_hcd 0000:74:00.3: hcc params 0x0110ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.787978] xhci_hcd 0000:74:00.3: xHCI Host Controller
[    2.787983] xhci_hcd 0000:74:00.3: new USB bus registered, assigned bus=
 number 9
[    2.787988] xhci_hcd 0000:74:00.3: Host supports USB 3.1 Enhanced Super=
Speed
[    2.788004] usb usb8: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.788035] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.788039] usb usb8: Product: xHCI Host Controller
[    2.788042] usb usb8: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.788045] usb usb8: SerialNumber: 0000:74:00.3
[    2.788185] hub 8-0:1.0: USB hub found
[    2.788205] hub 8-0:1.0: 1 port detected
[    2.789333] usb usb9: We don't know the algorithms for LPM for this hos=
t, disabling LPM.
[    2.789337] usb usb9: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.789367] usb usb9: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.789371] usb usb9: Product: xHCI Host Controller
[    2.789374] usb usb9: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.789377] usb usb9: SerialNumber: 0000:74:00.3
[    2.789517] hub 9-0:1.0: USB hub found
[    2.789538] hub 9-0:1.0: 1 port detected
[    2.791008] xhci_hcd 0000:74:00.4: xHCI Host Controller
[    2.791014] xhci_hcd 0000:74:00.4: new USB bus registered, assigned bus=
 number 10
[    2.791376] xhci_hcd 0000:74:00.4: hcc params 0x0110ffc5 hci version 0x=
120 quirks 0x0000000200000010
[    2.791929] xhci_hcd 0000:74:00.4: xHCI Host Controller
[    2.791934] xhci_hcd 0000:74:00.4: new USB bus registered, assigned bus=
 number 11
[    2.791938] xhci_hcd 0000:74:00.4: Host supports USB 3.1 Enhanced Super=
Speed
[    2.791954] usb usb10: New USB device found: idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D7.04
[    2.791985] usb usb10: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.791989] usb usb10: Product: xHCI Host Controller
[    2.791992] usb usb10: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.791995] usb usb10: SerialNumber: 0000:74:00.4
[    2.792139] hub 10-0:1.0: USB hub found
[    2.792157] hub 10-0:1.0: 1 port detected
[    2.793304] usb usb11: We don't know the algorithms for LPM for this ho=
st, disabling LPM.
[    2.793308] usb usb11: New USB device found: idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D7.04
[    2.793338] usb usb11: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.793342] usb usb11: Product: xHCI Host Controller
[    2.793345] usb usb11: Manufacturer: Linux 7.4.0-rc4-x86_64 xhci-hcd
[    2.793348] usb usb11: SerialNumber: 0000:74:00.4
[    2.793487] hub 11-0:1.0: USB hub found
[    2.793508] hub 11-0:1.0: 1 port detected
[    2.795036] usbcore: registered new interface driver usb-storage
[    2.795109] i8042: PNP: No PS/2 controller found.
[    2.795209] mousedev: PS/2 mouse device common for all mice
[    2.795534] rtc_cmos PNP0B00:00: RTC can wake from S4
[    2.795871] rtc_cmos PNP0B00:00: registered as rtc0
[    2.795907] rtc_cmos PNP0B00:00: setting system clock to 2026-11-26T09:=
31:31 UTC (1795685491)
[    2.795952] rtc_cmos PNP0B00:00: alarms up to one month, y3k, 114 bytes=
 nvram
[    2.795973] i2c_dev: i2c /dev entries driver
[    2.796534] ir_imon_decoder: IR iMON protocol handler initialized
[    2.796537] IR JVC protocol handler initialized
[    2.796540] IR MCE Keyboard/mouse protocol handler initialized
[    2.796542] IR NEC protocol handler initialized
[    2.796545] IR RC5(x/sz) protocol handler initialized
[    2.796547] IR RC6 protocol handler initialized
[    2.796549] IR RCMM protocol handler initialized
[    2.796552] IR SANYO protocol handler initialized
[    2.796554] IR Sharp protocol handler initialized
[    2.796556] IR Sony protocol handler initialized
[    2.796559] IR XMP protocol handler initialized
[    2.796568] device-mapper: uevent: version 1.0.3
[    2.796620] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised=
: dm-devel@lists.linux.dev
[    2.798599] ccp 0000:72:00.2: enabling device (0000 -> 0002)
[    2.800037] ccp 0000:72:00.2: tee enabled
[    2.800399] ccp 0000:72:00.2: psp enabled
[    2.800443] ccp_crypto: Cannot load: there are no available CCPs
[    2.800462] hid: raw HID events driver (C) Jiri Kosina
[    2.800660] usbcore: registered new interface driver usbhid
[    2.800665] usbhid: USB HID core driver
[    2.800733] tsc: Refined TSC clocksource calibration: 4199.974 MHz
[    2.800748] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x3c=
8a48453a6, max_idle_ns: 440795202126 ns
[    2.800860] clocksource: Switched to clocksource tsc
[    2.800970] usbcore: registered new interface driver snd-usb-audio
[    2.801576] IPVS: Registered protocols ()
[    2.801582] IPVS: Connection hash table configured (size=3D4096, memory=
=3D32Kbytes)
[    2.801617] IPVS: ipvs loaded.
[    2.801728] NET: Registered PF_PACKET protocol family
[    2.801743] 8021q: 802.1Q VLAN Support v1.8
[    2.801760] Key type dns_resolver registered
[    2.804226] x86/amd: Previous system reset reason [0x00080800]: softwar=
e wrote 0x6 to reset control register 0xCF9
[    2.804244] AGESA: AGESA!V9 ComboAm5PI 1.3.0.1e
[    2.804260] microcode: Current revision: 0x0a70520a
[    2.804523] IPI shorthand broadcast: enabled
[    2.818537] sched_clock: Marking stable (2810421071, 707917)->(28290068=
92, -17877904)
[    2.819090] registered taskstats version 1
[    2.819208] Loading compiled-in X.509 certificates
[    2.822835] cfg80211: Loading compiled-in X.509 certificates for regula=
tory database
[    2.824953] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.825100] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db=
18c600'
[    2.993433] ata1: SATA link down (SStatus 0 SControl 300)
[    3.061016] usb 7-1: new high-speed USB device number 2 using xhci_hcd
[    3.061058] usb 5-2: new high-speed USB device number 2 using xhci_hcd
[    3.101041] usb 1-6: new full-speed USB device number 2 using xhci_hcd
[    3.211900] usb 7-1: New USB device found: idVendor=3D05e3, idProduct=
=3D0608, bcdDevice=3D60.70
[    3.214883] usb 7-1: New USB device strings: Mfr=3D0, Product=3D1, Seri=
alNumber=3D0
[    3.214899] usb 7-1: Product: USB2.0 Hub
[    3.217014] usb 5-2: New USB device found: idVendor=3D0bda, idProduct=
=3D5411, bcdDevice=3D1.16
[    3.225395] usb 5-2: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.225409] usb 5-2: Product: USB2.1 Hub
[    3.225414] usb 5-2: Manufacturer: Generic
[    3.261983] hub 5-2:1.0: USB hub found
[    3.263496] hub 5-2:1.0: 4 ports detected
[    3.267402] hub 7-1:1.0: USB hub found
[    3.268265] hub 7-1:1.0: 4 ports detected
[    3.342159] usb 6-2: new SuperSpeed USB device number 2 using xhci_hcd
[    3.368324] usb 6-2: New USB device found: idVendor=3D0bda, idProduct=
=3D0411, bcdDevice=3D1.16
[    3.375475] usb 6-2: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.375489] usb 6-2: Product: USB3.2 Hub
[    3.375494] usb 6-2: Manufacturer: Generic
[    3.405842] hub 6-2:1.0: USB hub found
[    3.407490] hub 6-2:1.0: 4 ports detected
[    3.481167] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.487653] ata2.00: ATA-8: ST2000LM003 HN-M201RAD, 2BC10001, max UDMA/=
133
[    3.488157] ata2.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32)=
, AA
[    3.488169] ata2.00: Features: DIPM
[    3.494802] ata2.00: configured for UDMA/133
[    3.505138] scsi 1:0:0:0: Direct-Access     ATA      ST2000LM003 HN-M 0=
001 PQ: 0 ANSI: 5
[    3.505695] sd 1:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00=
 TB/1.82 TiB)
[    3.505705] sd 1:0:0:0: [sda] 4096-byte physical blocks
[    3.505721] sd 1:0:0:0: [sda] Write Protect is off
[    3.505727] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    3.505747] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled=
, doesn't support DPO or FUA
[    3.505790] sd 1:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
[    3.541509] usb 1-6: New USB device found: idVendor=3D048d, idProduct=
=3D5711, bcdDevice=3D0.03
[    3.571021] usb 7-1.2: new low-speed USB device number 3 using xhci_hcd
[    3.603066] usb 1-6: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.603078] usb 1-6: Product: GIGABYTE Device=20
[    3.603084] usb 1-6: Manufacturer: ITE Tech. Inc.
[    3.622990]  sda: sda2 sda4 sda6 sda8 sda10 sda16 sda17 sda18 sda19 sda=
20 sda21 sda22 sda23 sda24 sda25 sda26 sda27 sda28 sda29 sda30 sda31 sda32=
 sda33 sda34 sda35 sda36 sda37 sda38 sda39 sda40 sda41 sda42 sda43 sda44
[    3.625552] sd 1:0:0:0: [sda] Attached SCSI disk
[    3.649039] hid-generic 0003:048D:5711.0001: hiddev96,hidraw0: USB HID =
v1.10 Device [ITE Tech. Inc. GIGABYTE Device ] on usb-0000:0c:00.0-6/input=
0
[    3.673570] usb 7-1.2: New USB device found: idVendor=3D04b4, idProduct=
=3D0033, bcdDevice=3D1.00
[    3.680584] usb 7-1.2: New USB device strings: Mfr=3D0, Product=3D0, Se=
rialNumber=3D0
[    3.685826] hid-generic 0003:048D:5711.0002: hiddev97,hidraw1: USB HID =
v1.10 Device [ITE Tech. Inc. GIGABYTE Device ] on usb-0000:0c:00.0-6/input=
1
[    3.753755] input: HID 04b4:0033 as /devices/pci0000:00/0000:00:08.1/00=
00:72:00.4/usb7/7-1/7-1.2/7-1.2:1.0/0003:04B4:0033.0003/input/input3
[    3.753956] hid-generic 0003:04B4:0033.0003: input,hidraw2: USB HID v1.=
00 Mouse [HID 04b4:0033] on usb-0000:72:00.4-1.2/input0
[    3.823487] ata3: SATA link down (SStatus 0 SControl 300)
[    3.831091] usb 7-1.4: new low-speed USB device number 4 using xhci_hcd
[    3.881021] usb 1-9: new high-speed USB device number 3 using xhci_hcd
[    3.933578] usb 7-1.4: New USB device found: idVendor=3D046a, idProduct=
=3Dc098, bcdDevice=3D1.15
[    3.949327] usb 7-1.4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
[    3.949340] usb 7-1.4: Product: CHERRY Corded Device
[    3.949346] usb 7-1.4: Manufacturer: Cherry GmbH
[    4.040968] input: Cherry GmbH CHERRY Corded Device as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.4/usb7/7-1/7-1.4/7-1.4:1.0/0003:046A:C098.0004=
/input/input4
[    4.101467] hid-generic 0003:046A:C098.0004: input,hidraw3: USB HID v1.=
11 Keyboard [Cherry GmbH CHERRY Corded Device] on usb-0000:72:00.4-1.4/inp=
ut0
[    4.109280] usb 1-9: New USB device found: idVendor=3D0489, idProduct=
=3De124, bcdDevice=3D1.00
[    4.109502] input: Cherry GmbH CHERRY Corded Device as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.4/usb7/7-1/7-1.4/7-1.4:1.1/0003:046A:C098.0005=
/input/input5
[    4.130391] usb 1-9: New USB device strings: Mfr=3D5, Product=3D6, Seri=
alNumber=3D7
[    4.130404] usb 1-9: Product: Wireless_Device
[    4.130409] usb 1-9: Manufacturer: MediaTek Inc.
[    4.130414] usb 1-9: SerialNumber: 000000000
[    4.151978] ata4: SATA link down (SStatus 0 SControl 300)
[    4.161338] hid-generic 0003:046A:C098.0005: input,hidraw4: USB HID v1.=
11 Device [Cherry GmbH CHERRY Corded Device] on usb-0000:72:00.4-1.4/input=
1
[    4.162770] clk: Disabling unused clocks
[    4.162781] PM: genpd: Disabling unused power domains
[    4.162789] ALSA device list:
[    4.162794]   No soundcards found.
[    4.162813] Warning: unable to open an initial console.
[    4.164131] Freeing unused decrypted memory: 2036K
[    4.166762] Freeing unused kernel image (initmem) memory: 20948K
[    4.166780] Write protecting the kernel read-only data: 43008k
[    4.168222] Freeing unused kernel image (text/rodata gap) memory: 1248K
[    4.168647] Freeing unused kernel image (rodata/data gap) memory: 152K
[    4.211692] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    4.211701] Run /init as init process
[    4.211704]   with arguments:
[    4.211705]     /init
[    4.211707]     dolvm
[    4.211708]   with environment:
[    4.211709]     HOME=3D/
[    4.211710]     TERM=3Dlinux
[    4.211711]     crypt_root=3DLABEL=3Ddt8-luks
[    4.492049] udevd[974]: starting version 3.2.14
[    4.493113] udevd[975]: starting eudev-3.2.14
[    4.681808] thunderbolt 0000:71:00.0: acking hot plug event on 0:2
[    4.681844] thunderbolt 0000:71:00.0: 0:2: hotplug: scanning
[    4.681850] thunderbolt 0000:71:00.0: 0:2: hotplug: no switch found
[    4.687882] thunderbolt 0000:71:00.0: acking hot plug event on 0:1
[    4.687940] thunderbolt 0000:71:00.0: 0:1: hotplug: scanning
[    4.689044] thunderbolt 0000:71:00.0: 0:1: is connected, link is up (st=
ate: 2)
[    4.689725] thunderbolt 0000:71:00.0: current switch config:
[    4.689735] thunderbolt 0000:71:00.0:  USB4 Switch: 8087:b26 (Revision:=
 3, TB Version: 32)
[    4.689740] thunderbolt 0000:71:00.0:   Max Port Number: 19
[    4.689743] thunderbolt 0000:71:00.0:   Config:
[    4.689746] thunderbolt 0000:71:00.0:    Upstream Port Number: 1 Depth:=
 0 Route String: 0x0 Enabled: 0, PlugEventsDelay: 10ms
[    4.689750] thunderbolt 0000:71:00.0:    unknown1: 0x0 unknown4: 0x0
[    4.692448] thunderbolt 0000:71:00.0: initializing Switch at 0x1 (depth=
: 1, up port: 1)
[    4.692639] thunderbolt 0000:71:00.0: 1: link: USB4
[    4.692641] thunderbolt 0000:71:00.0: 1: TBT3 support: yes, xHCI: no
[    4.692767] thunderbolt 0000:71:00.0: acking hot plug event on 1:2
[    4.695626] thunderbolt 0000:71:00.0: 1: credit allocation parameters:
[    4.695629] thunderbolt 0000:71:00.0: 1:  USB3: 14
[    4.695632] thunderbolt 0000:71:00.0: 1:  DP AUX: 1
[    4.695634] thunderbolt 0000:71:00.0: 1:  DP main: 18
[    4.695637] thunderbolt 0000:71:00.0: 1:  PCIe: 32
[    4.699230] thunderbolt 0000:71:00.0: 1: DROM version: 1
[    4.699647] thunderbolt 0000:71:00.0: 1: uid: 0x643a0900808732fc
[    4.700199] thunderbolt 0000:71:00.0:  Port 1: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.700204] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.700206] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.700209] thunderbolt 0000:71:00.0:   NFC Credits: 0xc3c00000
[    4.700211] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.700877] thunderbolt 0000:71:00.0:  Port 2: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.700881] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.700884] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.700886] thunderbolt 0000:71:00.0:   NFC Credits: 0xc3c00000
[    4.700888] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.701434] thunderbolt 0000:71:00.0:  Port 3: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.701438] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.701440] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.701443] thunderbolt 0000:71:00.0:   NFC Credits: 0x83c00000
[    4.701446] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.702003] thunderbolt 0000:71:00.0:  Port 4: 8086:b26 (Revision: 3, T=
B Version: 1, Type: Port (0x1))
[    4.702007] thunderbolt 0000:71:00.0:   Max hop id (in/out): 19/19
[    4.702009] thunderbolt 0000:71:00.0:   Max counters: 16
[    4.702012] thunderbolt 0000:71:00.0:   NFC Credits: 0x83c00000
[    4.702014] thunderbolt 0000:71:00.0:   Credits (total/control): 60/2
[    4.702017] thunderbolt 0000:71:00.0: 1:5: disabled by eeprom
[    4.702020] thunderbolt 0000:71:00.0: 1:6: disabled by eeprom
[    4.702023] thunderbolt 0000:71:00.0: 1:7: disabled by eeprom
[    4.702025] thunderbolt 0000:71:00.0: 1:8: disabled by eeprom
[    4.702160] thunderbolt 0000:71:00.0:  Port 9: 8086:b26 (Revision: 3, T=
B Version: 1, Type: PCIe (0x100102))
[    4.702164] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.702167] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.702169] thunderbolt 0000:71:00.0:   NFC Credits: 0x40800000
[    4.702172] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.702280] thunderbolt 0000:71:00.0:  Port 10: 8086:b26 (Revision: 3, =
TB Version: 1, Type: PCIe (0x100101))
[    4.702284] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.702287] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.702289] thunderbolt 0000:71:00.0:   NFC Credits: 0x40800000
[    4.702292] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.702295] thunderbolt 0000:71:00.0: 1:11: disabled by eeprom
[    4.702297] thunderbolt 0000:71:00.0: 1:12: disabled by eeprom
[    4.702512] thunderbolt 0000:71:00.0:  Port 13: 8086:b26 (Revision: 1, =
TB Version: 1, Type: DP/HDMI (0xe0102))
[    4.702515] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/9
[    4.702517] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.702519] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.702520] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.702727] thunderbolt 0000:71:00.0:  Port 14: 8086:b26 (Revision: 1, =
TB Version: 1, Type: DP/HDMI (0xe0102))
[    4.702730] thunderbolt 0000:71:00.0:   Max hop id (in/out): 9/9
[    4.702732] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.702733] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.702735] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.703042] thunderbolt 0000:71:00.0:  Port 15: 8086:b26 (Revision: 1, =
TB Version: 1, Type: Inactive (0x0))
[    4.703045] thunderbolt 0000:71:00.0:   Max hop id (in/out): 0/0
[    4.703046] thunderbolt 0000:71:00.0:   Max counters: 0
[    4.703048] thunderbolt 0000:71:00.0:   NFC Credits: 0x0
[    4.703050] thunderbolt 0000:71:00.0:   Credits (total/control): 0/0
[    4.703166] thunderbolt 0000:71:00.0:  Port 16: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200102))
[    4.703169] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.703171] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.703173] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.703174] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.703280] thunderbolt 0000:71:00.0:  Port 17: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200101))
[    4.703282] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.703284] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.703286] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.703288] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.703393] thunderbolt 0000:71:00.0:  Port 18: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200101))
[    4.703395] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.703397] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.703399] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.703401] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.703508] thunderbolt 0000:71:00.0:  Port 19: 8086:b26 (Revision: 3, =
TB Version: 1, Type: USB (0x200101))
[    4.703510] thunderbolt 0000:71:00.0:   Max hop id (in/out): 8/8
[    4.703512] thunderbolt 0000:71:00.0:   Max counters: 2
[    4.703514] thunderbolt 0000:71:00.0:   NFC Credits: 0x800000
[    4.703515] thunderbolt 0000:71:00.0:   Credits (total/control): 8/0
[    4.703517] thunderbolt 0000:71:00.0: 1: running quirk_dp_credit_alloca=
tion
[    4.703624] thunderbolt 0000:71:00.0: 1: current link speed 20.0 Gb/s
[    4.703626] thunderbolt 0000:71:00.0: 1: current link width symmetric, =
single lane
[    4.703873] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 ->=
 174
[    4.703929] thunderbolt 0000:71:00.0: 1: CLx: current mode: disabled
[    4.706464] thunderbolt 0000:71:00.0: 1: TMU: supports uni-directional =
mode
[    4.706566] thunderbolt 0000:71:00.0: 1: TMU: current mode: off
[    4.707718] thunderbolt 0-1: new device found, vendor=3D0xd4 device=3D0=
xc052
[    4.707721] thunderbolt 0-1: DELL U3225QE
[    4.707837] thunderbolt 0000:71:00.0: 1: NVM version 44.83
[    4.708269] thunderbolt 0000:71:00.0: 0:2: is connected, link is up (st=
ate: 2)
[    4.709511] thunderbolt 0000:71:00.0: acking hot unplug event on 1:2
[    4.710058] thunderbolt 0000:71:00.0: acking hot unplug event on 0:2
[    4.711172] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 ->=
 174
[    4.711228] thunderbolt 0000:71:00.0: 1:1: total credits changed 60 -> =
120
[    4.711282] thunderbolt 0000:71:00.0: 1:2: total credits changed 60 -> =
0
[    4.711398] thunderbolt 0000:71:00.0: 1: link width set to symmetric, d=
ual lanes
[    4.713337] thunderbolt 0000:71:00.0: 0:1: reading NVM authentication s=
tatus of retimers
[    4.917158] thunderbolt 0000:71:00.0: 0:1: disabling sideband transacti=
ons
[    5.019471] thunderbolt 0000:71:00.0: 1:1: CLx: CL0s/CL1 supported
[    5.019476] thunderbolt 0000:71:00.0: 0:1: CLx: CL0s/CL1 not supported
[    5.019480] thunderbolt 0000:71:00.0: 1: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[    5.019584] thunderbolt 0000:71:00.0: 0: TMU: local_time[0]=3D0x022ac00=
0
[    5.019588] thunderbolt 0000:71:00.0: 0: TMU: local_time[1]=3D0x00087f8=
6
[    5.019591] thunderbolt 0000:71:00.0: 0: TMU: local_time[2]=3D0x03e8000=
0
[    5.019955] thunderbolt 0000:71:00.0: 1: TMU: updated local time to 0x8=
7f86022a
[    5.020830] thunderbolt 0000:71:00.0: 1: TMU: mode set to: bi-direction=
al, HiFi
[    5.022612] thunderbolt 0000:71:00.0: 1:1: reading NVM authentication s=
tatus of retimers
[    5.116548] thunderbolt 0000:71:00.0: acking hot plug event on 1:13
[    5.226667] thunderbolt 0000:71:00.0: 1:1: disabling sideband transacti=
ons
[    5.330216] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.330400] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.330480] thunderbolt 0000:71:00.0: 1:16: available bandwidth for new=
 USB3 tunnel 36000/36000 Mb/s
[    5.330637] thunderbolt 0000:71:00.0: 1:16: maximum required bandwidth =
for USB3 tunnel 9000 Mb/s
[    5.330645] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): activating
[    5.330648] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): allocating i=
nitial bandwidth 9000/9000 Mb/s
[    5.331151] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[    5.331576] thunderbolt 0000:71:00.0: activating USB3 Down path from 0:=
8 to 1:16
[    5.331727] thunderbolt 0000:71:00.0: 0:8: Writing hop 0
[    5.331729] thunderbolt 0000:71:00.0: 0:8:  In HopID: 8 =3D> Out port: =
1 Out HopID: 8
[    5.331731] thunderbolt 0000:71:00.0: 0:8:   Weight: 2 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[    5.331734] thunderbolt 0000:71:00.0: 0:8:    Counter enabled: 0 Counte=
r index: 2047
[    5.331736] thunderbolt 0000:71:00.0: 0:8:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[    5.331738] thunderbolt 0000:71:00.0: 0:8:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.331945] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[    5.331947] thunderbolt 0000:71:00.0: 1:1:  In HopID: 8 =3D> Out port: =
16 Out HopID: 8
[    5.331950] thunderbolt 0000:71:00.0: 1:1:   Weight: 2 Priority: 3 Cred=
its: 14 Drop: 0 PM: 0
[    5.331952] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.331954] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.331956] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.332013] thunderbolt 0000:71:00.0: USB3 Down path activation complet=
e
[    5.332015] thunderbolt 0000:71:00.0: activating USB3 Up path from 1:16=
 to 0:8
[    5.332121] thunderbolt 0000:71:00.0: 1:16: Writing hop 0
[    5.332123] thunderbolt 0000:71:00.0: 1:16:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 8
[    5.332125] thunderbolt 0000:71:00.0: 1:16:   Weight: 2 Priority: 3 Cre=
dits: 2 Drop: 0 PM: 0
[    5.332127] thunderbolt 0000:71:00.0: 1:16:    Counter enabled: 0 Count=
er index: 2047
[    5.332129] thunderbolt 0000:71:00.0: 1:16:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[    5.332132] thunderbolt 0000:71:00.0: 1:16:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.332351] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[    5.332353] thunderbolt 0000:71:00.0: 0:1:  In HopID: 8 =3D> Out port: =
8 Out HopID: 8
[    5.332355] thunderbolt 0000:71:00.0: 0:1:   Weight: 2 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[    5.332357] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.332359] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.332361] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.332460] thunderbolt 0000:71:00.0: USB3 Up path activation complete
[    5.332662] thunderbolt 0000:71:00.0: 1:3: is unplugged (state: 7)
[    5.332767] thunderbolt 0000:71:00.0: 1:13: DP adapter HPD set, queuing=
 hotplug
[    5.332825] thunderbolt 0000:71:00.0: hotplug event for upstream port 1=
:2 (unplug: 0)
[    5.332829] thunderbolt 0000:71:00.0: hotplug event for upstream port 1=
:2 (unplug: 1)
[    5.332833] thunderbolt 0000:71:00.0: 0:2: got unplug event for disconn=
ected port, ignoring
[    5.332893] thunderbolt 0000:71:00.0: 1:13: DP OUT resource available a=
fter hotplug
[    5.332895] thunderbolt 0000:71:00.0: looking for DP IN <-> DP OUT pair=
s:
[    5.333050] thunderbolt 0000:71:00.0: 0:10: DP IN available
[    5.333105] thunderbolt 0000:71:00.0: 1:13: DP OUT available
[    5.333533] thunderbolt 0000:71:00.0: 0: allocated DP resource for port=
 10
[    5.333536] thunderbolt 0000:71:00.0: 0:10: attached to bandwidth group=
 1
[    5.334022] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 220/220, sc=
ale 0
[    5.334432] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[    5.334676] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.334727] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[    5.334856] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.334910] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): consumed ban=
dwidth 1350/1350 Mb/s
[    5.334965] thunderbolt 0000:71:00.0: available bandwidth for new DP tu=
nnel 34650/34650 Mb/s
[    5.334972] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): activating
[    5.335316] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP IN maximum=
 supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[    5.335319] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DP OUT maximu=
m supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[    5.335485] thunderbolt 0000:71:00.0: activating Video path from 0:10 t=
o 1:13
[    5.335488] thunderbolt 0000:71:00.0: 1:1: adding 18 NFC credits to 0
[    5.335704] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[    5.335707] thunderbolt 0000:71:00.0: 0:10:  In HopID: 9 =3D> Out port:=
 1 Out HopID: 9
[    5.335710] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 1 Cre=
dits: 0 Drop: 0 PM: 0
[    5.335713] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[    5.335716] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 0/0=
 Shared Buffer (In/Eg): 0/0
[    5.335719] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.335922] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[    5.335925] thunderbolt 0000:71:00.0: 1:1:  In HopID: 9 =3D> Out port: =
13 Out HopID: 9
[    5.335927] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 1 Cred=
its: 0 Drop: 0 PM: 0
[    5.335930] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.335933] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 0/0 =
Shared Buffer (In/Eg): 0/0
[    5.335936] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.335996] thunderbolt 0000:71:00.0: Video path activation complete
[    5.335999] thunderbolt 0000:71:00.0: activating AUX TX path from 0:10 =
to 1:13
[    5.336152] thunderbolt 0000:71:00.0: 0:10: Writing hop 0
[    5.336154] thunderbolt 0000:71:00.0: 0:10:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 10
[    5.336157] thunderbolt 0000:71:00.0: 0:10:   Weight: 1 Priority: 2 Cre=
dits: 0 Drop: 0 PM: 0
[    5.336159] thunderbolt 0000:71:00.0: 0:10:    Counter enabled: 0 Count=
er index: 2047
[    5.336161] thunderbolt 0000:71:00.0: 0:10:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[    5.336163] thunderbolt 0000:71:00.0: 0:10:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.336364] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[    5.336366] thunderbolt 0000:71:00.0: 1:1:  In HopID: 10 =3D> Out port:=
 13 Out HopID: 8
[    5.336368] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 2 Cred=
its: 1 Drop: 0 PM: 0
[    5.336370] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.336372] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.336374] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.336433] thunderbolt 0000:71:00.0: AUX TX path activation complete
[    5.336435] thunderbolt 0000:71:00.0: activating AUX RX path from 1:13 =
to 0:10
[    5.336548] thunderbolt 0000:71:00.0: 1:13: Writing hop 0
[    5.336551] thunderbolt 0000:71:00.0: 1:13:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 9
[    5.336553] thunderbolt 0000:71:00.0: 1:13:   Weight: 1 Priority: 2 Cre=
dits: 8 Drop: 0 PM: 0
[    5.336555] thunderbolt 0000:71:00.0: 1:13:    Counter enabled: 0 Count=
er index: 2047
[    5.336557] thunderbolt 0000:71:00.0: 1:13:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[    5.336559] thunderbolt 0000:71:00.0: 1:13:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[    5.336767] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[    5.336769] thunderbolt 0000:71:00.0: 0:1:  In HopID: 9 =3D> Out port: =
10 Out HopID: 8
[    5.336772] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 2 Cred=
its: 2 Drop: 0 PM: 0
[    5.336774] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[    5.336776] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[    5.336778] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[    5.336876] thunderbolt 0000:71:00.0: AUX RX path activation complete
[    5.337245] thunderbolt 0000:71:00.0: 0:11: DP IN available
[    5.337298] thunderbolt 0000:71:00.0: 1:13: DP OUT in use
[    5.337300] thunderbolt 0000:71:00.0: 0:11: no suitable DP OUT adapter =
available, not tunneling
[    5.362461] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[    5.446354] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX read tim=
eout
[    5.491076] usb 3-1: new high-speed USB device number 2 using xhci_hcd
[    5.511764] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): DPRX capabili=
ties read completed
[    5.512022] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[    5.512028] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming u=
nused bandwidth
[    5.512264] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.512570] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/17280 Mb/s
[    5.512621] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[    5.512917] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): consumed band=
width 0/25920 Mb/s
[    5.512920] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available ba=
ndwidth 36000/10080 Mb/s
[    5.513533] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[    5.513964] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): increased ba=
ndwidth allocation to 9000/9000 Mb/s
[    5.513968] thunderbolt 0000:71:00.0: bandwidth consumption changed, re=
-calculating estimated bandwidth
[    5.513969] thunderbolt 0000:71:00.0: re-calculating bandwidth estimati=
on for group 1
[    5.514048] thunderbolt 0000:71:00.0: bandwidth estimation for group 1 =
done
[    5.514050] thunderbolt 0000:71:00.0: bandwidth re-calculation done
[    5.681699] fbcon: amdgpudrmfb (fb0) is primary device
[    5.711523] usb 3-1: New USB device found: idVendor=3D1d5c, idProduct=
=3D5801, bcdDevice=3D1.01
[    5.712048] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    5.712052] usb 3-1: Product: USB2.0 Hub
[    5.712055] usb 3-1: Manufacturer: Fresco Logic, Inc.
[    5.719331] hub 3-1:1.0: USB hub found
[    5.719452] hub 3-1:1.0: 6 ports detected
[    5.842732] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number 2 us=
ing xhci_hcd
[    5.854262] Console: switching to colour frame buffer device 240x67
[    5.862670] usb 4-1: New USB device found: idVendor=3D8087, idProduct=
=3D0b40, bcdDevice=3D12.34
[    5.864262] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    5.864266] usb 4-1: Product: USB3.0 Hub
[    5.864269] usb 4-1: Manufacturer: Intel Corporation.
[    5.871093] hub 4-1:1.0: USB hub found
[    5.871411] hub 4-1:1.0: 4 ports detected
[    5.892668] amdgpu 0000:72:00.0: [drm] fb0: amdgpudrmfb frame buffer de=
vice
[    6.271093] usb 3-1.4: new high-speed USB device number 3 using xhci_hc=
d
[    6.342408] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[    6.371462] usb 3-1.4: New USB device found: idVendor=3D0424, idProduct=
=3D4206, bcdDevice=3D6.25
[    6.372164] usb 3-1.4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
[    6.372170] usb 3-1.4: Product: USB4206 Smart Hub
[    6.372173] usb 3-1.4: Manufacturer: Microchip
[    6.378247] hub 3-1.4:1.0: USB hub found
[    6.378358] hub 3-1.4:1.0: 5 ports detected
[    6.681019] usb 3-1.4.1: new high-speed USB device number 4 using xhci_=
hcd
[    6.783954] usb 3-1.4.1: New USB device found: idVendor=3D0424, idProdu=
ct=3D4252, bcdDevice=3D2.33
[    6.787445] usb 3-1.4.1: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    6.787452] usb 3-1.4.1: Product: USB4206 Smart Hub
[    6.787456] usb 3-1.4.1: Manufacturer: Microchip
[    6.794028] hub 3-1.4.1:1.0: USB hub found
[    6.794209] hub 3-1.4.1:1.0: 5 ports detected
[    7.572072] usb 4-1.4: new SuperSpeed Plus Gen 2x1 USB device number 3 =
using xhci_hcd
[    7.593726] usb 4-1.4: New USB device found: idVendor=3D0424, idProduct=
=3D7206, bcdDevice=3D6.25
[    7.594965] usb 4-1.4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
[    7.594969] usb 4-1.4: Product: USB7206 Smart Hub
[    7.594972] usb 4-1.4: Manufacturer: Microchip
[    7.602299] hub 4-1.4:1.0: USB hub found
[    7.602713] hub 4-1.4:1.0: 4 ports detected
[    7.671022] usb 3-1.4.1.5: new high-speed USB device number 6 using xhc=
i_hcd
[    7.774579] usb 3-1.4.1.5: New USB device found: idVendor=3D0424, idPro=
duct=3D7240, bcdDevice=3D2.09
[    7.781813] usb 3-1.4.1.5: New USB device strings: Mfr=3D1, Product=3D2=
, SerialNumber=3D0
[    7.781820] usb 3-1.4.1.5: Product: USB2 Controller Hub
[    7.781824] usb 3-1.4.1.5: Manufacturer: Microchip Tech
[    7.861171] usb 3-1.4.3: new high-speed USB device number 7 using xhci_=
hcd
[    7.963666] usb 3-1.4.3: New USB device found: idVendor=3D0424, idProdu=
ct=3D4216, bcdDevice=3D2.43
[    7.967860] usb 3-1.4.3: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    7.967885] usb 3-1.4.3: Product: USB4216 Smart Hub
[    7.967888] usb 3-1.4.3: Manufacturer: Microchip
[    7.976879] hub 3-1.4.3:1.0: USB hub found
[    7.977098] hub 3-1.4.3:1.0: 4 ports detected
[    8.052070] usb 4-1.4.1: new SuperSpeed Plus Gen 2x1 USB device number =
4 using xhci_hcd
[    8.072766] usb 4-1.4.1: New USB device found: idVendor=3D0424, idProdu=
ct=3D7252, bcdDevice=3D2.33
[    8.074520] usb 4-1.4.1: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    8.074526] usb 4-1.4.1: Product: USB7206 Smart Hub
[    8.074530] usb 4-1.4.1: Manufacturer: Microchip
[    8.084393] hub 4-1.4.1:1.0: USB hub found
[    8.084817] hub 4-1.4.1:1.0: 4 ports detected
[    8.151017] usb 3-1.4.5: new high-speed USB device number 8 using xhci_=
hcd
[    8.194327] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[    8.251889] usb 3-1.4.5: New USB device found: idVendor=3D0424, idProdu=
ct=3D7260, bcdDevice=3D6.25
[    8.253868] usb 3-1.4.5: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    8.253878] usb 3-1.4.5: Product: USB2 Controller Hub
[    8.253882] usb 3-1.4.5: Manufacturer: Microchip Tech
[    8.272081] hid-generic 0003:0424:7260.0006: hiddev98,hidraw5: USB HID =
v1.10 Device [Microchip Tech USB2 Controller Hub] on usb-0000:70:00.0-1.4.=
5/input1
[    8.332034] usb 4-1.4.2: new SuperSpeed USB device number 5 using xhci_=
hcd
[    8.352523] usb 4-1.4.2: New USB device found: idVendor=3D0bda, idProdu=
ct=3D8156, bcdDevice=3D31.10
[    8.353783] usb 4-1.4.2: Int endpoint with wBytesPerInterval of 8 in co=
nfig 2 interface 0 altsetting 0 ep 0x83: setting to 16
[    8.354781] usb 4-1.4.2: Int endpoint with wBytesPerInterval of 8 in co=
nfig 3 interface 0 altsetting 0 ep 0x83: setting to 16
[    8.356006] usb 4-1.4.2: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D6
[    8.356011] usb 4-1.4.2: Product: USB 10/100/1G/2.5G LAN
[    8.356014] usb 4-1.4.2: Manufacturer: Realtek
[    8.356017] usb 4-1.4.2: SerialNumber: 0113000001
[    8.462490] usb 4-1.4.3: new SuperSpeed Plus Gen 2x1 USB device number =
6 using xhci_hcd
[    8.482545] usb 4-1.4.3: New USB device found: idVendor=3D0424, idProdu=
ct=3D7216, bcdDevice=3D2.43
[    8.484286] usb 4-1.4.3: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    8.484291] usb 4-1.4.3: Product: USB7216 Smart Hub
[    8.484295] usb 4-1.4.3: Manufacturer: Microchip
[    8.495214] hub 4-1.4.3:1.0: USB hub found
[    8.495628] hub 4-1.4.3:1.0: 3 ports detected
[    8.701235] usb 3-1.4.3.4: new high-speed USB device number 9 using xhc=
i_hcd
[    8.806000] usb 3-1.4.3.4: New USB device found: idVendor=3D0424, idPro=
duct=3D7240, bcdDevice=3D2.09
[    8.815594] usb 3-1.4.3.4: New USB device strings: Mfr=3D1, Product=3D2=
, SerialNumber=3D0
[    8.815600] usb 3-1.4.3.4: Product: USB2 Controller Hub
[    8.815603] usb 3-1.4.3.4: Manufacturer: Microchip Tech
[   25.252274] PM: Image not found (code -22)
[   25.283165] XFS (dm-3): Mounting V5 Filesystem 2dde3c3b-d250-4709-a1fd-=
a1fc7da7be51
[   25.291222] XFS (dm-3): Ending clean mount
[   26.629782] ACPI Warning: SystemIO range 0x0000000000000B00-0x000000000=
0000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\GS=
A1.SMBI) (20260408/utaddress-204)
[   26.629794] ACPI: OSL: Resource conflict; ACPI support missing from dri=
ver?
[   26.654055] r8169 0000:05:00.0 enp5s0: renamed from eth0
[   26.666545] snd_hda_intel 0000:72:00.1: enabling device (0000 -> 0002)
[   26.666901] snd_hda_intel 0000:72:00.6: enabling device (0000 -> 0002)
[   26.667951] amdxdna 0000:73:00.1: [drm] Load firmware amdnpu/1502_00/np=
u_7.sbin
[   26.667970] amdxdna 0000:73:00.1: enabling device (0000 -> 0002)
[   26.670101] mt7925e 0000:06:00.0: enabling device (0000 -> 0002)
[   26.673634] mt7925e 0000:06:00.0: ASIC revision: 79250000
[   26.687744] snd_hda_intel 0000:72:00.1: bound 0000:72:00.0 (ops 0xfffff=
fff82bd4700)
[   26.698964] usbcore: registered new device driver r8152-cfgselector
[   26.699864] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input6
[   26.699956] input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input7
[   26.700159] input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input8
[   26.700258] it87: it87 driver version <not provided>
[   26.700478] it87: Found IT8696E chip at 0xa40, revision 0
[   26.700578] it87: Beeping is supported
[   26.700631] ACPI Warning: SystemIO range 0x0000000000000A45-0x000000000=
0000A46 conflicts with OpRegion 0x0000000000000A45-0x0000000000000A46 (\GS=
A1.SIO1) (20260408/utaddress-204)
[   26.700637] ACPI: OSL: Resource conflict; ACPI support missing from dri=
ver?
[   26.700737] input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.1/sound/card0/input9
[   26.711859] snd_hda_codec_alc882 hdaudioC1D0: autoconfig for ALC1220: l=
ine_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[   26.711865] snd_hda_codec_alc882 hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[   26.711868] snd_hda_codec_alc882 hdaudioC1D0:    hp_outs=3D1 (0x1b/0x0/=
0x0/0x0/0x0)
[   26.711871] snd_hda_codec_alc882 hdaudioC1D0:    mono: mono_out=3D0x0
[   26.711873] snd_hda_codec_alc882 hdaudioC1D0:    dig-out=3D0x1e/0x0
[   26.711875] snd_hda_codec_alc882 hdaudioC1D0:    inputs:
[   26.711877] snd_hda_codec_alc882 hdaudioC1D0:      Rear Mic=3D0x18
[   26.711879] snd_hda_codec_alc882 hdaudioC1D0:      Front Mic=3D0x19
[   26.726391] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/000=
0:00:08.1/0000:72:00.6/sound/card1/input10
[   26.726501] input: HD-Audio Generic Front Mic as /devices/pci0000:00/00=
00:00:08.1/0000:72:00.6/sound/card1/input11
[   26.726597] input: HD-Audio Generic Line Out as /devices/pci0000:00/000=
0:00:08.1/0000:72:00.6/sound/card1/input12
[   26.726691] input: HD-Audio Generic Front Headphone as /devices/pci0000=
:00/0000:00:08.1/0000:72:00.6/sound/card1/input13
[   26.735015] Bluetooth: Core ver 2.22
[   26.735031] NET: Registered PF_BLUETOOTH protocol family
[   26.735033] Bluetooth: HCI device and connection manager initialized
[   26.735036] Bluetooth: HCI socket layer initialized
[   26.735038] Bluetooth: L2CAP socket layer initialized
[   26.735041] Bluetooth: SCO socket layer initialized
[   26.739479] btusb 1-9:1.2: failed to enumerate endpoints
[   26.739511] usbcore: registered new interface driver btusb
[   26.751580] Bluetooth: hci0: Loading BT firmware: mediatek/mt7925/BT_RA=
M_CODE_MT7925_1_1_hdr.bin
[   26.751586] Bluetooth: hci0: BT HW ver: 0x7925, SW ver: 0x0000, Build T=
ime: 20260813113236
[   26.765569] mt7925e 0000:06:00.0: Loading firmware patch: mediatek/mt79=
25/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
[   26.766031] mt7925e 0000:06:00.0: HW/SW Version: 0x8a108a10, Build Time=
: 20260813113015a
[   26.790983] [drm] Initialized amdxdna_accel_driver 0.10.0 for 0000:73:0=
0.1 on minor 0
[   26.814808] r8152-cfgselector 4-1.4.2: reset SuperSpeed USB device numb=
er 5 using xhci_hcd
[   26.952349] usbcore: registered new interface driver r8152
[   27.010547] r8152 4-1.4.2:1.0 enp112s0u1u4u2: renamed from eth0
[   27.105349] mt7925e 0000:06:00.0: WM Firmware Version: ____000000, Buil=
d Time: 20260813113118
[   27.433049] Adding 67108860k swap on /dev/mapper/vg08-dt8--swap.  Prior=
ity:-1 extents:1 across:67108860k SS
[   27.473721] XFS (dm-4): Mounting V5 Filesystem 2b1e7db6-c6c2-470d-9b1a-=
54ead199e432
[   27.481669] XFS (dm-4): Ending clean mount
[   27.485061] XFS (dm-5): Mounting V5 Filesystem 9369d250-8672-4de2-8555-=
cfd26954c434
[   27.492648] XFS (dm-5): Ending clean mount
[   27.718594] mt7925e 0000:06:00.0 wlp6s0: renamed from wlan0
[   27.723196] elogind-daemon[2637]: New seat seat0.
[   27.726959] elogind-daemon[2637]: Watching system buttons on /dev/input=
/event4 (Cherry GmbH CHERRY Corded Device)
[   27.730132] elogind-daemon[2637]: Watching system buttons on /dev/input=
/event1 (Power Button)
[   27.730145] elogind-daemon[2637]: Watching system buttons on /dev/input=
/event0 (Power Button)
[   28.135695] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   28.135698] Bluetooth: BNEP filters: protocol multicast
[   28.135702] Bluetooth: BNEP socket layer initialized
[   28.185535] thunderbolt 0000:71:00.0: 0:6 <-> 1:9 (PCI): activating
[   28.185744] thunderbolt 0000:71:00.0: activating PCIe Down path from 0:=
6 to 1:9
[   28.185988] thunderbolt 0000:71:00.0: 0:6: Writing hop 0
[   28.185994] thunderbolt 0000:71:00.0: 0:6:  In HopID: 8 =3D> Out port: =
1 Out HopID: 11
[   28.185998] thunderbolt 0000:71:00.0: 0:6:   Weight: 1 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[   28.186002] thunderbolt 0000:71:00.0: 0:6:    Counter enabled: 0 Counte=
r index: 2047
[   28.186005] thunderbolt 0000:71:00.0: 0:6:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   28.186008] thunderbolt 0000:71:00.0: 0:6:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.186332] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[   28.186339] thunderbolt 0000:71:00.0: 1:1:  In HopID: 11 =3D> Out port:=
 9 Out HopID: 8
[   28.186343] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 3 Cred=
its: 32 Drop: 0 PM: 0
[   28.186347] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[   28.186350] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   28.186353] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.186428] thunderbolt 0000:71:00.0: PCIe Down path activation complet=
e
[   28.186434] thunderbolt 0000:71:00.0: activating PCIe Up path from 1:9 =
to 0:6
[   28.186556] thunderbolt 0000:71:00.0: 1:9: Writing hop 0
[   28.186562] thunderbolt 0000:71:00.0: 1:9:  In HopID: 8 =3D> Out port: =
1 Out HopID: 10
[   28.186566] thunderbolt 0000:71:00.0: 1:9:   Weight: 1 Priority: 3 Cred=
its: 7 Drop: 0 PM: 0
[   28.186569] thunderbolt 0000:71:00.0: 1:9:    Counter enabled: 0 Counte=
r index: 2047
[   28.186572] thunderbolt 0000:71:00.0: 1:9:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   28.186575] thunderbolt 0000:71:00.0: 1:9:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.186775] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[   28.186778] thunderbolt 0000:71:00.0: 0:1:  In HopID: 10 =3D> Out port:=
 6 Out HopID: 8
[   28.186781] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[   28.186784] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[   28.186787] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[   28.186790] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   28.186881] thunderbolt 0000:71:00.0: PCIe Up path activation complete
[   28.588186] Bluetooth: hci0: Device setup in 1805355 usecs
[   28.588190] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection =
command is advertised, but not supported.
[   28.720753] r8169 0000:05:00.0 enp5s0: PHY [r8169-0-500:00] driver [Rea=
ltek Internal NBASE-T PHY] (irq=3DMAC)
[   28.757426] Bluetooth: hci0: AOSP extensions version v1.00
[   28.757433] Bluetooth: hci0: AOSP quality report is supported
[   28.757688] Bluetooth: MGMT ver 1.23
[   29.250569] pcieport 0000:0f:00.0: pciehp: Slot(0): Card present
[   29.250575] pcieport 0000:0f:00.0: pciehp: Slot(0): Link Up
[   29.390849] pci 0000:10:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Upstream Port
[   29.390900] pci 0000:10:00.0: PCI bridge to [bus 00]
[   29.390915] pci 0000:10:00.0:   bridge window [io  0x0000-0x0fff]
[   29.390922] pci 0000:10:00.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.390941] pci 0000:10:00.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.390963] pci 0000:10:00.0: enabling Extended Tags
[   29.391168] pci 0000:10:00.0: supports D1 D2
[   29.391171] pci 0000:10:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.404237] pci 0000:10:00.0: 2.000 Gb/s available PCIe bandwidth, limi=
ted by 2.5 GT/s PCIe x1 link at 0000:0f:00.0 (capable of 8.000 Gb/s with 2=
.5 GT/s PCIe x4 link)
[   29.404411] pci 0000:10:00.0: Adding to iommu group 26
[   29.404459] pcieport 0000:0f:00.0: ASPM: current common clock configura=
tion is inconsistent, reconfiguring
[   29.431014] pci 0000:10:00.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.431262] pci 0000:11:00.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.431310] pci 0000:11:00.0: PCI bridge to [bus 00]
[   29.431323] pci 0000:11:00.0:   bridge window [io  0x0000-0x0fff]
[   29.431330] pci 0000:11:00.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.431349] pci 0000:11:00.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.431375] pci 0000:11:00.0: enabling Extended Tags
[   29.431586] pci 0000:11:00.0: supports D1 D2
[   29.431589] pci 0000:11:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.431938] pci 0000:11:00.0: Adding to iommu group 26
[   29.432072] pci 0000:11:01.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.432116] pci 0000:11:01.0: PCI bridge to [bus 00]
[   29.432127] pci 0000:11:01.0:   bridge window [io  0x0000-0x0fff]
[   29.432131] pci 0000:11:01.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.432149] pci 0000:11:01.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.432171] pci 0000:11:01.0: enabling Extended Tags
[   29.432353] pci 0000:11:01.0: supports D1 D2
[   29.432355] pci 0000:11:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.432660] pci 0000:11:01.0: Adding to iommu group 26
[   29.432787] pci 0000:11:02.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.432832] pci 0000:11:02.0: PCI bridge to [bus 00]
[   29.432842] pci 0000:11:02.0:   bridge window [io  0x0000-0x0fff]
[   29.432847] pci 0000:11:02.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.432865] pci 0000:11:02.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.432887] pci 0000:11:02.0: enabling Extended Tags
[   29.433070] pci 0000:11:02.0: supports D1 D2
[   29.433072] pci 0000:11:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.433379] pci 0000:11:02.0: Adding to iommu group 26
[   29.433515] pci 0000:11:03.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.433557] pci 0000:11:03.0: PCI bridge to [bus 00]
[   29.433567] pci 0000:11:03.0:   bridge window [io  0x0000-0x0fff]
[   29.433572] pci 0000:11:03.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.433590] pci 0000:11:03.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.433615] pci 0000:11:03.0: enabling Extended Tags
[   29.433798] pci 0000:11:03.0: supports D1 D2
[   29.433800] pci 0000:11:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.434104] pci 0000:11:03.0: Adding to iommu group 26
[   29.434234] pci 0000:11:04.0: [8086:0b26] type 01 class 0x060400 PCIe S=
witch Downstream Port
[   29.434278] pci 0000:11:04.0: PCI bridge to [bus 00]
[   29.434288] pci 0000:11:04.0:   bridge window [io  0x0000-0x0fff]
[   29.434293] pci 0000:11:04.0:   bridge window [mem 0x00000000-0x000ffff=
f]
[   29.434310] pci 0000:11:04.0:   bridge window [mem 0x00000000-0x000ffff=
f 64bit pref]
[   29.434333] pci 0000:11:04.0: enabling Extended Tags
[   29.434520] pci 0000:11:04.0: supports D1 D2
[   29.434522] pci 0000:11:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.434824] pci 0000:11:04.0: Adding to iommu group 26
[   29.434918] pci 0000:10:00.0: PCI bridge to [bus 11-3f]
[   29.434940] pci 0000:11:00.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.434952] pci 0000:11:01.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.434964] pci 0000:11:02.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.434976] pci 0000:11:03.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.434988] pci 0000:11:04.0: bridge configuration invalid ([bus 00-00]=
), reconfiguring
[   29.435084] pci 0000:11:00.0: PCI bridge to [bus 12-3f]
[   29.435104] pci_bus 0000:12: busn_res: [bus 12-3f] end is updated to 12
[   29.435194] pci 0000:11:01.0: PCI bridge to [bus 13-3f]
[   29.435213] pci_bus 0000:13: busn_res: [bus 13-3f] end is updated to 21
[   29.435301] pci 0000:11:02.0: PCI bridge to [bus 22-3f]
[   29.435321] pci_bus 0000:22: busn_res: [bus 22-3f] end is updated to 30
[   29.435412] pci 0000:11:03.0: PCI bridge to [bus 31-3f]
[   29.435431] pci_bus 0000:31: busn_res: [bus 31-3f] end is updated to 3e
[   29.435519] pci 0000:11:04.0: PCI bridge to [bus 3f]
[   29.435538] pci_bus 0000:3f: busn_res: [bus 3f] end is updated to 3f
[   29.435545] pci_bus 0000:11: busn_res: [bus 11-3f] end is updated to 3f
[   29.435553] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref] to [bus 12] (unused)
[   29.435555] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff] to [bus 12] (unused)
[   29.435557] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 13-21] add_size 200000 add_align 100000
[   29.435560] pci 0000:11:01.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 13-21] add_size 200000 add_align 100000
[   29.435562] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 22-30] add_size 200000 add_align 100000
[   29.435564] pci 0000:11:02.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 22-30] add_size 200000 add_align 100000
[   29.435565] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 31-3e] add_size 200000 add_align 100000
[   29.435567] pci 0000:11:03.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 31-3e] add_size 200000 add_align 100000
[   29.435569] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref] to [bus 3f] (unused)
[   29.435571] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff] to [bus 3f] (unused)
[   29.435576] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff =
64bit pref] to [bus 11-3f] add_size 600000 add_align 100000
[   29.435580] pci 0000:10:00.0: bridge window [mem 0x00100000-0x000fffff]=
 to [bus 11-3f] add_size 600000 add_align 100000
[   29.435586] pci 0000:10:00.0: bridge window [mem 0xc4000000-0xdbffffff]=
: assigned
[   29.435589] pci 0000:10:00.0: bridge window [mem 0xd800000000-0xf7fffff=
fff 64bit pref]: assigned
[   29.435590] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.435592] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.435594] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.435596] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.435601] pci 0000:11:01.0: bridge window [mem 0xc4000000-0xcbefffff]=
: assigned
[   29.435603] pci 0000:11:01.0: bridge window [mem 0xd800000000-0xe2aa9ff=
fff 64bit pref]: assigned
[   29.435605] pci 0000:11:02.0: bridge window [mem 0xcbf00000-0xd3dfffff]=
: assigned
[   29.435606] pci 0000:11:02.0: bridge window [mem 0xe2aaa00000-0xed553ff=
fff 64bit pref]: assigned
[   29.435608] pci 0000:11:03.0: bridge window [mem 0xd3e00000-0xdbcfffff]=
: assigned
[   29.435610] pci 0000:11:03.0: bridge window [mem 0xed55400000-0xf7ffdff=
fff 64bit pref]: assigned
[   29.435611] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435613] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435615] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435616] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435618] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435619] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435621] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435622] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435624] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435625] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435628] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435630] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435631] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435633] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435634] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435636] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435637] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435639] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435640] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435642] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435644] pci 0000:11:00.0: PCI bridge to [bus 12]
[   29.435662] pci 0000:11:01.0: PCI bridge to [bus 13-21]
[   29.435669] pci 0000:11:01.0:   bridge window [mem 0xc4000000-0xcbeffff=
f]
[   29.435674] pci 0000:11:01.0:   bridge window [mem 0xd800000000-0xe2aa9=
fffff 64bit pref]
[   29.435682] pci 0000:11:02.0: PCI bridge to [bus 22-30]
[   29.435689] pci 0000:11:02.0:   bridge window [mem 0xcbf00000-0xd3dffff=
f]
[   29.435694] pci 0000:11:02.0:   bridge window [mem 0xe2aaa00000-0xed553=
fffff 64bit pref]
[   29.435703] pci 0000:11:03.0: PCI bridge to [bus 31-3e]
[   29.435710] pci 0000:11:03.0:   bridge window [mem 0xd3e00000-0xdbcffff=
f]
[   29.435715] pci 0000:11:03.0:   bridge window [mem 0xed55400000-0xf7ffd=
fffff 64bit pref]
[   29.435724] pci 0000:11:04.0: PCI bridge to [bus 3f]
[   29.435741] pci 0000:10:00.0: PCI bridge to [bus 11-3f]
[   29.435747] pci 0000:10:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[   29.435752] pci 0000:10:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[   29.435761] pcieport 0000:0f:00.0: PCI bridge to [bus 10-3f]
[   29.435763] pcieport 0000:0f:00.0:   bridge window [io  0xb000-0xdfff]
[   29.435767] pcieport 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdb=
ffffff]
[   29.435770] pcieport 0000:0f:00.0:   bridge window [mem 0xd800000000-0x=
f7ffffffff 64bit pref]
[   29.435774] PCI: No. 2 try to assign unassigned res
[   29.435776] pcieport 0000:0f:00.0: bridge window [io  0xb000-0xdfff]: r=
eleasing
[   29.435781] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref disabled] to [bus 12] (unused)
[   29.435783] pci 0000:11:00.0: disabling bridge window [mem 0x00000000-0=
x000fffff disabled] to [bus 12] (unused)
[   29.435785] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff 64bit pref disabled] to [bus 3f] (unused)
[   29.435787] pci 0000:11:04.0: disabling bridge window [mem 0x00000000-0=
x000fffff disabled] to [bus 3f] (unused)
[   29.435791] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: can=
't assign; no space
[   29.435793] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: fai=
led to assign
[   29.435795] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: can=
't assign; no space
[   29.435796] pcieport 0000:0f:00.0: bridge window [io  size 0x5000]: fai=
led to assign
[   29.435799] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.435800] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.435802] pci 0000:10:00.0: bridge window [io  size 0x5000]: can't as=
sign; no space
[   29.435803] pci 0000:10:00.0: bridge window [io  size 0x5000]: failed t=
o assign
[   29.435807] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435808] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435810] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435811] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435813] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435815] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435816] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435818] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435819] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435821] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435823] pci 0000:11:00.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435824] pci 0000:11:00.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435826] pci 0000:11:01.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435827] pci 0000:11:01.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435829] pci 0000:11:02.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435830] pci 0000:11:02.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435832] pci 0000:11:03.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435833] pci 0000:11:03.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435835] pci 0000:11:04.0: bridge window [io  size 0x1000]: can't as=
sign; no space
[   29.435836] pci 0000:11:04.0: bridge window [io  size 0x1000]: failed t=
o assign
[   29.435838] pci 0000:11:00.0: PCI bridge to [bus 12]
[   29.435856] pci 0000:11:01.0: PCI bridge to [bus 13-21]
[   29.435862] pci 0000:11:01.0:   bridge window [mem 0xc4000000-0xcbeffff=
f]
[   29.435867] pci 0000:11:01.0:   bridge window [mem 0xd800000000-0xe2aa9=
fffff 64bit pref]
[   29.435876] pci 0000:11:02.0: PCI bridge to [bus 22-30]
[   29.435883] pci 0000:11:02.0:   bridge window [mem 0xcbf00000-0xd3dffff=
f]
[   29.435888] pci 0000:11:02.0:   bridge window [mem 0xe2aaa00000-0xed553=
fffff 64bit pref]
[   29.435896] pci 0000:11:03.0: PCI bridge to [bus 31-3e]
[   29.435903] pci 0000:11:03.0:   bridge window [mem 0xd3e00000-0xdbcffff=
f]
[   29.435908] pci 0000:11:03.0:   bridge window [mem 0xed55400000-0xf7ffd=
fffff 64bit pref]
[   29.435917] pci 0000:11:04.0: PCI bridge to [bus 3f]
[   29.435934] pci 0000:10:00.0: PCI bridge to [bus 11-3f]
[   29.435940] pci 0000:10:00.0:   bridge window [mem 0xc4000000-0xdbfffff=
f]
[   29.435945] pci 0000:10:00.0:   bridge window [mem 0xd800000000-0xf7fff=
fffff 64bit pref]
[   29.435954] pcieport 0000:0f:00.0: PCI bridge to [bus 10-3f]
[   29.435957] pcieport 0000:0f:00.0:   bridge window [mem 0xc4000000-0xdb=
ffffff]
[   29.435960] pcieport 0000:0f:00.0:   bridge window [mem 0xd800000000-0x=
f7ffffffff 64bit pref]
[   29.436258] pcieport 0000:10:00.0: enabling device (0000 -> 0002)
[   29.436872] pcieport 0000:11:01.0: enabling device (0000 -> 0002)
[   29.437043] pcieport 0000:11:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[   29.437436] pcieport 0000:11:02.0: enabling device (0000 -> 0002)
[   29.437583] pcieport 0000:11:02.0: pciehp: Slot #2 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[   29.437925] pcieport 0000:11:03.0: enabling device (0000 -> 0002)
[   29.438162] pcieport 0000:11:03.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAc=
tRep+
[   35.157917] r8169 0000:05:00.0 enp5s0: configuring for phy/internal lin=
k mode
[   35.181143] bridge: filtering via arp/ip/ip6tables is no longer availab=
le by default. Update your scripts to load br_netfilter if you need this.
[   36.509359] elogind-daemon[2637]: New session c1 of user sddm.
[   38.170214] r8169 0000:05:00.0 enp5s0: Link is Up - 1Gbps/Full - flow c=
ontrol off
[   45.670708] warning: `kdeconnectd' uses wireless extensions which will =
stop working for Wi-Fi 7 hardware; use nl80211
[   46.110040] Bluetooth: RFCOMM TTY layer initialized
[   46.110046] Bluetooth: RFCOMM socket layer initialized
[   46.110051] Bluetooth: RFCOMM ver 1.11
[   49.075898] elogind-daemon[2637]: Session c1 logged out. Waiting for pr=
ocesses to exit.
[   49.076194] elogind-daemon[2637]: Removed session c1.
[   77.913929] input: M720 Triathlon Keyboard as /devices/virtual/misc/uhi=
d/0005:046D:B015.0007/input/input14
[   77.914090] input: M720 Triathlon Mouse as /devices/virtual/misc/uhid/0=
005:046D:B015.0007/input/input15
[   77.914404] hid-generic 0005:046D:B015.0007: input,hidraw6: BLUETOOTH H=
ID v0.13 Keyboard [M720 Triathlon] on 44:fa:66:66:18:84
[   78.086895] elogind-daemon[2637]: Watching system buttons on /dev/input=
/event14 (M720 Triathlon Keyboard)
[  140.528817] elogind-daemon[2637]: The system will suspend now!
[  140.799028] r8169 0000:05:00.0 enp5s0: Link is Down
[  140.812024] PM: suspend entry (deep)
[  140.829684] Filesystems sync: 0.017 seconds
[  140.841740] Freezing user space processes
[  140.901154] Freezing user space processes completed (elapsed 0.059 seco=
nds)
[  140.901165] OOM killer disabled.
[  140.901167] Freezing remaining freezable tasks
[  140.902877] Freezing remaining freezable tasks completed (elapsed 0.001=
 seconds)
[  140.902918] printk: Suspending console(s) (use no_console_suspend to de=
bug)
[  140.916095] queueing ieee80211 work while going to suspend
[  140.972957] sd 1:0:0:0: [sda] Synchronizing SCSI cache
[  140.973251] ata2.00: Entering standby power mode
[  141.005613] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  141.014165] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  141.033011] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  141.053004] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  142.320305] PM: suspend devices took 1.410 seconds
[  142.512833] thunderbolt 0000:71:00.0: suspending...
[  142.512838] thunderbolt 0000:71:00.0: 0:10 <-> 1:13 (DP): deactivating
[  142.513444] thunderbolt 0000:71:00.0: deactivating Video path from 0:10=
 to 1:13
[  142.513931] thunderbolt 0000:71:00.0: 1:1: adding -18 NFC credits to 18
[  142.513994] thunderbolt 0000:71:00.0: deactivating AUX TX path from 0:1=
0 to 1:13
[  142.514417] thunderbolt 0000:71:00.0: deactivating AUX RX path from 1:1=
3 to 0:10
[  142.514924] thunderbolt 0000:71:00.0: 0:10: detached from bandwidth gro=
up 1
[  142.515326] thunderbolt 0000:71:00.0: 0: released DP resource for port =
10
[  142.515329] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): reclaiming u=
nused bandwidth
[  142.515554] thunderbolt 0000:71:00.0: 0:1: link maximum bandwidth 36000=
/36000 Mb/s
[  142.515676] thunderbolt 0000:71:00.0: 1:1: link maximum bandwidth 36000=
/36000 Mb/s
[  142.515726] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): available ba=
ndwidth 36000/36000 Mb/s
[  142.515855] thunderbolt 0000:71:00.0: 0: suspending switch
[  142.515856] thunderbolt 0000:71:00.0: 1: suspending switch
[  142.515858] thunderbolt 0000:71:00.0: 1: enabling wakeup: 0x1f
[  142.516485] thunderbolt 0000:71:00.0: 0: enabling wakeup: 0x1f
[  142.517678] thunderbolt 0000:71:00.0: suspend finished
[  142.517679] thunderbolt 0000:71:00.0: stopping RX ring 0
[  142.517683] thunderbolt 0000:71:00.0: disabling interrupt at register 0=
x38200 bit 21 (0x200001 -> 0x1)
[  142.517693] thunderbolt 0000:71:00.0: stopping TX ring 0
[  142.517697] thunderbolt 0000:71:00.0: disabling interrupt at register 0=
x38200 bit 0 (0x1 -> 0x0)
[  142.517705] thunderbolt 0000:71:00.0: control channel stopped
[  142.705073] ACPI: PM: Preparing to enter system sleep state S3
[  143.016026] ACPI: PM: Saving platform NVS memory
[  143.016489] Disabling non-boot CPUs ...
[  143.018596] smpboot: CPU 15 is now offline
[  143.020816] smpboot: CPU 14 is now offline
[  143.023121] smpboot: CPU 13 is now offline
[  143.025342] smpboot: CPU 12 is now offline
[  143.027313] smpboot: CPU 11 is now offline
[  143.029189] smpboot: CPU 10 is now offline
[  143.031068] smpboot: CPU 9 is now offline
[  143.033066] smpboot: CPU 8 is now offline
[  143.033521] Spectre V2 : Update user space SMT mitigation: STIBP off
[  143.035037] smpboot: CPU 7 is now offline
[  143.036830] smpboot: CPU 6 is now offline
[  143.038634] smpboot: CPU 5 is now offline
[  143.040583] smpboot: CPU 4 is now offline
[  143.042384] smpboot: CPU 3 is now offline
[  143.044230] smpboot: CPU 2 is now offline
[  143.046137] smpboot: CPU 1 is now offline
[  143.047128] ACPI: PM: Low-level resume complete
[  143.047156] ACPI: PM: Restoring platform NVS memory
[  143.051551] AMD-Vi: Virtual APIC enabled
[  143.127322] AMD-Vi: Virtual APIC enabled
[  143.127598] LVT offset 0 assigned for vector 0x400
[  143.128235] Enabling non-boot CPUs ...
[  143.128259] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  143.130931] CPU1 is up
[  143.130948] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  143.133562] CPU2 is up
[  143.133577] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  143.136191] CPU3 is up
[  143.136220] smpboot: Booting Node 0 Processor 4 APIC 0x8
[  143.138841] CPU4 is up
[  143.138866] smpboot: Booting Node 0 Processor 5 APIC 0xa
[  143.141615] CPU5 is up
[  143.141639] smpboot: Booting Node 0 Processor 6 APIC 0xc
[  143.144288] CPU6 is up
[  143.144312] smpboot: Booting Node 0 Processor 7 APIC 0xe
[  143.146953] CPU7 is up
[  143.146979] smpboot: Booting Node 0 Processor 8 APIC 0x1
[  143.149831] Spectre V2 : Update user space SMT mitigation: STIBP always=
-on
[  143.149865] CPU8 is up
[  143.149888] smpboot: Booting Node 0 Processor 9 APIC 0x3
[  143.152048] Spurious APIC interrupt (vector 0xFF) on CPU#9, should neve=
r happen.
[  143.152640] CPU9 is up
[  143.152659] smpboot: Booting Node 0 Processor 10 APIC 0x5
[  143.154783] Spurious APIC interrupt (vector 0xFF) on CPU#10, should nev=
er happen.
[  143.155309] CPU10 is up
[  143.155335] smpboot: Booting Node 0 Processor 11 APIC 0x7
[  143.157462] Spurious APIC interrupt (vector 0xFF) on CPU#11, should nev=
er happen.
[  143.158005] CPU11 is up
[  143.158028] smpboot: Booting Node 0 Processor 12 APIC 0x9
[  143.160156] Spurious APIC interrupt (vector 0xFF) on CPU#12, should nev=
er happen.
[  143.160844] CPU12 is up
[  143.160867] smpboot: Booting Node 0 Processor 13 APIC 0xb
[  143.162996] Spurious APIC interrupt (vector 0xFF) on CPU#13, should nev=
er happen.
[  143.163738] CPU13 is up
[  143.163761] smpboot: Booting Node 0 Processor 14 APIC 0xd
[  143.165898] Spurious APIC interrupt (vector 0xFF) on CPU#14, should nev=
er happen.
[  143.166490] CPU14 is up
[  143.166513] smpboot: Booting Node 0 Processor 15 APIC 0xf
[  143.168643] Spurious APIC interrupt (vector 0xFF) on CPU#15, should nev=
er happen.
[  143.169353] CPU15 is up
[  143.171624] ACPI: PM: Waking up from system sleep state S3
[  143.584254] thunderbolt 0000:71:00.0: control channel starting...
[  143.584260] thunderbolt 0000:71:00.0: starting TX ring 0
[  143.584269] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 0 (0x0 -> 0x1)
[  143.584272] thunderbolt 0000:71:00.0: starting RX ring 0
[  143.584279] thunderbolt 0000:71:00.0: enabling interrupt at register 0x=
38200 bit 21 (0x1 -> 0x200001)
[  143.584288] thunderbolt 0000:71:00.0: resuming...
[  143.584290] thunderbolt 0000:71:00.0: 0: resuming switch
[  143.584292] thunderbolt 0000:71:00.0: restoring Switch at 0x0 (depth: 0=
, up port: 5)
[  143.584837] thunderbolt 0000:71:00.0: acking hot plug event on 0:1
[  143.586207] thunderbolt 0000:71:00.0: acking hot plug event on 0:2
[  143.586249] thunderbolt 0000:71:00.0: 0:1: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[  143.587391] thunderbolt 0000:71:00.0: 0:3: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[  143.587399] thunderbolt 0000:71:00.0: 0: disabling wakeup
[  143.590533] thunderbolt 0000:71:00.0: 0: TMU: supports uni-directional =
mode
[  143.590615] thunderbolt 0000:71:00.0: 0: TMU: current mode: off
[  143.590697] thunderbolt 0000:71:00.0: 0:1: is connected, link is up (st=
ate: 2)
[  143.590863] thunderbolt 0000:71:00.0: 1: resuming switch
[  143.590969] thunderbolt 0000:71:00.0: restoring Switch at 0x1 (depth: 1=
, up port: 1)
[  143.591164] thunderbolt 0000:71:00.0: 1: link: USB4
[  143.591167] thunderbolt 0000:71:00.0: 1: TBT3 support: yes, xHCI: no
[  143.591396] thunderbolt 0000:71:00.0: 1: PCIe wake: no, USB3 wake: no
[  143.591452] thunderbolt 0000:71:00.0: 1:1: USB4 wake: yes, connection w=
ake: no, disconnection wake: no
[  143.591505] thunderbolt 0000:71:00.0: 1:3: USB4 wake: no, connection wa=
ke: no, disconnection wake: no
[  143.591508] thunderbolt 0000:71:00.0: 1: disabling wakeup
[  143.594313] thunderbolt 0000:71:00.0: 1: TMU: supports uni-directional =
mode
[  143.594444] thunderbolt 0000:71:00.0: 1: TMU: current mode: off
[  143.594450] thunderbolt 0000:71:00.0: 0: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[  143.594771] thunderbolt 0000:71:00.0: 0: TMU: mode set to: bi-direction=
al, HiFi
[  143.595181] thunderbolt 0000:71:00.0: 0:2: is connected, link is up (st=
ate: 2)
[  143.596647] thunderbolt 0000:71:00.0: 0:2: total credits changed 174 ->=
 174
[  143.596856] thunderbolt 0000:71:00.0: 1: link width set to symmetric, d=
ual lanes
[  143.597001] thunderbolt 0000:71:00.0: acking hot unplug event on 0:2
[  143.598166] thunderbolt 0000:71:00.0: 1:1: CLx: CL0s/CL1 supported
[  143.598169] thunderbolt 0000:71:00.0: 0:1: CLx: CL0s/CL1 not supported
[  143.598172] thunderbolt 0000:71:00.0: 1: TMU: mode change off -> bi-dir=
ectional, HiFi requested
[  143.598249] thunderbolt 0000:71:00.0: 0: TMU: local_time[0]=3D0x933d800=
0
[  143.598252] thunderbolt 0000:71:00.0: 0: TMU: local_time[1]=3D0x0000913=
b
[  143.598254] thunderbolt 0000:71:00.0: 0: TMU: local_time[2]=3D0x0010000=
0
[  143.598603] thunderbolt 0000:71:00.0: 1: TMU: updated local time to 0x9=
13b933d
[  143.599487] thunderbolt 0000:71:00.0: 1: TMU: mode set to: bi-direction=
al, HiFi
[  143.600426] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): activating
[  143.600429] thunderbolt 0000:71:00.0: deactivating USB3 Down path from =
0:8 to 1:16
[  143.600561] thunderbolt 0000:71:00.0: deactivating USB3 Up path from 1:=
16 to 0:8
[  143.600687] thunderbolt 0000:71:00.0: 0:8 <-> 1:16 (USB3): allocating i=
nitial bandwidth 9000/9000 Mb/s
[  143.600915] thunderbolt 0000:71:00.0: acking hot plug event on 1:13
[  143.601969] thunderbolt 0000:71:00.0: 0:8: scaled bandwidth 2198/2198, =
scale 0
[  143.602387] thunderbolt 0000:71:00.0: activating USB3 Down path from 0:=
8 to 1:16
[  143.602542] thunderbolt 0000:71:00.0: 0:8: Writing hop 0
[  143.602545] thunderbolt 0000:71:00.0: 0:8:  In HopID: 8 =3D> Out port: =
1 Out HopID: 8
[  143.602548] thunderbolt 0000:71:00.0: 0:8:   Weight: 2 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[  143.602550] thunderbolt 0000:71:00.0: 0:8:    Counter enabled: 0 Counte=
r index: 2047
[  143.602553] thunderbolt 0000:71:00.0: 0:8:   Flow Control (In/Eg): 0/1 =
Shared Buffer (In/Eg): 0/0
[  143.602555] thunderbolt 0000:71:00.0: 0:8:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  143.602761] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  143.602763] thunderbolt 0000:71:00.0: 1:1:  In HopID: 8 =3D> Out port: =
16 Out HopID: 8
[  143.602766] thunderbolt 0000:71:00.0: 1:1:   Weight: 2 Priority: 3 Cred=
its: 14 Drop: 0 PM: 0
[  143.602769] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[  143.602771] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  143.602773] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  143.602834] thunderbolt 0000:71:00.0: USB3 Down path activation complet=
e
[  143.602836] thunderbolt 0000:71:00.0: activating USB3 Up path from 1:16=
 to 0:8
[  143.602956] thunderbolt 0000:71:00.0: 1:16: Writing hop 0
[  143.602958] thunderbolt 0000:71:00.0: 1:16:  In HopID: 8 =3D> Out port:=
 1 Out HopID: 8
[  143.602960] thunderbolt 0000:71:00.0: 1:16:   Weight: 2 Priority: 3 Cre=
dits: 2 Drop: 0 PM: 0
[  143.602963] thunderbolt 0000:71:00.0: 1:16:    Counter enabled: 0 Count=
er index: 2047
[  143.602965] thunderbolt 0000:71:00.0: 1:16:   Flow Control (In/Eg): 1/1=
 Shared Buffer (In/Eg): 0/0
[  143.602967] thunderbolt 0000:71:00.0: 1:16:   Unknown1: 0x0 Unknown2: 0=
x0 Unknown3: 0x0
[  143.603180] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[  143.603183] thunderbolt 0000:71:00.0: 0:1:  In HopID: 8 =3D> Out port: =
8 Out HopID: 8
[  143.603185] thunderbolt 0000:71:00.0: 0:1:   Weight: 2 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[  143.603187] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[  143.603190] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  143.603192] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  143.603288] thunderbolt 0000:71:00.0: USB3 Up path activation complete
[  143.603464] thunderbolt 0000:71:00.0: 0:6 <-> 1:9 (PCI): activating
[  143.603467] thunderbolt 0000:71:00.0: deactivating PCIe Down path from =
0:6 to 1:9
[  143.603598] thunderbolt 0000:71:00.0: deactivating PCIe Up path from 1:=
9 to 0:6
[  143.603854] thunderbolt 0000:71:00.0: activating PCIe Down path from 0:=
6 to 1:9
[  143.604022] thunderbolt 0000:71:00.0: 0:6: Writing hop 0
[  143.604024] thunderbolt 0000:71:00.0: 0:6:  In HopID: 8 =3D> Out port: =
1 Out HopID: 11
[  143.604027] thunderbolt 0000:71:00.0: 0:6:   Weight: 1 Priority: 3 Cred=
its: 0 Drop: 0 PM: 0
[  143.604029] thunderbolt 0000:71:00.0: 0:6:    Counter enabled: 0 Counte=
r index: 2047
[  143.604032] thunderbolt 0000:71:00.0: 0:6:   Flow Control (In/Eg): 0/1 =
Shared Buffer (In/Eg): 0/0
[  143.604034] thunderbolt 0000:71:00.0: 0:6:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  143.604238] thunderbolt 0000:71:00.0: 1:1: Writing hop 1
[  143.604241] thunderbolt 0000:71:00.0: 1:1:  In HopID: 11 =3D> Out port:=
 9 Out HopID: 8
[  143.604243] thunderbolt 0000:71:00.0: 1:1:   Weight: 1 Priority: 3 Cred=
its: 32 Drop: 0 PM: 0
[  143.604246] thunderbolt 0000:71:00.0: 1:1:    Counter enabled: 0 Counte=
r index: 2047
[  143.604248] thunderbolt 0000:71:00.0: 1:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  143.604250] thunderbolt 0000:71:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  143.604307] thunderbolt 0000:71:00.0: PCIe Down path activation complet=
e
[  143.604309] thunderbolt 0000:71:00.0: activating PCIe Up path from 1:9 =
to 0:6
[  143.604415] thunderbolt 0000:71:00.0: 1:9: Writing hop 0
[  143.604417] thunderbolt 0000:71:00.0: 1:9:  In HopID: 8 =3D> Out port: =
1 Out HopID: 10
[  143.604420] thunderbolt 0000:71:00.0: 1:9:   Weight: 1 Priority: 3 Cred=
its: 7 Drop: 0 PM: 0
[  143.604422] thunderbolt 0000:71:00.0: 1:9:    Counter enabled: 0 Counte=
r index: 2047
[  143.604425] thunderbolt 0000:71:00.0: 1:9:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[  143.604427] thunderbolt 0000:71:00.0: 1:9:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  143.604634] thunderbolt 0000:71:00.0: 0:1: Writing hop 1
[  143.604637] thunderbolt 0000:71:00.0: 0:1:  In HopID: 10 =3D> Out port:=
 6 Out HopID: 8
[  143.604639] thunderbolt 0000:71:00.0: 0:1:   Weight: 1 Priority: 3 Cred=
its: 64 Drop: 0 PM: 0
[  143.604642] thunderbolt 0000:71:00.0: 0:1:    Counter enabled: 0 Counte=
r index: 2047
[  143.604644] thunderbolt 0000:71:00.0: 0:1:   Flow Control (In/Eg): 1/0 =
Shared Buffer (In/Eg): 0/0
[  143.604646] thunderbolt 0000:71:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[  143.604743] thunderbolt 0000:71:00.0: PCIe Up path activation complete
[  143.604895] thunderbolt 0000:71:00.0: tunnels restarted, sleeping for 1=
00ms
[  143.714315] thunderbolt 0000:71:00.0: resume finished
[  143.714359] thunderbolt 0000:71:00.0: 0:1: got plug event for connected=
 port, ignoring
[  143.714388] thunderbolt 0000:71:00.0: 0:2: got plug event for connected=
 port, ignoring
[  143.714407] thunderbolt 0000:71:00.0: 0:2: got unplug event for disconn=
ected port, ignoring
[  143.714573] thunderbolt 0000:71:00.0: 1:13: DP OUT resource available a=
fter hotplug
[  143.714580] thunderbolt 0000:71:00.0: looking for DP IN <-> DP OUT pair=
s:
[  143.714583] thunderbolt 0000:71:00.0: no suitable DP IN adapter availab=
le, not tunneling
[  143.897451] pcieport 0000:00:02.2: PME: Spurious native interrupt!
[  143.898297] pci 0000:00:00.0: enhanced atomics disabled
[  143.899677] amdgpu 0000:72:00.0: [drm] PCIE GART of 512M enabled (table=
 at 0x000000807FD00000).
[  143.899707] amdgpu 0000:72:00.0: PSP is resuming...
[  143.900820] nvme nvme0: D3 entry latency set to 10 seconds
[  143.905612] nvme nvme0: 16/0/0 default/read/poll queues
[  143.923788] amdgpu 0000:72:00.0: reserve 0x4a00000 from 0x8070000000 fo=
r PSP TMR
[  144.226468] ata3: SATA link down (SStatus 0 SControl 300)
[  144.226748] ata4: SATA link down (SStatus 0 SControl 300)
[  144.227060] ata1: SATA link down (SStatus 0 SControl 300)
[  144.384028] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[  144.390697] sd 1:0:0:0: [sda] Starting disk
[  144.397437] ata2.00: configured for UDMA/133
[  144.551640] amdgpu 0000:72:00.0: RAS: optional ras ta ucode is not avai=
lable
[  144.560403] amdgpu 0000:72:00.0: RAP: optional rap ta ucode is not avai=
lable
[  144.560406] amdgpu 0000:72:00.0: SECUREDISPLAY: optional securedisplay =
ta ucode is not available
[  144.560408] amdgpu 0000:72:00.0: SMU is resuming...
[  144.585639] amdgpu 0000:72:00.0: SMU is resumed successfully!
[  144.593735] amdgpu 0000:72:00.0: [drm] DMUB hardware initialized: versi=
on=3D0x08006500
[  144.613862] amdgpu 0000:72:00.0: [drm] *ERROR* lttpr_caps phy_repeater_=
cnt is 0x0, forcing it to 0x80.
[  144.613865] amdgpu 0000:72:00.0: [drm] *ERROR* LTTPR count is nonzero b=
ut invalid lane count reported. Assuming no LTTPR present.
[  144.634552] amdgpu 0000:72:00.0: ring gfx_0.0.0 uses VM inv eng 0 on hu=
b 0
[  144.634555] amdgpu 0000:72:00.0: ring gfx_0.1.0 uses VM inv eng 1 on hu=
b 0
[  144.634557] amdgpu 0000:72:00.0: ring comp_1.0.0 uses VM inv eng 4 on h=
ub 0
[  144.634560] amdgpu 0000:72:00.0: ring comp_1.1.0 uses VM inv eng 6 on h=
ub 0
[  144.634562] amdgpu 0000:72:00.0: ring comp_1.2.0 uses VM inv eng 7 on h=
ub 0
[  144.634563] amdgpu 0000:72:00.0: ring comp_1.3.0 uses VM inv eng 8 on h=
ub 0
[  144.634565] amdgpu 0000:72:00.0: ring comp_1.0.1 uses VM inv eng 9 on h=
ub 0
[  144.634567] amdgpu 0000:72:00.0: ring comp_1.1.1 uses VM inv eng 10 on =
hub 0
[  144.634569] amdgpu 0000:72:00.0: ring comp_1.2.1 uses VM inv eng 11 on =
hub 0
[  144.634572] amdgpu 0000:72:00.0: ring comp_1.3.1 uses VM inv eng 12 on =
hub 0
[  144.634574] amdgpu 0000:72:00.0: ring sdma0 uses VM inv eng 13 on hub 0
[  144.634576] amdgpu 0000:72:00.0: ring vcn_unified_0 uses VM inv eng 0 o=
n hub 8
[  144.634578] amdgpu 0000:72:00.0: ring jpeg_dec uses VM inv eng 1 on hub=
 8
[  144.634580] amdgpu 0000:72:00.0: ring mes_kiq_3.1.0 uses VM inv eng 14 =
on hub 0
[  144.646500] PM: resume devices took 0.750 seconds
[  144.649528] OOM killer enabled.
[  144.649530] Restarting tasks: Starting
[  144.650215] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  144.650999] Restarting tasks: Done
[  144.651018] efivarfs: resyncing variable state
[  144.653431] xhci_hcd 0000:70:00.0: bad transfer trb length 4 in event t=
rb
[  144.655639] efivarfs: finished resyncing variable state
[  144.675477] PM: suspend exit
[  144.744007] r8169 0000:05:00.0 enp5s0: PHY [r8169-0-500:00] driver [Rea=
ltek Internal NBASE-T PHY] (irq=3DMAC)
[  151.181172] r8169 0000:05:00.0 enp5s0: configuring for phy/internal lin=
k mode
[  154.270283] r8169 0000:05:00.0 enp5s0: Link is Up - 1Gbps/Full - flow c=
ontrol off

--nextPartjbI8-qFWTyyGo-SToscmWg--



