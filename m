Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482482D7386
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791762847; cv=none; b=BHNL5f0TLCiwN75+JN5hETQ9kJHyQjFVUrNTuviPJg7fXdzHxARnW7RkcMZydKaljkAKrnl4l2WBbxvkwr1tw+Bp3w92Ig7+r+HvqQ34XBKXILdu8Cncjk2pxoWGs+/IeEpKj0ezb+NJeF1FQpW1+tOHscBm466E+2iAB03Mdps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791762847; c=relaxed/simple;
	bh=e2ww5c2nj1hAXrW8ls3lcn4dTAnncCt51KsG4vl9fr8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=knTvANiUMEV2P4GEVFDu5Pyypt3Vu7fVXnLmnb8lyaGiRveh6zRtEBN2mrM8JKsoaz84CLi/rRP51KQGkfp+v11FLTqwr+28DVh2lykGOdHPcuENjT3xu2HATp3VyhVczuaTiQ/oapjiKMDUq7LslMf0Ot26NVeH3nlYE/8r23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/LxiZGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/LxiZGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8894E1F0089B;
	Sun, 11 Oct 2026 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791762845;
	bh=MogwDh66f1UWvJJsI0hCnoIRiVako581WZoozfJKzxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/LxiZGGbdiOzH3GehYPQFYUJyrirYUvz+DVOJfAoGZ7oLHNig1Zy1HcxGUmXmmBT
	 4W9consQhE5HHuP8baOxpxeghodrNcbeKt9LujxSQ12anm2CTBensdzLmfernHqd/E
	 NLYYMw5nCwNWyJeNx6LJVy7PL9qH0XUvN91JGJIRtbESOm71BT/XIEBb7sKSW8DH20
	 56tw5i1WA+aCT4MGW2n0AQgk7GoSK7GGfVCoDt8bNKQka9DMXbNul7INnNMKn13Vr+
	 nJpL2u1blC6cwqErW1RNpRlddwI5Oqpxht+g0zVnlj9dWPJ/VjjYfzibD4K9W5p0HE
	 9dwuMLY0kiXqw==
Message-ID: <sashiko-outbox-167523@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] tools: usb: ffs-test: read the descriptor counts
 with unaligned accesses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011234707.2475490-1-sashal@kernel.org>
References: <lx+m4kkf9bvbpe7f+l7y+7tc@mina86.com>
 <20261011234707.2475490-1-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 23:54:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> descs_to_legacy() reads the descriptor counts through a __le32 pointer
> taken from a member of a packed struct, which may be unaligned:
>=20
>   ffs-test.c:235:40: warning: taking address of packed member of 'struct =
<anonymous>' may result in an unaligned pointer value [-Waddress-of-packed-=
member]
>=20
> Walk the counts with a byte pointer and get_unaligned_le32().
>=20
> Fixes: b9a4274699c69 ("tools: ffs-test: add compatibility code for old ke=
rnels")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011234707.2475=
490-1-sashal@kernel.org?part=3D1

