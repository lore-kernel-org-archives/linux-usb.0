Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653164;
	b=36g3ymoXWoFDBkp4ZjSwnu5Z2/M0vmtdvQF7/7HtS/UZmyTCPEoCpPQi9AIYEfDAQqwp
	 9GgoLjpgyrHtcFJbDUYukXfR8Lfo5Mi03SGe/F8R2QAUrsGKPly2gOPtUgp5+zuZyWs+J
	 WIf6QL1rXIVoeH6zXDlzyrCl4y9qmQ8Ur8tgqHTQoowPIoiFS1sb9K6ER3WOho6WUsddP
	 HwiChZolAH/y+5RdTERCRkQYbAu2bFX5PeI92eNFmPpozmz6jNpFkFE6BYpd8dDEDo2uG
	 cWlrT1YQnm7/rZKXY7txE72yaPFucKKaQ2qug1WtiNJZ1PkQXzLrqdM3k2QnqLAbPpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653164;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qob7pgqwt6VGek3ELlEy35v4IU75oXp66c/OU5SfFmM=;
	b=G7aAp/vvDxxgt/JhAe4m/w3mkr0xhrjnO3ojwjIfghgNxqKOYwXL64ObFIH5Az3i+lH3
	 uEzvIb8UWzHkKBr/E3uLUAyRRLUecKrhrVY0Je/hdfW2sjz5o//VmQUpr4rGu5nAQwW0X
	 /KcVbfr+mx/a0n3L28IU0qb614NXzxHQP+1LYQTX5D39RtsTbf4MZkB37jn0R9sK24iS5
	 UgJ57Pz9i8hQxfm4nb3kUGMH9zgd8ldSTWeD5CGqE0r54ghitZdkyKEONAcsVQsUZm7Wv
	 4GjCbusItK4uQYhCmc209cqsYoV6vh5mek++mrb1PtRsY7mk1dhijLbksmC+5eDOI8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DuWPn/PC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A04606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DuWPn/PC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A121F000C1;
	Thu, 22 Oct 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792653163;
	bh=qob7pgqwt6VGek3ELlEy35v4IU75oXp66c/OU5SfFmM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DuWPn/PCaC+GTqrfsww39MJN5oCs3FmAwN0qGW/Tl8uM5JZsJtzf7RvHeX5MIO5bQ
	 qZQx8Kr+CrmWg4e9ctDG9/4dWuUxSpmWqyYAlHrlEez65iDTk8KLjD73OdKLz1Ygh4
	 yyFSD17MiX/um+qysUSTORTc9cnIxn5V3Q016RBHRF/gM1PRPgbQ7Z4fOprEF9bUHj
	 RKtUhpwB1bFZinh0OFEjrqxqdO4Xl7Z8VyfVxue+W/ULqjH0JEfS1GnUy4w2xX7qbB
	 6OfjdKBM0ZAsI2a2ix57deW+zEmp/6piyJG2kb7TpSsuKhUKXSp26c7F7QlrW3K/TF
	 VcCzEsOtzxnrQ==
Message-ID: <sashiko-outbox-181114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 2/6] Input: joystick - use usb_make_subpath()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shihuang Liu" <shlomojune6@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261022070929.20820-3-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-3-shlomojune6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:12:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The pxrc and xpad drivers build their input device physical paths
> by appending "/input0" with strlcat() after usb_make_path().
>=20
> In preparation for removing the deprecated strlcat() API [1],
> replace each pair of calls with usb_make_subpath(). The helper
> formats the USB path and the "input0" subpath in one call,
> avoiding a separate buffer scan and append operation.
>=20
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022070929.2082=
0-1-shlomojune6@gmail.com?part=3D2

