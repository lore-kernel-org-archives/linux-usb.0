Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F3274B42;
	Wed, 11 Mar 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238743; cv=none; b=h/rzSNx4rm5IXck3qlKNTWACixuMYkLiRJIIDpuRYBfAMAfQdFWA445+Zin+gDN2wH2BROUJt08E0mN1s16FD+xuz+qhUYUO3djOfRlCm46qlmv7OQWlQ/bdkbGDsE+lYN5yc33PQ858fpj8fx4eivR6zoTFIA+tgqkz97tYeDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238743; c=relaxed/simple;
	bh=/sk99tCwuu/9AUz7BoXM5pAgmalSJ1+HPib99dYb6wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOQUTfV98kp910acoizDxtbWYVtlNyFzoyUAj7p0QoF6LTe3iyKV+fkKTmPf8qLqX4HsFhvnZg0Nmv0pi/e+MFUoUufbpJRwsn/d2aTT/HJLndX+ZzMqM/gikSdiyPZqi73uWekY/9a/pDVWvIzK01HlFfNSlail64xRHvi7Zc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wf7WzOW1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wf7WzOW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3E0C4CEF7;
	Wed, 11 Mar 2026 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773238742;
	bh=/sk99tCwuu/9AUz7BoXM5pAgmalSJ1+HPib99dYb6wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wf7WzOW1lvNCBVkJss5PThkD10FmrBxezfPv9SpYCj9rP+w+zxAh62JkGxXqNXg89
	 y4IXYv90em1adWGARyISnrJKG+H96KI+JDMztX/yatM34iM06V+0gM1UFyeyPJVleL
	 iAEfOOwPTujtg+xK+qUdy+vKbV7GObzdeYpzvlhI=
Date: Wed, 11 Mar 2026 15:18:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Cc: peter.chen@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, 18291782795@163.com
Subject: Re: [PATCH] usb: chipidea: scope ci_ulpi_resume() to CONFIG_PM
Message-ID: <2026031109-hardhat-dispersed-6b5c@gregkh>
References: <20260309084523.718431-1-pengpeng.hou@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309084523.718431-1-pengpeng.hou@isrc.iscas.ac.cn>

On Mon, Mar 09, 2026 at 08:45:23AM +0000, Pengpeng Hou wrote:
> In current linux.git (1954c4f01220), ci_ulpi_resume() is defined

No need to reference the tree like this, that's not the normal way.

> and declared unconditionally. However, its only in-tree caller is within
> ci_controller_resume() in drivers/usb/chipidea/core.c, which is already
> guarded by #ifdef CONFIG_PM.
> 
> Match the helper scope to its caller by wrapping the definition in
> CONFIG_PM and providing a no-op stub in the header. This fixes the
> config-scope mismatch and avoids unnecessary code inclusion when
> power management is disabled.

How much does this actually save?  Why is only resume() needed to be
#ifdef here, not suspend?

thanks,

greg k-h
