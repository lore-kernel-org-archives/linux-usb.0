Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114620;
	b=GElN9iGyJPZfElJrQQs7c7fYpdokMZ0zLPe4Q4B7hP5ExkrK0SByeNROQQyeDtnk4qsW
	 4c3E8QpuRkyUVlVhCKwbG7V96HNl+dRq88/kde3PO4WmYS+zC/dB1kO6D4Frna9sS7DGC
	 yrTB2ZmwOn8fzNPrCU95mbPcirrvifkz3Udq19dXpG5ySMZmFsfNhNnjYXhsrLObqiiGQ
	 HC1nONQi3aqy/5DpUgDZs2cs6dQkuHlZm3TzWUf1I0IqHP/UgQmbAIwfTVjWnLzQocaNG
	 IT9ZzBiqMLZN3Ntt81O12iKEqQbLhyslSUYF4TlVJlNkwmo3kSzyfOJdPCsiVYb+ETA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dcz8fm4b3lrS6nZG6IwLL1r4wt6pLLOSGTzdnZGhDqY=;
	b=dm4hmnoIS0rfQQxmSXtrGcenEI7PV1m0+D65nBElR3qPb/fR9dAafAI5DXqG1R4vIRmk
	 +N2jU2mX6iGQnTCPwXkd+XxGaQyOn8EEJcSaMw7bg3gvugV8ESudk6qBjmMtp0g8eRoPp
	 YPNVC+qjZDXRu6YAmB263ivpCXFGVDXPlEFB0MblyCcaNo/TKE/UFZWJbz9qP3u78Adrn
	 3P/jIBNTG/F/gyQUdKJKWf+6AUEEnWl6WbHK2GaFuYkWRs76fd9gTqVofY9XNRZ2ZbSoD
	 iSQDd2ebyjIHbW5MUeSthBCUa5fMdD52JyHlwdn7Re2/5co6TjiE17gXxsKpuf4br0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g5B3U/s6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B3D606A31E
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5B3U/s6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39891F01825;
	Tue, 27 Oct 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114619;
	bh=dcz8fm4b3lrS6nZG6IwLL1r4wt6pLLOSGTzdnZGhDqY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=g5B3U/s6Kh3Q7tnbgn9+BUoDtumHJdxx1OPBnUI6BnqsbrQx1VGmMxCtw5BnX9n6k
	 xP+kAWdJxqtpWNJiP0wj9PxFPuH8BJ3TbHEQgieA7ZH/+FBHHAkHxXQUdC4CH/OPTw
	 FiL25vJWXsWGqPk7ESghYn59PEl622XT3ZyIAcatuPvNpjUDEKRe+rDHxF+c0ArYlZ
	 BV8mnvDSof569FhNOQpjn6KAYvQyhwEy6LINJdi9hlOKTSQtCbPQT3Rh3h+OZPdurQ
	 7D20cQoY6PibLOn0JzvXGQp8xBAXtcMKBBlQfACPixjLvPRcbwe9gAjM2A36+LaiD+
	 8+6mlr1XfafyQ==
Message-ID: <sashiko-outbox-186829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/19] usb: renesas_usbhs: link URBs with interrupts
 disabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-16-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-16-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:23:38 +0000
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
> usb_hcd_link_urb_to_ep() and usb_hcd_unlink_urb_from_ep() are to be
> called under the lock of the host controller driver, with interrupts
> disabled. They take hcd_urb_list_lock with a plain spin_lock().
>=20
> usbhsh_urb_enqueue() calls the first one without any lock, with
> interrupts enabled if the URB was submitted from process context.
> usbhsh_queue_done() calls the second one, mostly from the interrupt
> handler of the controller.
>=20
> The host mode is used on a uniprocessor board, where the spinlock is
> nothing. There the interrupt for a finished URB can come in the middle of
> the list_add_tail() for the next URB of the same endpoint, and its
> list_del_init() leaves the list of the endpoint corrupted. On an SMP
> kernel the CPU would wait for itself instead.
>=20
> usbhsh_queue_done() is also called from usbhsh_urb_dequeue() with
> interrupts enabled.
>=20
> Take the lock of the driver around both calls.
>=20
> Fixes: 034d7c13a79c ("usb: gadget: renesas_usbhs: add mod_host support")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D16

