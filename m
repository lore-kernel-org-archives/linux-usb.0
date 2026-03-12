Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373C3FE35D
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336988; cv=none; b=lXBj+vldQiA/pwsRpqcr6wGUxXUbh1ZQ5B9kYsldI7hlNDBKceG624DgiorysG2Wrt38XzTi4DStavJ7ZThSBmUo2pVhdfDrzRGhrWpzbR6RkEJfL9ePBZaJ+PEZdIm5Uy1kEgRaDcDIklEE7v6RYBNhhIVN5uIWbcTiTetdLLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336988; c=relaxed/simple;
	bh=Qc/LEVJZ6WZS6ZVbf8EoScusrGLf4SGaypzTOx2WBkE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qaiy+MSbNjeMztxkMswO9OfNoqCyQE6I03ETd+CQhCsLd/2bMbQAOMWIquFPsp8QWZehyKHmpU4G/gN7o/Tg+EqrC41nG4PFNkgziX3vZrR60r8+avrDLySN3YKhIi7O4pLpKvQRKnNQLP6oOmRA5xtZ9bmzuDSmPZGFs1L0ORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RchY9fAG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RchY9fAG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DA54C4CEF7
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336987;
	bh=Qc/LEVJZ6WZS6ZVbf8EoScusrGLf4SGaypzTOx2WBkE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RchY9fAGpt+xTxxgKHGVOlWzCylV6d5qv434g2r9WswZY5UucQWbguEcexRu+TGum
	 KVqnbmYzSwsIUR/heVS1i1IzThueHSVO8eeGJnjzsizP9UznINpWgKwgTbzzGEvKkA
	 JXAN3nffe5Fbunjo2WMSkYpqhpOP1wYWPAuKvlDqrXmDj7kuHQ9ls4Iuc/EXFD5tPo
	 qnonYrnEJOKuFjEETlSfrdtdogIJ1DlszKReTSg2I4SQzWB8bRtxr8X8w22P87rYUZ
	 r3Z/XD2ZeQM/7h57QrLxCkbz7IhUXEjGMm8XKQtNnpj7Mrln2LcCrt+8PqYgjTEk7b
	 QB4qlJFzgxeoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76FB4C4160E; Thu, 12 Mar 2026 17:36:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221216] ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs
 usb speed
Date: Thu, 12 Mar 2026 17:36:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vahnenko2003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221216-208809-jEtkjEvhdA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221216-208809@https.bugzilla.kernel.org/>
References: <bug-221216-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221216

--- Comment #3 from Vyacheslav (vahnenko2003@gmail.com) ---
Created attachment 309633
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309633&action=3Dedit
edited file

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
