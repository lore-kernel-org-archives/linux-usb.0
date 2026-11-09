Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235177;
	b=zQI2QFIYQmxy1CBWUlyIZzqr4VkDyklQ0whkEDi92bzQV9W9bDv6uERjIDkHEudTVTSa
	 Lpy3kH33Oideqkx0+lEP2VYmOl4dC4WIEoPmUTFtKaFogjXnQOCe0GONaO0kY1egT6Jhd
	 KJS2BDeEnxliU4snPGJ/uhkYPRFyhZ+rNeb2rXUHjH/1tVLc/BXTvQ1gf2HoTzss/ue1N
	 nTRVtkCpuTmjQd6fyE9hmw1cxIZXg5q67NzLdGOQkwilIUy3MCMXmkp1J/kZSAnsrOxeS
	 YAfRbEb7NXFIQm6oOL4S9uuYCdYGHSQ58k8+HoRt9223Zv6uUt84Ar8YZqQck12vNZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=6zygIhq1WeMtTV3EJxSxYMqzhgS9YtyW3r2ROUjwGXA=;
	b=ETCMbMgu5fXqLfcvf+u3YI6ARXmvaJjofHUlffPF1jqeW0rvXIc00FG+Duf5d75EIPeU
	 67SJ0T3Q5sIUtxqh4Pc3NyZAH83j3x4OtdVwxtMH9NbdLHy7nhgvAO4neGhvqgGFwc0vX
	 VaHXvq/EFFkO+45OjuvZvQXeOHHk9qxDBHyzKCS6ZVqUwYOqILKK8vo6Ui23Ow32QTe/h
	 nupSMTIw5rm3k+GnDQM7rYcnjoeIbMYsiCbcw72n1wh9FtbgXInHFnKAfngnzgRLztods
	 8X3rvCJ/a+0HnRd+zMcQcsguoqq2oxW61CKHu5S1H0MlRPTU8/OxWbCpixJ/erRky1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhlrLsrZ;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671BC606A322
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671BC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhlrLsrZ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49412eb1474so619433f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235176; x=1794839976; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zygIhq1WeMtTV3EJxSxYMqzhgS9YtyW3r2ROUjwGXA=;
        b=PhlrLsrZDNDXBC+eQVOedTpakjDoJ9y+DoRORhhNKCa2CS9zRW5z9dOUbSNdBvcMUc
         rAFndhKUpyGOYUKluebRlHXiAcLU7sssiBFYC3BcoXvA5K+k0IzPQMdGjvZmCkcZNP8i
         45AMsfg818SvYA0R1HTz0LZxz9ZdUeUifxCyBRovjWKi/sDQo3xWGQGsxMfVzdFEeOnc
         PzkD2AYcy0TSmNr3t8gbiKCe27w/2+RRXWtz8HzDRywzkouugzdJGnUgmUlTF5136jeB
         tvd5CgFm4Qag/QJ8HVXEOLTkTOukwyYXcTH1a3dNMjRtOEvgFLWQdNqao61dTQpi45jw
         hHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235176; x=1794839976;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zygIhq1WeMtTV3EJxSxYMqzhgS9YtyW3r2ROUjwGXA=;
        b=l7pC1laq+CG02MiuWpdkmQq8zWLVYweUja3MYSJffSkADkQ4BcB13a3MPRoGYfqemG
         lo8bXbbPe74TeELmLqUU53qC7cDlQOxAsDwmFHMAT6ehgEGsDltiAF8MA5sNO2OV1w+h
         7pp+VvNQFDlW6H7V5Nb6nqbOuVEMCx0kyG5toxWMvYQ6lhkEpggkQnfLVVbOj7fX1+VJ
         dx3eJwLtlVybm6P+DHwzys4Giy3jl8OKTIA07fjX53jvMV3D9QqVzt5fbWYRKXh7/nNk
         WV2btgoPJFsqIkeMt6zxnqF6OvehxlllPn6YCqPOV+9q+thFuSxPBc6ZfHCWJ7ciu6+h
         xkbQ==
X-Gm-Message-State: APuU4Z9yRcE/gDfVgI9Y/PUVabc3/jNklzZj6jwaw9k9u2oTwyBCBbia
	ifijryUZdF0IvVGbcCscSjveqkqCtDGnpPuq/XJfSb83OAi2lrKBowaWE+hvPw==
