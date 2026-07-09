Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31183FD13E
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590804; cv=none; b=pl7t1JoKlkPiEtWEmYKaS2zct7XzUikztUwdWCk4vW39zeeUp83H4jRviKDAZKn4wlgJnMd6xs9P9rPWv1Uul/24Kzw+7R5TpB/5Bi6LIw08xbpgOzkJcgJggNog7pa3EhZvfQoMK9b2cG6mngb3Iaeu4NJ1MZKp0v8IEWkwdRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590804; c=relaxed/simple;
	bh=EFA1pQeZZ3wTnjSg3iyWnXHDPpzOQGkpu/ianpCUL1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jSJcPv3DwrWI/lXCP/2aFmMhDwwYfHlVefB6MF/psOMV87r9fhNHK17DgbQXIEw22ZYi51xA9bspIJdeF7vHARfpp4/sGxfZlqpi/ektnnHfHJN2KV8XFa7hI5psl/o89yQDdCUG9oW01uPtQuVsgfmFwKokFr7JLj16CzzEERQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpX1O92f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpX1O92f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82831C2BCF6
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783590803;
	bh=EFA1pQeZZ3wTnjSg3iyWnXHDPpzOQGkpu/ianpCUL1c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MpX1O92fXXb6FSOdTLPPBEjRHrbu0p4xTNeSYHricKO2SAIlY6uBpPyzZzOB7hm2o
	 ocTsKM12cZADdbXWACffzHo821xACesVwt8rkElIAvWBQNr7p0prRMO2YVdhUlmRcL
	 JAUhIfbrI3SWfxPSGiCywyzdmV1bUi4bFpSoi+laJ364sI0LzyCkgWBKNDMD0lL8nk
	 eaVVi8fFZ27numWZk6iXKuoukmOQoTrx2qLcogKbGtqyNd4C8qd2clw4cx4hGSydzk
	 KSiTwa1cAWCcycdi98dPe37OSgHMz7wEkATmUni8dVdNEgy875OWpftJkOXGgqR6zo
	 HBS/suT7pt2pQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C9F8C3279F; Thu,  9 Jul 2026 09:53:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 09 Jul 2026 09:53:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-8wclvqN2Wx@https.bugzilla.kernel.org/>
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

--- Comment #48 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Note: such testing can be automated with the rtcwake utility.

Interesting result, does it mean that this platform is capable of putting x=
HCI
into D3cold even in s2idle?

What about PCI runtime PM then? Any chance that bug 221103 has the same cau=
se?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
