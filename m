Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B185569F1E
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 20:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713614; cv=none; b=HXYJdUJSJUbKnNzf0rjYwSrHVp53qw3mDSxQiblmdlQoBescB9pcaBrh8eeDrYpe46fIYKC8nUOsiwQqzgbmyRNGuSwu/6LcMc7JjLNueXuOUXmVuyiyW0tDHTaU+rYlfaac1LBaMgxB/qVHlus+ZIegOtSuaG4IMR9bOUbQ5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713614; c=relaxed/simple;
	bh=Yp5ItAO9V1rkDw92NVd218dK0B2joFXpXAYNh8X4Zso=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q+nfPMojBPLlFZNsLxWcJXJKvM+VNzuP64YK3XiWfN4fIe+6Mx0LKss0B44NE55N5D94LzJQLdkUaiRrbB9p58sGkSYfm5iFebCo03BnprzOLK5Fp9YQIe0glIFgwE8T7PczDRgHSu2tCBlWRapUWJL+0azvPPMutimyh43C97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qm5itKqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qm5itKqM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34912C4AF14
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790713613;
	bh=Yp5ItAO9V1rkDw92NVd218dK0B2joFXpXAYNh8X4Zso=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qm5itKqM6NvTjJOsNAOTg8gwWa3C7cD6VT7F4/ydwEyEsw54f/U/ml6I3tK6FKWb7
	 3bQlhcmSSuQ6OieHhoyuvyywfftJc+ldiyNI9Tn1y5Gv2qiduKDULM8BDVsRt4p1eI
	 2FXamUinknUWx9bSpwPhORtqZilW9CyVALOtqvJaysrJYl3ASUQ+mdNjwTWH9j/OOD
	 DsTaQewyp/S+MuQkejznH8Tw+MDZzLC8D9oH0EkbWkjKnmiEsq4gXSH3Pj2NgKEIuo
	 ym3701JT70c0OXqDwRlDyx7rdFOTLHpuQqsLG9UbeEWIduW/tizUZ8kqTsUScJPJPj
	 mggiSQkq8h86Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 187E6C53BBF; Tue, 29 Sep 2026 20:26:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 20:26:52 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222071-208809-VgNQl99x9B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Some old Intel chipsets can't calculate bandwidth allocation themselves and
need babysitting by the driver. You seem to have one of those. The bug(s) c=
an
likely be reproduced on any hardware by specifying xhci_hcd.quirks=3D0x120.

With quirks=3D0x1a0 one may not even need hibernation, only suspend.

The other controller is ASM1042, one of the oldest and buggiest. Mine does =
the
same, even with zero connected devices. Maybe they just don't support this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
