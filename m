Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B645DF47
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637085; cv=none; b=bY4xM+b57xEFwGSoHrR7NDUly6PE5qyu0pJyYBAjKkITutwI6mPqy494m/HkSoHVGFB0clYxpsdTScokuv8z3Kcy1WMNUsY4qTvZu1nx/uEUL6v8+YeW/qgCoEKtoaM/llr4X8+9swxc1pR29rLhyq8YbGuIKdsbspDqKyNHQBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637085; c=relaxed/simple;
	bh=dvZlOax+q0x2TEypui2vn2/1Do/DhJWxz5vO2wdFqAQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxfLeg78hv7w6uHmhCTA26l54M98BZAMs6QKPq3UJEk8W9newdBau/4isY4u0SeQ1RLqAm0QtDiN//5nmcaUeN2xe8Zx4LAs+GJHkGTNhR/3Sa7BbYAhdMFsZ463WfeQZfN4uaI5zTSBHkDkeeJfIoVtEpOUkAdC7VnZ66srPU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRPMXS6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRPMXS6S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBABBC2BCF7
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791637084;
	bh=dvZlOax+q0x2TEypui2vn2/1Do/DhJWxz5vO2wdFqAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rRPMXS6Sjgd29Onmk6z8jAEp+XpzPHLh/LgnqHnxVkJzEe1spfHc+IDzWGds8nHSI
	 pcFLzSpioNc75+JzHMyedXodyJH2SVWRWBr6P4L28/DoteC/W4tfnpahL2Mo1qTgst
	 JIDDq0Oe69vzUTU1kxMBav8lPibDG1r4l+ktSjyczD3VVGiGfPtk6F74BKz/po/5Ui
	 zjfTHWWvKuv+utURT+bfAZ0MwEbb8+ycaFOVuIVsuHslTk8rOH8mTWljhQTBlS/ofb
	 LCR0+wBI7ZNRMEfFaifjXXTuXqLczj5SuZYWTrQ1hmeF7IKw8fZuL2Bq/TKkcZIsGS
	 CuIwkw6ndmM5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95357C3279F; Sat, 10 Oct 2026 12:58:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Sat, 10 Oct 2026 12:58:04 +0000
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
Message-ID: <bug-222021-208809-B0JHxJAaBt@https.bugzilla.kernel.org/>
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

--- Comment #7 from SpliNter (splint.em85@gmail.com) ---
Tested 7.3.0-rc6 with the patch.
Kernel: Arch linux-mainline 7.3rc6-2 with the patch added, default config
(uname: 7.3.0-rc6-2-mainline-dirty).

Summary: charging works on plug-in with and without the patch (as it already
did on 7.2.9). The remaining symptoms (UCSI error, status flapping) are not
changed by the patch.

- AC plugged in while running (~352 s uptime): "ucsi_acpi USBC000:00: unkno=
wn
error 0" + "UCSI_GET_PDOS failed (-5)" appears twice (352.38 s and 352.87 s=
).
Unpatched 7.3.0-rc6 had it once at the same event (396.2 s).
- No UCSI error at boot this time (unpatched: one at 9.2 s). This is a sing=
le
boot, so I would not read much into it.
- udevadm monitor --subsystem-match=3Dpower_supply: identical to the unpatc=
hed
run: 4 changes of ucsi-source-psy-USBC000:003 within ~6 s, 1x AC, 2x BAT0.
- The desktop battery status flaps on plug-in: "plugged in but discharging"=
 ->
"not charging" -> "charging" (3 states).
BAT0 ends up as "Charging", so the battery does charge, which fixes my issu=
e.

Unpatched 7.3.0-rc6 and 7.2.9 behave the same.

Thank you for the effort.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
