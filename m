Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480003;
	b=L1SXPaMkMrJdkhACL2lgXrTWFoqKlO854jCItTye9+Ec/O4wtIDKHOP+ov0GH9+FcKMn
	 EUW97ylFQhL4B8pavHpz9HNfg5Bgy3/dPYZTXmuptQbYlNJIDii4XS545H3Ku/OCGffiF
	 ND9IDhIQKDMgSke+61H/+RWpcb90PSDvCbuwMPsnG4u0XSCWX1iCuVuyUkzN3ta5OoYQ3
	 1/pvjOD9gj+7NOygWn795LwRzmykilreVnInpPcwUEw8aSnU80ST2ncyyxbv1OQHanw7z
	 Fjag9lo5Dw3QXlLt4bBeAXR+5DRVFlvO2dkMjTfFUbv9vm24lOS3c+suntAHUepvBoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480003;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=n2r7DLdimVM33t7tjI5MUgKNDyjSQ/uWOF/0YxgrbyU=;
	b=i0K/VF7PMrK0Pqz6fXjvQ7gQNThTS6sc63HT/0NDogIYa5eoeW5RsQzOAvqkayCSmAK7
	 VPxyXthuGrfGKPJ2kmIf05Q541Ig84bz+IuiUe0pjpTGBRJoF2HSOvC05pk88TuJf4SCl
	 /OM1c7cCdrdtbESzqnnlwXrkqvpF0zeFKUi61XX1VtdBt8crG8k5/Zh7B0LgKQUqhDXCH
	 tmQVAVYdNNSYA5fwXMoTAWxxsrRyLiMiF+mJWA3SlXBECGbyhdlLOpllLEcmEmwMex8FX
	 F8qlZkEN0Obb4mXSkc1kTyveyvl2y4TjRGWaFREi1hzNPM12Bn3bGhtvoUY2kQmEf0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbKTueFQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F3606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbKTueFQ
Received: by smtp.kernel.org (Postfix) with ESMTPS id 432251F00A06
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480003;
	bh=n2r7DLdimVM33t7tjI5MUgKNDyjSQ/uWOF/0YxgrbyU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KbKTueFQkPU3u4HWBO1rxpMZIDdk9XVstkQMz+hjAWfrSWIb6tHthTOUotdyWumlY
	 3hR5RZj2XjEJ6p9s65rhHQlqwD8AiUSaZk01W96+j26qhJlad2rnJHe8xQ6A2wnS5s
	 a7mbS4sCwWNL0g2o5MjQ6KDTa3AbK9vf399A41fptB03SVsIKckA6lA2WPxBeWnvzh
	 hvHnNyKrR63UF9RNlHssZKgXS5cVC4CvwFV98jdhX5t748k5/jYr9oQll/RakwpfKJ
	 rjWcl/2LQZfh3neoxGApZaku2bgghIRo9DrrthvZZzX4FmxoJzwHLYR3qeJOp/RUU8
	 8evwRqH7AHiAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3958FC41612; Thu, 12 Nov 2026 10:40:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222261] Regression: ALSA: ua101 breaks genuine Edirol UA-1000
 ("playback packet size 560 too small for 15 capture frames")
Date: Thu, 12 Nov 2026 10:40:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Sound(ALSA)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: londongrad@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-222261-208809-sisGGtpzgz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222261-208809@https.bugzilla.kernel.org/>
References: <bug-222261-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222261

londongrad@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Sound(ALSA)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
