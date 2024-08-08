Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5562F44
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723102213; cv=none; b=S/1JgJhnYmKA/NJbqPNZ0BTWA7hN6kYvfA63zSNMe7Q0bJtolVLfofXnSV+YqWrvC69LhKm0x5nbbEm9K9/E6qe7wfyvZAL99T9Yeupmz/YOVp0h0LM6GYME/pTn+y6lHBWWHApSnkncNufO+lLlqdUgdO0WQKNHQQlbRfwFRfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723102213; c=relaxed/simple;
	bh=GMGhSgs1Ty5tdLz5ppMI2hIpCNQzojCjnPqhMKGSvSc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WOxrDwOZmm69tHUBc0bhsnO3ZKM2aQBXRlkZrdkSusMpmSaocwTMwGjU1RQ1NJD9YZgR6HhOyHs29gTS5qoTh97Jtv4YKB0UHjOtXebbr5A6BD9BZ088q5ahlspf5tOTpb4d8y0eSlME1I3ObIoCvGBGvjeoukzg9s7fA5YfWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaMiJIlb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaMiJIlb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A07B1C32786
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723102212;
	bh=GMGhSgs1Ty5tdLz5ppMI2hIpCNQzojCjnPqhMKGSvSc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aaMiJIlbek4qnele4JUz9k/mBTGSzeIJ+8ItT7DJyVh3wiWAmPYDM1P3dst6ub3MB
	 YH6CSFEVsCzLfHG2JlOD45Izq7EGIZ0p8U1pSPXQNYg8eqW9BHLJyLvAyzZfHe8WvJ
	 Gtv0F+x5sywpN9gVAipz+VMyxbpvSJPCVUUxVITetWvrHGXs/WiKFklzhMBjYxWds7
	 zooTxa5psHvkg2SIV8b7coQqrgEMuN7rYS2gCfZm4kUsdhJEsD97ANiIg1tDSmtt7U
	 KG6npBrpQuCImW+Fp9F2TUBiz0ZqLK0IxW8cR3Oh5Zd++MDQfUJejtaLMaiCGhusGF
	 XkXEX/u9fhIpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89426C53B50; Thu,  8 Aug 2024 07:30:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 07:30:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-c8cs1cuwnS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #34 from CH (com+bugzilla-kernel@c-henry.fr) ---
BTW, I [can see
here](https://lkml.iu.edu/hypermail/linux/kernel/2106.0/02532.html) a simil=
ar
problem seems to affect the Xone:43C.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