X-Gm-Gg: AYBFou3Pv+bqLRA1K+afK/7R8AACYB017F9d1P8GCT0ByLbi29wphDJAEhat4oR29n+
	0Dse6F8kfSvjgsJP/RA9gtb8etZTaPv1aAToV3whN1wAL0TZ2U2UVXTW59oUcHADUwWskDx2i+3
	iHXIVjlOHuvf7a/sR62RuO2u/W+5CasD3JBiaLVVbrQ7QOOZQsVL0RZj9FfTxYCFn7dX2cE4/mi
	0tO50aRcNcLC8xT/mPTq0alSrqZ6xOJfD/Y8kSWtWdeGXn4O3MufZ0RqXUtTIhUyzC/FS0mByEI
	s4QzuhX/Hm686HIin4LER6Le07lrKFAXyjLbJzhS4FpYDuR96gr3iVo7T1EhJkinGo2tH5udgKy
	5BTNhUkF5BuVH6MZjWtr9MAjcKG/NxOK++MXeHcDC/YQ03KC+3u6sa/x7EqwdvG+zKxsg+N5KJV
	eoiRh6ukWI7eOoYb/tjHrrCG/JXQnaZX61T1vHnRnHxk8WPyn2lMOQhnXMa3GHGTvA453YaZoRe
	fDKXw9uMD1CrJZGXprqxXlArLW/+91+7J4INkzpv4ou83yUtsLu5SD6BiJmXyeNNGZ15o+EpQUb
	kk+DOG+cNtbhDbBfmUzZa7xQHbQCnx6C8zOhFEDNYcvwWjbyn/QOlGw6eEUrS9H6sp4CD2jXsG8
	k/k+VeOXnaj/z0Vz8UswuisJNtCwoPHKUlrX2hlzNGQ0eogOoEek8GZIPwDidE59iaGie
X-Received: by 2002:a05:6000:1884:b0:490:6327:96ba with SMTP id ffacd0b85a97d-49584599504mr8217625f8f.47.1794235175395;
        Mon, 09 Nov 2026 06:39:35 -0800 (PST)
