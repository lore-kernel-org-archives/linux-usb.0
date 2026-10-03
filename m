Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206448E0D2
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 16:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045234; cv=none; b=FcWRV63ls66ayToe6ExTso1+gH0WBPusSMGOJpxeVAW7iUOX/r/7cjCY0QDn6hAKOuKulgY6R8B03qHTsaxyN7pnwNYD+dIwDC6X3UZ0beY3y+L+8d6Iz7ZDjv3Aq7+FqpookHCPbKbkLo+/wEYL56Vdc0MpR9Y4rVOas4tgvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045234; c=relaxed/simple;
	bh=2kKQc2rfSM+xOjPv6svGgL686DTrbMP0bq+CObNRFBw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QAYjsLUWFzEcqGbtURABtU+BjVtEF/GmIsXyEicw0A6jVwNVGIcfkAuwBmFNiq5Jo/xVEJdc7tqqGsB8quUacO0Ixzy9AJPCHgOEPGt8FoxU7SxoxawgKniqI6HMrozLekc19WAxn2byK33bwy4EKXXNSKYvwajtlqq2Gp0ivGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ubox0kH2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ubox0kH2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4395DC4AF14
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791045234;
	bh=2kKQc2rfSM+xOjPv6svGgL686DTrbMP0bq+CObNRFBw=;
	h=From:To:Subject:Date:From;
	b=Ubox0kH2ylMYMqWq0OG5UZ4K7xcG4WxUzl/XNiqXSg9fSJXMMCi0qR2+nGhaJ86mB
	 Rm9STCSwzpw3KosZL+uiZEnZKD1JtiNGqcDr4WZQ0JYIN9q77gs/BrlLI440d6vruK
	 3K2wA0D2OtnF72IzZyEa6SLgubA99Jggue4PembrUVYxvm9PP63ko/drGX4XNoPp0j
	 7h6PRYkqaY8U6nSEOAvQ7E3IeHPBjUA65qOP1AbYnoRhLO/OcjfqnGrOLVQXzg0tHe
	 E0ALS5breT/x4bxUmzAao+zq4f47D8wHEOnGWGRW52H/jTnTVqibuoNmpx0zgu1P/Q
	 zKM2i2IoawATQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E9A3C41612; Sat,  3 Oct 2026 16:33:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIwOTFdIE5ldzogUmVncmVzc2lvbiA3LjEuMTDihpI3?=
 =?UTF-8?B?LjIueDogcG93ZXJvZmYgaGFuZ3MgYWZ0ZXIgTGVub3ZvIFVTQjQgZG9jayAo?=
 =?UTF-8?B?NDBCRikgY29ubmVjdGVkIGR1cmluZyBzZXNzaW9uOyBzdGF0ZSBwZXJzaXN0?=
 =?UTF-8?B?cyBhZnRlciB1bnBsdWc=?=
Date: Sat, 03 Oct 2026 16:33:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: abadragan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222091-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222091

            Bug ID: 222091
           Summary: Regression 7.1.10=E2=86=927.2.x: poweroff hangs after L=
enovo
                    USB4 dock (40BF) connected during session; state
                    persists after unplug
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: abadragan@gmail.com
        Regression: No

[Filed under Drivers/USB because there is no Thunderbolt component; this is=
 a
drivers/thunderbolt (NHI) regression. Downstream report: see Red Hat Bugzil=
la,
Fedora component "kernel" -- URL to be added in a follow-up comment.]

REGRESSION: System fails to power off once a Lenovo ThinkPad USB4 Dock 5000
(40BF) has been connected during the session. Userspace shutdown completes
cleanly (journal shows poweroff.target reached, filesystems synced, journald
stopped), then the machine hangs at the firmware splash screen and requires=
 a
hard power-off. The state is LATCHED: unplugging the dock afterwards does n=
ot
help; only sessions where the dock was never connected power off normally.

BISECTION (all verified on this machine):
  6.19.10-300.fc44  GOOD  (install-era kernel)
  6.19.12-300.fc44  GOOD
  7.1.10-200.fc44   GOOD  (also verified on a parallel Bluefin install with
                           identical kernel config and cmdline)
  7.2.5-200.fc44    BAD   (first 7.x kernel this machine booted; install
                           jumped 6.19.10 -> 7.2.5)
  7.2.7-200.fc44    BAD
  7.2.8-200.fc44    BAD

ADDITIONAL FINDING: "modprobe -r thunderbolt" while docked deadlocks
permanently (process in D state). The dock router (thunderbolt 0-3) and
retimer (0-0:3.1) disconnect, then the NHI teardown blocks:

  [<0>] nhi_pci_remove+0x53/0x60 [thunderbolt]
  [<0>] pci_device_remove+0x4a/0xb0
  [<0>] device_release_driver_internal+0x19e/0x200
  [<0>] driver_detach+0x48/0x90
  [<0>] bus_remove_driver+0x78/0x110
  [<0>] pci_unregister_driver+0x36/0xe0
  [<0>] nhi_unload+0x10/0x540 [thunderbolt]

However, blacklisting the thunderbolt module entirely does NOT fix the
poweroff hang, and neither does blacklisting ucsi_acpi -- suggesting the
latched state is below these drivers (ACPI power resources / EC interaction=
).
The BIOS exposes \_SB_.PC00.TBT0/TBT1 power resources and hands USB4 _OSC
control to the OS at boot; ACPI tables also show pre-existing
AE_ALREADY_EXISTS errors (\_SB.BGNV, \_SB.PC00.PTMA, ...).

HARDWARE:
  Laptop: PC Specialist FusionVI 14 (Clevo/Kapok 1558:2680), Insyde BIOS
          1.07.03dTPCS (2024-10-24), Intel Core Ultra 200V (Lunar Lake)
  TB4 controller: Intel [8086:a833], driver thunderbolt
  Dock: Lenovo ThinkPad USB4 Dock 5000 (40BF), "Lenovo Dock - USB4 Router"
        (17ef:118d), Intel retimer (8086:0d9c), dock DMC fw 1.2.04 (latest)

REPRODUCER: boot 7.2.x on this hardware, attach dock at any point, then
poweroff (or "modprobe -r thunderbolt" for the unload deadlock).

WORKAROUND: pin kernel to 7.1.10-200.fc44.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
