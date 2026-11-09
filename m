Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223561;
	b=0lxmzGrJA88lSdX5aRw9NRd4DfGxZ3isAcUn0tFMGVoFE48l6K7nfndsn2zCpVP6rkJZ
	 3MGiQIAFfaWTjdqvowLsIkZgQTR7dMbKt3e2VbyA1yMO4hNVIV+suzdHv6SEaPkB30AC7
	 552TcpU60YUIv7yCkhYaklzlqK8NNGyjiSjSpjyf/GVpTdGVuvXhUtiXGXRjV1vqrxfld
	 t64OeOTBg8VtFuQRWKUiEReD8w0Spj5ngJFmU0vr409DgKd9RDXAgvIyVfjfRS/zTF1Rx
	 N892izDlAbYEk5bEWmEFRzoKipRca+gv1KczbWDc5e3lbAZjNB1TBc6Op5/lS7cdyXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=erqG0kEpZy1vBKF35pJ5BbBT3LtlJCNNPiduF4KWIe0=;
	b=Vk+v/q4AiFu1OWkJIszO4UNt2m1dTAPEO3pKhoCb4ETLuib2fwyQmhs4AiSV298dYHhx
	 fSWXKna0SGt4Kt3Xb5yP7QjI6fSkI6zY5ptm1tI2k8pVBSMxkH1NAXh96R/j1OihfE1YE
	 FKxpeQT+OIfVIB2RTSLZwzPxl5fpJ6b3ZOT5OHOMFH4R/xLFpCBGltw5sAT5RML42pMxV
	 IRKuAv1PVQSyzWLnecL7TzHdyPR7z1jmkNdIujR26gWkjsvwvoYhxwpSlU6UAmcpEQN0B
	 EzVT8LQC/5PyN2mFRDkpavkEHTy4ZIOT5QsVC3sxIH4AbULzR4fkJosKkIc4vKjTNFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9jo6CpU;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDF4606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 11:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDF4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9jo6CpU
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so591856f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 03:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223560; x=1794828360; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erqG0kEpZy1vBKF35pJ5BbBT3LtlJCNNPiduF4KWIe0=;
        b=G9jo6CpUP971m2j06WUseZmaqCQxpGpXrqxnk5R6PbAi+UxFVs6GUqstcYmw5h57G3
         8QxAIl2S3PSDTtZPtOCCR1jozwOS4ziZZO/cEbVOr3/7TC8xNIFujntUqmOwn2HK2iJz
         rujP93STTZ0CcxgHAqwcybF8gy7uNK02Ab7SV5zeN3iPGmwx8n2D+JxTVgFcd367ifGQ
         tk5MG6KNPbQOZx0WtMcPZk2W3JUqlORPRjrMMicdXbmpPOuKryrDWNLZsxZh7xfHmqBO
         Yj6V5EUlkuAhhL00Y+UtoRIfbZ+jGt7FKrsqaepGLWrLY5OhFUFBQTIJzE5/ouhG2xSF
         YO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223560; x=1794828360;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erqG0kEpZy1vBKF35pJ5BbBT3LtlJCNNPiduF4KWIe0=;
        b=Q3aHb9dwMt12TjNgYub6T31k5ZOfO7For0cuWpDj5dO97mBqESq2LSDha/HCk5xhGI
         HeYEplRJV0hzNxNXj9HKhyTpEhhnBJhtbyS2sVX1jYRWn0ziLRayIMt2miV4pS3japCW
         qCR9Z18iED80VgyHf8S6LszVsLz2XqF2+nB9FJoa7x9FFTgS+MADYI5ltGcf9VtX9C+i
         2aYK4EYVIKIvq2ekLWD9szdKrW6D28Z80WhUB8QCf5W88VPLPa6EPKVGgoTJgVcPT3AM
         509v69kFw+qm0JM5otMMcQjJUqR/xeSjOZRJiHhw+yLWRQpCnEgKyxQRrW96pT7w000O
         0v7Q==
X-Gm-Message-State: APuU4Z9Xek4XEdk0URSebOOZLK3HlWjMg4uW/y/nM94eSYZ1QnMwgLvE
	FIpEW0+wBmR5N3c1n1tSIau+ldKXJCp+T+OwkoKAHopSZKpfQzwInxPTe35rrA==
