Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698443;
	b=IGSRvA44ItxgjzjzJDaPPkDgQJCsfg0TKvzi8pM/scDYbiAMBAlmRCyobz7Gva0kTqwl
	 9b6vvuJQAvX24fbtVcHEa4HYqEd4iToCkG++lkcxR7aL2Mpaf9weh9q7cspXGVk8/RSzP
	 8vd5rXdiE6nenjdMAP8YMQGCp55d2ahzsCTF/ChLiBqtzh7hjWZ9V0bQOL8EBaCmCrPa5
	 PmMCe/v5zaS1bp9X4mgRzZ+ejW2NoFjZslZcAANIzhjaU/g8cLZKiWjrsDAMDusz8LMdb
	 E1jnuCsvLaWNwsv1vJRR0imX9Wy94Sa3f6k4NfFuPeKtFf4BPbz7ykLLEOLVN5pphEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zW9AwXcpdu9ubCzK3UWEy0Xh5tFMMSg0NwaxxIXSbQc=;
	b=3rWDyFZgcDAE1TIKeo0wljuzEFZWT/cANne8ASHGkFkGVdXnabYURAZo6Hu8htgrHv1W
	 3Pn7o1cr3ZD0pGhiJiwtGfvcRoY2kFGQsm+eY4/vHL5VlOFbCpciaXJkLi7u5HmPP3wyf
	 9OvJrKwpETzn0abjj70l3oa6hYxovc2kA5MP3GIdxLA+n9PJ8vjeiH4kywg2DwbbxMR6U
	 909e+euG63AykE0QRDhw9xtcNxo0XNKmhsTKod9RcdXs4z/wBOMSBcBKFX5NdYp5/hGcs
	 gMs1DZaHvtATLq26MNYR1eYiBiEGgh2cfq0W6yiDokKL+1AHMQkqPHawQ+6SgFD+2tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dA8SVE3/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941B606A323
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dA8SVE3/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA991F000C4;
	Thu, 26 Nov 2026 13:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698442;
	bh=zW9AwXcpdu9ubCzK3UWEy0Xh5tFMMSg0NwaxxIXSbQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dA8SVE3/mK/MZ7jLXtqmDqtaf8Kg6Mh5E0+9kldUcDhVHXmafQZ860dbk6L94Igs/
	 SuONMZY8olbXCNJ3UMY4jCMf5x9BISN4XvOICHRpf/cBKZjK560Yh6jGpBncRVWBXn
	 jIdY6WH50g3lOIGJ2R/WIrihVnmTX1fL5LILD5M54sVazV8MbC3MIcnGHf9Org5ndi
	 0qLcCd4HUlXAEBp9ZyBXJ4pcBEXi+t+cR2LwmjEkuvRqrYy8V6nnx76aHx0TDk0Xxj
	 4+9eOlyqX4PMXI0J8+97VOEkMGwUxb7M/Up+VaXQzvAyBvuLDZJ9ubq3a6vra2NkqV
	 MqTgs2DvTzpEQ==
Message-ID: <sashiko-outbox-235564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 0/6] usb: gadget: gadgetfs: fix ep0 request lifetime
 and control races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-gadgetfs-ep0-v10-0-8add6d9cace2@gmail.com>
References: <20261126-gadgetfs-ep0-v10-0-8add6d9cace2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:07:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 6-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-gadgetfs-e=
p0-v10-0-8add6d9cace2@gmail.com
