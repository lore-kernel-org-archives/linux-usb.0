Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722388;
	b=o98u1rYkCqRMw5WPz2lc7/rZw0GrNJB3SPUvVM6WHc2g4pck7o+kBoVU6Dje8bXvYLbE
	 kIsJJfdQSoXlaYtivsaRlwe4t2pmDfetPyw5b+koEgJHA4TFl7owhEUMykkfv/68uGJ7W
	 OfjNOPg2PBRjvvYiJrP6ccVSH9Z5guOgChRwWl0Xeo9QpvWhdbVPU0yWWFZfyQs5QUVyG
	 +PZiBgarmZndXW/j72T2UJf9yFzOZjQ6JwZRnNUz6dFZACd6Kb+wLIMc4utBHkJZXo8ee
	 HFl5HYN66m/B9RuMi7IFKSBPGRH7cZoxpyDQ8V7+J8NyJiw3iqCA8UDijmfcHDAHZEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722388;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j1SY562rTwNpqrJTFRtHQGs1HdUQPnrwVvHTMhWIZNw=;
	b=Rw5N7o70ZnKbUDh28ny2vnUTDbDkcSOhBVmMJdO+zEjRxNYdDUuBFFcJZBfVZrVX89W0
	 W454WcMcrpRTeWVXua2Qh66sSKgehG25LoroILPPKIsZKEvwv4SdywGwesyMp3MF2kBTK
	 YN54gbKKeCJxTNPj544VNJI3M1+EXUwmRIrcTn3d6MNUQ1WUvMGNwzr9Ab7zOfrsNPLHy
	 dcdhYfORJuRBnPh8+o6RA9xwgTLlbhaYSDAVLbnck69KQTru+J6SUKY8B9DlFS2UK8dCa
	 /1HRVf5EIW5JoTkW19DYUsNUYJ4eEPhqrWzdQkKoDcF5rMA55AG+pRRmAsNJ4Q5PXfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGOaQtUW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C27606D807
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGOaQtUW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40A71F00919;
	Tue,  3 Nov 2026 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722387;
	bh=j1SY562rTwNpqrJTFRtHQGs1HdUQPnrwVvHTMhWIZNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGOaQtUWET97WXJFsIQ7CN8nJSSMQfg46ZedCitFTv7Y78Ze+Hwjef/74DWbuyOt6
	 weENG14XDSl2+/cQP7T5j1ANlayObki3J0OKVPmlaKkVxalon57kltY6Yk9/57h8MX
	 eqEGj4VdgjI8+98j145CTSrpr0uL7gmCBF9/4D9QWax85wdNJkFbxSstYRkPUkQO2f
	 9NM8P52xBX2aoj5zD1jrb3uGVzYJt70lhUq+TGUw9XAkdko+Kb97O/G3hoZjrFta7K
	 pIwvA+NQme6vdhZqwRIDIzf2JBmDpkLYyF4qMud0LkyeO+3NXhJcfU9suOae6WdTYj
	 phbJeXMYfIWXg==
Message-ID: <sashiko-outbox-195704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: acpi: Rename the Acer zero
 version quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RhbmlzxYJhdyBUaXRlbmtv?= <kernel@resetko.pl>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-ucsi-lenovo-t14g2a-v2-1-e85c659b56a2@resetko.pl>
References: <20261103-ucsi-lenovo-t14g2a-v2-0-e85c659b56a2@resetko.pl>
 <20261103-ucsi-lenovo-t14g2a-v2-1-e85c659b56a2@resetko.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:13:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Stanis=C5=82aw Titenko <kernel@resetko.pl>
>=20
> The quirk added for the Acer Nitro ANV15-41 is not specific to that
> machine: it substitutes UCSI 1.2 when the firmware reports a zero
> version, which other platforms with the same firmware bug need too.
>=20
> Rename ucsi_acer_read_version() and ucsi_acer_ops to
> ucsi_zero_version_read_version() and ucsi_zero_version_ops, so that
> they can be shared with other machines.
>=20
> No functional change.
>=20
> Cc: stable@vger.kernel.org # needed by the next patch
> Assisted-by: pi:claude-opus-5-5
> Signed-off-by: Stanis=C5=82aw Titenko <kernel@resetko.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-ucsi-lenov=
o-t14g2a-v2-0-e85c659b56a2@resetko.pl?part=3D1

