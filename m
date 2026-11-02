Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663484;
	b=tKWCHLIo9+jgR3eAs4vgmpx9EBhDxDdWOFOcipdu+gd4SiGM8kj9KOiSrDjBG1IL8LXT
	 u9UgSbBdqAJwDSDAcJ4I6iO8ysSX+wRIYs/TcmjTQuzXA98o60S66gjW/PHNFZiRh5DV3
	 IF77KOevS8vxmkwou3yF53Pm50q9rFfjPoBR2Jf2YHRfiYYKpAeRcoQNFDUJV43KXAJB1
	 ESX2CnV1SnP21RNQYxG0sNcGs/E5phoSSbfzKAfdI+UyNcJ970Nwdjm+SdL8+ya6EYLDy
	 +/lW4HdOvaSllFsjxdI1hq1HTKbghhEfG6oUI792rSi95keV0rfky5DxmHbf/mEkk4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663484;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=YldMXS8fGb7ieLAb12ssBdoE35uoZ6hhXozshHB/TYI=;
	b=TREh8XG2cNMOEcD0+JgbMhSf51qfuk8fsetVx9DsvqPLVqtmEQyphPz7KS1cqXzWmjVn
	 HRXiHnHv2jSIllPQSKdKxZvgq7eFmaDYY/ac1jUSVhRZ8fRe0bdeGwjN3TL0efHraTEeU
	 +WUn7wb9YUd7wK58KbAOIH3oCqXHM/tkOm9QF4XLv5PA0HNEZ63yw1jSPsNp3vymh0WKy
	 /htL1YZY9oUmEjTmMrYhp/H0lKuYMmYWs+ddK1Z3YP/KxyFMiFUz4Grb1rtQFOFaM8xly
	 /0NunUWUQi1HzLSXl5V+AREH6nKEMXM1/JFbROQmB+2twI0tKGziUIQO4NJxC6wdJPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iP9brDZN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC03606A324
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Mon,  2 Nov 2026 23:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iP9brDZN
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207B6513C0
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 23:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793663484; cv=none; b=NAanunSlNy5i1r1oKnL14fH0BqgvfIXkpLEizkVeMFmhGq7Ab8Kme9ifHCA0DsRmykYnjdAB/lI1jnZuvCkHPv4ENLt5Gdlr5NGXdplB6XV1KTDu4XV3shbxxVgzvI3DdLq3AqSIN8uoylU3W9Ek/hA0DMmCZ2ZctUB0LLi8wpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793663484; c=relaxed/simple;
	bh=FFNX9GWm+dDcuLpN35SKCXWeUUSk4Otgksh/GFTDjiA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fwq5kJ3pSaDw3r4vhNrxceEqv5ikP0C84I9kSNcVw8RBFI9NZEhsGZ3lEqbDnNw4Bko8kW7uGeMpB1JhoIz1W1c2LLjQnHqz4B/wG9hgYhbGFcmyYcIAnBIVFlQNyd5tQOvzn2drS7E3j1rS7qUAkKFkoeDaEcgOvvfiEm7GVQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iP9brDZN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 662D3C2BCFB
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 23:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793663483;
	bh=FFNX9GWm+dDcuLpN35SKCXWeUUSk4Otgksh/GFTDjiA=;
	h=From:To:Subject:Date:From;
	b=iP9brDZNuxCtRTciO4IRafaTjH3qPDoXT8a/8vEOQSC0Io69Zwlzi0nJlIjjExKJi
	 KMPyms0FmGZD4TaCj3FPL4V3FbJC45/GJd/eV2FFApZ8bl7CQU0OUiFi8MUEIDtSB7
	 zccSK/w/069eaPoU34peZ3T1FHiPsXASnXXnMoOzyH41QM37poLDPyMZpi9qKYjQkb
	 dM9AyQ5u2RSIb6q/16BMT3z71zaIHU3RvnTMO9sQr0G+Y09mgSHEYcLx3K+ZgxL55Q
	 tqaKjdP96OowgleMHvQFO8tZP5mDwy95HMUd0QAaiyu6B2Q3x4NNi9VS9htj0cBlWF
	 3vsYqnWbFt9Qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3AE7BC41612; Mon,  2 Nov 2026 23:51:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222229] New: HID: usbhid: Razer DeathStalker Essential 2014
 (1532:011f) 51.2s EP0 initialization timeout (-110), dead LEDs, and hotplug
 failure
Date: Mon, 02 Nov 2026 23:51:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre.jap@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222229-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222229

            Bug ID: 222229
           Summary: HID: usbhid: Razer DeathStalker Essential 2014
                    (1532:011f) 51.2s EP0 initialization timeout (-110),
                    dead LEDs, and hotplug failure
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pierre.jap@gmail.com
        Regression: No

