Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C5DF59
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812918; cv=none; b=bqY1KohTA+8vNeyTATc7/k7oeYfcDUJgP9KUJjTL5CWXToADkLcVdrsRbipZTVUbUc1lNzYQofg1rgi3/ZBQ4whbTJl37sCvGONr4HMd0YqNA75HLKgjA44y/3UprlQ4rVgSCs2te+8pFTihWFrmx1DPa3HTZgTMZeaVVnplt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812918; c=relaxed/simple;
	bh=DJdm0RuimDjfgpvipQ0wLDAT3h/Tub5nE/iXiIwIViQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mchPz3ATrT9pyiwW98xHgpN3jnLofIRrs1FcEWzi0LSJIfFUgvRww05QiaILVq2HvLn1NN7OVGWmUALXvQnhv9xhM51fGF33bPEeVzL0WEG15PKdH0/b1pekkku6Q/i7O7v2fIJEXtdxFP12XRwV3hNqEs7HXPx0BHGAYNcErZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cj46aT54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cj46aT54"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B579EC2BCB8
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 13:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784812917;
	bh=DJdm0RuimDjfgpvipQ0wLDAT3h/Tub5nE/iXiIwIViQ=;
	h=From:To:Subject:Date:From;
	b=cj46aT546sjpgux1q5pJjXQ+D7BNjH2AVRgnGDNPD7QMzv2DBM+SSptkqqKMMfOts
	 JDftgEI6XJfDujZzDv28arThj1s1O9vVfLtHVpOF0BKkCGUGip9fbvukFA/Y9tUX/R
	 pWLGB4UUBLzyxPdfZ+BrHnNpD9WVJ5HftsmiCS2Ur9yannxZ6ERKWHbbpDYzx/reda
	 lqHWXLixpkpyf7Pn+++fbo8yp5yKUZAOvVkDQ8B2KNtwV9Fb0rveIkrbDSInmm1BVM
	 qjq8OwAN8/oAKHHqFZBwSsinXSfCD/o3gDDJb00zc/3J5swxEfMbTVRWJJbDi8u2Yl
	 Dnif/L0iPKw5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B631C433E1; Thu, 23 Jul 2026 13:21:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221779] New: 3Dconnexion CadMouse Pro Wireless (256f:c654)
 repeatedly disconnects when wired, reproducible on all 4 host controllers
Date: Thu, 23 Jul 2026 13:21:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scott.meyers.email@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221779-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221779

            Bug ID: 221779
           Summary: 3Dconnexion CadMouse Pro Wireless (256f:c654)
                    repeatedly disconnects when wired, reproducible on all
                    4 host controllers
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: scott.meyers.email@gmail.com
        Regression: No

Created attachment 310491
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310491&action=3Dedit
gmesg output

SUMMARY

3Dconnexion CadMouse Pro Wireless (USB HID, wired mode) repeatedly
disconnects/re-enumerates a few seconds to a few minutes after connecting, =
on
every USB host controller present on the system (4 tested). Device works
flawlessly in wireless mode (via included 2.4GHz receiver) on the same mach=
ine,
and works flawlessly wired on Windows 11 with no vendor driver installed.
Behavior is fully reproducible and independent of hub topology, controller
vendor, or power-management settings.

SYSTEM INFORMATION

Distro: Kubuntu
Kernel: 7.0.0-28-generic
Motherboard: ASUS ROG Zenith / Prime X399-series (Threadripper platform) =
=E2=80=94 4
on-board USB xHCI controllers:
01:00.0 =E2=80=94 AMD X399 Series Chipset USB 3.1 xHCI Controller (rev 02)
08:00.0 =E2=80=94 ASMedia ASM2142/ASM3142 USB 3.1 Host Controller
0a:00.3 =E2=80=94 AMD Zeppelin USB 3.0 xHCI Compliant Host Controller
43:00.3 =E2=80=94 AMD Zeppelin USB 3.0 xHCI Compliant Host Controller

DEVICE INFORMATION

Product: 3Dconnexion CadMouse Pro Wireless
USB IDs: idVendor=3D256f, idProduct=3Dc654
Firmware: bcdDevice=3D1.21
Connected via: OEM micro-USB cable (charge+data), no hub
No vendor driver in use on either OS (3Dconnexion does not support this dev=
ice
on Linux; also tested with no driver installed on Windows)

STEPS TO REPRODUCE

Plug in CadMouse Pro Wireless via USB cable to any port on the system.
Use the mouse normally.
After somewhere between ~5 seconds and ~3.5 minutes of connection, the mouse
stops responding.
dmesg shows a clean "USB disconnect" followed by re-enumeration ~10-90 seco=
nds
later.
Repeat =E2=80=94 interval to failure is irregular (not a fixed timer).

EXPECTED BEHAVIOR

Device remains connected and responsive indefinitely, as it does:

