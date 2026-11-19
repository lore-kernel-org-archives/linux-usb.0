Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095132;
	b=0KdO3UEma1rVl4mlh9czGkD7IS1HSJ0iKuXgvveEalCQZc1yOFSJE8GiE5qIBtyuUswT
	 ZB7qR09MrVVIzcO9etGAusmoS2KKWhaalibC3OBgSpW0kh6uk4K7NmxA1V0X/LTnXBx+u
	 iGjo2DMmXGMPFrrbJsAOLNc9o5z4OYQ3x0UJnqRClZ4cTpZN8GsGK1z2I+7bx0g9Gtywz
	 iBY0gLKFefSXOXNeN7qSYGKob8Dtir6fPFrVZ4SP959F7Ylko4JHgq/QnEHYukMW+AFuv
	 tBFw95LlQ6d9R+CmROHUIhhcP60Ya293waWik4vI1Za0csEjnn9Ib4yfLnYAx/VV2ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095132;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=YyAHCD8SABpBbmxcmZTJqqp/11eRRuKetr4GpWThuLk=;
	b=OH6bfAtuHS8ms5DMj8OoggNv6fqe/7+p3ocOHr6mczUOy4sJ3ZWvI9LKRU9ApcAKuuR2
	 YEFxsbovEi/vBDmXlPbUznD8HiDX4EJXCrb8EDm9/MHXjxeTwqt3GSTOT4RcMtWfTIpqC
	 8op+EUp7RZYK8HNQV+On4PQqakRWU9hKfPv/yYreHkFDb2zIMYkXctN4ZJk6/ln3zyMbS
	 08iZzLyZ36mnIDl9UumJfKooLU9OkGD2T/j6vRYwIvM6S6U8tOFgFWTKP2Rd/km4Y/MIy
	 gB3xO4gEvjh4KsSNCx04p+1o4OaH7stxpd8GDukFaJmWQiWzFfgJTFHjqb4pFra75nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBaYdDjM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88F606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBaYdDjM
Received: by smtp.kernel.org (Postfix) with ESMTPS id 528C41F000C5
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095132;
	bh=YyAHCD8SABpBbmxcmZTJqqp/11eRRuKetr4GpWThuLk=;
	h=From:To:Subject:Date;
	b=gBaYdDjMDQ/YnMQX3fy6ocEgyGWUNG8xzOYAepJ8EWXQvTP1Q0DNm1bOysriXvynx
	 D04hTvgW/uBqygylLw9zZaG7zBVrIpt9gqu1yO0COwsVu/lFVUx17+x9ephbX17Yi+
	 3rwzPfOV61eDojApDeEVMh3IF9MAd93Ka/VUeIumgow4eNnWVmvCkITtivo6bexTU6
	 3T5cR8a5eRc6/H3IQvakTyVeBMs9vj4+kMr/s0PMJy/U6/f6x9ka4th9tEaUYZ+WC/
	 SsqFj135QmAFQhGReZfsbejBMaCUmTN9CSe1wXqDxMym0Ehy7MAlo+FjVRcNSQkIbT
	 vqt5XjKgbOqOg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 4E0D1240040C; Thu, 19 Nov 2026 13:32:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222295] New: HID sub-device (wheel rim) hot-swap on Ardor Le
 Mans base does not re-probe the keyboard interface
Date: Thu, 19 Nov 2026 13:32:12 +0000
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
 cf_regression attachments.created
Message-ID: <bug-222295-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222295

            Bug ID: 222295
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

Created attachment 311521
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311521&action=3Dedit
lsusb -v -d 11ff:dd12 output

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
