Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535B511229
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748447; cv=none; b=c/Zpg14DimoZI0vrIMUQ1VzRFArY6RQMxFipwHBLnAEfo1GuyX1ZpWFg6XZuC+BCBJQzrY1LJhd2efcGbWvcS6EWphhpwXdcv4NqRXOnrE7AmkCFVMtom+nF95V/naE8P0+AJ+1ztZCmFj7J7lMgVFzXfufW5dD6pviSqqPxNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748447; c=relaxed/simple;
	bh=te9OdAvySPKXfOklRL0oeLh7hnjf3zc3/yR+BE2p2wc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hE4CcWyczcxAJ838wnVruXHpd8kte9AcjXo8TQODjMG/2rayk8fxnFw7pOtNTPUyl5DIm2Vj7ysgP9d+f+jJtV8Ww5xScMw5svz1+P6eDMwYTf51WK1t+VcY21r2wNWke9cHoECOOd/uRc1kB04NQMfajygEVAh1OoDL3m4PBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIrUdVkV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIrUdVkV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9FBBC2BCF5
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789748446;
	bh=te9OdAvySPKXfOklRL0oeLh7hnjf3zc3/yR+BE2p2wc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XIrUdVkVh5Ps4LMt1DD1tKE48FQudkRXV0mN5ix8EmPEaMyIqfHV8uEr3a8dqzDmL
	 LZtIJzGQJsgdgxWoAyWa5ODTocz81T084LFQjePJByRPPyzXGFyoWmZVw0BnhCjHj2
	 3MenjJLBhs8rSkFFkfXQIzl6DwmOGKrk3S8We63PSA/F3gf1bP8tLAIYuMtGNMR+H2
	 BFtU+TxslKabdYiVBU8O+CcMwkQBEfPkrAjy3r+wvZfcQNiRYafm3YH/utvnQ+Fmyx
	 4+GC8mcHdRdauzaynRJN9fPb7Yngg2nPu8W/rMsH2cJNZW4IFnMQ8QlRkLVKXf0C07
	 MmOh+hj4DraHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CD78BC433E1; Fri, 18 Sep 2026 16:20:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Fri, 18 Sep 2026 16:20:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lovekeshsolanki00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222021-208809-8GmjZNahQI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222021-208809@https.bugzilla.kernel.org/>
References: <bug-222021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222021

--- Comment #3 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Created attachment 310869
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310869&action=3Dedit
Reset if Error

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
