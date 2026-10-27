Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113748;
	b=XZthMwqi+cwYC0JeE/wjVdbZ8i+dk4gvr+zOvQvKVNWnx0fbY5ifndePROs3PC8VS0Gi
	 blP2wx1mW5Hr6dd4Vb5bULEkMH4bho0qduBbxdWsrd+LjswdxO+vMCUubkQ7wrK9M2LAK
	 Sa4NZUhmCi2Zckj8vwl5n7L19z6nP27yCLq6vmvXiTtW18IQVOoIRtD5yiefYVk3OnXlI
	 L5jF4VfvOMYuys/lEOcV2MfhBATpL6Y124OiPEhIzuypOo6HIKA5A0Ow9u0xtedNUITG9
	 /p/OPMbMdtoc93Bm4F0LWbx8rJaRme6R+L54dAK4aKdXA460vNzejNwFr1YhCE0+zIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113748;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tDmPTu9q3o9IatFMeNaYgiNYPNFBQDEC+npVi/FlV7Y=;
	b=B5sZ5M87LrGQiKc++eeHxPEXugevrlp09fv7LAaldC5cT6e67+7ewIJ++lbtP55O1VX+
	 b7PsotRWYrO2wXlZSp/2wxEJud6XWQ3Q6PcHTZSnp3U825/8uHgUVhWIRw2vctypgGVG2
	 +RCULYghE3//LSP0Byw3FHFzB+clEZyeBZayrLPVi0z4oS3ms4cChUXbhVAU+WyCAXghy
	 DpZ3/0zhc327gz2DXYqaz8nqZquTY4yukDeq9dqUXeHmeIzyxLMHX74sfdZbyVtbUvMel
	 SXI1PikZN3p9+E7JGyQ1+pWlhRxOtNMB9TpLM+0Khw2335LylMXEDXAHbP7RhMpg4YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+SQyO4Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E3F606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+SQyO4Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30831F01825;
	Tue, 27 Oct 2026 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113748;
	bh=tDmPTu9q3o9IatFMeNaYgiNYPNFBQDEC+npVi/FlV7Y=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Y+SQyO4YUJs3vtALe/ymElp4EAML5bqfEdy4NE/2SdQscOUaK0NZC0/f1KVhqzy6A
	 5ENnZKgv3PU5o11/bY920iQYMoemVvFPEW2VZjBrSi8a0oAc4t94y9Hjv8VbYDExbm
	 YT0DrZ8dLeVmfJDLjvRG+uNWb1sU2AQ8m4csw1Eh619Bbu0BKa6iX97HUJcOw+zABx
	 KanV0sH2iGDNGqZEPLZL9yJ2IGvo1knxeWSa85pS69vzDSNGh2292k0kBQx1JoDBWq
	 TQhiZpZgQp8aIKZPxqryrLm97wAhrSr9fuL4yUg2+fbQ38NDmErkRpiA7SdXgL4JA8
	 BiHMDkJAgXayw==
Message-ID: <sashiko-outbox-186804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/19] usbip: vudc: free the unlink item if the send
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-3-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-3-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:09:07 +0000
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
> v_send_ret() takes an item off udc->tx_queue, hands what it carries to
> v_send_ret_submit() or v_send_ret_unlink(), and frees only the item
> itself. v_send_ret_submit() releases its urbp on all paths behind the
> first check; v_send_ret_unlink() frees the struct v_unlink only after a
> complete send. When the connection breaks while a RET_UNLINK is being
> sent, the v_unlink is leaked.
>=20
> The reply has been built from it before the send: free it right after
> kernel_sendmsg().
>=20
> Fixes: d62ba981a9de ("usbip: vudc: Add vudc_tx")
> Cc: stable <stable@kernel.org>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Hongren Zheng <i@zenithal.me>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D3

