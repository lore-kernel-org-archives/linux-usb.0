Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17B480329
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038301; cv=none; b=DKnUwQcIgQouz39IUFALyLa/2uKL3Y+jjTMZUsOxo0OrdRdhMGINMdOw5NA5lyhNCrb+yvlbQOL1yKytrCD4NEoYtcQFsvwYJwHbc1i1WZmBWUjCqwlUYeka5lRE+5wCBHMYPdj0dRqXXgCqGAVnvdlMkLH7aMMYCK61fr34nbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038301; c=relaxed/simple;
	bh=ErRZmeC35r/mkyEFqAGZYy7FcLgRucNIhy/CUpKie+c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X/TxebzgDwXtEjVe9IaXJORjF7463IAa6Rz4c4xuKA1xOynaAQzQNCsK7gYMJPN+79QmAf2hUxnhq2CXmMKIm/CvIwHYQO/MDbmjXjNilw0c214cnobZfQ1vcd3xQzSN+sRV/i+NBEBRtlhIUo+70tqN6+tX3e4Hn2Dr1Fyn22k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTFbOU80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTFbOU80"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 663D6C2BCB9
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784038301;
	bh=ErRZmeC35r/mkyEFqAGZYy7FcLgRucNIhy/CUpKie+c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XTFbOU80RpW07p/syiF1ZqmSsjqANhKPLzW05NJcKsY46qgZmk8U2F+7VD5zLDI35
	 80kdAr7hEAZ+Pb9nAnpvxKYq4D08enyuESD6O700OLuIcbmgQjPhf0nASZyKGahwLl
	 ByUPzlMpkt3lGK3Oh4rj/YezzJHPFEqwZqQw6dh7LWKTbfNXkvNcnDhMECkQRoM5Gt
	 /ZY73HEotF5lK06tt2G8QI5oGuRAzCTUMlCMlVG+4PejFdUrkhb3KEpPNdzfzX0G29
	 yfDsGTG1S8Xq2tkdXqdwFLZoAmzEz1IJ1cuo1nw+3IX4ZNEoepnmEIXJPRn0VyNqwa
	 HotmS3l82PY9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3E616C4160E; Tue, 14 Jul 2026 14:11:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221655] Barlow Ridge TB5 tunneled xHCI (8086:5782)
 runtime-suspends to D3hot and fails to wake on USB-C device connect (Lenovo
 Legion 9 18IAX10)
Date: Tue, 14 Jul 2026 14:11:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vuo9gt37@addy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221655-208809-OryahbcF6p@https.bugzilla.kernel.org/>
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

--- Comment #2 from vuo9gt37@addy.io ---
(In reply to Mika Westerberg from comment #1)
> Please remove pcie_aspm=3Doff from the command line. That does more than =
just
> disables ASPM (effectively it disables native PCIe). If the problem still
> reproduces please attach full dmesg with "thunderbolt.dyndbg=3D+p" in the
> kernel command line.

removing pcie_aspm=3Doff, my apologies for the bad ticket. please delete th=
is.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
