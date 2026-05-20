Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA23612EE;
	Wed, 20 May 2026 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275822; cv=none; b=RdDfGPGq0oF4bC+z/V5fuRpypKy4tN2+xtNpdx4rA1vuKSrZmVlqGOj2IPOgb4X96P8kwGBJbXXjD79i6jG8Ivm5Yxz90hq7ZhlWEifgmtsiyPTFMGVmxBvrTKmqwqpo9F5jzw+5+iuYgjA5FkUdgHQhvr0NaotV8TFCcliXObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275822; c=relaxed/simple;
	bh=umLslUS25uH38eD9A9hDq0CtpLKtvf/BJtdO2syjkVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXRbP2NirfkeyVbpaB9imB2cgsiJ7dsv83C3C+mvWnKaad9kVIflToNMkN8MnSPNj4XskmEkgVjuli46eXtTknKmbeVBtskjCcfuZLBQsRYKb5aZc8jpTErjakzoe4GNxkbD/bv+Zs6JoIAIEJuoRqf1wdRoRsi3aeHs9ky9tA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XQSkoLkk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XQSkoLkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FEF1F000E9;
	Wed, 20 May 2026 11:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779275821;
	bh=w3Yuv9SOPuPCNio1Qus4AJ6YdseSGwUyNRMoqcfPsRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQSkoLkk0QgDHXxMbNvhuYnqU2l0IIzncn9D+Ltsk6vq8ss0J6QUd+k3/jy3J/L8n
	 vyh50m7cm21BhTozujrrYRo4sYsTUdadQ22rjJ8UHBJW1L8m453pzddHTDI66QCqYk
	 gDfnHbgP7lECOzwjpi8IcBCaNuNZAaNT9Hpttla0=
Date: Wed, 20 May 2026 13:17:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: keyspan: fix missing indat transfer sanity
 check
Message-ID: <2026052000-unfounded-overbuilt-b11e@gregkh>
References: <20260520101230.657426-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520101230.657426-1-johan@kernel.org>

On Wed, May 20, 2026 at 12:12:30PM +0200, Johan Hovold wrote:
> Add the missing sanity check on the size of usa49wg indat transfers to
> avoid parsing stale or uninitialised slab data.
> 
> Fixes: 0ca1268e109a ("USB Serial Keyspan: add support for USA-49WG & USA-28XG")
> Cc: stable@vger.kernel.org	# 2.6.23
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
