Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986524;
	b=baQfMspUfp4bPwIaxqacvPRz7906uEgE6eU+zHHZhfUnPpJma5tB+tP/XF8ebG/ue8dj
	 S+T8QIdrtRK192Hfp8lOcOB4PvlYIxHh0nF8XIqSkuVEwtdIsBK6j7/RBJLM6Oauo8iT4
	 5CroT9+MrsdMewmu3+fQ5mWKj1EjXTJ3SXKhzalRJYTgvfodyDgRi98UaVO4HUBiq9Fq2
	 8IFLkLkhlC6NbZSGzWlarbuN+doiOzHRG8sNt5Zfm+4BUkqwziNwTZUBA3r/XHKOvLwly
	 MdIC8Mm5M8JIr7AdKfE2O8kqpNJ9ntp3qL1xn7iHT2VdEN7DhsFUBg/xjBhBOyv8kWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986524;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ytV5eu+9GLYrcz2GHB5d8VHKrSpJcX/JdFyyO9CB04s=;
	b=cm4gGeCVXqUliw5HiDRjhAdBL6ilK/G66VawL/F44MKzr54Z5gcnmdUaPQ3hfZw+m//f
	 yHAoUQawtB9gXDsvskKj6ZmxtJGv/YtJCtls+YkJ2oHpu7Vs2JyDOd3pgorsIyMh7TEct
	 dQZKL06et/YDNH0o46NHiBibXK/eDxwOZfLCwLi8YPHJbcW5uuU2s5vs/U45XQcbtuKey
	 noCGtEJXZxLA1E9bjpQ847oj5hM80DCxsPhlRFL8CWlUb5BNW4XP6WRRNOC4hr9Fd6q5G
	 dCZC4BQ3qbwKBaLw610CmLTygPqskVPFZFiseQ2RZS1SDGH2RIEAPy/Z7fO4HQKC2HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+6IlYD8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F5606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 03:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+6IlYD8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B94B1F01825;
	Mon, 26 Oct 2026 03:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792986524;
	bh=ytV5eu+9GLYrcz2GHB5d8VHKrSpJcX/JdFyyO9CB04s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d+6IlYD8BdQzjPMemG0KEc9kKbR5b5H3hFBnip46AZOsaaEVAjPG6WYXi00+LTLgm
	 wGXKyBnxTaufrfY2z7KW7w3a2Q+g47/2lXuWRCujG6iIcaw7t4l4hgrhYGzhvwkwWI
	 7zySZv6eG7Flqw7d2Fx1GGudgF/A04T0vUgGT1zv2JHc6ppiEQaxW3MJAKpYQP8kwg
	 kFa0tipuEgGYSIDJ2Qe6Bd4gRoLLXdbob5e6l+tZ1U9RvqiGIjhY1f9rIKvqGanllQ
	 1TZMCKYfn8Ebiten64ot0N+UZaKrfd9w8tyG05asI+hVQNVAGV6FtM0ChCBJT5uKj8
	 846Cd86pzFEWA==
Message-ID: <sashiko-outbox-184608@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc2: gadget: fix off-by-one in ep_from_windex
 bounds check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fang Xieyan" <fangxy@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026031138.35911-1-fangxy@xiaopeng.com>
References: <20261026031138.35911-1-fangxy@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 03:48:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ep_from_windex() uses idx > hsotg->num_of_eps to validate the
> endpoint index. Since valid indices are below num_of_eps, an index
> equal to num_of_eps passes the check and is used to access
> eps_in[] or eps_out[] out of bounds. This can cause an unintended
> endpoint pointer to be used by subsequent request handling.
>=20
> Reject indices greater than or equal to num_of_eps to prevent the
> out-of-bounds access.
>=20
> Fixes: b3f489b2b658 ("usb:hsotg:samsung: Determine number of EPs from HW =
configuration register")
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026031138.3591=
1-1-fangxy@xiaopeng.com?part=3D1

