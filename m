Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C23357739
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480449; cv=none; b=RDwXq8ADpORx8N2iQJRV3znttAj+QlqQMHZtUbbp9hhFqjyK6zM4Myt0eB3sKjrwQHI+783ZLM44gCBfidczjzebpyfy+LDdwqGHK+zT506pUHug8mo7khhl6LbIDdtKow/SJtF56GDmfRAE+QSy56QNrgNdNncUypYQ/MtwtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480449; c=relaxed/simple;
	bh=rV5nNBtN5bk+iNlra4C8UC5FExmaFteZ7Ti0B1EZtdE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EadqfJY80gwDw9KHzU9AZvi4ViQexRJq6OgvXMYgJHUroUddLqmDpX+TSk/stuNnBCY2ltno2SOdJ0G/5PhlTgktDmLNuYRq4KXA8giLTQWBCKDirxgInQyZSP5DMSu+9Kdv5QlXy1lUDqjCI4a5aiMoickD/m84FYt5cZ1b9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkN4B9WZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkN4B9WZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77595C2BD00
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791480448;
	bh=rV5nNBtN5bk+iNlra4C8UC5FExmaFteZ7Ti0B1EZtdE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mkN4B9WZpaBQVZoafeKjlFJtS98Du4HB6kFM+2QQYuoLgcMnMtX3EDiCcB2UhrE7u
	 0DHZwbjV3Rh3EtnJ83t4HwB/VrEYJOtUeURU7WBP9P49L/liRrKnFINbEd3w5kowuo
	 0fCkQS4qaPtLTlk0K3vN58mfmB9EAZzhLez0oieU4QcEcCiquoQ+Y1izYBT0qs/fWG
	 yNxlUWdJZvEc61o/yOePN6EnCc0kk4LOx7dfrQYQrnuNfHmjJFPydXQrtVYaAuqxFd
	 vWvCpGoI4oR0KIn2NL02Qhpiqahj+Z5GhtHH1aFt3POcQmAoAIijCar0dsXSSuZuzc
	 PUj00vInxM+iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 666A5C53BC5; Thu,  8 Oct 2026 17:27:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Thu, 08 Oct 2026 17:27:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: langosz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221103-208809-VBci6fptDG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

langosz@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |langosz@gmail.com

--- Comment #42 from langosz@gmail.com ---
New affected system: ASUS ProArt B850-CREATOR WIFI NEO + Ryzen 7 9700X =E2=
=80=94 total
freeze from adb legacy USB backend polling, no Android device connected

I can confirm this bug on my system. Symptoms are identical to the ones
described here: complete freeze (keyboard dead including SysRq, mouse dead,=
 no
SSH response, display frozen), only a hard reset recovers, and zero kernel =
logs
=E2=80=94 no panic, no soft lockup message, nothing. I had kernel.softlocku=
p_panic=3D1,
kernel.watchdog_thresh=3D5, and hung_task_panic=3D1 enabled with kdump inst=
alled
and verified working; the NMI watchdog stayed completely silent and no vmco=
re
was ever produced, so this is a hard halt below what the kernel can report.

System:

Motherboard: ASUS ProArt B850-CREATOR WIFI NEO (BIOS 1103, 2026-09-18; also
reproduced on BIOS 0239)
CPU: AMD Ryzen 7 9700X (Raphael/Mendocino iGPU driving the display)
GPU: 2=C3=97 Radeon RX 9060 XT (Navi 44, headless compute via ROCm/llama.cp=
p)
RAM: 32 GB DDR5-6000 (EXPO enabled)
OS: Ubuntu 26.04.1 LTS, kernel 7.0.0-38-generic (also reproduced on 7.0.0-34
and 7.0.0-14)
Trigger: a resident adb server from android-tools-adb (platform-tools
34.0.5-debian, legacy NATIVE USB backend that polls /dev/bus/usb every seco=
nd).
Important: no Android device was connected during any of the freezes =E2=80=
=94 the adb
server was simply running in the background after I had used adb devices/adb
logcat, so polling of the root hubs alone was sufficient. The load condition
was sustained CPU/PCIe/memory load from local LLM inference (llama.cpp,
HIP/ROCm backend, both 9060 XTs active). Freezes happened randomly over sev=
eral
days, always while that workload was running.

USB topology (matches the xHCI superspeed root hub pattern from comment #59=
):
three 1d6b:0003 Linux Foundation 3.0 root hubs (Bus 2/4/6) plus 2.0 hubs;
attached devices are an IMC Bluetooth radio, an ASUS AURA LED controller
(0b05:19af), a keyboard and a mouse =E2=80=94 nothing unusual.

Ruled out on my side: BIOS update 0239 =E2=86=92 1103 (AGESA 1.3.0.1d) did =
not help;
kernel downgrade to 7.0.0-14 and upgrade to 7.0.0-38 did not help; disabling
EXPO (running at JEDEC speed) did not help =E2=80=94 freezes continued, and=
 I have
since re-enabled EXPO with the adb workaround in place and the system remai=
ns
stable, so memory speed is not a factor; temperatures normal (37=E2=80=9343=
 =C2=B0C); no
MCE/EDAC errors, no PCIe AER errors ever logged.

Workaround: setting ADB_LIBUSB=3D1 system-wide (forces the libusb backend) =
=E2=80=94 no
freezes for days since, with the same inference workload running, adb
available, and EXPO re-enabled.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
