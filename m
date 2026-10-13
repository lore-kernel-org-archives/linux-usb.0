Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9443B14A3
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877614; cv=none; b=Si856iFDK8z150bfZCs8ysopIGarJLSw01nZNgDkqY8l7rhTJHjmF1dY/tThgzGalxRINBJiNYg2u42/25tYJ/gCKpWBdZ9OkjB3YlMwJJePRkWpl1a8XbFfV5krVVR90gkS0FHJGe8hBfaWVj+Mfp4wRAbNqcbPOG8MO/GDHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877614; c=relaxed/simple;
	bh=fxwKri9+NqYzvVKv1BCMA1tuJoda54sGmRShvrdwAic=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=n52Sukf7kL+JgwH0S3BXQJvNOMLX9CHDWBqerNZrTOGCgbbQfSRDJvvIKyxBBEQ/gXqmYOQ3breVrqPx5figFsoncLjPq3EVBwQbemuPTBGvz05J+vuSiXhRRpxDUpwtRxYLMbgbb5b0A7oQ/r12uELKum+Sd/onFHS/6NN/gKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqozPvnk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqozPvnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F143F1F000FF;
	Tue, 13 Oct 2026 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791877613;
	bh=fxwKri9+NqYzvVKv1BCMA1tuJoda54sGmRShvrdwAic=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IqozPvnkoCrl04zc1BL2Nb/UdETD9QtJSS0HmL+AXR9JtPEqCZGl3LWMSjMKCJ6UI
	 8IV484zwOGw9ozE90+p6MVM4Jtl3VEYs90vLdfHEw0lFzT5RYCma0KI7P98QqlSvMS
	 YMPVdjGKfh6oeuwkKX1ok5PvH3Ir2r54l+gYL1nMfskXlcF4ofsRHWixdBmN9yWRG0
	 wKW2xFP28iA1OmQk+JJXxkU+axlcz9tX/4BW1by3zkHn7t1+A1tlrfq9PfuJCYooga
	 bET5FgJLMVXdajxo3SErilUaqEdQHgrk/8KaoI5MFSINRdAgyn9uvFqSnqwI/B2bda
	 QdHmD7SPxaORQ==
Message-ID: <sashiko-outbox-169208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] usb: gadget: f_tcm: clear the scatter list when
 reusing the BOT status request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>, linux-usb@vger.kernel.org
In-Reply-To: <20261013073328.2936318-4-yhlee@isslab.korea.ac.kr>
References: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
 <20261013073328.2936318-4-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:46:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> bot_send_bad_status() reuses fu->bot_req_in/bot_req_out to send the CSW or
> drain the data phase, but a preceding sg command left req->sg and
> req->num_sgs pointing at that command's t_data_sg - set in
> bot_send_read_response() for a read, or usbg_prepare_w_request() for a
> write. That command is freed before the status request runs, so an
> sg-capable UDC walks a freed scatter list in dma_map_sg(): it reads freed
> heap out to the host on an IN endpoint, or writes host data into a freed
> page on an OUT endpoint.
>=20
> Clear req->num_sgs and req->sg so the UDC uses the linear req->buf instea=
d.
>=20
> With KASAN, a read command followed by a rejected command that reuses
> bot_req_in reports a slab-use-after-free in the UDC's scatterlist walk,
> with the previous command's sgl_free() on the freeing stack; clearing the
> scatter list removes it, while a normal sg read still queues its own
> scatterlist.
>=20
> Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP=
 + BOT")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013073328.2936=
318-1-yhlee@isslab.korea.ac.kr?part=3D3

