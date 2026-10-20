Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513992;
	b=QDySnoILeskFVAtptO0O2uVK7zjg7AChUkArbi5QOh2O2eHk1i3AMXMrgy4EuU5VVyYc
	 7HDJ+GQfJ5VhdXJE8SfF4pwNatqjhj4RduMmZUWha1ZQAbEPkot2mgsBg2t1BjeYe3L6r
	 rOhCw146wGLpF0r7e6YdyIbIxYgKvy6pK38JN0FAkoWLof2U4NxZiDu7TCnzZ2/2jcfUZ
	 aCMoY2t0UyeCDYoUp4s06fcYuTzNqoE8qajTrCJsqBASXW+TAH24nBCfmHKjZ3DdGvAsj
	 Z/tTVdJf/YW3MDXAXaDWsTLeIUxhPrIukmavtuGhVOW8qWlQCAeRFD6cTOyS5+E0XcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513992;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8UdIdcVss4CK3F38gEjRkh1Polt8UTtGRjYnNPDWwvU=;
	b=hyCLhIgnQQTWXAC6SGwpLxsN6B1MzFGf1BhPR2lzdbiPz0Ds0DYbaJxzKxHaP6wqgBMx
	 H73Jy+XNZ9BrWxPKIV/KNhkfekn3GS48HyzFrDKnzHpi285ZIcWC5zUXAMpmEz1WEWyUq
	 89a/3jeEjnSaFpwY84iKb8ILyy5kGW1r3/BeQVFiVuHuFNvGXaIHeq+IYbqTRFD7Q5cqY
	 9PJS0SdBIeCu9b1WD1029Zsdtca60/jQN4Zu3bMnejBsaPLImMyC4U0VLVzjqWQcf2Ppp
	 boTC3eJnmg6H98lrHbkK26EUwF7CffCXDklJcAxy3WSje0f+ga+Nv22Q6Sm9l1lIMew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD9A606A320
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 16:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA01C1F000C4;
	Tue, 20 Oct 2026 16:33:11 +0000 (UTC)
Message-ID: <sashiko-outbox-179356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: fsa4480: Report switch & mux events
 to codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020162101.1527014-3-val@packett.cool>
References: <20261020162101.1527014-1-val@packett.cool>
 <20261020162101.1527014-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 16:33:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Luca Weiss <luca.weiss@fairphone.com>
>=20
> In the Type-C graph, the FSA4480 switch is in between the USB-C connector
> and the audio codec, but the audio codec also needs to receive the
> switch and mux events from the FSA4480.
>=20
> Update the driver to get an Type-C mux on the next endpoint and
> broadcast the recevied mux & switch state to it.
>=20
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> [val: enable the SENSE/MIC bits; put the refs in fsa4480_remove]
> Signed-off-by: Val Packett <val@packett.cool>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020162101.1527=
014-1-val@packett.cool?part=3D2

