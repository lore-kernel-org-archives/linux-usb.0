Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853E3CEB9C
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 05:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586884; cv=none; b=nVQWtAulJbBsjRhmvnn6v35J4kMdJwDRufWdJbL7hjRM2GRPKGAt4Dx2MLGzrUXp9ObYTNWyZsjDZXLc4QCIy+F70xnk1TgMjtWwbd45jsfC7BMT9tqAndIGexhsiQWkOCt4W4te4+vRFeIWVVNkZU8Mqa/X+UL5aPhNclFgxJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586884; c=relaxed/simple;
	bh=4DeIis78tb1MwFwTjwqVo+TNT/oErE9GliB8nKDr0IE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dVr9QH89BABKs0c8gEbcQa8tfTYPgRb39jwiLtnnL8c2srEfWjrV/A32evUTnwMb1LcHLrOrpix5eHzwTZDUZhVPUprIr6BmPB7zK/Md1D/RsRbrfBqfH7tlwTeyiIkdIjH+QoevQU/p2mUzKTIXoGg25VZiYG9/K8aoPFNROTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9gCjQnN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9gCjQnN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D34C4C4AF0D
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781586883;
	bh=4DeIis78tb1MwFwTjwqVo+TNT/oErE9GliB8nKDr0IE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N9gCjQnNwdShMX7bEJFAVFFYavA18ygGBdb9j8bKsoUDcW8prFeLHVi4qUU1d7gQy
	 QUtVPmtv9ClA4dkbgo1H7ZUbcenVzvjnYrn4yTWv2/3NNusgDgziz6vnj3QMEo0LhV
	 nEPy5TE4TD3g7CWRyYk+x141KQhinpgy3FIhPf/66HOETaX5VnT9gvXHUhRKZ4eaCe
	 DI07QbxVABRdeEkLLZd+pXmuhglrJJ/Ibf7/rURXOTb1Yusj/GCL0EEzPopwrUjsuz
	 ZYKmLUmqzTYGzNa3KNqnHvNB6XKCZ5uV/VLsJj+9fvS4Le4/nk40YIcGP/RXPZLem5
	 CHFUq9lveal4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BFB81C41613; Tue, 16 Jun 2026 05:14:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221655] Barlow Ridge TB5 tunneled xHCI (8086:5782)
 runtime-suspends to D3hot and fails to wake on USB-C device connect (Lenovo
 Legion 9 18IAX10)
Date: Tue, 16 Jun 2026 05:14:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221655-208809-OSBKZyv1QU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221655-208809@https.bugzilla.kernel.org/>
References: <bug-221655-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221655

Mika Westerberg (mika.westerberg@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mika.westerberg@linux.intel
                   |                            |.com

--- Comment #1 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Please remove pcie_aspm=3Doff from the command line. That does more than ju=
st
disables ASPM (effectively it disables native PCIe). If the problem still
reproduces please attach full dmesg with "thunderbolt.dyndbg=3D+p" in the k=
ernel
command line.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
