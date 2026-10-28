Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174778;
	b=qeoWzbGKEk3Q0Yt62gQQh1XEPNB2e+JxjZH6Wkb9Ako4FOOCTSn1vjfiA8j/qf+KNVoQ
	 E+ntjeojzvBm5/WuE76nzI26gryf5b0mKTFcWWK6AWKlQXNfuzRUVGAmSfYuokNiwzL2q
	 umI5iGz7C5qTda9snWTaTL1byAwAVnya+l3sNOvlDZzlRivToqGXpjjUM/I5j7qxFhujK
	 zQiCNALmdMXEtZ8QsNw2t0bM0KCwqA1XZCgUEyDNk1CXnmFtYvSdu3wXDsBY+W1agP0oA
	 UkYDsE8OTlr9BktfrEGhivh538ZqpqG2L9Yyu2Mzxn23+7SPaflLLWt0Mjenp3ibyDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174778;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HRkYtGJDLhplAHbNJRTmo2TTcpMgGzVDyfFau52pD6c=;
	b=V8x3R0iL6taz+vx4uGLBoF29Y+IXjjIdZCkfnlbkgn7YTnVlCY5oVIUTUXbAxIiBTf7F
	 XnhwNRbttrXw7hDRsxSgBEvgwhm4ENirQ/mG3uQdYQ8ydw1SqjnzDL89rhQutOJWBZw8w
	 KnZHQ/9bS3nQAwk5cJ5onnASrb6EA72DMToJrxkxrV5643wLWG7+6obU07aWDRu732bk/
	 UR79W87aYJhaFxMRcJEvClBlt1V7gl4fikzb4RIli6EbvqaAHCQlala3eYIiMz061c+BY
	 Weye52S1FQmhDOyiQZ5uHlx+TuoHFWctfX5HB7Zd/ajhJayNKLk598IIXjSmF6TvVXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STjQXe7p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CF9606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 08:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STjQXe7p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD261F01825;
	Wed, 28 Oct 2026 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793174777;
	bh=HRkYtGJDLhplAHbNJRTmo2TTcpMgGzVDyfFau52pD6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STjQXe7pRDwTXd+jbjfYx6/8ld0mDAqiqKnJbkha61g4XEq9se6uhBTOLlAr8IAde
	 lSAZogz2LlEuGSitkoMEM8SaTmoq3BJIK1ntqMEeDP/CumD2KmTkHpY70p4Lb6CrJP
	 T7cM4B9x4JhP/sD6cw4cHS/Ljfj+/AMH4ts3w1wwngwTuH5roL9wJZNBL7Jyhoe+bL
	 O3LtOLjozivaE6a/ZqA8bs+U13ZhkOZBS1iC6XIzQxUHI0ub6pZwBPoIYUPEFUG/Zl
	 tNGaZGICxftEvycYxaCBQDAJ97FTt18PV+Xvjt8Mrs+5YShlbLLKZLNWfWF6OPj69f
	 p/xSXE//AjNPA==
Message-ID: <sashiko-outbox-187608@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_midi: fix UAF race during IN request
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sonali Pradhan" <sonalipradhan@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261028074821.579450-1-sonalipradhan@google.com>
References: <20261028074821.579450-1-sonalipradhan@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:06:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> f_midi_disable() drains and frees pre-allocated IN requests from
> in_req_fifo without holding midi->transmit_lock. If f_midi_transmit()
> runs concurrently on the workqueue, f_midi_do_transmit() can peek a
> request from in_req_fifo and write into its buffer while
> f_midi_disable() frees it, leading to a use-after-free.
>=20
> Additionally, when usb_ep_queue() fails in f_midi_do_transmit() (such
> as with -ESHUTDOWN when the endpoint is disabled concurrently), it
> resets req->length =3D 0 and returns active instead of the error code,
> causing the do-while loop in f_midi_transmit() to keep spinning under
> midi->transmit_lock until the substream is drained.
>=20
> Fix this by acquiring midi->transmit_lock in f_midi_disable() while
> releasing IN requests from in_req_fifo, and returning the error code
> from f_midi_do_transmit() when usb_ep_queue() fails so f_midi_transmit()
> aborts immediately and drops active substreams.
>=20
> Fixes: e1e3d7ec5da3 ("usb: gadget: f_midi: pre-allocate IN requests")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sonali Pradhan <sonalipradhan@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028074821.5794=
50-1-sonalipradhan@google.com?part=3D1

