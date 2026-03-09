Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0D334EF09
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052263; cv=none; b=Cw0MuWwo1Ym987OrJ8rpepoxpuykXy5y+nBw+KD3apkdP2Dhy2yVkKOs2po/OoqxV/Co726sUX7PBV06LVU69gcekVrFJ5KIGHW76UPN0IykYc+QxDPCtdMqglg6VuKf6ad8hTRY5IItkOSH9NLCJKdNz5QYaa0kf0RBnSU4ehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052263; c=relaxed/simple;
	bh=tDwWyZJrqAc9CGLVm3aBcFqqW7pGbRTGAnRP4oaZ5fs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llcxQpRT0IYJPMLArUoOM3lCu7Bl/oKCSa3GiuItcZHuPpyO11/XqK/129UNu29tD2YU+Dburaq3H4/JrFsg6lNL9d0a+tvR2l/BpSV7gliTwDbMXyVFxH9xof4MkmpbxzbSj9Eh6GcHnUZMvbhsY83ftnMM6Olkm/2jcchXvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpiizBu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpiizBu5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9107EC2BCB1
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052262;
	bh=tDwWyZJrqAc9CGLVm3aBcFqqW7pGbRTGAnRP4oaZ5fs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DpiizBu5vNhocwcV4AhypGhykYkTfvOEG1ndFD31pu7GF9Pefgtm2kxbwvR2nB6Xo
	 tdd02KMsQG3cnNKTqRKaztBWQHDICEfFkFVxZioxbAr9oJKvUt0+HLx+zY0vIb6Dnr
	 2aB1kr9GvdNQTO1l3HIY882Hlf7lMeguTJCFxoDCIDDoeMXuZG/DQ/nqSAgcOq6yVS
	 fQhMYMobPKtLnsVIhCuN2h+tNAHgRDBgG5vcKJSMYny5psEOTPt3yXnLoBrkNGu82P
	 agXB/fflCs45Ovx3c+tYc9R1VewQ7t7pDQpPJR8W5dSLJbQ+X1bQBDWE69LX0hUN/+
	 9+9Y+fUN2cjmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89B6AC3279F; Mon,  9 Mar 2026 10:31:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 09 Mar 2026 10:31:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-zri3Lu2qNX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #34 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Created attachment 309583
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309583&action=3Dedit
debug suspend/resume

There are some error flags set on DevSta and changes to MSI capabilities of
other functions on c4:00 device, but IDK if it means anything. Though it wo=
uld
be suspicious if those changes only occur during problematic resumes.

Mathias suggested that CMD_INTE may be getting cleared inadvertently. I don=
't
see how it could happen, but just in case here's patch which logs xHCI
registers relevant to interrupts during suspend, resume and on command time=
out.

It also checks for pending commands on suspend (shouldn't happen, but who
knows) and explicitly disables and reenables IRQ generation at xHCI layer. I
gave it a quick test and it seems to be OK, but you could also try without
those two blocks which manipulate CMD_EIE in xhci->op_regs->command.

I also tried removing only the part which enables interrupts on resume and =
got
a failure similar to yours, as expected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
