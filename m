Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC127281E
	for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776325211; cv=none; b=UZMHFo/1GP474drduOAxMWcNK9/XZLfI94ckIdNa+u7/Qe8f81dNSpwTH6N2R1h+BvQURFVbLii3bYWxBAGBI9Y8CAMb5V+kX3HqD6auGSukwT3n2C0sU2xTl6tHeBZxK/DbWEvIYICCeBDm0LoXijpkbRqrSenJIyQyVuJuY28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776325211; c=relaxed/simple;
	bh=4zb3U0bnwJaWl59CurpVzGbi6XfRBt2r3ya4SByfg1o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eTR2/G3Vvsm+JZN4F4q2qYebXtoAM8itIHC2Zm2QxW0XwipSGVPKMBo70v+NdYghlcmrg3ntlfHgZjTUeNdOVP/JeHMWXU9/n2j4ezKAxDiwY9ITSG+n5D96bcCHbDL9fFCp4+JKSt3OcY5OhrXYdXVu+w6EcEMRB5u0J2ZM8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIcpO0Jh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIcpO0Jh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E09FFC2BCAF
	for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776325210;
	bh=4zb3U0bnwJaWl59CurpVzGbi6XfRBt2r3ya4SByfg1o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nIcpO0JhQCEfRw7wBgDXhu8qTy4185wj9G6go+Tl+b0ytzwiPnbimJABB/a5RdFed
	 Qkem6mGqy1/EcQ9qpwZ2gWHagVxDKd/7hbuTXevk1DUdgz2VcOJPMRXrmT/6qgkwuM
	 DhNF8P4hbm2X2GzndZRFwMUbZKaN4hRd9oRt8+1bShWy5JVoxyjqJmjYk9GtqLwHKY
	 itkPASLGrg+ErN+PJ50xjjpFORJc9pB4eBZkVNIT22PeqqUX70puO3wnJvOTidZ4/7
	 qQ/PWPMsiX3MUPrj7GhEV8gHdsDVRxgHPIKaMunZyU48ygMP3X6UHaeDSvCBdLWzrh
	 +7VEHndVKdlaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4BA7C3279F; Thu, 16 Apr 2026 07:40:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Thu, 16 Apr 2026 07:40:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-hJLK1ySSfo@https.bugzilla.kernel.org/>
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

--- Comment #9 from Oliver Neukum (oliver@neukum.org) ---
Can you please try the "g" quirk (this turns into US_FL_MAX_SECTORS_240) as=
 a
quirk for your device?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
