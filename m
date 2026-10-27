Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113840;
	b=HvSgSelF1XgyZ9wa4E2IhXPBGMsMbpXGykUwwgl7dS3X7EffX3DAgTxV1VmjdibF/tef
	 KxQuW7Cu09ZCna7z2sbWdScrbkzfnJRP3JeJjPW9xz+KWmQ7/PFpgCkIWSUP+QmoUbcpr
	 mpQiDzuonX/QbIsYpfl0k/VntjNY3v5D40dPYOEl0fPJClsdO4TOI96gK8jX229xaWi/P
	 v4aHxaRlMwibcG5I49i1jXsUk/VzUv4B4pA+v9a7wmxJuv3C9l0npfkpJcHBF37zIIOAT
	 DwjhGfmw1xRlVgjXYkjrQvL2QrJhjEUl1zUsqopBadkS8PwO8fHAjB5T/PgNxkTN0qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LOTTHNnZpqZ8lKUYBeDn8xuIp7qLlASQlG6pZgO8KQY=;
	b=vqJ90Uf7Qb1ucz127Rc8W/yKM1ctXrISsPXjuFGs4qH2BRfq97c109YREORQ9pibHUoU
	 AFKFavrErVShsFtyiTn+lzDyMz4QWn1zbcvDXCUp0/8rwYCvsmMTYbeOcZaY/pQ7xY9Jy
	 kQY4RhgFgR0T0f0+Kn8RnUaDbpDSjQaCggsA48RjRo+SiOxeCnowr9cN3lPlHsUJINMyG
	 cG0liRU3IlutRIf3zlqJbSOxIQjgrbOyDYh42WHkSUTq2medw5Pwp7qgyy3d+B/M5PrZc
	 EGJ1m2zz5U4EiplgBN5DONFeRxQ5O1qN7ljF9OYG/Xv7JyNJyewtYz2WTbJ65zRzeqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FjxKT1k5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F5606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FjxKT1k5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C991F031E1;
	Tue, 27 Oct 2026 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113839;
	bh=LOTTHNnZpqZ8lKUYBeDn8xuIp7qLlASQlG6pZgO8KQY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=FjxKT1k5ECKndUqTDtVygcfCMRnmlQBfJnccpKhjTD/bnTKlZIbI16cYqI73zl1PD
	 ju5XQmoviI6ZaysbQ+Pen3FrGB8qwEwqE6n3WLAAUpjxFhX71P8OwUeDs/YxSzT12l
	 45DPX92EYm6WVFj8yGB3ZROK1jfT2qpvn1JnzCji2zrqs21hNIXM2dOpXl5Zsy1z5+
	 U2ub9Qafh2IIjC1TbfgYGrS6RwBif9BqfHBQpidnKU6woRTAFOZXC5OKSnGRnFqWGz
	 rXQNVnt1E0r+vt5IRk86KD2kCHjkvixG5zZjUafN/P5jLyn4xHMeHqiawikkpEgV0o
	 anMSf7YbMUIyw==
Message-ID: <sashiko-outbox-186807@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/19] usb: core: sysfs: take the port lock to read the
 BOS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-1-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-1-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:10:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> usb_reset_and_verify_device() sets udev->bos aside, lets hub_port_init()
> read a new BOS into udev->bos, compares the two, frees the new one and
> puts the old one back. bos_descriptors_read() takes the device lock
> against that since commit 4e0197fbb0ee ("usb: core: sysfs: add lock to
> bos_descriptors_read()").
>=20
> This does not cover one caller. finish_port_resume() does a reset-resume
> if the device has the quirk, if its port lost power, or if the device
> does not answer GET_STATUS after a normal resume. In an autoresume this
> runs without the device lock, for instance from
> usb_autopm_get_interface() of an interface driver. The comment above
> usb_reset_and_verify_device() says that tasks which hold the device lock
> are expected to resume the device first.
> [ ... ]
> Cc: Griffin Kroah-Hartman <griffin@kroah.com>
> Cc: Oliver Neukum <oneukum@suse.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D1

