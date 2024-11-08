Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CBF1401B
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055430; cv=none; b=miS8uycysv7ToFiUtyBMa7LBeFd2WEGi4T15yJFKS1r0oAoPGRisF5FvBW8XeL78S0TBWVrARsbC77NYR5LFgH9h7U7WpdFAxOnJlxQc1u/ng5xiTrkGKE7rVQreh68JCw89MtetEXTK95sMJbxOCEjj4cwmN2WYhXkm+gwZZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055430; c=relaxed/simple;
	bh=3NIM1KisJ8ZMXaQqbT4MluU8Ve7ivqOEioFkR6IC8qc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e174qp+nbsK6diQMi/W+RQB/1hzzuc9a6I9aUczIhvTLPW9EDOpK/2d1UcaGcHS5ICXCPHPd83sDAlnExW4oq7v+FcU6Uo0SO5QtYFQBV9cCUy+BVh0FZ0xkUGn7AFKQDa5m1t1VLyosXPubup/IEKLMDfT5p6ZJ2HYhuceMkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ+KWqb1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ+KWqb1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 224C5C4CECD
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731055430;
	bh=3NIM1KisJ8ZMXaQqbT4MluU8Ve7ivqOEioFkR6IC8qc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GJ+KWqb1pQl6zawf44kQ2Y0Wq1wQQJJeRFNV0urDuV94wdciOpn48Sgeq1W3Oykrq
	 D1/ikGztb4UEoZ7KXwqlzQ6HjY65Z3JV0toCknvu0A0291nqwJ4m/ExVu0FdYiQvoK
	 Z+gSxM/qFeFVWQAHWWEv3ZRXQZZFYgSlo6KSBRcUw/785pbGbSuvaeoSpRAu0+SR6z
	 dSu2kFISB88hK/XNyKRf795oHiz4j7CAsnrXtkJ7+Djy7aD/MyhUUveBqYO2I42vwe
	 wE/4JHFI33GistTkcJQa1UaIHWfIDNQa6gi02LFUzbrotzgfQJts7G5FrAd79hzI6B
	 h7Z7Pk+ngVciw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 06AA8C53BC4; Fri,  8 Nov 2024 08:43:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Fri, 08 Nov 2024 08:43:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glite60@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218795-208809-e28L2D8179@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #6 from Eduard Kachur (glite60@gmail.com) ---
Anyway, is there anything that can be done for PCIe errors except pci=3Dnom=
mconf?
 GPU driver inside VM seems to be crashing periodically.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
