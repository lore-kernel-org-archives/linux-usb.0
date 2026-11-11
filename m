Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397325;
	b=zOp1TI+6B0zx1W7XTmszi8GoRntyD0s82ssQ3ZkKW2E59ubu9qBa3SzafWt2cR0bC2Vz
	 BRG4/Q3fjI09JxL3vFMJdKWKiCTg3IXqfj2QwgE3LJIKcMK3la0lxksb0FuHaAfgqLVyP
	 TapappS0ZdCPLYHWyIHG/pcsq72XUXSpyUBgynR61b5qk0y4BkaT1pvjTD10PwbOxYBQs
	 mYZ/9cQ4Vkyf8rQoblZ2hqYWc/aQPiYs5Zak2UmZfH2n8dZMTuotnbJfHNdcVddAAGn+n
	 HsdXvg3AmNTqTrtP7tITE2VsVeevSAc8W8KAy6lrkR9ngmmtX9mubzIVYn6Rc4GVy7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RCUz6VgeDQ1VaS2ABqu5i5iCnRzg81Wk1raGh4IsPbI=;
	b=IjK9pPlyCOEaXcFjxG0sOArdoZs41H2ZJjOUzbS+SZbwwEd0+c64Lnut8HiqNqri77Zt
	 6pLeYAuI8Y/NyGajWmFt0lSSDQpxT5gNLuLgnn7NCU6fBjIpt4kFX6w/mxo2izg21403W
	 SLmsrSEUnJ+zK6Mnr1fJNI1mcpdlZylv/iMLuxA2f3SUbki+LXWjWNM4ogEDoFuOP+xVd
	 mvF2XHlIcduXzarI3C41gpAqbmby32wB7Wqn3Nrl2+9+P6DsC6FhLmxuP8XNL4ZS7nTZZ
	 xDUVP0Pj93qQyTgJIMYC4lcKgQ+lnrXqLYMPMYaINKmUO5mTcxJxEJAkMXb47o+LHnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2DDKKSh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72C4606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2DDKKSh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417E91F00A05;
	Wed, 11 Nov 2026 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794397324;
	bh=RCUz6VgeDQ1VaS2ABqu5i5iCnRzg81Wk1raGh4IsPbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F2DDKKSh6tsxrUWzH48a2MSVRDbbNOhEHyrqxqWuQ3fEyMeH4YGxHERnJ3dx0qjf3
	 j79L6KRf+PQ/JFCBPOA6MxwjFIWFd+9Zmxq+e0FDKLyUWDQS+NoTsrMhDy+IN4pCaJ
	 NyrKrDcVzl0EqQMZnZYmLLXdpyiD2GfHkx1TOoM9mTblvMEGxmHcFeSmDSYpX3L0uB
	 Es/T+e2LJKaxtioxDQJ8tWnPGiaYuYrAt0uKKHBTzXcjgIhpflOb54eGm7vCGyjB4m
	 IdnYjI9mAg5zqJ6h1q4ITC0JHxt1AQ3Ub69HgQqN0n5aO7QYTW5rlqXPe4cdu4Ig+H
	 31bLSHIwccW2g==
Message-ID: <sashiko-outbox-208894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usbip: identify the event handler with
 current_work()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Grzeschik" <grzeschik@puzzle.ch>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-usbip-v1-2-da5217ac71d7@puzzle.ch>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <20261111-usbip-v1-2-da5217ac71d7@puzzle.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:42:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usbip: missing Fixes: trailer for commit bb7871ad99ea
--

commit 823e2d0c8c9cae9400078a44aab5ee7919c0b1e1
Author: Michael Grzeschik <grzeschik@puzzle.ch>

> usbip: identify the event handler with current_work()
>
> usbip_in_eh() compares the task with worker_context, the first worker
> that ever ran the event handler. Workers of the unbound usbip_event
> workqueue are reaped when idle and new ones run the handler later, so the
> check fails inside the event handler, and the remembered task_struct may
> be reused by any other task, which then wrongly counts as the event
> handler. stub_disconnect() relies on it to skip the shutdown of a device
> reset from the event handler.
>
> Ask the workqueue which work item the current task executes instead.
>
> Signed-off-by: Michael Grzeschik <grzeschik@puzzle.ch>

[Severity: Low]
This fixes the worker_context check introduced when the event handler was
converted to a workqueue.  Should this include:

  Fixes: bb7871ad99ea ("usbip: event handler as one thread")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-usbip-v1-0=
-da5217ac71d7@puzzle.ch?part=3D2
