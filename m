Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848C03FB061
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337946; cv=none; b=QwV7afUnGaek1k6Zvd+VW5HqsEuJ1I3YzsFQA4pvZ+gbUeCMfpBjQkPpzKmqShQwRdQsi6KSWSEfKyN8ogpRQ2GsplFnUpTeplLvaTAGs7DTaKw8qL2ztbPCb8veGmwL4eQyaUz9tJumC+xtTOKsShGS1f+Sn87HyPPI81nJh9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337946; c=relaxed/simple;
	bh=+FovjfwG+hnI4zpAH5i4DEdF9W2rNWgu2scvSuXeo8E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VBNOsgdwAirBW8juV03zdzUTxLbgavkUJQCjB46HCBW/PA6XzIRM0pfXpAtWdugrK5bG2ZE5DrqkacdsZo3W7ryeZJDWOMWiq0ATSlR+pFXw0zsVN20iigNz7/QpX7Q9pYhS0xpZExKVMGJgIhnBdwmbMzHDtw7i4ggLzQl9n6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjuyQxBp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjuyQxBp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00B30C116C6
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337946;
	bh=+FovjfwG+hnI4zpAH5i4DEdF9W2rNWgu2scvSuXeo8E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MjuyQxBpxHFLc1HOC8aloioCYUtP/mJWz9GlaZUC1EHPY2yq+P+qBrQLuOxVty9b+
	 cK8n/JwWUklXORHB1xwmXGPWwnKRnpWp4zB7TURUlNrdb19EgxGr9+cCgFnjix8QA9
	 7gK/nG4yYWFMol8/E1iDQZvNCXbaHEPrYiPBtKYE9ASW35lEE78s5i2nF4oR2wS5MD
	 DbJfVZKSeT8AWI985729DX1w61DWD3ydvXherTP3WzYo0UhgLsXviUOlDZX3nSBGHw
	 nRXd2W2Bj31KpLWJW7rJJq1XFs1nJ3CoJTcX+CVzB+Thr80mHPyhVQqJBYNC5PopZm
	 6EwOFo+BF+Oww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E01B1C4160E; Thu, 12 Mar 2026 17:52:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221216] ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs
 usb speed
Date: Thu, 12 Mar 2026 17:52:25 +0000
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
Message-ID: <bug-221216-208809-8NivYcNRge@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221216-208809@https.bugzilla.kernel.org/>
References: <bug-221216-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221216

--- Comment #4 from Greg Kroah-Hartman (greg@kroah.com) ---
On Thu, Mar 12, 2026 at 05:36:27PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221216
>=20
> --- Comment #3 from Vyacheslav (vahnenko2003@gmail.com) ---
> Created attachment 309633
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D309633&action=3Dedit
> edited file

Can you send this to the linux-usb@vger.kernel.org list?  We can't take
patches from bugzilla directly :(

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
