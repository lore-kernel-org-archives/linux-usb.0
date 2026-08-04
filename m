Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784C3F65E7
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854705; cv=none; b=mNONGAkc566CgfKh7jnxJxaDAgIWfGAIdGuhEWZzw6jBVO2YzGeB9/b/U/KxMV6IIeSof62MQ3PuxaU6mfEtrZFC7eEUkLCuGYLeTjN2N7neTbHE7RxHPcX/rHwJ9xHFD8zx7qz5vh+1Dr5hmTJv0y3dHeQ2g76pX1nK3qFQDj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854705; c=relaxed/simple;
	bh=GD+qj187u3fHMZKk648ieQlllJ7Eh8ebH17wofD8XdE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ua1Y0gMUeActkcK4gcNygGbwvoCT3zemsZVyvkn7qQwOJAfMTzbSDCrUT6sgUGohglaK2S9eX1F9PIfPdQ4AhiKUj/6jwiWYka1jPUzujC3vF3s9NdsMJQcV5Lvrt0wReQSvaMI+/fgsCLpf2IZl5rzafS2QKHGYJICSzRFz9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4+vOmw9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4+vOmw9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0646C2BCF4
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785854704;
	bh=GD+qj187u3fHMZKk648ieQlllJ7Eh8ebH17wofD8XdE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J4+vOmw97G8jaeyH1eawqYlEXDroDIAM1DYu1nEFStSUsv/vwH2Ry8QxqFvJ2Qqqa
	 ARqmFCSHvjqv8mfKJA7DPfXXhECKZWHM1gs9aBaDwBABe4gQpgCvaREEaCaOlB0NRF
	 Y6yd8UgA0I87Qt/DbeBtat54xXrRBWiDPi8YqQOfloBQvjKT/o1JqEFIWCFyCZKPw3
	 hBM4LHpPAnRu3FCXz2WrNLueyGGPYq/vGvVgsU4lv25cPlu/7wYvbLp7gcEfk1JQ+L
	 yvigdE04LSfFOQ7oyML3fXqi810/LxQaRnwXdfYYeUXAZFNuwbWf2UBvtFw1sWm3VK
	 Alu4cuq82bs0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9CF77C3279F; Tue,  4 Aug 2026 14:45:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Tue, 04 Aug 2026 14:45:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mayhemandcoffee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-mhuqkqOMUS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

--- Comment #17 from mayhemandcoffee@gmail.com ---
Yes, you may add both the Reported-by and the Tested-by tags.

Thank you for working on this and for walking through the debugging with me.
I'm glad we were able to narrow down the regression.

I'll look into the remaining libinput issues on my own.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
