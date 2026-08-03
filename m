Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8063081D6
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 05:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785735586; cv=none; b=EAwGkTxqGHL1zoJ3tK62ytrv5Q1Q+m2nLmjDaAr73jomYXQ++nLJ4ZrE1nOXBx36P4vtuSJJrWN9qsYVoSyEMRyFK970mw4devXmio/pW7pzCilL+3DvpsJh8KhMXb3Df0epO00/S5ntp7N6Yu1ZshVgPfmzsRFgUdBXX1p/0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785735586; c=relaxed/simple;
	bh=1WDuJLEFD/s6SzhSjABvOmKjo13QQpQDQBQRH4ImbYw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MJq+18OJ9t6+aZruXoijUqdHwEWXEmlsTCO+SVPsnS+WIdAYmBfxEXUrLBFQKVXJct3FxWxXpgsAQxV7ai5P0HgW5wTtxfDyRVfmCmuL79FS5fiIPmJz2CyHMXYX0AE/NiL5lyarrrmoGponRRLERouELdUGmHp45eTFgU08zgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkj2YjeM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkj2YjeM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D38DC2BCB9
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 05:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785735586;
	bh=1WDuJLEFD/s6SzhSjABvOmKjo13QQpQDQBQRH4ImbYw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bkj2YjeM7UE291v9kON6du1jdPEvrTR/p5otT4Wk2I1tqoFi3F66TgGSRKljAt1ZO
	 /vbwQ74VMXQkBcSN1cP5c0amje6N9CTiHk2FCnsUOi3haIjJtoFQ1wyjRhLo2VURaU
	 b9wmO/hAq/nrF9uD0rrlb2S6C9YJ35yXomaQBULIcG45pfm9GdlJ0Iheg51pTCLNFr
	 R0dI5mcxEcLPGS1snHJ/OXLKFuIVwNWx99LvY4eZbGUl8/OPZIjPwpk6Z0iS8T9VnA
	 4yHZKnp0mrPUXvDKRpFTiHqDj83Mu23gjjFuGQVLNj1VDr0bzXvtbX5Q/45N7dECVM
	 vMzgFq7FfZbcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 028F1C41613; Mon,  3 Aug 2026 05:39:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Mon, 03 Aug 2026 05:39:44 +0000
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
Message-ID: <bug-221774-208809-5o0J72Dytj@https.bugzilla.kernel.org/>
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

--- Comment #13 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
(In reply to mayhemandcoffee from comment #12)
> Hi,
>=20
> I tested the updated patch on Linux 7.1.4 rebuilt from source.
Thanks for testing,

> Results:
>=20
> The "Returned feature report did not match the request" message is no lon=
ger
> present in dmesg.
> evtest now reports ABS_MT_TOOL_TYPE, which was missing with the previous
> patch.
> ABS_MT_SLOT, ABS_MT_POSITION_X, ABS_MT_POSITION_Y, ABS_MT_TOOL_TYPE, and
> ABS_MT_TRACKING_ID are all present.
Good.

> KDE Plasma's Disable while typing option is still greyed out.
This was a fix for bringing palm rejection back on the touchpad as you
mentioned in the initial report. You did not test for that.

About disable-while-typing feature, that seems to be a seperate libinput is=
sue
rather than something on kernel side, I looked into it and found a commit t=
hat
may be related
https://gitlab.com/freedesktop-sdk/mirrors/freedesktop/libinput/libinput/-/=
commit/772c1f5ebb4a4122d55fc392a690056d8c55809d

Perhaps you're on an older version that predates this commit?

Anyways, could you test the palm rejection and let me know if that is worki=
ng?
Since the fix was only for that.
Also, if the patch fixes the issue, could I add Reported-by and Tested-by t=
ag
in the patch to send upstream?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
