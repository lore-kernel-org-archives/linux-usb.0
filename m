Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C0374730
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784916036; cv=none; b=m+axC+XZObGPHmhPX9UR0rPK4exxe/HKo0yTXtUBryTkkkOavvb6XUkFbjn0JNxjA+54wOV1S713Vzl4jcP58nt1v7OaWY8cWPEu4OxJ0bpo00j5Yp1gttUOUjcezrxQhyWbUecWCNTOx6adbQ12fG8N7CdUXHYAGmUiUuigUKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784916036; c=relaxed/simple;
	bh=vmkaleBMFcJQzfuM5e2nDuxXLRHm5zUGNc+PNvnhHTU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rTW2Oju4ZadPdApt2d7I2DeFbSOrsHmabNMXGH1es1+JNbQ0mmodirMKjgXqDYxss6/nXBL5vxln6kGqMbVtNGDJEKyiXlCzjSXjDmnEh3yD4TJI8eXHYRZF4Ul+asUaxTLdulcL4YhEFxJZqJl40+PJqw0+SaK11D9AEe3DXow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcLf6TmD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcLf6TmD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F7AEC2BCB3
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784916035;
	bh=vmkaleBMFcJQzfuM5e2nDuxXLRHm5zUGNc+PNvnhHTU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QcLf6TmDIZ+9pxYlexn+FEVYIV6l3+YQ6pjk6aMSga79UJ5TlOblpfzP3aC+Ho0QU
	 pPNMbJ0DSigMCY9kO/vsQOQk+SUgmW4GmkZQ+K7CkDL1EABYeSVFEb7Q9BcSUPCb4A
	 kCBKGoCKxNGiw9y4cPlYOTMhNmcEAbqjxd7rGTjxhhZ8Zb3lODLV7QTcN/TddbUYuL
	 RoWV5qilYRqHQSubRSG5wGz3XN+oDnnMdfabAkYJL6Th3/5vCWqhJbQhPfpn3L2607
	 zrqpi6RRpMY0vpKiDDx1TCaCbHM7MCQ5b/h2BYBkhY9OF6OlyePxw6kZ5+biMh5Jh9
	 s8DgOrwBXYqwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8D9E5C41612; Fri, 24 Jul 2026 18:00:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Fri, 24 Jul 2026 18:00:35 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221774-208809-ekdWKslnpA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

Lovekesh Solanki (lovekeshsolanki00@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310490|0                           |1
        is obsolete|                            |

--- Comment #9 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Created attachment 310499
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310499&action=3Dedit
Updated: HID: multitouch: Add report ID mismatch quirk for ASUS ROG Z13 Fol=
io

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
