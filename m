Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C4548EE
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991290; cv=none; b=AzKFSbHTM+yyXM0s+azR78ysznKFcQuyoXeCGnAhMb9GnHEVpkgfA3wuXozTsg21avtWVHVTbm7Um3rND6XbEphuu230F47oAS1q6CWL9r4J2kMtujFcf7LDbR3mg5rcbr0rmu3I7jKwt/oZ89mWFYvubi6RqHqVoR4ekxcqHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991290; c=relaxed/simple;
	bh=UlLpXsBUTM/M8plQgrCRYz3FDFpDevsm0Uc9FvyPri4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G071H6rjLZpsz8TigYipcVlDC+jUqOAan4u28WcPLOMPKOZ8bQEyC/XbTmzcsB/uvSMYmHACEdarUcnpsUVgzmMn4hs1v0H6tFKnujPwjdvW6ldGpsJHY9yFXzeSRmCXYMQXNfb+f3WmdrOrwZfhyxk/8gPtZ0Q5LVK3oc1F6ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2Ej7UqH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2Ej7UqH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BB74C2BCB4
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780991290;
	bh=UlLpXsBUTM/M8plQgrCRYz3FDFpDevsm0Uc9FvyPri4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p2Ej7UqHLqDxyNhgJ6yAo+LYiV8vecF7W75agLygXaeE/OWcqBb9GF9pgiF5JTcEH
	 nd0ZXIE4GJcqp76rb04Hcggnwj5x6b3OgVR/2WnkyxHzsCL8RQ2KxkKuc33vWXGO8G
	 0AZbQ8iOudltcLXHVD4N7FKjQD+zTbsVR/Q5B7yL6MS7VovplETR0D/gRirsbySWiY
	 Z1w3nWnKWnOB4wUscgLkAFn+TUrX+fj3MPPHEGGswEr56yFWxXKkoSqS2lOfreuvBW
	 f+osQyByToQIux8dGnjKAcZEG+CnmvyOCAx31uNMbsQqU0Pk+rpHPoxM6rotQrfHiR
	 BIlcL6b3YNhGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 73D15C53BC7; Tue,  9 Jun 2026 07:48:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Tue, 09 Jun 2026 07:48:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219590-208809-OR8ADyosjB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
