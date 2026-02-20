Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8F33C1A3
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582673; cv=none; b=m4g69CgKEO5rot979E6gMBM4B1Ed3hrtIQp53p6kAnJmmX7VU+d8ud3e4fzL3M/2wkMQGntareznnOxjnVrizOg8nAqvDmo+GQ9aCybilvB5hMuIDl3HYvPQHpY+dj6fvGGIQTZDyyhG6Bsy2uON/FH8RCmf8XmQjlEgUSXNTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582673; c=relaxed/simple;
	bh=7GgnIMn4oBHh+5wA6jo7tEdqt89i9LNrqqKpCGV4ors=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IcoiETwrTaekP4jCiZeozKS6wekEmXU/G37r4TSyshbCrC/2KUXntLY1jCsPE05SAcv82L7vuAOVj2KS8Q/5NOqBWeajEHGSht0lN6+krmbLVes6+wxcnzVFdbvkfVG498yvimkRTrildSHLmGAwuSCaGi5OGljOJRnQpYQpwJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWaBSr5e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWaBSr5e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95310C116D0
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771582672;
	bh=7GgnIMn4oBHh+5wA6jo7tEdqt89i9LNrqqKpCGV4ors=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AWaBSr5eEyaYbDb9+AuAZsqjKcE0CWf51kRFbDG19hEMWEci/M5Jtuf1vXsUzDIhb
	 XRVLj99GpB+zRFaGrzS8EE3bCijW3Ufp80ZBGEYl/sC14LZC8y2AMvic5KVQTSatdO
	 /GjC0bg2LtYBc/nL8dxkzVFWwi5dB8hyCTgTl5I3kktzxdW8HKf3B0N3QZDfspWl/k
	 WMWyJeGff3F38djwoUTLkDbx5KvIuugSWgn7zCYRZ9M8rACn087bz2eyRtJ3h0lNKi
	 knr3RVnVQXV1vwNStoU9694Gc5cpJUwVS5XshVA3AMnNZCDmH/xmZ50HhdXl4PZman
	 IrH2x2saC1Jug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7EE6BCAB781; Fri, 20 Feb 2026 10:17:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 10:17:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-O79P2APbG5@https.bugzilla.kernel.org/>
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

--- Comment #10 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Feb 20, 2026 at 10:07:57AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221103
>=20
> --- Comment #9 from Paul Alesius (paul@unnservice.com) ---
> > Or perhaps simply this would crash it?
> > while sleep .1 ; do true </dev/bus/usb/010/001 ; done
>=20
> Yes it froze the system on iteration 3000
>=20
> A C program without ioctl also froze it on iteration 887. Doing ioctl see=
ms
> to
> trigger it much faster at iteration ~200.
>=20
> I ordered a USB-to-ethernet adapter in the meantime to try to get more
> diagnostics through netconsole, instead of serial cable, will that work?

If the USB stack is locking up, dumping USB data out when that happens
would obviously not be possible :)

There is a special USB debug cable that will work instead, search around
on the web for one if you are curious about using it.

good luck!

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