Overview
=3D=3D=3D=3D=3D=3D=3D=3D
When booting with or hot-plugging a Razer DeathStalker Essential 2014 keybo=
ard
(USB ID 1532:011f), USB HID enumeration hangs for 51.2 seconds (`usbhid: ca=
n't
add hid device: -110` on interfaces 1.1 and 1.2), status LEDs (NumLock /
CapsLock / ScrollLock) fail to light (`usb_submit_urb(ctrl) failed: -1`), a=
nd
unplugging/replugging leaves the keyboard completely unresponsive on ~75% of
attempts.

dmesg Output (Unpatched)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
usb 3-6.2: new full-speed USB device number 5 using xhci_hcd
usb 3-6.2: New USB device found, idVendor=3D1532, idProduct=3D011f, bcdDevi=
ce=3D 2.00
usb 3-6.2: Product: Razer DeathStalker Essential 2014
usb 3-6.2: Manufacturer: Razer
input: Razer Razer DeathStalker Essential 2014 as /devices/.../input/input5
hid-generic 0003:1532:011F.0001: input,hidraw0: USB HID v1.11 Keyboard [Raz=
er
Razer DeathStalker Essential 2014] on usb-.../input0
usbhid 3-6.2:1.0: usb_submit_urb(ctrl) failed: -1
usbhid 3-6.2:1.1: can't add hid device: -110
usbhid 3-6.2:1.1: probe with driver usbhid failed with error -110
usbhid 3-6.2:1.2: can't add hid device: -110
usbhid 3-6.2:1.2: probe with driver usbhid failed with error -110

Root Cause Analysis (Verified via usbmon & EP0 probing)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
The Razer DeathStalker Essential 2014 exposes 3 USB HID interfaces sharing
Control Endpoint 0 (EP0, bMaxPacketSize0 =3D 64):
- Interface 0 (1.0): Boot Keyboard + LEDs (61-byte report descriptor, ep_81=
 IN)
- Interface 1 (1.1): NKRO Keyboard + Consumer/System Control (179-byte repo=
rt
descriptor, ep_82 IN)
- Interface 2 (1.2): Virtual Mouse + 90-byte Vendor Feature Report (94-byte
report descriptor, ep_83 IN)

Three interacting firmware/kernel behaviors wedge the keyboard
microcontroller's EP0 state machine on Linux:

1. `usbhid_init_reports()` (`HID_REQ_GET_REPORT`) on Interface 0:
   Sending `HID_REQ_GET_REPORT` (0x01) over EP0 during `usbhid_start()`
destabilizes the MCU. Applying `HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_NOGET`
prevents `usbhid_init_reports()` from probing reports on EP0.

2. Dirty EP0 state after class `GET_DESCRIPTOR(HID_DT_REPORT)` (`bmRequestT=
ype
=3D 0x81`):
   After `usbhid_parse()` reads the 61-byte `HID_DT_REPORT` descriptor on
Interface 0 (`bmRequestType =3D 0x81`), the MCU leaves its EP0 parser in a =
state
where an immediate class-specific `HID_REQ_SET_REPORT` (`bmRequestType =3D =
0x21`,
bRequest =3D 0x09 =E2=80=94 used to set the NumLock LED) or `HID_REQ_SET_ID=
LE` either
fails or locks up EP0.
   Issuing a standard 18-byte `GET_DESCRIPTOR(USB_DT_DEVICE)` (`bmRequestTy=
pe =3D
0x80`, bRequest =3D 0x06, wValue =3D 0x0100) on EP0 immediately before and
immediately after `usbhid_parse()` resets the MCU's EP0 state machine clean=
ly.

3. Asynchronous `hdev->led_work` (`SET_REPORT`) race vs. Interface 1.1
enumeration:
   At the end of Interface 0's input registration (`hidinput_connect()` ->
`input_register_device()` -> `input_leds_connect()`), the kernel schedules
`hdev->led_work` (`hidinput_led_worker`) asynchronously on `system_wq` to s=
end
`HID_REQ_SET_REPORT` over EP0 at the exact same moment
`usb_set_configuration()` moves on to probe Interface 1 (1.1) on EP0.
   Additionally, on Interface 1's first 179-byte (`0xb3`)
`GET_DESCRIPTOR(HID_DT_REPORT)` request, the MCU occasionally drops one 64-=
byte
packet and returns 115 bytes (`179 - 64`). When `usbhid_parse()` immediately
retries without an intervening `USB_DT_DEVICE` descriptor read, EP0 stops
responding for 2 x 25.6s =3D 51.2s (`-ETIMEDOUT`).

Verified Fix / Proof of Concept
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Flushing `hdev->led_work` before probing secondary interfaces, applying
`HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_NOGET`, and issuing an 18-byte
`GET_DESCRIPTOR(USB_DT_DEVICE)` on EP0 between HID descriptor reads reduces
initialization time from 51.2s to < 0.2s, makes hotplugging 100% reliable, =
and
restores NumLock/CapsLock LEDs across all 3 interfaces (`1.0`, `1.1`, `1.2`=
).

Full working out-of-tree DKMS module demonstrating the fix:
https://github.com/Djkawada/razer-deathstalker-linux-fix

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
