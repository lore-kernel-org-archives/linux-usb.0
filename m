Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF982389460
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296467; cv=none; b=h453VHeA4pCdUnWdaBKVZYxnR+TpK5pg1a37b56YZuJoJfAIuyvnyREwRLhfM1nXJxmac58wODeWJxNeikqASa+TjChSi5SpyavmkwYpPkiXe/ARkIemo0JvGPe1+oNpsA0t2iWL7eMV33xhm/tLRrkO3xsEYmo9D1IoiFPLou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296467; c=relaxed/simple;
	bh=5LITcwwXxEeQWp2uOboH61eJij9jkxGlW1wQI9YOw94=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNSoTOO24Om9VO7XGCLbnBQRGXhlW0QDxzoUOCp5b8SQg7cUyIB+Kuz6Z0Ttvw7rI1/sJHUIP8c9cc8Ns7rOj8OAIAePBuvRJvzZASzdG0PpO+8BWCzLibdYJJanZ01Pa5WuZqPofCAJaXUFhu3D9FWeXtzsQCh35nm/gsVcgUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdvBRyl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdvBRyl6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BE84C19425
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775296467;
	bh=5LITcwwXxEeQWp2uOboH61eJij9jkxGlW1wQI9YOw94=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FdvBRyl6WU274e88T4u2FKlBhBJCXQtJk1p3eR5nYPdwZpP6y4rA6JOte1Nm7m/Gp
	 DSCygG1iR615bGlSfmgpo+CRqb4IcVmopiA1O34yXH+WeIq4OkYtIji1zGE+4KFsHx
	 IcEcOtYitwB2UaSaMV5B23ij7h67dXkrx/56X6jxz75sBXPKXNyty94kK2wpkP9ACx
	 WcRKreewVUZm3L1i2ElVQk1d/Xlu63NzuGkWpn6bDW+GqYS0oNOdL+CuYVmwDHX1r9
	 ZRa/fyyEVJah9mt7o2LS51K78DKIdCwPuWzBgqW7wGNUs0ytYow/AcH1vi01sqV9it
	 tEPUC5o6W+HZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49000C433E1; Sat,  4 Apr 2026 09:54:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sat, 04 Apr 2026 09:54:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221318-208809-HWxfBGqGQ4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
ASM1042A is a host controller, not a hub, but there is likely a hub between
ASM1042A and the USB ports on the monitor. Maybe the same hub which shows up
when the monitor is plugged into USB instead of Thunderbolt.

Could you post "lsusb -tv" for both connection variants with the same mouse=
 in
the same monitor port?

Maybe see if dynamic debug spits out something useful:

echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
dmesg -W >log.txt

Then connect the mouse with your udev rule, make a few clicks, disconnect,
remove the udev rule, connect again, make a few clicks. Attach the resulting
log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
