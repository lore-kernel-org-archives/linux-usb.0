Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D327D1FC7F3
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167110; cv=none; b=GBMvfq76zNjdvBJSFVZ26DxVC0b0CEoafj0Jc03PuzLh+Pkm7qxuN0DFsdXlMeQXUfbMLmuchAqzfOAPl3kEue9muwzPX5a+30GTTGDAG/xnwntsryL56q/yMdrUywVfL63jzYQnNlbqwYDnLxGMzKFdnqUuPlIq/k0tOO20nuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167110; c=relaxed/simple;
	bh=dXOHgD95rkGE/wi2ACPXHIjFdPd7uFwOsSm83VJ9G74=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BYhfM8OQMpcJNSA9WPrcURniKKYRFqVSBE7TDoeqPntJTSeWuRfSA3QCSMbkzRdxWwePDgul6ftmetyiihyNIswJEUG1yunrATUMPPC6tYpPSoezfDv7F3Wh6Ek2J3fqoYBA8A0c6Lkr5binLT3lULGAkX+dHueJ0kkWfEZdGXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOGkI1mi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOGkI1mi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50ADDC4CEE9
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741167110;
	bh=dXOHgD95rkGE/wi2ACPXHIjFdPd7uFwOsSm83VJ9G74=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FOGkI1miroW+U7IH3XMoW8WSn3SheLxalu641ISkp0r2D92RgX3oW+j/RcIag41/8
	 vpDjMPWsaf3B3X14JwUbrIo6UxKl+DHYNi8FManzEYFI/ASYhYQpC4zJDaNTNi3Uz7
	 YP9DOxgiGkxszn6NWIVpEvJ3FBgmn22P5p64TVg1YmeK3CQTflURZbkcGdhVjTDPqG
	 zoOuGxtrrCQHUtIDxLPTdtDMbrNihy+YFHvDsqKx+4622Ory/TSLWAxdewhTydiM1Y
	 GPuz4ANAaeVxJ9fNMMqXWWEVjkVZ5TrIsnd2IVExQNJFIyG7YkM+gGNE70aBWGjXu1
	 e7Wx6FkAFIrTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F39AC41612; Wed,  5 Mar 2025 09:31:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 09:31:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-h89cp1bZA4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #21 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
(In reply to Thomas from comment #19)
> Created attachment 307768 [details]
> dmesg after move retimers patch
>=20
> Patch worked.  There's two docks tried in the dmesg.  A Dell WD19S and th=
en
> the pluggable UD-4VPD.

Thanks for testing. However, I don't see Dell dock. Only the Pluggable one =
and
there is one unplug and then plug. Is that on purpose?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
