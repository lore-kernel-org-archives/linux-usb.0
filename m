Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D334D3B9
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524614; cv=none; b=O5vmoriaaiCf9rNbKeVdbKHNIi4MXiQMS8c53VlmcmwHOy8U6X8XGDRdgp1EQs0pM1GDX01xRFqupIVm0RAtsXg9gnfMzB2mh2EuBH7T7e2wpXMyIzA2Qih2FF0eT0aBRV9NC1WF9vzWYUfr11RJl1+64zNJmQeEtK+b9KSTzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524614; c=relaxed/simple;
	bh=6kbE/zLg3htCiKAXONhBVmDl6hSb+qbb38G/Cv6Y/A0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SAzD2w6kaSnDmXOtJ4Z0k7e4owCbLfEb+Wqeve+wjFYE1frwXppjIvXq1lolU7ZDQ9pB5SliF8QHlTvPJOQTEf0+ZU4RLRRxmNfcghFnYVCR141ZtJ76v5zbBks/Yerzpo1f55mJACTZOsx2Cs1jhB3kflP8ojoejkemNSXUCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5kJEIH4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5kJEIH4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9764CC2BCB9
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783524613;
	bh=6kbE/zLg3htCiKAXONhBVmDl6hSb+qbb38G/Cv6Y/A0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z5kJEIH4cBqO96kHTVjA48ssH//O1omRj/dw1eqqAj4pgcEkZJPGXs5rLb16IRVsB
	 LrVWvvvnqIjy7k5dw6Q9YrUjs4kvYXZrikRdohutdPIq9rKWuaFCD5fUnIoYuWlcLn
	 eQIZyIKOkvPjiz4xakq7pKeZF1A4dxPxJGNeKPGq/I+8/pBfWM+Ch7KRiBUzIKKWWI
	 lJ51b2jrfXV7MUiS/HYjI5dtjMirUDiMn/BRmXJ+Agvya7dIh8E0vlk3MqedNWfMqV
	 pp1YUGO2ginUqQSpl0mqsBnEcaBnsb9cjBhdZf+a7QJbpVDVLYhQwPOLy9ZE1uGVvc
	 7pDEGYiByM1Fw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88BE2C4160E; Wed,  8 Jul 2026 15:30:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 08 Jul 2026 15:30:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-Rp2NIjhYM8@https.bugzilla.kernel.org/>
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

--- Comment #46 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Could you guys have a try with this patch?  I am hoping it gets down to the
real issue here on the timing against the PCI spec.

https://lore.kernel.org/linux-pci/20260708152650.536604-1-mario.limonciello=
@amd.com/T/#mf3d1a208e6144529303e9cb224bb456fabf685b9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
