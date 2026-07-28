Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53FC47A87C
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281086; cv=none; b=lwAF7aJP3TmGfReBPmvkU/ImXFNs2GQLsn/Wa2Yr9RsZXTL1ChGnYIUEetI5eT0GS3weHeneY8lsAXoSpN42R+UsWWCYqgLPkAhTqDASugM8fXmavtyYRqCBZJgTZT8YPkKQJwhw7LZdQj6cGC4kibJzO++Ur5zGkbAmkbrXihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281086; c=relaxed/simple;
	bh=8228BBjbf2EyJN/mSSeB1D2t8diA/iE4Gqp6z8doAPw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Kw3ZY1KnzoMA4gzFEpyWUPDDsRxnstFOLuaGW5KRutt6/sZuOWJUNgnVI3wULI59kKZD2P9VJsrY0xQQbHB9ImIPrpzOtL3Mp3I4D10/AQabdqpzbeFsLQZPtkKQobgvrU0FE6n5R+hejjZ4MJY+iE6KkQEv0gH9+D8BjUAvlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTWy1K0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTWy1K0l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58C70C2BCC6
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 23:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785281086;
	bh=8228BBjbf2EyJN/mSSeB1D2t8diA/iE4Gqp6z8doAPw=;
	h=From:To:Subject:Date:From;
	b=cTWy1K0lh5adm+Fti8Ff12lzZ6BjMut2dos+/1AQk/N0gIclFQEw56Id7FapAoymg
	 4dewgMbtgmvQavc+k/A/XS+2HxZiPFpYW0jsy3wKrKikAM7j/9P6L1U6QdBjgjvGL6
	 sNUlJZt4FJCHo0OnZm9xkqGCvF0z4FKLEtjxCrislolGkHDSFafrl9hTB8YdwyX3YO
	 iHi5QokDIgQkk0gwVjEVV26Rqjo+GcVmWSUGBR/vQNxzW4R31IV4gmOLIkI10EaB1U
	 z97bbi0SVjj5oMJRBB4T9/aaOs+8KIKayu40Ywir6b8xvVLrQJZ6VJzzdllfl53eW4
	 7TrZKPwbuLC3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3686BC433E1; Tue, 28 Jul 2026 23:24:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE4MDZdIE5ldzogUmlnaHQtc2lkZSBVU0ItQSBwb3J0?=
 =?UTF-8?B?IGZhaWxzIFN1cGVyU3BlZWQgbGluayB0cmFpbmluZyBvbiBMZW5vdm8gVGhp?=
 =?UTF-8?B?bmtQYWQgWDEzIEdlbiA1IChNZXRlb3IgTGFrZSwgeGhjaV9oY2QgODA4Njo3?=
 =?UTF-8?B?ZTdkKSDigJQgd29ya3Mgb24gRmVkb3JhIDYuMTkuMzAwLCBmYWlscyBvbiA2?=
 =?UTF-8?B?LjE4LjM5IGFuZCA3LjEuNA==?=
Date: Tue, 28 Jul 2026 23:24:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: perttu@thinkerit.pro
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221806-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221806

            Bug ID: 221806
           Summary: Right-side USB-A port fails SuperSpeed link training
                    on Lenovo ThinkPad X13 Gen 5 (Meteor Lake, xhci_hcd
                    8086:7e7d) =E2=80=94 works on Fedora 6.19.300, fails on
                    6.18.39 and 7.1.4
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: perttu@thinkerit.pro
        Regression: No

Hardware:
Lenovo ThinkPad X13 Gen 5 (21LVS3U900), Intel Core Ultra 7 165U (Meteor Lak=
e)
USB controller: Intel Corporation Meteor Lake-P USB 3.2 Gen 2x1 xHCI Host
Controller [8086:7e7d] (rev 20), driver xhci_hcd

Problem:
The right-side USB-A port (physical_location panel=3Dright; USB2 companion
port bus3/port5, SuperSpeed port bus4/port1, both on the same 00:14.0
xHCI controller alongside the internal camera/fingerprint reader/Bluetooth,
which work fine) fails to enumerate any device. Left-side USB-A and both
USB-C ports work normally.

Confirmed NOT a hardware fault: the exact same USB drive works reliably,
repeatedly, on a Fedora 44 LiveCD (kernel 6.19.300) in the same port.

Kernel versions tested on NixOS (vanilla/mainline builds via nixpkgs), both
fail identically:
- 6.18.39 (nixpkgs linuxPackages, i.e. an older stable branch)
- 7.1.4   (nixpkgs linuxPackages_latest)

Symptom (with xhci_hcd/xhci_pci dynamic debug enabled):

  xhci_hcd 0000:00:14.0: Port change event, 3-5, id 5, portsc: 0x20ae1
  xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
  xhci_hcd 0000:00:14.0: Get port status 3-5 read: 0x20ae1, return 0x10301
  xhci_hcd 0000:00:14.0: clear port5 connect change, portsc: 0xae1
  xhci_hcd 0000:00:14.0: Get port status 3-5 read: 0xae1, return 0x301
  xhci_hcd 0000:00:14.0: Port change event, 3-5, id 5, portsc: 0x202a0
  xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
  xhci_hcd 0000:00:14.0: Get port status 3-5 read: 0x202a0, return 0x10100
  xhci_hcd 0000:00:14.0: clear port5 connect change, portsc: 0x2a0
  xhci_hcd 0000:00:14.0: Get port status 3-5 read: 0x2a0, return 0x100
  [... repeated Get port status 0x2a0 ...]
  xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling

Interpretation: on connect, CCS (connect status) briefly goes to 1 with
link state "Polling" (SuperSpeed link training in progress), then within
~2.3ms drops back to CCS=3D0 with link state "RxDetect". The kernel retries
polling for ~130ms then gives up. This sequence is 100% deterministic and
reproducible =E2=80=94 identical portsc values and timing on every attempt,=
 across
both kernel versions above.

Things ruled out during troubleshooting:
- Not a loose/mechanical connection: laptop stationary, port physically
  fine, confirmed reliable on Fedora LiveCD with many repeated
  plug/unplug cycles.
- Not device-level USB autosuspend: usbcore.autosuspend=3D-1 kernel param
  set and confirmed active (/sys/module/usbcore/parameters/autosuspend =3D =
-1).
- Not USB roothub runtime PM: forced power/control=3Don on both usb3 and
  usb4 roothubs, no change.
- Not PCIe ASPM: forced pcie_aspm policy to "performance", no change,
  identical portsc trace.
- Not PCI device runtime PM: 0000:00:14.0 power/runtime_status was
  "active" throughout.
- thinkpad_acpi loads and initializes normally; no ACPI errors in dmesg
  around boot or around the 00:14.0 device.
- boltctl / bolt (Thunderbolt security) not relevant =E2=80=94 this is a pl=
ain
  USB2/USB3 port on the classic xHCI controller (00:14.0), not the
  USB4/Thunderbolt controller (00:0d.x).

Requesting help identifying what Fedora's kernel build (6.19.300, likely
with Red Hat/Fedora-specific patches or a different xhci_pci
config/quirk) does differently that allows this port to work, versus a
vanilla/mainline kernel build of both an older (6.18.39) and much newer
(7.1.4) version, which fail identically.

Happy to test patches or provide additional logs (full dmesg, lspci -vvv,
port_status via debugfs, etc.) on request.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
