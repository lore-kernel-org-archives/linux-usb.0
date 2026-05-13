Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169EF2DC783
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 03:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642545; cv=none; b=kJpBa+aqRsuQB98Nrq9bJ+cWQeCbF9TLe0t0Au8AOXp1U751ERZj6FnAm7lFRBVrtTIlnxDWX+ZmaXp1EJvjCm5m6r5k0CneZs85D3pDAYMinw5QqZpgTU6bNjOSWtSVdaPEX8haty6FhWWUOQXZK/j48XvKNduZ9n9iivltqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642545; c=relaxed/simple;
	bh=1Mxh9PHJKIZjIShkaUcvDfxE2rx+RjtLpwcdse6Y3fE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HW2/1+98Tfh6BQ2kes10b7or5+5L8nBPsdazmek6KbpHo570oEYj6+/kVr+ZS+OzehG1JsMaeqyQsgSOhNg3nBIBYJDpjSaFN8bflwE+1s0byoY2N0Y2UAeeHDlUaDMW/ylBXKnBNHu2roaygXT3/J/MAoBm4qRpIWZ7i/lq7ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZaiAKlx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZaiAKlx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA95EC2BCB0
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778642544;
	bh=1Mxh9PHJKIZjIShkaUcvDfxE2rx+RjtLpwcdse6Y3fE=;
	h=From:To:Subject:Date:From;
	b=mZaiAKlxpDctQtoJRKl6RncP/c43XwyVfc/TuhUPiAsz2zJXAumu08R1yB8K95xOl
	 QeT0GdYgAnGgni/vZKwkLZySfgVEGd+cj7nFHGq5Y+BS5cVObA8KyPe3N72US4LpeS
	 slfgqwB+Blbvr31OVxVMxJtTm/mYD9lzBy9Z1Cda0Y9rkgHSZBIvlT9QfqilBPfGx5
	 EnvxqLVGfZbrTgoLKg/SCXS1OEPVTfx0YNaLMKQOQwRwY0YALA88qJ2Eal+bGy7rLa
	 doEz/NSoK1T+kDWJqS3i+sYFDtUqKJ026BLuL23tGnoaM/lY5DEAZhTW/SZTnhhJcw
	 2Et6/2Ehz/YNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9AC12C3279F; Wed, 13 May 2026 03:22:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221510] New: CalDigit TS5+ Thunderbolt rear USB controller
 fails to enumerate on AMD Strix Point USB4 host
Date: Wed, 13 May 2026 03:22:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla-kernel@andrewzah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221510-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221510

            Bug ID: 221510
           Summary: CalDigit TS5+ Thunderbolt rear USB controller fails to
                    enumerate on AMD Strix Point USB4 host
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bugzilla-kernel@andrewzah.com
        Regression: No

Created attachment 310101
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310101&action=3Dedit
dmesg,lsusb,lspci,tbadm etc debug output

I have a webcam connected to the rear usb hub of the Caldigit TS5+ dock. It
fails to enumerate on linux, however it does light up and activate when plu=
gged
in. It does work when connected via the front usb port, just not the rear o=
nes.

However, it does work with an ASUS Zephyrus G14 (GA403UV, Ryzen 9 8945HS, H=
awk
Point) running Windows.=20

I did see this in the dmesg logs at one point while testing: "usb usb4: We
don't know the algorithms for LPM for this host, disabling LPM".

Kernels tested: 6.12.82 and 6.19.13 (NixOS 25.11)=20

Hardware

* Laptop: Lenovo ThinkPad T14s Gen 6 AMD (21M1CTO1WW / 21M1CTO1WWUS1)
* CPU: AMD Ryzen AI 7 PRO 360 w/ Radeon 880M (Strix Point, Zen 5)
* Dock: CalDigit TS5 Plus

Steps to reproduce:

1. Boot Linux on a ThinkPad T14s Gen 6 AMD with the TS5 Plus connected via
Thunderbolt.
2. Plug a USB-C device (tested: Insta360 Link 2 webcam, idVendor 2e1a,
idProduct 4c04) into any of the three rear USB-C ports on the dock.
3. Observe: device receives power but does not enumerate. dmesg shows no
events. lsusb and v4l2-ctl don't list the device.

Expected behavior: Device enumerates and is usable, as it does when plugged
into the front USB-C port on the same dock.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