In wireless mode via the 3Dconnexion Universal Receiver on this same machine
Wired, on Windows 11, on this same machine, same cable, same ports, no vend=
or
driver installed

DIAGNOSTIC STEPS ALREADY RULED OUT

USB autosuspend: power/control for the device confirmed "on",
autosuspend_delay_ms confirmed -1 (disabled). Kernel boot params already
include usbcore.autosuspend=3D-1. No change in behavior.
USB Link Power Management (LPM): Tested usbcore.quirks=3D256f:c654:u to dis=
able
LPM for this device. No change.
Hub chain / power delivery: Tested through multiple external hub chains
(Genesys Logic hub chips) and with the mouse plugged directly into the case=
's
rear I/O panel with zero hubs in the path. Same failure in both cases.
Controller-specific fault: Reproduced identically on all 4 on-board USB
controllers (AMD X399 chipset, ASMedia ASM2142, and both AMD Zeppelin
controllers), each tested with a direct connection (no hub). Rules out a si=
ngle
bad controller/port.
HID always-poll quirk: Tested usbhid.quirks=3D0x256f:0xc654:0x4
(HID_QUIRK_ALWAYS_POLL). Confirmed active via
/sys/module/usbhid/parameters/quirks and /proc/cmdline. No improvement =E2=
=80=94 device
disconnected in ~3 seconds, faster than baseline.
PCIe ASPM: Already disabled system-wide (pcie_aspm=3Doff) prior to testing.=
 No
change.

RELEVANT DMESG EXCERPTS

[Wed Jul 22 14:54:47 2026] hid-generic 0003:256F:C654.000D: input,hidraw12:=
 USB
HID v1.11 Mouse [3Dconnexion CadMouse Pro Wireless] on
usb-0000:0a:00.3-3.3.3/input0
[Wed Jul 22 14:55:39 2026] usb 5-3.3.3: USB disconnect, device number 8
[Wed Jul 22 14:56:57 2026] hid-generic 0003:256F:C654.000F: input,hidraw12:=
 USB
HID v1.11 Mouse [3Dconnexion CadMouse Pro Wireless] on
usb-0000:0a:00.3-3.3.3/input0
[Wed Jul 22 14:57:15 2026] usb 5-3.3.3: USB disconnect, device number 11
[Wed Jul 22 15:01:40 2026] hid-generic 0003:256F:C654.0011: input,hidraw12:=
 USB
HID v1.11 Mouse [3Dconnexion CadMouse Pro Wireless] on
usb-0000:0a:00.3-3.3.3/input0
[Wed Jul 22 15:05:03 2026] usb 5-3.3.3: USB disconnect, device number 12
[Wed Jul 22 15:06:01 2026] hid-generic 0003:256F:C654.0018: input,hidraw13:=
 USB
HID v1.11 Mouse [3Dconnexion CadMouse Pro Wireless] on
usb-0000:43:00.3-4/input0
[Wed Jul 22 15:07:31 2026] usb 7-4: USB disconnect, device number 10
[Wed Jul 22 15:08:10 2026] hid-generic 0003:256F:C654.001E: input,hidraw13:=
 USB
HID v1.11 Mouse [3Dconnexion CadMouse Pro Wireless] on
usb-0000:43:00.3-4/input0
[Wed Jul 22 15:10:40 2026] usb 7-4: USB disconnect, device number 13

No error codes (e.g. -71), no "xHCI host controller not responding", and no
host-controller-death messages accompany any of these disconnects =E2=80=94=
 the
disconnect events themselves are "clean," with no visible USB transaction e=
rror
preceding them.

FAILURE TIMING OBSERVED (irregular, not a fixed interval)

Connected 14:54:47 =E2=86=92 Disconnected 14:55:39 (52s)
Connected 14:56:57 =E2=86=92 Disconnected 14:57:15 (18s)
Connected 15:01:40 =E2=86=92 Disconnected 15:05:03 (3m23s)
Connected 15:06:01 =E2=86=92 Disconnected 15:07:31 (1m30s)
Connected 15:08:10 =E2=86=92 Disconnected 15:10:40 (2m30s)

ADDITIONAL NOTES

Community tool cadmousectl (https://github.com/mia-0/cadmousectl), a
reverse-engineered CadMouse config utility, notes that this device loses its
internal settings every time it disconnects =E2=80=94 suggesting the device=
 itself does
a real internal reset/reinit on each drop, not just a communication hiccup =
at
the host side.
3Dconnexion does not provide a supported Linux driver for this model, so on=
ly
hid-generic is in play; it's unclear whether any additional vendor-specific
initialization (present in Windows' generic USB/HID handling, even without
3DxWare installed) might differ from what hid-generic sends on connect.

Will attach: fresh dmesg -T output, lsusb -v -d 256f:c654 output, and lsusb=
 -t
output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
