Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337CF4156C6
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560500; cv=none; b=XfK0lQbtHV7cFkFSpJsOmi6zv1HC7QlBrmAekYUJkLlBPNdWjx3/XVKta4RdcEXGLOIBishLZgH4FB97NXqfHhS61p0/lSxu8sxWZuhCZrLi/eVXThBfBNEMWVAMoo1cZSN1srzCWnfMxe4Mi0FdzxkUesLuzmJ+LgzM5+G3pm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560500; c=relaxed/simple;
	bh=3uHroEKYm1P2X1XkTCIkLocjlcMuKbwyBaJoMwumvzo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSGlH+wnS410hCwytFQKLici9kLNfPDY05aEETwcMRZcH+VwIY2bKVtY43+H/dy/QROPwMVj0A4oXV1eONWLSafDWtbR1djwotBdZoO3M9Vjz3yBwFdIchAStD+7KT4g5q7pbTcrL8ryIusall2K2X+tXRTjNC+KJQ76tVWM438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pk7fpdnW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pk7fpdnW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B47E3C2BCF4
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791560499;
	bh=3uHroEKYm1P2X1XkTCIkLocjlcMuKbwyBaJoMwumvzo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Pk7fpdnWGpsNhSRSaXm+E6cwDNW3R4MkglHKiBwIL49Jq3hmolFZoErS0tjxkjX4Q
	 VyRCtOQvDGWgAfGd+oGGFk59UwWTaa5baE7nu1ej6pLwqVbBs1tECvNDuFeJifK7rP
	 sZhf3GiLy6opXkCAi0YpcaCqSeIhKZe1U3fsajjcc/3845a/77ZWU4pYfXV3zWSA25
	 7Douoe7pF4MkNA/Xrggkqp/JuwlOKVJxU/iEEbIC5OnqxM9+qFQBId9p5TsrQHGQoL
	 pnHExebKZHFqmtGDWli1WFUCkoaFll8ExAw8PRFXaBjTXH7NnjExFRVyDccvb3czCH
	 yy3NDrVdv/dkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 979BFC4160E; Fri,  9 Oct 2026 15:41:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Fri, 09 Oct 2026 15:41:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: splint.em85@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222021-208809-uvyILYxNTP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222021-208809@https.bugzilla.kernel.org/>
References: <bug-222021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222021

--- Comment #5 from SpliNter (splint.em85@gmail.com) ---
Update: I'm now on 7.2.9-1-cachyos (not vanilla mainline, so I
haven't tested 7.3-rc yet).
On hotplug the charger now ends upcharging, but the state is unstable for a=
 few
seconds.
udevadmmonitor -s power_supply after plugging in the original Dell adapter
shows within ~6 s: 4 change events for ucsi-source-psy-USBC000:003,
1 for AC and 2 for BAT0 (I saw "not charging" briefly, then charging,
flipping twice).

dmesg shows "ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)" not only
at boot but on plug-in as well; the latest one (409.498) is logged
right after the AC change event at 409.34, so it coincides with the
hotplug.
Earlier today it stayed "not charging" on the same kernel
(at about 70% battery, it is allowed to charge up to 80%), so the problem is
intermittent.

I'm about to test mainline and patch today and report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
