Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690647A0DA
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760316; cv=none; b=daoPbXy5uWu7P6btnzvZXR2RcoR8WLq6yyrOQiuufNz8JamkyiOpsVxvPeR+vgsAgfDtm6atayxCXHhqggOVcHZ8AyyXfFQ001Hji3OgNlKusLJfNTh5BIsGcu71fTVpMeAdTOOUs4G3PI2uo1nXTnwWg0aQ3/781FZaNj/0lJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760316; c=relaxed/simple;
	bh=eIBrC6LiYFbU3kC2JfOl0ijlcJ3z+/l0igS6Bclb7uM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gogvEpH1F4Jk4ZOpD6Ozi5CnvP1qPNNMg1GCBnasuny98v6KP6QReRY8WMtNus42ha9zVFje7QoyVKC3fIIic5ZL7AE+Aiax7klFKGZ5FW2Zx0MO3iV0XBvyflAKzu7pirMVhBiGd33hGmfZJr+JFDxMmHXdbbpYwM1y4AKAnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+f18Tj5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+f18Tj5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14EC1C4AF16
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790760316;
	bh=eIBrC6LiYFbU3kC2JfOl0ijlcJ3z+/l0igS6Bclb7uM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O+f18Tj5kSA5SlAecc84xuj/ZgZ/0dJRsfYJ1PKu9Sz9YgXGHyQQl+h2HjEqR7Qzr
	 xWhR7zgJvhGHJ9vbz/dtAlEjcBPqOtQ8BKPeRdzR7Gdkh0LEkRyuMGiwDo4RSGKZ3X
	 /8AXFVpBIzrxY6kCOiiVrAiEk9kL4p/6mGiFUjJ7CX1MRO1xvtmGMyA2W4xrm+Sc7A
	 FCQsEaul5W6TSzE0KgQ1xLBIXePKQxMivD7iEiUnAY7ON1ydDH6TGikqigz14UEfga
	 YS+IhwO5L/PlJTzX3OuqqOWcXAIdhyW3zJqFpTvcGPJfceUEcDgJolrhyXtpQFxJ+P
	 tNFS65pc/+abw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EEF7CC41612; Wed, 30 Sep 2026 09:25:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Wed, 30 Sep 2026 09:25:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: niklas.neronin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222071-208809-wMOOlkWWYc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

Niklas Neronin (niklas.neronin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |niklas.neronin@gmail.com

--- Comment #10 from Niklas Neronin (niklas.neronin@gmail.com) ---
I have found a other issues related to XHCI_EP_LIMIT_QUIRK, so I'll try to =
come
up with a permanent fix for all of them.

IIRC the reason behind the original "optimization" was to prepare the driver
for secondary interrupter support. There was an issue where the secondary
interrupters would be lost after resume. The patch was intended to prevent =
that
by keeping the 'xhci->interrupters' array intact.

Thanks,
Niklas

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
