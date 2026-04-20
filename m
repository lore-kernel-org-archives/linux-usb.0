Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A82772D
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708275; cv=none; b=oDe3/gZxsMa+aB93d0J4nZV9ZoEZuT1H9uzifmz+zwXRRnd2Rf8ECuG+2jybSIIWvW9G9UGnvOCGN4EuDvOaJU4HIUnkKsryAX3mf/FM3+XqTvABDJwx3v09FstGl477/UbLXnP8m/Ujarscxby6WtBRgwhgsgHCyQA9OVrr08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708275; c=relaxed/simple;
	bh=C/AhVsDnHnV7njXlJfWz/VRSeEk7QcWPWSjpwJMjHjs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T9aODN7uBeBoxNBU9Wt8MZp9d4SeGjQ13WMe461GFRPm13ZfJ/FSOKzbrPOCCQHBMk4+qxNdB80HFDEHlypmh5e48G8uUh9x7opEq1q3J67XaWnlWD+HLHCyVq0tVU+4j1oVu1LxV1Xqxbr6JZBU1WvyQwnvjWq3W5Q40+wJZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWJBu4nI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWJBu4nI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17EC5C2BCB0
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776708275;
	bh=C/AhVsDnHnV7njXlJfWz/VRSeEk7QcWPWSjpwJMjHjs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RWJBu4nIBJY97FYC0eWq6U8nVJwb5Jygx6LlKTKLIKrBBTxosu2NS/UUN2VyYum5J
	 j64JNF8rkR+K2Z0VDCW3VM30keQqI8HHmDxUzbcyvuG2I1bvU2XzalM9KeFeHyORFd
	 BqNsvaopAUDjM+eUOa66U8ELyLs3vJH2pOxz5oeDAMPinr1F+i2Er4n8Vy617gT8Nk
	 R36h7TPRIqz9PloD7R9RRRm5DVhCfUM3OQ95Ciyc+/qtPRKuKrI9eyJP0FsNiKjWoQ
	 DsxCbaNpf6MrOgxeDeXyECzA+QwOgFEevSYJfTtEW138JBKGqhTefrk1bZPqaSU9rF
	 rZJkG48QZj25w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C09BC41612; Mon, 20 Apr 2026 18:04:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Mon, 20 Apr 2026 18:04:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-K1jntDlQ1u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #13 from DaisyTheFoxxo@proton.me ---
(In reply to Oliver Neukum from comment #12)
> (In reply to DaisyTheFoxxo from comment #11)
> > Nevermind, It happened again. It took longer this time though
>=20
> Then please try the 'm' quirk.

The problem still persists

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
