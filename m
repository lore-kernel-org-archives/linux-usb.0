Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449E368290
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923164; cv=none; b=VcsHtNneBu3Zhjieq5LU+MGkP8YYZu7TuKocopR+lX7kS1LFYLGWeoptAr3vBW3NnurqaLCnAqs+40e52bI4LsoVUbkBSm/ArB7WEY+z17TmzeBz5q+cqX1Ms1ZpWYRlA1u+zSq5cB1O0m44UP4eocUAKigxdZGPkaKSgnKSMUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923164; c=relaxed/simple;
	bh=8oxehaWEyVMM201KxKlBnpaI2LbGFkWnoVyn61p0qV8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XLxQ+fjN9TpFQK/YbrGW+0FYpUw1dun3TEPEQK6eZkx0M3rGUARUIrzdLzvZrxsrWiDtR5PeYdI/L26a6P8yc1zEw1ASrm9NqMkHUgPHDlPS/277OHCppG/qkDBlSm0WKBIE15q1bbpE+wVok3YKyxqQu+JN1sb/Ucz6/JcnhmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rG70VY+S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rG70VY+S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4CDAC19423
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923163;
	bh=8oxehaWEyVMM201KxKlBnpaI2LbGFkWnoVyn61p0qV8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rG70VY+SVV/vVmtwzzPRwBUegsgmajCQ72bHVOrE+btBL7ePFzM7rHxYz7EvqqZY5
	 3G+2dQ0XAh1Th8ohj6oYRK+HZ4olA5508tI1ZqoBfW6ANXUYVa21xaaJxtrddxvC/Z
	 JJUvGdLNpM4d9jNAxo0f8YNAB7a2dOzSY+J7SKY7BQx6PeikE2ePJKiIV69VfL5DxO
	 jcbKKEoV2DOx51t2otB+TT/k4l96m4bNcdF6CdTLu+AreEAg8r91n0iruV2ExDwiKj
	 MllTxwIOLVwD1Th5j/9zIMnacVepDDi3/w6dxpE6WYnhQ0bQtWzl1WwfNMtrBd0a/y
	 0/1NoCxbDsQvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A6DAFC433E1; Tue, 24 Feb 2026 08:52:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 08:52:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-6ZVh0KjdKw@https.bugzilla.kernel.org/>
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

--- Comment #20 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Have you ever seen this "Controller not ready / post-resume error / HC died"
sequence without the machine hanging? It would probably be hard not to noti=
ce,
because the whole bus with all devices becomes unavailable.

This is coming from xhci_resume() calling xhci_handshake() and getting -ENO=
DEV,
which means that the hardware malfunctions (or is misconfigured by PCI laye=
r?)
and returns 0xffffffff on register read.

I patched this code to pretend that it happened and I got the same log
messages, but still no crash or freeze.

Maybe I need to try it a few more times, but it seems that real users are
seeing a hang every time the HC dies while opening /dev/bus/usb/ files, bec=
ause
otherwise we would get a separate bug about "HC died" and loss of all devic=
es
when running ADB. Or maybe not, because the bus being suspended means that
nobody is actively using its devices, so nobody would notice if they
disappear...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
