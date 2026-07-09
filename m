Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED93BCD15
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598313; cv=none; b=FrM61Y0K2I/YNlRwaz20/npIOibFmwLLxnoGRwbRmGTb0XSzadmmSgkY2YUOWnciQichFPscwpl1HC8nOuMtCo85aPMp+mwCaKXcCdoBdzUzrPdorDjSWQmBo+6vzjLZU/zN9Ko5mE4l5mQT+X/4unAAUz3UJdNCbWddMNxiOu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598313; c=relaxed/simple;
	bh=LNN9EhoifE6OSzINlzB2IQqVkPrhXvBuqvdrmKX1pb4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q449XEDYxGUnR3KIVHcu7A4fVvIcK7WX3CrLv2q0fOunFUNynayhrbXGtZRKKpBHojP1YrjEnMCVk1gJB01ucsfxt/Y1eBU/cOmGsbwfMGEdo7ZMRhdKi4QavhB0k+hx2S6roY/uFjIeaxfh9vnuIcexbmVfdFD1HsRXN5fHmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZq+szqq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZq+szqq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DB2BC2BCF6
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783598312;
	bh=LNN9EhoifE6OSzINlzB2IQqVkPrhXvBuqvdrmKX1pb4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rZq+szqqvahxDvnSdh/o5KTiHr9ellSuOy/j4nkMW0GRFm/cf83etspLvaFTGkIz3
	 atDBFb8oSjy8wQFFPV7+qE8UN3Dz0cBy7gucusuSUDJ0E4B2z7Sgg60kJ/mnfdB+zD
	 OcvAwhgagyf9tBuQCy2RGCeAoep6FIbQ3o6WWXWfA0DETLLP+9ORiMNuvVrEaFHbp7
	 AqntWioIQ14kGgXw5ZsZZFcTKjiq0NmBMV5bDzEqTVfsXXUdLsZXI2+pusAqVEnu4S
	 57h/dUt4JArU/jQg/8OFGK3OdKXqzqHBNYkq95JEX1nmP5r0Yeid1YWaNw0UosDfLa
	 XDugijKvQjg+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8C16CC41613; Thu,  9 Jul 2026 11:58:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Thu, 09 Jul 2026 11:58:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221103-208809-b2WolLp0U1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #26 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Micha=C5=82 Pecio hypothesized that this could be the same root cause as
https://bugzilla.kernel.org/show_bug.cgi?id=3D221073.

There is a proposed patch series for that bug that could use some testing to
confirm.

https://lore.kernel.org/linux-pci/20260708152650.536604-1-mario.limonciello=
@amd.com/

Can you see if this helps?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
