Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346F3CEB83;
	Tue, 23 Jun 2026 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203403; cv=none; b=A4QagB+ODa4wfACKHJJOHPP10Jan0cEpKofjvDMtREIfS6O4EXHrKqi52ZLv4IPE5a+6JcYHK9DTOKHqmdYEvOccXagXeF2ZV98S6Ljtd5pJ9Ks9rx0W8EElq70S3y1RqJp7bKUEioRIi3GAflzBju1XnzCxHBhRY3NPBOwskeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203403; c=relaxed/simple;
	bh=13F2UjCzGlGkf27zgdvP9enojemANvn1nSBX0CWsCNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRXovWrUGG/hRlHd8bT2XEm/kR8uJoE80zfxpkbdsZBWxRZ6e1nuyrwElsvc2inJjG/hbqUgxhgq4Hk3MDKRkDyksBv+eimUlz98aS9I9QMNWhfuEFsxnrDyVtCHT+9ALiiR/YSx1tAr7FG2+cZzA27jOg7mHZOwKsVXMlAhD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjDpkyGm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjDpkyGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F2A1F000E9;
	Tue, 23 Jun 2026 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782203402;
	bh=Mg0qNqQTJ3dSWWsxYnnal5FWmzkhld9zo6v+icJr2OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cjDpkyGm4RgQwNA3ygqSIkzI3Y4uuYsv6Vu+XOiwVKQb5vPsZk5wMr7ru1ab03UyB
	 4YCsQWNRlkmS+siktdNX721d0c80CyLX5AAJmsKkVb9EJrPghUHZMh7rwAzGHCAMMg
	 2zBm4ALMjezrcan6tLZ9m+S/A1/bHgSOVBhECKo9SsaVJi7x2/CbdzRUspgIZdfYs1
	 Rkpgjx52liC8Ql0VWpqxxRD9fY/VPwZRW7LCdLm36U4I1tqOcuJbgkf7glgnltL7pD
	 G+c7lCmEg2XolO0qyT0XddYH9sFdRxHvbI9PrezaPSDEDA4UYYOpU7GF/KYITgZt4D
	 93YVq2JYI4YkQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wbwW7-00000000Yka-2xyr;
	Tue, 23 Jun 2026 10:29:59 +0200
Date: Tue, 23 Jun 2026 10:29:59 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Juergen Stuber <starblue@users.sourceforge.net>,
	Yue Sun <samsun1006219@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] USB: fix use-after-free on disconnect race
Message-ID: <ajpEB3G827spY5G2@hovoldconsulting.com>
References: <20260622152612.116422-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622152612.116422-1-johan@kernel.org>

On Mon, Jun 22, 2026 at 05:26:08PM +0200, Johan Hovold wrote:
> Mutexes cannot be used to manage lifetime of objects directly as the
> mutex structure is accessed by mutex_unlock() after releasing the lock.

> Johan Hovold (4):
>   USB: iowarrior: fix use-after-free on disconnect race
>   USB: idmouse: fix use-after-free on disconnect race
>   USB: ldusb: fix use-after-free on disconnect race
>   USB: legousbtower: fix use-after-free on disconnect race

I forgot to mention that these apply on top of:

	https://lore.kernel.org/all/20260523170523.1074563-1-johan@kernel.org/
 
Johan
