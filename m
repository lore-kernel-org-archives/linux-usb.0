Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776325;
	b=hIYdXOmv5NTM5QAUzNrghn5jVHJktDjgmGvS2WXEUgtVWUmSTG5tvBJ9oXJAkdAQPyUd
	 cHpokqbGLYgSYmsknbrVzlvZIDSzbQvdXBfZafxltTGeXd+AiTmGXfdiWLrjZFJ3dP+AX
	 pLPNgznpCt3sz2U/SmHLhl7ErxosFynxpHqlL5UiMbeXrQJVRQ5wKyH7RkxRpLKJvJxk0
	 QzXS7H1Z8NLdy3CA5SYr2OZor2ga/fCX1DSorPW0rPyqz36lkTyLl9Sq2wkoocdpI5BWf
	 AmDf9yxLj7ffv1AaUphdCRNiMKAH72hjyNl9y/FkjWa/UN8Sa8w/8VhvWJZLViIIU2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776325;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Kl0dgMl6rJ50Y7nnb5Fx/8mwRx6xO72WByYWFlNn5E4=;
	b=hfJ4vNAsesKs2N70Pqw3/uvh7LucHCn1W20SbRaYtw1CS4ULPXvStQyobnq9MbDyaecx
	 l+0Er0Zpy0GyBhZMufqyWh5dGjhoicjiGlw93n0SsV5N2s9gHZsjJ/1uZ0JrsW+UtdIJo
	 S5+f0x2bIC1KHYyyjMoeq62Cu/ovAV0NtCLwu/bqh1W1h8x0f32smQ2oi7s/3YEQc3xVH
	 DqPsz/iiWE4hZOIQDulDfPIYDk3CBnx18LChh3MPAvxps3y5o/FvtRKgTWEHYf9jJmZQz
	 uIQaBg4u4PnaUI3mH6Rd7Y26M34wbHfi3T1C9972C0twwjPrzV8GIUbkkehCZuAJK8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfPFvhXs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B1606A329
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfPFvhXs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EF01F000C1;
	Wed,  4 Nov 2026 07:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776324;
	bh=Kl0dgMl6rJ50Y7nnb5Fx/8mwRx6xO72WByYWFlNn5E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gfPFvhXsvESPXxHfjLC/Iks106+qE/u13p1d3mBUWUuwZOSMQFiyfV9Nx4+adbGp+
	 K58bnkm6JG0uIcoN+CWIXADl3nzgVYAUkGQ8Vjt0WxRy8tCIAebhcCPnYO7e7flZ4E
	 juE9MuyYxQPO7E9d2yT3mflNTXaSTCQRyGzQp2lsNCIPtAGsKxIzZOmryzhY2xPMf0
	 MADRbG23LiAke4k21/DQ+mb+vBaiKrJQ2L3FXNGS6BNjozBO3v56299lqUDoUbMYJU
	 GY1fHkeyOjUmDUDxf53O4Utfz4pOER/zb5Y0j7viaSqXtdkRmBRqe2KiUiorN+yvAw
	 l0S6M1MgvsPwA==
Date: Wed, 4 Nov 2026 08:12:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: typec: hd3ss3220: put the role switch on the VBUS
 and ID error paths
Message-ID: <20261104-agate-cockatrice-of-superiority-14e510@quoll>
References: <20261104021542.1468818-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021542.1468818-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:15:42 +0000, Wentao Liang wrote:
> hd3ss3220_probe() takes a reference to the USB role switch and then gets
> the VBUS regulator, the ID GPIO and the ID interrupt.  The error paths
> of those acquisitions jump to err_put_fwnode, which only drops the
> connector fwnode reference and never calls usb_role_switch_put(), so the
> role switch reference is leaked whenever one of them fails.
> 
> Jump to err_put_role instead; it drops the role switch and falls through
> to the fwnode cleanup.
> 
> Fixes: f8d2bf7c0c5d ("usb: typec: hd3ss3220: Enable VBUS based on ID pin state")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/typec/hd3ss3220.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
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




