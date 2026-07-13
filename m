Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243BF18D636
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970159; cv=none; b=f9kFcBQ8n6QzS7YmLC3BQGFRvfGz0AvhWbzSkYGs7DH78hR26kQ7SglP4LFwBARBcUdfeXwD9xzDtD9sWq5rF05S6CXBONv5M+03BQV/dKLorXyZ198rurnjFkr5Xc9NqexOPqZpYHTDCKrxROpYiW3ejv2dhVP6lQp4pwkweZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970159; c=relaxed/simple;
	bh=ZBz/80gL2YXzgCBM3A1hdkxuyS34A5X100RFpqRArQg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K/HsiZyc3roDzaTlagXI9TOrwUgw/KgS7kpUKDmYRxE/Y9YWV2EvXZdCo5ZNSLiXI2DmxHD7xNoVbRCFkrm7fn/4roCIcWYBawzzRQ+hcgjjFUyFZiM9UzOR5gZ9tK7LvQ+LyqLUxNJnv2RYdPeAVSCuzcYT7QCtikWGtTsAsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etUwIKPB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etUwIKPB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB6F7C2BCFB
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 19:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783970158;
	bh=ZBz/80gL2YXzgCBM3A1hdkxuyS34A5X100RFpqRArQg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=etUwIKPBl1UekinQRIoIO7JL6VFg7qEAS9qBOka+tDHKOV8J7LoBGeyQ7oQJar1yh
	 r6VpX/e8SHuPvEWNhL8zt1IrWFHrk5ddihCpQAG7H5ho/0U0nmzaKkQrh6JeQ1j0i7
	 DPw8zz9gBqISiBBVpM/oqPI62FxTrpzYhBMW3ZwezuIcvwVXdQLEIYZgGNfWeMuqlX
	 1vDEcaum8/Kg3SnpahHTILnKwnfQaqQOhneViF5PeqoBG3ySD/l+dykUe29bWZdua3
	 rLG2tVqWRy+wmnxSSG8GoJGo2NAp7Cb/pUw5Qcz6c4fn+L0BD3WH6n/IsLT4LzvY51
	 YgQo8aVo1Rvmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C395C4160E; Mon, 13 Jul 2026 19:15:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 19:15:58 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-KMzH187QsY@https.bugzilla.kernel.org/>
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

--- Comment #58 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK that's really good to hear.  Let me restructure this workaround so that =
we
can make this removable if the firmware is fixed.  I'll post one more for y=
ou
to check.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
