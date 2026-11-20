Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170120;
	b=ctvwhAugKnnrHdGHQJ+S6i5l1NfHXvMWZlPBb/9mDDWg9aeoWRKPLtwwC4ZS1eBfqxdW
	 qGlRJXmyW6oIWa6MoIQFmtDiWGTSxu3yVCaWzyI1bE4gjPrJFykaN83Ckro26ius48VCB
	 Ku7QK1c81XtgH7z9NpSqF5mAbTmkkp+Mn4HmTM+zEHEykuNfQvkMztwcCX5+gruw2QDvr
	 Pf9BIIJ/rpJB7YL9YHQbw/LyZZJU9ZdbOvG/WC2R4yZ/6yCqdIW5BHGwKyK6CUCFMNyJc
	 XsyPfNZbg2QQithK8z0X2qHuyRWuuiyGfc5zET3wuUCT9snfwqyQaX1nOHcLfKdszdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170120;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=U9ijT4p30P8TukBivvOS9kjU8VeyU0+ANT4i5AUKkoM=;
	b=nks+pVLOQnijffbaLk7F1bhGIN1gb6Gn4m/c2Zo+5/PO9QUH/cGiDXBUFecZhxkE7rmS
	 IGOHcf4/4KIBNkQe2Em8b5fVD7T1+3frFuebNxgl1rwab361L8vp+AKAbxv/f7+i9j03d
	 n4zZT5hfxrrlUT+f5BHHFB2ubZDRQBFQubsILukHsTELvkPZ8tvNcPwkGT2Vh6R69ZoHL
	 q1C5+dVn/VaB17V+6kWB8UISK3euNtVna8o2JxH8UTxY/eqFcjVpJKLdtByUga/IhRnC/
	 yA/GsAkU+Newn2QpOEZQh5hAZh25IyzCw2+2XDlwAwFEqpOdrOyVVXtRkogj8g9/2lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cQ3I8Ub3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797EB606A320;
	Fri, 20 Nov 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cQ3I8Ub3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB2B1F000C6;
	Fri, 20 Nov 2026 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795170120;
	bh=U9ijT4p30P8TukBivvOS9kjU8VeyU0+ANT4i5AUKkoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQ3I8Ub3Nc24UbbR7NrIo1b2cOHqTmbwgBfT+UiY1ObmYOUvzlWO+MtsVNJ6ee5gc
	 VmVCcf26YQMZH5jIEm1KAPpYzGcXcmJfZx0kZlnEO3JFRkvLpgJAaJHXEG1SEVCYxK
	 kQF7IwK0dfsaE4k07umieObecHmAXrW36X6iLLvg=
Date: Fri, 20 Nov 2026 11:21:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	fanggeng <fanggeng@lixiang.com>, Mateusz Guzik <mjguzik@gmail.com>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Init reset_work at alloc to avoid
 kill_sb WARN
Message-ID: <2026112025-linguist-refusing-439b@gregkh>
References: <20260725120838.2263579-1-megi@xff.cz>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260725120838.2263579-1-megi@xff.cz>

On Sat, Jul 25, 2026 at 02:08:34PM +0200, Ondřej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> ffs_data is zero-allocated and reset_work is only INIT_WORK'd on the
> FFS_DEACTIVATED path in set_alt/disable, which the normal flow never
> takes. ffs_fs_kill_sb() then cancel_work_sync()s it unconditionally,
> tripping the WARN_ON(!work->func) in __flush_work() with a NULL func.

How does that happen?  What triggers it?

> 
> Initialize reset_work once in ffs_data_new() and drop the redundant
> lazy INIT_WORK calls.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>

No fixes tag?  No cc: stable?

What found this issue?  How was it tested?

thanks,

greg k-h
