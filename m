Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC1448CF6
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089403; cv=none; b=lywA+l5uIIhT8aXLcnJXRmxlNhaixwq9yp6/PSv24mqThrD8oOhJokrF6uk49Y65u/wbGvL8WeM4eiGffCA2VilCoICxrApEfhVuyv8gS3y8m2Ie7Q6Yfe66cyq1oPmN1vi48BfVPzVRDfqU/cr2lT0S3lkd9zgDRb3tq7zHJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089403; c=relaxed/simple;
	bh=otWKceMZQmRiKuOFTM1r9YfNsCwEGlTHG8n1YUkmd8k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JAIOuHgnvb4vL+r+jkqbA9vI/UkgT9+SNObotdDcWPQ8FX119NlyNhDn+6o+d6UNoYhtL4yUpyUCCcJparrAIkzYjPfA38CMJXv5mLGhIiP+ed4BDeORH2nO4Xn5C3i9CsVmoFEHW/17a2phRpEKcqDZKcmtaY+EyU9b7R3mPh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5YQqrkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5YQqrkF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1296AC2BCC7
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792089403;
	bh=otWKceMZQmRiKuOFTM1r9YfNsCwEGlTHG8n1YUkmd8k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d5YQqrkFA8rEi7j3LSzr1dEulls3SvjfW9LM067kVwk9tDLYDd39HklZhgWmmdu42
	 l6tjczo2f4sxCIPcCo+JSYWF3ZOHaPNXtqlGaHRrJa7YW7z/Yc4p/U4nNokhjN2JiZ
	 A2AybiyRq5wJno8MoXrdmYWcaox2mo8MfGT/TLDjXt1YY9FeObwxW2bZ3q/lc4lXan
	 aX0IoScBIrTd8uo1GBk9U5AYAQNNu22rE1zYm8Fs4Wk6UyyhYz82fTFrRXxeNt8LJe
	 eGSi37Y+34RiDsbvN+ua92v2HkxiaCoQ4Y1nyKIWZ9c/FtvE7HkM1ubmBV2nLxndTn
	 MItYWsFEVPRmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EA936C53BC5; Thu, 15 Oct 2026 18:36:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Thu, 15 Oct 2026 18:36:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fastmichelebezzi@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222047-208809-DEClD2ODAU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

--- Comment #3 from Michele Bezzi (fastmichelebezzi@gmail.com) ---
Created attachment 311129
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311129&action=3Dedit
lsusb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
