Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F772F28EA
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 05:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698169; cv=none; b=XPhNjQOhDARvLX6SOxRCmYteW4n6zOHmVyeENU/IDC1eMljWdsiQzjUF2BJFDcp21qFnorQK31R+lJdJjESDRNmxlcJP5etolT2JCc4pVDMcQkHD7IVQDjNSf8l/Sy+iAM1CWoWzGcBSlFCcEzug9AjQusk4cKUROQdv7l2yfZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698169; c=relaxed/simple;
	bh=7imDamabQ0st7VaerNSwZAuWfrGW0HViNufdNQI8pEo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hxMx4KGfFSdoZddrCqIp4Ndq+lV/MaIQoACE+z7M2rmE24CObnrrE4iu4gkeZ2WnpIxsxWqobx0B6+Z4biO7kBTrMkku3j+/HIsFKeFV5RpKpRadDUh8SNHIHXpgSe2axyXNxOkHn2p0BQp9nEH2IIWAGQRlPrWs+Yty54E+EeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cu+ZK0RG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cu+ZK0RG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B6EAC19425
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 05:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784698168;
	bh=7imDamabQ0st7VaerNSwZAuWfrGW0HViNufdNQI8pEo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cu+ZK0RGvyHR5qkPhc2v4WFG/ZJjl3SBLUMh8ElZ6zZ74Vjr5oPniHpZjlsbrLYHx
	 63PcdoeeuOFA/zsTbJqrB6pYKsEyBrnJdOwdoYTYasH/o+AW5XbpVLswjPveJAYZup
	 kTAlFvWcMWnmxNiS4A+C0Q/jqIBdAy36qbHtjVjUC28ELfpPI5MugBCOcn+D29WJII
	 nqULmI7z6WgB0MZzyCyKWvs4QI/8rkK8OgVI+YKlnEjw2Tl72mXn4zTQEW3x223mAb
	 KzKH7iXXavBEqxpCEqbJbxkgVKY2dQrbAbsUDIkJTfMqRTPOfW5+u482Z2jzqyyAUB
	 KdOGkx7to/V8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 867AFC433E1; Wed, 22 Jul 2026 05:29:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221776] HP OmniBook X Flip - Broken UCSI firmware / Slow
 charging
Date: Wed, 22 Jul 2026 05:29:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221776-208809-KGIs1oFi7Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221776-208809@https.bugzilla.kernel.org/>
References: <bug-221776-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221776

--- Comment #2 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, Jul 21, 2026 at 06:30:50PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221776
>=20
> --- Comment #1 from David Del Sol (daviddelsol1998@gmail.com) ---
> From: David <david@david-desktop>
> Date: Tue, 21 Jul 2026 11:30:00 -0500
> Subject: [PATCH] usb: typec: ucsi: Skip UCSI on HP OmniBook X Flip (broke=
n EC
> firmware)
>=20
> The HP OmniBook X Flip (Ryzen AI 5 340) has a non-compliant UCSI
> firmware in the embedded controller.  The EC rejects all write/control
> UCSI commands (SET_NOTIFICATION_ENABLE, PPM_RESET, etc.) while
> accepting only read-only commands (GET_*). This causes the UCSI
> subsystem to eventually corrupt the EC state, resulting in USB PD
> negotiation falling back to 5V (only ~2W charging instead of 65W).
>=20
> Add a DMI-based quirk to prevent the ucsi_acpi driver from binding
> to this hardware.  Use NULL driver_data to signal "broken firmware,
> skip UCSI entirely".
>=20
> The user-visible symptom is that with a 65W USB-C PD charger, the
> battery charges at 2W instead of 25-30W after the first UCSI command
> exchange.  The workaround (removing this driver) has been verified
> on multiple charge cycles.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3DXXXXX
> Signed-off-by: David <david@david-desktop>

Please send this to the linux-usb mailing list, with a proper name, and
we will be glad to review it there.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
