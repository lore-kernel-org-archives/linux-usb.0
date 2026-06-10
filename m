Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C6B3101B6
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081766; cv=none; b=FsuojZmaL4ETm7qoTPG/FBY7iCpGfGyktmPcuDHCcy7HkIOmlYURGg2VK1o/Z29m4nqSeSwPAuBVrYyeqbHEulPWdeZG6bGnaVSjC3+iG0gL1DfeHjJqe2YuF3tFLXdavszwfI3+d/b1n4JaMOuxYNNV6LphMQEMZD6hcdR2d94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081766; c=relaxed/simple;
	bh=SyNZmYlHx0Bi6bq5xYZEpI+lS1TJKQeiCQ2PVJke7Ng=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Rr4l6pFomQ09EsolJoU3fIZcwFDpdHa5jeyupwXxERUNqV7ztEQxJJWpX9D/pfksxTkG0JofE7Mgj5rH7hU4G6jf4d6iKX9VDsVidjKvOxihuLb7kCPOEIXz7xq1GYbZ64ElVmwQpiS51istnLT7u/5w8aO1b820yvqZ/Y0DsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+HIT1T0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+HIT1T0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0C7AC2BCB9
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781081765;
	bh=SyNZmYlHx0Bi6bq5xYZEpI+lS1TJKQeiCQ2PVJke7Ng=;
	h=From:To:Subject:Date:From;
	b=X+HIT1T00jWP6YqCh0dkjwHG51i7fwZo9T82Y4w9IgL+m/C2eEv0NNleoNMtFDntc
	 taaz6mcWLoZZ9+VOF14Ori9pNkcXrsMYGdHROToZ4ko9Ow3qCHUKo2xYx461jCDahO
	 Lkcy/9sE1EVb52/2VDTrEYHrrMbcuIv80jbXsVZmOVfcu3O4RDBxrXy+LRg1PXsu93
	 OP+Fg5gSrcWDSrLYeCaMIfmhmCMq9qc0t0Z21WkgoEAAXwoZcMo1oRmp+lUBmk1bGz
	 3OORJVCHqrKbzWCB2t1iXa4bux6cE9BJXhw0fz94ExD5JeCQL25z4DBng9vBZENGMc
	 CIWb2umdmPA8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AEE55C41612; Wed, 10 Jun 2026 08:56:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221633] New: thunderbolt: hard system freeze from repeated DP
 tunnel activation failures (LG UltraFine 5K dual-tile + active TB3 cable,
 Meteor Lake-P)
Date: Wed, 10 Jun 2026 08:56:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: allan.petersen@vocast.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221633-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221633

            Bug ID: 221633
           Summary: thunderbolt: hard system freeze from repeated DP
                    tunnel activation failures (LG UltraFine 5K dual-tile
                    + active TB3 cable, Meteor Lake-P)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: allan.petersen@vocast.com
        Regression: No

SUMMARY

Connecting an LG UltraFine 5K (dual-tile Thunderbolt 3 display, internal Ti=
tan
Ridge JHL7540) to a Meteor Lake-P host with the display's stock active TB3
cable causes the TB link to flap in a tight loop (connect -> tunnel activat=
ion
failures -> disconnect, every ~3 s). After seconds to minutes of this churn=
 the
machine hard-freezes (no oops reaches the journal, no pstore record; only a
power cycle recovers it).

Reproduced on two kernels:
- 6.17.0-35-generic (Ubuntu 24.04 HWE) - froze twice
- 6.19.14 mainline (kernel.ubuntu.com build) - froze once; additionally emi=
ts a
repeating WARN at drivers/thunderbolt/path.c:589 in tb_path_activate()

A freeze triggered by a misbehaving/marginal external device + cable is sti=
ll a
host-side robustness bug: hotplug churn should never take down the machine.

HARDWARE

- Host: Lenovo ThinkPad T14 Gen 5 (21MLCTO1WW), BIOS N47ET28W (1.17),
12/05/2025
- TB controller: Intel Meteor Lake-P Thunderbolt 4 NHI #0/#1 [8086:7ec2 /
8086:7ec3]
- Display: LG UltraFine 5K (TB vendor 0x1e, device 0x1114; internal Intel
JHL7540 Titan Ridge bridge [8086:15ef]); dual-tile 2x 2560x2880
- Cable: LG's bundled active TB3 cable (trigger); reproduced with two diffe=
rent
LG cables and three different UltraFine 5K units, on both host TB ports
- Secure Boot disabled; no out-of-tree modules

