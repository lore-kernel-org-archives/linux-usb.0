Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6993793BA
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786318564; cv=none; b=XvmxQ4tr2ZCIXAyiRx9tl6fEff+vxeh1mIzQIwMT4nHIYtcTsREecq8B5ZwumwqI8UkVgLyVXGAhILFcNfZqae++cIhiibg0svwFYQcLmUwefNDBfH88K/ivYct3Du1VYNtUEVS3xJt5EmYvNZ0+QIleI15fDPjdKRVcuncx9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786318564; c=relaxed/simple;
	bh=vTgTxxHS41ZalnaK1eqXMaIq1KlFSZSfZUynSsRF3LY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KNKgSLxPpXQPgOC9YnanirCuzAhuJ6E+grTMpMY9ltg24nZ/jPkB7yYaZao4DRydfWuuj3rnDHEnRcmQTHu8xB8zpP79EBlu2wJYyLxCSpSba5ln79jkRMuJ8pPfcCApfjYBmK4rBRVtqBUfbyMY8siGCTIazdAu7kFeclZbqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yud6IMdq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yud6IMdq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1427BC2BCB9
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786318564;
	bh=vTgTxxHS41ZalnaK1eqXMaIq1KlFSZSfZUynSsRF3LY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yud6IMdqEbcb8AG1dG3il0Nf4anbuvfjPYKHUdq6uhFKd//doYIwZkiZ46LMG4JJp
	 z++B6Oi0oUxtXV2icrF2T6aWbO4W9FTrl/14ksAI5lbbs28bji+zDkiQd6AehB7rdb
	 BJOWntVAJ8B4+4Lzu+AOAm+ylFnF2N0R8ypoV62Z0AksRQWRxLESMrVPH8s1qQqIrM
	 1izBn8mavL8+Qxe4BuMMRii7h5yipKoH2/LlxdcbgVP6+uHlKNaOnq4QrlAykzaheH
	 /Va6piMFxQS/xANe7N645WAGvtsk58zonmyGym3HcSBIkLIhXnuqqRuQVzE4Nwajmm
	 4pNc2f5kPMAKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01C80C4160E; Sun,  9 Aug 2026 23:36:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221861] ucsi_acpi fails to probe on HP EliteBook X G1a
 (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot reach 140W EPR
Date: Sun, 09 Aug 2026 23:36:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jayden.blain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221861-208809-ABKkjdb4F4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221861-208809@https.bugzilla.kernel.org/>
References: <bug-221861-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221861

--- Comment #5 from jayden.blain@gmail.com ---
Created attachment 310612
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310612&action=3Dedit
ssdt17 dsl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
