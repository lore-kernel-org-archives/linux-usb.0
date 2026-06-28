Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0C2253B0
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782631302; cv=none; b=YDdeg0crlw40BA1iCXJLiEYoayKUHl2SVE0Y+2xCZefdO851Bir40SFYOSaSrKpxevVKdbRG+odCLFmTfKYwdrGY3zgTWBoUK9HxtPz1hTRQ84tV+nbpEG8PnPhThEDRtW0pWt0mHIEYvZltfooMvWHQ0CP19nQEaHQWp3iBqlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782631302; c=relaxed/simple;
	bh=IyG4/U3SQP8JZrBShXzivGYLucFVR+4qPqt2tshEwLc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Sdj1rczWwYh78kp+wyzJAqK40yYKJOfkZIjU3pSY1Z/Fi5KdFucYL7iKbwnvA7HCrgXvzZLeCXyQ3zx6WmcDY5suiHP6Pmu3QYYE+oQPepp4kfgeXHTUouWKKLrC1FTlmZPELN5r7LQTfOa2vpUSYkvf9k0+GTtNZcVcVMnWgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUt6Fheq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUt6Fheq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85C8AC2BCB9
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782631301;
	bh=IyG4/U3SQP8JZrBShXzivGYLucFVR+4qPqt2tshEwLc=;
	h=From:To:Subject:Date:From;
	b=hUt6FheqCznTYEDRykrNwo8Nfvrq4BiIzCvRYNmO8afHteldBLYoSsBD36oB9L9rS
	 NSLHKvFEUCbTZXeBg6Q/y8QDO3pY6p7ZxC4B0Gm7J72xE6Rf1gtRozhhz/00u19qQQ
	 /ZDo1NsNUfgUqZGxlnb0Wchh0AqTKVLyaFvK51+EFtAdgzZrqSVbjsJFMjkiysdxod
	 ks48s6tg5ElOu2fgXYcbkfFE8cbNoE4rS/WlkvNDM9507oooOXVAP9IJpDCpxoZ8xj
	 7uCMZPI7ZAezyN26wB5oasQpyNXqCxWo3NQf/M5B0JlpdRAcbLnSeBMXaybVYCGnjS
	 BDsp+W83hviXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 658C0C41614; Sun, 28 Jun 2026 07:21:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE2OTldIE5ldzogUENJZSBsaW5rIGRyb3BzIGR1cmlu?=
 =?UTF-8?B?ZyBHUFUgQkFSMiBpbml0IOKAlCBNaW5pc2ZvcnVtIERFRzIgZUdQVSBkb2Nr?=
 =?UTF-8?B?IG92ZXIgVGh1bmRlcmJvbHQgNA==?=
Date: Sun, 28 Jun 2026 07:21:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: artiom@flexlabs.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221699-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221699

            Bug ID: 221699
           Summary: PCIe link drops during GPU BAR2 init =E2=80=94 Minisfor=
um DEG2
                    eGPU dock over Thunderbolt 4
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: artiom@flexlabs.org
        Regression: No

Created attachment 310385
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310385&action=3Dedit
dmesg logs: Connecting the dock with the GPU attached, USB and NVMe
disconnected, using Nvidia driver

An RTX 3080 Ti connected via a Minisforum DEG2 Thunderbolt 5 eGPU dock to a
Thunderbolt-4 laptop running Linux enumerates correctly over the PCIe tunne=
l,
but the PCIe link then dies roughly 8=E2=80=9310 seconds later, while the G=
PU driver is
in its early BAR2 (instance-memory / page-table aperture) initialization ph=
ase.
This reproduces under both the proprietary NVIDIA driver and the in-tree
nouveau driver, which strongly suggests the fault is below the driver layer=
 =E2=80=94
in the Thunderbolt/PCIe tunnel itself (the kernel thunderbolt/pciehp path, =
the
dock firmware, or the Intel Barlow Ridge-class controller).

The same dock, cable, and GPU work without issue under Windows, including u=
nder
a sustained 3D stress test.

## System configuration:

* Laptop: Lenovo ThinkPad, model 21VVCTO1WW, BIOS N4QET33W (1.12)
* CPU/platform: Intel Panther Lake, integrated Arc B390 iGPU (xe driver)
* Thunderbolt host: Intel Panther Lake Thunderbolt 4 NHI (USB4)
* OS / kernel: Fedora 44, 7.0.13-200.fc44.x86_64
* eGPU dock: Minisforum DEG2 in Thunderbolt mode. Enumerates over Thunderbo=
lt
as "Micro Computer (HK) Tech. Ltd. TBGAA"
* GPU: NVIDIA RTX 3080 Ti
* Cable: DEG2-supplied TB5 cable (confirmed functional under Windows 3D loa=
d)
* Dock PSU: Corsair SF850
* Drivers tested: NVIDIA open kernel module 595.80 (GSP-based); nouveau
(in-tree, GSP/r535 path, firmware RM version 570.144)


