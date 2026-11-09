Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215071;
	b=Du++11cVB3qG/eIqO1yFDAZXJYGQu0w/Ac+cNIrTAtke/tUTMS01VydzdA+0JPHcQfPQ
	 8PZnT3dAE0UUnQ8W0zQoffsjwuJsBjGen5ZQESBR5r5mYWShS0FCQ18MtSu1CF5hHqm8P
	 MMvWGiwn9lsnRDd8d0TZWs3/9eWD6kN9cGY/slOEBp6yGuJ92JUU+7B9Guy99lrLuGyFj
	 /R9xPOR+ryQZvonElLPfXkJZCSNgY9nMel3ymhv7KZpw7F16B5VEayFoqJfvy7eiaJaJm
	 NE+hYWGnhzNtAkQ2h8XdJjL078jqNifWZrTLbJXpw2+KLjOt7JORm5213fXkvtxY4cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215071;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FeV+g/MdoiMMDBvyXvUxuqBGGjpzZJdTET0VX/bzK2A=;
	b=FxtbtJ/uhfJ+2DI+vkWDlgbhbMz9f2vcnOfK+oNgBkyvjgWeM5ftvZItvImGFhYJl5yj
	 Qs72QtW5uzbNd5MmBwNB4ebPmu3N7FcJupwcnEnTCO5CtZ4/IlFCSBoXCfuH/eOsCQLEa
	 JcpXbW+huFibMt8xskR+FNnF23LJ4qnNV+Z46L/NhLJroY7vNDJXO8GZ8fo4satTWM4zq
	 rQXnPYmVkiou4XN72TPVy9VtbzJocDCEtDmUbESWu+BdRhrLFK5WdMaCX3h83lOqnZjBH
	 aL/QrpbkWGA7zlewc6luvzoQWrnGRPr9ThywbCcpPczya7LLAhQVlNn8ozfwFONhxiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mo5L1okE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B72B606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mo5L1okE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6361F008A2;
	Mon,  9 Nov 2026 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794215071;
	bh=FeV+g/MdoiMMDBvyXvUxuqBGGjpzZJdTET0VX/bzK2A=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Mo5L1okEdoaFzl2XswMzAmKw1ZN+Ffku/vyDkOU0CeNYm7/sfX8IAerSs6J9V0COk
	 xryCJ/AxJOGJBrvGpCazBNwLwrsvk6AUoKMlOooyaeOLU+TpA2kOr24v+IuAO4fACm
	 IeGaCTuQpqhGAaQvgRIlz2mZnJ8SplALKdKzYAiR4lNfNIFAORCu29DhEiXtef5hJX
	 nxWTNeZ/hUTDXQs9stRbXeKlzdjPh3rQZH69+pXeTK2J9rvVHiT4txEfi517oTwypO
	 HLQHGYpFUHJsxquFvSJ3iozCgULCpo+YP9cG3GgSG1CPIhT/Q4RUI0Duzr2c3uPh46
	 /th5IdwS6YY3A==
Message-ID: <sashiko-outbox-204651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb-storage: ene_ub6250: don't let the card-type
 probe hang forever
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>, linux-usb@vger.kernel.org
In-Reply-To: <20261109085449.83117-1-xiehongyu1@kylinos.cn>
References: <20261109085449.83117-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:04:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ene_ub6250_probe() reads the card type with ene_get_card_type() right
> after usb_stor_probe2() has added the SCSI host.  The query is a
> bulk-only transaction (CBW, one-byte data-in, CSW) sent through
> ene_send_scsi_cmd(), which uses usb_stor_bulk_transfer_buf() and
> therefore waits for URB completion without any timeout.  That is safe
> only for transfers belonging to a SCSI command, where the command's
> timeout and abort handling terminate the wait.  A card-type query has
> no SCSI command behind it, so a device which enumerates but never
> services bulk transfers blocks the probe forever.
>=20
> commit 445fc368c6bc ("usb-storage: ene_ub6250: fix race between scan
> work and probe") added us->dev_mutex around the query to keep it from
> racing with the scan work for us->current_urb.  usb_stor_probe2()
> queues that work with a one-second delay, so it now waits for a
> transfer which may never finish.  The query itself has been unbounded
> [ ... ]
> Closes: https://syzkaller.appspot.com/bug?extid=3D30552b4cbe99d6d91306
> Fixes: 445fc368c6bc ("usb-storage: ene_ub6250: fix race between scan work=
 and probe")
> Cc: Liu Qi <liuqi@longcheer.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109085449.8311=
7-1-xiehongyu1@kylinos.cn?part=3D1

