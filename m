Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D833783A1;
	Wed, 20 May 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275896; cv=none; b=Xh1HKtzjxBtQcBQx72J+AfkvTk2xrM2bk/vygaecFSDaWbd+YWBUhHA3wRVPQ9sgERBoj5kIy93nGG2lVkHR+S5NoD/jbpHmj0Wi+/7JkU52Mc80JmEXbVWDrwR+ryAr9Ous0UcO5LxWVNIuRXMjC8algX6HTTvOgennwygkjPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275896; c=relaxed/simple;
	bh=Co1FS16V3QEhSbr63bhbPUjxGIVqpfEoeNW/RbM9X+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hl1MwpEYAJn18URTdLQ3mnkpju4TFkPXQv7Buh1froAIh9Rsj/BbFaK+JYaqK2Oe8u05NP3AAMGAvSVb+VeBFnOy6BsutaDOhyfXYKNiq6wxatEvYKrH0fjUd89bihAxYJSgBptY7FUVkg/i/wpA0m0cPpSkDP4nDmu1rHFnQt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lEqNSwhG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lEqNSwhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A33D1F000E9;
	Wed, 20 May 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779275894;
	bh=jPBtCABmTTv6ha/cYJxmS7t2tz3m8VUFTWQofk+6ER8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lEqNSwhG62rtR8kQpdULEMCZZhT253PmvpFDrCAH/iPl+16vv8GE3yKFQGLL/jhSm
	 UKUZTIx1n6ILuENHB1kq+79GEjf6bS3ZxIcm7USjRdH6C3ZP1wbpzXOjEJTA9bAKt7
	 qWEydEh9dvIHxlGWaXlioBfdH2UVrSg5ZFaRXslo=
Date: Wed, 20 May 2026 13:18:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: digi_acceleport: fix memory corruption with
 small endpoints
Message-ID: <2026052012-jeep-parameter-c328@gregkh>
References: <20260520074653.639831-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520074653.639831-1-johan@kernel.org>

On Wed, May 20, 2026 at 09:46:53AM +0200, Johan Hovold wrote:
> Add the missing bulk-out buffer size sanity checks to avoid
> out-of-bounds memory accesses or slab corruption should a malicious
> device report smaller buffers than expected.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
