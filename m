Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A701FBEA8
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437032; cv=none; b=ER6QFAwtPopyCgG5hSsePcTBiy26X4wDtYOyOnCw8lpoKmj3dXba/EvI3vLIDTHWEUTWHm6ulaHZ1YnbvKiLExwNwk6bNcDj+v+9Kr32Y+YUFqDfbBgVHRnHAgtD5TfuV9djlOuwrjcw1l9UTt3tCobbYOsT4VeD9aXh/qVpfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437032; c=relaxed/simple;
	bh=sUApYNmr96sY5URHw0P6DtF13NOawyFroOGvi/s5xYo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dpQG9yP2/oHpzDq7ICpH34WFRhwAzu65J4nwTLjsKZVTs98x9yEX3IjWlrkWdi75t1dVGKAnevoWAZLI4rnTBQs61e3Bjv7bQm6azQW/8yFsNxjv5ov0BSKu+N8Jn35kBJgrJmbNUoOFbM8hFL4tA1WZZh0Z2IXhtGj5Dx5GVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZHwXXE9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZHwXXE9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EED67C2BCB8
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 15:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790437032;
	bh=sUApYNmr96sY5URHw0P6DtF13NOawyFroOGvi/s5xYo=;
	h=From:To:Subject:Date:From;
	b=KZHwXXE9CtdHg3Y8mJZ6TiJ6shRqyMtOY4CD3OzHiJLBlud7YTG0dZpxXvX0+TLVC
	 kLxkyHklUzouzA3wrKeaQM2+RrWZPozu8XKTagsq0S0mSrRn6K3HeXQtF6F9SA6hD7
	 EUpUwSp8CxsapNPWaD+7WtdS/6z4EfVyROmXZP/XxfPT54YNfjN7SRh+wh7pyQeFRR
	 XT9rtycVrUzUnK9j3PSmYPTmsasAuQj/5pxA7Ddj0+uHDGtcEAEMck9e/Ys79Akqsa
	 6TGXxgiufbRGOIhxZDOjx/gdhwnT0tE05mj8YQD9mQuCRcfaetJHWEZYSvPkcL/s4l
	 NWmucOJMwBDvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CAFBFC3279F; Sat, 26 Sep 2026 15:37:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIwNjRdIE5ldzogRXh0ZXJuYWwgbW9uaXRvciBvdmVy?=
 =?UTF-8?B?IFVTQi1D4oaSRFAgYWRhcHRlciBuZXZlciByZWNvdmVycyAoc3R1Y2sgYXQg?=
 =?UTF-8?B?MHgwIEVESUQpIGFmdGVyIHN1c3BlbmQvcmVwbHVnIOKAlCBvbmx5IGEgZnVs?=
 =?UTF-8?B?bCByZWJvb3QgZml4ZXMgaXQg4oCUIEFscGluZSBSaWRnZSAoSkhMNjU0MCkg?=
 =?UTF-8?B?VGh1bmRlcmJvbHQgMyBjb250cm9sbGVy?=
Date: Sat, 26 Sep 2026 15:37:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zarej@svrljig.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222064-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222064

            Bug ID: 222064
           Summary: External monitor over USB-C=E2=86=92DP adapter never re=
covers
                    (stuck at 0x0 EDID) after suspend/replug =E2=80=94 only=
 a full
                    reboot fixes it =E2=80=94 Alpine Ridge (JHL6540) Thunde=
rbolt 3
                    controller
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: zarej@svrljig.net
        Regression: No

## Summary

On a ThinkPad X1 Carbon Gen 8 (Intel Comet Lake-U, Alpine Ridge JHL6540 TB3
controller), an external monitor connected via a USB-C=E2=86=92DisplayPort =
adapter
routinely fails to (re-)establish its DisplayPort alt-mode link after a
suspend/resume cycle or a physical replug. The GPU (i915) reports EDID
checksum/header corruption and an "Unexpected DP dual mode adaptor ID", and
Hyprland/DRM shows the connector as `connected` but with a `0x0` mode
(no valid video mode) indefinitely. Only a full system power cycle (reboot)
recovers it =E2=80=94 no in-session software action was found that clears t=
he
condition.

## System

- Model: Lenovo ThinkPad X1 Carbon Gen 8 (Type 20U9006HMX)
- BIOS: N2WET48W (2024-11-08)
- CPU/GPU: Intel Comet Lake-U, `i915 0000:00:02.0` (CometLake-U GT2 [UHD
Graphics])
- Thunderbolt controller: `Intel Corporation JHL6540 Thunderbolt 3 [Alpine
Ridge 4C 2016]` (rev 02)
  - `0000:05:00.0` PCI bridge (root)
  - `0000:06:00.0` / `06:01.0` / `06:02.0` / `06:04.0` PCI bridges
  - `0000:07:00.0` Thunderbolt 3 NHI
  - `0000:2d:00.0` xHCI USB controller (this BDF shifts after a reset, e.g.=
 to
`2e:00.0`)
- Kernel: `7.2.5-3-omarchy` (Arch-based, x86_64)
- External monitor: Xiaomi "Mi monitor", connected via a USB-C=E2=86=92Disp=
layPort
adapter (dongle), DP dual-mode (DP++)

