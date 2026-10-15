Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7A03CDBA4
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089467; cv=none; b=Cqj/h8W9E9S/NsptMCCvILSzQn7Kx+9A0Z9cjO25p6DuYycb1MwE9A37MQynvahAZXWmrCxNpV0qNXEHsGWSvjG0Su1bwoqM6mfXhEuwrLVixhHzpczGvL6ZLPXDvPsVSlO+QYHx5GiyYHwnZc1C1KQ5SqQ/MuS1FUSC5D1Mub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089467; c=relaxed/simple;
	bh=niEjWd4Yd90MpBrf8f3GrDBfLxXJ1o5x4KSf53Y3/9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRI6RgtrrFe2gBlIEpvYUS7aqs5+ggvAmOAJf2sKsUEc2M+587thvpdbFxKiFg71hJ04+4YAuAMyLUbVgNAbseaewgvRtkJDca+JGufrSPKnp0BOUrjkQ+YIGOLSP4yfMAbvRcYFogO/7m0CZEWevMLYd5LJByls4kNNeXunAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux/4FBaT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux/4FBaT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB68CC2BCF4
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792089466;
	bh=niEjWd4Yd90MpBrf8f3GrDBfLxXJ1o5x4KSf53Y3/9w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ux/4FBaT9nMzZX4RAhbPVybudKw1oK7P7h+LPayaIM54ifBf90FkbCk4/HnF2OQlA
	 Sr63GyunrJJQQhkR5m9+CffIad51TyG6jdwPzmkE3ysSSESQ+AFz4HhKOwYMA0WfBr
	 QTxXdhnqD1yYe80j6tKTBT1tGxRSi3W1mR3WMrhFXK0DjXAVOLJMOY1MTP5Q1u19MR
	 N+tK5hkLEBrl5QX8afdl4JyG8d63azahJYzqLkdTpmjutfxXh+DgxIeYm5c+iEj8ad
	 f5pynyZ2OlyeK/Vlnu6H1z5TDdoRAQuf9Ljemv6FvKhjRRGQu2TH7B3aPYpmjGZFoH
	 4OCloOQ/scYEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B9DA2C53BC5; Thu, 15 Oct 2026 18:37:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Thu, 15 Oct 2026 18:37:46 +0000
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
Message-ID: <bug-222047-208809-EO8WAOhEHp@https.bugzilla.kernel.org/>
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

--- Comment #6 from Michele Bezzi (fastmichelebezzi@gmail.com) ---
Created attachment 311132
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311132&action=3Dedit
dmesg updated

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
