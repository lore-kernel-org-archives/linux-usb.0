Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B8F20E02A
	for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384887; cv=none; b=OqDdHY9FLAqXa2S0A1u1MoEWNGCkst35XL2DQ+EdvsDYGVh25nK9WyzG+65jqxHeApw6LMktr89C6htgtteWKkEVpE6+W4DLhRS1iOiJbfnaVjT2SBX3yvnIjUyrrb195P/Up7kgTbmjxjm3aZkfRdCKpKPdlHdNwjbr7kvFzkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384887; c=relaxed/simple;
	bh=yZoGzR5OjVHDrz+LmemxcMmvjUOdeRAmgpd2vUz1JQ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=icfBcSj9NPRD9smYZ9u3hodvKTlyl0JVvA0SxB7Q6fAQeUHnbzwEU6HGGDksYch9XIN8sNzU9ApThqDek3Th6rNCqDznV3VAmUkGJrskDSsyC4t813fZ/47H/aBZ/KhpttKSLi1w0xQBsa1SG39D3Jvd4kdPk2kN2lzLde+E2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpSossIe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpSossIe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93903C4CEDF
	for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 18:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739384885;
	bh=yZoGzR5OjVHDrz+LmemxcMmvjUOdeRAmgpd2vUz1JQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lpSossIeYj+Ckfwuh1pwLbePjkK60PPR8AdHRUQvQqZo2esN8kx7HjnN5uBtkCm9j
	 um5mj46VD8DlI0vHva04KhtTAMMdhNOMwegZC8qH5JpH4X06xf1HfMHkcsGKEF1yMk
	 B+9bQz4UWoxSG0B5J1iyvf3xGUQHqKOkiYxrMSt/SDMPuISxFVP1TUPh5pFtWGO8cE
	 uqf6FkHsHCzhvDyeTimqm7DNfBKroEt0DnbjjqpBmsaBrj50mUMkggT3mvZTVIqhQw
	 o1iamLOEDnZebSGJRWLH8KrlVISN/EoVXXWxP0ZMYNRfuDi4CLx0Ox7RfVMKaVHSSV
	 chXcUn6CHZM2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B427C3279F; Wed, 12 Feb 2025 18:28:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Wed, 12 Feb 2025 18:28:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219773-208809-MVSrU0swqP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #3 from Frederic Bezies (fredbezies@gmail.com) ---
Created attachment 307639
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307639&action=3Dedit
smartctl infos

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
