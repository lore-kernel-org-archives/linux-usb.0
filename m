Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E41A262D
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775426955; cv=none; b=lCBKIlqeWq156SkuNjJiS3czz70WKD8qu6WEV9eahWXDw81HHjkEoWPQQwpRQVxzoeTxxsoNgVd39/FoGYxvpwgFQyDNWxWapcH447JNzsOlyahAX1SD1ymu0QELQ4hPqYNSpLdkzSKObvhlzS6r0yUZXG1Ale11TtEOvNIpJgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775426955; c=relaxed/simple;
	bh=fwPf8SnE2lP2YrWjt8rPwuwbLwW7VJ1lxSKhaoy9cbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oC8J93OQdxOf/4rvT9PWEMakkCt7j5pz99aqx4TjLxMJCGQe3O6i5IH5lC0Lase/nMFbDOx+LVe6foVYYZ6G46iZplAn4A0CXhooWrIga/1Jz2ccIvyQzGKShNcgSVTbWbydDYwi+vZchrUgcRpoA7NHW007dYRVyvv4ahU2Eng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sB5WRg/u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sB5WRg/u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2604C19425
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775426954;
	bh=fwPf8SnE2lP2YrWjt8rPwuwbLwW7VJ1lxSKhaoy9cbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sB5WRg/uMgvPgHs0+TQiXpjmObtFhEAZMD/0LS/5JA7UBrKWgbQUCnOeupdVPoRDK
	 ERTliwr0fMzneCJVBtVzucuBJXGeWlt7Fu4lrGqVBYiuXE0NHtgohTezggHtSQIS1U
	 iqYr+ZQ7susQ5/ToexM5gSAKlrMIPo8XcKpRiAdWCIixHGtf1d+TWV5CHnXu/r4Ys0
	 HKE/k5/Tbzrmd4zxmOvDr/4M8NBHzozivpFsUFk6agpCTGqCrqtRr+s7brSrL120u5
	 4DwniAsS7QYpicwB2O+4n6IC2MX6nKHV4j4NKs96ZLR0RqyKa6ldCk0zw7pkVYZNu4
	 FS826QIUzbjKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9AF0C41613; Sun,  5 Apr 2026 22:09:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sun, 05 Apr 2026 22:09:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221318-208809-aUZmNxDOWL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #8 from manauer.uel@gmail.com ---
Created attachment 309827
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309827&action=3Dedit
dmesg -W with connection through Thunderbolt 2 udev-rule on only

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
