Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F333EB10
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624025; cv=none; b=iik2fhRucBQ88wpA03Hl5LpAo3bBP8UCoOOxEhjYwFQs8eYu6655eX1Ijp+AiyD1UmmM6grUCs/gMBH8BERPxzndyXSiHNxE4KTAeAPRSItiU2Hmzxhzl7Yrj9ZjWG67mUUrmX1VWz8Rh+3+0+4D8gX7g4MuhemTG/Hmcj9IMiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624025; c=relaxed/simple;
	bh=tYZliDvwtu0U+4DD79RcRm2RmgJb5/PV/kPAItnAgwo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ItK07sU7L0ZbY3pum/8JjvDMqmYbCsNVbPV9p+8Rg2gyeHREJ2W5CGcFEDq7kIW0q7wYK1ek7lsh1ZZQXhBp3oOvzRVpQq059rFKE6dJcyTvrIy+uRlYw8LOq9g9ZOoIp5BAmKgmEoEbKLXNX//o+InVIa8GezCayDJZoe24AUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SE11l6jx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SE11l6jx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 408B9C2BCB9
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791624025;
	bh=tYZliDvwtu0U+4DD79RcRm2RmgJb5/PV/kPAItnAgwo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SE11l6jxuWX/5cZFTbuFYv6lYE2j4kEgd9ClPjcHq3PtqJQ9by8J1kEpkBDgbwg1l
	 HboTg/UOMZRaMTKKUQ0I9pxo4bc7SUMJ9XR4aGyok56gZv8tcjhCZiEpW3ynpfjo2E
	 DWAIHMXD+EAKIa1I7LvXmoU9ujYvWVRnD3BIQBw/Jp39uELD5unASSEiwjRjITvDQZ
	 YrUtAtJVkYumL+eCAIZ8O/GFqTVUwI5omv0c/szTKRmJjak/cf2YZqaX9MHdBv3ljd
	 YSznXJIgpTJtJaFutfLHVwWhdVk6f4QFTCdWkNle7zJ4n7n3S+X/SUZKB3P3VhTaQC
	 LQRvzWQiPLK7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0D7C7C3279F; Sat, 10 Oct 2026 09:20:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Sat, 10 Oct 2026 09:20:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: splint.em85@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222021-208809-8Z06Iq5Oz2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222021-208809@https.bugzilla.kernel.org/>
References: <bug-222021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222021

--- Comment #6 from SpliNter (splint.em85@gmail.com) ---
Tested mainline 7.3.0-rc6-1 (Arch AUR linux-mainline, unpatched, default
config)
Result: no change compared to 7.2.9.

- dmesg: "ucsi_acpi USBC000:00: unknown error 0" followed by "UCSI_GET_PDOS
failed (-5)" at boot (9.2 s) and again when plugging in AC while running (3=
96.2
s, coincides with the AC event at 396.3 s).
- The desktop battery status flaps on plug-in: plugged in -> not charging ->
charging (3 changes). BAT0 ends up as "Charging".
- udevadm monitor --subsystem-match=3Dpower_supply: 4 changes of
ucsi-source-psy-USBC000:003 within ~6 s, 1x AC, 2x BAT0 (identical to 7.2.9=
).

udevadm monitor --subsystem-match=3Dpower_supply (AC plugged in at ~396 s):

KERNEL[394.326132] change
.../USBC000:00/power_supply/ucsi-source-psy-USBC000:003
KERNEL[394.869343] change
.../USBC000:00/power_supply/ucsi-source-psy-USBC000:003
KERNEL[396.322197] change .../ACPI0003:00/power_supply/AC
KERNEL[396.382409] change .../PNP0C0A:00/power_supply/BAT0
KERNEL[397.542787] change
.../USBC000:00/power_supply/ucsi-source-psy-USBC000:003
KERNEL[399.928510] change .../PNP0C0A:00/power_supply/BAT0
KERNEL[400.631229] change
.../USBC000:00/power_supply/ucsi-source-psy-USBC000:003

dmesg:
[    9.247627] ucsi_acpi USBC000:00: unknown error 0
[    9.247630] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)
[  396.214445] ucsi_acpi USBC000:00: unknown error 0
[  396.214454] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)

Next I will test 7.3.0-rc6 with the "Reset if Error" patch (attachment 3108=
69).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
