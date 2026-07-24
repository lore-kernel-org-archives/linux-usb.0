Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7951377EC7
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925931; cv=none; b=HetVVcvi7m8+Ctmga40857AY5Ey0FlkSLMzjBW06hZeRN3eP5pyB6id0u+bfpm/Na7BrQh67jrP+NTqGCrDPGzhavLnHQt789IgtpsttrNdaEshfhfz1ucjCv4N05ktzLM46RHBrNChDRgXighurUM7SSFz3aSpYkE+IaTrkLaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925931; c=relaxed/simple;
	bh=tQQjp6/Zlk94gGBr0qFHvJGWvJVsi5ANUQ7W1y+jQaA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bALd67vH5hg9Ah+0gTlS9ZGit5jhzp2+Ih/NoYUZy6Z6MLwk1dKG81jzykUynYrut1keSbCIuFO1pI3jlPJEWaJEtOXpFfUPbYqlJamuaymGoTAu6AP37k4TD8LJ01QCXAV1PI0TOKXocZaRPSdd+FzRY+svULTMJPwAShjP344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAQNGQvv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAQNGQvv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFC26C19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784925930;
	bh=tQQjp6/Zlk94gGBr0qFHvJGWvJVsi5ANUQ7W1y+jQaA=;
	h=From:To:Subject:Date:From;
	b=uAQNGQvvOMAXKCYMLo5lRrxwv/63Tx5mu/k2TTxHIRAa8aCsU+5bqB/GrJPkkuHCt
	 1XOPc03XyvazmQSeGUy3DaLiiMm6MfmeJRKEMnNgdFqdfQpxb0DGFGjsBz/S7eEYkL
	 AIN7V7/DcEy1li3RcBtSoLELgr7ouhrp/jlm+m84IJo3D1+gxetTImZ3oFV8PDtjsE
	 zodWJuuheGooxQjpwSKm+YMadtcIYOHvgGcR/rIm+x32HWjdNi/fbZCsPwQNdUw+sd
	 dp9/8TEdbCA8c2t8qVlq8OFBpJnSklZLEjSyueKtDWHmX/0wAmk/YBK8CT5rayYcUl
	 8eUNnS+F0Bgsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B92FC4160E; Fri, 24 Jul 2026 20:45:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIE5ldzogQU1EIFN0cml4IEhhbG8gKEFTVVMg?=
 =?UTF-8?B?R1ozMDJFQSk6IFRCNCBkb2NrJ3MgVVNCIDIuMCB1cHN0cmVhbSBuZXZlciBl?=
 =?UTF-8?B?bnVtZXJhdGVzIG9uIHhIQ0kgY29tcGFuaW9uIHBvcnQg4oCUICJDYW5ub3Qg?=
 =?UTF-8?B?ZW5hYmxlIiB4NCwgcG93ZXIgY3ljbGUsIGdpdmVzIHVwOyBVU0I0IGxpbmsg?=
 =?UTF-8?B?YW5kIFVTQjMgdHVubmVsIHdvcms=?=
Date: Fri, 24 Jul 2026 20:45:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkorcm@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-221785-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221785

            Bug ID: 221785
           Summary: AMD Strix Halo (ASUS GZ302EA): TB4 dock's USB 2.0
                    upstream never enumerates on xHCI companion port =E2=80=
=94
                    "Cannot enable" x4, power cycle, gives up; USB4 link
                    and USB3 tunnel work
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.0.0-14-generic
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: lkorcm@gmail.com
        Regression: No

One defect, consistently reproducible: a Thunderbolt 4 dock's USB 2.0
hub upstream fails to enumerate on this AMD USB4 host's USB 2.0
companion port. Everything else about the link is healthy.

Hardware:
- Host: ASUS ROG Flow Z13 GZ302EA =E2=80=94 AMD Ryzen AI Max+ 395 w/ Radeon
  8060S ("Strix Halo"), two USB4 ports.
  BIOS GZ302EA.311 (latest), ASUS PD firmware updated
  (ROG PD Firmware Update tool V2.13.0.001).
- Dock: Sonnet Echo 20 Thunderbolt 4 SuperDock (ECHO-DK20-T4,
  Goshen Ridge), included TB4 cable, own power supply.
