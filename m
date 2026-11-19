Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097647;
	b=LaS6XeCmq5kzCYHaIUPWzmD/Yy80qOuXKKRM5zvBGtUg4mBasM79C181HuTW6TCNI7g7
	 F4j42od5+553scLIWnxeYuK1THbSmVOIE7//ypptnrSuAQU8uTgGWq468gfMKIu6K/TQ2
	 hmcIdcbEg2xXIIsrgMO7otmdHMfG4jYSzugmSMDVc6oKEtdXzIkDnSuwln2v2jRn92VRK
	 caP+s/PhShGRUKWq7EO/2TJ+Jh0Kb0zoP+Ce/CYYUTHgT+tocja6F+PlsDXhqgMBSCzGZ
	 dd7xhkjn/xzd8WrvLMZJ4lmhik8+zBw92Bw8kyVD1g3m/up6OUeYhj8u9nJX4dXzPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097647;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=fyky7CQAoa8W8idNT33FUVadF1x9+bnPALmn03HmalM=;
	b=VYI27s20k8qVUFTh9vU2GOcnmMDaKiKi1Xuoe/j/3B8XUXwjpGH0Q1fMHSX60kY5enGH
	 79W5J7lTlupXxsq40UlYdibkcg4PXhIEjjf1rKzo1fP9QtxEFYWALXsxwDo/fEaKo5+00
	 EF8Z8fqOVJ2Em7pSYH4g6QBFp1rCUn652DSAZu7VYIj9AiHgK8pxpWpjrqw+iEMPThMtZ
	 JPeqW62gX97FVmFj+v/C4+IMBccD14VWRVOpYMOIuvKeXJlbyrWigcS0Hr4ZwHR4blu71
	 vrpbLAP05gkzD5FNW3w854btXipjn0wMu5yw515CRr48XxNsLDDezaW0GXcDJgKDG7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmO6GDON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ABC606A32C
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmO6GDON
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21F8E1F000C9
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097647;
	bh=fyky7CQAoa8W8idNT33FUVadF1x9+bnPALmn03HmalM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JmO6GDON2Ef6AMz+JdJ/nz2ywJT26hzwSfxmFNhoK3Gz1uIadj/kU5bQLJ8wQVYSo
	 kcMYLTWmvVoVLcWywFCvHfuwuCMx8m/qAiSu5Phs7/+AwO/pv4z9heK0aFI+5EpxP2
	 WwodbKo9BynaS5E/3Ez8ONC/xB+wTvQ+QH5buM7DmBrnSDlZKAms17JUv/9gY6P0A7
	 1pslWWELSHwsOScZokpJ73Plf9WaaRWai15qB/vr5QJVYgNIiojBKvHk3ZcpDeE92N
	 ihB/GHM577SKr22G+oqRW6Hq0DGW+2pO/AK6aTnYaJ34eSFiBfycF33z0EG0hzpcVp
	 ZCSkixGEB4fOw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 1D7F1240040C; Thu, 19 Nov 2026 14:14:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222295] HID sub-device (wheel rim) hot-swap on Ardor Le Mans
 base does not re-probe the keyboard interface
Date: Thu, 19 Nov 2026 14:14:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daniel.matushkin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-222295-208809-GDJok6KPcB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222295-208809@https.bugzilla.kernel.org/>
References: <bug-222295-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222295

Daniel (daniel.matushkin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #1 from Daniel (daniel.matushkin@gmail.com) ---


*** This bug has been marked as a duplicate of bug 222296 ***

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
