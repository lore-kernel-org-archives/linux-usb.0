Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336285;
	b=LjhPNkw3LR2IWHr0MnD33UO/Trpc9A2SiRHENy3huiZGmTXjKXFjdQJY62B+NbIzYJEC
	 B6EXpVVsXGuJSc0mTqPgec+S4xjiSLZgNIxcpGap27fgXCk7BiddjyQnqUnC4ydZa0wpH
	 ivwF9K7uAbnE+0kFGTIRpp/+uf5LqiCQoe6pO6Hwb1uaiIMqGbLSgvsfZPCR7qN4njuWf
	 DE+tTCeDUZ5qVUn+edc2ddubJd1ShBdNM9rf/oc8aCbFPVlF85jLxZRiZ/FLs5bCrPHYd
	 aBu2nrLInmh/+favJx2MsTYjr9v+I/EoH9Hx2PF/HDW2Oq2Sb97Z0FRpBvhPvFf8T4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ySK6Ssa5XxVIglZh+HQqyVKR+UEAnwWxNuEXI+hA0D8=;
	b=Nk7Qr0QPSyaDkJpb2oAkniJMsd0uR+Kfm/nNGupzLNQ+PKaYyO8LaUq8nryDyq5mes3L
	 Yb74bax+SiBCZFKCKlVCtWj5z29LZ7GMK5tBpDl2KHZBfgpe2O1WZC3G+0c3TpzO7kywC
	 Nw9hXHZQtJrCXIRwNq38uoNGK+eota0izOfLIQ1XyVGTwXurMFSgblAmEwvQPIuPCUWo2
	 1EkeukUJsty6LsOrA+PYNKPDT35nLJ31oqYPGG99p0dc1lCbx8sqhqLOg+RLjrp7E7m3M
	 CRb/5D+VNiDkYyXo8DPgIEn3Lm8vn1/nsNTTI4mRGSBhP9RtZHRyqbm0dLxSj0nBuCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoAlDZe6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DDF606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoAlDZe6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB821F000C4;
	Sun, 22 Nov 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795336284;
	bh=ySK6Ssa5XxVIglZh+HQqyVKR+UEAnwWxNuEXI+hA0D8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LoAlDZe6XHYtYcDtIwl4+kZZRcu5tNj8XJg9YTtF/h8EZOj1X2+qEDftRVFQAqgYn
	 z/vya2LNu7q/dqw1ALfhAC78Z+jxfRlPxlPcetMNue2WWw/CJ+AS9MMbmblvALDn5/
	 zStJ0VOK29U/0z0YWEv65LdzpiUf28GDAg1zmCNesUfwnDR4VWOw5xYNNJC5LU/Han
	 y9s9xp8z7/hEAwpJLDvehRmiSUtLy8c+SQMMb7mh8Kdodg+O2hDYT/aY5YG02AnZUH
	 3QilYNcMDsLHepiSlntfIqicEHckMRljoLlHQAtYFNqh6fSis+IvRGqAMDzbjoVmOM
	 Na9ssOd8/gO0Q==
Message-ID: <sashiko-outbox-227836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 0/2] usb: misc: onboard_usb_dev: Add devices used by
 ASUS AiO P1801-T
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122082512.64304-1-clamor95@gmail.com>
References: <20261122082512.64304-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 08:31:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122082512.6430=
4-1-clamor95@gmail.com