X-Gm-Gg: AYBFou3TbIF1Qnz72bN56Fo3H1j0zuM3z0847rcVJUmO8yzIOkWp2EerOBVBGM4e4dc
	2SryNdMFjzBHdOnZUqSGRkjZ1O1Ruplkx5JEd6f0PWnULNqcv4a6X0YjQiv1H6QDkAIyD07PhqF
	VcJGQd+OeEeBqlaJwLtvtGyypMGqrxW0IKXULUUHplDZTSJ3JCazUuAFUwl9VpIKxvylzhPEm9J
	HAlXPj47E8PIEIAJ5CecU8CIkRuFd5aZhNWqemglwgc5wQeumtL8AGAnbSB7BtKb3v9eqP+pj2x
	rT1nntiXuZu3aOJNfETuy3sGrn3PtF64HAfI/TQaIX6Y9GWjIiuz0A91jNHYnQvJxFLORCigqKI
	4Jr5cfIrYxdbBHta//yJWky5EwRAiDVcpciRUZt4GDySz8ng6nv0+0lwa789vRTZ9GlnAg97c1G
	S3FniVn+dmisnqHIoSprvqoucVuo8BmnKLlEbDzq3nmXA6ypySVte0U8/YB33h6i7jNp3snKNJT
	OHTZQQ0GR59bfIiz2uVkWLOM3nKKAgH96+BSrfR5o/dYKxMXOIjBH6lthw/NNQknQSaMMQf4VMN
	4VjFwmvVCp0Zxta2FFTbBphJL3YP3qLFmGMaRMlyry7di57Tk/hUntIwQNtUZLaS4O1o/fDkOx/
	GzZO8JTLTamaV2zZC7aLj+v3G8Aukfr1ZXApcpHXrlAyj7zE=
X-Received: by 2002:a05:6000:2002:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-4958a6d18d5mr7670578f8f.18.1794223559217;
        Mon, 09 Nov 2026 03:25:59 -0800 (PST)
Received: from reply-20261109112545.eml (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597748acbsm9331423f8f.44.2026.11.09.03.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:25:58 -0800 (PST)
From: James Taylor <jrtaylor11@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in SB LINK_CONF with TB5 device, link stuck at Gen2
Date: Mon, 09 Nov 2026 11:25:45 +0000
Message-ID: <1794223545.366398.reply.hermes@gmail.com>
In-Reply-To: <20261109111852.GQ176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com> <20261109111852.GQ176724@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_hermes_1794223545_366398"

--=_hermes_1794223545_366398
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mika,

On Mon, Nov 09, 2026 at 12:18:52PM +0100, Mika Westerberg wrote:
> Please use tbdump from tbtools [1]. It knows the registers. Something like
> this:
>
> https://github.com/intel/tbtools/wiki/Useful-Commands#dump-lane-adapter-capability-for-current-link-capabilities-and-status

Thanks, here it is (tbtools 0.8.0). Domain 1 route 0 is the AMD host
router, route 2 is the DEG2 (JHL9480). Both lane adapters on each side
are included, followed by tbadapters for reference.

    tbtools 0.8.0, kernel 7.2.15, BIOS 1.06, 2026-11-09 11:23 UTC

    # tblist -A
    Domain 0
    Domain 0 Route 0: 0000:0000
    Domain 1
    Domain 1 Route 0: 0000:0000
    Domain 1 Route 0 Adapter 2 Index 1: 7fea:1032
    Domain 1 Route 2: 041f:d002 Micro Computer (HK) Tech. Ltd. TBGAA

    # tbdump -d 1 -r 0 -a 2 -N 2 -vv LANE_ADP_CS_0
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

    # tbdump -d 1 -r 0 -a 3 -N 2 -vv LANE_ADP_CS_0
    0x0080 0x003c0100 0b00000000 00111100 00000001 00000000 .<.. LANE_ADP_CS_0
      [00:07]        0x0 Next Capability Pointer
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

    # tbdump -d 1 -r 2 -a 1 -N 2 -vv LANE_ADP_CS_0
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

    # tbdump -d 1 -r 2 -a 2 -N 2 -vv LANE_ADP_CS_0
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

    # tbadapters -d 1 -r 0
     1: Host Interface (upstream)     Enabled
     2: Lane 0                        CL0
     3: Lane 0                        CL0
     4: USB 3 Down                    Disabled
     5: PCIe Down                     L0
     6: DisplayPort IN                Disabled
     7: DisplayPort IN                Disabled

    # tbadapters -d 1 -r 2
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

> Also please provide full dmesg with dynamic debugging enabled.

Attached (dmesg-tb-dyndbg-20261109.txt.gz, gzipped to stay under the
list size limit). It is the full log since boot; at 68136.012005 I
reloaded the driver with "modprobe thunderbolt host_reset=0 dyndbg=+p"
so the whole enumeration of the host routers, the retimer and the DEG2
is captured with debug output. The link came up the same way again,
2 x Gen2 ("current link speed 10.0 Gb/s", "link: TBT"). The only edits
to the log are masked MAC and IP addresses.

Happy to run anything else that would help.

Thanks,
James

--=_hermes_1794223545_366398
Content-Type: application/gzip; name="dmesg-tb-dyndbg-20261109.txt.gz"
Content-Disposition: attachment; filename="dmesg-tb-dyndbg-20261109.txt.gz"
Content-Transfer-Encoding: base64

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
uVGjrgIA

--=_hermes_1794223545_366398--