Received: from reply-20261109143927.eml (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b2066esm10440336f8f.52.2026.11.09.06.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:39:34 -0800 (PST)
From: James R Taylor <jrtaylor11@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in SB LINK_CONF with TB5 device, link stuck at Gen2
Date: Mon, 09 Nov 2026 14:39:27 +0000
Message-ID: <1794235167.3657.reply.hermes@gmail.com>
In-Reply-To: <20261109142041.GS176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com> <20261109111852.GQ176724@black.igk.intel.com> <1794223545.366398.reply.hermes@gmail.com> <20261109142041.GS176724@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_hermes_1794235167_3657"

--=_hermes_1794235167_3657
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mika,

On Mon, Nov 09, 2026 at 03:20:41PM +0100, Mika Westerberg wrote:
> Please drop thunderbolt.host_reset=0 and pcie_aspm=off. The later disables
> much more than just ASPM so it may affect everything. Once you have done
> that please take another dmesg (and check also the link registers via
> tbdump).

Done. I rebooted with both parameters removed. The only addition is
thunderbolt.dyndbg=+p so the full debug output is in the log:

  nohibernate root=fstab loglevel=4 lsm=landlock,yama,bpf usb-storage.quirks=0bc2:3343:u thunderbolt.dyndbg=+p

The result is the same as before: the link still comes up as TBT at
10 Gb/s x2 (the dmesg has "2: link: TBT" and "current link speed
10.0 Gb/s"), and the lane adapter registers are identical to my
previous dump. The host lane adapter targets Gen 3, the DEG2 targets
Gen 4, and both report Current Link Speed = Gen 2, x2.

The full dmesg from this boot is attached (gzipped). The tbdump output
is below.

    # cmdline: initrd=\EFI\nixos\c18phgd1m2qpc2g72pz14fg9h9i38j6w-initrd-linux-7.2.15-initrd.efi init=/nix/store/x1jyvpbgdhl6a91iysmbr5wisgi0sghd-nixos-system-nyx-26.11.20261106.4fe25e1/init usb-storage.quirks=0bc2:3343:u nohibernate root=fstab loglevel=4 lsm=landlock,yama,bpf thunderbolt.dyndbg=+p
    # 1-2 rx=10.0 Gb/s x2 tx=10.0 Gb/s x2
    # usb4_port link: none tbt tbt none none none

    $ tbdump -d 1 -r 0 -a 2 -N 2 -vv LANE_ADP_CS_0
    0x0080 0x003c01c0 0b00000000 00111100 00000001 11000000 .<.. LANE_ADP_CS_0
      [00:07]       0xc0 Next Capability Pointer
      [08:15]        0x1 Capability ID
      [16:19]        0xc Supported Link Speeds
      [20:21]        0x3 Supported Link Widths (SLW)
      [22:23]        0x0 Gen 4 Asymmetric Support (G4AS)
      [26:26]        0x0 CL0s Support
      [27:27]        0x0 CL1 Support
      [28:28]        0x0 CL2 Support
    0x0081 0x4828003c 0b01001000 00101000 00000000 00111100 H(.< LANE_ADP_CS_1
      [00:03]        0xc Target Link Speed → Router shall attempt Gen 3 speed
      [04:05]        0x3 Target Link Width → Establish a Symmetric Link
      [06:07]        0x0 Target Asymmetric Link → Establish Symmetric Link
      [10:10]        0x0 CL0s Enable
      [11:11]        0x0 CL1 Enable
      [12:12]        0x0 CL2 Enable
      [14:14]        0x0 Lane Disable (LD)
      [15:15]        0x0 Lane Bonding (LB)
      [16:19]        0x8 Current Link Speed → Gen 2
      [20:25]        0x2 Negotiated Link Width → Symmetric Link (x2)
      [26:29]        0x2 Adapter State → CL0
      [30:30]        0x1 PM Secondary (PMS)

    $ tbdump -d 1 -r 2 -a 1 -N 2 -vv LANE_ADP_CS_0
    0x0036 0x0cfe01c0 0b00001100 11111110 00000001 11000000 .... LANE_ADP_CS_0
      [00:07]       0xc0 Next Capability Pointer
      [08:15]        0x1 Capability ID
      [16:19]        0xe Supported Link Speeds
      [20:21]        0x3 Supported Link Widths (SLW)
      [22:23]        0x3 Gen 4 Asymmetric Support (G4AS)
      [26:26]        0x1 CL0s Support
      [27:27]        0x1 CL1 Support
      [28:28]        0x0 CL2 Support
    0x0037 0x4828003e 0b01001000 00101000 00000000 00111110 H(.> LANE_ADP_CS_1
      [00:03]        0xe Target Link Speed → Router shall attempt Gen 4 speed
      [04:05]        0x3 Target Link Width → Establish a Symmetric Link
      [06:07]        0x0 Target Asymmetric Link → Establish Symmetric Link
      [10:10]        0x0 CL0s Enable
      [11:11]        0x0 CL1 Enable
      [12:12]        0x0 CL2 Enable
      [14:14]        0x0 Lane Disable (LD)
      [15:15]        0x0 Lane Bonding (LB)
      [16:19]        0x8 Current Link Speed → Gen 2
      [20:25]        0x2 Negotiated Link Width → Symmetric Link (x2)
      [26:29]        0x2 Adapter State → CL0
      [30:30]        0x1 PM Secondary (PMS)

    $ tbdump -d 1 -r 2 -a 2 -N 2 -vv LANE_ADP_CS_0
    0x0036 0x0cfe0100 0b00001100 11111110 00000001 00000000 .... LANE_ADP_CS_0
      [00:07]        0x0 Next Capability Pointer
      [08:15]        0x1 Capability ID
      [16:19]        0xe Supported Link Speeds
      [20:21]        0x3 Supported Link Widths (SLW)
      [22:23]        0x3 Gen 4 Asymmetric Support (G4AS)
      [26:26]        0x1 CL0s Support
      [27:27]        0x1 CL1 Support
      [28:28]        0x0 CL2 Support
    0x0037 0x4828003e 0b01001000 00101000 00000000 00111110 H(.> LANE_ADP_CS_1
      [00:03]        0xe Target Link Speed → Router shall attempt Gen 4 speed
      [04:05]        0x3 Target Link Width → Establish a Symmetric Link
      [06:07]        0x0 Target Asymmetric Link → Establish Symmetric Link
      [10:10]        0x0 CL0s Enable
      [11:11]        0x0 CL1 Enable
      [12:12]        0x0 CL2 Enable
      [14:14]        0x0 Lane Disable (LD)
      [15:15]        0x0 Lane Bonding (LB)
      [16:19]        0x8 Current Link Speed → Gen 2
      [20:25]        0x2 Negotiated Link Width → Symmetric Link (x2)
      [26:29]        0x2 Adapter State → CL0
      [30:30]        0x1 PM Secondary (PMS)

    $ tbadapters -d 1 -r 0
     1: Host Interface (upstream)     Enabled
     2: Lane 0                        CL0
     3: Lane 0                        CL0
     4: USB 3 Down                    Disabled
     5: PCIe Down                     L0
     6: DisplayPort IN                Disabled
     7: DisplayPort IN                Disabled

    $ tbadapters -d 1 -r 2
     1: Lane 0 (upstream)             CL0
     2: Lane 1                        CL0
     3: Lane 0                        CLd
     4: Lane 1                        CLd
     5: Lane 0                        CLd
     6: Lane 1                        CLd
     7: Lane 0                        CLd
     8: Lane 1                        CLd
     9: PCIe Up                       L0
    10: PCIe Down                     Disabled
    11: DisplayPort OUT               Disabled
    12: DisplayPort OUT               Disabled
    13: Not implemented
    14: Not implemented
    15: Not implemented
    16: Not implemented
    17: PCIe Down                     Disabled
    18: PCIe Down                     Disabled
    19: DisplayPort OUT               Disabled
    20: USB 3 Up                      Disabled
    21: USB 3 Down                    Disabled
    22: USB 3 Down                    Disabled
    23: USB 3 Down                    Disabled

Thanks,
James

--=_hermes_1794235167_3657
Content-Type: application/gzip; name="dmesg-cleanboot-20261109-1439.txt.gz"
Content-Disposition: attachment; filename="dmesg-cleanboot-20261109-1439.txt.gz"
Content-Transfer-Encoding: base64

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
SRf8xiekLsArFJBKAU+//As1kH2WhMACAA==

--=_hermes_1794235167_3657--

