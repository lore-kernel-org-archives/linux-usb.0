Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBA4A207F
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676721; cv=none; b=r/wXZkAglYvCunU0hO199L6gjWARJZaG2a7FdBzE/Nmhg8t/XMPwIqb+2YcvsXDoxKlRLoxIV25ZQE5KXIfxFIe6pd98DbCqMOgUUD5/ZZZgkLWmAkPkW93vPSujot9ClaamjxV4XqNipLZv3UbtSHtS6kOT/FeQsLbFPtHLiyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676721; c=relaxed/simple;
	bh=BaMnS/R3gnsHcrkyByF4UswjzqBqPciDiY8lAC9zNhs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ns7OFwOxdUvsubyx/Xmom8JXHG17AVlDSG8D6toumhXRK2JGUSWJWdYWbWbgwyWcRmvcQlyozRStgaZ+XefXEr860J1mssFgAg78bOP9ae7jzID8al1vHmudOHgJVr12slCvlmmxa4gSQPy6piJ3IUPZiGjydjmAaL2VO7ltXgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMkx4hNe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMkx4hNe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F614C2BCB3
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789676720;
	bh=BaMnS/R3gnsHcrkyByF4UswjzqBqPciDiY8lAC9zNhs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FMkx4hNeWT6aQ/sa/i2KarCrtN1jdfzCui0s6eikTlzeMDgi4u8FhFz4ICeMk3jmM
	 4RMkE9/4559nsWT6FZOgozKxpi1PScEa0ohn9GG9FLYRqjb6aaJMocvbX8NCK+AbXO
	 dcoV2VG3zTvdUv+0ps/7bhoxPtJtrciUX4wxydL54eE/77rWmqqygD7c3OAgLfJ/D/
	 +pXPwR8D8HTEd618Y5+U99GGDzE0GzD07pvXylKn1HtB01F73ZTo88SDHybeFSS1sO
	 8wVTa1FFdLzSGbEAaZlT3jg9sabtGnhXW0nON8WxG8EzFkDlv/Zwot/BICnsaEcXQh
	 VU0+Li4RmbLWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 44290C4160E; Thu, 17 Sep 2026 20:25:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221998] HID: playstation: GameSir G7 Pro 8K (054C:09CC) reports
 incorrect battery level (fixed at 5%)
Date: Thu, 17 Sep 2026 20:25:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishgulati7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221998-208809-W7n7gaEbhB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221998-208809@https.bugzilla.kernel.org/>
References: <bug-221998-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221998

Krish Gulati (krishgulati7@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krishgulati7@gmail.com

--- Comment #1 from Krish Gulati (krishgulati7@gmail.com) ---
Thanks for the detailed report. To narrow this down we need to see the raw =
HID
input report bytes from the controller, since the fixed capacity of 5% stro=
ngly
suggests hid-playstation is reading status[0] as 0x00 for this device; eith=
er
the report layout differs from a real DS4, or GameSir's DS4-emulation firmw=
are
doesn't populate that field at all.

Could you provide the following?

1. First find the correct hidraw device for this controller (don't assume t=
he
number, it can change between boots):

   grep -l 054C:09CC /sys/class/hidraw/*/device/uevent

This prints the sysfs path for the matching hidraw device(s); the last path
component (e.g. hidraw4) is the device name to use below. If the controller
creates multiple hidraw interfaces, capture from all of them.

2. The decoded HID report descriptor, ideally with an input report capture =
in
the same run....this tells us where the device itself claims the battery/st=
atus
fields live:

   sudo hid-recorder /dev/<hidrawX>

Let it run for a few seconds while moving a stick/pressing a button so we g=
et
non-idle reports, then Ctrl+C to stop. This prints the decoded descriptor
first, then the captured reports.

3. If hid-recorder isn't installed, get the decoded descriptor and a raw re=
port
dump separately:

   cat /sys/class/hidraw/<hidrawX>/device/report_descriptor | hid-decode

   sudo xxd /dev/<hidrawX> | head -50

Please capture at a few different real battery levels (e.g. near-empty, ~50=
%,
full), and both with and without USB charging active, since the parsing log=
ic
branches on cable state.

This will tell us whether the battery/status byte is at a different offset =
than
expected on real Sony hardware, or whether the field is genuinely always ze=
ro
on this controller. Once we can see the byte layout we can put together a f=
ix.
I don't have this hardware myself, so I'd need your help testing any patch/=
BPF
program against the real device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
