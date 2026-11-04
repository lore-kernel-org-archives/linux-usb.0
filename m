Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776328;
	b=Zk8XxFbyOdmLLvaIHVj3hdoaGopRaGis6Gti92mhpjFQYfx1k4ioOw3qym6aGp1FOY7h
	 V99+StLwU894TioTbcxraMVttV2oji1nSYOjsc0KePCQBqqgU+Vy3sIEOoHsYfSU2LAOo
	 slwnJd6jERLV/UhXc4bOmXnrVHQ8yrHKzYXhjzcIfuea72WrRnljyUC8XdErzhZISn9YZ
	 A00no7sFklFMAMqhZWkiN7OeDDbNaSSInmvCctuXOsUCe8bRmP/rbGFP2+eZmIhEgGnhg
	 RkfJwPs9lYSHEjZa0FYLjyZN2aUfPZTvFs4xZ1oQaEVAOUBcRu23BKYkjkI5NzZP/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776328;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OPeLWf1zy+8fvKIN1Xo9VLJZP0nZb9i0RRVNdGQPDiM=;
	b=RzNYOCG1qrdrhybEVxxlu9v3ARU8Hhx/ApTsKbiTQGI0nVskd9sFSMqNHxAg5r/b8bFO
	 r4+ZoXg8M27k67ci4aibKrDr//jTCL5mVjVnfycdOn1fwQEuz8UYwoOkWpVQEdkJkJ/5l
	 GtSVKsUzpebXT/LfOlbfSZg1JZkgfYbSn+7Ho0M+4bdrV1vVt2CFWJfcQWOA3+8BZfK57
	 sEn/fA4zgE629gF9ALMFq1VuNNcbyAuc+cXK/xPSm61nfhMtN/QADdk3qx/p3u1k8jWt2
	 eiczjtM9U+J53UErRmSInybaG3RJVAgrCXPjyIFWHq/iUhWLQI6HFm7yqpgK2aYN8Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kC0p14pd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8DD606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kC0p14pd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247951F000C1;
	Wed,  4 Nov 2026 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776328;
	bh=OPeLWf1zy+8fvKIN1Xo9VLJZP0nZb9i0RRVNdGQPDiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kC0p14pdQul0n+nK7BlSPIXdnDPyC6QZvJiY0yG+IpDBcuM/eYmnYeONQLhb0kxUv
	 O03CbnxtfGzoKXXbZ+0MWQDQM3Ju0vZKiWDvtj1JtVbZW5Mv+zcpOKK7NKG+DwnTzJ
	 14hbUeI37R+ThCRIUruh3Icae0YRlqt9MXyIOcbyFFL987OgKfeG/hr6qdESX7D3hP
	 kxMWeiAi4OIu5XhGnb9zLcN+q4HtZaWVi7PzI0UI2pNN2MV+FN3hLBcM/bc9eDgCGF
	 UGg7yAxMii02xG31zt9TW74Q0PtYtzNV63qI0nNpySQDTyCAx+txs28f2ox8V2jgcN
	 J1VDoMPBTPU4g==
Date: Wed, 4 Nov 2026 08:12:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: rt1719: unregister the port on probe failure
Message-ID: <20261104-careful-cerise-skylark-42bbc7@quoll>
References: <20261104021514.1468596-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021514.1468596-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:15:14 +0000, Wentao Liang wrote:
> typec_register_port() returns a port that has to be released with
> typec_unregister_port().  probe() stores it in data->port and
> rt1719_remove() unregisters it, but when setting up the attach state or
> the interrupt enable fails after registration, the error path only drops
> the role switch and the fwnode, leaking the registered Type-C port.
> 
> Add a label that unregisters the port before the existing cleanup and
> use it on both post-registration error paths.
> 
> Fixes: 25d29b980912 ("usb: typec: rt1719: Add support for Richtek RT1719")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/typec/rt1719.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
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




