Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793395166;
	b=j8i0nEn0S+18+evvay5lPjvjISVnxIKUpBlKtxPclwecQE+4BjJdKG3CvDJzRPr3Wf0T
	 m3sORYR6tFvAcIYURacaW9sUlSFVOnCfkhgHuoW2TtR2Q7zhy/CzueeDT6DgkNO7miqSk
	 1V7SdRo/a58dBXtA8g0hOhZWwOmDmawGIu3bMSjOFq9bQwxE0SVqdvijQ95D4nOe0v0An
	 yYDHbD3uhB9ONFq+yUaxseCNwyAO7WCPk52k0s+CBlqKNDb2GCxnpIKIv0d3h1SGrNrJ5
	 dJp2yoORLqWqLBSAx8wUIh2Ymdo1zA5akw/PEz96nMyGDQHxQnFnWQPANMQS47dz6IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395166;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=+WFOaIyzGitIfLnKXzEtLK1+DTqTufd2oLOdadpTP/k=;
	b=VvMOMns1HT2kVObP28bQ/nJ9ViKnD36kloe0rqJD7LVNq7bVDK3pv8dsUirN1qq1C9mN
	 wGuRLi30hK/Zi9hfKV2LTpxSWXg3JR4Haru1icipd9vH8oU4J8HuftTbhi4/BBbLjPCZW
	 vgHXsWDB0/Mz/SzeIG0y9erDNPyyEF6mLziprEBTboWUVtXNboq99oVMs7P5MLDUVTSz1
	 k6Fd+TIAvLFOlsrPScr9RCzrh8r1lo+g/IX40jnUwIPhurRmOYTr7wXTNSuPYsNGh2gXi
	 zm+uan0dqXQCPQuL3fpPjXvBvKEw4tx5vTh8HjSNdxrjHPycA/+Ogo7SPKlRZGz3odQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c2MqK2tX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153CD606A324
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Fri, 30 Oct 2026 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c2MqK2tX
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF976513C0
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793395166; cv=none; b=JSjz1sKyrZQzhOA4dx5gitByZXR63BT2mNKM8aQR8k0TK00IVdP191SDP7mSOhOUnGDW3eW+YFQaHedDo6g6/Q3/qDmx9ZXxBdUDFZaHYKjeT5tceIcSIhH8/FaezVIJiKwNySoWDV0ZnIRn4SyjbnHgcC7IqcFL6vByzMy4SLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793395166; c=relaxed/simple;
	bh=1uVIim3t2DbywgdyEg/Em0lBFqDvVemP1lKD/l4rvGU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IeNBHT9lhEHjucQ4HTrcKTNsykqmcwTuPFp8dn1q1skQB1ujQ8wql43JiHSMrLY6PP5Jq74MYZm+HOUzqKKfn42+SCvDkDDDcLF2UpzWfl+MrZgagk4QC2+clC+ezpBItU0UXNGGiOjEZ4qk3ljryx+YX94GbuZdoSOX0sk5J6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2MqK2tX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4ADFFC2BCFD
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 21:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793395165;
	bh=1uVIim3t2DbywgdyEg/Em0lBFqDvVemP1lKD/l4rvGU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c2MqK2tXN4opFreEWHtiVGw8YeCwNEVW5rXR25gClVAup9gMVJjQ1761y6G1KMuG8
	 Mm3zRTYKmiPD6pokprwZ2oCOgkPKYIrqgV/c4sYOpD/7m0r1h5wiTphpLrME3OHXPX
	 omWYzPpYQSQUqRiMdG4DtyC00FWxJUxDbNNokP7LCy68CkEEdt8jjxZHvK0XrrncGz
	 c6oigUVEOhRY16L5Vf2v03mmZrWFCm3uf5NWkkOa2GqR4iHBWLX1BUBIa7h5TGPrfX
	 iKdY/uer0H5FMjMkQm/6ilsqvi3DL7OIBhZl6+vnItTmDH9FavQZnIxEOhuhfTyWtc
	 Kr/N9s0xw1+wA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2A1B2C41612; Fri, 30 Oct 2026 21:19:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Fri, 30 Oct 2026 21:19:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: craig@hesling.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220193-208809-5NV48wmjux@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

Craig H (craig@hesling.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |craig@hesling.com

--- Comment #8 from Craig H (craig@hesling.com) ---
I did a bit more digging and found two problematic scenarios.

There seems to be some VDS1022I, that has been supported by the GitHub proj=
ect,
that identifies as the following:


  bInterfaceClass         5 Physical Interface Device
  bInterfaceSubClass      0
  bInterfaceProtocol      0

From:
https://github.com/florentbr/OWON-VDS1022/issues/54#issuecomment-1120191539


I have also found a owon serial driver user whose OWON SDS1102 identifies as
the following:

  bInterfaceClass         5 Physical Interface Device
  bInterfaceSubClass      6 [unknown]
  bInterfaceProtocol     80

From:
https://github.com/lucky62/OWON_SDS1102_Linux_Capture/issues/1



All variants:
https://github.com/linux4life798/owon-hds200-capture/blob/main/driver/USB_D=
ESCRIPTORS.md

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
