Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50443E4BC
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688895; cv=none; b=pRxZQPMOY8E8yB7oZkJVj5rdj3ee8+CNFuJq/OJoGkRzQHWTDm3nFz8gHT1QilydEhsHuFMpPPgqME2JB3RPyBax/SgTXLPhtFNYJ87RV1iZuWA2v5uHT4vkWWrLS2dLPgw5UMcpQ0Ddriit9SKO3pmrWLU8PFmrX7vI5cE+3e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688895; c=relaxed/simple;
	bh=Fo1GCFeqDbxqSf92VX1VuyPD1fqf6kVaDuCdvo6BDbU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jZJsVRf9qneXuPLlE4ycPkAWZBZamJMGeG4e8Cho/AeQN/EQrFG0GptSQLMatlitTSoFH/LU+3FhzXyErKPcVYipmMx8opgPByi02wUkzKAteQ7LjRDXgtjI6P2oU8IoPQCiHHxhIrmZluqYzlKgm697+Dj7GVEZl+SGV4sW4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW6M8TSi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW6M8TSi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EC2BC2BCC6
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778688894;
	bh=Fo1GCFeqDbxqSf92VX1VuyPD1fqf6kVaDuCdvo6BDbU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PW6M8TSip6XuW9B+1FCLZhXj9JSMfkQb8khpw0NvfwYPto8U91FOtJMFzGyJ5sNxC
	 99hYeqPJdJoPzLo+pjaymAHePjUtAQiEtRLHR1cRnccyHizOLR6xdf2X4BtAKNfUhJ
	 JzdeWBMT8ZwUaRsUGOgnPnj8nvmXH5Z0RlaPlb7UDC+mQBhRuMd+veIRLDCuwjIIyj
	 j5Q2zTEkImwfLUnFegWcJm0+FlJ6nKKFqmr4HU0747VpQKzsN7JLqKq2WvLOZuxhmA
	 OuhrwzDqXnaVZrDsbL/VeWtnGH5WzcZEErJi895xPS/xQP2VzXjORP5mQih2nH742U
	 h+sb5iMeVb0Fg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DC2FC41616; Wed, 13 May 2026 16:14:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Wed, 13 May 2026 16:14:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-HAHFB9qpVT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #18 from DaisyTheFoxxo@proton.me ---
Checking in on the progress of the patches as it has been just over 2 weeks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
