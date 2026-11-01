Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793536727;
	b=kb/xmJYpPSdl7k320I1TSQ/gv0aWWdSlsC40aOyRuhuPDdpyn5o0f6cUmv4AHaUJ7FAU
	 Dcg2xpGQKxRvzWEPFJLUsZiU5UQz/hkCq8AvwWE1DUyN8bGaBA4IUErLZPuSf3SOq1XuO
	 qzAhHcCrGtnUelzscGMQeizwxUbhx/rqmhyismfCzZl0FZWIzCvbrk59Ze+lJkW2l5iAA
	 jPEC11C7NGseK84oLa+fRt3QW+C8Be3e2uUk+lOIVEW0j+v78uA3cOfvyTUtBpQisYzD3
	 Z4wRpaCrIN1pXaHI+dWaMTs6//Uu7s1Bl2KJ55e71YcYRYA2XQLNsqotlXC4dzdm6oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536727;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Jn4z8mFBSBUFxOuLIkOOGRm+u86Wey2OvNxOSB/Q9EY=;
	b=IGmgPrpkdfC0XyAI6i5G7q7TKNnirtmBvlUMcIZZfRhz84iIP12UAb+qKi1XPOL3tOcA
	 a5J7m9Ih8d/r4frQ3qmmwPJM0onvCr2klqOKTGNr/tUdZyGKS0mLuoRCxurfPk3DqFVQI
	 v0qUbwCtzJleSU3nbx/uMzzfuZXu7S1cVUFpR2nLlgp8mrLoYV22fhCIMTFlj69JTX1C2
	 Gt1aEt/5bhqk3WAhD2F5luq62nWUgNd86/G/gIO/gqbH4+wW/eBg4WjGMkDKG6rWdpk6t
	 J0pwDUA+JGXhAnsLThuCPmZPpbSNZbFY6dGjo3k+2I0GjYBEoc+LN3rcVri4x7vFKzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eo3g9q7J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50E6606A324
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Sun,  1 Nov 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eo3g9q7J
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E426513C0
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793536726; cv=none; b=AdJWK1h+3mcHjlpT3HiwgFhxPGVb4Hus9SB9OVRc+IrsMtHINRRa0hfNMVxZ+L/+hqkNsdwvFuQBS1VpXkmrY1clvlSP2kAqdPMxXzZt+jMdPGNy2LAfWYT8xm/kMoR+jEHhe+1WRpIE5gmzEzGTJSzFAJitAMZoCL0fzYyMtUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793536726; c=relaxed/simple;
	bh=LBLvXqk8lE5LmhytjJs0cJ6AzBW4BNqHCl+0FTvPfOs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BirQttcyLPER+A7eAw4LNV6eLWmjWXgjX5sp40Ds75o6RsruIv9br9Q7hOsU9nYOM1R/qTiKDJ6WYClpueCK3HYcsTWbWSWsAzeDMD4/MQIdpsJEOMJ/mPb2h2HQZIT0/GyK5efQTG+D0BidSgxfTQNyE3PCC2QtDiH0amD0pLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo3g9q7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0111BC2BCFC
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793536726;
	bh=LBLvXqk8lE5LmhytjJs0cJ6AzBW4BNqHCl+0FTvPfOs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eo3g9q7JzH0SpWpn+xBYAZKvMteyxy7+qpqx+97M8dVQfCA2scNbbKyOh9zVWI5tC
	 I9XQdYawvDvxTsW4aPS26jrneQJXdsJcAHIcBWGywcYdJXc/zLx2C0uSAfNqZXdYH+
	 JPOByQ8OP6pbD3YfeEtnvEkU0+vaRG8MX5L3OY0xLuzzGoL5SGyyFspOppPuOur7aJ
	 YiA1X3cunIqUrO6970xAagAr6bjppJwHuDTwJnA/gSJIu2ADdzno0TMFrnw4YQCtxr
	 Ow+eDFyhd1U5tj54FcyKIBVDP44BS1yUF/aQGA20vr8N/I6XciqTw99BJZYjHJ8eKR
	 KHUZju4XkKrog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CC7B3C433E1; Sun,  1 Nov 2026 12:38:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222222] Kingston USB flash drive repeatedly disconnected
Date: Sun, 01 Nov 2026 12:38:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bram@vandenheuvel.online
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-222222-208809-7k7zMMtUgQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222222-208809@https.bugzilla.kernel.org/>
References: <bug-222222-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222222

Bram van den Heuvel (bram@vandenheuvel.online) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #311354|0                           |1
        is obsolete|                            |

--- Comment #1 from Bram van den Heuvel (bram@vandenheuvel.online) ---
Created attachment 311355
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311355&action=3Dedit
Untested (but trivial) patch

The same attachment is now marked as a patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
