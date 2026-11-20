Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199906;
	b=ObUuN0iWUdgg66DLq5oBg14mVKYzVEXP21mS0sCFnU9x05WhJp0Gcu5vOxrsIxGSz5Rc
	 Th3YDF4F+kD3fJC3sKNOVIin8jQW8xF+Ox/u3UvtalGFpDwgZxrXqzDr5Uwbjdu99RPYY
	 lChIsmNg4HrPJgGsuagiVqssOh8IKoGL2mCVpcjWQRgMq6IchXTpCn11RrCfNsrb/nFrp
	 3Bk2qnx0n8XDs2Z62c+CT4aG1rOfAC+29XBKb6zZoKeN+p561XoWTtoDIOQo7fFXTWz+D
	 DpC4r7C2bqA6F2juZmGEFK/v3sCYKv4TMOxEVndLO/TLuq1Clz4KvcQdOApLUw5ktbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199906;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=bb9TpWspWjuJLu6U+Wg4mc3H4v4SHelVhnJxPEJHNyI=;
	b=EjKilAooFF4RjhPq6vTKN/QLkiU0fK2dA5JkJqzkutg3O9BQssChieaSFkeLyU8R+iOq
	 aLhjXDa5e7szWK2TP6/8d5IaJm+RSQ82mA7jfpYutEnp8inOnIJnmDpp0T+w5WwA9CvTS
	 99PGJFicK6RrZ73Rd81GD4FtUS/5zmvIr5jCjb3s5+Pi2pjXX46mUjwkNqDku2lKUn9yv
	 RG7z2vgbbwOsrISHOWJ5sFpacjYAO2zYoWV1xtT4c2byBrYPUMX810dgTZqvoFyoDidb0
	 fO4uOGwoNdSQFIc57vg2P8NYOJknq1hB//PijKZBsKgTeUfy3QzrNrpcH2Xej0ab22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0yTPb5w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B810C60A2601
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0yTPb5w
Received: by smtp.kernel.org (Postfix) with ESMTPS id D40651F000D2
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795199905;
	bh=bb9TpWspWjuJLu6U+Wg4mc3H4v4SHelVhnJxPEJHNyI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J0yTPb5w0pJ53t+nooBMZh2woPoIvse1eAVrWCizloDhAd1u454VC41DVGSUmNdW8
	 joKZ2qyXy+x4+ZKKbwju72QuoLycXkK3tz/SM/tOS7FGzqR4cO+hIgR31h2qeOyrqP
	 A7qRtdzADi+Ofwr4tMDr3xcKeaP9XWUgCRKaqKlAS0PGw8+MlXjC3auWuNotX0pKl4
	 FHd9hsS6id5SHuhWs1t+bW//Jx4wfPmMmXR6f+7D6HxtIOL8CCUuU+J09Q5bbokIEr
	 131OXSOFVTMcz631om76/9tX916GrxyA6DrVJYHs7kwBsZBSvSXy43zPCahsU7IRss
	 px12lRYEPasow==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id CFBA0240040C; Fri, 20 Nov 2026 18:38:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222296] HID sub-device (wheel rim) hot-swap on Ardor Le Mans
 base does not re-probe the keyboard interface
Date: Fri, 20 Nov 2026 18:38:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: daniel.matushkin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-222296-208809-0obYvC3UnC@https.bugzilla.kernel.org/>
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

Daniel (daniel.matushkin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Input Devices

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
