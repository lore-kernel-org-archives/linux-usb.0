Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A438425A
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786318532; cv=none; b=AtTC6JBHkTdHcoeFanppCfWBrrmWnxMTiNaSz59updi0u+o/Bjhoju0gsiUsTi7KaPZn3/ad3NKDWnakkhucac7dMLNQ6BbgXsT4QGCe3ZjoHMVxFRbgcT2NdU9ukDXjWyPYJ2Nf0+DEQeKquOCOt88gQwcGOVL6kgp4jzEvwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786318532; c=relaxed/simple;
	bh=W2XIAnVvAMo2OU99YeMzNQOpabKjEgQfKLo9l0z9CAk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m8a1g6vASyxzpbf9W05+l36bawp4D+rWtdemaUy2rccUViILq5m5RYMH05mly9YrcqLGX5kIbcAbWn8T3OdWPtxC3U1t4Ae0NZaLqTYL6/tcQuXW4mz/j7pegXR6TXLVorQFJTQ3yTr1GUh5ZpYqTG99q4RvVLVJy+TD1oVO4h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z30TeKny; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z30TeKny"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAFD0C2BCB9
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786318531;
	bh=W2XIAnVvAMo2OU99YeMzNQOpabKjEgQfKLo9l0z9CAk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z30TeKnyz0hg0k+0wdA7Gfvg9k1mJCfjX/c4tigy8bGp3j1h3YURAsSPET0mY6TNc
	 JzHRDTKpDAQhCYEJYZS7HZq2qRUaUC38d3Y4L5lk3LschdG27hRG4X3pj/WT0HXUuk
	 McqoKNjiZ3jdfqp/IdPhy91v7FeVyZGsnSTYhF+eHKld/I8u+rGkGkR5H+MuwgcV+l
	 EzoPlgPaxOzrdEIMJrHjMA4exKB38JtLtcXBf3bt5bZDeq4N4l+8murAQU4z7y3pIV
	 LWVf8BDuUdceg5ImYPeaTD+JJyagJ/0G+T/EvXNNsydeoEySs2T2u8ABv2opuUyZRC
	 IYE3RiG5vIYQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8A0DC4160E; Sun,  9 Aug 2026 23:35:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221861] ucsi_acpi fails to probe on HP EliteBook X G1a
 (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot reach 140W EPR
Date: Sun, 09 Aug 2026 23:35:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jayden.blain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221861-208809-jJOXXYwNde@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221861-208809@https.bugzilla.kernel.org/>
References: <bug-221861-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221861

--- Comment #4 from jayden.blain@gmail.com ---
Created attachment 310611
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310611&action=3Dedit
acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
