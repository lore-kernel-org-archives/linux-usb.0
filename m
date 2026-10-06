Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC9C49F122
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303810; cv=none; b=nyK/ohozIf5l5m3XCZpwitOOG37JxL55JsOav/zs1pgqhkQJTigZBmD1Gwg0L7GtyLrbfwkuU+iY0M1Dd2iMqFXQv3j71ayX/9iWVdIl+b27Dqq2ydexufmUpNzo3ILr3Sf9nnIS3walHOoL5/XVh0bnHg8idMuZHeVRsFAHEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303810; c=relaxed/simple;
	bh=YSXQ8uQqZNRKHbxSItx8AOfVemP/kV01Oj69651ey6Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gn/AFgt0xKJmPy9ZEwFPPzPvQyRzIKftCAPIBykWHJrOaROi5RN27egHNfePBRppJQpdHDGPAN7x+tmwrJR0/0v/Bu8UlDgKetROLEZV6b+ofmJIguQ53IS6JMtztOero1ziZcmdzpqvais0AOziJPUPqSRJhqgaw0X7yaIbhDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaNqtEYJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaNqtEYJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117711F0089B;
	Tue,  6 Oct 2026 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791303807;
	bh=JInX/GJXQnDACbWwB8+Xd2c4zq0Cyt2PGe43H1eg9sA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IaNqtEYJumVIOOyNQ/uQOUEW0wiqPO3WN1Kxg8RvIw7d4AGPMpBqb6MHm++5EfLPw
	 h4e6JcioDtRxjtVR+9vjv/bFHQnD2mR6W5OV2fTJPhSesQJcFC5HZvM5iZP8QFZJKC
	 mnXItpkc8zfkjLuBRVzD1m6FRuEqXX4/bu5KbTVUSdLgnqztOis3o8aUf0ovA9rcmN
	 L6wbFLIhQo79LNtf0g7tTwRPhEC8HbR9hgOzk1bnq+9bAfeb/EedALZ6hj8mygLbcH
	 047L+8O8a9TOpXybmbk40Bnar9krLE9VeI6AU0aeemcRfk/lE1EtwGyulcXyDX4i2F
	 epq0FnZyxuNng==
Message-ID: <sashiko-outbox-162249@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usbip: stub_rx: remove outdated comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261005125842.197848-1-oneukum@suse.com>
References: <20261005125842.197848-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:23:26 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbip: protocol desync and hung URBs on invalid endpoint
--

commit f15a0a944a703fedd99ceab9d659df84a495556c
Author: Oliver Neukum <oneukum@suse.com>
Subject: usb: usbip: stub_rx: remove outdated comment

This patch removes an outdated comment in the error handling path of
get_pipe(). The comment indicated the code was unreachable, but following t=
he
removal of a BUG() statement, this path can now be reached and logs a repor=
t.

> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d9..0ccc05b76c5ab 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -391,7 +391,6 @@ static int get_pipe(struct stub_device *sdev, struct =
usbip_header *pdu)
>  	}
> =20
>  err_ret:
> -	/* NOT REACHED */
>  	dev_err(&sdev->udev->dev, "CMD_SUBMIT: invalid epnum %d\n", epnum);
>  	return -1;

[Severity: High]
When get_pipe() returns -1, does it cause a protocol desync regression in
stub_recv_cmd_submit()?

If a USBIP client sends a CMD_SUBMIT with an invalid endpoint number or an
out-of-bounds number of isoc packets, get_pipe() returns -1.

Looking at drivers/usb/usbip/stub_rx.c:stub_recv_cmd_submit():

	int pipe =3D get_pipe(sdev, pdu);
	...
	if (pipe =3D=3D -1)
		return;

When get_pipe() returns -1, stub_recv_cmd_submit() returns early without
consuming the TCP payload or issuing a connection teardown (e.g., via
usbip_event_add(ud, SDEV_EVENT_ERROR_TCP)).

For OUT transfers with a payload, the unread bytes remain in the socket
buffer. The next loop iteration reads this leftover payload as a USBIP
header, desynchronizing the protocol stream and abruptly terminating the
connection.

For IN transfers, no payload is left, but the server drops the request
without sending a RET_SUBMIT response.

Does this cause the client's URB to hang indefinitely?

If the client later unlinks this hung URB, it seems the server replies
with a RET_UNLINK status of 0 (success) because it never tracked the
dropped URB.

Could this trick the client into completing the failed URB with a false
success status, breaking the protocol state machine?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005125842.1978=
48-1-oneukum@suse.com?part=3D1
