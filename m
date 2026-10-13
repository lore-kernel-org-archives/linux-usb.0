Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0011378823
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877751; cv=none; b=E/pWxrrsgsDWTm/uZT4XQE+iZG/0HzaP1ZQOpvp7AcpgFthP+CqXi5iBZBdvBXc2ivJER8H774qGKQiyCbMAalF7mbEejg7aDrzcaeK7iUAaYxSCcgrzfc6d6Mp4j1WuK1cTwwVId81Fp/gNwx7mCvl2fmqPN1uBKA2gWL85wuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877751; c=relaxed/simple;
	bh=HlAlRFngc7wZWNYz1I5fX1DsUxNQCXXC5O/PpDvXIRk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=DSP6MDmc0wSCAjPa+Fc5PtZYKCMZO9Ip0D7dLpm55IE8ptQ7ts4TZ+WpuwgrFYLdm3rd5bsEhruxWi2ps3WHrDdF5YeqV7LIYWIPcz3sdGQ6EeSpQa1jrKaZaTUFISAfJZ+il7VWB+oF/SyqVzqTQKmOYhb1LYapvucC+a0/GwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XECKVFw/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XECKVFw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C913A1F000FF;
	Tue, 13 Oct 2026 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791877749;
	bh=oAqdZLZ9DCIjRNPBd+4bx0pje1PiFJrsSVAlK/kUdBk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XECKVFw/td1WCy6KqPcx5g8/L4sDXlV9l7mUGpCBOUGdgJEmlKbYJlHQCKPw+KSHs
	 qZHcx+3Gf1dv7Wz70TIj5mbHnzOVIMMeaPETOAdCMILa4UfKhQeL28P0pljSAOXPHZ
	 uPPJ9t9s14oRgG4B5KAYdava14MKi5+iPkyQ3/le1i/W2psP4IeI5RXEVY7hEwU7ez
	 vKfWZal2oeoePzPdqL2R6/F8iIMxkp6rGTU4VETVsFVagJo+bivkFVzj/w/di6xbKZ
	 Zpj7RjGf5vhFggjSUJhbUNU/BrPfgMNOqrjbJZH7glkEpGe9xRpzqCn/pyUwpNE2Qi
	 KlKRmn/Z8Hp7A==
Message-ID: <sashiko-outbox-169211@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] usb: gadget: f_tcm: reject a short write
 data-out transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>, linux-usb@vger.kernel.org
In-Reply-To: <20261013073328.2936318-3-yhlee@isslab.korea.ac.kr>
References: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
 <20261013073328.2936318-3-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:49:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> usbg_data_write_cmpl() copies se_cmd->data_length bytes out of the bounce
> buffer into the command's scatter-gather list without checking how much t=
he
> host actually sent.  A BOT host can declare a larger OUT transfer than it
> delivers and end the data stage with a short packet: req->actual is then
> shorter than req->length, but the completion handler still commits the fu=
ll
> declared length.  The tail past req->actual is whatever was already in the
> kmalloc'd bounce buffer, which is not zeroed, so uninitialised kernel heap
> is written to the backing store and can be read back by the host.
>=20
> Fail the command when req->actual does not match req->length instead of
> committing the stale tail.  By the time usbg_data_write_cmpl() runs the O=
UT
> data request has completed, so mark the command and skip the ep_out drain
> in bot_send_bad_status() - there is nothing left on the wire, and draining
> it re-arms ep_out for data the host already finished sending and wedges t=
he
> bulk pipe.  This mirrors how f_mass_storage stops draining once the host
> ends the OUT stage.  A command rejected before its data stage still drain=
s,
> since the host has yet to send it.
>=20
> A short 8192/4096 WRITE then commits nothing to the backing store instead
> of 4096 bytes of stale heap, and no OUT drain is queued.
>=20
> Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP=
 + BOT")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013073328.2936=
318-1-yhlee@isslab.korea.ac.kr?part=3D2

