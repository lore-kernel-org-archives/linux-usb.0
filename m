Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA31C2F7EF8;
	Sun, 14 Jun 2026 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781455101; cv=none; b=L4TnFmk3hKnSpxjiQ3VTaY592MOlsBMMkqnW/DIYkT9b+0SLxz81XEpnWmk6gSTL1bauticr9rQkVpyXFVzUX3GSXvoTiFxnP94FUMVmQyz+/J83EWQwIh9QOClE0HmDSnRtoCaNHGZOh5t1xfVCribqCpKE7jRT67QUCgYoNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781455101; c=relaxed/simple;
	bh=4KoLBPUOCwat8Zboy94G/pBoX3QoOORdxAYH3UQyfg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcmC8rWLuf4tIVi/UB/gnED9hRaTWpo1dcXoZ+WpNVA67tfIjwVVyiSfQRS5TJX2pXAI8yo4uMVZqIB+IMjlMXjdsR0rGBVbIVpjA7ZzSVyqX7aHPAOPiBnZNYL6YQsazrdXiLxV3DEsqOgETXHWW6kBFUfoCyigvj0h2GDH010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e/+mb4k/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e/+mb4k/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B541F1F000E9;
	Sun, 14 Jun 2026 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781455100;
	bh=wAlZPZ47rBDWwXkelJcO2z/yQEi2GwTR/GqMh2XwGPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e/+mb4k/lfdWOHRKACTwcaR5Wx8ehFysKF8utcDh5z9ZjifMdsTHHl9eq+ZIXIb6g
	 lgMcf+Uv95sChRuG6t/NM++6XhescE5C+7jkl5l6MlaLO7seBkAYnA/fk9WkIaTpBU
	 ny781j9NUNdLckS3REn7cNbzBMbdZ00bexn6MtfY=
Date: Sun, 14 Jun 2026 18:37:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-out-of-bounds in select_usb_power_delivery_show
Message-ID: <2026061444-flattered-rewrap-3d96@gregkh>
References: <178144969600.60470.6584137935143789620@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178144969600.60470.6584137935143789620@gmail.com>

On Sun, Jun 14, 2026 at 11:22:45AM -0400, Shuangpeng Bai wrote:
> Hi Kernel Maintainers,
> 
> I hit the following report while testing current upstream kernel:
> 
> KASAN: slab-out-of-bounds in select_usb_power_delivery_show
> 
> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

What about the latest tree?

> 
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/79c08ada299b3ae37b7a0af292ca413f
> 
> I'm happy to test debug patches or provide additional information.
> 
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> 
> [  102.318332] BUG: KASAN: slab-out-of-bounds in select_usb_power_delivery_show (drivers/usb/typec/class.c:1642)
> [  102.319225] Read of size 8 at addr ffff888117d2f2c0 by task cat/8378
> [  102.319943] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014

Does this happen on real hardware, or just on emulated hardware?

thanks,

greg k-h
