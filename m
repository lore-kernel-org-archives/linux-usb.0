Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4C35B632
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152670; cv=none; b=nROKcO+AvDIzhHdn5E4Pg853cuV9Fa9B2KlfhEB9FkyDh0m3V6HSs41JX3YdEZzxILMFeY5etHsJcBUYhVdLebxzURvemd6jitmNEtykcS0B5/iNdeL4Obk3R7vOTqpRrr0HvopJWsZnvjRBHXZJ477dwUXH+b8ZkDZp0DP0Peo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152670; c=relaxed/simple;
	bh=2ZnWzULxkQcOinF1NTzWho7PrO+xlLyh2f/WaQWn0n0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ioiir8f8o+3NTc4mENJ3/datN/FsmvLMFcHwEUn6VTef8bVjGtLMlprUtifOLVLalDPHrso1AfkF8u0MT625w0ghaupWVzNwV6SU7gkfn0nyySeJnKRyvuYJKzdG39NG0/YfK3JUKJAwnuZtEnPb00Ak2hjuFwkTyZEAPKqdH9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiKZex5K; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiKZex5K"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-471eeac43bfso897512f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787152667; x=1787757467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZJNcjH0JN4O20mUb8uh0mnedSppPdz9TC+D/BCjVFE=;
        b=UiKZex5KOQ1XXJKN7E8eDiUFe2oqkqaOOxlRsqXm5+6rl3u/6XTOLjTw1qs7lNYjpB
         K8uICY5LNl9MXjp3J2kb8BvJp7s/laixbZQ+YQVahPbnUgVmGr9C+1TmQK45yp4cX2Bl
         13M4fUDyYyOlKlk3+8HtNXhLsW/zb0TCnrgbI+dT+hhMUAlRY6HPcEl9UgfJ7ALbr7mA
         G15QBMJDkM0mfV6gG2g/NLPClUJHJKJe/MIz7fuetJFZW/D0Fsd47qwp5i+gRNCqqfro
         NqmFMe59fecBloIXA1vRV1B1zLG9O3nmpeU4C9AijyB31gf4jQrILQm9dmT8CWZWw2Ei
         envA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152667; x=1787757467;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZJNcjH0JN4O20mUb8uh0mnedSppPdz9TC+D/BCjVFE=;
        b=e1XIJj3flYH5/VE5CZzT/PEJnIX1iUFFXTkKGVPlfMNOzrAM0W+nwHDxyJh/Um5BCl
         MdU3UhsnkYHnPIgcluZcZ3uNhxE5HqCG7mp0goSV7qfx1q7/sBTtC9mYI6rMN45ms6PC
         7vzti5CbjNK9tp5IR2BG8Z02OImHetTCuvdZwgRE9uFBj3/pzDkZqP+TdGtKG2e9XGO4
         TOPapBqPfO5j/HMBo49GwiZs/mnwi4zQG5baxvAwTnxr4RCtfujk5VyHAV2vzGxsZ7lu
         jTKz+HkxoeGUure1QnfIC5p9HvvJuV9Wc94U4ncEFicC63r3EoLqUnxeLr6kiW1sTu9t
         FjPQ==
X-Gm-Message-State: AFuF++kqJELUeBxcwckEe2PTrXqHnVcZaqL2hClyjfYgCcWj8CrYsyXD
	zULrARRzZXYz5JFviS4aGCO9jbRUvdsujjfgCF9vbr8XzUaKqsaqV3JQ
X-Gm-Gg: AR+sD10vFQGqlToSnNK1deE+JgM8kz6RPyRzd0SCWdIHqVocL200i/IENqEp9Z5DtU0
	cOjgHucUmLQf91g9B+/mYKj9jlwvRU1qOMflXAcQIJj13o/qeN8QF8y6cO/pr6MD3W9JGGFWbGP
	MKZDp0Jx+H34ap0wir1SF6wqB+i9lDTD12M4tJJR4ZLi9VUsYs7eid4OztGzafKpxfHVeBY3qGY
	YcvNP1VjoF0kHZtOcwjtw6f4L3MCSEdMkF2tV5JlFO1AM8Dt/u8gCKfl2xvREMZ5+65Vh6SdgWw
	EaUJVGKxl+5NUfULmDFKX1a4I+Ubpt4VoNWMn0kSnHt57li5Oc9C4pwSIxl2vm66JX6bsI5d+6E
	yx/RO/wMxyAcPGMxGOfG9WliWUuTD2vEI+Qbj8p8ByXvttJSj1UN+H/WVF66E/rWu4eTRa2yBOF
	6NJO39iXX2xynPGg7bQ6j9TSTm8Mv9d6GcaLUPnh97/84eIJ/WDsaZRIOlt4cXRI9s0M0=
X-Received: by 2002:a05:6000:4012:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-482b1fd3990mr8650644f8f.11.1787152666616;
        Wed, 19 Aug 2026 08:17:46 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm6431179f8f.6.2026.08.19.08.17.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Aug 2026 08:17:46 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:17:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Pedro Fonseca <pedro@fonseca.com.pt>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: xhci: hard lockup on ASM2142 when Address Device command times
 out
Message-ID: <20260819171744.4bc8e8c6.michal.pecio@gmail.com>
In-Reply-To: <16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt>
References: <16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Aug 2026 11:35:40 +0100, Pedro Fonseca wrote:
> I am hitting a reproducible hard lockup in xhci_hcd on an ASMedia
> ASM2142/ASM3142 controller. It happened twice in three days on the
> same kernel, and both times the machine lost all USB input and had
> to be power-cycled.

