Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D64399E7
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812978; cv=none; b=LMb95wZgNQfEmcA2ecy+TqZmO59vkS1sJA8RhqWGjb0V/yx3zgtfnV0cBAheNp5OUkLkwCOqHZeE72Xjick/Is17lWSj7fjJfdicPKrfxGqQrntBPujL49tvDbtLoLCdvvTbJKxngVY3oSD5Q4N8QOYjNloqVQLkWSMoGafBFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812978; c=relaxed/simple;
	bh=kElcmeVwrdHw0AsaqYtwJS32IO1NK79c2x+xWxSidKM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3+8EsaWU8bhNksGRzO6SRF+35KQ+qbr/10xBQSq1dfBXgZm8EkHq1vj9FsjdBd69BhKp88SZd7G/VFQBxAQ86vo1wj/HdORuPo+hTV3+Ubz2h6lcw+6xPdUGkDDaWAYugWw0+sF9gHAg0osNiWfDQnPe/Pq6eB7NRaLIRoPikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXklqTFG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXklqTFG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62D13C2BCB8
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784812978;
	bh=kElcmeVwrdHw0AsaqYtwJS32IO1NK79c2x+xWxSidKM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GXklqTFG582QjPPvUiEvPSDI1uGXWUAuXYLcD74hV0vCCy6GMY2dvGQ0wIjQa5d0q
	 KPk2bl/Sd2lfz552A6y+2oqjK/tOxISWUS8mwEWit99IC2G8oY6Ro9S5MMmID/X5PM
	 r/lkBzNI5QLRKwECTk+YX0zkYt7ww5oLiqHnP0QrXpglRIwYiSAJM7lsvOpd/ku/P0
	 htp/HRlpIKydLm3FXzkAGzSoiadtxMua6xLj4FJr8yo+QMQaRuSl4g4E22ZyhvFauc
	 sh9dgo2+qiCCBr7P8MnYkFAAQsbX1OMXitaLVeJMaY7qFPTutHgaUnlaD2kcrWWScu
	 V+RYq67woe4wA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51B11C433E1; Thu, 23 Jul 2026 13:22:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221779] 3Dconnexion CadMouse Pro Wireless (256f:c654)
 repeatedly disconnects when wired, reproducible on all 4 host controllers
Date: Thu, 23 Jul 2026 13:22:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scott.meyers.email@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221779-208809-4T3EatRs6Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221779-208809@https.bugzilla.kernel.org/>
References: <bug-221779-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221779

--- Comment #2 from Scott (scott.meyers.email@gmail.com) ---
Created attachment 310493
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310493&action=3Dedit
lsusb output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
