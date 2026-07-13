Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACD33E348
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 21:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977488; cv=none; b=XpzyU1jwl8neGl5D2QZc43A0ZOFIhvLOe93RWSZZbx5ODEUkYViWgbGSPZgEd0G1KPyny/9e660zr266VF7z1Lh3rQpyx4TyM0N7WO/7ZrMm954G9Pfvr4Ni5z5b6HoWH5GbXiOINWxe4f7off4B9OvyFKHfhilYSgK+4ShxdXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977488; c=relaxed/simple;
	bh=H4k/GQ0QQlPGKvIYJpEv1tWtxFmZehyqe+QwlifGiqI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YxjXqodbhRX2O9SnpV04Gb5ueLxBQHVoMUuvt2KLrOausLKcNlJggolaSTyQNfM/nN9aNIqY/1k7IUXcpblNKf7Ng0pQaxjoC2sdHV0tWnl7HAmNIVcfmbovfWOqD2vzVLPH2D41cu1zPXmbushQX7stUr/IJl9z55pHQGaplUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjzLlx0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjzLlx0e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BB65C2BCFA
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 21:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783977488;
	bh=H4k/GQ0QQlPGKvIYJpEv1tWtxFmZehyqe+QwlifGiqI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NjzLlx0eUrWlzfTNEicU4Kt6LTJ19FC9nPLEm6iIOIlfiBThwpu2Jtn+FSPAlPYlb
	 6wz0vkqhpV6mY9IVyqwMwYu55/6dOhneOdj9204lYYcJIQPPu7RGQgFXK+c0j2G1+u
	 +jSe5WY4tQbHG+rZGvrMCDZsNwW1KsjaLvIeZkWjKojzLjRE/x/8cIQtjAsIC4uJ0u
	 Ygf9fsbfWyiKgK+fZKmlaPyYx/ocU4zwUuF0V0uLjGpnIM17TqJQmnuZj7Tsu8aZQI
	 ZTov5MSdf8vyIiRocawj49ngFg2nsVTs9seUSMQMoFlvqhAH5juV1WmRN175gUOyYl
	 M3WhN3EAGuhVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E0EFC53BC7; Mon, 13 Jul 2026 21:18:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 21:18:07 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-6GYxCwdqa0@https.bugzilla.kernel.org/>
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

--- Comment #62 from Alexander F (superveridical@gmail.com) ---
My bad. I think my gitless (I'm on a usb stick due to zfs) revert practices
that caused it. I deleted the kernel sources directory, installed sources
again, applied the patch, and everything works again, cycles without failur=
es
included.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
