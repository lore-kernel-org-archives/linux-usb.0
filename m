Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B595550DAD
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707458; cv=none; b=npxTQ+EOT6oOqBNmH+3H2HPUDXVkoni1dTt6SYqINDDk6N62Gl9mBMrORL6MOfFh6mowS8uZ+sqr8Qtwu6ZOzorwUUQ80QAft8N94bImAMkkwx0cOFTpI7IX4daamSs2fVxuXE+GqA7XW5Z/TYZQHJ1wFJDDUFaYWaJCQbsmnYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707458; c=relaxed/simple;
	bh=HcMwICtPsYzSGYlIrZpeMSLd4hRv83e0EJ4ok104YuU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pFFDpHpM8k4Zs7b40KZfVxKYYPDzbTl7nPA6Rz4s0Cta4W4q8dMFU8IPFdlJMaU8m5CtGU+6h0xd5Cqxg1gtkcg+8aseHQ5KHK2ayyjLx1VybTzpsSFvfxdMhW2aOnWhHbHgPoVUY1Qb7jHl4EE8B+eEXL+P7yiHVMte5C5Lfac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uciZZ+7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uciZZ+7k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8AAEC4AF0B
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 18:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790707457;
	bh=HcMwICtPsYzSGYlIrZpeMSLd4hRv83e0EJ4ok104YuU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uciZZ+7ke5kaU08Jma8+rKacFoptP480gzAxJrqPfx0CGDXM4Z3b+vUI3s2irsCp2
	 W9wlyDyxI6z5ZUfKjr4cgXqakS0u4ppPsoBPMrcXma2njiHKrxZPIbW2864umIjikz
	 7L0mDzfnp7lbmQyCpz8GMQ5Z66qmHghStoO7RfEHSS5TkI4broO8pLSlKbzA9P7GdJ
	 OXYT4ocvoYJAyB6flf5Xg00ouoU2tZq/hI2yI8Vq/KCaivCh/ZdTzKlohyvu+2yvsR
	 oqO/38ATFHP+TSj+TBCJ+zSFAidJmmvWPKUBTX7lJzIbtvEN7Q6ZlNIW93ksRnhEUq
	 6yIbv3NQrIM6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8967DC41613; Tue, 29 Sep 2026 18:44:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 18:44:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222071-208809-BF2h3UpMOn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

--- Comment #5 from Harald Judt (h.judt@gmx.at) ---
Thanks for the patch, I've gave it a quick test and after 4-5 hibernate/res=
ume
cycles it looked good at first, but then similar symptoms. Though, the error
message changed, so something else might still be missing?

Also note the Suspend Save Error, I believe I have already seen this in
dmesg-7.1.1.

[  487.224692] Freezing remaining freezable tasks
[  487.225435] Freezing remaining freezable tasks completed (elapsed 0.000
seconds)
[  490.706989] PM: hibernation: Preallocating image memory
[  491.227735] PM: hibernation: Allocated 1677392 pages for snapshot
[  491.227739] PM: hibernation: Allocated 6709568 kbytes in 0.52 seconds
(12903.01 MB/s)
[  491.227742] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[  491.230837] serial 00:00: disabled
[  491.249637] xhci_hcd 0000:09:00.0: Suspend Save Error (SRE), USBSTS
0x00000401
[  491.620480] amdgpu 0000:03:00.0: MODE1 reset
[  491.620485] amdgpu 0000:03:00.0: GPU mode1 reset
[  491.620532] amdgpu 0000:03:00.0: GPU smu mode1 reset
[  492.125327] Disabling non-boot CPUs ...
[  492.126636] smpboot: CPU 7 is now offline
[  492.128437] smpboot: CPU 6 is now offline
[  492.130144] smpboot: CPU 5 is now offline
[  492.132100] smpboot: CPU 4 is now offline

[...]

Now the new messages:

[  493.491022] xhci_hcd 0000:00:14.0: Not enough bandwidth on HS bus for ne=
wly
activated TT.
[  493.491024] xhci_hcd 0000:00:14.0: Not enough bandwidth
[  493.491027] usb 2-1.1.1: Busted HC?  Not enough HCD resources for old
configuration.
[  493.563490] usb 2-1.1.2: reset full-speed USB device number 5 using xhci=
_hcd
[  493.637648] usb 2-1.1.2: device descriptor read/64, error -32
[  493.823352] xhci_hcd 0000:00:14.0: Not enough bandwidth on HS bus for ne=
wly
activated TT.
[  493.823354] xhci_hcd 0000:00:14.0: Not enough bandwidth
[  493.823357] usb 2-1.1.2: Busted HC?  Not enough HCD resources for old
configuration.
[  493.827971] OOM killer enabled.
[  493.827973] Restarting tasks: Starting
[  493.829006] Restarting tasks: Done
[  493.829020] PM: hibernation: hibernation exit
[  493.829329] usb 2-1.1.1: USB disconnect, device number 4
[  494.005427] usb 2-1.1.1: new full-speed USB device number 6 using xhci_h=
cd
[  494.091135] xhci_hcd 0000:00:14.0: Not enough bandwidth on HS bus for ne=
wly
activated TT.
[  494.091139] xhci_hcd 0000:00:14.0: Not enough bandwidth
[  494.091142] usb 2-1.1.1: can't set config #1, error -12
[  494.091830] usb 2-1.1.2: USB disconnect, device number 5
[  494.172431] usb 2-1.1.2: new full-speed USB device number 7 using xhci_h=
cd
[  494.245591] usb 2-1.1.2: device descriptor read/64, error -32
[  494.431958] xhci_hcd 0000:00:14.0: Not enough bandwidth on HS bus for ne=
wly
activated TT.
[  494.431963] xhci_hcd 0000:00:14.0: Not enough bandwidth
[  494.431967] usb 2-1.1.2: can't set config #1, error -12
[  494.619736] ntfs: volume version 3.1, dev sdc1, cluster size 4096

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
