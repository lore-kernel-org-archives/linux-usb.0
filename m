Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF02F6920
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454664; cv=none; b=dg7/lBZ0QTDY/V5Gh2bw3dZsfmTgW23gDnLt6JEWvvIYU83LV33WsxTVaA8ESXsCwcHk5N4duyk39vGpdxk3M+feijJ8GJwSurdiVtq5CS3PAvpKCBa7cqXtRR84/klGYXziLGIWJvpkdse47T5/3IAZ6zGd3HO+HQo1Ru7mRUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454664; c=relaxed/simple;
	bh=nrvnct/TKM8XiFKfRGO1vIvfm/lLpWMbwQy4oB4Pqes=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JXZguqLBANPmrZpcvoStRMBCf4dCOpcDvjy08wXK6ZpzjXDPlMAX+XptuoDnjSsVpOpYuZylzT0967Y4YbbWZoJ8gwGXxNG/ztqgi/X7m/QlgC0bEsW5ReuXL7CSGB2QsIr83t5aD6FLaISGeErkyuwZHdqujnI5od6/3bi3ohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTi0XD8G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTi0XD8G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFA7EC2BCC7
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 13:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786454664;
	bh=nrvnct/TKM8XiFKfRGO1vIvfm/lLpWMbwQy4oB4Pqes=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oTi0XD8GKiIoWzueeXWOe9sOEVTSmkdJDZyA05qOL/AcsdPl1iN62139+DsNywvWl
	 N8h01aXrFbQUw9QXtlQtXmzHV1FjGcLQte6V0aq2rr17DMQc4IwAjjW48VRI7tc1BI
	 +boVd8UscR1/k08EHeIknAnOabQAPZxGQA3LWr40pn87d0DVXu0iCxy9ez6WiKJLdx
	 ++sh8I6MYBEh7QxC+3e7/auATpS0WlqqTE0GOK1iRpUSP6TmcHrza+I5QxICti3Rxy
	 DjqGb5SGijSNqwt998ryrHlSfNIRAy5Kqyrg8nP7mFJZqgRVxOPp0EzHo2fRklkHoh
	 dyPCxwbMEQZXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 92A25C41612; Tue, 11 Aug 2026 13:24:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Tue, 11 Aug 2026 13:24:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220193-208809-4uistJWqzM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

--- Comment #3 from Wei Huang (huangwei@kylinos.cn) ---
Thank you for the detailed testing and confirmation!

For reference, a formal Tested-by tag has been requested on the mailing lis=
t so
it can be included in the patch:
https://lore.kernel.org/linux-usb/20260810091322.2201740-1-huangwei@kylinos=
.cn/

The patch is now awaiting review from the USB serial maintainers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
