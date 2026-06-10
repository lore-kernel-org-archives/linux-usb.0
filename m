Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A253C277F
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087609; cv=none; b=YVqQnQq1YEz5/EFFf2Gl1ZZ/OML3V5FYmHg9I/2ne/b595wrS7FdJW/TOxciRrYY6cTAzSW4J7MvlJrC02Ekv/u6OthiHkLUyBDVGI/wxn1S7USLcFenKJI8oihMEegiKSzM6VNrtht23/dx56vBugK0W1T3ZMHeAvXRagOTudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087609; c=relaxed/simple;
	bh=c/Kv7OelYsG4cp7wZceSQyEBwaZyvT4KiKUvJmUeMnI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tq/e5kpffBHKhGowBZsN4t/QVC/kx5zhyS1e18Zod8U0In0SeHisfSqpYdTO7COGmkIK4T6AYKzB4b/NvkG1L2wp2ePpAShoRETrhsReX4+X3UBXF1aWG+MScheo6NzWB9pQKBqpBw/VQ0W148Ro/RoxZAjAaQ06cWqnOJtlMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6e3+pxX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6e3+pxX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67757C2BCB8
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781087609;
	bh=c/Kv7OelYsG4cp7wZceSQyEBwaZyvT4KiKUvJmUeMnI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O6e3+pxXrRQufmO5QsuLMqMzpl7YNz+PsCnTVl/tpk3MKoMFWckayMtXncGYmNH7Z
	 dpTTzCZPBqolOWTwBBwGCWgO67cmiLFvGVi4dfsW/SOqBlP39J/mflAu7/PffI9CY6
	 vOWXOWShTMJAWa0l4L4ZWZw99CeXCM+SOwMIlSs1WGcbdgBjdR4xTbmfFKwsCLVSY0
	 +h1bUI2ZdvuGQM9yNqwsDWH7Frs8WAvAWjPI5SJcecmF5ExKqTX27+pIj+3lnFcnxQ
	 WlAV57NnSImFKnj9tqpV5RZy1y7db730lrE8xggny9dUHH3nywigtG7nX2siiXNRg0
	 Kv/WSGEwI49gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 436F5C41612; Wed, 10 Jun 2026 10:33:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221633] thunderbolt: hard system freeze from repeated DP tunnel
 activation failures (LG UltraFine 5K dual-tile + active TB3 cable, Meteor
 Lake-P)
Date: Wed, 10 Jun 2026 10:33:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: allan.petersen@vocast.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221633-208809-z2ItnTfANw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221633-208809@https.bugzilla.kernel.org/>
References: <bug-221633-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221633

--- Comment #2 from Allan Petersen (allan.petersen@vocast.com) ---
Created attachment 310292
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310292&action=3Dedit
Full kernel log, freeze boot #1 (Ubuntu 6.17.0-35-generic)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
