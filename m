Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B287414DFD
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948108; cv=none; b=hBKrY8MpSUnLWqUFl0SeehjGPtpk2AcpUR0qbnlKDByLXW6Zsa2bj/4PVoclg0AodfL1R3j0hKMF8YQVXnJmiLYX30FVBKfA7+dswFbS6kHpPiZdSl1XIfGzSM01d8HfaWcb1uluTC1tzTUIIG9tNOiixvh8t176e8pzyyKIUi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948108; c=relaxed/simple;
	bh=iFTlSacXevOawh09pZcL7ykh3xn47c13hj4Yo5Re9yY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m9b/wGPWYZDYBQLxO9yfHPvHa1cl51PobjphDRweyeghl+x2QBleCIPcRKAj3FRPcfX27RVkQm2N90IOiMEwu3OpWXb2z4AkU1nBCDKLV+o0fERhlCafTAYXwdJxEgNiRjYsBR0sYp23K4glPTBJSlQa5rbeqrEfqNQ8naR7vtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2KAFyNf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2KAFyNf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCD94C2BCFC
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783948107;
	bh=iFTlSacXevOawh09pZcL7ykh3xn47c13hj4Yo5Re9yY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c2KAFyNfeAgnAd+s05RlBbO1BhoJYNE1dI2/m2YC2OfgZw/yT3PlM/b7Dels8AD00
	 NeLaHAq58oaXwzXJ3S33D2jKJ5pqhG6MA6XvU8AL2JD/8uOxvzieF++lXusJfdJOeK
	 m0pTf9cMnLBxB+0I+DVZXc1FevGh2RumIEIXWwxiSiu1kTHckjtEjLTIL6RC3U+YH7
	 5S5emtSBpgtooYaQ2pBnsCXGYM28BX9/grQliJ+kyu1qW2DPBYyPrYMzZV82gMTVdJ
	 WrYx6qi0TiQ7S+cF+EYrmiVMQU3hVhYwgEFdd4w77eW4lReGu5ujnKnroXq244kb3w
	 /8lTAUPHqJlhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B0503C433E1; Mon, 13 Jul 2026 13:08:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 13:08:27 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221073-208809-rdQ5ikp83n@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310440|0                           |1
        is obsolete|                            |
 Attachment #310441|0                           |1
        is obsolete|                            |

--- Comment #55 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 310442
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310442&action=3Dedit
possible patch for device link (v2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
