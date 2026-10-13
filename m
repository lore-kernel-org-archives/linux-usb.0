Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932DD5632A6
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930423; cv=none; b=oXyl4/Wm8C+N4gbS9NuNAIMIZ0hOZVaP9DRA0nU9SM6EmH7zj3V1onLHe8yDf5o9G52CZkP0oNyLr7WemFiG9rkVjesLg9M/SLYkYRm3vwTZzaTLKregA9WWvqNihMS4qapUvQ1o7DSVWgxu1/zB6KfUgu+BEm+/c0bD9YTZeKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930423; c=relaxed/simple;
	bh=Mw5FRfV4BLYDx6bafS8ZDBestaAHb3fKRPxMwsja37Q=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=aEuSzb3d7eU+SMvZZ8fnjcyfImdpr80tJBFFuwTh0FZuoRjV03OQlQvj16qw4CXn/lJdOeGmfIREviKSL2V/0LnF7g52s1ZoQLV1Aj7IEMxjDv44T515oF0BIdvewKEo99iRhf6uzsqDG99hjSQHAbvPZhzJONXwb9hV2SZi+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XztOhXMG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XztOhXMG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F31F0089B;
	Tue, 13 Oct 2026 22:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930421;
	bh=h/kkAWpTtoKClO0BJqF4G6FJkIVPw8V5iTIyJhKqImw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XztOhXMGTF4nqnhxsk4gq4yTADeqsnC4/t9+cTfqlC7zlXbgMfb849fydXj968jU2
	 bGA/EWKkjzWdCeme3ayT9utbOH/g2TQbSptYpXnK2oYNDu8FN7IZk+iO/B2zszxDd6
	 ioqG9HpwNx6oJLz/xAnjtzFKYbfHG/tXHlugKYfGn+ArRnUXd0ZfNOQmHAQ/5H9dwB
	 pNRAl4p/mzyZ3ga6WW70R6Lx7us/uA9C1CdRZ6cI6QJIB7xCVnqRsHr4qmvgMCrw0T
	 FssNMLb4fe4bOpJZYzRyn05XOFwcOrrP//xSwC/KDpz9xRpbnR+ZEjT9hbFH+WjvzZ
	 EfSLwhQCdT5og==
Message-ID: <sashiko-outbox-170577@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: uas: validate status URB length before parsing the
 IU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Kaloudoff" <olivier.kaloudoff@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
References: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 22:27:00 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> uas_stat_cmplt() dereferences iu->tag without verifying that the
> status URB actually carried a full IU header.  The transfer buffer is
> a freshly-zeroed sense_iu, so a status URB that completes
> successfully but with a short or empty actual_length =E2=80=94 observed in
> the wild during link-level upsets (Thunderbolt-chain xhci blips) and
> on a wedging bridge =E2=80=94 reads back as iu_id=3D0/tag=3D0 and produce=
s the
> misleading
>=20
>   stat urb: no pending cmd for uas-tag 0
>=20
> log spam seen e.g. on an ASMT135x enclosure and a Samsung T7, right
> before the affected commands time out into the error handler.
>=20
> Beyond the noise, a short packet that happens to carry a
> plausible-looking header could be matched to an inflight command and
> drive the state machine off garbage.  Bail out on anything shorter
> than a full struct iu.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013221937.4149=
0-1-olivier.kaloudoff@gmail.com?part=3D1

