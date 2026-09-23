Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237D39A07C
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188500; cv=none; b=dF0KIIdotevMGaoe0TNCsF0qOaSZQ5cZu+nvDUvlWl13UhBmfTMcgfLVMPhNxlv8BFjFJb7QdFGZLAjqSAJSpmlnivubMCZxcajS0IwgU33dkHuE7n56mXHjbsQvhklTdnEWHi/YmyyCvrPUHtLrFQjDe54+5TNHtrErKjTejvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188500; c=relaxed/simple;
	bh=OKUjcIQM5gkxSg3oS1I8O9VzchGVxLroIg/AkCtdQ24=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hTj9UaIP6iNAdo/uEf0gDhKIKSH+oJNbQ6HMiYUSP2rXr23fH1D4bdWvxQ+Wt0y/FbmSElaScX0a4VfY7HkXerThPLE4imlj55B7wX4b6Mobibv0cOWlDsrdmGncyc5EsTEnhzGRkVPAPOTDRV6Y5syLhF5mBIEQCGAtrda0fOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/QkIBLv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/QkIBLv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 649DCC2BCB8
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790188499;
	bh=OKUjcIQM5gkxSg3oS1I8O9VzchGVxLroIg/AkCtdQ24=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d/QkIBLvaYb/BQk7IlFNlUFiOZe/iEan0kK1MdgJIwRottOaj/cDcCJbhLfRcg36x
	 lG/LZKMX03JiR8KwIz8EcMaM/fWuJ0UK5ovorGPoUnl+hSG3l2Va4WsYC8vMEkafgo
	 6xBQdJ7MSrGsFSeUzBLpLI+c4CyM2recS0xBdIMBUywW7TvR8NcgxlNQJW3Ylh9Z9f
	 WDUkdeELq+bVzdCI7BXvc2R3FBpZqtj0wGvJMoIAAw21wkNyKeLV8VgugLP1xjCIRC
	 OG5ZRuzLUCdi3oVFqE992Mf19c9qed8u5k9zgDrJf5jp+fFnnGKMgXm0SagRGg3TPI
	 iUMCVqR+9KhCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 431FDC4160E; Wed, 23 Sep 2026 18:34:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Wed, 23 Sep 2026 18:34:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status component version assigned_to product
Message-ID: <bug-222047-208809-v9aH7RXJ4G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
          Component|Kernel                      |USB
            Version|unspecified                 |2.5
           Assignee|linux-kernel@kernel-bugs.ke |drivers_usb@kernel-bugs.ker
                   |rnel.org                    |nel.org
            Product|Linux                       |Drivers

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please bisect or at the very least attach dmesg's (that contain timing
information) for working and malfunctioning kernels.

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
