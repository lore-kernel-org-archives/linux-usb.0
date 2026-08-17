Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E614AD0D;
	Mon, 17 Aug 2026 06:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949681; cv=none; b=RhPbzTUNpTdfHYub5n3CbLuN0rK722CgtkQlHtCKRmMFusDOBGtcVfl30s4m9cIP2E9Wx5TABh1FJVoG1z6VhkVVznmlDYlbOT2QKvaqkisNW5s/X4pveeId6w8pmK7VBVYoUeO1OyXhNayD/zaI4YrgWQQHDOsjo5DUKshehcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949681; c=relaxed/simple;
	bh=DyT6Mi7b/bXeuQz1Ih1clMI5VVMRA9e4bg+3uDD4+AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzbGABxNDepr0RFQwukhArshE2EGasTKv/zLyRBoLUxBgjDiAIxufnyb+cHVdSx5P8LX6r2GpTVOHyr50CjY78tslDI5SbodhlNetW0hDDgVieLrz+Falk9yPR7cbxtyVVkR37aeXApRXcNGTLcZR1JF/R0tL/YojshEDOf9cqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z/fd6VVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z/fd6VVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEE51F000E9;
	Mon, 17 Aug 2026 06:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786949680;
	bh=DyT6Mi7b/bXeuQz1Ih1clMI5VVMRA9e4bg+3uDD4+AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z/fd6VVyed3700dH3FKP7CbruAb78tF/vogpsDoo80eG9ZAuqA/btbbh9s6+uBN/m
	 vRSdgc93u9rwrMNMT7mG8Aopv7PlbjpoXtv5H0qKBjZIbd6nDqseZ2QHJO0Ny/bLmJ
	 B5yeeDtdLxFwJXxQGNUU0HkZqZT86xmmxdyH88HQ=
Date: Mon, 17 Aug 2026 08:53:04 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: =?utf-8?B?5pmP6b6Z6b6Z?= <yanlonglong@kylinos.cn>
Cc: linux-usb <linux-usb@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= usb:
 f_fs-aio-simple: add NULL checks for malloc calls
Message-ID: <2026081739-outbreak-sternum-837b@gregkh>
References: <5c4ol2f2xweh-5c4twhbnnih6@nsmail8.2--kylin--1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c4ol2f2xweh-5c4twhbnnih6@nsmail8.2--kylin--1>

On Mon, Aug 17, 2026 at 02:40:20PM +0800, 晏龙龙 wrote:
> It's userspace, why not just return an error and let the kernel clean up
> the memory automatically?
> Or better yet, just have a goto to jump to the end of the function where
> all of this code already lives?

That's what I wrote, not you?

Also, please don't send html email, or top-post.

confused,

greg k-h