Is this a regression or just using new hardware for the first time?

> The two occurrences produced different backtraces, and I think
> together they show both ends of the same deadlock: one caught the CPU
> holding xhci->lock, the other caught a CPU spinning for it from hard
> IRQ context.

Yes, a known bug when command abort fails and in some other cases.
The lock ought to be dropped while waiting, but this opens new race
conditions which will need to be analyzed and solved.

Not a deadlock, lock holder times out.

> Affected controller:
>=20
>  =C2=A0 26:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM2142/AS=
M3142
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USB 3.1 Host Controller [1b21:2142]
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Subsystem: Micro-Star International C=
o., Ltd. [MSI] [1462:7a32]
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Kernel driver in use: xhci_hcd
>=20
> Topology below it: a Genesys Logic hub (05e3:0610 USB2 / 05e3:0626
> USB3) with a Ducky keyboard (04d9:0356) and a OnePlus 6T phone
> (18d1:4ee7, ADB/charging mode) attached.
>=20
>  =C2=A0 /:=C2=A0 Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxh=
ci_hcd/2p, 480M
>  =C2=A0 =C2=A0 =C2=A0 |__ Port 002: Dev 002, If 0, Class=3DHub, Driver=3D=
hub/4p, 480M
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |__ Port 002: Dev 003, If 0, Class=3D=
Vendor Specific Class,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Driver=
=3D[none], 480M
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |__ Port 003: Dev 004, If 0, Class=3D=
HID, Driver=3Dusbhid, 12M
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |__ Port 003: Dev 004, If 1, Class=3D=
HID, Driver=3Dusbhid, 12M
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |__ Port 003: Dev 004, If 2, Class=3D=
HID, Driver=3Dusbhid, 12M
>=20
>=20
> Trigger
> =3D=3D=3D=3D=3D=3D=3D
>=20
> In both occurrences the lockup happens exactly 19 seconds after a fast
> connect/disconnect cycle of the OnePlus 6T on port 3-2.2, behind the
> Genesys hub. The phone re-enumerates repeatedly as ADB switches modes,
> and the controller dies in the middle of a setup device command.
>=20
> It is not fully deterministic - it happened twice in roughly two days
> of normal use, not on every plug event.
>=20
>=20
> Occurrence 2 - 2026-08-19 10:45:05 (waiter side)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Aug 19 10:44:45 usb 3-2.2: new high-speed USB device number 13 using=20
> xhci_hcd
> Aug 19 10:44:45 usb 3-2.2: New USB device found, idVendor=3D18d1,=20
> idProduct=3D4ee7, bcdDevice=3D 4.09
> Aug 19 10:44:45 usb 3-2.2: Product: OnePlus 6T
> Aug 19 10:44:45 usb 3-2.2: USB disconnect, device number 13
> Aug 19 10:44:46 usb 3-2.2: new high-speed USB device number 14 using=20
> xhci_hcd
> Aug 19 10:45:05 watchdog: CPU11: Watchdog detected hard LOCKUP on cpu 11
> [...]
> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: Abort failed to stop command=20
> ring: -110
> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: xHCI host controller not=20
> responding, assume dead
> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: HC died; cleaning up
> Aug 19 10:45:05 xhci_hcd 0000:26:00.0: Timeout while waiting for setup=20
> device command
> Aug 19 10:45:05 usb 3-1: USB disconnect, device number 2
> Aug 19 10:45:05 usb 4-2: USB disconnect, device number 2
> Aug 19 10:45:05 usb 3-2: USB disconnect, device number 3
> Aug 19 10:45:06 usb 3-2.2: device not accepting address 14, error -108
> Aug 19 10:45:06 usb 3-2-port2: couldn't allocate usb_device
> Aug 19 10:45:06 usb 3-2.3: USB disconnect, device number 12

Looks like a firmware bug, because ASMedia should internally time
out an Address Device command after 3 seconds. The only exception
I know is the old ASM1042 (waits forever and can't be aborted).=20

An interesting experiment would be to unplug the offending device
before abort timeout. This recovers even ASM1042, at least so long
as it's alive. You should see "error -71" and continued operation:

usb 3-2.2: device not accepting address 14, error -71

> After the controller died, the second xHCI on this board (03:00.0, the
> AMD X370 chipset one) also started failing while I was trying to plug
> in a spare keyboard to reboot cleanly:
>=20
> Aug 19 10:45:52 usb 1-12: new full-speed USB device number 26 using xhci_=
hcd
> Aug 19 10:45:57 usb 1-12: Device not responding to setup address.
> Aug 19 10:45:58 usb 1-12: device not accepting address 26, error -71
> Aug 19 10:45:58 usb 1-12: WARN: invalid context state for evaluate contex=
t command.
> Aug 19 10:46:01 usb usb1-port12: attempt power cycle
> Aug 19 10:49:32 usb 1-12: device not accepting address 29, error -71
> Aug 19 10:49:59 xhci_hcd 0000:03:00.0: xHC error in resume, USBSTS 0x401,=
 Reinit
> Aug 19 10:49:59 usb usb1: root hub lost power or was reset
> Aug 19 10:49:59 usb usb2: root hub lost power or was reset

Are you sure it's not a pre-existing, independent issue?

> I power-cycled the machine at 10:50.

Probably SSH would work over some PCI NIC.

Regards,
Michal
