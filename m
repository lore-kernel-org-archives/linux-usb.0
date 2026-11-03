Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706700;
	b=OQXu32nuCumusqnkHr57pit0vsKiUbfHg3NmbhK2eVFz7Ww3rwKL7GJJgQEtpyvI56yv
	 xqvk53bc2vkxe7dqo/nWtWB0uVwIxjfxILpYK15xVNwrSLT3ZMKBoV4SqjogGXwRwzlkR
	 AKvnrAmmpLdY3bRqjSh6J3SDUBvF5/mz4ySqLsbsJ6kKXaW6+hMpVN3wf3ZBxdgNuss9v
	 zx3n6YSuyAhw1BWiSCvuryLnYR/8Bb3hmlZXfXnPWUwhWn99ZfQPDz9dNIMMKZu8tvwDs
	 RLw3ZPxGNEr0zIW/b+F+z9kTeHeMNDpp6usBQ0cAN947QK9LfqbzYH2jwswTWGgqvbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706700;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UcTzWRI/bgK/aqst39eobA2/5mtnU+RcZexhInXwF+g=;
	b=Y72mgl0DgkwuStEJ3CYoRi4WHFvwouUoD9+52H8yVsOWu5ii34mACKybGU+h3SqT1Wmy
	 1z7yeJVTKZ/yS0Zub+VLisB7uepNmXbvfrvyGcO4Z4H6QpkNuEWC4wcbWn7MZLSJ56emE
	 8/IBn8Kylpooe/0qzpo185X91Qvy/SSES8O/RaFJvJ7ZVjVcAXQl/AGArTobn2LhZPYFX
	 DsJQDBdmvhMuCzxvUy+BnCycDVNgDaM4CBe20U7ds0kfrMbsJCF7DZJYtRnyr3FW1b0J2
	 2kD1VlRy82jNJPUH/pTyAYISN3Ln1h7lCY2JwMpOe0b/1PdxB28QQVsuu4OX+0S477Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SLcxsWlf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE1606A32E
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SLcxsWlf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A832E1F00A1C;
	Tue,  3 Nov 2026 11:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706699;
	bh=UcTzWRI/bgK/aqst39eobA2/5mtnU+RcZexhInXwF+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SLcxsWlfqcDnQJv4nrqR8SgcEgXweRbn/qqjKMLywILNvKeNP28GjCpOVfqkWjXuX
	 xj5CodH1aB/b1oVwIFic0ouAZx9D8jIjQWe71AMoeiA+AzB1pBxaJfUslOHEqO5i/s
	 6y/0HP0zgTve24lJeunWR9eUCTEnzqCwyh/i28jI3JN3Iny6TVapDk7sYm7nIrfRsx
	 oH66cltmjdHALP4GW1cwgMvo+cQUaWuzN4tSQI6UlujlxCQgltyfR+29PcK/GyhI7j
	 Vi9rQjPB5BSvjbhMKDhum7v0Z2PzOJ9fGqQj97urmYE9vrqy01Z20E2otzWrwO0iEi
	 49HYj0RJVJT3g==
Message-ID: <sashiko-outbox-195197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] usb: typec: fusb302: Enable SOP' communication
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-husb311-cable-comm-v1-5-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-5-6217dabc1a85@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 11:51:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Let TCPM discover e-marked cables through the FUSB302 and learn their
> current and speed ratings.
>=20
> Receive SOP' only while sourcing VCONN with PD reception on. Only the
> VCONN Source talks to the cable plug, and acking the traffic between the
> partner and the plug would collide with their own GoodCRC.
>=20
> Switch SOP' reception off before VCONN or PD reception goes off and on
> only once both are on. If that fails, log it instead of failing the
> switch TCPM asked for: SOP' reception left off only costs cable
> discovery, and left on with VCONN off makes the port ack the partner's
> traffic with the cable plug until PD reception goes off, which beats
> keeping VCONN or PD reception in a state TCPM did not request.
>=20
> Tested on a FUSB302B as source with an e-marked 5A EPR cable. The
> datasheet documents the auto-GoodCRC header bits for SOP only, but the
> cable plug took the chip's acks to its SOP' replies without retrying.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-husb311-ca=
ble-comm-v1-0-6217dabc1a85@flipper.net?part=3D5

