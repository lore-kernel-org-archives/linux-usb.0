Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD93395252
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095801; cv=none; b=i0xzGS2JzmIN1I+oqP8r1yWMs6V43wYRnL8djA2sMGRkZ9X8ndW2rRI/9kxd0ZagXgIMsNEcXt2NGQblww1vzBmAueyJlyUghSo+3DOJzvyP321X1euHd6gUxao04/u2B2HYKqOFiFuesxfk1TWXT8cPN0AqJYtClEj9KBXDB6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095801; c=relaxed/simple;
	bh=37byooFZG9Wkuzm/6Xyb0R3mED2iumu2r1tx8kx/tww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hyme1gACG+Nz2k/Z88JjljWs7eDu3hWB/iTLLvicudLuOM5mpNkO825atzm6FulCJ720VDT19/2JQIa2tTTUTRBp3MgENl1n2DXLHccA1XwJUUuQWKK/lXGqNSeP1y18EPKUdPQ5XszqSjleA42MGWia+ubw/+jZrvXQ8UYuFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TD+Bckyx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TD+Bckyx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 038D7C2BC86
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095801;
	bh=37byooFZG9Wkuzm/6Xyb0R3mED2iumu2r1tx8kx/tww=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TD+BckyxKGjGdcQomRC5w/ClWxvAtDxMDTt94ascNsEzACapS8NSLBX02L6BZ9LXX
	 6pz0TnqOb4+aqRQG08cbNzld6iMsGIIZ5hl9uahkxwlxFAnvFhpxHW+bTvXxa1AlhP
	 0NnIGegc3SagHCOAiQRJTgJjBnE9Kf8r2+wl2moan2tdSQ6tnQ7pUU5QV0cjI3Xgp+
	 ne6seN1u9qX66z1fvXFKYkC3+9eJwwRIE+r3OVT9p+A3GFiHZNZnDuiUsUr57CubUg
	 YIGZgtUFAW7JHmWXp8CFNxmusBolC5xIyGysVz69AbCR7g0m3xvYec3O7h/1bT/0yN
	 MtXptPmVSAjvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00A58CAB781; Thu, 26 Feb 2026 08:50:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 26 Feb 2026 08:50:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-2mITX6gXNn@https.bugzilla.kernel.org/>
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

--- Comment #9 from Alexander F (superveridical@gmail.com) ---
Created attachment 309471
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309471&action=3Dedit
Z13 dynamic debug folder after the issue

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
