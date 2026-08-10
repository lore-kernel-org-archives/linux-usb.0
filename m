Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208C44102F
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 19:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390528; cv=none; b=dKY/UtqKE5UZzbdm8PMTV180CfR8KGvwdoiu5Cush3DvHPQ92Xw2ANSbIH/fl2zLd4e3liDh9eJ4jzPH388BLnXHWlU32pUxHxxdAr92P+ElyL4mXNJ+UjCC2bY/WruyqOhYXDdXJ5UJerc9BJPymnXZyPLcj5WTucVoM05B07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390528; c=relaxed/simple;
	bh=DnaUhDFh1L4uxy+hWet9ZjCpORJMt/9nGLwhHfHj/hE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYP3w4eVRoUBFdQMu2kRDiha6FooUtf23ONe1j/PzeQmZmVSEkUJZ8qURWqkO7OOC35sA5KH1/TmlkGQitSfOyWKqR4ZU9zcvAtljJ29CULgQuc12Gv4GBP7TjzvT7ODxJlTjzgLedb8l42G3ZkKsWRnT0Hfwwli38+UWIBhPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4xXRmyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4xXRmyj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE0BEC2BCF5
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 19:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786390528;
	bh=DnaUhDFh1L4uxy+hWet9ZjCpORJMt/9nGLwhHfHj/hE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z4xXRmyjXlXIL1zbdKdYZFuW0VGA3gPoVYFKjlLG5cYlUlRZS7HPXEqMxgdZ9mTCz
	 WLfnKCTZPZomDrb4bIcUE9ByRPgBtcnieOw3FX4Vda7HIfdbAt6Ju9TSjcMpQWQABq
	 EmAdLOZEjxQ3IS2FiZSDyRC5m3lfvpQzM/UTyENkyegj5P1McPPIcbSLZB1BGNu5bK
	 Y74Af7MNw49hX4yizWVNDzohMtU+PZHpKjQBgaRAQOmHOcct/Q1NzbJkwmVJXAL84P
	 5RjrhyLPidqsvsZ8Up8GWgSkneFn4yk9hfLyFBDqHiRfjZR+fAWm8F8h075JwaINXh
	 ZaCvlx7NAVqjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D01A3C41612; Mon, 10 Aug 2026 19:35:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Mon, 10 Aug 2026 19:35:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: lestoppe@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220193-208809-jpnfB6fb26@https.bugzilla.kernel.org/>
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

--- Comment #2 from leStoppe (lestoppe@gmail.com) ---
Hi Wei Huang,

The patch resolves the issue. I tested it on the latest kernel (6.1.176) in
Debian Bookworm. Just giving the version as a reference, the fix most certa=
inly
will work on any Kernel version that uses this driver.

Validation steps followed:

1. Test on un-patched kernel (Observed the issue as expected)
2. Rebuild the Kernel with the patch (The issues goes away. The VDS1022I
connects properly without any intervetion)

Thank you so much for this fix!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
