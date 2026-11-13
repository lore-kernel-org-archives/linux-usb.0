Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539143;
	b=4AECvUhbO/URJD3Vr2Vse8egn72TlnMiE6QiUcC07KIyzxFompYI+31No6PXrVTgD31w
	 8oizg2p79vjQueLm2rHcAUdtg+MrWbhzBcOgZy+FEnJjuFgCX9wkrjrefPbTC4ep/mTgP
	 TF8Yw84dEO0d9p4PXqP/aksK6Tr3g3GkCiDSGJaWWL+IxpcFRyhEWXKswCCEV6gXe2i+j
	 kMTM0xr82c+m3AOYVNCrJUgdNgeGsphM7a/nZov7QxXduvNTZ0AuXzgaRVqIMTFkV6ngP
	 Up4m9BYo8pwjNmNJN5w38zqPEuJesqNqvj1moes0iQZ758WikH9dt2IZqS7Z7sEpFLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539143;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SQc9Vyh9FXkzg2/vzn+bMsXGabwvE7FfFSv4BoaLJZI=;
	b=BpArg8ac7FC1gyIfvBXBPf8qTkhV0GKHRePnIJfED/9pmkvKAZRepsnfv/GE9nLya9MO
	 hemilbRxaXo+T/ZbA5TefCAdYjOuxNSooG8nRC8io0jObg+viA/4CDmruWcrUQjsFhc/U
	 RCPahC+Z+A/hpeHCun+U+LAZnQpIfDIwptkt2t2sULyGRebjwEX0z0YZDDlO2bDFFwtPt
	 D0SZnICaFa24GbTYrOZ70GD7N9qhLR6RtOc1c6owE7etSS+dYinHxvf1TlYZNwqm7yaKi
	 h1FrcjZ/YuIVQfeRfMDT+RCVUhyAxzlV0FziSpXXTJVcfMpjZ84H5o1q6gOzAywy85w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvPx0EIy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD3606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvPx0EIy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1919F1F000C4;
	Fri, 13 Nov 2026 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794539143;
	bh=SQc9Vyh9FXkzg2/vzn+bMsXGabwvE7FfFSv4BoaLJZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvPx0EIyxye6PB9W5iUF6Qm4uAeW9Ojci9SSvQfchP5laS8oNUBIL/P5rSWQClUiZ
	 h7hqTCVlSjpLkx5spcuBT04w0PCtUgrQn7TcZW0y0w8pfDbmGG21mZiR7n1TMmUuVW
	 Iz3cGMZcfG9HiAXSy5MCteSe2l/W2ZOcZgPjgvJB1g4ND5h9CpXNr985IJu0Y3imbA
	 9twcAWT6eqeQvS9RMYfjjMUQfx0qP+QvOg3Sa91hCIvboX5G8PSq+QV2agcHxsOHDu
	 XBSz22HB5+WDYYEfxlVA1wVdiMiA7hXZDdaaNCgpInXyZ7eglGHnDssyEiTZu3LdGQ
	 6UQFYOXZQqkGQ==
Message-ID: <sashiko-outbox-212120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] usb: uas: complete command on status URB error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarthak Kukreti" <sarthakkukreti@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113024922.27977-2-sarthakkukreti@google.com>
References: <20261113024922.27977-1-sarthakkukreti@google.com>
 <20261113024922.27977-2-sarthakkukreti@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 03:05:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When a UAS device is unplugged while hub_wq is frozen during system
> suspend, usb_disconnect() is deferred and sd_sync_cache() issues
> SYNCHRONIZE_CACHE to the disconnected target. If the status URB fails in
> uas_stat_cmplt(), uas_stat_cmplt() logs the error and frees the URB
> without completing the command, leaving SYNCHRONIZE_CACHE pending until
> the 60s SCSI timeout and triggering the 25s DPM watchdog.
>=20
> Track each command's active sense_urb in uas_cmd_info. When a status URB
> fails in uas_stat_cmplt() while not resetting, complete the command that
> owns the failed status URB (with DID_NO_CONNECT on -ENODEV/-ESHUTDOWN
> and DID_ERROR otherwise), free unsubmitted URBs, and unlink any inflight
> data URBs outside devinfo->lock. Set DID_NO_CONNECT on -ENODEV/-ESHUTDOWN
> and preserve non-DID_OK host bytes in uas_data_cmplt().
>=20
> Fixes: 115bb1ffa54c ("USB: Add UAS driver")
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113024922.2797=
7-1-sarthakkukreti@google.com?part=3D1

