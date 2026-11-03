Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687621;
	b=K7FaI+DkLYhIE5icLM8mZSkntXVcGQMAiuhoL0KTPyp+kJcVHWWc/4+J78/B+4qRBy1/
	 4ZYhUUs0jNZPEAK8I2uX2wxm+bA7ypuhs7V1YD+4LNpL0cbzSvlKTSTefkv6nwflQNpGR
	 IdW3+fir1mmRJ33AMwmK7XpaIh7ZGnVKxk7SvMtL2MfmfrurKufx41jIvEJLTQL96Sm8g
	 p5STvV5HgzFPXgQPVPg25Pd4/2xeBA2gmTZkMTYGFs3JN5Ia7C2i19yPhgRfy4+dUjXiS
	 Di0dWmqJKnSNfQNqOtSOJKr9T6wbvFaZAPRlSLAk5rN/r8WKpFwsCcqFPDedE2nDelQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qifgc06Q4Xg5gQPZpBGxV1h8wyEc6RZ3g+Ec6cwznE8=;
	b=CMdy8fMPWJjZcphbmLTUt5XWvFet0dowkauBZeYxjNKtAAW0mDdXNqb5whB1Ys0R1yqu
	 AtDamM3B9z/M0Eb987pdOoWAGGZRNp3pXytRQUns1hd4JSjjv7XPAip71bhG8HvGQgIuc
	 Mhh0eybSwLZfBZZZ0o/veQH4lXKdxB2GsR0EPw84k3Gi8fzalFntT0sioATsvP6Rl1bui
	 VV59htAOupAHHmO4ydBWCLD/JUaT9Gv/wzwpipPB2EYEL7Oai7T21CRGohuFgGiszN2A1
	 kCZi69/4tCqLvr5NPshEzomaGXNLtNthRxs2RdzyBsvEnPPwDecjpmCaZ8f6IoJGh7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQiQIZ9M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90CE606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQiQIZ9M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D00C1F000C1;
	Tue,  3 Nov 2026 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687620;
	bh=qifgc06Q4Xg5gQPZpBGxV1h8wyEc6RZ3g+Ec6cwznE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kQiQIZ9Mt18svgfb2wnKcCQ+zFcKXmzxfU79xn/QIp48S4Xlgbr4GXjOV+PUA4byg
	 50MV48tql3X9akxvLMXBSD9XeiipTuw+pSglIqo96Jq4N+MITyDt3Vmz+YdoUzyOZw
	 2cOcds+CkJMhXJ7Ty+DJKWPmPYvLZzzTlPNWL1+iBQG6MZF31SfGI28fdEywJCrzTv
	 5js86GwHlFgZSbv4pSU8FYDaTRQG0r7CTz1N0HYcqVP5sie4HrTADr0MpfCFOHxB31
	 s5+tSZybWruYTi/tMLMmK9tb0OmunRlE/DivWC6wxmfF9xdTBrZPIS1b0S+OHxykvj
	 IqYvSxX+OHzlg==
Message-ID: <sashiko-outbox-194639@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: fix dwFrameInterval array leak on
 frame removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Priyanka Mani" <priyankamani2100@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <7f7db2bcb2c5d248cf72a270bd18afc71cf01559.1793687064.git.priyankamani2100@gmail.com>
References: <7f7db2bcb2c5d248cf72a270bd18afc71cf01559.1793687064.git.priyankamani2100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:33:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> uvcg_frame_dw_frame_interval_store() allocates the frame interval array
> and stores it in uvcg_frame::dw_frame_interval. The array is only freed
> when it is replaced by a later write to the dwFrameInterval attribute.
>=20
> Frame items use the generic uvcg_config_item_release(), which frees the
> frame itself but not the interval array, so the array is leaked every
> time a frame directory is removed after dwFrameInterval was written.
> This happens on every normal teardown of a configfs UVC gadget, and
> kmemleak reports it as:
>=20
>   unreferenced object 0xffff8881027f5040 (size 8):
>     comm "uvc-frame-inter", pid 281, jiffies 4294827366
>     hex dump (first 8 bytes):
>       15 16 05 00 00 00 00 00                          ........
>     backtrace (crc 60980708):
> [ ... ]
> functions in a VM.
>=20
> Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/7f7db2bcb2c5d248cf7=
2a270bd18afc71cf01559.1793687064.git.priyankamani2100@gmail.com?part=3D1

