Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FD2E8B83
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 21:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770981; cv=none; b=dFEy1xiD47yhwq3rUaYUA7FeI9VKYcWkNU6+JUdThc//3l0zLeoFY2BCXf8aTh0aMwsJeVwk5HN6Tm5ZggqGHT99Zs0heJmElfzqy82jy5bLul9aWE/Pc/j7hyjHDh7ZP3eUyyp59pwfVVNAFJfclWc9vH35T2DROqOoifxlI+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770981; c=relaxed/simple;
	bh=lD6cJfoIU5R64aA20dkUISqOtbyPIcgzASKpuXd3paM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pp9i8Yf2t9HEetH2AdCognKUoa9FN2TvF7tWWdnXJMXbpBzruq8nGB1XeSapA5SxI8YdCDbBEglS9mUvVUJ8ooPJYydxoq3WQ+CJmcZCConFZpqkCMwZLL6xbxQM4zE/euYMKAYi1eFifTTGXFTwxFvsxjL5R9/H0KWM+je4ttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4N1nxuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4N1nxuO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE3F8C4CEF7
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775770980;
	bh=lD6cJfoIU5R64aA20dkUISqOtbyPIcgzASKpuXd3paM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P4N1nxuOC+5eyiDLGhCtaBNbXMdjRaQFjyiSjLFyrK5X4UR7h8f0aa3NHgl9hT7I9
	 mCr8YKmFnLCAtadNlT+w5RXxxSfcscdwNQ+UBdAT0ytVRBu7jpt3C57KEZBuO1t/ah
	 VNtiiXA06UyvTFBdrp1ir6kiC4JU1FX8H51mR4ErNY+tE8DDO+6H5+t/Y+GvrnlBNg
	 BJSph8J6vimhiLXyK1lYkEjV14l/VDMB9ju1o7ETHEakGAwa2fBI8NgZ2ACIcOppGw
	 KP+wEWAErrDA0Cq5nCz7MWUe4PMTQmBW3hKIlul6YOL5LMBlcsq9wOzBdDEFAUJSB6
	 7yzjmd2FBby2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB6D9C4160E; Thu,  9 Apr 2026 21:43:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Thu, 09 Apr 2026 21:43:00 +0000
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
Message-ID: <bug-221340-208809-gM7lDUajKi@https.bugzilla.kernel.org/>
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

--- Comment #2 from DaisyTheFoxxo@proton.me ---
Appears to be the case, yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
