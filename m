Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8D4F7CC2
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188579; cv=none; b=euGK9tTz3kzCSlzL02bpe2AJ/IScGsq3J9XhmgYS6Yhx0vY/5rx+/KiiefdAeR+lE3oQhYX/vwkaZDFUQdBLUnELHrhK83HFn/xYVFRNS3YQLwGJfpfIm12PysLQByniRTRzlZDFTfxXibDt/ainUZjrof6crIOEK8X6IoE1tXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188579; c=relaxed/simple;
	bh=YaEcTpfJffbleNMF8PM8Aw4ztRHk+0Sbygv1DR63vME=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gFcbctJbX9dX/pFyz3n3GMn6fk0RbTJ1LaOtjvoyD58DBIAxl+ZF02K3+Tn4zgV9b6EuUzgUV6DvnktDyfiAoczusBkLMhKMYj6TTrkbywqWJfdmLl3V4TzI72KvHSafz2WfLKLLbQSs6iUq7s2f2j+KtZUumLDT/14O+fODT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIilLmUD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIilLmUD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 220F2C2BCB8
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 18:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790188576;
	bh=YaEcTpfJffbleNMF8PM8Aw4ztRHk+0Sbygv1DR63vME=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mIilLmUDv8HfoLJ6GzuD1buSz8w/tmO5I8EmKb3rc81OOvzwUwQZdiG58QS+9zQKD
	 kniJqTVDhC2NfdkM28sViWR26G69nDFpAs93bo1RPdYa+kT6iwYxoyV1ftgdBy5AiD
	 7ozefvGtIufVW/can4Ed8T5bNzW42Oj52dX1Hanufuei6HM39gSP2BcR4p/hb1sUW1
	 qQY9E1l9iuTxZlgnQ17TRH4iQ+yNbNKIFKgLO1XGErPXybzX/vYrozHPkBXUExG2vH
	 UeL+FMmULFhsQt7yXypzLmge5YWZblwKbvGIpn4gus/GmREsBz6wW32iz/cpgpITpV
	 VC2ONq2NS+BAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 06D01C4160E; Wed, 23 Sep 2026 18:36:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222050] Periodic ~1s click/tick on JMTek USBFH11 (0c76:1720)
 USB audio playback under Linux, not present on Windows with same hardware
Date: Wed, 23 Sep 2026 18:36:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Sound(ALSA)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: perex@perex.cz
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-222050-208809-Gtt8OYPzmT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222050-208809@https.bugzilla.kernel.org/>
References: <bug-222050-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222050

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Sound(ALSA)
           Assignee|drivers_usb@kernel-bugs.ker |perex@perex.cz
                   |nel.org                     |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
