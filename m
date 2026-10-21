Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592444;
	b=0Wj5TJ8ALA0MTvx8j6Pv8SlJ14x+Rld/JMB+a0wacCfziy7BDq1S8pYbczz2lf36Tyd4
	 aEEgR6Xp1YGMJncUjiuxkNOgk2zI9dLxBBqJ+4hCa/WXH0isfwJTfo1GUrYAUv/moE5Bl
	 VP61yAMDbd+4oCd41yc36aOMVtEY6fqpVH86IwDvcSqAQr5+idrgvh7j0tSy/XgG3hYAS
	 SFNSuqEeIlVwO55F1XQTu3P5BaBxpTqfhUA36cAgI1x3ACWj3vPDPMcBbtPP2jgVDeBnh
	 SvWUDA6y65g+QfkFxBaxbYFunVBGYFyG3Y1SAJEFww1bi+7k5/7TiQjFjgsExwQzq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592444;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0WNNtSiODenh505E+bknXcusuBtT4EZpmiW0mvWipwE=;
	b=RZcsQxnB8FGZyQcdCoil4N0/xQRzpqeYeEkUpp3gw7Ui5rDBfH51ofOQ35piBmtFVSuc
	 +5bxtS1Rny2xYcg1FNf4TxN+ZIu6czRw5xxlUYScSY+MOprWIUQO1rplvzeFpc3tgsVVR
	 WmojaYiLTrGndI+R3M9S0vDoEm2ceJP37qCypXqOKhnPMAUTtSck7smnTwEzkhnbrnQea
	 0KYYAbC3g+cmzG62rZyZNTNh9pVh0NQtGkrn4Y8cTO3H/w0uLy4iIX0N1oYyE8sEcLD6B
	 ShidoGsLpIQ3qUw1O29gC+5FEDKSwPOCF2wp9i0ty10mM07BFzGvnORW+ouqcLore9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fw7sAQkA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F7606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fw7sAQkA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00241F000C4;
	Wed, 21 Oct 2026 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592444;
	bh=0WNNtSiODenh505E+bknXcusuBtT4EZpmiW0mvWipwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fw7sAQkAXV03Xa4XDSAAi7MHakqSLVNeky6ZGlpxIoPRKP2Di37TNeuEOR8zFD6Wg
	 S0F9XX6H0L3Tyf3x6ki0iEexn98d5g3bJ+swfMm9BSU/rWamOiuQSuV/+Co7uA6oul
	 1bdTHh5LFQrW8SOucStTqvLdw8wCc4kjlDFwat19W8unQ737awHdqIdnhYwhkuSO1Q
	 5CLY8fcCZrIjg+rRLZDZLJvHEtIKphk61QaUy7sW+erdNc784Wg8QgVbBwaZsB5mW0
	 wDZhRVjyAUtTU3eDSHhG9cVAIAjMA8nrIpU6+82xOxiEcAm7b3AFBsoh+Tzrx1Zck0
	 mCY82/srDe2sw==
Message-ID: <sashiko-outbox-180358@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/11] USB: serial: io_edgeport: fix NULL-deref on early
 status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-2-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-2-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:20:43 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D1

