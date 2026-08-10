Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363AB2F39C7;
	Mon, 10 Aug 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351451; cv=none; b=TVEbj/pSXr8F5VDJUPz8ahhi3Hy8k20QWVjIxHl2B5/oChNyM+D96RZ81+TuKEdimo2R6NmaUMFH0TVYCcSVSrs9UoBrzp+UqB48cQxeglEsCeuLlNNekOHeynWzZJOu2f0D9vCI9dkD0rc8OLsI0wBpohn4dqg6znKZaocFjGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351451; c=relaxed/simple;
	bh=XQq2sJIhHMpm9TMj4+vnY6kIYQbOzIKRBJkXAj8HMTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctnXOvPXwoc9Z1tvp2YNEdR+VI1J7ImrYGP+1j6bcVs8mgZXSYSfSqJZ66wuJqOTGzKDdfzWC0dndY2saRpkUVpDQacTYDXusFq6UGgMHrZGGIl2xVB5tEp3UVxrOg5TwJX7ojwybWuWNG4HQ9FhurURRpB7XlRBs3rNrGk4Prw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jECS52QX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jECS52QX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B791F000E9;
	Mon, 10 Aug 2026 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786351450;
	bh=75JdNjlMLOdJBJ2QDQIwdQ74liRHyg7ts2op60GyMg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jECS52QXEq/dLCi9vbhm6BMAfkNbjHdjKzIgMa1diWT/LvRo1MtunChX5WL2gNEVT
	 zlzKQR75TeL2OnhjyZJUES55+j6oIdnS2roFwlFZ8I8ue4W35T8qyYErSLitT70lLX
	 RieYt8YgPcGg6VZ4NEhgbUj1NdEwewFFFLMCFfFlfIiKLtKLdIw2CIaa9QNuVDyMaE
	 abLPHmICBpxrYwNqfsyp0mnLmRQWZoq8S5q7QA6soMnrmnjUBQxZy/jnm1hLt55T5K
	 TRdKHsKc7Og6i/4KUV/Olr33EOI36OVvksgza+q8u4govAQzNZgvzmWT/Ex004FGEN
	 FDwMcfk8a7m+w==
Date: Mon, 10 Aug 2026 11:44:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: Replace get_zeroed_page() with
 kzalloc()
Message-ID: <anmPU9ZJ0TFB444v@kernel.org>
References: <20260808223829.3117-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808223829.3117-1-mahad.ibrahim.dev@gmail.com>

On Sat, Aug 08, 2026 at 10:38:29PM +0000, Mahad Ibrahim wrote:
> validate_and_copy_from_user() allocates a page to store data from
> userspace via get_zeroed_page(), and then returns it as a buffer.
> Neither the function itself nor its callers require struct page access.
> 
> This buffer can easily be allocated with kzalloc() as there is nothing
> special about it that requires going through the page allocator.
> kzalloc(), which internally reduces to kmalloc() with __GFP_ZERO,
> provides a better API and kfree() does not need to know the size of the
> freed object. Additionally it removes the casts of (void *) and
> (unsigned long) which only obfuscate the code.
> 
> Replace get_zeroed_page() with kzalloc() and free_page() with kfree().
> 
> Compile-tested only; no USB4 hardware available.
> 
> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com/
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  drivers/thunderbolt/debugfs.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

-- 
Sincerely yours,
Mike.