- Kernel: 7.0.0-14-generic (Ubuntu live session).

Observed (all captures attached, taken in the same session):

1. USB4 side is fully functional. The CM enumerates the dock router
   and both Parade PS8833 retimers, and bolt authorizes it at
   40 Gb/s x2 lanes each direction:

   [ 4673.092478] thunderbolt 1-2: new device found, vendor=3D0x8 device=3D=
0x68
   [ 4673.092485] thunderbolt 1-2: Sonnet Echo 20 Thunderbolt 4 SuperDock
   [ 4673.820989] thunderbolt 1-0:2.1: new retimer found, vendor=3D0x1da0
device=3D0x8833
   [ 4674.652993] thunderbolt 1-2:1.1: new retimer found, vendor=3D0x1da0
device=3D0x8833

   The tunneled USB3 side comes up and works (dock hub chain and
   Realtek r8152 2.5GbE on bus 8, lsusb-t.txt).

2. The dock's USB 2.0 upstream fails on the companion port of the
   same connector, in parallel with the successful USB4 bring-up:

   [ 4674.354967] usb usb7-port1: Cannot enable. Maybe the USB cable is bad?
   [ 4675.242360] usb usb7-port1: Cannot enable. Maybe the USB cable is bad?
   [ 4675.242627] usb usb7-port1: attempt power cycle
   [ 4676.258334] usb usb7-port1: Cannot enable. Maybe the USB cable is bad?
   [ 4677.146602] usb usb7-port1: Cannot enable. Maybe the USB cable is bad?
   [ 4677.147009] usb usb7-port1: unable to enumerate USB device

   A connect is detected (D+ pull-up present) but the port never
   reaches enabled state after reset. Every USB 2.0 / FS / LS
   function of the dock is therefore dead (wireless receivers,
   dock audio, card reader).

3. The failure is invariant. The attached dmesg contains multiple
   plug cycles (four SuperSpeed connects of the dock's 8087:0b40
   hub, five USB 2.0 enumeration-failure sequences) across BOTH
   physical USB4 ports and both link outcomes
   (USB4 established, and USB 3.2 fallback sessions where mode entry
   did not occur): the USB 2.0 failure signature is byte-for-byte
   identical every time (usb5-port1 at ~648s/777s, usb7-port1 at
   ~4674s). Link mode and port are not variables.

   A "ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed" follows
   each dock connect (platform PPM errors on the alt-mode query).

Cross-checks already performed:
- Windows 11 on the same machine: identical end state =E2=80=94 the xHCI
  companion port (USB Device Tree Viewer, PortConnectorIsTypeC,
  CompanionPortChain) reports ConnectionStatus 0x00 while the USB3
  side works. So this is OS-independent.
- macOS (Apple Silicon), same dock + same cable + same devices:
  full USB 2.0 tree (three hub levels) enumerates and works. The
  dock and the cable's D+/D- pair are fine.
- A native USB 3.2 dock (Belkin, no USB4 layer) on the same
  physical connector enumerates BOTH its USB 3.x and USB 2.0 sides.
  The host's USB 2.0 companion path is fine with other devices.
- Vendor cases open: Sonnet support case #00021656 =E2=80=94 Sonnet has
  confirmed reproducing an AMD USB4 host enumeration issue with
  newer TB4/TB5 peripherals in their own lab and is contacting
  AMD/Intel/Microsoft; ASUS escalation N2607023142 (BIOS-level fix
  requested).

Why this report: given the cross-OS reproduction this is most
likely a platform/electrical-level interop defect rather than a
kernel regression. Filing so the AMD USB4/platform maintainers are
aware and the vendor cases can be linked, and to ask whether a
kernel-side mitigation is feasible (e.g. xhci reset/retry tuning or
a quirk for this pairing). Happy to run any instrumented builds,
capture thunderbolt/xhci dynamic debug, or test patches =E2=80=94 the
machine and dock are available.

Attachments: kernel-version.txt, dmesg-boot.txt (full boot plus all
plug cycles), lsusb-t.txt, lsusb-v.txt, lspci.txt, tb-devices.txt,
boltctl.txt.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
