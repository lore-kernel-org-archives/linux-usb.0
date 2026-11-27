Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769774;
	b=LJXMAVHO4B2w9yNhyzg5tVMKEdB6OSVJUB/InqKHI2AR93P5xDVN66g6t1pwlRVMO6pP
	 qWk2wnmslbPHZ1CEi6bhGEj5GArw5zJ7LJZ19iB+ec/Zyl5StMn4jmbWE8r3B0YTFnHWL
	 7TgEyr+HZeXhOHB1SmvTXxqxabtzHFeN2ej9rG90x2RvPFs0m7pO6u3GI5W837SO0LXXZ
	 lmz3qv8aBDX4o6xQYbw67boZBZum0YPpUr+p2Ft3vo2/YYlVCkjbB7MMXzOfeLPBnca9B
	 tRMaX25SAdMUbW1AvWgzC20EOR9jGd7Ycbr7dNxV28809e24Xf7ljuM5dUvY/2AZY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rfGRHxUjxd7hgq9NMvHIZSmFrCZpXLD52XKwJ3zbnuI=;
	b=hMCbn5B8ypnlmPYXsvBcFfTcxWIrLCopZy/J74AQ0xvL6cKUVAWG+EtU1rr9iYRQhTaW
	 w81+nQvpW+QccvXznCvLX23zXTTwzbly7Mo8ojt3JJivp69GbVW+kQQqoCHCWK1mIjE90
	 Mrx6aKyojG1jGxqHLzldxMqWvUINE9cmnAJjCoIoHQ7ow96pmvvbI+WBy5vxKS7fMkL6J
	 mByUCNT3kpUASm4IVy5q8WDoRuXl6kySXVn6EqR60sngtqkSHIz2CfxyxTRhyi2kRWuvD
	 uAe3UIJzMxoqYlweGus9ohmL3TAW2f6B2G2k7sdq7dNCEKx9A/2e7Z0E/ie0NJ4BIWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9jAzI73;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF65D606A32C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9jAzI73
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135AB1F00893;
	Fri, 27 Nov 2026 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769774;
	bh=rfGRHxUjxd7hgq9NMvHIZSmFrCZpXLD52XKwJ3zbnuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J9jAzI73XYRrQyMjUZsdZhBpEYA/icibKd4ZzzluxQL/8V3oxefW+Fuv+0uL+zHAR
	 Kbq38bUWS6JECfemsOpvfgwRzazUVyMkxmMYfpob2CMp9Tvu1fBJhy3vfM3kXbkXsd
	 oZb/7wtn6kzgRNNS9lvmWSAmaQw6kkEkDhN8NJXcVV0dqqRDiXqsCAcXEOLeC1WCGm
	 6iC43wcrkTPIEixbqVQuHqHdmpmv4hjWYKrnjQCz6rfYSpWwTXCOy2weVW7lpiXvgg
	 qa3tnyK6vVB1/YBmtLhB0InEZP3u1TzKigixdeZ+VWnxsGc9sGGohQVwvo+Tg6iSqz
	 lOoGqT/t6ljfw==
Message-ID: <sashiko-outbox-236925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] HID: usbhid: drop pending output reports in
 usbhid_stop()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?WWFubmljayBNw7xsbGVy?= <mail@ynnk.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127084612.222563-1-mail@ynnk.dev>
References: <20261127084612.222563-1-mail@ynnk.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:56:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Each entry of the queue (usbhid->out[]) points to the
> struct hid_report it was built from. The queue lives in struct
> usbhid_device, which exists as long as usbhid is bound to the USB
> interface. The reports only live as long as one HID driver binding:
> hid_device_remove() frees them with hid_close_report() right after the
> driver has stopped the device.
>=20
> usbhid_stop() empties the control queue but not the output queue, and
> usbhid_start() does not reset it. Output reports that are still queued
> when the HID driver is unbound, for example because the device has not
> completed its interrupt-OUT transfers, therefore survive a rebind. The
> first output report after the next usbhid_start() restarts the queue at
> the old tail. hid_submit_out() then reads the stale report which
> at this point has already been freed resulting in a use-after-free.
>=20
> Drain the output queue in usbhid_stop() along with the control queue.
> Make hid_irq_out() leave outtail alone when the queue is already empty,
> so that the completion of the URB killed right afterwards cannot move
> outtail past outhead.
>=20
> Fixes: a7197c2e4120 ("HID: Handle driver-specific device descriptor in co=
re")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yannick M=C3=BCller <mail@ynnk.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127084612.2225=
63-1-mail@ynnk.dev?part=3D1
