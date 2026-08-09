Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D64222565
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786318464; cv=none; b=dY/UQnWJfblQTExR7Usv7I1yhNCrAnDWyhmZQyUUsJXizR7S9r50mtAvelwwjB2Jzh7Qtate9WIqanrQI0RBGzHU16ftWhcKmqpzWvRSltBTp/o5RezvxUfa02HL0kpaEGcKFyDDP1DYrQUjErl6p8Ir73yupphavifYbfzPnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786318464; c=relaxed/simple;
	bh=pRpSvMnpH3uqYi92XkTKaJ49Qri+INyol5ovaU6V1CE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ucgZByDIZ1mF1tH9uI9yKLmMJna4KK3Q5jlbYCCTP/vitgeOZORm9JvffwPE9048AhQuz33JqFTmgyQ0oQbbONwImTpKCyGoKzGU2xys1JjKlBg0MyJDjYs7RP7nHrSeRYhmV42pTBjiWHb4gpyvZ99gfKWETUZtxMoP74XU8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqpg3cFu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqpg3cFu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E472C2BCB9
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786318463;
	bh=pRpSvMnpH3uqYi92XkTKaJ49Qri+INyol5ovaU6V1CE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eqpg3cFuHLBwjAaFo6NAi0hK/JXHbhoNhAeO45tcq5sKK2k9Pcfi/6r7NsZ9ISycv
	 9pY7p5rkNFFnWjKJY4W+vJ0t+j6bfY2bZAQjzNGDIF0mBi1tB5531RBzf74pUByyiM
	 UwtH3AgPAPCLczN3YaJ6dYTKPGov6p7VRr1c5p1Ka0VMq/rQ/qTCkAwaO5IzWQ/X/5
	 tefm6QogiFVE5vcnrZe0pF6jo6SuFYCq+Z1Kia/HnfYx5nRjP9hmz8VQXkndOmX7dC
	 7ZKQri8JHuSVdJRpTuCSlAglH9zlOjM9hrulXMrcHKhjhaXjOblodjSqAzfrjeT7RF
	 eFjFVEjEf1TPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DF29C433E1; Sun,  9 Aug 2026 23:34:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221861] ucsi_acpi fails to probe on HP EliteBook X G1a
 (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot reach 140W EPR
Date: Sun, 09 Aug 2026 23:34:23 +0000
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
Message-ID: <bug-221861-208809-IldTW1tg5O@https.bugzilla.kernel.org/>
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

--- Comment #2 from jayden.blain@gmail.com ---
Created attachment 310609
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310609&action=3Dedit
lspci log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
