Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095183;
	b=JZMuqF4rkGpQN6d1mPSFEfu2g2RlDYjUPcBBs51mvYSCOpUwgT5/r35/n+cZwj1nhc2u
	 a5rU052xDvabDKTs018Mt/Pg9332eZzFgQESxTTqXBL9DU7iZppaTfYPX81Er662eVZDT
	 e6rd6ppZf0jvrtbIK5dCByLfLiBu+lPqBnOsPWcg2kkv7kJNqIUfpsGBIJ5+hizDpCLX9
	 7QuICIl2v88Fz0XOgHuUr2polk2dauDoMgMXWi/zduJpzeDhRlBHkduMepPs8tN9pA2ZE
	 ZNP3eC32C2+pQZhw1lg33GRuWFAHKOK4WYG1AjRorRvSGN4NDtGEhJApcLSICZWLUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095183;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=Zxxix/vNeLqeo067iDj3ZfKIVTP+kyIyXq2pb2zfpUU=;
	b=2d0hMTfyEFhkqo1EYPsnKYE93CwgxXD7BrleSAAMcjD4xGmF+Iyc3GYBaHaXng3/hqC5
	 GYsDPoQWoEmZfxx8YlkMjO7QkB727Bwwerfi9y4wGPbJw03tiPI0g22SwE3Iq4yex1brc
	 enezuh9GlsHavJd9+nMl6/YdlDGp7QlLPCGJd1kGw3uWREuTiuPXZf4m7A4Us5bmDpfrG
	 +LMx6u7G4OtVByyrLjlVpN39BsTvI9sXusHWSuMuq3wV5ek7dXtM2BTNDInUvygfRh4Xf
	 +Pq9DjbfUyFFXTA3EGKOfWvrm9xiuHhdJnqkNo1CbB6LiSeDuRePHkiNPhKlVDFRJmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnmybbzK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8AB606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnmybbzK
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EF981F000C5
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095183;
	bh=Zxxix/vNeLqeo067iDj3ZfKIVTP+kyIyXq2pb2zfpUU=;
	h=From:To:Subject:Date;
	b=PnmybbzKEzODtgWdmYpj+F1t7BWm0zA/6mSzYL9Gzf/qHZ/075Qb9Z8rtYtTj4Utj
	 xZ4I2jjSHMRXonpEKn3aR+6692Fkjhq0RS73pHnkbiMGqb8fNCSEmxtYbTK9NyIZEP
	 Mb6c9MU01p6AUp9d8n4LEEJMjJ6u0uFZJAp3Ji5AhWbSbnKAcXP7ZAbFsSrPb3tMXC
	 R+aJhW++ieaB6Fqq08I7J5lGnWyRPRdSQxEIP2+3Tqt16D1+y9HpDzgYSz5OZ7xBfo
	 yFTn0HnMcc/5z9rPZzCWUIU15hsp0uFdsFk4aff0NTahRdofe+6veKsrAO9hYuL4JK
	 /e6RKnRifB29Q==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 7BE3B240040C; Thu, 19 Nov 2026 13:33:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222296] New: HID sub-device (wheel rim) hot-swap on Ardor Le
 Mans base does not re-probe the keyboard interface
Date: Thu, 19 Nov 2026 13:33:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daniel.matushkin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222296-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222296

            Bug ID: 222296
           Summary: HID sub-device (wheel rim) hot-swap on Ardor Le Mans
                    base does not re-probe the keyboard interface
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: daniel.matushkin@gmail.com
        Regression: No

[1.] Summary:
The Ardor Le Mans racing wheel base exposes multiple HID interfaces (joysti=
ck
for FFB, keyboard for buttons). When the wheel rim is physically removed and
reconnected while the base remains plugged into the PC via USB, the buttons
stop working.=20

The USB connection of the base is NOT dropped during the rim hot-swap, and =
no
new events appear in dmesg. The kernel does not trigger a re-probe of the
keyboard interface (input1), leaving the input state stuck.=20

[2.] Steps to reproduce:
1. Connect the wheel rim to the Ardor Le Mans base.
2. Plug the base's USB cable into the PC.
3. Verify buttons work normally (input1 / keyboard interface).
4. Disconnect the rim from the base (dmesg shows nothing).
5. Reconnect the rim to the base (dmesg shows nothing).
6. Press any button on the wheel =E2=80=94 no input is registered.
7. Re-plugging the base's USB cable from the PC temporarily fixes the issue.

[3.] Expected behavior:
The keyboard interface (input1) should be re-initialized or continue to rec=
eive
HID reports after the rim is hot-swapped.

[4.] Actual behavior:
The buttons stop responding in OS and games. dmesg produces no output during
the rim swap, indicating the parent USB device remains connected but the
sub-device state is lost.

[5.] Environment:
- Distribution: Linux Mint 22.2 Cinnamon
- Kernel: 7.0.0-43-generic
- Driver involved: hid-universal-pidff (version 0.22) + hid-generic
- Hardware: Ardor Le Mans base (USB ID: 11ff:dd12)
- Connection: Direct to PC USB port (xhci_hcd)

[6.] dmesg output (relevant lines):
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:33 2026] usb 1-7.2: USB disconn=
ect, device number 32
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] usb 1-7.1: new full-sp=
eed USB device number 34
> using xhci_hcd
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] usb 1-7.1: New USB dev=
ice found, idVendor=3D11ff,
> idProduct=3Ddd12, bcdDevice=3D 0.40
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] usb 1-7.1: New USB dev=
ice strings: Mfr=3D1,
> Product=3D2, SerialNumber=3D3
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] usb 1-7.1: Product: AR=
DOR Le Mans
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] usb 1-7.1: Manufacture=
r: LitteStar
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] usb 1-7.1: SerialNumbe=
r: 76665B50C7D531DD
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] input: LitteStar ARDOR=
 Le Mans as
> /devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7.1/1-7.1:1.0/0003:11FF:DD12.=
0023/input/input55
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] hid-universal-pidff 00=
03:11FF:DD12.0023:
> input,hidraw5: USB HID v1.11 Joystick [LitteStar ARDOR Le Mans] on
> usb-0000:00:14.0-7.1/input0
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] hid-universal-pidff 00=
03:11FF:DD12.0023: device has
> unknown autocenter control method
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] input input55: Force f=
eedback for USB HID PID
> devices by Anssi Hannula
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] hid-universal-pidff 00=
03:11FF:DD12.0023: Universal
> pidff driver loaded successfully!
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] input: LitteStar ARDOR=
 Le Mans as
> /devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7.1/1-7.1:1.1/0003:11FF:DD12.=
0024/input/input56
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] hid-universal-pidff 00=
03:11FF:DD12.0024:
> input,hidraw24: USB HID v1.10 Keyboard [LitteStar ARDOR Le Mans] on
> usb-0000:00:14.0-7.1/input1
> [=D0=A1=D1=80 =D0=BD=D0=BE=D1=8F 18 23:12:45 2026] hid-universal-pidff 00=
03:11FF:DD12.0025:
> hiddev11,hidraw25: USB HID v1.11 Device [LitteStar ARDOR Le Mans] on
> usb-0000:00:14.0-7.1/input2

Note: No dmesg output is generated when the rim is removed or reconnected.

[7.] Additional context:
The wheel requires a strict initialization sequence: the rim must be attach=
ed
BEFORE the base is plugged into the PC. If the base is already plugged in a=
nd
the rim is attached, the buttons do not work at all. The base does not expo=
se a
USB hub; the rim connects via an internal protocol, and the base simply sto=
ps
sending correct HID reports for input1.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
