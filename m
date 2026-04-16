Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CEE396D15
	for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334467; cv=none; b=WMExvTDHzgwkRYMzRKuCxROz1bdoxvQ7TC2rHCsdJ9WpjUCDc3aIrw6RMxDJ44kDs/DYM5WAyZD8abgb6IcHFXJmFnwIglr4MaMb8UJy9Pj2CPpK8l/8n/nhtPI62XHqPTg+0gLgZlKdpkejFYQJDoPR5oioryMxA1iFLRRbRy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334467; c=relaxed/simple;
	bh=ruTBe3fuW60ueJovBZFp+pL91g9Gsww+nbhDHqzmWp8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YsDbKen7UE7a4jj6KjVUB8lUiGF2AX4/C1LennDIO2gD5PqVHA2icWlNbP4pKEgmPqODT5cOeoqcxPpWsxbjQiC1DE7Ig90tJc+nvAjGXt2sX2LdLV72bVYGdg01mYmvSPmX0EhOImOIQ2V2qZ8nME10DxhRNlbGEKxtG2cdRks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLmP4u6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLmP4u6B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C983C2BCB6
	for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776334466;
	bh=ruTBe3fuW60ueJovBZFp+pL91g9Gsww+nbhDHqzmWp8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lLmP4u6BuTHLUqGo5cmNqybvErQ1fTzH+r4gI1BuwmoRKWRH8QovB1ErCPDrsD9mW
	 /Z8Lfpz52aASWQRiHOeGxfmfNnzZYKJXyAVQ+XVckbzjXUBW4KnYPeA512Lh2LRdWW
	 N9eti2udvtSFYybTBYwZ0szWnZfl367l/4aFb8ceAJye+Dyhw1Kwrv/5I5MvdPk6Y8
	 vM7lNfX9AI0ed5wWlw9CoCS+9mocw+OOmaW679UESPPxACJgrKKMPWOnY2wbdmMXBe
	 HKLt1uuT0j+SHNG1rq9cq4dXopNog7YECMfgNZ3D3wc9nZ9o/XGpevpLtASCNbNI8+
	 sEsvmqL0ulcEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7FBFEC41612; Thu, 16 Apr 2026 10:14:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221337] Regression: USB webcam (0bda:636e) fails to resume from
 suspend on 7.0.0-rc6
Date: Thu, 16 Apr 2026 10:14:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: v4l-dvb
X-Bugzilla-Component: webcam
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: v4l-dvb_webcam@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-221337-208809-hiqDSJ5FyU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221337-208809@https.bugzilla.kernel.org/>
References: <bug-221337-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221337

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |webcam
           Assignee|drivers_usb@kernel-bugs.ker |v4l-dvb_webcam@kernel-bugs.
                   |nel.org                     |osdl.org
            Product|Drivers                     |v4l-dvb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
