Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80C046C4CF
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439703; cv=pass; b=Sk3TrVMhB49li+WEvILvvne7uBpQejZ70AixbyHfgxfwmekPAH6xasMkh/flHVr5ZQPWs+BsVhOjM4vgp44RqfFCFIZOFUK7P4BouAyXBIhNtkbiGJBvEsxemiwLImTM306nFSSN2i42I+qJItdOAOlaSEta9wAhAOJPrvmjb2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439703; c=relaxed/simple;
	bh=ll/FaK04GC8vCwFkBBQHSFd/0rrd11opybKM/RHi/Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDpRdxH3nJp3ad6aJozQyDlR5yvj7A3ME0vLO07DIUdupJzvUKOTWL58/HLwyZeFmHvwoLQoRQ7mpYvaQ2hXkTuvpE/L51Lv16YjIVsFsS3jneWhCut8BsLO7FVZt19JxXe5gIFg1RJnyX5Vix02zsJflCjld0MzZNRe98Gfbno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDTO8Fba; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDTO8Fba"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso48699a91.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 12:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439695; cv=none;
        d=google.com; s=arc-20260327;
        b=GDKfTN215+qKa3wWw1tvoYDvnbFYWi2xatWlowyY5NE4Kw8Mq/8ohIXqdvkXFk4mTU
         T6HHFcOCBmANNpjL1w3gjBswbtuffPkVJAkHZP/fH1FTDLS/Pevc7mBoK8wPQNxzU9jD
         EzJPxhJaC1kbp5xet7Zo7kO13FLwnG83QBsr5kYrUS5YVhVPGMm9HpdcoQYJ1HmG8YgZ
         AKln3MOl7+TEIQcIxPHG9fdgCPgt8SsUFiwbc1h9A4P0eQp6CE49Fb2EEGDFjnBERBEF
         f/e917mIPYpYoYbcG5GM8F4QMdguf9AuKTflkrxt+6dVhwE1Qu66rd8a8GjVkSn5wm0v
         iUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs3O7+0+O1BzynlCu6bABVAxk2P74JiftgV+5qL8qh8=;
        fh=uH4/QGx9fEJh1dW9joRV9ezIeOgqU+9ut3bIOQCUtQA=;
        b=KjBCa9CuKgQ8YFAQ1TdiE2pXkSOMXHFke51yWMUzuQ6YT3HaSplLqouOf0vfkJHDaw
         4bZEijo0D9+j6R38LmxPziKHfw0v/ealKkD5IzJcv/zgMkykSSaj1+vMw7rPul+JRDPM
         59Sx5rwJn4cYomWvprUJkLuL5+83T5C/yeGbc68W17DFP2EZIU6XB1B3lPsixbByxL4P
         FeF+6dqAn/ifKIX26y0/3wJ4ArN4QZBlZrdKbRL1ubxfYnv8IiIbMW5ZmB9qSt9JQSWm
         nroaKiFjjDnlQ94wFXerFzrY4ghdj5bnQ6IFXPAnmYzFVL5JOTcnxOPs2ZYx5RN2bX7x
         CdcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785439695; x=1786044495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs3O7+0+O1BzynlCu6bABVAxk2P74JiftgV+5qL8qh8=;
        b=KDTO8Fba/EqjXNBQZACIfEE6OX698r6ac6Rhy+1Jr3GNSzF/wyiyO5UGEdBuxeNGJI
         0FmReaDwEPJNp4sJ2jKyRfYG/PtZeH9ldIl+xPnUw6mptx+ukGjzYDf9zQ/lw5otqvqH
         n7IhzLeRll721j62b/a47gx1UqDm3Sbz70iU0bPVVQZAG3CAKrZg1FCCwDb159HiEuCy
         1gRlaSXZLShIBUojbLXYlroacPMCEmmcpGvLwOnVryuou7b5XHefntgd40Cqjf3gcX0b
         t29EyMNlITuEe2+8SkYw3lLdXdxMfwyL/6pGxnN7qq9acPFJuv68HEAuOYTw16oRE13c
         FA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439695; x=1786044495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs3O7+0+O1BzynlCu6bABVAxk2P74JiftgV+5qL8qh8=;
        b=UbuEdH/fMng2lKcdz3jiHOvbW3iwOY8cJ+gST1f0qKhP64bGDv0ACAdeJqXyb3jfKe
         GS0MhBJ6m8BzJ49KIG2UwLMNIZnVotJob2WuBtV/A7pBEUY/kPLaJD+2noQ2t/r74NKg
         bHQoIAIOgGv+bKXvj55kExS0mRcnRnSC4YUMEaYQcaQElkIWXzWpj7/XurD3VcRlXvei
         yrHrk9B1eAPRkrBdnP096edJrF9HckOl/XPltOuiqImVKthonB0seGmIbD+4sQoYxdJl
         Z0oc+PABZyKo4e750cSLWyxLnMSDScPBz6phwn8qHb+qB/KJMdtAf9cjvapqxe9kARbC
         3BXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD4bKWSCJOt4mjITmgANDNTgE5i8ENzIi8avKEREjHII+V8vHFBitSe/ZIM4tthc19iFCZI0nJZaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+3b4UtD1JAtcuQjGqu4OlYCTnh9W53KFAG7XSjviMjr0KUfU
	75FY/a+EKHlE0Zvq4qR52D0An9PEUvOAR2I7oedR0LY7cR10mZpUMqYSke3owknaIIrFKwoBKa9
	AVNlQkhkZh3umJrKrxXCJJ/b6dHU4z+c=
