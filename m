Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758279;
	b=qgdWmcdMRnPEUq1DVwl5Hn6ww4CLMNe1XTH2e16/1CBiwOsL0jbDepKxyt8dQEyLNWcC
	 nkSJ2vWMBlQeWD+d5xNQIJRGp2t1+C6z07ig6LsGWf8bAIGl0F13UnOMXDbpCeNC3v2a6
	 7IVfcFSacw5Z6wmMfdtTGrjHqmpxT50PKxeyF0jS7t6Swm7MZC3ilrdE+ImbbjcgMwWkk
	 pvpZUP89/PHytqHzpmy08ZY5jUsVorBfw635xDB3+OEss4Ri/qak2L77Zfa7fazC1oWJx
	 +H9Ui2nFIJQTOObFBPSPg1/zuIWD+tP2n0+XHo/cxJenrk7C5Lagn3dLOM4irTF6nww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758279;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zE4K9HmrlJRWQ9vtIKCw1CJfb3UXfA5YCNfg2Z4L7xs=;
	b=HtoiCFd/wVHMDzhjW1Zia1bN3p9Z1whCdqt1EkBFihk/VgHqe7XQxwvciuOANy3tOf57
	 vTvBwpjXrGsCHMkAurRbfzwCm+Gqm3p33OErwlWEpcugLfXFKP37QLN7AkmCgqb8xCX56
	 99BxF+bkPy/tUlg+TukdVZ4+N+QZqU0cT4Lz5WYqZIujeAEHrJSCejMFEgJR16wUSG3yR
	 jd2cut9ErVce3oVPFNLLuVUb3W5k30ZqM5lfLY1qG0QA0HshXuNdqNMEGXapZf++GnA91
	 qtaFtS6G97Cy1WIfCJsRIIK/636aYNQy3gn77cHYZhNmlxnZjhvcPNhurXC9TpSMUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RE0ERDwA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59650606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RE0ERDwA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC64C1F01825;
	Fri, 23 Oct 2026 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758278;
	bh=zE4K9HmrlJRWQ9vtIKCw1CJfb3UXfA5YCNfg2Z4L7xs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RE0ERDwAi5Z7u6GyJAn/2FvWCYpLyrS/foKI5VEOPA28eCI6pQg0Z5IrpzI/AXxgf
	 jxH2n4QchJ7zcx2DQRzZjgUKpEMmaMOE855t28TkVUsyuCTdCHaYmKylYBAOw+u3mN
	 BKFnke2kQERJazFZwxG46cDC5h0bcXAEOu6DjScv90GbZw+trod6azpVFpq9iIcOfn
	 GjqQR6QAO+8SCoTmLx52voT0NGQ7GyA09NKArGFcBnB4wnbmCai58e4s//lDG2QyqL
	 +S3vIF0S9r9tabIC5dfUMs9VzW1TT1WH/FDb4CkjVuWkHpGRm/pdvX5GqbCEDw3yqJ
	 kwyvgveCdszCw==
Message-ID: <sashiko-outbox-182760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/12] USB: serial: io_edgeport: fix NULL-deref on
 early status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-2-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-2-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:24:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The driver submits the interrupt-in URB during probe or on first port
> open, which on completion may submit the bulk-in URB before all ports
> have been opened and their waitqueues have been initialised.
>=20
> If a (malicious) device sends a status message for a port that has not
> yet been opened this may lead to a NULL-pointer dereference in the
> bulk-in completion handler when attempting to wakeup blocked tasks.
>=20
> Move waitqueue initialisation from open() to port_probe() to address
> this.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+763813d65c7e18c1b6d5@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/6a8818d8.ae6ddae5.3da009.0031.GAE@google.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D1

