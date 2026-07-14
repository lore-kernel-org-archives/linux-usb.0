Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B830647887E
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037002; cv=none; b=KDTaTfAoLbIz0BIkwBNYTh3M0FNpvnWswHsnkbzgqvOLSuLXOSr+8RSP3PXS9RcEo814KsS1NZlp86E0KnXUZVvR8l2l60UHoBJP1WLPWx+Gos6XDXlW8G/rCXDCMAMFKo6nNp20M8BAky/o8TQCaxk4My6RysYYicD91zfnWWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037002; c=relaxed/simple;
	bh=djVEoiDh3UvIs4lKE0VbxUB2yUdZQ/9Chk+4kOnxGNw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1/wabuinV/SnRZQZVwOwCynqwq/rw/mSmUo5QB9SxuGqiC8yRPaw6XW7LXfkBHd20wW6jL76fvTGVbBBVxqsNgSlE92LqsCGmttkeznqE57zUUyPrV1SirwjlCKTqscuwbp1Wenq3QwjBEpUlaJZZlAr8EUc9f74YyyZKVpLjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBQmS21G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBQmS21G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09E03C2BCFC
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784037001;
	bh=djVEoiDh3UvIs4lKE0VbxUB2yUdZQ/9Chk+4kOnxGNw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iBQmS21G4+mLzCTIc/LTqk0cIJvShuDYHIJpD5fkvhIz3e5wxzm99cZnZ1NCLlJGQ
	 L71r2n9tkxLwnJNM+DmrI++StWNZBvhhqFQcpnjMIs34u/4wAplQFTVObI2FaWbTGT
	 0jSpuTYzgSruV2rMCCTtwsf+V+hr6Ntd1t8bTYPbadKggmPEu3I3r9zXBjQjRtk9BF
	 oLwo+namMQsKn6c6BdQ8Ea+KePBglTpyCBZGPdvF5nHDNnEFih+Dft5hVGt/syAwG8
	 j8QeVTNmbyUqgfyy9lAwZaItL/sSCm0ZRtNbIsmb9L24bUmvxU7I349bTtVYnB/iCN
	 qox4DVE2BlQdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED9F0C53BC7; Tue, 14 Jul 2026 13:50:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 14 Jul 2026 13:50:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status assigned_to
Message-ID: <bug-221073-208809-hfF5SDvRWE@https.bugzilla.kernel.org/>
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
             Status|NEEDINFO                    |ASSIGNED
           Assignee|drivers_usb@kernel-bugs.ker |mario.limonciello@amd.com
                   |nel.org                     |

--- Comment #68 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> v4 (attachment 310447 [details]) results on the Framework Desktop (AMD Ry=
zen
> AI Max 300, BIOS 03.05, xHCI 0000:c2:00.4): 146 clean s2idle cycles, zero
> controller deaths
>=20

OK - thanks for feedback guys.  If this W/A patch is accepted upstream we'll
close this ticket based on it.

> If it ever fires again the panic trace will be preserved and I will attach
> it.

Let's please treat the full system hang as a separate issue and attach it to
it's own ticket.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
