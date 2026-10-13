Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9B3FF1A5
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925569; cv=none; b=O4e1RP1XZ4wK7p2y7+2lOo26jLeAapRrElbCq6UcVLs7tf8Btusul28u2u8a2/rbM2jS0zb8GSzjxNme1vn4AMObh3TH1aWTt1HM7gdfUjMD24Sb7ghvWX2y6wYp2Wwo5lTLomhe9ET68/WYWDkgfZEjHxmHcXNMc0aEAwC+SPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925569; c=relaxed/simple;
	bh=tAlFboJB0himKHW2N0je2a13o4I5c4aDcY7McF1XYf4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iL6y5rLGJYF6gGi8QA6rYeU0wsHZiX+nZLTKtiW8u7b9BB2yvK/9VLkIa2++vQJA8wsc/kS6iVOPHVXdTRffU7zyGsXQbzNeWgg0/pvnEqYZg2vVJylbzwB+9AmfLXFHz8/1ak7Z2tvazsC6b8FTSRob0+u9Vr1+RnffErD+M3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEwcaCen; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEwcaCen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2611F000FF;
	Tue, 13 Oct 2026 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791925567;
	bh=VFI47QvU/M8Q8WlYX7pN2lxiN7uBw8MWyAsGO8nNMsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEwcaCenGvuwZ4sQAnQdjvqicBTEyydYxcyNy9cQzMCiSd8BEVOtpWPA4e7GFOuOE
	 kteBIRMp1JD2G8Kw4eNEk/gxfvcR2X7kU7y7I3nXk7QO8fe2advNqgP8zQ+7MnIqrD
	 xrGa4qCWYeEOSodd4jGyzNDQF1b6sf+LnjsuyEckzn81FHCX5LIG5EDIMr2AXH0Z3T
	 xNm69DrBDkPKj+iP1kNP5TGOaecqBkrme+9ozXN4QDBTdEgk3womKhOzZN6I15tJkr
	 Isy6s+xSX7m8fEEhvp/5JLuO51s8qhat24U1hKRFYKrKcOjW+l9wxVfTddDP1BXLjH
	 mUJx+6AvHza1g==
Message-ID: <sashiko-outbox-170509@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: gadget: u_serial: fix NULL deref in gs_close()
 after failed open
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Ellis" <brianellis@gotenna.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-u_serial-gs-close-null-v4-1-9ea038501994@gotenna.com>
References: <20261013-u_serial-gs-close-null-v4-1-9ea038501994@gotenna.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 21:06:07 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Brian Ellis <brianellis@gotenna.com>
>=20
> gs_close() opens with
>=20
> 	struct gs_port *port =3D tty->driver_data;
> 	...
> 	spin_lock_irq(&port->port_lock);
>=20
> and never checks port.  gs_open() assigns tty->driver_data only on the
> port.count 0 -> 1 edge, so any failure earlier in gs_open() leaves it NUL=
L,
> and tty_open() calls tty_release(), and hence ->close(), when ->open()
> fails.
>=20
> syzbot hit exactly this on arm64.  Fault injection failed the kfifo_alloc=
()
> of the write buffer in gs_open():
> [ ... ]
> Reported-by: syzbot+782b2f1063e38ba8fa6e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D782b2f1063e38ba8fa6e
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Brian Ellis <brianellis@gotenna.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-u_serial-g=
s-close-null-v4-1-9ea038501994@gotenna.com?part=3D1

