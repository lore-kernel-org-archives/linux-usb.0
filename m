Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794016724;
	b=P4lWYS07wNNAB8+haTBXagiLSK0Rjf4H7JkjShdJigT7Ey8sjarCgkbJOmo5x5fTK6i9
	 HTP629unRthMWAviguFrYlJez8x3TkW3DjxL+nMN3ejyKvVhY+bSzE6A5YAE/eWpyPeC7
	 7vDDv5v995FBxbAVeA8ZHtiBmKjx3KvR3MpfhiVwQ6uNChlNhKf6VtNAybb1NyDGPKO2Q
	 m9KYuv48AdzGHPRA3xemMbi/LjwCiC9KoBBNDl26JfUMoHcIF/v3oJIjM+b/iGnbaHMal
	 6q/sPYrb0ttQJqP/+6gzaqUUahdouf7W3cC1EFx04a9fLSd0nJuwkrmLj366Ah8kN0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016724;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WLf+xTdwAioAWQtq72x/ukz4tUBNW+eXS9rzF7oNalM=;
	b=eQDtwNGZCz/NdGk8wPO8kymkLj5psRbdTglbH0fIisHSLclFYQjyBWWoUq5TEdtWnI4i
	 iNFKwC076s3WQiCmWVUpiQPtjCEqE6rO+/0oHRV3DROSdo2ZNFjBGqaDImu0M2V+T+B5Z
	 sW/R96G4UYYY549mEDXcp52tJP3lMFgCQYtA5YlyTy8QRUP6NPrIjLcQVBig/ci2SMgzY
	 tZvvXMx+7xmuBhl0EO7gjf4pXOWyHdGIvt9YWfYppqZG4EFDqg3gXTpU7hkF3eF/2e+6l
	 ZbsaeRBVtSnmICILzZ4HjxufqS0yocIO6DzQgtHl3woA6zKFlGqXyjIFWfCW+C92MbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ez4I7y15;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B900606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 01:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ez4I7y15
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C8F1F008A1;
	Sat,  7 Nov 2026 01:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794016724;
	bh=WLf+xTdwAioAWQtq72x/ukz4tUBNW+eXS9rzF7oNalM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ez4I7y15PRNFkzOFGbbsOTdNraoad7sPmj800By/VO3+BCAwEFo0ZYTIYbgDnB+K7
	 Z07yHFjAk0pdjfXCb/GEKkL7aw/wvCndH/oHLlVbtShNyVt0Z6PWnNsrd5XybTGsZ9
	 kSl11D/HqGiKjD2IvMSAlqmACp/mFj+MiDo2icnqhtBB6YiBcyk2b1w+zMpoqL4UjB
	 4FLID5r0lymCmpbNiCVjTADMCqvQRr2DgiFni4o5ClEhjjme8UiWbkBy+DcPJRzgek
	 o0BtX/DwgGzaB5qFIFKKlTuoVFKqFlPlvlZ3RhWuobw6r2v/+QbDtrHHvacTRNH0kc
	 AzEO8KgKxG2qw==
Message-ID: <sashiko-outbox-202470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: cix: fix I2C bus address and size cells
 on Sky1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107011012.3655873-4-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-4-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 01:58:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The I2C controller nodes inherit #address-cells =3D <2> and #size-cells
> =3D <2> from the soc@0 bus, but I2C child devices always use a
> single-cell address and no size. With the inherited values every
> child node triggers a reg_format warning, and a device described on
> the bus would be decoded with the wrong address layout.
>=20
> Set #address-cells =3D <1> and #size-cells =3D <0> on all eight I2C
> controllers, matching the I3C nodes that already do so.
>=20
> Fixes: fad32e8ac460 ("arm64: dts: cix: add DT nodes for all I2C and I3C p=
orts for sky1")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107011012.3655=
873-1-gary.yang@cixtech.com?part=3D3

