Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349143550C
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385407; cv=none; b=H1SRWizFF6xvRTyXIDQ8SHkG9j+tgvZ6sVdrfpOuRMuDwv6aRa4/93S4oPjyVdaqOJfAzpAcQevt/PMhy/0aDUpfoWhyPGhCcLALVf4ZdVwzmAiD4b/t5770Dq2+KJWvSM+tBPMn5bjiD+8jKFF1t3dIAJB0XPYjxISb8sTWSv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385407; c=relaxed/simple;
	bh=6Q8mhpEOGcbZRtbtTig4lu8wB4ucqUohaL3wYMcAGjc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C36H+4yfSHRN6CyfyD/tbhL+0rnuLVPNgSbm6zle+F7ujZ1XoXoaNjkEqQ/j46Ya5g99E+EKPT8ehCNsYgB47pNudXPbgVFgWXD+AIxnQHMhDXOuZwgH7ygy3W+iuzXJxNesg61Lu+uRYg+BdoEYc9X62CmG9mrar1Tgi33W4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArPRr0gv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArPRr0gv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2368AC19425
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786385407;
	bh=6Q8mhpEOGcbZRtbtTig4lu8wB4ucqUohaL3wYMcAGjc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ArPRr0gvFWwM40hMpXckeDDIzvmcJh5362a+eo/71+4yh0sWHZz3SlyDQVEDGXPGW
	 zM4NDGO5m7YTY88xE3dYn5RoQhDRWVrLEAWUEZ8d3lrses3GM79HIxn8t5cKdQect/
	 puD/ZmNzBCwQNNiAIiNtRhMv4nUK3WJhTQpHaTVqrlNPNoJ8ijpTdImmJhUi+MQ8/+
	 7tfjn+AmFImLWVYnwUGkaGMxPj5kFVYwucjvfp8IeOmNs54RhsR3XEifQzO6Ckuvjs
	 YTsRsCkXR+CoPtCmm0+e20vhHPRP+FWKzDDzrNf5eQXBTAUBboDk+QsMBam4q/nxfh
	 9aNO9MzR6k5lw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10AC1C3279F; Mon, 10 Aug 2026 18:10:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221776] HP OmniBook X Flip - Broken UCSI firmware / Slow
 charging
Date: Mon, 10 Aug 2026 18:10:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daviddelsol1998@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221776-208809-nbcN89ir2T@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221776-208809@https.bugzilla.kernel.org/>
References: <bug-221776-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221776

--- Comment #3 from David Del Sol (daviddelsol1998@gmail.com) ---
Updating this report with the verified root cause, found since the original
filing.

The slow-charging issue is NOT UCSI firmware corruption. Root cause: the EC
only enables normal charging when the OS claims _OSI("Windows 2022"). Verif=
ied:
- DSDT/SSDT (via strings on /sys/firmware/acpi/tables/*) contain OSI checks
only up to "Windows 2022"; the kernel's default claimed OSI strings stop be=
fore
that.
- Adding acpi_osi=3D! acpi_osi=3D"Windows 2022" to the kernel cmdline resto=
res
31-33 W charging immediately, reproducibly, on kernels 7.1.6 and 6.18.42-LT=
S,
across multiple charge cycles (currently 27.8 W, battery 79%).
- This works with ucsi_acpi loaded -- the driver does not need to be
blacklisted, so the proposed ucsi_acpi.c DMI quirk in Comment 1 is unnecess=
ary
and is withdrawn.

Per Greg's note: the correct upstream fix is a DMI-scoped OSI quirk in
drivers/acpi/osi.c (linux-acpi mailing list). Filed as a new report with fu=
ll
evidence and EC RAM attachments:
  https://bugzilla.kernel.org/show_bug.cgi?id=3D221866

Separate, intermittent issue (still open, tracked in 221866): on ~1 in 4
plug/unplug events the 65 W charger's PD contract occasionally sticks at 5 =
V /
3 A (~0.2 W to battery) until reboot. UCSI driver reload and suspend/resume=
 did
not recover it. Not reproduced in later cycles; appears to be a PD
renegotiation race.

Closing this bug as resolved-by-workaround: acpi_osi=3D! acpi_osi=3D"Window=
s 2022"
on the kernel command line.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
