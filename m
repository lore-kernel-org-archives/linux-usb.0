Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D913E5EEB
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921026; cv=none; b=lhEq7suxH8jnKFoMM121qOfo0iFgOwKzBkvBevys4R4pA/uNic/iK0cRT5LAUJuUgM2pdOr8pOpTsgM/lRsmo6u7ej8g47JmGBEWARaO9BTlt7W35iVQ5pYCPB8K3tnm5JBlrj2MvpJ/wENvttqXB8IiGRxo8VFHhZVR/WTa/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921026; c=relaxed/simple;
	bh=LvlOwzfP7R4vSGM6m1gbeld/onSIuvyhJhZLqNx+dvE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lSAbLjHifrlBlfIQxuew95gDxwxkuDvM/SZemRhLP7m0jhY241CatSIP0HUktKNkWrDdGZoSW+oH6vs+vqT5F+YO30OcEujX0S1l8It6yraU7XvYc0WGoGlb7XwHty6rqvTWfONiu3MmX0g9nQrzHFF2utJfAicDvshmvBEVrKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMwqjimU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMwqjimU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51915C2BCF6
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 09:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785921025;
	bh=LvlOwzfP7R4vSGM6m1gbeld/onSIuvyhJhZLqNx+dvE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oMwqjimUaUwSmJfMOPXrPaqRZUv1nFe2ARbNzcW7zRVeXXeoPKIZaeCnOMbYB+H1U
	 XGSc+8GOwJqd8118sDkatGRPqk60oTrLpONJ0cJ7YHrujYyps29tLonTy1I1qDb15V
	 s9Lk3dU6A5zV99xuDCimTfDSZMnE9N+s/F9sLlaj5WBWB7JMOoduIrZUD0xyrrKSlj
	 ylVZMZ+Fk1feugYrXBxbobFFcrX202O07MvuBmxqwG5NKtfv3KvPnEzrgz+Mx925dh
	 iF+9K9pKnpj5XSSZo+AB6gUiUwY0pxTYqRh/DUpWpsOk3JBWdo9OKO29FNF9V7gn5D
	 O8/qZKcNEzAhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 27B84C4160E; Wed,  5 Aug 2026 09:10:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NDBdIHVjc2lfYWNwaSBQUE0gaW5pdCBmYWlsZWQg?=
 =?UTF-8?B?KC1FVElNRURPVVQpIG9uIFRoaW5rUGFkIEUxNCBHZW4gNyAoQU1EKSDigJQg?=
 =?UTF-8?B?YmxvY2tzIFVTQi1DIGRvY2sgZW51bWVyYXRpb24=?=
Date: Wed, 05 Aug 2026 09:10:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221740-208809-goJMMeMU2d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221740-208809@https.bugzilla.kernel.org/>
References: <bug-221740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221740

Wei Huang (huangwei@kylinos.cn) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |huangwei@kylinos.cn

--- Comment #1 from Wei Huang (huangwei@kylinos.cn) ---
Created attachment 310566
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310566&action=3Dedit
0001-usb-typec-ucsi-use-UCSI_TIMEOUT_MS-for-sync-command-.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
