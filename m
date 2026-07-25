Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69924908A9
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784968449; cv=none; b=CV6vLOAQ2bI1ej43AVPpNBoFBZsweJhA3W/MuLZ/RJMonmUthTjrjAmQhOMUnaGrmYljC0gUtII70GYZF0U1LCJFxBNV6kxIQXGmBNaWsS47bTm8hgj2BgXjX/GoL/hIjPwS3y+nfjs7BNIyEdHRepLBRN1rF9Y0aI8U4U/MD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784968449; c=relaxed/simple;
	bh=QLDo+vmnGAExaOUC0KR/WwKPG+ZqpqmBtmtWQWrBZLQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bN9VDkiBtfFngih8ZF8teFA9FFht+mK+QLLWxW80WPKaU3SnkjBL9c45ycRlGeGWS3Dco8mdNTmZ1XcQyYb0P8+AqYKNDl/s/vesmq0yoNTiogJFGk6xkl2YL1fhYvdYL6RjLWHXUsy/LWRgjXsaStHahwXI8Eui6ptfF4M0GX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7AmU4g/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7AmU4g/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 525D9C2BCB8
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784968449;
	bh=QLDo+vmnGAExaOUC0KR/WwKPG+ZqpqmBtmtWQWrBZLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l7AmU4g/ldq0lQKy95mu6DCG+bk8yQTpVSn6ZBxotoKHqVl12Ze2BtpjnVJ/fwIq/
	 F9OJQH8k6HGmdAe6aR5qA+ttfxhzaYTlAGUUirlkfy21J516JFCyE7sWTBP3YyeqE2
	 RmYcPlVusSKfxUXuLJ2GeXO3SKEScQRm+zg9h9CmwLKI+wy2CqAD3JRSrsh0gr+uWT
	 mCTfiTzkHeO0k52xFdRJa6Iqr08nAsJTjJolEmKjtn1iBtZmF+CO6l6O3ijELYCpEJ
	 pWAQReESSgTgwnOkmVxJ5Ihk1wkxkmcuDu98lSVHJHgBuiHavCSLPO0daYAik6OyVx
	 TZsybL4X/5Pug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EB055C433E1; Sat, 25 Jul 2026 08:34:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Sat, 25 Jul 2026 08:34:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221785-208809-ytM1rntiHp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221785-208809@https.bugzilla.kernel.org/>
References: <bug-221785-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221785

--- Comment #8 from Artem S. Tashkinov (aros@gmx.com) ---
Is this reproducible in 7.1.5?

7.0.x is EOL.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
