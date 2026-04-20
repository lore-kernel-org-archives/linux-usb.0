Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739043876DF
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677071; cv=none; b=TEEtAonfTGvAQc5mWdUNXS/gwOn7pB5+WmRSsTvKsecE7F2lEIy+22JVRjc5uoyDAUwi4ANEvwg4ZyjibhPpl4HrLpCvYofi9nRjtPVwjgdMv3gKG+1E4v3Bf9laQPtd4BCm9YamL8rUS1uUSDGZEiLOO1IP4AgWqcxLk9H2zGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677071; c=relaxed/simple;
	bh=0g8fWXQFbZux3RRzq4Q/soXBj7bPi+AGSRdUIfTSy2Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qr4W6I8I+X0ucFcX2GtKc5JqzTHAi6DUFIkb6QbDTM2EtZi8KnODoon7KofAz/qExHO60/5mDuHw5sR2AreHLuJkCM3ukivZSjNWBNFuaq/V4BF8YXcGfEjaIxwvOtYIg42vmrR4owpsPyramRbD5P0OnIhCv2rZ8BOjuyMWuAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNvMqO1v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNvMqO1v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F227C2BCB7
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776677071;
	bh=0g8fWXQFbZux3RRzq4Q/soXBj7bPi+AGSRdUIfTSy2Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lNvMqO1vzGE7KoPIJ6RZD3QcD/slOMjzl79F/mqHYXxWEiuOmecma9wCUJ5zvb1Xa
	 +I74Xx9C4/aTSXk7bdk7sDQi8GEPseyDm9S1I052wodqE3lpJL3KwxhRygjyDASjX9
	 Hd0GCJ1A2GuNrgUpSZRykQMxsKkZk6cTNmQWPDwzMPev8q1Sm9XS41JzGsRtb4+FtO
	 usXiVGHvYV1liFEHsl8w2Ytn9HGSV3+ppf4uvWLkyjShJWBlD9o8s+IJFSfsUuTXVg
	 hanoFtOFaw0Qgve3/pe29RRf4anJ91zDV+XZUq6hi/hei/fHt4BP4LhuFQlte48LvF
	 /Xkp33nJ+XlSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10BA0C41612; Mon, 20 Apr 2026 09:24:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Mon, 20 Apr 2026 09:24:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-zrFxkDCfPT@https.bugzilla.kernel.org/>
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

--- Comment #12 from Oliver Neukum (oliver@neukum.org) ---
(In reply to DaisyTheFoxxo from comment #11)
> Nevermind, It happened again. It took longer this time though

Then please try the 'm' quirk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
