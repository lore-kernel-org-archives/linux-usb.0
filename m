Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF00D2E7635
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791640696; cv=none; b=IPRTu1Z36gL3b9M2Y9SdulCc3p5H+N2xPHWP9W6Zk1DbTavKWA4Mp7nK4li6jClrhBmuSaiTE9F7wnSUfQr5SQ3bA6qyzs10obgBG1YzhiMzk6PYMqZ+aGckgG3t//1VIM0GGQWf5KIIbJPEell0nZVMfGsqxC3qXh8uJm5dWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791640696; c=relaxed/simple;
	bh=o95P9rjuTqQOF9s/yywPIsUp5ly4HLoWFGc/uuPYOEg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=oQZIkmnqL7l5/tyczfgJb3zXqi9xtswcfu+7ofF3X999/QFxcg7XMZIEhhKw4EHFdO/Kb2cZWJbGiT5mOVXN4JaKraU+ZiSW0wNfPl5X3YLm8T9muXq/AVWnKDD5BgQSQHuGY5CKbY+9eCCaBAiQ7pUszSXJurOLG1piXxdr0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Awu2q1LT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Awu2q1LT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A251F000FF;
	Sat, 10 Oct 2026 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791640695;
	bh=Myvp8antNhijn2bC+1OqlStsPd1tax1xzMW3AILb42M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Awu2q1LTABsoEtXu0PSQWgLDo+o1ZA82ZnA7QiEzg69hc3abrB0UApBt2AsYgrC+r
	 w0lf9Kilxp1bbcVQ9nfvs68JYd+2g/1NwfIpkL9g/QkyhFyl+2a85u9osMxkxIu0pt
	 /PwI9ZgMSmVvz5xJkAgtNi2OpmFgoVLmz1ikcoBYtFX7ttKgQLfk5JuJOGFRmRNviY
	 C+TmmsQtHetE7Kez1agEcivyDXXL0IlFVsS21pwIxutQ/rvhXMaFeTft8jWnp3STYv
	 XxFljeuuo96sf6nZCDsNyz5wmS6ond3rJV63TUPYfStUZjhVyMYzvMJReYWsLudpqz
	 QQ/OwMCaFytXQ==
Message-ID: <sashiko-outbox-166634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: core: don't set drvdata to NULL in
 usb_unbind_interface()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010135131.286498-1-dakr@kernel.org>
References: <20261010135131.286498-1-dakr@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:58:14 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> usb_unbind_interface() serves as the remove() callback of struct
> usb_driver and calls usb_set_intfdata(intf, NULL) to clear the bus
> device private data pointer.
>=20
> However, the driver core code already sets the bus device private data
> pointer to NULL in device_unbind_cleanup() *after* devres_release_all(),
> which makes the call redundant.
>=20
> In addition, it can create unexpected NULL pointer dereference scenarios
> when drivers use managed APIs.
>=20
> 	int probe(struct usb_interface *intf,
> 		  const struct usb_device_id *id)
> 	{
> 		struct data *data;
> [ ... ]
> Cc: stable@kernel.org
> Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010135131.2864=
98-1-dakr@kernel.org?part=3D1

