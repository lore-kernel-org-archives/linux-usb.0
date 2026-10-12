Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6C1A682C
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797601; cv=none; b=D2s46UkECoRh3G7eEcZzeyo/3LmjtrDeyVCJ9s18nwiHwxoh5f+GTCC29p75E/D0YiKrq7brXmCV6EK/jxWN9kcaX+JmSVvnRY1o7qS/g5msrSpsHY0OILivBfoK8FrpnsFU6Bbv0ok0ooq7uNHje2y9l19/s7RPJNJLbEzOgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797601; c=relaxed/simple;
	bh=e+H1hUULUxSjALYDBaE+zpMZMfVzy4kBXJdJ17xedqA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YrvBj/W37qiF3A/b0Wk/uUu+/Rzs8XDUkGf7PfP7g4xw+FZk/Pv4jZMsqqo0Weday9U5OpHPBhShDtXlQ9ARjI5RQDEiYfWrT3wZ9dhbvh85C5WtfMaoZ+ShLrWg6ZTrHxsc7m5cmvwVThxvf8uB6JFkkx+gNyki3o/QN6LmmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7J+yQOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7J+yQOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22EB1F0089D;
	Mon, 12 Oct 2026 09:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797600;
	bh=e+H1hUULUxSjALYDBaE+zpMZMfVzy4kBXJdJ17xedqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j7J+yQOznIgk5oBTh489LSsh5ApTdL9jc8D0c5cYMOakcyPr0HeWy6wOdQct5LcHN
	 7dBdfIAob2bFGCTYviYuTx2BCUAyRAlpB2S7B8oUxOz3XORomqsaWdRpNeTF/oF+ur
	 Fikpapc1uDhG9xFeWh4B1nB+HcCtqhE1MFQmnmCq8R/AvocMNvMqNHcIDLVaG0ucKj
	 71NBoAr5RbPjyOOi4nsr8x2D4XaJJCeCpYdm3l9NMlkRO8RKj0+kIMOvt1R2owVwLf
	 mAq31yoVwBn9jgY9UCqFfyOrDnuJs7v08+9YgZF7eNyNlaFPeGfKPQCZDmwPKPMa2h
	 JPJcgbShwUm1A==
Message-ID: <sashiko-outbox-167901@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012092725.575885-1-wenst@chromium.org>
References: <20261012092725.575885-1-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:33:19 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Right now when usb_hub_create_port_device() fails, it prints a separate
> error message to say which port failed, but otherwise leaves |message|
> set to the default "out of memory", which is somewhat misleading.
>=20
> Set |message| to an error message that is more specific to this error
> path instead of using the default "out of memory" message.
>=20
> Assisted-by: LLM # local reviews
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012092725.5758=
85-1-wenst@chromium.org?part=3D1

