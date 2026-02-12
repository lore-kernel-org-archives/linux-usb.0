Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDE23F424
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884822; cv=none; b=efqCsEibobtHbnBppA2+jG5QOBtT3pMofI9FXd/Nwg4/D+bLv/a/STLaYupufnrFsmd/vDwGMbvAPOZoJnIiJxy4hLYkN48fBgmd2MIJpyDaExqHiLg30DymDsasMBv7q/MECtHGiog+/ckFzGyy1sZKq8V/bM7poXZGf6gj7wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884822; c=relaxed/simple;
	bh=9tP2aoQddH1dENJlDi6e2XhvXAgAo36oGe2LEChfZxY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bCVaVuRwxlADiy3AnM9msx1bzZBLPRpSDDm6O3LAeDhQCYj5SV9d16Vs9HdM/qLMxBnNX58eUcyNc7fmv4jezB4hxpfjaTruPD51Iz/567O4SoIgs6wkgiWEW6tZfiAImGqxboiGXfXA0+gzidUuL7RMqqfP7Ly9t3hDBVaw4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tarH0xjr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tarH0xjr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A8B9C4CEF7
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770884822;
	bh=9tP2aoQddH1dENJlDi6e2XhvXAgAo36oGe2LEChfZxY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tarH0xjrZyIN4y/8gc+Pj/C1zOYeUuLau9aU9dFmySkmGNi0G83GClCGw0nVG0Y9K
	 NcnTuUF9Ru+/qGNCaDuSAPRqaPo7rmUeOkGMVkEexKbJ4vZGwhH/RCHNOBe7A2CpvD
	 62zIcXPB8zvUpY3QvYRClnvHwyDAXfMRWgSumJRf7n8NulaVT9alu5wPZaLJ0aDX0f
	 vtEkOJAE8xhpz5ehL3UMTdT4a5chxA2SKQe8NGE7BBJ7DYgLV3o1kfriTt+j2FvN5R
	 xM3xuyAG3wPASdZl6/6aKurMRdh31T7pBhxMl80nuRm9XURSv44VShMP5z+deKrmi3
	 m7el8IkLek8aA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30188C41616; Thu, 12 Feb 2026 08:27:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 12 Feb 2026 08:27:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221073-208809-Z6VhjLZE7l@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Mario, please take a look.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
