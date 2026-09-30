Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B03BED35
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750731; cv=none; b=cn5A7ECDJJhRSQEAbqTaUmobklcGjU2o3ZLjFCogz3JDzbFhkZOnwCYITYUDs9WrXBqudGgCwmjiTl4ocdnYkIxTuxwrGvOFmaEp0zYNIzT1cdwQWX9qt5/uvWeJhraETN6yAHceFWXtrodKXUJuS11tJC/Em9D4uFQRCzQ04UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750731; c=relaxed/simple;
	bh=StyN/gDfnFHCo6+R6bdHF5s4w/Zhx/OiBOXtTEBfN6Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uzZhfzWdZ90yhGnjwbovRw7iheG8Y2ksi2TVk66kFXqZTjUTxpVncXHBrt3j+7VJr4lKaddKda2Syq6WLlWMAwKePuneMvadiZ0ShaqKOQhrP0/YNfDVJk0eb+6g16USx5hdhIFkf4TtOIAu7o2qlMeW3Y5TFH1IRyaeRc73HME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDQwsTAy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDQwsTAy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCCD9C4AF12
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 06:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750729;
	bh=StyN/gDfnFHCo6+R6bdHF5s4w/Zhx/OiBOXtTEBfN6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UDQwsTAymim4B28WjX7Xwc+NUJgts2kjUN5C+552avMUKds6YtTU+i9DsdYiXk4z0
	 FtgQ6IopfG/7J1/EVw1fhKdl7ZxAQG1XUb8QCfDA1Ne8/ZQtPNaoAEyBHQGs3241XZ
	 LRrs4mHEt0dfynjPsW5oapOUaFendhvM6ms7QInHGH7yqc0V2hZv/mOBzNvelGvaFd
	 mHmejL/k6OE2F8peTPfQSE4PzfzRiY2Z74UT6M5qsv3GtrRCQ/o5kbC7rynJiR7v5I
	 sHeMeWEOpf9sv5+rttzNY6VUv8UIi19Hoc60Md6qxVzjUmtDGTVniy7YN2Plc27X/V
	 auWOn/dc8IoLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AFC81C41612; Wed, 30 Sep 2026 06:45:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Wed, 30 Sep 2026 06:45:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222071-208809-6sLhhJElqA@https.bugzilla.kernel.org/>
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

--- Comment #8 from Harald Judt (h.judt@gmx.at) ---
Thanks for the explanation. It is indeed an old mainboard with old chipsets,
but it still serves me well, and when I replace it it will probably have its
place somewhere else until it dies. Is there some quirk that makes these
controllers reset themselves like they did before that commit? Reverting the
patch helps now, but is not very future-proof.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
