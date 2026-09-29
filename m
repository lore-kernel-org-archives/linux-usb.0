Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3BB2C0261
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702243; cv=none; b=kByNMvV4RuJCk01O0839drTMYYjokeJ2m5rUFFbEpMqCVETEydhpARpGqZOvj/R/DH9YxPY76L0/3DxSFcaYxmNULuyfPoy3ucm81V2JRyf8DWeRr4piyWfGM11t0XdR3TMU+FhWDDSYtWb5VWwnilJNDcXuAadYPDf3KhBnwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702243; c=relaxed/simple;
	bh=2RKml/sBpxIeqEGoPifHqLa2DHVcW5hn7+Rj9AtFypE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uTYGo9QLulgxq1o+kCTsOQo8ghiz7I9fMOVnDSK2guOWnTFZbhE/o6khR4qtOffo6NO6IeoQmV43FZVUG3+pgF0waeYu9eNtl3pzGdwKUNFNkJlhYzGkPsqyirw/reuouIN/0qhLbhOlhVS6C4rtaeZCeTIay9+PhsOzN5Cdqh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOkzH2iU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOkzH2iU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BE25C4AF15
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790702243;
	bh=2RKml/sBpxIeqEGoPifHqLa2DHVcW5hn7+Rj9AtFypE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GOkzH2iUe8RRcq54AcU+RVY6A6sAHZ7sCfLeFDh+Y12Yejnu/xQZYuqKYJNy09c4K
	 JbEngF6fLQ7KxMz5LVlk1norPCnAY8ydQrSZYUfe2V7pZZGCqsKswG9XRvpsph2rmV
	 W/mkV+v7YvOxNXe5zxAmbqHodz3/J+fYfGF7+baMrURlm9IcRfF9IWcHYQfOdtkzqM
	 ImbHoG1yFgh0JHJ8jIZC+wqfH/qGy9kLs22YhNmpWenEU7tRKAARWNIsDPG3AZ52wj
	 z6CgN+8N9OJZGiG2B2fycPzr6GmDT0dudBa22e6/ff1ADU19CtRqRZM0SHWkMVZh2i
	 gVGwVr5r1gdeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30C4FC433E1; Tue, 29 Sep 2026 17:17:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 17:17:22 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222071-208809-J7lQqpXcxf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

Lovekesh Solanki (lovekeshsolanki00@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lovekeshsolanki00@gmail.com

--- Comment #3 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Seems like num_active_eps present in xhci_hcd does not get reset and
accumulates. You'd have to do at least 3 resume cycles to reproduce it I
think.. Could you test the patch I'm attaching. Try like 4-5 cycles.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
