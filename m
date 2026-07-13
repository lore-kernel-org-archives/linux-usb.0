Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19631355D
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783912809; cv=none; b=HpU6JNo1PvSLPScqqQnZpSsu4Utyn1cw1zvoLPAJ0Zqwc0Ew2ydV9KFuuISVOdhoXtsq+ruvxLiQtBLxndRHJHTYfBh/yqUyu11QihQJC/Tg6tKElF13lyqmIBBEFtuu/xGlSIam/gKysuWxW2SyKnnDmUnDa15vJu/qFJaKjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783912809; c=relaxed/simple;
	bh=sVJZZSEsb+klNVh9aM3jklMP6R5385OohzgRW7hmS1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZJPxbjfYwu7VuqfM4+GhnY+GIPNCeTcHQUKN7kIwy35r1g10YRk/acd/kgM8w8WvN7uSphCYr9gQ5a6pIve0SFbVamcKJ89MxeIe88AfiuK2MUlKMcljU3sD85mUiFbTkpyWXjHZcfynl2wIF4tRiPQgLv5NDlYFppaKffFYNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZQbMzxF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZQbMzxF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0157BC2BCB9
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 03:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783912808;
	bh=sVJZZSEsb+klNVh9aM3jklMP6R5385OohzgRW7hmS1M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WZQbMzxFYNnwPX8Xy6dXHfVjwK/U1wXMjsh20Ox8cFRHazHMQfPxmjjINgRg36dQH
	 bBPVUuk2wtzl282Y7MJcevERuOCOONeP3eL8Iz1DO5V7pZfnWz/XkD0jZOyOHQXOHK
	 8PUtbXfs+FtudJEagYk9zwyhw3T5Gav94e8zWp1L0niezQMHNRgcKq/bD/1yZqoInn
	 oB7W2XHWKP9DzPvpgxZJod+8iW/j8pzFLC5zVYu0gQxPDvkMMsyUkJqMzVSAb7jemw
	 NNiRLRJbVSSpzQBWDuJs6LIxuRfKF+m3dvizNk/6iYxoF04UYo6WgTSuUchPm6Q5qo
	 B3MI2qJgKygiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E3F86C4160E; Mon, 13 Jul 2026 03:20:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 03:20:07 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-qyFquPsaLv@https.bugzilla.kernel.org/>
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

--- Comment #52 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 310440
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310440&action=3Dedit
possible patch for device link

Thanks for doing more testing.  I still do think there is a race going on h=
ere;
but my current thought is it might actually be related to how long it takes=
 for
internal restore of the GPU when the VRAM is larger.

One of the proposals was to make a device link via a quirk, which doesn't s=
cale
too well.  But we could try to do a device link when an APU has XHCI and
display under a common root port.

Can you try this patch?  It's intentionally going to be noisy at probe so y=
ou
can confirm it actually made the link.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