FAILURE SIGNATURE (each ~3 s cycle)

thunderbolt 0-1: new device found, vendor=3D0x1e device=3D0x1114
thunderbolt 0-1: LG Electronics UltraFine 5K
thunderbolt 0000:00:0d.2: 1: failed to enable CL states
thunderbolt 0000:00:0d.2: 1:1: hop deactivation failed for hop 1, index 8
thunderbolt 0000:00:0d.2: PCIe Down path activation failed: -107
thunderbolt 0000:00:0d.2: 0:8 <-> 1:8 (PCI): activation failed
thunderbolt 0000:00:0d.2: 1:8: PCIe tunnel activation failed, aborting
thunderbolt 0000:00:0d.2: 1:10: DP tunnel activation failed, aborting
thunderbolt 0-1: device disconnected

The 6.19.14 boot that froze contains 84 "DP tunnel activation failed" lines=
 in
~21 minutes. Other recurring messages:

thunderbolt 0000:00:0d.2: 0:5 <-> 1:10 (DP): not enough bandwidth available
thunderbolt 0000:00:0d.2: 0:5: timeout waiting for DPTX request to clear
thunderbolt 0000:00:0d.2: 0:5 <-> 1:10 (DP): failed to change bandwidth
allocation
thunderbolt 0-0:1.1: failed to add NVM devices: -19
i915 0000:00:02.0: [drm] *ERROR* [CONNECTOR:280:DP-1][ENCODER:279:DDI TC1/P=
HY
TC1][DPRX] Can't reduce link training parameters after failure

WARN ON 6.19.14 (repeats on every flap cycle)

WARNING: drivers/thunderbolt/path.c:589 at tb_path_activate+0x118/0x540
[thunderbolt]
Workqueue: thunderbolt0 tb_handle_hotplug [thunderbolt]
RIP: 0010:tb_path_activate+0x121/0x540 [thunderbolt]
 tb_tunnel_activate+0xba/0x2e0 [thunderbolt]
 tb_tunnel_one_dp+0x29d/0x3b0 [thunderbolt]
 tb_tunnel_dp+0xbb/0x300 [thunderbolt]
 tb_dp_resource_available+0xda/0x250 [thunderbolt]
 tb_handle_hotplug+0x429/0x770 [thunderbolt]

The same WARN also fires via tb_domain_approve_switch / authorized_store (b=
oltd
authorization path) - full splat attached.

After many plug cycles the Type-C side also corrupts:

sysfs: cannot create duplicate filename
'/devices/platform/USBC000:00/typec/port1/port1.2/partner'
typec_displayport port1-partner.1: probe with driver typec_displayport fail=
ed
with error -17

FREEZE TIMELINE (6.19.14)

- 09:01:18  LG connected, DP tunnel "not enough bandwidth", flap loop resum=
es
- 09:01:46  last journal line (thunderbolt 0-1: device disconnected)
- Machine completely unresponsive (UI, keyboard); no oops/panic captured; h=
ard
power-off required. Same pattern on 6.17.0-35 (froze 08:17 same day).

WORKAROUNDS TESTED (no effect)

- thunderbolt.clx=3D0 - removes "failed to enable CL states", tunnels still=
 fail
- thunderbolt.bw_alloc_mode=3D0 - no change
- Both host TB ports, multiple LG cables/units - identical behaviour

WHAT WORKS (isolation data)

- Same LG display + certified TB4/USB4 cable (Apple Thunderbolt cable): link
comes up at 40 Gb/s and is fully stable - dual-tile 5K, PCIe tunnel (displa=
y's
JHL7540 + xHCI visible), no errors. So the trigger is the active TB3 cable +
Meteor Lake USB4 host combination.
- Apple Studio Display works flawlessly on the same host - including through
the LG active TB3 cable. The flap only occurs with LG display + LG cable.
- The LG display + LG cable combination works normally on macOS hosts.

EXPECTED BEHAVIOUR

Repeated tunnel activation failures from a marginal link should result in t=
he
device being dropped/ignored (rate-limited retries), not an unbounded
connect/teardown loop that eventually hard-freezes the host.

Full kernel logs from both freeze boots, the complete WARN splat and lspci
inventory are attached. Happy to test patches or provide further debug outp=
ut
(thunderbolt.dyndbg). Bisection between 6.17 and 6.19 is not possible since
both fail.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
