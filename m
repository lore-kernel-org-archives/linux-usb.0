Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD412FA0C4
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776551122; cv=none; b=EhCOXsTvfQWs2Cig/PjzA765OiZ0vNqOKupppUQPhOuWArTKDoLLNyITETqsOBs0zu0gYtuhZqdmVbpJdNXMt2sbxJ+jCbzVG+h3i6f82VwajvPzIIw0XXbzAYkTu33NSpKoSxRsJTxzDwKAl1I2xLhcY7y164scPVZyli3NjmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776551122; c=relaxed/simple;
	bh=ZVze8v36lT9uTdiGF2LiFYunwww3ayr5D5NDvyvf0W8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mn6EKYUyH/RWTmE/QDj6kTAVg5x9eB/sd2HXAF3dNnBwsVUUuy7t3pQ9ZzJ6sqDVz/vxIqpUZscgUlQI68ROmcZ18+B7eWhgjTkdWSJT+zTI6Us4vzVvaxQVD3xofMYnW0848cJw8lLVGVRcrfI36N2Uy06FeacUVvm5Ue9+Ong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQltcU37; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQltcU37"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09B62C19424
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776551122;
	bh=ZVze8v36lT9uTdiGF2LiFYunwww3ayr5D5NDvyvf0W8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UQltcU37SRYrJn8RW0RKi3kIb9f/QtQ4oRAlT33q37vdVo8UzEolIyTza9nPw2/m/
	 OL+KPIKb6ZxbDJPbHDXEem0os8J9gLZ6TBsez7kNFxQYGLayxsU2SujS2kIkzdKHPs
	 7yF8UcSYe5DtDJqbWfCGS3Vbpi9ti3KLat0IxMq3xDtmdK8XvcFioSrFFIqB2brTwT
	 n3zJwWrFEquN36X94+6aAsn3gnATqnMrB+iDqDy6wzYfAWZfmbBDaIQmO8rSVo6AKd
	 CmB7SjlsbeVrJqQhgMAKF5NsgChcrWGqDztOSPcNlas2SPbepWmp1DXE3SRLSC/QLT
	 wgVZxkt/lf+AA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00C62C41613; Sat, 18 Apr 2026 22:25:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Sat, 18 Apr 2026 22:25:21 +0000
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
Message-ID: <bug-221340-208809-nkiDO4h4AB@https.bugzilla.kernel.org/>
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

--- Comment #10 from DaisyTheFoxxo@proton.me ---
it appears to be working. I have yet to have an issue

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