## Symptom

After the laptop suspends and resumes (or, less reliably, after unplugging
and replugging the adapter), the external monitor connector (`DP-2` in
Hyprland/DRM) stays reported as `connected` but with mode `0x0@60` =E2=80=
=94 i.e. no
usable video mode. The screen stays black. This can also happen without any
suspend at all, just from a cold plug sometime after boot.

## Kernel log evidence

```
xhci_hcd 0000:2d:00.0: xHC error in resume, USBSTS 0x401, Reinit
typec port1-partner: PM: parent port1 should not be sleeping
EDID block 0 (tag 0x00) checksum is invalid, remainder is 141
i915 0000:00:02.0: [drm] *ERROR* Unexpected DP dual mode adaptor ID 50
EDID has corrupt header
i915 0000:00:02.0: [drm] *ERROR* Unexpected DP dual mode adaptor ID 50
EDID block 0 (tag 0x00) checksum is invalid, remainder is 18
i915 0000:00:02.0: [drm] *ERROR* Unexpected DP dual mode adaptor ID 54
EDID has corrupt header
i915 0000:00:02.0: [drm] *ERROR* Unexpected DP dual mode adaptor ID 54
```

This repeats with different adaptor-ID/checksum-remainder values across
independent replug/resume attempts throughout the day, always the same
shape: xHCI hits a "broken_suspend"-style resume error on the Alpine Ridge
controller, and the DP dual-mode adaptor's EDID/AUX read comes back invalid
immediately after.

## What was tried (in order), and results

1. `hyprctl reload` =E2=80=94 no effect (mode stays `0x0`).
2. Forcing a DRM connector reprobe via
   `echo detect > /sys/class/drm/card1-DP-2/status` (as root) =E2=80=94 sta=
tus stays
   `connected`, mode stays `0x0`.
3. Forcing the connector off then re-detect
   (`echo off > .../status; sleep 1; echo detect > .../status`) =E2=80=94 s=
ame result.
4. Physical unplug/replug of the adapter at both the monitor end and the
   laptop USB-C end =E2=80=94 no change, same EDID/adaptor-ID errors reappe=
ar in
   `dmesg`.
5. Full suspend (S3) and resume =E2=80=94 no change; xHCI logs the same
   `xHC error in resume, USBSTS 0x401, Reinit` on every resume, and the DP
   link does not come back afterward.
6. PCI-level reset of just the TB3 xHCI USB function
   (`echo 1 > /sys/bus/pci/devices/0000:2d:00.0/remove` then
   `echo 1 > /sys/bus/pci/rescan`) =E2=80=94 the USB function cleanly re-en=
umerates
   (new BDF, e.g. `2e:00.0`), but the DP-2 connector is unaffected, still
   `0x0`. This confirms the DP tunnel is not owned by the xHCI PCI function.
7. Full PCI-level reset of the entire TB3 hierarchy from the root bridge
   (`echo 1 > /sys/bus/pci/devices/0000:05:00.0/remove` then
   `echo 1 > /sys/bus/pci/rescan`) =E2=80=94 the entire Alpine Ridge hierar=
chy
   (bridges, NHI, xHCI, typec ports) re-enumerates from scratch, functional=
ly
   as close to a live "power cycle" of the controller as the kernel's PCI
   core allows. DP-2 is still stuck at `0x0` afterward.
8. Only a full system reboot (real ACPI S5 power-off/on) reliably clears
   the condition and the external monitor comes up normally.

## Analysis

Step 6 and especially step 7 are the interesting data points: even a full
software-level teardown/re-probe of the entire Thunderbolt PCI hierarchy did
not recover the DisplayPort tunnel. This suggests the DP alt-mode/tunnel
negotiation state for this connector is not represented in anything the
Linux PCI core can reset =E2=80=94 it likely lives in EC/PMC firmware or in=
 a
redriver/mux chip on the board that is only reset by an actual platform
power cycle, not a live device removal+rescan. Given `USBSTS 0x401` is a
recognized "broken_suspend"-class quirk already handled defensively by
`xhci_hcd` (see 30f3808d10f8, "xhci: Don't show warning for reinit on known
broken suspend"), this looks like a case where the existing reinit path
successfully recovers plain USB but does not (and structurally cannot)
recover the co-tunneled DisplayPort link.

## Expected behavior

Either the DP alt-mode link should survive/recover across suspend-resume
and hot-replug on this controller, or there should be some way (from
software, without a full power cycle) to force the platform to redo the
Type-C/DP mux negotiation for a specific port.

## Reproduction rate

Observed multiple times over one day of normal use (several suspend/resume
cycles plus manual replugs), each time requiring a full reboot to recover.

## Notes for triage

- Willing to gather additional logs (`acpidump`, `sudo dmesg` full buffer,
  `boltctl` output, EC firmware version) on request.
- Not currently able to test with a direct DP/HDMI cable (no non-adapter
  port available on this hardware) to isolate adapter vs. platform, but the
  full TB3-hierarchy reset in step 7 argues against a simple "flaky dongle"
  explanation, since a fresh, cleanly re-enumerated controller still fails
  to bring the link up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
