Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE84315F
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 23:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773875894; cv=none; b=mVrwIdsazIvcmaKXsY3v4stIwNtLtUXcbvcLFbqTSg0KUKzVAKWzOIOGZZENOrt046GyMvhFjjCOiBAFGsO+BVxG5L4Xb6LmSQhBhlktRt4O46XvphKqKTg8MoP9C8y1d+42s+jmRFCEtidMwv2r3kt57j2GMKG+1rvgD98pmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773875894; c=relaxed/simple;
	bh=GsPJycWz05AB9Yssw4T788CN/FZspw5Gpx/tFZYvOvA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=THzGfoxPt4pWmvSH76l6dwuDAFDJbJ+EpWMy/SzDzER/w+ZGR4Hhncxk2hgbTmhAoCxAlnk2tWAC8qN8EzKI9T89TIA1GI/cxv0ptBvMgK+vTVGuxosdqbCYHc6OX/IuHAEAW0IiNDC4kPpyCjIGQ6euNAZQN1iKQcGOa+RKUn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i35dv4qS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i35dv4qS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43F7AC2BCB3
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 23:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773875894;
	bh=GsPJycWz05AB9Yssw4T788CN/FZspw5Gpx/tFZYvOvA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i35dv4qSCaagwv7RgG0idUfXflu+ejzWib2pCqCsAk+syx1en4kwG0KiiZhCs79JE
	 8Zi3NrlgSwM94lt4fxT00GXH2FVtivN0cYQXWNzx6Sp78SuFRWQQLIFuCkONEDaisi
	 o9fWYecb5hW8Op9l8eEvE9j9wsm97bL1T9NQS8Xrj0RQp4IFd+Tf+dXYaczozqz/jv
	 vVU4/icU6HKwhdL/umX2RbJMTsZ/VJRqAT0uOV4kuIp7y0AH1q31NKco7ZMIv55E/m
	 fTiBdyXRaKWh+V4/wjmmRJ/9E5B4ewiUqtLmykE0G2eB2wClQHTxUoaTQGhX0/uBYg
	 splsFSdC7rMiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C621C41612; Wed, 18 Mar 2026 23:18:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 18 Mar 2026 23:18:13 +0000
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
Message-ID: <bug-221073-208809-Jhsn5edRdr@https.bugzilla.kernel.org/>
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

--- Comment #42 from Alexander F (superveridical@gmail.com) ---
>I'm willing to gather debug data

Perhaps you could test your system with the MSI-only patch(just erase MSI-X
manually if it doesn't apply), and confirm that it behaves nominally with t=
hat
alteration. Also confirm NonFatalError+ on the entire PCI device when the i=
ssue
occurs. That would be helpful for submitting it to the other subsystems, si=
nce
we would have evidence that not only my Z13 behaves this way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
