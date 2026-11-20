Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153832;
	b=CaHuQugnWonGse9B0WFkvPZgn2RwtI9zcpz2nESfmDeBdqub/9xF88IezVzSwGJ0K7kC
	 rZslPm+MP99NodLf0aCHqVRmHBlh7ZbsHer3EmEqJ+5Xw11Rg7Pg/Sb3IasmnXLBKIJWd
	 8IDG6ijr7mBkbYYK2biUQnnWClpcCdCcn4E64NnqUX4TF0NYeRXHm3k7bwY7dSEWBTp3r
	 Q28i+4iWoEqoks3+dZDJ+lSUTDqfvsZ2qEB56gaHJvSqTVb600q4ztaraa46sIrZGNEZi
	 kVe8TIer3CmIccMIq2L6Qvh9pNpHPtCM50JsSLQQJriZ3zxVNw8T+o5Ed1tPPyNSA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153832;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=y0gzq45tljmPYrmeTIEbwP2ftnal2nRTKCphlci9lL4=;
	b=Xeo5mixsxDfDFwAvELFtfy6IjZZy3m3GEpbFzW23LEfkiRyycMxukI8MxBvK0LZ3UpQ9
	 zvTKoae61xkIHaUmX0bAydT6GpTLylEdacne/dpGRQqoQoatg/wu4pi7OyA9Yrk7rawz0
	 8S7Dv2OqXwPEwKzVjFUrmOUN96J5jOwHlcMA/0z1suqTKD/4d/tf4jddGxP8UPdQ+1lVB
	 JgIWSMpQnEFCehI/VWFPkM6tQjLhUcPhrtT6SSFq9s1EI4H+2E3u13kB27tSrfiND+B+x
	 oDnzJtfOAGZ5i2Tmc1iqBidtlJqVmxWj7Hom5xudG1J3nCJ327ykqPDUs1RmQrvpxVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTAvkEtV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11142606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 05:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTAvkEtV
Received: by smtp.kernel.org (Postfix) with ESMTPS id E13801F000C6
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 05:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795153831;
	bh=y0gzq45tljmPYrmeTIEbwP2ftnal2nRTKCphlci9lL4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bTAvkEtVVMEpgdnRFwKge9EwWyKx/ZfxgzLWFw1i8tPuh/X7ATd+64sz32lkWihct
	 Fxea0mPqMqFZjcbG76VUnCQHi7n8QzbEMZPD+CW8q3R1T5VOteIesTJrfqRubIPMf4
	 4gro7TQ5eUDQ3pe26QetxD1uOK3hxVbqqALU+502QbGHfhafdz07u2qxzw9upVOkS6
	 56j84LMzEOa5lRjK8NQcHvKngEGt1IBfy/tLfmIh19hcbdABWhIfbxDBm5UE3VWxqk
	 j4nO7DP/cf2USBot2+LAmQFk2Sqcdb0MWHKmXE9qBHx43EP3Nn58eOwmjNFQuZs6GG
	 kbTn9vnXIopcw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id DDEBD240040D; Fri, 20 Nov 2026 05:50:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222296] HID sub-device (wheel rim) hot-swap on Ardor Le Mans
 base does not re-probe the keyboard interface
Date: Fri, 20 Nov 2026 05:50:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daniel.matushkin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222296-208809-dm6sbkqoyH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222296-208809@https.bugzilla.kernel.org/>
References: <bug-222296-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222296

--- Comment #3 from Daniel (daniel.matushkin@gmail.com) ---
sometimes unplugging wheel base causes kernel panic, though i dont know exa=
ctly
why

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
