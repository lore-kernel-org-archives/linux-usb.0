Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E579620DE3
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775324102; cv=none; b=UZsKLS/mFjfe7EF3BTcd0q33sml4UfjEeot/0pNZXw21x7JarJRIJWlfYgqgutgCNKEi7iYMe523pvwe2qK//xZ6E48OVnLoufuj4P4uGsyBNwWIV2ZzubQ8wHrk2GNBZVHqF4IBCFyjJ8PKQpO8wAWSGDdU2ketqAnC+QjtCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775324102; c=relaxed/simple;
	bh=OO4ysjAmguH/Z35/ZNJ8shXAp+DG2Z2A/W6mXEi2vQc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hyUfyW+eKdsQowI58iW1Cxd3Sr8KhhEkkOiNu/XMEzeMCiuVG8yF1Ews94nQ3A0CL4nvVvghykszRyvfm/Io274sueO6l4YlQDDlZ9VIKrlSIAfUmvfqvYuuUiqzZylqzHRTTXEL8m1i1KO4vkb3iRVZWDFeE5tlSfdq1pQEXzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tT2Navdw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tT2Navdw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88FE6C19425
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775324101;
	bh=OO4ysjAmguH/Z35/ZNJ8shXAp+DG2Z2A/W6mXEi2vQc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tT2Navdw8txYofO+P8ONTZRrxk+/bKyZBsV6dqyH8qI1EJ62+SGNr4ZHVEr04zkNi
	 vHf+iz+673dA4ZyjCsCu3TJTIiZGpSV0vYyX+kNvdBNZC7J3IgNCHkRN/tj5SnrmH9
	 08Ktih6sizt+UR8cOc0dg3iR+iMKsQLhKLPBySOSCEE/OgWRC//6xKHVrqwB0p6+YM
	 cNPx1SPSBQS4yaTedVp6S3zwhsZsvKxo7zuV4Off4XNWSQmw1q5/1yc6tIepIIJn8X
	 IoQjTmMwGL3punogGg0A8wfe0Frd/jZopJ2qGeyAee73eTDDMndq5Hs+kEt/MfoRPJ
	 gE7ji8pisaJpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83931C41613; Sat,  4 Apr 2026 17:35:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sat, 04 Apr 2026 17:35:01 +0000
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
Message-ID: <bug-221318-208809-zrblumWz2I@https.bugzilla.kernel.org/>
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

--- Comment #5 from manauer.uel@gmail.com ---
Created attachment 309818
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309818&action=3Dedit
dmesg -W with connection through USB

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
