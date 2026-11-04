Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776371;
	b=bzcwIgG8WT3qdWuk8uzXFgVr3ZJI9KzxvlEjvK89qqLne9/RNC1euoFWoXV6aFVITrBO
	 Iv4ZgO6KePZTouZlecDrKirESxv31oA8L1KblrG/sluC7qCk8udmBxHqeAXEoysd5KN1C
	 SIcJ87vUDL2dOROdO3sFj06I6tPvWrM+k3mhMTQTIAa2aqAlAd1LYqGzTeDIRv421KSvI
	 FmPA+dokDoOlU3V1u7ztvTOU4V6cuPFR9fxbsLDTR0o95nWh/u+MAcrfiEs/vX4BtYpyg
	 u2HjwTzz0rI+3uOtdW+0exlS+Olx9dNcm38ud7KdMymD8+36Pl/Kxw8yoiLYSbzfaEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776371;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mYydwSXtrmsUns642tMGgM/Q7ahtdDqxDX3YMBXWC8I=;
	b=EmxhNJyh72VbRvh+9DkAHoc+3p8gscVkLF3X4BFwz/rhgZxoKpX7NkreJVOUv+92M2H9
	 wvcHQ1M0bxvuT2NJfzmHoHse+HlETSewgtxgjMmPKuSFYuDvJFB4dQB6DEm3/iakPOAVr
	 /iQQcPnRyJqwJ6TiWczpPJqXq/zsNsgAIH2XUksqPQjC05dZ/rd0znDzQlijvtC65yjN/
	 2m3cjKrAZpKxqAOd0yBpD5q0mbAvYMnZwym4IDs9FA+gXxVHI98KXVqXV8UqP/ljnXwEO
	 yT40up+qPlVgsSGj2bBfrzEF/6a4UYYI+z6xFvNLAQzcAKgEUwZoEjm2s5d/4F57dFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QITpD1sG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171BA606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QITpD1sG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9F51F000C1;
	Wed,  4 Nov 2026 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776370;
	bh=mYydwSXtrmsUns642tMGgM/Q7ahtdDqxDX3YMBXWC8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QITpD1sGGwpTIBu3uajxhvE7kVzGIa9R8ZsMyhIO4WWmZbEOh7OvCm2TYDK+mZkqs
	 awugTOYwp8Y0ChVXPPqyIAT+QNaOX3Wl863qDIEy1xw8hU8iOXRBRnOxE1NX66+y+l
	 OxOSJK0hQmyJ67R00gz3hy0j9O7R+O/ZrtZzcCUVuJ9kC36FaF4E0tOtu/dRW4uLdi
	 Rk8Kw5O/yO6vc7HCxuure5w7xa78jgzashOeoOyudQOVqk1MG4dS3oiAvYaP3kQLBc
	 1WoUMeGqiefE9Ufm+xQmZc6PXH4gPDfm/s2aC0RWgNO2wxVXRPXGvdmeUd1MRA6p+Y
	 +MTRTG/XQ2beQ==
Date: Wed, 4 Nov 2026 08:12:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: usbtest: free the urb when unlink1() fails early
Message-ID: <20261104-didactic-mahogany-vicugna-ca7e92@quoll>
References: <20261104021532.1468741-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021532.1468741-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:15:32 +0000, Wentao Liang wrote:
> unlink1() allocates the urb and its transfer buffer with
> simple_alloc_urb() and only frees them with simple_free_urb() after the
> completion has been waited for.  Two error returns skip that cleanup and
> leak both the urb and its coherent buffer, which also pins the device.
> 
> usb_submit_urb() never frees the urb it was given, so the failure return
> has to free it.  The unexpected usb_unlink_urb() error return still
> leaves the urb submitted, so kill it first to be sure the completion
> callback has run before the urb and its buffer go away.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/misc/usbtest.c | 3 +++
>  1 file changed, 3 insertions(+)
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




