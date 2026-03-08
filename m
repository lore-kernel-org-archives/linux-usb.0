Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D981F4CBB
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772984346; cv=none; b=UPrXNnyt9R7/ZnjNjHq5qPcpW6OhyNhFVgWxVhpDIOA0pm9qREmfFno1OOZ23NF+weDFsm20lYNyf7Gc4TVfntXumQC/zT+Co8gvIi+dsYJxILnlknbuAvyxjjarVAFPP7oS8nKcc58k4H5UI+R6MQy2mVSdUAAGUoQSVcdwG0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772984346; c=relaxed/simple;
	bh=niJyMnkrWUEXl7T+15qxPlhTGAmZKK5LIiwJEpvClFY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a2aEIOMq3lgcYHSI1iCpfHoPtD0oOHuw7BdzeM+DBuNv6ZEYdtfOPrnZmiXs4cbcTDCw9BFcVcGaqnSV8X1Lov0X9RH/2dCqfQTZLTnCOjVH/K8z5b1bEjn5x4sPLRU+TeTPSOqohe8XzqrcQfzat/BM6HLe5thPpQAeUZfAhzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uM542rdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uM542rdC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 921DCC19423
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772984345;
	bh=niJyMnkrWUEXl7T+15qxPlhTGAmZKK5LIiwJEpvClFY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uM542rdCfSust5Xm76AqtnSLoCQfiL4KB94EbKJSCnOK3iiEzLkQS/SHwEe9EANFD
	 b38RFSP1oA6sIihSfTXY4fF+8yLXw4uNQWLoYZLA6hUz1TeVQDGCSG8WK/vmwgGJvV
	 c/OA8XOdeU++yYMGbFbL+PP2Rj7c2XcsjAwiBrENPEbvyErwj+8JyKIDt4uYpELhLx
	 j0/N6bvPKcWc2wE+LdQfFl+FFTOFwe89GBlNP+rNbhb5QKQskd5q0dSmu8tlLG+eiC
	 VqPuEvKIQ267xR3ieZMhFta+d2PNb8dL73M9fCppuQJddM4yYNwebCRFzAz+oghp/b
	 9DOROMhhGe7eQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83EFBC41614; Sun,  8 Mar 2026 15:39:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 15:39:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-URvA2Tk7w0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
In the patch's email thread, Liam and I are discussing other possible
approaches.  One of them might help a lot with your problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
