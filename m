Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555595;
	b=xkoVCI1GBICLGQtB49GAq5lnjfPgd7I2ys85bOFM/3OH+k3K+CaG3i2N+0GMdkyu2eN7
	 gfrkJcr5cI2hnJRYYertKRnMaR0P4HxeQ7Kqb+QsaAf1gZb5tBSh3VfiNydXfSAjYMHSy
	 3D3kyWl4E0v5MTkjj5bTJzaW5IWdbvWZSyOcYATjhKg2KREllqLZrSN3sAY3U71NQoh8l
	 UpwTm1+HrK4QMjY3V9+CKRzEiwYXG1rlseAHFmwiJNk3LA6xqy1xOtHWzXyTWAJCpwmsu
	 A2I9bnWhVRVPtZrHxBEQcIIXn1IAxmvOoYr3ztC6ssVVvaphe+1fbGpnan1BJvOvgrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555595;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZHhs87GxyqUKVyQA33HriE3n3pD63I+PwYvXUALOdnE=;
	b=X8xODZZtJj3UivdutkHxidWEOT+KX3pIP/3QZE3QqOtycn2aNPjz7dR4lqVb0mXejvgI
	 m1xMktblnlHRGuB8sE0/Fyb8b0E3m547qVh7rIFbuSfaC9J95rMgwwZqtUcKMAlitAFOD
	 YyPZv8B1O7X8Cuj3BQXrnOtx4tL8yzral4igdOGYjjimzOFdJbWz91PtrF4rBTttkdeq3
	 ljBwtUjXWsM2yNKmlsTdHarWeOWGyH9+Nl70Q2hiFhmbqr5didu7yi15b0SyCkgfRq2VG
	 zbHABFoRYgds39s29lp389vR7+nY4B4JXyCeB0l5SQSRkbO2mMf20vcHtucdsWmAeuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0mE33Dm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A8606A323
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0mE33Dm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9B51F000C4;
	Fri, 13 Nov 2026 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794555595;
	bh=ZHhs87GxyqUKVyQA33HriE3n3pD63I+PwYvXUALOdnE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=l0mE33DmgoZUtLyJFjL5AXmY+PRXTckADb6NDQMNjsVkL5AOx1XXbyPCCPzBcyc1f
	 vduGnFgQDpgMr3ctFjyipKGQsrxBgddoNf0Cf4IG3nr0oMZdGr/6THaGEukQ8Q4ZE5
	 uh2uff9Rd6bcYqtPio2hNnGQ/oaQYuj34cQqt/2sH+skFEDDCQBUowAhGjDOEynCMl
	 9oMwZ9IHF9OLYXAaYml3ksSXBPjpJW5gQncgiBC1J9aNvab4D/aG5gp2bxS6+FqN8G
	 DTm3tKckNA9ATzETADCFcfQGZyxfiZAn8WwepyLptz5GOoGK48Ne1sKEb86wgJ8qeI
	 CmpPhraIr/OQw==
Message-ID: <sashiko-outbox-212362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] usb-storage: add
 usb_stor_bulk_transfer_buf_timeout()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>, linux-usb@vger.kernel.org
In-Reply-To: <20261113073638.1225998-2-xiehongyu1@kylinos.cn>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
 <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
 <20261113073638.1225998-2-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:39:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_stor_bulk_transfer_buf() waits for URB completion without a timeout.
> That is correct for transfers belonging to a SCSI command, whose timeout
> and abort handling terminate the wait, but not for transfers issued
> outside a SCSI command.
>=20
> Add a variant which takes a timeout, in jiffies; zero means no limit.
> usb_stor_bulk_transfer_buf() becomes a wrapper with a zero timeout, so
> existing callers are unchanged.
>=20
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113073638.1225=
998-1-xiehongyu1@kylinos.cn?part=3D1

