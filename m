Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4907B2E414
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 14:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038363; cv=none; b=BlOvBCZb0H7yPYebHmhQTrIF7z6a/DqiagTxapEjuyyWmeLBjI0poIf+8p2tSn81AEHusUX+GSGyR7oQN3Bcn6VkqJZJpnSMytP5vCAXbRfDPXz3yzSQKcT5Y+DACXfCtOeEwBXnHFhUCCjaIiBNy2L1mBPuY0BtEkFKIqIA2Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038363; c=relaxed/simple;
	bh=hsii6QvWPezbOQHqhtjt+xvcMKpm2/7HfcDmFFo0OKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DR+3/XBpOdOPlw8jZ7RZo10/JkIW7FvQg51fdO6ymJGU8leKfDPD9KDji2ZS/O4bzPaINC0+GsMmJ7IDgKy4HiO8pHiBQVmCtUAKCkMkGk6h0rd5alOgmkwKcmo6mg+chdi900P/wlZ/8jy980EyWg6BZMHjJcEuqUic7YR9NBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c67f7oCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c67f7oCV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE52AC2BCF5
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784038362;
	bh=hsii6QvWPezbOQHqhtjt+xvcMKpm2/7HfcDmFFo0OKE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c67f7oCVcc3dCykU6e/LKZ3xiN3PA/vS0US8Do+uOJ5JolAhLS0R+kaCa0rL4SxcY
	 fAxoVh0PfvF8+j1u4danM63cOZtFg0eJOds2CtAazxCGhWGihvB+Qws8jVs/+4YOZa
	 XqHDLCpH5egRCXaS/B94zEXkknYrh1Fm7dqyaDnkOaKUzwmu7PjLfArPP6MvOiQ11l
	 hSJHju1O+5YlHpyKVcxh6pj1YMDuJ+65Od52Y9d9t/WvDk6l1PTXP5AaL4Rr/yrJ6D
	 rzIqU4NxG2ZTB/IaoINo1Dero7jl3sKpc9SG6OClwqV3rAnHwrEKZUlyutDOOo4OKs
	 9z/RU2lkp0WJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF4B9C433E1; Tue, 14 Jul 2026 14:12:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221655] Barlow Ridge TB5 tunneled xHCI (8086:5782)
 runtime-suspends to D3hot and fails to wake on USB-C device connect (Lenovo
 Legion 9 18IAX10)
Date: Tue, 14 Jul 2026 14:12:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vuo9gt37@addy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221655-208809-wKAszJjJgm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221655-208809@https.bugzilla.kernel.org/>
References: <bug-221655-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221655

--- Comment #3 from vuo9gt37@addy.io ---
(In reply to Mika Westerberg from comment #1)
> Please remove pcie_aspm=3Doff from the command line. That does more than =
just
> disables ASPM (effectively it disables native PCIe). If the problem still
> reproduces please attach full dmesg with "thunderbolt.dyndbg=3D+p" in the
> kernel command line.

(In reply to vuo9gt37 from comment #2)
> (In reply to Mika Westerberg from comment #1)
> > Please remove pcie_aspm=3Doff from the command line. That does more tha=
n just
> > disables ASPM (effectively it disables native PCIe). If the problem sti=
ll
> > reproduces please attach full dmesg with "thunderbolt.dyndbg=3D+p" in t=
he
> > kernel command line.
>=20
> removing pcie_aspm=3Doff, my apologies for the bad ticket. please delete =
this.

removing pcie_aspm=3Doff helped I wanted to say

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
