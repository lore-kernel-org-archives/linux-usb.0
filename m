Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEF35893
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775324080; cv=none; b=SagoVVejkMHKHexY1C7vMlAgtCasJRkOI9wBtpbhDett/tJceG07sIhAcScgcRDqTaczmKOveVM3IGosdn7wUdhWspmt4sKfk4Y/PwTAaBDzMhTIl2yiiyxGM5Fkrn6Rac6bkF0UJpBN3Fwoh6WPnBBD4CkXGyW7ZqvqYLV3hrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775324080; c=relaxed/simple;
	bh=hDbfdprXWH1LWPinKYZTKD494duAu8bHfOaaGvtpDVk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gpt+ZuSRKnysSed3WqlKNtgmRBJUc1A+vtGy4vcVxC88wx9koqWzlGI+pfkgeE25iauvbQatohuujvDt3w/YcpQayaSDmENXcPuxemhQYTaC/OALMFg9EGtmAP/mglKNfV0sch7BX3QTebXATbPSpnAj0gX7wjBZstFnynGVyJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmKD7Fw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmKD7Fw/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A75C2C19425
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775324079;
	bh=hDbfdprXWH1LWPinKYZTKD494duAu8bHfOaaGvtpDVk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CmKD7Fw/C944ZPi2q/flfEsYCkOyq0sintxoEVqZErO3oNOpptnkh/PHhWCUbw5qh
	 t4eKO7KYCQ/jjVFrW6pTTtu4WpZxQCtl31299vDL+6It9XczQFdYD0tEKfoPFS7y8D
	 QP0vHJZqWLHqiKWffgKihFzNov+UDtxeY3pm8RXgBknbZUiL1Fei1RuKWQJtz7Xy5R
	 crdSRpNbTei3UVO0MgHFPUY63Gv/f1Po0lnoXxwz/71mhxCQBgxeYewk1TixQd2Zh2
	 I483scDPSICgQt6dHWpTCiTmSJvX0bkWrfhaBlH0WmrCJD3L4VSxcYD09qTPOPvscP
	 9ciA/b8q3SFoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FD63C3279F; Sat,  4 Apr 2026 17:34:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sat, 04 Apr 2026 17:34:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221318-208809-RbvNR2IGxL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #4 from manauer.uel@gmail.com ---
Created attachment 309817
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309817&action=3Dedit
dmesg -W with connection through Thunderbolt 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
