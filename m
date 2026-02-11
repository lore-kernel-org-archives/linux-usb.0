Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786B311597
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792875; cv=none; b=phWmqD0DZHEFLk3D73dxKKdels0ZGQ9NFrHPZQ8ta8UfmvTcFzTTyGhC0Tx7i86M++Ril9ADGS8jA2OwGwFOxWrtklrAawtOeOFUWz+i4uR3JfiWzlcWrAzRQuxBRmBfzpnRk2mcL0wy4qbIE+Qw97YhfZ9pv1VKq+Rgsxef08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792875; c=relaxed/simple;
	bh=B+uTHow/EFciDZIWaZNiPKI0Qwon4J5xluWtE1i/UxQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dZBTDCVvCxyeNQRK9QuBPHjIWgOVyd1YN+Ff/88JewnWfx7Ljj3YZHW8lajBNzGmSa1Q7xAyT7zHxJ/Gn4vsIa0C+aFDJX9Y0XYvZFWOIqkJKEas1rPzgCkLsMlG3Eq6i0oymzrRpQGxhIqKC4zWE2f0IA6wqbDeuqncYThvnG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLbjvwXI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLbjvwXI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 294AEC19424
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770792875;
	bh=B+uTHow/EFciDZIWaZNiPKI0Qwon4J5xluWtE1i/UxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bLbjvwXIDaROHPL+sEc7DkX5XAJSnO950TNtonD5YQhtyLly3BuVzFZfjWWR76/KI
	 4tnB0LoB4/Zu0w4W3a53K/TGBXDAq8EKhG8lCBRo+ScePH/8onhv8rMP2pR/a/c7TA
	 BwbLv6oepYzSexsvIHNnd6oPMgTEUf8wYj9XI8sQ71qEH42gX7L58HjNlgSOrkVpWF
	 ODt+HHZRPXea4K5yUMl9HW5XpBUtpPDrzTv9OZ+ICqd5sfmI5X5A/dGfEPkbOiNv04
	 lvRyis3lTgem09LhfTkca3+ME/AjF20qVI/Z7HJCbrIDVDk4BoNO5QrVtW69o2rinX
	 ltE7NNjXBFzqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1F7D4C41612; Wed, 11 Feb 2026 06:54:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 11 Feb 2026 06:54:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-221073-208809-1xTOxaa5Vt@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Looks like a regression, please bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
