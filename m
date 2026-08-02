Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BE175A81
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 19:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697827; cv=none; b=ok1mtLTeKnO8H73haG7HxHrPzfnnmH0fR0jYIx4zv2PbnrzFIckx7ucYVDsiCZcMe6B/Z422ijjsdLPuYM6hT5hUETFooiIfzaiHgmHFtmccm30+sUi4RErmhh/53PH/gUPPcMQ6KBGNYHSMzhhtyt4gL13J4aRB9T0WnvxDNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697827; c=relaxed/simple;
	bh=Q0EDz+CWOGaRIi6PFiKN+tOPbzszIfYTvWYmGCeKlB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MqbNu2h2m6afpP9qDR62ax3NftmLWdYeij4LuC47B9mLWjfbOEsbGNrXKmz7vEywY5nDJf7MBzwXyekVzHvVhpZxnVYR1NCsQmik/WSsQLMPMjL/nTzv+Pan1aZLfKVXl7om62um5/FYOt0gXfC3FcduFtCw/kq7CyLDe9W3y7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxYeMVkj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxYeMVkj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99F85C2BCF7
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785697826;
	bh=Q0EDz+CWOGaRIi6PFiKN+tOPbzszIfYTvWYmGCeKlB4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oxYeMVkjsKcjcxL3mOp4idQcTNc4uhY4Ky7fKB2Bt3zPyatvY2Ia5NzDpvr47UCB1
	 3W3vnxbdJt6mLCe+OPhx2oL6aoG7OFddJiS0MDSqze282W/4UKCyCdZCkgWRylGMMb
	 5u1VD8qz0Cb5cvboOmEG/M+mwI/Cq4ZXTsjlXzBBqmCKXmq9e1WMufGZr2wOiEU3jQ
	 nwagx9kFFcns3xBJ28KOx5zTy7feardoKQhIrUyDMbsMlqPWWczHVU/h9iohGC4tsj
	 7gx3eOXI7oMfg3UfdvfL+fdFaBO9rrTCWGijAOlDF4WTikJ4j1cKWEMzd840D3mYcT
	 L+wO2un6icxhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7AAEBC41612; Sun,  2 Aug 2026 19:10:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Sun, 02 Aug 2026 19:10:26 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-GiVlG6p6hg@https.bugzilla.kernel.org/>
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

--- Comment #10 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Hey, just checking if you have tested the above patch?
Please do let me know if it fixes the issue after you test it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
