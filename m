Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DB4379ECC
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 21:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769867; cv=none; b=AazLaciNVTlzK0EkalUAhQvBRsDbo5scspfGVxgFDTHnPC5VDwTG4AzcOwxanX5G4yf95BPK3aLrnNCB0WnvZa9xHY8ajXGDVipXMHjbH0mu6z4Nr9Qg+9lUxa9sVGqMLm1hcCr6h0tqSlCK+KvGiR6WJGTPsdlSuoPSJcBI/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769867; c=relaxed/simple;
	bh=aMfaq5kBqZJv9t6VXnoq7hgEWJDr6pi8OYHpeqv9giU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lrvcjXb+/0fKCh3EXA6MW3jxCkUMBYr5yQOzov43eOT/vqDo5p+shW2Y7ysIvwpik0Ed8NSv4vq+ALBGcpY4QqiwXFWscdO0PqIQURQSeoae79z+cdGkBFU2uGH+sp6o5DIVHImbHUk41MQP1v9LkpU9GwxWdfeHZJWNi0TJL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iI2fo/oo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iI2fo/oo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9D54C2BCB0
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 21:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775769866;
	bh=aMfaq5kBqZJv9t6VXnoq7hgEWJDr6pi8OYHpeqv9giU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iI2fo/ooWc+apBzq/qrsHwvkKPOQeZjkdZwTZCoFMjTxDIJjwOJ6P8onbINzyBWxt
	 v/aJ5QCL04f3PXYoH1b0t81nv0Cv3imZN/m8Sh3bbvuk3G9qMs1qNcDvq8lZ/MD2pg
	 4v96uQA4hcTy+SycE11XK8v+rNZVBa4LXb7WfdgiF/alHL2e7egHLrGU03NWvu5OsU
	 QOZjPS+LJ0CiEOb8NbfYiFP4qchUfA7kwuMsFy/dtbfH/9kqqJB/atsPBt8L94ZXvQ
	 78aLiY2KuVbxMaNrmPBFQkxz2hg4Mt8glVUhcJj1W1dB5Xhk/iihGz3wmHHzeeREkK
	 LKPpqfUI/YH7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B9E50C433E1; Thu,  9 Apr 2026 21:24:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Thu, 09 Apr 2026 21:24:26 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221340-208809-nJgw5iziPD@https.bugzilla.kernel.org/>
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

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #1 from Oliver Neukum (oliver@neukum.org) ---
Are all errors due to READ_10 and WRITE_10?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