X-Gm-Gg: AR+sD130q/lvleNK8mGhHozLP5LMT95efRjiYGc2doQWKyf10JqmyBulPxlrzH/ySpu
	ftNVcUsLCjJdSYwvyDbKhGN1BjEyOi3cT/+8F9cxpNZm2gQxyrGEU7P2KclbSVyLHWfngfaNr61
	nB2tgvFEBue5no7zFzrLi3XQNx1vHBo2wjmikotuyJpijJyIrGUgQrCvh+IWtll3kl2pDLAOKOE
	x/MT+TMH2YA+5PglyKMjFJplBtw6cAQPlUBrI8PLcTg98hdtOUTpHvlr+8rPyPbo+J6aOky4w03
	DH1nAQWcmn5AyjGIk4sb5S71v9cG8QfGVo4U3Pv3lh3yRChzc5Rq9dwe2YWV/krPK8wYjECKWcu
	UYYUBGKsLj85qQQx2CGXgWg3dJX4=
X-Received: by 2002:a17:90b:4c85:b0:387:d5bd:622e with SMTP id
 98e67ed59e1d1-38fa7824b05mr937031a91.17.1785439695076; Thu, 30 Jul 2026
 12:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
In-Reply-To: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Thu, 30 Jul 2026 15:28:02 -0400
X-Gm-Features: AUfX_mz_8J7N5cSdJsnEi7DuUMOyhEc8gY0WtMhugK0SpmdWDoQhR3Drz3IuJAo
Message-ID: <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: jikos@kernel.org, bentiss@kernel.org
Cc: regressions@lists.linux.dev, gregkh@linuxfoundation.org, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Per the recommendation on Proxmox Bugzilla #7850, I=E2=80=99m reporting wha=
t
appears to be a Linux USB/HID regression affecting a CyberPower
LE1000DG UPS.

Hardware

UPS

CyberPower LE1000DG
USB VID:PID 0764:0501

Affected x86 platform

Intel Tiger Lake-H USB 3.2 Gen 2 xHCI Host Controller
PCI ID: 8086:43ed

Problem

When connected to the x86 system, the UPS enumerates successfully and
is bound by the kernel to hid-generic.

Kernel messages include:

usb 1-3: New USB device found, idVendor=3D0764, idProduct=3D0501

usb 1-3: Product: LE1000DG

hid-generic 0003:0764:0501.0001: hiddev0,hidraw0:

USB HID v1.11 Device [CPS LE1000DG]

However,

sudo lsusb -v -d 0764:0501

reports:

wDescriptorLength     504

Warning: can't get report descriptor, LIBUSB_ERROR_PIPE

cannot read device status, Resource temporarily unavailable (11)

As a result, usbhid-ups is unable to reliably communicate with the
device and NUT cannot reliably monitor UPS status.

Kernels Tested

The issue reproduces on:

Proxmox VE kernel 7.0.14-5-pve
Proxmox VE kernel 7.0.14-6-pve
Ubuntu mainline 7.1.5-070105-generic

Reproducing the issue on an Ubuntu mainline kernel indicates the
behavior is not specific to Proxmox and appears to exist in upstream
Linux as well.

Comparison

The identical UPS, USB cable, and NUT configuration were moved to a
Raspberry Pi 5 running:

Debian 13 (trixie)
Linux 6.18.34+rpt-rpi-2712
NUT 2.8.1

On the Raspberry Pi:

the device binds successfully to hid-generic
usbhid-ups initializes successfully
NUT communicates reliably
upsc ups@localhost consistently returns complete UPS status, including
charge, runtime, voltage, load, and other telemetry

This behavior has remained reliable through repeated testing and reboots.

For completeness, lsusb -v on the Raspberry Pi also reports the HID
report descriptor as unavailable. Despite this, usbhid-ups
communicates with the UPS reliably. The communication failure only
occurs on the affected x86 platform.

Troubleshooting Performed

Tested multiple USB ports
Tested USB 2.0 and USB 3.x ports
Replaced the USB cable
Tested NUT 2.8.1, 2.8.5, and current development master
Tested as both root and the nut service user
Verified udev permissions
Verified USB VID:PID 0764:0501
Reproduced the issue on Ubuntu mainline 7.1.5

A Proxmox developer suggested this may require a USB HID device quirk
and requested that the issue be reported upstream.

Reference:

Proxmox Bugzilla #7850: https://bugzilla.proxmox.com/show_bug.cgi?id=3D7850

Please let me know if additional information would be helpful. I can
provide complete dmesg, lsusb, and usbhid-upsdebug logs or perform
additional testing if needed.

Thank you,
Jamie Stephens
