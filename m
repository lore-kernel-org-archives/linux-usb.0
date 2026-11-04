Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776298;
	b=v/L+VUe1cq5QXlUVgx5agBJv8dV+5qp8HzFtnoG+yRRXJv7zB9S9Tz7b9CvP5yre7Biu
	 L6oWvvrGPZ1fj7pRFj10qsp9J5X8HYm6odHiTiNa/dpxgTCUh6BLzYiklTwCrrZMRNXYF
	 /k5foAxLCqftjQSM2FkIgA3ehzFImHIvRSLZXU4mP88McgV9RxpScZbnUqMtW57S8KVjQ
	 UucsX+OWiKCZ/kqZoiq3cQkrWFFxnzezO9JNFGOAg7915vczfFb3mSWFlQPU+MHw4IceU
	 hs3PPAgKOPzocmcCVKYDNUznB+zNJgtdl2Kc1mOQJPdevGFgWPY2opp9w0n0mRtIpwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776298;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AKe+a/9OVNOnuzkuJEF4sEezvQB1/W5jipopAyg/4Rc=;
	b=ATYiN7r0moPfrjc7Yr4uDN861DbdAgbJk0XAVh/FH1zV4tumlZ1rMVbNyE/HveAmUluA
	 Zoma6HS+X6xG2WkOjcfmgF7I+dGGDvtzuM90J9dfQRXgjoWx6uz764qQZmnjTd61ODbgZ
	 lEMKcgUZxWasiZ63WaSnqO0oZJiNFriYUOO9rFSEFUXnfYeq+mIZIxCcJUkXTLdSScZnn
	 OJ4wenr0Yyx/Z95MqCsuvSi1BcnNLZ/q4F3Uoq2uACO8sF1k2tSU/2ZL3oO9ksOhoqSJ3
	 wCmRDKARxw+EQBWvQyJFenHlEPiBY5a/ABrPVqTyrbnKxx+36etRkE7QdwWSPot18UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lgl27+7H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B490C606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lgl27+7H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91D71F00919;
	Wed,  4 Nov 2026 07:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776297;
	bh=AKe+a/9OVNOnuzkuJEF4sEezvQB1/W5jipopAyg/4Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lgl27+7Hx35YJ7gzZlMAsh5n1HBQ4OGcLaFa6CVkegbe1bYKRqCm6zlSxFMhM/e0u
	 2G4dYkoE7TaIsucXZhhiF+8CPrGfe6c8i+acdkOSLPtaAA+f/mXc7zCogtbt7sH8x0
	 oIi3d0Bgoh8uJsezPdAoa2T9Kz+5sGqYTAfRcnfo55NpLVGZibdsS9Grl1yYlGYdgA
	 CCxo5Z0oxRk6M5qrRvmj/+xCDp8lKHZzpqAxL6m9RAGMYWTCIOV+QsUeUeZzmji/YC
	 WMNtzRqnWGDnOm8AZx4isd36QLrKyX3LHJfxN9rJjE1LJJcv6Y5yGWQkPNhjAUvoTx
	 Q1ZJjzKtOxFNA==
Date: Wed, 4 Nov 2026 08:11:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Neill Kapron <nkapron@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: drop streaming header reference on the
 EBUSY path
Message-ID: <20261104-auspicious-malamute-of-energy-da71bf@quoll>
References: <20261104021506.1468539-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021506.1468539-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:15:06 +0000, Wentao Liang wrote:
> config_group_find_item() returns the "h" item with a reference held.  On
> success the reference is transferred to uvc->header and released by
> uvc_free().  When the streaming header is not linked, uvc_alloc() frees
> the function without releasing that reference.
> 
> Drop it before freeing the function.
> 
> Fixes: f1fd91a0924b ("usb: gadget: webcam: Make g_webcam loadable again")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




