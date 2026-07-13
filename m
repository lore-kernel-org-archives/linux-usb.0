Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAA3416D13
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947992; cv=none; b=OANVyPUsYf2+yZw3oavzBknMBUYUrfKKlgssCtHv2ajoAQTF1ax1ruYnX18IQLDRBYNrKQ6xCPVj+AgxKzzjgtq65aPbtMwRT0s1teBkoro4WT0PgTelEWzXRp5Mhrc9yj/+7/LUDPwNJK0KZABnJQgV3ndzOM28vgH6JZVgvN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947992; c=relaxed/simple;
	bh=6tTXQIyqyCF03Q84o0pVln392CLXc6q2nw4AAzJusnY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JTIOoq2qPjeu3mE9T+xUVO7UjpD5Ezk09hDyYv8PpNqEKXdkHsN29XIPwFrUkx08oq1P2pA1SoLM/AqROP7GITDXNnsiZrgl3eIT3vPUf/bTQ1D15Ncp8lpkDo1Z3PE4URsAoQHN5ELzL/vW8O0t/exRX9VOSaR2UQdNUXSYFQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JamR2cpy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JamR2cpy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F947C2BCFA
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783947992;
	bh=6tTXQIyqyCF03Q84o0pVln392CLXc6q2nw4AAzJusnY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JamR2cpyPMOxGCgTJC6GzrvYeieKuwb9s+RjgH6iVTx264kD0We58SdLKTLNvD4me
	 2pUBgBYF+Cm/WyoP8MU3/KqvUjAYc4JyIFbQW3DS0vXMLx6udXSPmDBLGOxnCsA/va
	 QeiSe8osOvdRo7eJgFw43X74zaYOZukgEichby3egPHFZ1XXxtrF33HlZNjP0cSGwb
	 ewp5jP6gKmN5k7mlxRZU22vWTqxvaqb7v5gj3L6WBL7bDO0B9HMlcO/sYk9ajopfha
	 Y1kN6sjlmZgwGKXYcZo8KE6urdhiA3hKEg1/zdgQAkBAlnv6MBNcY/7OzSZGIxvdKN
	 03ypKmVcOjKYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 303D3C41612; Mon, 13 Jul 2026 13:06:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 13:06:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-iZvSvNvDB2@https.bugzilla.kernel.org/>
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

--- Comment #54 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Sorry about the typo.  It should have been:

        if (adev->flags & AMD_IS_APU)
                amdgpu_setup_apu_usb_power_dep(adev);

I'll post an updated patch shortly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
