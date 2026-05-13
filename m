Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89123101C0;
	Wed, 13 May 2026 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778653099; cv=none; b=X4LMuYiyTxmxjAfasvTg5FDU5cos+PT8q60XFSvKP6UwrGFV0FmJrbshoELchxsQ5jh3wbQfgHGiIupqAxuCw7TCXUwrvu0fHD0ueJGz1d/9yXOlZYtTeke/JoN8TwcifiEYMQXiqlmYB7GXY4fS2t+9z0aT/saXegVU8jcY7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778653099; c=relaxed/simple;
	bh=0ApxX07tZD0+t0N6jZ0DFx3i3FTS4MC7lQ9cceZbkVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBWTFjq6C7rE0hOqLx2em4Puvkyxci+YUF4zxDrzFublOGjTpCbABVd81GdpVOYbEC1YHSyvWJmF6/WmR+NIiky/AA718LOBYyG13hYpIKof/6M+24pQ8/Rpe3SPXhwKeiqJe1dmBFUP0/Dt+HWvkbpHCgJyiBdO3o/5IhgCAho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPoVr6fB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPoVr6fB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A65C2BCB7;
	Wed, 13 May 2026 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778653098;
	bh=0ApxX07tZD0+t0N6jZ0DFx3i3FTS4MC7lQ9cceZbkVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPoVr6fB0ARruqsHeURVyZdhuhGZdXczqy5dYI4Sz6A89sB5mr7CRy8wJeLMuPiv3
	 5EgU5iSa0PsvSRotU7ciXNO6iXMK4N3G3etNMbfb5zLrP3Y/KX0YtHKYWUNrUgiET9
	 mvR6G2ErzPP3cQdKgSFm2DC9/gdz8gkA/HmL/RGBD4ahtMU0VKkJ2pApzCL0Ulk6ln
	 GZxEQdKL+dCUjSj6gwn5cBh2BSdIu0n9PlMzVH+ENIF4yHkSR6UNjGfDqGTuQpQy09
	 mNLHUZ8qgSJTg85ZMFVgZDl+1N3A0ydsm2S6v1KRWZULjo6AOeClHBe+q3SHF/fxcZ
	 z6cKhTpaQZ82Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wN2v9-00000004Glu-2utK;
	Wed, 13 May 2026 08:18:15 +0200
Date: Wed, 13 May 2026 08:18:15 +0200
From: Johan Hovold <johan@kernel.org>
To: zwq2226404116@163.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] USB: serial: option: add missing RSVD(5) flag for
 Rolling RW135R-GL
Message-ID: <agQXp3nBDKx5KZS3@hovoldconsulting.com>
References: <20260513030737.391775-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513030737.391775-1-zwq2226404116@163.com>

On Wed, May 13, 2026 at 11:07:37AM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> The RW135R-GL MBIM interface entry added in commit before was missing
> the .driver_info = RSVD(5) flag.
> 
> Without this flag, the option driver binds to the MBIM interface
> and conflicts with the cdc_mbim driver, causing AT/MBIM communication
> failures after switching to 43 mode. This matches the handling of
> other Rolling Wireless MBIM devices.

Looks like you mistakenly sent the same (v1) patch again.

Johan
