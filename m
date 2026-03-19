Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291B29BDB4
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932662; cv=none; b=IGavsb24zPpShrUvUmX6rFlB7GPLYsFzAtwqSBlI5zPOY9dgDej76aph8oR4rNADUS6NDzWbCgVUewLfoxPjplFm9WgiW6kijjdN8+w3oKnxykzzNXA4m90xSaLDIpd2xzLZIQiKVZnqvc6lRFufn+GKhKZY1lKq6AMWq9HV1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932662; c=relaxed/simple;
	bh=v2UY5q7ctMjtPO78d81SxPo146vvyDs6aXn7CY0zUXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GBPBWW0zkatQAKtWAENybhWPA7ghRd9ofWYFJpEDhKIGT6RQOvYAsS2LzPmGytwJoi5m7+/BxShT8sgab6V6oP5adzduh0+yujILinbhvvZE+sZXR3hB3Kg+wh/iQ5FiJOhbHjPvvu2t//L3RATgeLO2NProC1DGtXC4nZRlIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyNk4MYw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyNk4MYw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9041DC2BCB0
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932661;
	bh=v2UY5q7ctMjtPO78d81SxPo146vvyDs6aXn7CY0zUXE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HyNk4MYwDJdHpHL+icvGY0cXmGCazPrTi3z5s+wEdemnO/EjuzH/xKZZfFzR4fHnc
	 Hk0UwiUzOhoa7k4/V/h7n5KVmeaDiDZhuXCRgSzJp/ZfpfICKYZkyIIi3U0bLUZlS/
	 47voDnKojXtme5nXoJhtTUnYWkANBi2GJ9V/DnuwylVJxbvSGBTAqlYMb+rr9liQnM
	 loPPuUYwYgiiJoZb0asbOwi7OJOPBJHAysSjecKujMEDMO7g1p7NIXemIX/BLgrpvQ
	 IXB3Pts5Prt0cxmDpzi8Lv9w/59qvJTZHIJ8gsoQJGT/Dz9AW3ulraD6n2XmSJ6Fo/
	 FICyu/zGeOC8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81DDAC41612; Thu, 19 Mar 2026 15:04:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215117] ucsi_acpi: kernel NULL pointer dereference
Date: Thu, 19 Mar 2026 15:04:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215117-208809-KClfbrypkU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215117-208809@https.bugzilla.kernel.org/>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215117

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
