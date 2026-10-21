Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619667;
	b=FLidW//5GOugrHUJKmVsZq09yslgFTyLLQ5TiuqH3AG3NQQmTeFTMfi4qqE+5eiOlu58
	 52E9N6Xg2v+sAlMBxaYpCv+IGzeQq8FWH7JC59GqvgC40KDVOewxX48BScuMemHEVTvt4
	 sAHYn6ISRNxPjBKhWNSQaGC0zgF0FsaKM8ebRwbcuAIr3LKSzg4EOMdIeONl5QUpp8n6/
	 3CAgiv7U+NHUU0HxKZBwzPpLE7asRvELFFJTKaHsDM66GsTIpfvLCq/DWFPuwnzIScejC
	 LsZ7UKGd5NQOU+2DGV8J9D1KFPf8FfBAkPWBhqU+b8SNzGe1Q9XRwJuUpyZmgKeTrKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619667;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Tes+5+7p33/wagsyMBl262SYkfSHODHRdU9jxTJ9WdU=;
	b=bLCx7ATipkUo93bibJYMEfyg04F8W2vdi1eaTjlQkWMQtT9Qr11lNOnbBqWhEGmcMHm3
	 ObPkRvu/ppmnnWasQFXIc3+nGZ8rtxGeWra17PSCgJjzSDKrjGUXnuS7UY1xUp0rx3uFx
	 Fzqu31FOKdS9i6lJeccAumln2IuxGRoJPOKkEuivBMcy5k1gT76umoR0rTLPK8SNxnV2V
	 2Gs1tiiwUHnVXo5HfBj6V8+JjBH32xwQZYKgNauyCaJ1ks6Qud5uPLiGGrgYfQljYAZXa
	 qsFgHKq+C/zxLxHHdxRsyEoSfJsTS5W2NRNshvSBsfTXRUpa0M17V1gdZ3//OKIQKgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEcRuimn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7CA606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEcRuimn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EC31F000C1;
	Wed, 21 Oct 2026 21:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619667;
	bh=Tes+5+7p33/wagsyMBl262SYkfSHODHRdU9jxTJ9WdU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bEcRuimn/eJ8Pq8LARqekazJXnRIxrKB4Ok8BSuBNNoWpsCFS0Q9wbyy92fQyo6KW
	 O4IgUJkabUcgLUK5Gd0J9lE7uTCJkYAZ7MiHz8FVwKjsitHakstZNSIXgFzNgRa8GN
	 u0vmFENroJlYcXEaWi5EQ3iZcnxmNxT2ALiKheZc3Pr1C4pArFroZYCr22McIqBMPC
	 99nkcNChavEtCmzljsgnOpAm5siGZm2+lM2FxBaJ7s968Wvoooti7c6swTLnZj1YI/
	 tyCiVi98TpP7Rt9NERZ1152TLiw1C8UkuWFd0XSbj9tDieMEHoD7cvwSU9PHmREyJa
	 2J7np0O2coMDA==
Message-ID: <sashiko-outbox-180715@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: tools: add --sockfd option to usbip attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raul E Rangel" <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021214808.58609-1-rrangel@chromium.org>
References: <20261021214808.58609-1-rrangel@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 21:54:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> 'usbip attach' always opens its own TCP connection to --remote. A client
> that reaches the USB/IP server some other way, for example over a UNIX
> domain socket or a channel forwarded by a multiplexed SSH connection,
> therefore has to expose a listening TCP port on the local host just so
> usbip can connect back to it. Any local user can connect to that port
> while it is open.
>=20
> Add a '--sockfd <fd>' option (short option '-s') that attaches the
> device over an inherited, already-connected stream socket instead.
> '--sockfd' and '--remote' are mutually exclusive. Because sudo closes
> file descriptors >=3D 3 by default but preserves stdin, the typical
> invocation passes the socket as stdin:
>=20
>   sudo usbip attach --sockfd 0 --busid <busid>
>=20
> [ ... ]
> 'usbip://unix:-/<busid>'.
>=20
> Update doc/usbip.8 and the usage text accordingly.
>=20
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021214808.5860=
9-1-rrangel@chromium.org?part=3D1

