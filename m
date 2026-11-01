Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517671;
	b=hIhsQLeOySqqHuP0aFnVEWnkPLkFqAgPR+0VfgxGsa9LknP3/tJUn7DOrDprRVuPoSxB
	 mYI1KaQ64UmYpol3gtKMHZ8KDWIsU3/ylh/MXa7WjnknKj4RxoC+V/1VXMq3G2o7F4BNL
	 msDzyXZoIth/gfuq4Y+E+xv4B3Wr9bptOiHMrFZCqhjkk+D/WbymHQ+02VUNdsWj+epjd
	 7t5No+TbLzcjdS3SnK3F+ywT6IC8pqopLVTaeCvnDSgpTznWpOUqVUcJBn0YThA1LYiwl
	 yuujkZkfFsGYjF58c9b9Na/e8VWp4StIePPbVLAVaaQ6K5yoUg+d90r5AXSu1FZfsDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517671;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MofGPSPJ6cPEo7vq+VlZCUWLRTf3NmB7sqrxyRhTyVY=;
	b=YiVqvUzbAQFEod3sgk+2CawCRnN96xsZEFhTsZSk1WhDUvkR3Zp7pCa2TGzzh2zHscH8
	 Q1wwfqtw4f8Lz7xQc+cu8BPnATqB/JUDEJ7VPkMSMTFHORg302JYEqgOHr5nHx5PIZHH+
	 wGBVtjN28+trNgBYIlhlu7NwPr+ePOrQd4PFMYCFifKDhcR3ySmiPzYy8xb+dlh0Zd+jr
	 ErSrI4F7BaoFUhJlq6xwnk21oQiw2S3+XpT5uFtmSYRF3BJd5iMgoWzWPEFyhTlixh17X
	 b5ph5QM6CvxtP9Wrf00pexLPXZ2s8gygVQoakiEMZWrNM7cCVeysj+9q6rvmUt6WNiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKGYSv9+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF59606A329
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKGYSv9+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F45F1F00A1B;
	Sun,  1 Nov 2026 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793517671;
	bh=MofGPSPJ6cPEo7vq+VlZCUWLRTf3NmB7sqrxyRhTyVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKGYSv9+2ghZROOCby5KiU6KWFHZwuERx1/5LjIt/B1lIG2Tr1EIPXr1NcCfIl3Xi
	 1dYEhWtm/bQ+3WjxhIjTcN5mTmJDjAzfA+h/9/ahGn30+w8t4iYoFaWKV9A2MNO+OD
	 M+zUYL5O/uEp9Qx8kk+IxASijje9L2V6hMQ8cztCBCCVTxA/iodpnq7YH+aBrP3z7a
	 hDMclSa2cfc3oiCVQ03D8josTkJPzeX8tCo/tiYhezTBfbTYj+zQKGCCLnNHSYaeZS
	 sEDhye0kDeNmEkcVYZxKh00nXymercS1bKmeoevIXr1bV8ONRyHS4z3rZdp9YBjv3H
	 Ixg6/O99qHJbw==
Message-ID: <sashiko-outbox-192302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: usbfs: clamp actual_length to
 transfer_buffer_length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cheng Yongkang" <teel4res@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261101070651.1846947-1-teel4res@gmail.com>
References: <20261101070651.1846947-1-teel4res@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 07:21:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usbfs uses urb->actual_length from the host controller driver without
> checking it against the buffer it allocated. For a completed
> non-isochronous IN URB, processcompl() and processcompl_compat() copy
> that many bytes to userspace and report the same value, and
> async_completed() passes it to snoop_urb_data() when usbfs_snoop is
> enabled.
>=20
> With USB/IP, the value comes from the remote peer. If the peer returns
> actual_length=3D88 for a 24-byte control-IN transfer, usbip_recv_xbuff()
> rejects the length, but VHCI still gives back the URB with -EPROTO and
> actual_length=3D88. usbfs copies data from failed URBs too, since they
> can carry valid partial data, so reaping the URB reads past the buffer:
>=20
>   BUG: KASAN: slab-out-of-bounds in _copy_to_user
>    copy_urb_data_to_user
> [ ... ]
>=20
> Fixes: 0880aef49e40a ("USB: usbfs_snoop: add data logging back in")
> Fixes: d4a4683ca054e ("USB: usbfs: only copy the actual data received")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101070651.1846=
947-1-teel4res@gmail.com?part=3D1

