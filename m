Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111595;
	b=WIS8ok5y+Jz9a7AfPsG3DowcwgdhCm4zPDALUmzTUkp1dGvmfjI6u8yNkIE018OekQcX
	 IBnzDwT5Fm4apTU5pYpVJe+2R6z2nKv7/Q7gMSCUn/6fmL9fOaJhKOnG6MA6PiforRJKG
	 ME7ToNBj1rG69QbzouapnTy/XK6eolnCsBzbfk2IJ0nYaxFPac8hzMbRfGM4JgkHmm6iL
	 Du4mVWVGGo97YQjnUG3O/gYumILenbVz97wrmpmVoLDKIP8ta3IalncDFwyg+ID6bwALd
	 KZ4JCGxps8JV/PZGRlzToeouq+jr5SZ94v9XQJ/KnQlIcyx+HT19yRJZZNAWRi0QBSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111595;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hEG+WTv8qfJLt/Ormu5/gsEmSp/WokQHkGzuvW6ycaw=;
	b=rHjBbLwnWdcXSeP+tro4EAd5FsxvegquX6HwkwrhClvgKO4dhdNnHhiTuR1ozKpa6oPq
	 6OOaJURRDdcIFYmr4HysfL2hS10OJwJJxJrMPgR1cNcUG1bv01AMxQqhhH9RkgCs68ifG
	 0dmDWfTJj7GMCN5l10va5ZZx16Ya9SqRSI6RaABsufIu/viMwuOl2YE/BtkKpUwUKQKag
	 0WN9WFyHK7RtoPTa5XdTuLu01HHiDhNryKIOswH5G/8tcw8SGoHUhGAzzf1sQCjp1iP7o
	 veeLgjiSwD5QhkOc1kFxn7j/rn3oYlHZUhH4qAVJrf7AiNx2jZFMReplMxYWGj0zMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGtXkGYg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7EC606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGtXkGYg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EB11F01829;
	Tue, 27 Oct 2026 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793111595;
	bh=hEG+WTv8qfJLt/Ormu5/gsEmSp/WokQHkGzuvW6ycaw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QGtXkGYgV8kM/DfaPufJrXdoTzUSNp7YGy8O8+nGGoUacZB/x7sCmYEGncz1klHrp
	 GgMhQUPWFGYJdZ50DMiV7FTBHqLlNk/TCXMJbcWG0j02zHHkjRKEFI0tevI+wSRZtR
	 pBDCvsdo6LtBZE7YlTU8vg42NHLvqOqjRdPhq+tVRFSEnko0Y02MIerOhab7tBJzcu
	 i5u4pRsMW5VntX9Zc5OepD471iQFZOmjDbBsN/gIdZVne+ipW5ahORQ0sNPKpjGhbf
	 5IamgeBrtOWD55nZXgJCg+Dbz2cVF46kV4Tn9ZD4gMdUiZ4v/6nz2NNynu3bCezBGD
	 HDeZaytHVsSEg==
Message-ID: <sashiko-outbox-186725@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: stream: Undo more if the start fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <2026102751-nibble-synapse-d406@gregkh>
References: <2026102751-nibble-synapse-d406@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:33:14 +0000
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
> If the receive buffers cannot be allocated or mapped,
> tbstream_dev_start() stops and frees the rings, but
>=20
>  - leaves the DMA paths through the XDomain connection enabled, with the
>    hop IDs of rings which no longer exist;
>  - does not release the frame array and the pages which
>    tbstream_dev_alloc_rx_buffers() had allocated and mapped before it
>    failed.
>=20
> Fixes: 6db21d817b43 ("thunderbolt: Add support for USB4STREAM")
> Cc: stable <stable@kernel.org>
> Cc: Andreas Noever <andreas.noever@gmail.com>
> Cc: Mika Westerberg <westeri@kernel.org>
> Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026102751-nibble-s=
ynapse-d406@gregkh?part=3D1

