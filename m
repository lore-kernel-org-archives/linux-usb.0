Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399352;
	b=l5oErh9HZlemJvxiNAcse4jxYBb7wl4Zmym8WwvEi7lzKbuQ7rjMGIfo0loTj6JDvEf9
	 IWjbdKWuQ1qOiv6nrwNjDbHYwCU1tszDehmWcx0YJcbtGIQAuamWHqDdSkk+OUyTh0EiL
	 u9K8NBPv4KtcScnZEGTK9nwYHjO1/Rn33t3gO7oZkDjgtOwgt5fULizHHmLe5HAo/y69e
	 g2rosr2RBh3z3UOi2fNdzXueD6rDxHgFx1Osqr2iSHYnA0QCMAyAy/OduUQHjN3uvCuXL
	 9L2gL4i2fpJiqfSsqV2uOKYvYoRGT2zk2Rtvd0Ejm8OhnNV0XCUUwncEi0gd7N9omtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399352;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FQnmOdvQe6qWf45O6ksiKQ2iw9fIbLt5Oo5fXt/I/0I=;
	b=kUAG27WsBORQ7O5vDGLE/9tHx65oSMw5fKgmy3mKxnVM1QByThuDS1wrCUev2YCsO2kE
	 Bb0ZmguGkT7Gw0CNPDOADHuOTcL3bAhys3/u5uBhrZi2PCOiuZxpzcUW3Cix80K/MnmL6
	 3r2qEYdk4UJeojuBomECPIPDHGlsmWZ4tTRSWYjUiUJnpyLA2HSe/e8wv8ve/8DN1cmQT
	 vNkeBCapU48FqnlWWQbLfvE1NELX0c6ekHXgnMrV+YmeM5hBKjDm8lZ/bOM3UHJ3r4xaH
	 EWJo43NFRsFemTB1rFQ0ml6jAX0mvRndN4j1qmdiRyiV7grx7/djs3GqAYIwRI8SWfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P4U8U/2n";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA7C606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4U8U/2n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1570A1F000CA;
	Mon, 23 Nov 2026 02:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795399352;
	bh=FQnmOdvQe6qWf45O6ksiKQ2iw9fIbLt5Oo5fXt/I/0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4U8U/2n67X8Wt0t+FkgmrPpVrikfsGlQUGoAUX/moS7dwRCBAYq3mP9mv2YsdH8l
	 w55yaqqJtls5GMsQDlF/u4JygcjKR+Y6LD6j+BWgRAOYWjPeyDPZnwDyLQguZ4TCnN
	 TTwZzqtzgxnNIAigKlhyLou//BXZADPphg1uBCN4LHrlMQSuJ6n7xwA4cIk/RB9yqd
	 RymklFDRHqs3nNDIN4xGVpBszoWa5NV/5fm6aKTA/c3HnHhgj8uOdJ37SJJERWwNKE
	 ttzKBtVdDzqwlbMoW1bJk5+UW+/mKnYNm+LRdEQH1TbZLGd6ZCU3aG+ZFaNQFYuueL
	 +k8yHDh1uugSA==
Message-ID: <sashiko-outbox-228540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] usb: gadget: u_serial: Fix the console request's
 lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabricio Akio" <fabricioakio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122-u-serial-console-dequeue-v2-0-820f355827e6@gmail.com>
References: <20261122-u-serial-console-dequeue-v2-0-820f355827e6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 02:02:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 2-patch series:

- Patch 1: no issues found.
- Patch 2 ("usb: gadget: u_serial: Free the console request only..."): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-u-serial-c=
onsole-dequeue-v2-0-820f355827e6@gmail.com
