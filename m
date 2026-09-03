Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0E4F472A
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 21:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788472788; cv=none; b=n3IzjUCfFd9RghWFAfDNEZwR6YMP3cl7rJSwnShw88ap/6Hpq6ku2OJR+rsl43Bh6oW7ES/PGbh54swkgvdvp1+b+fg3kGC8ke+XkFjkWc72INq9v9+f0/cxZuHh9xbTZEXGdc5kTO7knnk++ffzIdrq7yBbCo0y9MSlWdmGjNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788472788; c=relaxed/simple;
	bh=AKjFa+4vmL4M3caUkdf5Ia7pz3FSw4Q5ahCecWxp3zc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lgFetHgF7P4GYVET7POaS2STlAhklZeA1cuZ73xyOxdtsPUyxSnccAe9WvpzLN4A+PDGDfrm2CEXn/SVHcmLQ+z/MIPfSA38Nix4rKDcwzJcwzyV5srbKmvkbQNV2Pf4EdSYFJyf4OH7emiIYPs3WtPML83oIDu0uSL/aNe6jvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DowgwEay; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DowgwEay"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 012FCC2BCFF
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 21:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788472788;
	bh=AKjFa+4vmL4M3caUkdf5Ia7pz3FSw4Q5ahCecWxp3zc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DowgwEay+gOHQvSH1XRTF5mYuNjfq6p2E/o7x+63MjvZ+jmyHftKwKa2NSX7OGTeS
	 I/D6n6NhAVoRCDQplGG7MV21nYEKntINkfbHq0unjiXN4ty6CLWswYiI67cwXszfTf
	 Q5fHTKBp8xcPhvFIhycnZMidC5tOloMZjGNay9P++RH1+gkBJx6wp3Rf9GF0gVezzv
	 hhaCOmfabq3ViUa7qzdIGbkWupnHK06Q8sUNOM5A2e3tjIy5vrL8VmFRiAhVJu2d7N
	 INUKCEerQiSTGhe+SG1YxP+8tPm5kqzuLDlvhC30hA5BvkRnhNow92ajyycgOLiwWx
	 Z8PPEglPzUUtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2EDEC41616; Thu,  3 Sep 2026 21:59:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Thu, 03 Sep 2026 21:59:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: voltara@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-oEgs5KQR2C@https.bugzilla.kernel.org/>
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

--- Comment #40 from Andrew Skalski (voltara@gmail.com) ---
(In reply to Micha=C5=82 Pecio from comment #38)
> It's theoretically possible that the crash happens when the xHC is resumed
> too quickly after being suspended. Maybe it doesn't matter how long we ke=
ep
> it awake, until this duration is so long that immediately after suspending
> some userspace loop enters another iteration and resumes it back.

After experimenting more, I'm starting to think that it's actually the other
way around: Suspending the device at the "wrong" time causes the next resum=
e to
crash.

I wrote a program that opens "/dev/bus/usb/002/001" and alternately writes
"on\n" and "auto\n" on a predetermined schedule.  For the timing, I use
clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &ts) to control for drift d=
ue
to waiting for the IO to complete.

On my system, I found the sweet spot to be around 240700us between initiati=
ng
write("on\n") and write("auto\n").  Example output leading to a crash on a =
7.0
kernel without your patch:

$ sudo ./a.out=20
+3000000 us resume, +240722 us autosuspend: ..........R..........S
+3000000 us resume, +240694 us autosuspend: ..........R..........S
+3000000 us resume, +240701 us autosuspend: ..........R..........S
+3000000 us resume, +240703 us autosuspend: ..........R..........S
+3000000 us resume, +240714 us autosuspend: ..........R..........S
+3000000 us resume, +240698 us autosuspend: ..........

The dots are printed in a { print '.', sleep 1/10 of the duration } loop.
The "R" and "S" are printed after the write("on\n") and write("auto\n") ret=
urn.

While I ran the above program, I set these dynamic_debug flags and captured
dmesg output.  (First column is the time difference from the previous log
message.)

module xhci_hcd func xhci_suspend +ptmfl
module xhci_hcd func xhci_resume +ptmfl

30.404398 [ 1135.752405] [7530] xhci_hcd:xhci_resume:1282: xhci_hcd
0000:e4:00.4: xhci_resume: starting usb1 port polling.
0.227738 [ 1135.980143] [6986] xhci_hcd:xhci_suspend:993: xhci_hcd
0000:e4:00.4: xhci_suspend: stopping usb1 port polling.
3.012930 [ 1138.993073] [7530] xhci_hcd:xhci_resume:1282: xhci_hcd
0000:e4:00.4: xhci_resume: starting usb1 port polling.
0.227758 [ 1139.220831] [6986] xhci_hcd:xhci_suspend:993: xhci_hcd
0000:e4:00.4: xhci_suspend: stopping usb1 port polling.
3.013086 [ 1142.233917] [7530] xhci_hcd:xhci_resume:1282: xhci_hcd
0000:e4:00.4: xhci_resume: starting usb1 port polling.
0.227617 [ 1142.461534] [798] xhci_hcd:xhci_suspend:993: xhci_hcd 0000:e4:0=
0.4:
xhci_suspend: stopping usb1 port polling.
3.012995 [ 1145.474529] [7530] xhci_hcd:xhci_resume:1282: xhci_hcd
0000:e4:00.4: xhci_resume: starting usb1 port polling.
0.227667 [ 1145.702196] [798] xhci_hcd:xhci_suspend:993: xhci_hcd 0000:e4:0=
0.4:
xhci_suspend: stopping usb1 port polling.
3.012959 [ 1148.715155] [7530] xhci_hcd:xhci_resume:1282: xhci_hcd
0000:e4:00.4: xhci_resume: starting usb1 port polling.
0.227710 [ 1148.942865] [798] xhci_hcd:xhci_suspend:993: xhci_hcd 0000:e4:0=
0.4:
xhci_suspend: stopping usb1 port polling.

I've found that the amount of time spent suspended doesn't matter at all (so
it's not resuming "too quickly".)  However it is very sensitive to the "on"
time.  I haven't tested the full range of wait times, so I don't know if the
above test represents the only danger zone.  But in my testing, suspending =
the
device sooner is fine.  Suspending it later is fine, but suspending it at t=
hat
exact time is problematic - it "feels like" a race condition to me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
