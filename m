Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA41182B7
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771138759; cv=none; b=FQQ/PPY2g9+OsyT/xF8ZctSda8ceZD/7gG96MZqB4drOzneUQ66lD35nw8O0TRhHlhb89nJv6Ab7VDIEy00AnaBaYkY4Ix8Wc5/Hz8mVcVSwWNBEercTQt+08gU7vzRGtNudIz2m40PoJywyEQKAifbIza1+61wrFJWVHkG0BlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771138759; c=relaxed/simple;
	bh=7oY9A9oV0ac3uZZWjLNbUhs3wEGc5nD7gdjoKA0v2qw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B4eNrbcb7cZceDOCV+iaeuS6OMAhlfJm0nZDN6KNnSGiwVLRAIxDuIQrAXZ4t52AS3X+rf+0QSaKScRc/qeVHbGJzKrGzxU8EkQNMW2+9uXQnve1/o06c7h3WuGZ3c9b2vjE7Ob9f7TpADyOvqE0/7UYi67p9K8B5TtR7pJz0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4xS9XP3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4xS9XP3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D531DC2BC9E
	for <linux-usb@vger.kernel.org>; Sun, 15 Feb 2026 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771138758;
	bh=7oY9A9oV0ac3uZZWjLNbUhs3wEGc5nD7gdjoKA0v2qw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y4xS9XP3g0mKkh4LS9IKk8AleQ2q+kHCZ2WI2SZcAgstsc1vllBqNFPu0IoPQHMKh
	 7d0DP7T021SGApeBomSScqVIJbieSN7owcf4ZIqDBbNMBZoLSbUHpaRAc5R8Ug3N2w
	 l0xId4Z+lYniVY5fpZRh4RGg2Y+I7FzKwFg8cpQ4Fl7QyNOs+LkGESnG6yZt0DRZ13
	 c5wOWt9XBMAWNRR41pxsnivKWp1pXitnd6/xfJjSNov5IrcPZezCElvoJTtvMbmhTB
	 wdQq7pzNqbvD4MHM3wpLUTW/Jso/VvwXI+59wIi+VyAQ0N39AeIis8ZP3+Kp9VjYzf
	 +l/nPlKdB7y2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CA344C53BC9; Sun, 15 Feb 2026 06:59:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Sun, 15 Feb 2026 06:59:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-VtSAS4UfLK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #15 from Greg Kroah-Hartman (greg@kroah.com) ---
On Sat, Feb 14, 2026 at 09:27:56PM +0000, bugzilla-daemon@kernel.org wrote:
> This has been solved by multiple patches including
>
> https://lore.kernel.org/linux-usb/20251207012059.7899-1-johannes.bruederl=
@gmail.com/
> (this thread) and
>
> https://lore.kernel.org/linux-usb/2026020536-bullseye-smugly-4361@gregkh/=
T/#mf7393976d02d49cbfdb9ff5c46f030dfc0f7a6c7
>=20
> So technically you can make a kernel yourself and it would work, but neit=
her
> of
> these have been merged as I think there is confusion about how the cards
> work.

Yes, these have been merged, please use a newer kernel version please.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
