Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF23F8886
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533702; cv=none; b=Q8efa8Gj4zTFed0OJDIOtGWgnZmPMQFj8K/XobgMafsctVdmP2hiwBrU2baOAAImPVvS0JLaobo0hZ4lAiu2d75c4/7VGpDgISM7ep4yMKwUwu6eAsahbCSPpOwE1+I7xK8BrT8+nJsVC45+ZmRYqQOkK8yF4Kl+a20MwEPEtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533702; c=relaxed/simple;
	bh=DISJg51jbGCpPy6+5gvQeVQZrL8L1sRXP4RVPnV6GJ0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cT8VLKXBgM7tNypqtZXYjCYcLve4a7AHElYWdNgHQ7J/0eZ3NjJLQaY60t22cz75FSO/a1anz9Y4D9THTV/zBu50yEY0v9jncMTE83n/IVCHWqOhuTQbcEHnP90hNV8FnmyVFzD1lE6HRD4CakHd8rlN25xVTdhM5fqTqTXtHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sN2IQ5hv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sN2IQ5hv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21BE3C2BCB4
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781533702;
	bh=DISJg51jbGCpPy6+5gvQeVQZrL8L1sRXP4RVPnV6GJ0=;
	h=From:To:Subject:Date:From;
	b=sN2IQ5hvRoRpJJqy+LjqUxbFGSdJmm0zZIgiO5+RU55GOf2r5jpeY08C4bfyVAqmh
	 k0l1Kshr4mOcvQUyNKYrXCovxDiuYRUX3X7avT80W0OyGpUQaW4PrdD3qZu6ZEw5ei
	 ukyIjHPmTYvI5HNYVcFfjlL80Um7V7PmTIzo8u1CTkwNFq1osAbSscEITRnl+Ajhte
	 DWX4WFUg8zgjRUZpIm4yDiDjkALGQmvt35vq4Fh5+Wc6QUT41LuF17+ICFKvSqsSvn
	 /KwsWWWLfvSHf3DySdOyDYXkNcGMfW+jByemrkeSMkoHgdKe8sHreiYrDs7aYqZYZN
	 XWW3yj5HBDH6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 081B4C433E1; Mon, 15 Jun 2026 14:28:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221655] New: Barlow Ridge TB5 tunneled xHCI (8086:5782)
 runtime-suspends to D3hot and fails to wake on USB-C device connect (Lenovo
 Legion 9 18IAX10)
Date: Mon, 15 Jun 2026 14:28:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vuo9gt37@addy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-221655-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221655

            Bug ID: 221655
           Summary: Barlow Ridge TB5 tunneled xHCI (8086:5782)
                    runtime-suspends to D3hot and fails to wake on USB-C
                    device connect (Lenovo Legion 9 18IAX10)
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.0.12-201.fc44.x86_64
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: vuo9gt37@addy.io
        Regression: No

Created attachment 310324
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310324&action=3Dedit
a ZIP with all the relevant logs

=3D=3D Summary =3D=3D
On a Lenovo Legion 9 18IAX10 (Core Ultra 9 275HX; Arrow Lake-HX + Intel
JHL9580 "Barlow Ridge" Thunderbolt 5 host), USB devices plugged into the two
LEFT-side USB-C ports never enumerate. These ports are served by the Barlow
Ridge tunneled xHCI at PCI 0000:2d:00.0 (8086:5782).

Root cause: that xHCI is runtime-suspended to D3hot (power/control=3Dauto,
runtime_status=3Dsuspended). A USB-C device-connect event does NOT generate=
 a
wake to bring the controller back to D0, so the device never enumerates even
though the Type-C layer registers the partner (data_role=3Dhost, power_role=
=3D
source, partner present).

Forcing the controller to D0 makes the port work perfectly and immediately:

  echo on > /sys/bus/pci/devices/0000:2d:00.0/power/control

After this, the device enumerates (e.g. SanDisk Extreme Pro Portable SSD as
UAS at 20000M on bus 2). Reading PCI config space (lspci -vvv on 2d:00.0) a=
lso
wakes it as a side effect and triggers enumeration. So hardware and driver
paths are fine -- this is purely a runtime-PM wake-on-connect failure.

=3D=3D Hardware =3D=3D
- Laptop: Lenovo Legion 9 18IAX10 (DMI product 83EY), BIOS RZCN48WW (latest)
- CPU: Intel Core Ultra 9 275HX
- TB5 host NHI: Intel JHL9580 TB5 NHI [Barlow Ridge] 8086:5781 (thunderbolt)
- Affected xHCI: Intel JHL9580 TB5 USB Controller 8086:5782 (xhci_hcd) -> b=
uses
1 & 2 (LEFT USB-C)
- Working xHCI (PCH): Intel 800 Series PCH USB 3.1 xHCI 8086:7f6e -> buses =
3 &
4 (RIGHT USB-C, internal)
- PD/UCSI: ucsi_acpi USBC000:00

=3D=3D Kernel / boot =3D=3D
7.0.12-201.fc44.x86_64 (Fedora 44 base). Relevant kargs: pcie_aspm=3Doff,
intel_iommu=3Don, iommu=3Dpt. Note pcie_aspm=3Doff is already set, so this =
is
runtime-PM (D3), not an ASPM issue.

=3D=3D Steps to reproduce =3D=3D
1. Boot. Leave the 8086:5782 xHCI at default power/control=3Dauto.
2. After idle, it enters D3hot / runtime_status=3Dsuspended.
3. Plug a USB device into a LEFT USB-C port.
4. Device does NOT enumerate; buses 1 & 2 stay empty. Type-C partner IS
   registered (/sys/class/typec/portN-partner present, data_role=3Dhost).
5. Run: echo on > /sys/bus/pci/devices/0000:2d:00.0/power/control
   -> controller returns to D0, device enumerates immediately.

=3D=3D Evidence (device plugged into LEFT port, not detected) =3D=3D
  /sys/bus/pci/devices/0000:2d:00.0/power_state      -> D3hot
  /sys/bus/pci/devices/0000:2d:00.0/power/control    -> auto
  /sys/bus/pci/devices/0000:2d:00.0/power/runtime_status -> suspended
  /sys/class/typec/port1/data_role   -> [host]
  /sys/class/typec/port1/power_role  -> [source]
  /sys/class/typec/port1-partner/    -> present
  lsusb -t: buses 1 (480M) and 2 (20000M) of 0000:2d:00.0 EMPTY

=3D=3D After "echo on" (same device, same port) =3D=3D
  power_state -> D0
  lsusb -t: Bus 002 Port 002: Dev 003, Class=3DMass Storage, Driver=3Duas,
20000M/x2

=3D=3D Notes =3D=3D
- Recurring "ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed" is prese=
nt
  but appears unrelated to enumeration (occurs independently; ports work on=
ce
  the controller is in D0).
- Blacklisting ucsi_acpi is NOT a viable workaround on this platform: it
removes
  /sys/class/typec entirely (the EC does not take over).
- BIOS RZCN48WW (latest) does not fix it.

=3D=3D Workaround =3D=3D
udev rule pinning power/control=3Don for 8086:5782 keeps the controller in =
D0 and
makes the LEFT USB-C ports reliably enumerate devices (at an idle-power cos=
t).

=3D=3D Request =3D=3D
The tunneled Barlow Ridge xHCI should wake from D3 on a USB-C connect event.
Is a PME/wake enablement or a runtime-PM quirk for 8086:5782 appropriate?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