## Reproducible symptom

1. Dock connected (reproduces on both cold-plug and hot-plug).
2. Thunderbolt/USB4 link authorizes; PCIe hotplug bridge reports pciehp:
Slot(10-2): Card present =E2=86=92 Link Up.
3. Full PCIe enumeration succeeds: the Intel switch, the GPU (82:00.0) and =
its
audio function (82:00.1) appear, and BARs are assigned (BAR1 prefetchable 2=
56
MB, BAR3 prefetchable 32 MB, BAR0 16 MB, etc.).
4. The GPU driver begins bring-up and reaches BAR2 initialization.
5. Within 5 seconds after connecting the cable, the OS becomes visually
unresponsive
6. Approximately 8=E2=80=9310 seconds after Link Up, the GPU stops respondi=
ng on the
PCIe link:

  * NVIDIA driver (~10 s): NVRM: Xid (PCI:0000:82:00): 79, GPU has fallen o=
ff
the bus, immediately followed by BAR2 setup failing as a consequence =E2=80=
=94
kbusInitVirtualBar2_HAL ... kern_bus.c:469, kbusInitBar2_HAL ...
kern_bus_gm107.c:332 =E2=80=94 then pciehp: Slot(10-2): Link Down and RM re=
source-leak
assertions during teardown.
  * nouveau driver (~8 s): the driver is actively performing BAR2 bring-up
(gf100_bar_oneinit_bar =E2=86=92 nvkm_vmm_boot =E2=86=92 nvkm_bar_bar2_init=
/r535_bar_bar2_init)
when MMIO accesses begin returning all-ones: nouveau: timer: stalled at
ffffffffffffffff in g84_bar_flush/tu102_vmm_flush, looping for several seco=
nds,
then pciehp: pcie_do_write_cmd: no response from device.

7. Unplugging the dock immediately restores stability; replugging reproduces
the fault. Leaving it plugged keeps the system unresponsive, and it shortly
resets within 5 more seconds or so.

The key shared detail: under both drivers, the device falls off the bus dur=
ing
early BAR2 initialization =E2=80=94 NVIDIA's "fallen off the bus" detection=
 and its
BAR2-init failure are interleaved in the same instant, and nouveau's hang is
literally inside the BAR2 flush. The two drivers share no relevant code her=
e,
so this points away from a driver bug.

## Directly observed evidence

* Cross-driver reproduction at the same stage. Two independent drivers fail=
 at
BAR2 init (function names above), with the link dropping ~8=E2=80=9310 s af=
ter
enumeration.
* GPU-presence is the determining variable. With the GPU removed from the r=
iser
and only the dock's onboard NVMe SSD connected, the dock ran stably for ~37=
 s
(49 s =E2=86=92 86 s, ended by manual disconnect) with clean USB/UAS/SCSI e=
numeration
and no link drop or errors. The fault appears only when the GPU is present =
and
BAR2 init begins.
* Windows is unaffected. The same dock + cable + GPU sustained a 3D stress =
test
under Windows on a different host with no link loss, indicating the GPU, ca=
ble,
dock power delivery, and dock hardware are functional.

## Kernel parameters tried

* Default parameters: GPU enumerates fully, link dies at BAR2 init as descr=
ibed
above. (This is the failure being reported.)
* pcie_aspm=3Doff: system boots, but the eGPU's PCIe link does not initiali=
ze =E2=80=94
the GPU does not reach the enumeration/BAR2 stage at all. This is a differe=
nt
behavior from the default-parameter crash, not a reproduction of it.

## Other potential factors

* GPU, cable, dock power delivery: Functional, tested by sustained 3D stress
test on Windows
* BIOS configuration: All thunderbolt configuration turned on, including PC=
Ie
tunneling
* DEG2 configuration: Verified that the mode switch is set to Thunderbolt
(tested with the Oculink setting, just to be safe, but also TB mode confirm=
ed
working on Windows)

## Suspected root-cause area (hypothesis)

* A kernel thunderbolt/pciehp interaction specific to a discrete GPU's large
memory-mapped BAR2 traffic tunneled through this Barlow Ridge-class control=
ler
over a TB4 host.
* DEG2 / controller firmware failing to sustain the PCIe tunnel once large
BAR-mapped GPU MMIO begins (vs. the lighter NVMe/USB traffic that runs fine=
).
* A Linux-specific gap in tunnel setup/maintenance that Windows handles
differently (Windows is unaffected under heavier load).

## Attached log files:

1. GPU only: Connecting the dock with the GPU attached, USB and NVMe
disconnected, using Nvidia driver
2. NVMe only: Connecting the dock with GPU removed, only NVMe drive attached
3. Nouveau driver: Connected the dock with the nvidia driver disabled in gr=
ub,
using Nouveau driver instead

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
